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

FOUNDATION_EXPORT NSString *const AWSElasticbeanstalkErrorDomain;

typedef NS_ENUM(NSInteger, AWSElasticbeanstalkErrorType) {
    AWSElasticbeanstalkErrorUnknown,
    AWSElasticbeanstalkErrorCodeBuildNotInServiceRegion,
    AWSElasticbeanstalkErrorElasticBeanstalkService,
    AWSElasticbeanstalkErrorInsufficientPrivileges,
    AWSElasticbeanstalkErrorInvalidRequest,
    AWSElasticbeanstalkErrorManagedActionInvalidState,
    AWSElasticbeanstalkErrorOperationInProgress,
    AWSElasticbeanstalkErrorPlatformVersionStillReferenced,
    AWSElasticbeanstalkErrorResourceNotFound,
    AWSElasticbeanstalkErrorResourceTypeNotSupported,
    AWSElasticbeanstalkErrorS3LocationNotInServiceRegion,
    AWSElasticbeanstalkErrorS3SubscriptionRequired,
    AWSElasticbeanstalkErrorSourceBundleDeletion,
    AWSElasticbeanstalkErrorTooManyApplicationVersions,
    AWSElasticbeanstalkErrorTooManyApplications,
    AWSElasticbeanstalkErrorTooManyBuckets,
    AWSElasticbeanstalkErrorTooManyConfigurationTemplates,
    AWSElasticbeanstalkErrorTooManyEnvironments,
    AWSElasticbeanstalkErrorTooManyPlatforms,
    AWSElasticbeanstalkErrorTooManyTags,
};

typedef NS_ENUM(NSInteger, AWSElasticbeanstalkActionHistoryStatus) {
    AWSElasticbeanstalkActionHistoryStatusUnknown,
    AWSElasticbeanstalkActionHistoryStatusCompleted,
    AWSElasticbeanstalkActionHistoryStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSElasticbeanstalkActionStatus) {
    AWSElasticbeanstalkActionStatusUnknown,
    AWSElasticbeanstalkActionStatusScheduled,
    AWSElasticbeanstalkActionStatusPending,
    AWSElasticbeanstalkActionStatusRunning,
};

typedef NS_ENUM(NSInteger, AWSElasticbeanstalkActionType) {
    AWSElasticbeanstalkActionTypeUnknown,
    AWSElasticbeanstalkActionTypeInstanceRefresh,
    AWSElasticbeanstalkActionTypePlatformUpdate,
};

typedef NS_ENUM(NSInteger, AWSElasticbeanstalkApplicationVersionStatus) {
    AWSElasticbeanstalkApplicationVersionStatusUnknown,
    AWSElasticbeanstalkApplicationVersionStatusProcessed,
    AWSElasticbeanstalkApplicationVersionStatusUnprocessed,
    AWSElasticbeanstalkApplicationVersionStatusFailed,
    AWSElasticbeanstalkApplicationVersionStatusProcessing,
    AWSElasticbeanstalkApplicationVersionStatusBuilding,
};

typedef NS_ENUM(NSInteger, AWSElasticbeanstalkComputeType) {
    AWSElasticbeanstalkComputeTypeUnknown,
    AWSElasticbeanstalkComputeTypeBuildGeneral1Small,
    AWSElasticbeanstalkComputeTypeBuildGeneral1Medium,
    AWSElasticbeanstalkComputeTypeBuildGeneral1Large,
};

typedef NS_ENUM(NSInteger, AWSElasticbeanstalkConfigurationDeploymentStatus) {
    AWSElasticbeanstalkConfigurationDeploymentStatusUnknown,
    AWSElasticbeanstalkConfigurationDeploymentStatusDeployed,
    AWSElasticbeanstalkConfigurationDeploymentStatusPending,
    AWSElasticbeanstalkConfigurationDeploymentStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSElasticbeanstalkConfigurationOptionValueType) {
    AWSElasticbeanstalkConfigurationOptionValueTypeUnknown,
    AWSElasticbeanstalkConfigurationOptionValueTypeScalar,
    AWSElasticbeanstalkConfigurationOptionValueTypeList,
};

typedef NS_ENUM(NSInteger, AWSElasticbeanstalkEnvironmentHealth) {
    AWSElasticbeanstalkEnvironmentHealthUnknown,
    AWSElasticbeanstalkEnvironmentHealthGreen,
    AWSElasticbeanstalkEnvironmentHealthYellow,
    AWSElasticbeanstalkEnvironmentHealthRed,
    AWSElasticbeanstalkEnvironmentHealthGrey,
};

typedef NS_ENUM(NSInteger, AWSElasticbeanstalkEnvironmentHealthAttribute) {
    AWSElasticbeanstalkEnvironmentHealthAttributeUnknown,
    AWSElasticbeanstalkEnvironmentHealthAttributeStatus,
    AWSElasticbeanstalkEnvironmentHealthAttributeColor,
    AWSElasticbeanstalkEnvironmentHealthAttributeCauses,
    AWSElasticbeanstalkEnvironmentHealthAttributeApplicationMetrics,
    AWSElasticbeanstalkEnvironmentHealthAttributeInstancesHealth,
    AWSElasticbeanstalkEnvironmentHealthAttributeAll,
    AWSElasticbeanstalkEnvironmentHealthAttributeHealthStatus,
    AWSElasticbeanstalkEnvironmentHealthAttributeRefreshedAt,
};

typedef NS_ENUM(NSInteger, AWSElasticbeanstalkEnvironmentHealthStatus) {
    AWSElasticbeanstalkEnvironmentHealthStatusUnknown,
    AWSElasticbeanstalkEnvironmentHealthStatusNoData,
    AWSElasticbeanstalkEnvironmentHealthStatusPending,
    AWSElasticbeanstalkEnvironmentHealthStatusOK,
    AWSElasticbeanstalkEnvironmentHealthStatusInfo,
    AWSElasticbeanstalkEnvironmentHealthStatusWarning,
    AWSElasticbeanstalkEnvironmentHealthStatusDegraded,
    AWSElasticbeanstalkEnvironmentHealthStatusSevere,
    AWSElasticbeanstalkEnvironmentHealthStatusSuspended,
};

typedef NS_ENUM(NSInteger, AWSElasticbeanstalkEnvironmentInfoType) {
    AWSElasticbeanstalkEnvironmentInfoTypeUnknown,
    AWSElasticbeanstalkEnvironmentInfoTypeTail,
    AWSElasticbeanstalkEnvironmentInfoTypeBundle,
};

typedef NS_ENUM(NSInteger, AWSElasticbeanstalkEnvironmentStatus) {
    AWSElasticbeanstalkEnvironmentStatusUnknown,
    AWSElasticbeanstalkEnvironmentStatusLaunching,
    AWSElasticbeanstalkEnvironmentStatusUpdating,
    AWSElasticbeanstalkEnvironmentStatusReady,
    AWSElasticbeanstalkEnvironmentStatusTerminating,
    AWSElasticbeanstalkEnvironmentStatusTerminated,
};

typedef NS_ENUM(NSInteger, AWSElasticbeanstalkEventSeverity) {
    AWSElasticbeanstalkEventSeverityUnknown,
    AWSElasticbeanstalkEventSeverityTrace,
    AWSElasticbeanstalkEventSeverityDebug,
    AWSElasticbeanstalkEventSeverityInfo,
    AWSElasticbeanstalkEventSeverityWarn,
    AWSElasticbeanstalkEventSeverityError,
    AWSElasticbeanstalkEventSeverityFatal,
};

typedef NS_ENUM(NSInteger, AWSElasticbeanstalkFailureType) {
    AWSElasticbeanstalkFailureTypeUnknown,
    AWSElasticbeanstalkFailureTypeUpdateCancelled,
    AWSElasticbeanstalkFailureTypeCancellationFailed,
    AWSElasticbeanstalkFailureTypeRollbackFailed,
    AWSElasticbeanstalkFailureTypeRollbackSuccessful,
    AWSElasticbeanstalkFailureTypeInternalFailure,
    AWSElasticbeanstalkFailureTypeInvalidEnvironmentState,
    AWSElasticbeanstalkFailureTypePermissionsError,
};

typedef NS_ENUM(NSInteger, AWSElasticbeanstalkInstancesHealthAttribute) {
    AWSElasticbeanstalkInstancesHealthAttributeUnknown,
    AWSElasticbeanstalkInstancesHealthAttributeHealthStatus,
    AWSElasticbeanstalkInstancesHealthAttributeColor,
    AWSElasticbeanstalkInstancesHealthAttributeCauses,
    AWSElasticbeanstalkInstancesHealthAttributeApplicationMetrics,
    AWSElasticbeanstalkInstancesHealthAttributeRefreshedAt,
    AWSElasticbeanstalkInstancesHealthAttributeLaunchedAt,
    AWSElasticbeanstalkInstancesHealthAttributeSystem,
    AWSElasticbeanstalkInstancesHealthAttributeDeployment,
    AWSElasticbeanstalkInstancesHealthAttributeAvailabilityZone,
    AWSElasticbeanstalkInstancesHealthAttributeInstanceType,
    AWSElasticbeanstalkInstancesHealthAttributeAll,
};

typedef NS_ENUM(NSInteger, AWSElasticbeanstalkPlatformStatus) {
    AWSElasticbeanstalkPlatformStatusUnknown,
    AWSElasticbeanstalkPlatformStatusCreating,
    AWSElasticbeanstalkPlatformStatusFailed,
    AWSElasticbeanstalkPlatformStatusReady,
    AWSElasticbeanstalkPlatformStatusDeleting,
    AWSElasticbeanstalkPlatformStatusDeleted,
};

typedef NS_ENUM(NSInteger, AWSElasticbeanstalkSourceRepository) {
    AWSElasticbeanstalkSourceRepositoryUnknown,
    AWSElasticbeanstalkSourceRepositoryCodeCommit,
    AWSElasticbeanstalkSourceRepositoryS3,
};

typedef NS_ENUM(NSInteger, AWSElasticbeanstalkSourceType) {
    AWSElasticbeanstalkSourceTypeUnknown,
    AWSElasticbeanstalkSourceTypeGit,
    AWSElasticbeanstalkSourceTypeZip,
};

typedef NS_ENUM(NSInteger, AWSElasticbeanstalkValidationSeverity) {
    AWSElasticbeanstalkValidationSeverityUnknown,
    AWSElasticbeanstalkValidationSeverityError,
    AWSElasticbeanstalkValidationSeverityWarning,
};

@class AWSElasticbeanstalkAbortEnvironmentUpdateMessage;
@class AWSElasticbeanstalkApplicationDescription;
@class AWSElasticbeanstalkApplicationDescriptionMessage;
@class AWSElasticbeanstalkApplicationDescriptionsMessage;
@class AWSElasticbeanstalkApplicationMetrics;
@class AWSElasticbeanstalkApplicationResourceLifecycleConfig;
@class AWSElasticbeanstalkApplicationResourceLifecycleDescriptionMessage;
@class AWSElasticbeanstalkApplicationVersionDescription;
@class AWSElasticbeanstalkApplicationVersionDescriptionMessage;
@class AWSElasticbeanstalkApplicationVersionDescriptionsMessage;
@class AWSElasticbeanstalkApplicationVersionLifecycleConfig;
@class AWSElasticbeanstalkApplyEnvironmentManagedActionRequest;
@class AWSElasticbeanstalkApplyEnvironmentManagedActionResult;
@class AWSElasticbeanstalkAssociateEnvironmentOperationsRoleMessage;
@class AWSElasticbeanstalkAutoScalingGroup;
@class AWSElasticbeanstalkBuildConfiguration;
@class AWSElasticbeanstalkBuilder;
@class AWSElasticbeanstalkCPUUtilization;
@class AWSElasticbeanstalkCheckDNSAvailabilityMessage;
@class AWSElasticbeanstalkCheckDNSAvailabilityResultMessage;
@class AWSElasticbeanstalkComposeEnvironmentsMessage;
@class AWSElasticbeanstalkConfigurationOptionDescription;
@class AWSElasticbeanstalkConfigurationOptionSetting;
@class AWSElasticbeanstalkConfigurationOptionsDescription;
@class AWSElasticbeanstalkConfigurationSettingsDescription;
@class AWSElasticbeanstalkConfigurationSettingsDescriptions;
@class AWSElasticbeanstalkConfigurationSettingsValidationMessages;
@class AWSElasticbeanstalkCreateApplicationMessage;
@class AWSElasticbeanstalkCreateApplicationVersionMessage;
@class AWSElasticbeanstalkCreateConfigurationTemplateMessage;
@class AWSElasticbeanstalkCreateEnvironmentMessage;
@class AWSElasticbeanstalkCreatePlatformVersionRequest;
@class AWSElasticbeanstalkCreatePlatformVersionResult;
@class AWSElasticbeanstalkCreateStorageLocationResultMessage;
@class AWSElasticbeanstalkCustomAmi;
@class AWSElasticbeanstalkDeleteApplicationMessage;
@class AWSElasticbeanstalkDeleteApplicationVersionMessage;
@class AWSElasticbeanstalkDeleteConfigurationTemplateMessage;
@class AWSElasticbeanstalkDeleteEnvironmentConfigurationMessage;
@class AWSElasticbeanstalkDeletePlatformVersionRequest;
@class AWSElasticbeanstalkDeletePlatformVersionResult;
@class AWSElasticbeanstalkDeployment;
@class AWSElasticbeanstalkDescribeAccountAttributesResult;
@class AWSElasticbeanstalkDescribeApplicationVersionsMessage;
@class AWSElasticbeanstalkDescribeApplicationsMessage;
@class AWSElasticbeanstalkDescribeConfigurationOptionsMessage;
@class AWSElasticbeanstalkDescribeConfigurationSettingsMessage;
@class AWSElasticbeanstalkDescribeEnvironmentHealthRequest;
@class AWSElasticbeanstalkDescribeEnvironmentHealthResult;
@class AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryRequest;
@class AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryResult;
@class AWSElasticbeanstalkDescribeEnvironmentManagedActionsRequest;
@class AWSElasticbeanstalkDescribeEnvironmentManagedActionsResult;
@class AWSElasticbeanstalkDescribeEnvironmentResourcesMessage;
@class AWSElasticbeanstalkDescribeEnvironmentsMessage;
@class AWSElasticbeanstalkDescribeEventsMessage;
@class AWSElasticbeanstalkDescribeInstancesHealthRequest;
@class AWSElasticbeanstalkDescribeInstancesHealthResult;
@class AWSElasticbeanstalkDescribePlatformVersionRequest;
@class AWSElasticbeanstalkDescribePlatformVersionResult;
@class AWSElasticbeanstalkDisassociateEnvironmentOperationsRoleMessage;
@class AWSElasticbeanstalkEnvironmentDescription;
@class AWSElasticbeanstalkEnvironmentDescriptionsMessage;
@class AWSElasticbeanstalkEnvironmentInfoDescription;
@class AWSElasticbeanstalkEnvironmentLink;
@class AWSElasticbeanstalkEnvironmentResourceDescription;
@class AWSElasticbeanstalkEnvironmentResourceDescriptionsMessage;
@class AWSElasticbeanstalkEnvironmentResourcesDescription;
@class AWSElasticbeanstalkEnvironmentTier;
@class AWSElasticbeanstalkEventDescription;
@class AWSElasticbeanstalkEventDescriptionsMessage;
@class AWSElasticbeanstalkInstance;
@class AWSElasticbeanstalkInstanceHealthSummary;
@class AWSElasticbeanstalkLatency;
@class AWSElasticbeanstalkLaunchConfiguration;
@class AWSElasticbeanstalkLaunchTemplate;
@class AWSElasticbeanstalkListAvailableSolutionStacksResultMessage;
@class AWSElasticbeanstalkListPlatformBranchesRequest;
@class AWSElasticbeanstalkListPlatformBranchesResult;
@class AWSElasticbeanstalkListPlatformVersionsRequest;
@class AWSElasticbeanstalkListPlatformVersionsResult;
@class AWSElasticbeanstalkListTagsForResourceMessage;
@class AWSElasticbeanstalkListener;
@class AWSElasticbeanstalkLoadBalancer;
@class AWSElasticbeanstalkLoadBalancerDescription;
@class AWSElasticbeanstalkManagedAction;
@class AWSElasticbeanstalkManagedActionHistoryItem;
@class AWSElasticbeanstalkMaxAgeRule;
@class AWSElasticbeanstalkMaxCountRule;
@class AWSElasticbeanstalkOptionRestrictionRegex;
@class AWSElasticbeanstalkOptionSpecification;
@class AWSElasticbeanstalkPlatformBranchSummary;
@class AWSElasticbeanstalkPlatformDescription;
@class AWSElasticbeanstalkPlatformFilter;
@class AWSElasticbeanstalkPlatformFramework;
@class AWSElasticbeanstalkPlatformProgrammingLanguage;
@class AWSElasticbeanstalkPlatformSummary;
@class AWSElasticbeanstalkQueue;
@class AWSElasticbeanstalkRebuildEnvironmentMessage;
@class AWSElasticbeanstalkRequestEnvironmentInfoMessage;
@class AWSElasticbeanstalkResourceQuota;
@class AWSElasticbeanstalkResourceQuotas;
@class AWSElasticbeanstalkResourceTagsDescriptionMessage;
@class AWSElasticbeanstalkRestartAppServerMessage;
@class AWSElasticbeanstalkRetrieveEnvironmentInfoMessage;
@class AWSElasticbeanstalkRetrieveEnvironmentInfoResultMessage;
@class AWSElasticbeanstalkS3Location;
@class AWSElasticbeanstalkSearchFilter;
@class AWSElasticbeanstalkSingleInstanceHealth;
@class AWSElasticbeanstalkSolutionStackDescription;
@class AWSElasticbeanstalkSourceBuildInformation;
@class AWSElasticbeanstalkSourceConfiguration;
@class AWSElasticbeanstalkStatusCodes;
@class AWSElasticbeanstalkSwapEnvironmentCNAMEsMessage;
@class AWSElasticbeanstalkSystemStatus;
@class AWSElasticbeanstalkTag;
@class AWSElasticbeanstalkTerminateEnvironmentMessage;
@class AWSElasticbeanstalkTrigger;
@class AWSElasticbeanstalkUpdateApplicationMessage;
@class AWSElasticbeanstalkUpdateApplicationResourceLifecycleMessage;
@class AWSElasticbeanstalkUpdateApplicationVersionMessage;
@class AWSElasticbeanstalkUpdateConfigurationTemplateMessage;
@class AWSElasticbeanstalkUpdateEnvironmentMessage;
@class AWSElasticbeanstalkUpdateTagsForResourceMessage;
@class AWSElasticbeanstalkValidateConfigurationSettingsMessage;
@class AWSElasticbeanstalkValidationMessage;

/**
 <p/>
 */
@interface AWSElasticbeanstalkAbortEnvironmentUpdateMessage : AWSRequest


/**
 <p>This specifies the ID of the environment with the in-progress update that you want to cancel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentId;

/**
 <p>This specifies the name of the environment with the in-progress update that you want to cancel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

@end

/**
 <p>Describes the properties of an application.</p>
 */
@interface AWSElasticbeanstalkApplicationDescription : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationArn;

/**
 <p>The name of the application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>The names of the configuration templates associated with this application.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable configurationTemplates;

/**
 <p>The date when the application was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable dateCreated;

/**
 <p>The date when the application was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable dateUpdated;

/**
 <p>User-defined description of the application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The lifecycle settings for the application.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkApplicationResourceLifecycleConfig * _Nullable resourceLifecycleConfig;

/**
 <p>The names of the versions for this application.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable versions;

@end

/**
 <p>Result message containing a single description of an application.</p>
 */
@interface AWSElasticbeanstalkApplicationDescriptionMessage : AWSModel


/**
 <p> The <a>ApplicationDescription</a> of the application. </p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkApplicationDescription * _Nullable application;

@end

/**
 <p>Result message containing a list of application descriptions.</p>
 */
@interface AWSElasticbeanstalkApplicationDescriptionsMessage : AWSModel


/**
 <p>This parameter contains a list of <a>ApplicationDescription</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkApplicationDescription *> * _Nullable applications;

@end

/**
 <p>Application request metrics for an AWS Elastic Beanstalk environment.</p>
 */
@interface AWSElasticbeanstalkApplicationMetrics : AWSModel


/**
 <p>The amount of time that the metrics cover (usually 10 seconds). For example, you might have 5 requests (<code>request_count</code>) within the most recent time slice of 10 seconds (<code>duration</code>).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 <p>Represents the average latency for the slowest X percent of requests over the last 10 seconds. Latencies are in seconds with one millisecond resolution.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkLatency * _Nullable latency;

/**
 <p>Average number of requests handled by the web server per second over the last 10 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requestCount;

/**
 <p>Represents the percentage of requests over the last 10 seconds that resulted in each type of status code response.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkStatusCodes * _Nullable statusCodes;

@end

/**
 <p>The resource lifecycle configuration for an application. Defines lifecycle settings for resources that belong to the application, and the service role that AWS Elastic Beanstalk assumes in order to apply lifecycle settings. The version lifecycle configuration defines lifecycle settings for application versions.</p>
 */
@interface AWSElasticbeanstalkApplicationResourceLifecycleConfig : AWSModel


/**
 <p>The ARN of an IAM service role that Elastic Beanstalk has permission to assume.</p><p>The <code>ServiceRole</code> property is required the first time that you provide a <code>VersionLifecycleConfig</code> for the application in one of the supporting calls (<code>CreateApplication</code> or <code>UpdateApplicationResourceLifecycle</code>). After you provide it once, in either one of the calls, Elastic Beanstalk persists the Service Role with the application, and you don't need to specify it again in subsequent <code>UpdateApplicationResourceLifecycle</code> calls. You can, however, specify it in subsequent calls to change the Service Role to another value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRole;

/**
 <p>Defines lifecycle settings for application versions.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkApplicationVersionLifecycleConfig * _Nullable versionLifecycleConfig;

@end

/**
 
 */
@interface AWSElasticbeanstalkApplicationResourceLifecycleDescriptionMessage : AWSModel


/**
 <p>The name of the application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>The lifecycle configuration.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkApplicationResourceLifecycleConfig * _Nullable resourceLifecycleConfig;

@end

/**
 <p>Describes the properties of an application version.</p>
 */
@interface AWSElasticbeanstalkApplicationVersionDescription : AWSModel


/**
 <p>The name of the application to which the application version belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>The Amazon Resource Name (ARN) of the application version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationVersionArn;

/**
 <p>Reference to the artifact from the AWS CodeBuild build.</p>
 */
@property (nonatomic, strong) NSString * _Nullable buildArn;

/**
 <p>The creation date of the application version.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable dateCreated;

/**
 <p>The last modified date of the application version.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable dateUpdated;

/**
 <p>The description of the application version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>If the version's source code was retrieved from AWS CodeCommit, the location of the source code for the application version.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkSourceBuildInformation * _Nullable sourceBuildInformation;

/**
 <p>The storage location of the application version's source bundle in Amazon S3.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkS3Location * _Nullable sourceBundle;

/**
 <p>The processing status of the application version. Reflects the state of the application version during its creation. Many of the values are only applicable if you specified <code>True</code> for the <code>Process</code> parameter of the <code>CreateApplicationVersion</code> action. The following list describes the possible values.</p><ul><li><p><code>Unprocessed</code> – Application version wasn't pre-processed or validated. Elastic Beanstalk will validate configuration files during deployment of the application version to an environment.</p></li><li><p><code>Processing</code> – Elastic Beanstalk is currently processing the application version.</p></li><li><p><code>Building</code> – Application version is currently undergoing an AWS CodeBuild build.</p></li><li><p><code>Processed</code> – Elastic Beanstalk was successfully pre-processed and validated.</p></li><li><p><code>Failed</code> – Either the AWS CodeBuild build failed or configuration files didn't pass validation. This application version isn't usable.</p></li></ul>
 */
@property (nonatomic, assign) AWSElasticbeanstalkApplicationVersionStatus status;

/**
 <p>A unique identifier for the application version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionLabel;

@end

/**
 <p>Result message wrapping a single description of an application version.</p>
 */
@interface AWSElasticbeanstalkApplicationVersionDescriptionMessage : AWSModel


/**
 <p> The <a>ApplicationVersionDescription</a> of the application version. </p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkApplicationVersionDescription * _Nullable applicationVersion;

@end

/**
 <p>Result message wrapping a list of application version descriptions.</p>
 */
@interface AWSElasticbeanstalkApplicationVersionDescriptionsMessage : AWSModel


/**
 <p>List of <code>ApplicationVersionDescription</code> objects sorted in order of creation.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkApplicationVersionDescription *> * _Nullable applicationVersions;

/**
 <p>In a paginated request, the token that you can pass in a subsequent request to get the next response page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>The application version lifecycle settings for an application. Defines the rules that Elastic Beanstalk applies to an application's versions in order to avoid hitting the per-region limit for application versions.</p><p>When Elastic Beanstalk deletes an application version from its database, you can no longer deploy that version to an environment. The source bundle remains in S3 unless you configure the rule to delete it.</p>
 */
@interface AWSElasticbeanstalkApplicationVersionLifecycleConfig : AWSModel


/**
 <p>Specify a max age rule to restrict the length of time that application versions are retained for an application.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkMaxAgeRule * _Nullable maxAgeRule;

/**
 <p>Specify a max count rule to restrict the number of application versions that are retained for an application.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkMaxCountRule * _Nullable maxCountRule;

@end

/**
 <p>Request to execute a scheduled managed action immediately.</p>
 Required parameters: [ActionId]
 */
@interface AWSElasticbeanstalkApplyEnvironmentManagedActionRequest : AWSRequest


/**
 <p>The action ID of the scheduled managed action to execute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionId;

/**
 <p>The environment ID of the target environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentId;

/**
 <p>The name of the target environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

@end

/**
 <p>The result message containing information about the managed action.</p>
 */
@interface AWSElasticbeanstalkApplyEnvironmentManagedActionResult : AWSModel


/**
 <p>A description of the managed action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionDescription;

/**
 <p>The action ID of the managed action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionId;

/**
 <p>The type of managed action.</p>
 */
@property (nonatomic, assign) AWSElasticbeanstalkActionType actionType;

/**
 <p>The status of the managed action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Request to add or change the operations role used by an environment.</p>
 Required parameters: [EnvironmentName, OperationsRole]
 */
@interface AWSElasticbeanstalkAssociateEnvironmentOperationsRoleMessage : AWSRequest


/**
 <p>The name of the environment to which to set the operations role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

/**
 <p>The Amazon Resource Name (ARN) of an existing IAM role to be used as the environment's operations role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationsRole;

@end

/**
 <p>Describes an Auto Scaling launch configuration.</p>
 */
@interface AWSElasticbeanstalkAutoScalingGroup : AWSModel


/**
 <p>The name of the <code>AutoScalingGroup</code> . </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Settings for an AWS CodeBuild build.</p>
 Required parameters: [CodeBuildServiceRole, Image]
 */
@interface AWSElasticbeanstalkBuildConfiguration : AWSModel


/**
 <p>The name of the artifact of the CodeBuild build. If provided, Elastic Beanstalk stores the build artifact in the S3 location <i>S3-bucket</i>/resources/<i>application-name</i>/codebuild/codebuild-<i>version-label</i>-<i>artifact-name</i>.zip. If not provided, Elastic Beanstalk stores the build artifact in the S3 location <i>S3-bucket</i>/resources/<i>application-name</i>/codebuild/codebuild-<i>version-label</i>.zip. </p>
 */
@property (nonatomic, strong) NSString * _Nullable artifactName;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that enables AWS CodeBuild to interact with dependent AWS services on behalf of the AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeBuildServiceRole;

/**
 <p>Information about the compute resources the build project will use.</p><ul><li><p><code>BUILD_GENERAL1_SMALL: Use up to 3 GB memory and 2 vCPUs for builds</code></p></li><li><p><code>BUILD_GENERAL1_MEDIUM: Use up to 7 GB memory and 4 vCPUs for builds</code></p></li><li><p><code>BUILD_GENERAL1_LARGE: Use up to 15 GB memory and 8 vCPUs for builds</code></p></li></ul>
 */
@property (nonatomic, assign) AWSElasticbeanstalkComputeType computeType;

/**
 <p>The ID of the Docker image to use for this build project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable image;

/**
 <p>How long in minutes, from 5 to 480 (8 hours), for AWS CodeBuild to wait until timing out any related build that does not get marked as completed. The default is 60 minutes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutInMinutes;

@end

/**
 <p>The builder used to build the custom platform.</p>
 */
@interface AWSElasticbeanstalkBuilder : AWSModel


/**
 <p>The ARN of the builder.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

@end

/**
 <p>CPU utilization metrics for an instance.</p>
 */
@interface AWSElasticbeanstalkCPUUtilization : AWSModel


/**
 <p>Available on Linux environments only.</p><p>Percentage of time that the CPU has spent in the <code>I/O Wait</code> state over the last 10 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable IOWait;

/**
 <p>Available on Linux environments only.</p><p>Percentage of time that the CPU has spent in the <code>IRQ</code> state over the last 10 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable IRQ;

/**
 <p>Percentage of time that the CPU has spent in the <code>Idle</code> state over the last 10 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable idle;

/**
 <p>Available on Linux environments only.</p><p>Percentage of time that the CPU has spent in the <code>Nice</code> state over the last 10 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable nice;

/**
 <p>Available on Windows environments only.</p><p>Percentage of time that the CPU has spent in the <code>Privileged</code> state over the last 10 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable privileged;

/**
 <p>Available on Linux environments only.</p><p>Percentage of time that the CPU has spent in the <code>SoftIRQ</code> state over the last 10 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable softIRQ;

/**
 <p>Available on Linux environments only.</p><p>Percentage of time that the CPU has spent in the <code>System</code> state over the last 10 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable system;

/**
 <p>Percentage of time that the CPU has spent in the <code>User</code> state over the last 10 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable user;

@end

/**
 <p>Results message indicating whether a CNAME is available.</p>
 Required parameters: [CNAMEPrefix]
 */
@interface AWSElasticbeanstalkCheckDNSAvailabilityMessage : AWSRequest


/**
 <p>The prefix used when this CNAME is reserved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable CNAMEPrefix;

@end

/**
 <p>Indicates if the specified CNAME is available.</p>
 */
@interface AWSElasticbeanstalkCheckDNSAvailabilityResultMessage : AWSModel


/**
 <p>Indicates if the specified CNAME is available:</p><ul><li><p><code>true</code> : The CNAME is available.</p></li><li><p><code>false</code> : The CNAME is not available.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable available;

/**
 <p>The fully qualified CNAME to reserve when <a>CreateEnvironment</a> is called with the provided prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fullyQualifiedCNAME;

@end

/**
 <p>Request to create or update a group of environments.</p>
 */
@interface AWSElasticbeanstalkComposeEnvironmentsMessage : AWSRequest


/**
 <p>The name of the application to which the specified source bundles belong.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>The name of the group to which the target environments belong. Specify a group name only if the environment name defined in each target environment's manifest ends with a + (plus) character. See <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-cfg-manifest.html">Environment Manifest (env.yaml)</a> for details.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>A list of version labels, specifying one or more application source bundles that belong to the target application. Each source bundle must include an environment manifest that specifies the name of the environment and the name of the solution stack to use, and optionally can specify environment links to create.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable versionLabels;

@end

/**
 <p>Describes the possible values for a configuration option.</p>
 */
@interface AWSElasticbeanstalkConfigurationOptionDescription : AWSModel


/**
 <p>An indication of which action is required if the value for this configuration option changes:</p><ul><li><p><code>NoInterruption</code> : There is no interruption to the environment or application availability.</p></li><li><p><code>RestartEnvironment</code> : The environment is entirely restarted, all AWS resources are deleted and recreated, and the environment is unavailable during the process.</p></li><li><p><code>RestartApplicationServer</code> : The environment is available the entire time. However, a short application outage occurs when the application servers on the running Amazon EC2 instances are restarted.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable changeSeverity;

/**
 <p>The default value for this configuration option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultValue;

/**
 <p>If specified, the configuration option must be a string value no longer than this value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxLength;

/**
 <p>If specified, the configuration option must be a numeric value less than this value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxValue;

/**
 <p>If specified, the configuration option must be a numeric value greater than this value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minValue;

/**
 <p>The name of the configuration option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A unique namespace identifying the option's associated AWS resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>If specified, the configuration option must be a string value that satisfies this regular expression.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkOptionRestrictionRegex * _Nullable regex;

/**
 <p>An indication of whether the user defined this configuration option:</p><ul><li><p><code>true</code> : This configuration option was defined by the user. It is a valid choice for specifying if this as an <code>Option to Remove</code> when updating configuration settings. </p></li><li><p><code>false</code> : This configuration was not defined by the user.</p></li></ul><p> Constraint: You can remove only <code>UserDefined</code> options from a configuration. </p><p> Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable userDefined;

/**
 <p>If specified, values for the configuration option are selected from this list.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable valueOptions;

/**
 <p>An indication of which type of values this option has and whether it is allowable to select one or more than one of the possible values:</p><ul><li><p><code>Scalar</code> : Values for this option are a single selection from the possible values, or an unformatted string, or numeric value governed by the <code>MIN/MAX/Regex</code> constraints.</p></li><li><p><code>List</code> : Values for this option are multiple selections from the possible values.</p></li><li><p><code>Boolean</code> : Values for this option are either <code>true</code> or <code>false</code> .</p></li><li><p><code>Json</code> : Values for this option are a JSON representation of a <code>ConfigDocument</code>.</p></li></ul>
 */
@property (nonatomic, assign) AWSElasticbeanstalkConfigurationOptionValueType valueType;

@end

/**
 <p>A specification identifying an individual configuration option along with its current value. For a list of possible namespaces and option values, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options.html">Option Values</a> in the <i>AWS Elastic Beanstalk Developer Guide</i>. </p>
 */
@interface AWSElasticbeanstalkConfigurationOptionSetting : AWSModel


/**
 <p>A unique namespace that identifies the option's associated AWS resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>The name of the configuration option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionName;

/**
 <p>A unique resource name for the option setting. Use it for a time–based scaling configuration option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceName;

/**
 <p>The current value for the configuration option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Describes the settings for a specified configuration set.</p>
 */
@interface AWSElasticbeanstalkConfigurationOptionsDescription : AWSModel


/**
 <p> A list of <a>ConfigurationOptionDescription</a>. </p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkConfigurationOptionDescription *> * _Nullable options;

/**
 <p>The ARN of the platform version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformArn;

/**
 <p>The name of the solution stack these configuration options belong to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionStackName;

@end

/**
 <p>Describes the settings for a configuration set.</p>
 */
@interface AWSElasticbeanstalkConfigurationSettingsDescription : AWSModel


/**
 <p>The name of the application associated with this configuration set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>The date (in UTC time) when this configuration set was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable dateCreated;

/**
 <p>The date (in UTC time) when this configuration set was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable dateUpdated;

/**
 <p> If this configuration set is associated with an environment, the <code>DeploymentStatus</code> parameter indicates the deployment status of this configuration set: </p><ul><li><p><code>null</code>: This configuration is not associated with a running environment.</p></li><li><p><code>pending</code>: This is a draft configuration that is not deployed to the associated environment but is in the process of deploying.</p></li><li><p><code>deployed</code>: This is the configuration that is currently deployed to the associated running environment.</p></li><li><p><code>failed</code>: This is a draft configuration that failed to successfully deploy.</p></li></ul>
 */
@property (nonatomic, assign) AWSElasticbeanstalkConfigurationDeploymentStatus deploymentStatus;

/**
 <p>Describes this configuration set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p> If not <code>null</code>, the name of the environment for this configuration set. </p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

/**
 <p>A list of the configuration options and their values in this configuration set.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkConfigurationOptionSetting *> * _Nullable optionSettings;

/**
 <p>The ARN of the platform version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformArn;

/**
 <p>The name of the solution stack this configuration set uses.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionStackName;

/**
 <p> If not <code>null</code>, the name of the configuration template for this configuration set. </p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

@end

/**
 <p>The results from a request to change the configuration settings of an environment.</p>
 */
@interface AWSElasticbeanstalkConfigurationSettingsDescriptions : AWSModel


/**
 <p> A list of <a>ConfigurationSettingsDescription</a>. </p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkConfigurationSettingsDescription *> * _Nullable configurationSettings;

@end

/**
 <p>Provides a list of validation messages.</p>
 */
@interface AWSElasticbeanstalkConfigurationSettingsValidationMessages : AWSModel


/**
 <p> A list of <a>ValidationMessage</a>. </p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkValidationMessage *> * _Nullable messages;

@end

/**
 <p>Request to create an application.</p>
 Required parameters: [ApplicationName]
 */
@interface AWSElasticbeanstalkCreateApplicationMessage : AWSRequest


/**
 <p>The name of the application. Must be unique within your account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>Your description of the application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Specifies an application resource lifecycle configuration to prevent your application from accumulating too many versions.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkApplicationResourceLifecycleConfig * _Nullable resourceLifecycleConfig;

/**
 <p>Specifies the tags applied to the application.</p><p>Elastic Beanstalk applies these tags only to the application. Environments that you create in the application don't inherit the tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkTag *> * _Nullable tags;

@end

/**
 <p/>
 Required parameters: [ApplicationName, VersionLabel]
 */
@interface AWSElasticbeanstalkCreateApplicationVersionMessage : AWSRequest


/**
 <p> The name of the application. If no application is found with this name, and <code>AutoCreateApplication</code> is <code>false</code>, returns an <code>InvalidParameterValue</code> error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>Set to <code>true</code> to create an application with the specified name if it doesn't already exist.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoCreateApplication;

/**
 <p>Settings for an AWS CodeBuild build.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkBuildConfiguration * _Nullable buildConfiguration;

/**
 <p>A description of this application version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Pre-processes and validates the environment manifest (<code>env.yaml</code>) and configuration files (<code>*.config</code> files in the <code>.ebextensions</code> folder) in the source bundle. Validating configuration files can identify issues prior to deploying the application version to an environment.</p><p>You must turn processing on for application versions that you create using AWS CodeBuild or AWS CodeCommit. For application versions built from a source bundle in Amazon S3, processing is optional.</p><note><p>The <code>Process</code> option validates Elastic Beanstalk configuration files. It doesn't validate your application's configuration files, like proxy server or Docker configuration.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable process;

/**
 <p>Specify a commit in an AWS CodeCommit Git repository to use as the source code for the application version.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkSourceBuildInformation * _Nullable sourceBuildInformation;

/**
 <p>The Amazon S3 bucket and key that identify the location of the source bundle for this version.</p><note><p>The Amazon S3 bucket must be in the same region as the environment.</p></note><p>Specify a source bundle in S3 or a commit in an AWS CodeCommit repository (with <code>SourceBuildInformation</code>), but not both. If neither <code>SourceBundle</code> nor <code>SourceBuildInformation</code> are provided, Elastic Beanstalk uses a sample application.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkS3Location * _Nullable sourceBundle;

/**
 <p>Specifies the tags applied to the application version.</p><p>Elastic Beanstalk applies these tags only to the application version. Environments that use the application version don't inherit the tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkTag *> * _Nullable tags;

/**
 <p>A label identifying this version.</p><p>Constraint: Must be unique per application. If an application version already exists with this label for the specified application, AWS Elastic Beanstalk returns an <code>InvalidParameterValue</code> error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable versionLabel;

@end

/**
 <p>Request to create a configuration template.</p>
 Required parameters: [ApplicationName, TemplateName]
 */
@interface AWSElasticbeanstalkCreateConfigurationTemplateMessage : AWSRequest


/**
 <p>The name of the Elastic Beanstalk application to associate with this configuration template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>An optional description for this configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID of an environment whose settings you want to use to create the configuration template. You must specify <code>EnvironmentId</code> if you don't specify <code>PlatformArn</code>, <code>SolutionStackName</code>, or <code>SourceConfiguration</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentId;

/**
 <p>Option values for the Elastic Beanstalk configuration, such as the instance type. If specified, these values override the values obtained from the solution stack or the source configuration template. For a complete list of Elastic Beanstalk configuration options, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options.html">Option Values</a> in the <i>AWS Elastic Beanstalk Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkConfigurationOptionSetting *> * _Nullable optionSettings;

/**
 <p>The Amazon Resource Name (ARN) of the custom platform. For more information, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/custom-platforms.html"> Custom Platforms</a> in the <i>AWS Elastic Beanstalk Developer Guide</i>.</p><note><p>If you specify <code>PlatformArn</code>, then don't specify <code>SolutionStackName</code>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable platformArn;

/**
 <p>The name of an Elastic Beanstalk solution stack (platform version) that this configuration uses. For example, <code>64bit Amazon Linux 2013.09 running Tomcat 7 Java 7</code>. A solution stack specifies the operating system, runtime, and application server for a configuration template. It also determines the set of configuration options as well as the possible and default values. For more information, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/concepts.platforms.html">Supported Platforms</a> in the <i>AWS Elastic Beanstalk Developer Guide</i>.</p><p>You must specify <code>SolutionStackName</code> if you don't specify <code>PlatformArn</code>, <code>EnvironmentId</code>, or <code>SourceConfiguration</code>.</p><p>Use the <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/api/API_ListAvailableSolutionStacks.html"><code>ListAvailableSolutionStacks</code></a> API to obtain a list of available solution stacks.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionStackName;

/**
 <p>An Elastic Beanstalk configuration template to base this one on. If specified, Elastic Beanstalk uses the configuration values from the specified configuration template to create a new configuration.</p><p>Values specified in <code>OptionSettings</code> override any values obtained from the <code>SourceConfiguration</code>.</p><p>You must specify <code>SourceConfiguration</code> if you don't specify <code>PlatformArn</code>, <code>EnvironmentId</code>, or <code>SolutionStackName</code>.</p><p>Constraint: If both solution stack name and source configuration are specified, the solution stack of the source configuration template must match the specified solution stack name.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkSourceConfiguration * _Nullable sourceConfiguration;

/**
 <p>Specifies the tags applied to the configuration template.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkTag *> * _Nullable tags;

/**
 <p>The name of the configuration template.</p><p>Constraint: This name must be unique per application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

@end

/**
 <p/>
 Required parameters: [ApplicationName]
 */
@interface AWSElasticbeanstalkCreateEnvironmentMessage : AWSRequest


/**
 <p>The name of the application that is associated with this environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>If specified, the environment attempts to use this value as the prefix for the CNAME in your Elastic Beanstalk environment URL. If not specified, the CNAME is generated automatically by appending a random alphanumeric string to the environment name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable CNAMEPrefix;

/**
 <p>Your description for this environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A unique name for the environment.</p><p>Constraint: Must be from 4 to 40 characters in length. The name can contain only letters, numbers, and hyphens. It can't start or end with a hyphen. This name must be unique within a region in your account. If the specified name already exists in the region, Elastic Beanstalk returns an <code>InvalidParameterValue</code> error. </p><p>If you don't specify the <code>CNAMEPrefix</code> parameter, the environment name becomes part of the CNAME, and therefore part of the visible URL for your application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

/**
 <p>The name of the group to which the target environment belongs. Specify a group name only if the environment's name is specified in an environment manifest and not with the environment name parameter. See <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-cfg-manifest.html">Environment Manifest (env.yaml)</a> for details.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The Amazon Resource Name (ARN) of an existing IAM role to be used as the environment's operations role. If specified, Elastic Beanstalk uses the operations role for permissions to downstream services during this call and during subsequent calls acting on this environment. To specify an operations role, you must have the <code>iam:PassRole</code> permission for the role. For more information, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/iam-operationsrole.html">Operations roles</a> in the <i>AWS Elastic Beanstalk Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationsRole;

/**
 <p>If specified, AWS Elastic Beanstalk sets the specified configuration options to the requested value in the configuration set for the new environment. These override the values obtained from the solution stack or the configuration template.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkConfigurationOptionSetting *> * _Nullable optionSettings;

/**
 <p>A list of custom user-defined configuration options to remove from the configuration set for this new environment.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkOptionSpecification *> * _Nullable optionsToRemove;

/**
 <p>The Amazon Resource Name (ARN) of the custom platform to use with the environment. For more information, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/custom-platforms.html">Custom Platforms</a> in the <i>AWS Elastic Beanstalk Developer Guide</i>.</p><note><p>If you specify <code>PlatformArn</code>, don't specify <code>SolutionStackName</code>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable platformArn;

/**
 <p>The name of an Elastic Beanstalk solution stack (platform version) to use with the environment. If specified, Elastic Beanstalk sets the configuration values to the default values associated with the specified solution stack. For a list of current solution stacks, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html">Elastic Beanstalk Supported Platforms</a> in the <i>AWS Elastic Beanstalk Platforms</i> guide.</p><note><p>If you specify <code>SolutionStackName</code>, don't specify <code>PlatformArn</code> or <code>TemplateName</code>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable solutionStackName;

/**
 <p>Specifies the tags applied to resources in the environment.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkTag *> * _Nullable tags;

/**
 <p>The name of the Elastic Beanstalk configuration template to use with the environment.</p><note><p>If you specify <code>TemplateName</code>, then don't specify <code>SolutionStackName</code>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>Specifies the tier to use in creating this environment. The environment tier that you choose determines whether Elastic Beanstalk provisions resources to support a web application that handles HTTP(S) requests or a web application that handles background-processing tasks.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkEnvironmentTier * _Nullable tier;

/**
 <p>The name of the application version to deploy.</p><p>Default: If not specified, Elastic Beanstalk attempts to deploy the sample application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionLabel;

@end

/**
 <p>Request to create a new platform version.</p>
 Required parameters: [PlatformName, PlatformVersion, PlatformDefinitionBundle]
 */
@interface AWSElasticbeanstalkCreatePlatformVersionRequest : AWSRequest


/**
 <p>The name of the builder environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

/**
 <p>The configuration option settings to apply to the builder environment.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkConfigurationOptionSetting *> * _Nullable optionSettings;

/**
 <p>The location of the platform definition archive in Amazon S3.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkS3Location * _Nullable platformDefinitionBundle;

/**
 <p>The name of your custom platform.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformName;

/**
 <p>The number, such as 1.0.2, for the new platform version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformVersion;

/**
 <p>Specifies the tags applied to the new platform version.</p><p>Elastic Beanstalk applies these tags only to the platform version. Environments that you create using the platform version don't inherit the tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSElasticbeanstalkCreatePlatformVersionResult : AWSModel


/**
 <p>The builder used to create the custom platform.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkBuilder * _Nullable builder;

/**
 <p>Detailed information about the new version of the custom platform.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkPlatformSummary * _Nullable platformSummary;

@end

/**
 <p>Results of a <a>CreateStorageLocationResult</a> call.</p>
 */
@interface AWSElasticbeanstalkCreateStorageLocationResultMessage : AWSModel


/**
 <p>The name of the Amazon S3 bucket created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Bucket;

@end

/**
 <p>A custom AMI available to platforms.</p>
 */
@interface AWSElasticbeanstalkCustomAmi : AWSModel


/**
 <p>THe ID of the image used to create the custom AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

/**
 <p>The type of virtualization used to create the custom AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualizationType;

@end

/**
 <p>Request to delete an application.</p>
 Required parameters: [ApplicationName]
 */
@interface AWSElasticbeanstalkDeleteApplicationMessage : AWSRequest


/**
 <p>The name of the application to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>When set to true, running environments will be terminated before deleting the application.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable terminateEnvByForce;

@end

/**
 <p>Request to delete an application version.</p>
 Required parameters: [ApplicationName, VersionLabel]
 */
@interface AWSElasticbeanstalkDeleteApplicationVersionMessage : AWSRequest


/**
 <p>The name of the application to which the version belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>Set to <code>true</code> to delete the source bundle from your storage bucket. Otherwise, the application version is deleted only from Elastic Beanstalk and the source bundle remains in Amazon S3.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteSourceBundle;

/**
 <p>The label of the version to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionLabel;

@end

/**
 <p>Request to delete a configuration template.</p>
 Required parameters: [ApplicationName, TemplateName]
 */
@interface AWSElasticbeanstalkDeleteConfigurationTemplateMessage : AWSRequest


/**
 <p>The name of the application to delete the configuration template from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>The name of the configuration template to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

@end

/**
 <p>Request to delete a draft environment configuration.</p>
 Required parameters: [ApplicationName, EnvironmentName]
 */
@interface AWSElasticbeanstalkDeleteEnvironmentConfigurationMessage : AWSRequest


/**
 <p>The name of the application the environment is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>The name of the environment to delete the draft configuration from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

@end

/**
 
 */
@interface AWSElasticbeanstalkDeletePlatformVersionRequest : AWSRequest


/**
 <p>The ARN of the version of the custom platform.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformArn;

@end

/**
 
 */
@interface AWSElasticbeanstalkDeletePlatformVersionResult : AWSModel


/**
 <p>Detailed information about the version of the custom platform.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkPlatformSummary * _Nullable platformSummary;

@end

/**
 <p>Information about an application version deployment.</p>
 */
@interface AWSElasticbeanstalkDeployment : AWSModel


/**
 <p>The ID of the deployment. This number increases by one each time that you deploy source code or change instance configuration settings.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deploymentId;

/**
 <p>For in-progress deployments, the time that the deployment started.</p><p>For completed deployments, the time that the deployment ended.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deploymentTime;

/**
 <p>The status of the deployment:</p><ul><li><p><code>In Progress</code> : The deployment is in progress.</p></li><li><p><code>Deployed</code> : The deployment succeeded.</p></li><li><p><code>Failed</code> : The deployment failed.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The version label of the application version in the deployment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionLabel;

@end

/**
 
 */
@interface AWSElasticbeanstalkDescribeAccountAttributesResult : AWSModel


/**
 <p>The Elastic Beanstalk resource quotas associated with the calling AWS account.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkResourceQuotas * _Nullable resourceQuotas;

@end

/**
 <p>Request to describe application versions.</p>
 */
@interface AWSElasticbeanstalkDescribeApplicationVersionsMessage : AWSRequest


/**
 <p>Specify an application name to show only application versions for that application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>For a paginated request. Specify a maximum number of application versions to include in each response.</p><p>If no <code>MaxRecords</code> is specified, all available application versions are retrieved in a single response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>For a paginated request. Specify a token from a previous response page to retrieve the next response page. All other parameter values must be identical to the ones specified in the initial request.</p><p>If no <code>NextToken</code> is specified, the first page is retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Specify a version label to show a specific application version.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable versionLabels;

@end

/**
 <p>Request to describe one or more applications.</p>
 */
@interface AWSElasticbeanstalkDescribeApplicationsMessage : AWSRequest


/**
 <p>If specified, AWS Elastic Beanstalk restricts the returned descriptions to only include those with the specified names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable applicationNames;

@end

/**
 <p>Result message containing a list of application version descriptions.</p>
 */
@interface AWSElasticbeanstalkDescribeConfigurationOptionsMessage : AWSRequest


/**
 <p>The name of the application associated with the configuration template or environment. Only needed if you want to describe the configuration options associated with either the configuration template or environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>The name of the environment whose configuration options you want to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

/**
 <p>If specified, restricts the descriptions to only the specified options.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkOptionSpecification *> * _Nullable options;

/**
 <p>The ARN of the custom platform.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformArn;

/**
 <p>The name of the solution stack whose configuration options you want to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionStackName;

/**
 <p>The name of the configuration template whose configuration options you want to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

@end

/**
 <p>Result message containing all of the configuration settings for a specified solution stack or configuration template.</p>
 Required parameters: [ApplicationName]
 */
@interface AWSElasticbeanstalkDescribeConfigurationSettingsMessage : AWSRequest


/**
 <p>The application for the environment or configuration template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>The name of the environment to describe.</p><p> Condition: You must specify either this or a TemplateName, but not both. If you specify both, AWS Elastic Beanstalk returns an <code>InvalidParameterCombination</code> error. If you do not specify either, AWS Elastic Beanstalk returns <code>MissingRequiredParameter</code> error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

/**
 <p>The name of the configuration template to describe.</p><p> Conditional: You must specify either this parameter or an EnvironmentName, but not both. If you specify both, AWS Elastic Beanstalk returns an <code>InvalidParameterCombination</code> error. If you do not specify either, AWS Elastic Beanstalk returns a <code>MissingRequiredParameter</code> error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

@end

/**
 <p>See the example below to learn how to create a request body.</p>
 */
@interface AWSElasticbeanstalkDescribeEnvironmentHealthRequest : AWSRequest


/**
 <p>Specify the response elements to return. To retrieve all attributes, set to <code>All</code>. If no attribute names are specified, returns the name of the environment.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributeNames;

/**
 <p>Specify the environment by ID.</p><p>You must specify either this or an EnvironmentName, or both.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentId;

/**
 <p>Specify the environment by name.</p><p>You must specify either this or an EnvironmentName, or both.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

@end

/**
 <p>Health details for an AWS Elastic Beanstalk environment.</p>
 */
@interface AWSElasticbeanstalkDescribeEnvironmentHealthResult : AWSModel


/**
 <p>Application request metrics for the environment.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkApplicationMetrics * _Nullable applicationMetrics;

/**
 <p>Descriptions of the data that contributed to the environment's current health status.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable causes;

/**
 <p>The <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html">health color</a> of the environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable color;

/**
 <p>The environment's name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

/**
 <p>The <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html">health status</a> of the environment. For example, <code>Ok</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthStatus;

/**
 <p>Summary health information for the instances in the environment.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkInstanceHealthSummary * _Nullable instancesHealth;

/**
 <p>The date and time that the health information was retrieved.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable refreshedAt;

/**
 <p>The environment's operational status. <code>Ready</code>, <code>Launching</code>, <code>Updating</code>, <code>Terminating</code>, or <code>Terminated</code>.</p>
 */
@property (nonatomic, assign) AWSElasticbeanstalkEnvironmentHealth status;

@end

/**
 <p>Request to list completed and failed managed actions.</p>
 */
@interface AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryRequest : AWSRequest


/**
 <p>The environment ID of the target environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentId;

/**
 <p>The name of the target environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

/**
 <p>The maximum number of items to return for a single request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>The pagination token returned by a previous request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>A result message containing a list of completed and failed managed actions.</p>
 */
@interface AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryResult : AWSModel


/**
 <p>A list of completed and failed managed actions.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkManagedActionHistoryItem *> * _Nullable managedActionHistoryItems;

/**
 <p>A pagination token that you pass to <a>DescribeEnvironmentManagedActionHistory</a> to get the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Request to list an environment's upcoming and in-progress managed actions.</p>
 */
@interface AWSElasticbeanstalkDescribeEnvironmentManagedActionsRequest : AWSRequest


/**
 <p>The environment ID of the target environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentId;

/**
 <p>The name of the target environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

/**
 <p>To show only actions with a particular status, specify a status.</p>
 */
@property (nonatomic, assign) AWSElasticbeanstalkActionStatus status;

@end

/**
 <p>The result message containing a list of managed actions.</p>
 */
@interface AWSElasticbeanstalkDescribeEnvironmentManagedActionsResult : AWSModel


/**
 <p>A list of upcoming and in-progress managed actions.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkManagedAction *> * _Nullable managedActions;

@end

/**
 <p>Request to describe the resources in an environment.</p>
 */
@interface AWSElasticbeanstalkDescribeEnvironmentResourcesMessage : AWSRequest


/**
 <p>The ID of the environment to retrieve AWS resource usage data.</p><p> Condition: You must specify either this or an EnvironmentName, or both. If you do not specify either, AWS Elastic Beanstalk returns <code>MissingRequiredParameter</code> error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentId;

/**
 <p>The name of the environment to retrieve AWS resource usage data.</p><p> Condition: You must specify either this or an EnvironmentId, or both. If you do not specify either, AWS Elastic Beanstalk returns <code>MissingRequiredParameter</code> error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

@end

/**
 <p>Request to describe one or more environments.</p>
 */
@interface AWSElasticbeanstalkDescribeEnvironmentsMessage : AWSRequest


/**
 <p>If specified, AWS Elastic Beanstalk restricts the returned descriptions to include only those that are associated with this application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>If specified, AWS Elastic Beanstalk restricts the returned descriptions to include only those that have the specified IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable environmentIds;

/**
 <p>If specified, AWS Elastic Beanstalk restricts the returned descriptions to include only those that have the specified names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable environmentNames;

/**
 <p>Indicates whether to include deleted environments:</p><p><code>true</code>: Environments that have been deleted after <code>IncludedDeletedBackTo</code> are displayed.</p><p><code>false</code>: Do not include deleted environments.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeDeleted;

/**
 <p> If specified when <code>IncludeDeleted</code> is set to <code>true</code>, then environments deleted after this date are displayed. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable includedDeletedBackTo;

/**
 <p>For a paginated request. Specify a maximum number of environments to include in each response.</p><p>If no <code>MaxRecords</code> is specified, all available environments are retrieved in a single response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>For a paginated request. Specify a token from a previous response page to retrieve the next response page. All other parameter values must be identical to the ones specified in the initial request.</p><p>If no <code>NextToken</code> is specified, the first page is retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>If specified, AWS Elastic Beanstalk restricts the returned descriptions to include only those that are associated with this application version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionLabel;

@end

/**
 <p>Request to retrieve a list of events for an environment.</p>
 */
@interface AWSElasticbeanstalkDescribeEventsMessage : AWSRequest


/**
 <p>If specified, AWS Elastic Beanstalk restricts the returned descriptions to include only those associated with this application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p> If specified, AWS Elastic Beanstalk restricts the returned descriptions to those that occur up to, but not including, the <code>EndTime</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>If specified, AWS Elastic Beanstalk restricts the returned descriptions to those associated with this environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentId;

/**
 <p>If specified, AWS Elastic Beanstalk restricts the returned descriptions to those associated with this environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

/**
 <p>Specifies the maximum number of events that can be returned, beginning with the most recent event.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>Pagination token. If specified, the events return the next batch of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ARN of a custom platform version. If specified, AWS Elastic Beanstalk restricts the returned descriptions to those associated with this custom platform version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformArn;

/**
 <p>If specified, AWS Elastic Beanstalk restricts the described events to include only those associated with this request ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>If specified, limits the events returned from this call to include only those with the specified severity or higher.</p>
 */
@property (nonatomic, assign) AWSElasticbeanstalkEventSeverity severity;

/**
 <p>If specified, AWS Elastic Beanstalk restricts the returned descriptions to those that occur on or after this time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>If specified, AWS Elastic Beanstalk restricts the returned descriptions to those that are associated with this environment configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>If specified, AWS Elastic Beanstalk restricts the returned descriptions to those associated with this application version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionLabel;

@end

/**
 <p>Parameters for a call to <code>DescribeInstancesHealth</code>.</p>
 */
@interface AWSElasticbeanstalkDescribeInstancesHealthRequest : AWSRequest


/**
 <p>Specifies the response elements you wish to receive. To retrieve all attributes, set to <code>All</code>. If no attribute names are specified, returns a list of instances.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributeNames;

/**
 <p>Specify the AWS Elastic Beanstalk environment by ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentId;

/**
 <p>Specify the AWS Elastic Beanstalk environment by name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

/**
 <p>Specify the pagination token returned by a previous call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Detailed health information about the Amazon EC2 instances in an AWS Elastic Beanstalk environment.</p>
 */
@interface AWSElasticbeanstalkDescribeInstancesHealthResult : AWSModel


/**
 <p>Detailed health information about each instance.</p><p>The output differs slightly between Linux and Windows environments. There is a difference in the members that are supported under the <code>&lt;CPUUtilization&gt;</code> type.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkSingleInstanceHealth *> * _Nullable instanceHealthList;

/**
 <p>Pagination token for the next page of results, if available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The date and time that the health information was retrieved.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable refreshedAt;

@end

/**
 
 */
@interface AWSElasticbeanstalkDescribePlatformVersionRequest : AWSRequest


/**
 <p>The ARN of the platform version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformArn;

@end

/**
 
 */
@interface AWSElasticbeanstalkDescribePlatformVersionResult : AWSModel


/**
 <p>Detailed information about the platform version.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkPlatformDescription * _Nullable platformDescription;

@end

/**
 <p>Request to disassociate the operations role from an environment.</p>
 Required parameters: [EnvironmentName]
 */
@interface AWSElasticbeanstalkDisassociateEnvironmentOperationsRoleMessage : AWSRequest


/**
 <p>The name of the environment from which to disassociate the operations role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

@end

/**
 <p>Describes the properties of an environment.</p>
 */
@interface AWSElasticbeanstalkEnvironmentDescription : AWSModel


/**
 <p>Indicates if there is an in-progress environment configuration update or application version deployment that you can cancel.</p><p><code>true:</code> There is an update in progress. </p><p><code>false:</code> There are no updates currently in progress. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable abortableOperationInProgress;

/**
 <p>The name of the application associated with this environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>The URL to the CNAME for this environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable CNAME;

/**
 <p>The creation date for this environment.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable dateCreated;

/**
 <p>The last modified date for this environment.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable dateUpdated;

/**
 <p>Describes this environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>For load-balanced, autoscaling environments, the URL to the LoadBalancer. For single-instance environments, the IP address of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointURL;

/**
 <p>The environment's Amazon Resource Name (ARN), which can be used in other API requests that require an ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentArn;

/**
 <p>The ID of this environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentId;

/**
 <p>A list of links to other environments in the same group.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkEnvironmentLink *> * _Nullable environmentLinks;

/**
 <p>The name of this environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

/**
 <p>Describes the health status of the environment. AWS Elastic Beanstalk indicates the failure levels for a running environment:</p><ul><li><p><code>Red</code>: Indicates the environment is not responsive. Occurs when three or more consecutive failures occur for an environment.</p></li><li><p><code>Yellow</code>: Indicates that something is wrong. Occurs when two consecutive failures occur for an environment.</p></li><li><p><code>Green</code>: Indicates the environment is healthy and fully functional.</p></li><li><p><code>Grey</code>: Default health for a new environment. The environment is not fully launched and health checks have not started or health checks are suspended during an <code>UpdateEnvironment</code> or <code>RestartEnvironment</code> request.</p></li></ul><p> Default: <code>Grey</code></p>
 */
@property (nonatomic, assign) AWSElasticbeanstalkEnvironmentHealth health;

/**
 <p>Returns the health status of the application running in your environment. For more information, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html">Health Colors and Statuses</a>.</p>
 */
@property (nonatomic, assign) AWSElasticbeanstalkEnvironmentHealthStatus healthStatus;

/**
 <p>The Amazon Resource Name (ARN) of the environment's operations role. For more information, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/iam-operationsrole.html">Operations roles</a> in the <i>AWS Elastic Beanstalk Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationsRole;

/**
 <p>The ARN of the platform version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformArn;

/**
 <p>The description of the AWS resources used by this environment.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkEnvironmentResourcesDescription * _Nullable resources;

/**
 <p> The name of the <code>SolutionStack</code> deployed with this environment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionStackName;

/**
 <p>The current operational status of the environment:</p><ul><li><p><code>Launching</code>: Environment is in the process of initial deployment.</p></li><li><p><code>Updating</code>: Environment is in the process of updating its configuration settings or application version.</p></li><li><p><code>Ready</code>: Environment is available to have an action performed on it, such as update or terminate.</p></li><li><p><code>Terminating</code>: Environment is in the shut-down process.</p></li><li><p><code>Terminated</code>: Environment is not running.</p></li></ul>
 */
@property (nonatomic, assign) AWSElasticbeanstalkEnvironmentStatus status;

/**
 <p>The name of the configuration template used to originally launch this environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>Describes the current tier of this environment.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkEnvironmentTier * _Nullable tier;

/**
 <p>The application version deployed in this environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionLabel;

@end

/**
 <p>Result message containing a list of environment descriptions.</p>
 */
@interface AWSElasticbeanstalkEnvironmentDescriptionsMessage : AWSModel


/**
 <p> Returns an <a>EnvironmentDescription</a> list. </p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkEnvironmentDescription *> * _Nullable environments;

/**
 <p>In a paginated request, the token that you can pass in a subsequent request to get the next response page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>The information retrieved from the Amazon EC2 instances.</p>
 */
@interface AWSElasticbeanstalkEnvironmentInfoDescription : AWSModel


/**
 <p>The Amazon EC2 Instance ID for this information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ec2InstanceId;

/**
 <p>The type of information retrieved.</p>
 */
@property (nonatomic, assign) AWSElasticbeanstalkEnvironmentInfoType infoType;

/**
 <p>The retrieved information. Currently contains a presigned Amazon S3 URL. The files are deleted after 15 minutes.</p><p>Anyone in possession of this URL can access the files before they are deleted. Make the URL available only to trusted parties.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The time stamp when this information was retrieved.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable sampleTimestamp;

@end

/**
 <p>A link to another environment, defined in the environment's manifest. Links provide connection information in system properties that can be used to connect to another environment in the same group. See <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-cfg-manifest.html">Environment Manifest (env.yaml)</a> for details.</p>
 */
@interface AWSElasticbeanstalkEnvironmentLink : AWSModel


/**
 <p>The name of the linked environment (the dependency).</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

/**
 <p>The name of the link.</p>
 */
@property (nonatomic, strong) NSString * _Nullable linkName;

@end

/**
 <p>Describes the AWS resources in use by this environment. This data is live.</p>
 */
@interface AWSElasticbeanstalkEnvironmentResourceDescription : AWSModel


/**
 <p> The <code>AutoScalingGroups</code> used by this environment. </p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkAutoScalingGroup *> * _Nullable autoScalingGroups;

/**
 <p>The name of the environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

/**
 <p>The Amazon EC2 instances used by this environment.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkInstance *> * _Nullable instances;

/**
 <p>The Auto Scaling launch configurations in use by this environment.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkLaunchConfiguration *> * _Nullable launchConfigurations;

/**
 <p>The Amazon EC2 launch templates in use by this environment.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkLaunchTemplate *> * _Nullable launchTemplates;

/**
 <p>The LoadBalancers in use by this environment.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkLoadBalancer *> * _Nullable loadBalancers;

/**
 <p>The queues used by this environment.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkQueue *> * _Nullable queues;

/**
 <p>The <code>AutoScaling</code> triggers in use by this environment. </p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkTrigger *> * _Nullable triggers;

@end

/**
 <p>Result message containing a list of environment resource descriptions.</p>
 */
@interface AWSElasticbeanstalkEnvironmentResourceDescriptionsMessage : AWSModel


/**
 <p> A list of <a>EnvironmentResourceDescription</a>. </p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkEnvironmentResourceDescription * _Nullable environmentResources;

@end

/**
 <p>Describes the AWS resources in use by this environment. This data is not live data.</p>
 */
@interface AWSElasticbeanstalkEnvironmentResourcesDescription : AWSModel


/**
 <p>Describes the LoadBalancer.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkLoadBalancerDescription * _Nullable loadBalancer;

@end

/**
 <p>Describes the properties of an environment tier</p>
 */
@interface AWSElasticbeanstalkEnvironmentTier : AWSModel


/**
 <p>The name of this environment tier.</p><p>Valid values:</p><ul><li><p>For <i>Web server tier</i> – <code>WebServer</code></p></li><li><p>For <i>Worker tier</i> – <code>Worker</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of this environment tier.</p><p>Valid values:</p><ul><li><p>For <i>Web server tier</i> – <code>Standard</code></p></li><li><p>For <i>Worker tier</i> – <code>SQS/HTTP</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable types;

/**
 <p>The version of this environment tier. When you don't set a value to it, Elastic Beanstalk uses the latest compatible worker tier version.</p><note><p>This member is deprecated. Any specific version that you set may become out of date. We recommend leaving it unspecified.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>Describes an event.</p>
 */
@interface AWSElasticbeanstalkEventDescription : AWSModel


/**
 <p>The application associated with the event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>The name of the environment associated with this event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

/**
 <p>The date when the event occurred.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable eventDate;

/**
 <p>The event message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The ARN of the platform version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformArn;

/**
 <p>The web service request ID for the activity of this event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The severity level of this event.</p>
 */
@property (nonatomic, assign) AWSElasticbeanstalkEventSeverity severity;

/**
 <p>The name of the configuration associated with this event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The release label for the application version associated with this event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionLabel;

@end

/**
 <p>Result message wrapping a list of event descriptions.</p>
 */
@interface AWSElasticbeanstalkEventDescriptionsMessage : AWSModel


/**
 <p> A list of <a>EventDescription</a>. </p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkEventDescription *> * _Nullable events;

/**
 <p> If returned, this indicates that there are more results to obtain. Use this token in the next <a>DescribeEvents</a> call to get the next batch of events. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>The description of an Amazon EC2 instance.</p>
 */
@interface AWSElasticbeanstalkInstance : AWSModel


/**
 <p>The ID of the Amazon EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>Represents summary information about the health of an instance. For more information, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html">Health Colors and Statuses</a>.</p>
 */
@interface AWSElasticbeanstalkInstanceHealthSummary : AWSModel


/**
 <p><b>Red.</b> The health agent is reporting a high number of request failures or other issues for an instance or environment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable degraded;

/**
 <p><b>Green.</b> An operation is in progress on an instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable info;

/**
 <p><b>Grey.</b> AWS Elastic Beanstalk and the health agent are reporting no data on an instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable noData;

/**
 <p><b>Green.</b> An instance is passing health checks and the health agent is not reporting any problems.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ok;

/**
 <p><b>Grey.</b> An operation is in progress on an instance within the command timeout.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pending;

/**
 <p><b>Red.</b> The health agent is reporting a very high number of request failures or other issues for an instance or environment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable severe;

/**
 <p><b>Grey.</b> AWS Elastic Beanstalk and the health agent are reporting an insufficient amount of data on an instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable unknown;

/**
 <p><b>Yellow.</b> The health agent is reporting a moderate number of request failures or other issues for an instance or environment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable warning;

@end

/**
 <p>Represents the average latency for the slowest X percent of requests over the last 10 seconds.</p>
 */
@interface AWSElasticbeanstalkLatency : AWSModel


/**
 <p>The average latency for the slowest 90 percent of requests over the last 10 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable p10;

/**
 <p>The average latency for the slowest 50 percent of requests over the last 10 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable p50;

/**
 <p>The average latency for the slowest 25 percent of requests over the last 10 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable p75;

/**
 <p>The average latency for the slowest 15 percent of requests over the last 10 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable p85;

/**
 <p>The average latency for the slowest 10 percent of requests over the last 10 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable p90;

/**
 <p>The average latency for the slowest 5 percent of requests over the last 10 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable p95;

/**
 <p>The average latency for the slowest 1 percent of requests over the last 10 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable p99;

/**
 <p>The average latency for the slowest 0.1 percent of requests over the last 10 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable p999;

@end

/**
 <p>Describes an Auto Scaling launch configuration.</p>
 */
@interface AWSElasticbeanstalkLaunchConfiguration : AWSModel


/**
 <p>The name of the launch configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Describes an Amazon EC2 launch template.</p>
 */
@interface AWSElasticbeanstalkLaunchTemplate : AWSModel


/**
 <p>The ID of the launch template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>A list of available AWS Elastic Beanstalk solution stacks.</p>
 */
@interface AWSElasticbeanstalkListAvailableSolutionStacksResultMessage : AWSModel


/**
 <p> A list of available solution stacks and their <a>SolutionStackDescription</a>. </p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkSolutionStackDescription *> * _Nullable solutionStackDetails;

/**
 <p>A list of available solution stacks.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable solutionStacks;

@end

/**
 
 */
@interface AWSElasticbeanstalkListPlatformBranchesRequest : AWSRequest


/**
 <p>Criteria for restricting the resulting list of platform branches. The filter is evaluated as a logical conjunction (AND) of the separate <code>SearchFilter</code> terms.</p><p>The following list shows valid attribute values for each of the <code>SearchFilter</code> terms. Most operators take a single value. The <code>in</code> and <code>not_in</code> operators can take multiple values.</p><ul><li><p><code>Attribute = BranchName</code>:</p><ul><li><p><code>Operator</code>: <code>=</code> | <code>!=</code> | <code>begins_with</code> | <code>ends_with</code> | <code>contains</code> | <code>in</code> | <code>not_in</code></p></li></ul></li><li><p><code>Attribute = LifecycleState</code>:</p><ul><li><p><code>Operator</code>: <code>=</code> | <code>!=</code> | <code>in</code> | <code>not_in</code></p></li><li><p><code>Values</code>: <code>beta</code> | <code>supported</code> | <code>deprecated</code> | <code>retired</code></p></li></ul></li><li><p><code>Attribute = PlatformName</code>:</p><ul><li><p><code>Operator</code>: <code>=</code> | <code>!=</code> | <code>begins_with</code> | <code>ends_with</code> | <code>contains</code> | <code>in</code> | <code>not_in</code></p></li></ul></li><li><p><code>Attribute = TierType</code>:</p><ul><li><p><code>Operator</code>: <code>=</code> | <code>!=</code></p></li><li><p><code>Values</code>: <code>WebServer/Standard</code> | <code>Worker/SQS/HTTP</code></p></li></ul></li></ul><p>Array size: limited to 10 <code>SearchFilter</code> objects.</p><p>Within each <code>SearchFilter</code> item, the <code>Values</code> array is limited to 10 items.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkSearchFilter *> * _Nullable filters;

/**
 <p>The maximum number of platform branch values returned in one call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>For a paginated request. Specify a token from a previous response page to retrieve the next response page. All other parameter values must be identical to the ones specified in the initial request.</p><p>If no <code>NextToken</code> is specified, the first page is retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSElasticbeanstalkListPlatformBranchesResult : AWSModel


/**
 <p>In a paginated request, if this value isn't <code>null</code>, it's the token that you can pass in a subsequent request to get the next response page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Summary information about the platform branches.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkPlatformBranchSummary *> * _Nullable platformBranchSummaryList;

@end

/**
 
 */
@interface AWSElasticbeanstalkListPlatformVersionsRequest : AWSRequest


/**
 <p>Criteria for restricting the resulting list of platform versions. The filter is interpreted as a logical conjunction (AND) of the separate <code>PlatformFilter</code> terms.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkPlatformFilter *> * _Nullable filters;

/**
 <p>The maximum number of platform version values returned in one call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>For a paginated request. Specify a token from a previous response page to retrieve the next response page. All other parameter values must be identical to the ones specified in the initial request.</p><p>If no <code>NextToken</code> is specified, the first page is retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSElasticbeanstalkListPlatformVersionsResult : AWSModel


/**
 <p>In a paginated request, if this value isn't <code>null</code>, it's the token that you can pass in a subsequent request to get the next response page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Summary information about the platform versions.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkPlatformSummary *> * _Nullable platformSummaryList;

@end

/**
 
 */
@interface AWSElasticbeanstalkListTagsForResourceMessage : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resouce for which a tag list is requested.</p><p>Must be the ARN of an Elastic Beanstalk resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 <p>Describes the properties of a Listener for the LoadBalancer.</p>
 */
@interface AWSElasticbeanstalkListener : AWSModel


/**
 <p>The port that is used by the Listener.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The protocol that is used by the Listener.</p>
 */
@property (nonatomic, strong) NSString * _Nullable protocols;

@end

/**
 <p>Describes a LoadBalancer.</p>
 */
@interface AWSElasticbeanstalkLoadBalancer : AWSModel


/**
 <p>The name of the LoadBalancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Describes the details of a LoadBalancer.</p>
 */
@interface AWSElasticbeanstalkLoadBalancerDescription : AWSModel


/**
 <p>The domain name of the LoadBalancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

/**
 <p>A list of Listeners used by the LoadBalancer.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkListener *> * _Nullable listeners;

/**
 <p>The name of the LoadBalancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 <p>The record of an upcoming or in-progress managed action.</p>
 */
@interface AWSElasticbeanstalkManagedAction : AWSModel


/**
 <p>A description of the managed action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionDescription;

/**
 <p>A unique identifier for the managed action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionId;

/**
 <p>The type of managed action.</p>
 */
@property (nonatomic, assign) AWSElasticbeanstalkActionType actionType;

/**
 <p>The status of the managed action. If the action is <code>Scheduled</code>, you can apply it immediately with <a>ApplyEnvironmentManagedAction</a>.</p>
 */
@property (nonatomic, assign) AWSElasticbeanstalkActionStatus status;

/**
 <p>The start time of the maintenance window in which the managed action will execute.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable windowStartTime;

@end

/**
 <p>The record of a completed or failed managed action.</p>
 */
@interface AWSElasticbeanstalkManagedActionHistoryItem : AWSModel


/**
 <p>A description of the managed action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionDescription;

/**
 <p>A unique identifier for the managed action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionId;

/**
 <p>The type of the managed action.</p>
 */
@property (nonatomic, assign) AWSElasticbeanstalkActionType actionType;

/**
 <p>The date and time that the action started executing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable executedTime;

/**
 <p>If the action failed, a description of the failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureDescription;

/**
 <p>If the action failed, the type of failure.</p>
 */
@property (nonatomic, assign) AWSElasticbeanstalkFailureType failureType;

/**
 <p>The date and time that the action finished executing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable finishedTime;

/**
 <p>The status of the action.</p>
 */
@property (nonatomic, assign) AWSElasticbeanstalkActionHistoryStatus status;

@end

/**
 <p>A lifecycle rule that deletes application versions after the specified number of days.</p>
 Required parameters: [Enabled]
 */
@interface AWSElasticbeanstalkMaxAgeRule : AWSModel


/**
 <p>Set to <code>true</code> to delete a version's source bundle from Amazon S3 when Elastic Beanstalk deletes the application version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteSourceFromS3;

/**
 <p>Specify <code>true</code> to apply the rule, or <code>false</code> to disable it.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>Specify the number of days to retain an application versions.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxAgeInDays;

@end

/**
 <p>A lifecycle rule that deletes the oldest application version when the maximum count is exceeded.</p>
 Required parameters: [Enabled]
 */
@interface AWSElasticbeanstalkMaxCountRule : AWSModel


/**
 <p>Set to <code>true</code> to delete a version's source bundle from Amazon S3 when Elastic Beanstalk deletes the application version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteSourceFromS3;

/**
 <p>Specify <code>true</code> to apply the rule, or <code>false</code> to disable it.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>Specify the maximum number of application versions to retain.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxCount;

@end

/**
 <p>A regular expression representing a restriction on a string configuration option value.</p>
 */
@interface AWSElasticbeanstalkOptionRestrictionRegex : AWSModel


/**
 <p>A unique name representing this regular expression.</p>
 */
@property (nonatomic, strong) NSString * _Nullable label;

/**
 <p>The regular expression pattern that a string configuration option value with this restriction must match.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pattern;

@end

/**
 <p>A specification identifying an individual configuration option.</p>
 */
@interface AWSElasticbeanstalkOptionSpecification : AWSModel


/**
 <p>A unique namespace identifying the option's associated AWS resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>The name of the configuration option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionName;

/**
 <p>A unique resource name for a time-based scaling configuration option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceName;

@end

/**
 <p>Summary information about a platform branch.</p>
 */
@interface AWSElasticbeanstalkPlatformBranchSummary : AWSModel


/**
 <p>The name of the platform branch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

/**
 <p>An ordinal number that designates the order in which platform branches have been added to a platform. This can be helpful, for example, if your code calls the <code>ListPlatformBranches</code> action and then displays a list of platform branches.</p><p>A larger <code>BranchOrder</code> value designates a newer platform branch within the platform.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable branchOrder;

/**
 <p>The support life cycle state of the platform branch.</p><p>Possible values: <code>beta</code> | <code>supported</code> | <code>deprecated</code> | <code>retired</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleState;

/**
 <p>The name of the platform to which this platform branch belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformName;

/**
 <p>The environment tiers that platform versions in this branch support.</p><p>Possible values: <code>WebServer/Standard</code> | <code>Worker/SQS/HTTP</code></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedTierList;

@end

/**
 <p>Detailed information about a platform version.</p>
 */
@interface AWSElasticbeanstalkPlatformDescription : AWSModel


/**
 <p>The custom AMIs supported by the platform version.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkCustomAmi *> * _Nullable customAmiList;

/**
 <p>The date when the platform version was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable dateCreated;

/**
 <p>The date when the platform version was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable dateUpdated;

/**
 <p>The description of the platform version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The frameworks supported by the platform version.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkPlatformFramework *> * _Nullable frameworks;

/**
 <p>Information about the maintainer of the platform version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maintainer;

/**
 <p>The operating system used by the platform version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operatingSystemName;

/**
 <p>The version of the operating system used by the platform version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operatingSystemVersion;

/**
 <p>The ARN of the platform version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformArn;

/**
 <p>The state of the platform version's branch in its lifecycle.</p><p>Possible values: <code>Beta</code> | <code>Supported</code> | <code>Deprecated</code> | <code>Retired</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable platformBranchLifecycleState;

/**
 <p>The platform branch to which the platform version belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformBranchName;

/**
 <p>The category of the platform version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformCategory;

/**
 <p>The state of the platform version in its lifecycle.</p><p>Possible values: <code>Recommended</code> | <code>null</code></p><p>If a null value is returned, the platform version isn't the recommended one for its branch. Each platform branch has a single recommended platform version, typically the most recent one.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformLifecycleState;

/**
 <p>The name of the platform version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformName;

/**
 <p>The AWS account ID of the person who created the platform version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformOwner;

/**
 <p>The status of the platform version.</p>
 */
@property (nonatomic, assign) AWSElasticbeanstalkPlatformStatus platformStatus;

/**
 <p>The version of the platform version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformVersion;

/**
 <p>The programming languages supported by the platform version.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkPlatformProgrammingLanguage *> * _Nullable programmingLanguages;

/**
 <p>The name of the solution stack used by the platform version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionStackName;

/**
 <p>The additions supported by the platform version.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedAddonList;

/**
 <p>The tiers supported by the platform version.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedTierList;

@end

/**
 <p>Describes criteria to restrict the results when listing platform versions.</p><p>The filter is evaluated as follows: <code>Type Operator Values[1]</code></p>
 */
@interface AWSElasticbeanstalkPlatformFilter : AWSModel


/**
 <p>The operator to apply to the <code>Type</code> with each of the <code>Values</code>.</p><p>Valid values: <code>=</code> | <code>!=</code> | <code>&lt;</code> | <code>&lt;=</code> | <code>&gt;</code> | <code>&gt;=</code> | <code>contains</code> | <code>begins_with</code> | <code>ends_with</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable operator;

/**
 <p>The platform version attribute to which the filter values are applied.</p><p>Valid values: <code>PlatformName</code> | <code>PlatformVersion</code> | <code>PlatformStatus</code> | <code>PlatformBranchName</code> | <code>PlatformLifecycleState</code> | <code>PlatformOwner</code> | <code>SupportedTier</code> | <code>SupportedAddon</code> | <code>ProgrammingLanguageName</code> | <code>OperatingSystemName</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

/**
 <p>The list of values applied to the filtering platform version attribute. Only one value is supported for all current operators.</p><p>The following list shows valid filter values for some filter attributes.</p><ul><li><p><code>PlatformStatus</code>: <code>Creating</code> | <code>Failed</code> | <code>Ready</code> | <code>Deleting</code> | <code>Deleted</code></p></li><li><p><code>PlatformLifecycleState</code>: <code>recommended</code></p></li><li><p><code>SupportedTier</code>: <code>WebServer/Standard</code> | <code>Worker/SQS/HTTP</code></p></li><li><p><code>SupportedAddon</code>: <code>Log/S3</code> | <code>Monitoring/Healthd</code> | <code>WorkerDaemon/SQSD</code></p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>A framework supported by the platform.</p>
 */
@interface AWSElasticbeanstalkPlatformFramework : AWSModel


/**
 <p>The name of the framework.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The version of the framework.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>A programming language supported by the platform.</p>
 */
@interface AWSElasticbeanstalkPlatformProgrammingLanguage : AWSModel


/**
 <p>The name of the programming language.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The version of the programming language.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>Summary information about a platform version.</p>
 */
@interface AWSElasticbeanstalkPlatformSummary : AWSModel


/**
 <p>The operating system used by the platform version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operatingSystemName;

/**
 <p>The version of the operating system used by the platform version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operatingSystemVersion;

/**
 <p>The ARN of the platform version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformArn;

/**
 <p>The state of the platform version's branch in its lifecycle.</p><p>Possible values: <code>beta</code> | <code>supported</code> | <code>deprecated</code> | <code>retired</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable platformBranchLifecycleState;

/**
 <p>The platform branch to which the platform version belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformBranchName;

/**
 <p>The category of platform version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformCategory;

/**
 <p>The state of the platform version in its lifecycle.</p><p>Possible values: <code>recommended</code> | empty</p><p>If an empty value is returned, the platform version is supported but isn't the recommended one for its branch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformLifecycleState;

/**
 <p>The AWS account ID of the person who created the platform version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformOwner;

/**
 <p>The status of the platform version. You can create an environment from the platform version once it is ready.</p>
 */
@property (nonatomic, assign) AWSElasticbeanstalkPlatformStatus platformStatus;

/**
 <p>The version string of the platform version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformVersion;

/**
 <p>The additions associated with the platform version.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedAddonList;

/**
 <p>The tiers in which the platform version runs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedTierList;

@end

/**
 <p>Describes a queue.</p>
 */
@interface AWSElasticbeanstalkQueue : AWSModel


/**
 <p>The name of the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The URL of the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable URL;

@end

/**
 <p/>
 */
@interface AWSElasticbeanstalkRebuildEnvironmentMessage : AWSRequest


/**
 <p>The ID of the environment to rebuild.</p><p> Condition: You must specify either this or an EnvironmentName, or both. If you do not specify either, AWS Elastic Beanstalk returns <code>MissingRequiredParameter</code> error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentId;

/**
 <p>The name of the environment to rebuild.</p><p> Condition: You must specify either this or an EnvironmentId, or both. If you do not specify either, AWS Elastic Beanstalk returns <code>MissingRequiredParameter</code> error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

@end

/**
 <p>Request to retrieve logs from an environment and store them in your Elastic Beanstalk storage bucket.</p>
 Required parameters: [InfoType]
 */
@interface AWSElasticbeanstalkRequestEnvironmentInfoMessage : AWSRequest


/**
 <p>The ID of the environment of the requested data.</p><p>If no such environment is found, <code>RequestEnvironmentInfo</code> returns an <code>InvalidParameterValue</code> error. </p><p>Condition: You must specify either this or an EnvironmentName, or both. If you do not specify either, AWS Elastic Beanstalk returns <code>MissingRequiredParameter</code> error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentId;

/**
 <p>The name of the environment of the requested data.</p><p>If no such environment is found, <code>RequestEnvironmentInfo</code> returns an <code>InvalidParameterValue</code> error. </p><p>Condition: You must specify either this or an EnvironmentId, or both. If you do not specify either, AWS Elastic Beanstalk returns <code>MissingRequiredParameter</code> error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

/**
 <p>The type of information to request.</p>
 */
@property (nonatomic, assign) AWSElasticbeanstalkEnvironmentInfoType infoType;

@end

/**
 <p>The AWS Elastic Beanstalk quota information for a single resource type in an AWS account. It reflects the resource's limits for this account.</p>
 */
@interface AWSElasticbeanstalkResourceQuota : AWSModel


/**
 <p>The maximum number of instances of this Elastic Beanstalk resource type that an AWS account can use.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximum;

@end

/**
 <p>A set of per-resource AWS Elastic Beanstalk quotas associated with an AWS account. They reflect Elastic Beanstalk resource limits for this account.</p>
 */
@interface AWSElasticbeanstalkResourceQuotas : AWSModel


/**
 <p>The quota for applications in the AWS account.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkResourceQuota * _Nullable applicationQuota;

/**
 <p>The quota for application versions in the AWS account.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkResourceQuota * _Nullable applicationVersionQuota;

/**
 <p>The quota for configuration templates in the AWS account.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkResourceQuota * _Nullable configurationTemplateQuota;

/**
 <p>The quota for custom platforms in the AWS account.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkResourceQuota * _Nullable customPlatformQuota;

/**
 <p>The quota for environments in the AWS account.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkResourceQuota * _Nullable environmentQuota;

@end

/**
 
 */
@interface AWSElasticbeanstalkResourceTagsDescriptionMessage : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the resource for which a tag list was requested.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>A list of tag key-value pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkTag *> * _Nullable resourceTags;

@end

/**
 <p/>
 */
@interface AWSElasticbeanstalkRestartAppServerMessage : AWSRequest


/**
 <p>The ID of the environment to restart the server for.</p><p> Condition: You must specify either this or an EnvironmentName, or both. If you do not specify either, AWS Elastic Beanstalk returns <code>MissingRequiredParameter</code> error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentId;

/**
 <p>The name of the environment to restart the server for.</p><p> Condition: You must specify either this or an EnvironmentId, or both. If you do not specify either, AWS Elastic Beanstalk returns <code>MissingRequiredParameter</code> error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

@end

/**
 <p>Request to download logs retrieved with <a>RequestEnvironmentInfo</a>.</p>
 Required parameters: [InfoType]
 */
@interface AWSElasticbeanstalkRetrieveEnvironmentInfoMessage : AWSRequest


/**
 <p>The ID of the data's environment.</p><p>If no such environment is found, returns an <code>InvalidParameterValue</code> error.</p><p>Condition: You must specify either this or an EnvironmentName, or both. If you do not specify either, AWS Elastic Beanstalk returns <code>MissingRequiredParameter</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentId;

/**
 <p>The name of the data's environment.</p><p> If no such environment is found, returns an <code>InvalidParameterValue</code> error. </p><p> Condition: You must specify either this or an EnvironmentId, or both. If you do not specify either, AWS Elastic Beanstalk returns <code>MissingRequiredParameter</code> error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

/**
 <p>The type of information to retrieve.</p>
 */
@property (nonatomic, assign) AWSElasticbeanstalkEnvironmentInfoType infoType;

@end

/**
 <p>Result message containing a description of the requested environment info.</p>
 */
@interface AWSElasticbeanstalkRetrieveEnvironmentInfoResultMessage : AWSModel


/**
 <p> The <a>EnvironmentInfoDescription</a> of the environment. </p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkEnvironmentInfoDescription *> * _Nullable environmentInfo;

@end

/**
 <p>The bucket and key of an item stored in Amazon S3.</p>
 */
@interface AWSElasticbeanstalkS3Location : AWSModel


/**
 <p>The Amazon S3 bucket where the data is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Bucket;

/**
 <p>The Amazon S3 key where the data is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Key;

@end

/**
 <p>Describes criteria to restrict a list of results.</p><p>For operators that apply a single value to the attribute, the filter is evaluated as follows: <code>Attribute Operator Values[1]</code></p><p>Some operators, e.g. <code>in</code>, can apply multiple values. In this case, the filter is evaluated as a logical union (OR) of applications of the operator to the attribute with each one of the values: <code>(Attribute Operator Values[1]) OR (Attribute Operator Values[2]) OR ...</code></p><p>The valid values for attributes of <code>SearchFilter</code> depend on the API action. For valid values, see the reference page for the API action you're calling that takes a <code>SearchFilter</code> parameter.</p>
 */
@interface AWSElasticbeanstalkSearchFilter : AWSModel


/**
 <p>The result attribute to which the filter values are applied. Valid values vary by API action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attribute;

/**
 <p>The operator to apply to the <code>Attribute</code> with each of the <code>Values</code>. Valid values vary by <code>Attribute</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operator;

/**
 <p>The list of values applied to the <code>Attribute</code> and <code>Operator</code> attributes. Number of values and valid values vary by <code>Attribute</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Detailed health information about an Amazon EC2 instance in your Elastic Beanstalk environment.</p>
 */
@interface AWSElasticbeanstalkSingleInstanceHealth : AWSModel


/**
 <p>Request metrics from your application.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkApplicationMetrics * _Nullable applicationMetrics;

/**
 <p>The availability zone in which the instance runs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>Represents the causes, which provide more information about the current health status.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable causes;

/**
 <p>Represents the color indicator that gives you information about the health of the EC2 instance. For more information, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html">Health Colors and Statuses</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable color;

/**
 <p>Information about the most recent deployment to an instance.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkDeployment * _Nullable deployment;

/**
 <p>Returns the health status of the specified instance. For more information, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html">Health Colors and Statuses</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthStatus;

/**
 <p>The ID of the Amazon EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The instance's type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>The time at which the EC2 instance was launched.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable launchedAt;

/**
 <p>Operating system metrics from the instance.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkSystemStatus * _Nullable system;

@end

/**
 <p>Describes the solution stack.</p>
 */
@interface AWSElasticbeanstalkSolutionStackDescription : AWSModel


/**
 <p>The permitted file types allowed for a solution stack.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable permittedFileTypes;

/**
 <p>The name of the solution stack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionStackName;

@end

/**
 <p>Location of the source code for an application version.</p>
 Required parameters: [SourceType, SourceRepository, SourceLocation]
 */
@interface AWSElasticbeanstalkSourceBuildInformation : AWSModel


/**
 <p>The location of the source code, as a formatted string, depending on the value of <code>SourceRepository</code></p><ul><li><p>For <code>CodeCommit</code>, the format is the repository name and commit ID, separated by a forward slash. For example, <code>my-git-repo/265cfa0cf6af46153527f55d6503ec030551f57a</code>.</p></li><li><p>For <code>S3</code>, the format is the S3 bucket name and object key, separated by a forward slash. For example, <code>my-s3-bucket/Folders/my-source-file</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable sourceLocation;

/**
 <p>Location where the repository is stored.</p><ul><li><p><code>CodeCommit</code></p></li><li><p><code>S3</code></p></li></ul>
 */
@property (nonatomic, assign) AWSElasticbeanstalkSourceRepository sourceRepository;

/**
 <p>The type of repository.</p><ul><li><p><code>Git</code></p></li><li><p><code>Zip</code></p></li></ul>
 */
@property (nonatomic, assign) AWSElasticbeanstalkSourceType sourceType;

@end

/**
 <p>A specification for an environment configuration.</p>
 */
@interface AWSElasticbeanstalkSourceConfiguration : AWSModel


/**
 <p>The name of the application associated with the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>The name of the configuration template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

@end

/**
 <p>Represents the percentage of requests over the last 10 seconds that resulted in each type of status code response. For more information, see <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html">Status Code Definitions</a>.</p>
 */
@interface AWSElasticbeanstalkStatusCodes : AWSModel


/**
 <p>The percentage of requests over the last 10 seconds that resulted in a 2xx (200, 201, etc.) status code.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status2xx;

/**
 <p>The percentage of requests over the last 10 seconds that resulted in a 3xx (300, 301, etc.) status code.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status3xx;

/**
 <p>The percentage of requests over the last 10 seconds that resulted in a 4xx (400, 401, etc.) status code.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status4xx;

/**
 <p>The percentage of requests over the last 10 seconds that resulted in a 5xx (500, 501, etc.) status code.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status5xx;

@end

/**
 <p>Swaps the CNAMEs of two environments.</p>
 */
@interface AWSElasticbeanstalkSwapEnvironmentCNAMEsMessage : AWSRequest


/**
 <p>The ID of the destination environment.</p><p> Condition: You must specify at least the <code>DestinationEnvironmentID</code> or the <code>DestinationEnvironmentName</code>. You may also specify both. You must specify the <code>SourceEnvironmentId</code> with the <code>DestinationEnvironmentId</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationEnvironmentId;

/**
 <p>The name of the destination environment.</p><p> Condition: You must specify at least the <code>DestinationEnvironmentID</code> or the <code>DestinationEnvironmentName</code>. You may also specify both. You must specify the <code>SourceEnvironmentName</code> with the <code>DestinationEnvironmentName</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationEnvironmentName;

/**
 <p>The ID of the source environment.</p><p> Condition: You must specify at least the <code>SourceEnvironmentID</code> or the <code>SourceEnvironmentName</code>. You may also specify both. If you specify the <code>SourceEnvironmentId</code>, you must specify the <code>DestinationEnvironmentId</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceEnvironmentId;

/**
 <p>The name of the source environment.</p><p> Condition: You must specify at least the <code>SourceEnvironmentID</code> or the <code>SourceEnvironmentName</code>. You may also specify both. If you specify the <code>SourceEnvironmentName</code>, you must specify the <code>DestinationEnvironmentName</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceEnvironmentName;

@end

/**
 <p>CPU utilization and load average metrics for an Amazon EC2 instance.</p>
 */
@interface AWSElasticbeanstalkSystemStatus : AWSModel


/**
 <p>CPU utilization metrics for the instance.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkCPUUtilization * _Nullable CPUUtilization;

/**
 <p>Load average in the last 1-minute, 5-minute, and 15-minute periods. For more information, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-metrics.html#health-enhanced-metrics-os">Operating System Metrics</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable loadAverage;

@end

/**
 <p>Describes a tag applied to a resource in an environment.</p>
 */
@interface AWSElasticbeanstalkTag : AWSModel


/**
 <p>The key of the tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value of the tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Request to terminate an environment.</p>
 */
@interface AWSElasticbeanstalkTerminateEnvironmentMessage : AWSRequest


/**
 <p>The ID of the environment to terminate.</p><p> Condition: You must specify either this or an EnvironmentName, or both. If you do not specify either, AWS Elastic Beanstalk returns <code>MissingRequiredParameter</code> error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentId;

/**
 <p>The name of the environment to terminate.</p><p> Condition: You must specify either this or an EnvironmentId, or both. If you do not specify either, AWS Elastic Beanstalk returns <code>MissingRequiredParameter</code> error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

/**
 <p>Terminates the target environment even if another environment in the same group is dependent on it.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceTerminate;

/**
 <p>Indicates whether the associated AWS resources should shut down when the environment is terminated:</p><ul><li><p><code>true</code>: The specified environment as well as the associated AWS resources, such as Auto Scaling group and LoadBalancer, are terminated.</p></li><li><p><code>false</code>: AWS Elastic Beanstalk resource management is removed from the environment, but the AWS resources continue to operate.</p></li></ul><p> For more information, see the <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/ug/"> AWS Elastic Beanstalk User Guide. </a></p><p> Default: <code>true</code></p><p> Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable terminateResources;

@end

/**
 <p>Describes a trigger.</p>
 */
@interface AWSElasticbeanstalkTrigger : AWSModel


/**
 <p>The name of the trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Request to update an application.</p>
 Required parameters: [ApplicationName]
 */
@interface AWSElasticbeanstalkUpdateApplicationMessage : AWSRequest


/**
 <p>The name of the application to update. If no such application is found, <code>UpdateApplication</code> returns an <code>InvalidParameterValue</code> error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>A new description for the application.</p><p>Default: If not specified, AWS Elastic Beanstalk does not update the description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 
 */
@interface AWSElasticbeanstalkUpdateApplicationResourceLifecycleMessage : AWSRequest


/**
 <p>The name of the application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>The lifecycle configuration.</p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkApplicationResourceLifecycleConfig * _Nullable resourceLifecycleConfig;

@end

/**
 <p/>
 Required parameters: [ApplicationName, VersionLabel]
 */
@interface AWSElasticbeanstalkUpdateApplicationVersionMessage : AWSRequest


/**
 <p>The name of the application associated with this version.</p><p> If no application is found with this name, <code>UpdateApplication</code> returns an <code>InvalidParameterValue</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>A new description for this version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the version to update.</p><p>If no application version is found with this label, <code>UpdateApplication</code> returns an <code>InvalidParameterValue</code> error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable versionLabel;

@end

/**
 <p>The result message containing the options for the specified solution stack.</p>
 Required parameters: [ApplicationName, TemplateName]
 */
@interface AWSElasticbeanstalkUpdateConfigurationTemplateMessage : AWSRequest


/**
 <p>The name of the application associated with the configuration template to update.</p><p> If no application is found with this name, <code>UpdateConfigurationTemplate</code> returns an <code>InvalidParameterValue</code> error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>A new description for the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A list of configuration option settings to update with the new specified option value.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkConfigurationOptionSetting *> * _Nullable optionSettings;

/**
 <p>A list of configuration options to remove from the configuration set.</p><p> Constraint: You can remove only <code>UserDefined</code> configuration options. </p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkOptionSpecification *> * _Nullable optionsToRemove;

/**
 <p>The name of the configuration template to update.</p><p> If no configuration template is found with this name, <code>UpdateConfigurationTemplate</code> returns an <code>InvalidParameterValue</code> error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

@end

/**
 <p>Request to update an environment.</p>
 */
@interface AWSElasticbeanstalkUpdateEnvironmentMessage : AWSRequest


/**
 <p>The name of the application with which the environment is associated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>If this parameter is specified, AWS Elastic Beanstalk updates the description of this environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID of the environment to update.</p><p>If no environment with this ID exists, AWS Elastic Beanstalk returns an <code>InvalidParameterValue</code> error.</p><p>Condition: You must specify either this or an EnvironmentName, or both. If you do not specify either, AWS Elastic Beanstalk returns <code>MissingRequiredParameter</code> error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentId;

/**
 <p>The name of the environment to update. If no environment with this name exists, AWS Elastic Beanstalk returns an <code>InvalidParameterValue</code> error. </p><p>Condition: You must specify either this or an EnvironmentId, or both. If you do not specify either, AWS Elastic Beanstalk returns <code>MissingRequiredParameter</code> error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

/**
 <p>The name of the group to which the target environment belongs. Specify a group name only if the environment's name is specified in an environment manifest and not with the environment name or environment ID parameters. See <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-cfg-manifest.html">Environment Manifest (env.yaml)</a> for details.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>If specified, AWS Elastic Beanstalk updates the configuration set associated with the running environment and sets the specified configuration options to the requested value.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkConfigurationOptionSetting *> * _Nullable optionSettings;

/**
 <p>A list of custom user-defined configuration options to remove from the configuration set for this environment.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkOptionSpecification *> * _Nullable optionsToRemove;

/**
 <p>The ARN of the platform, if used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformArn;

/**
 <p>This specifies the platform version that the environment will run after the environment is updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionStackName;

/**
 <p>If this parameter is specified, AWS Elastic Beanstalk deploys this configuration template to the environment. If no such configuration template is found, AWS Elastic Beanstalk returns an <code>InvalidParameterValue</code> error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>This specifies the tier to use to update the environment.</p><p>Condition: At this time, if you change the tier version, name, or type, AWS Elastic Beanstalk returns <code>InvalidParameterValue</code> error. </p>
 */
@property (nonatomic, strong) AWSElasticbeanstalkEnvironmentTier * _Nullable tier;

/**
 <p>If this parameter is specified, AWS Elastic Beanstalk deploys the named application version to the environment. If no such application version is found, returns an <code>InvalidParameterValue</code> error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable versionLabel;

@end

/**
 
 */
@interface AWSElasticbeanstalkUpdateTagsForResourceMessage : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resouce to be updated.</p><p>Must be the ARN of an Elastic Beanstalk resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>A list of tags to add or update. If a key of an existing tag is added, the tag's value is updated.</p><p>Specify at least one of these parameters: <code>TagsToAdd</code>, <code>TagsToRemove</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkTag *> * _Nullable tagsToAdd;

/**
 <p>A list of tag keys to remove. If a tag key doesn't exist, it is silently ignored.</p><p>Specify at least one of these parameters: <code>TagsToAdd</code>, <code>TagsToRemove</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagsToRemove;

@end

/**
 <p>A list of validation messages for a specified configuration template.</p>
 Required parameters: [ApplicationName, OptionSettings]
 */
@interface AWSElasticbeanstalkValidateConfigurationSettingsMessage : AWSRequest


/**
 <p>The name of the application that the configuration template or environment belongs to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>The name of the environment to validate the settings against.</p><p>Condition: You cannot specify both this and a configuration template name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

/**
 <p>A list of the options and desired values to evaluate.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticbeanstalkConfigurationOptionSetting *> * _Nullable optionSettings;

/**
 <p>The name of the configuration template to validate the settings against.</p><p>Condition: You cannot specify both this and an environment name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

@end

/**
 <p>An error or warning for a desired configuration option value.</p>
 */
@interface AWSElasticbeanstalkValidationMessage : AWSModel


/**
 <p>A message describing the error or warning.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The namespace to which the option belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>The name of the option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionName;

/**
 <p>An indication of the severity of this message:</p><ul><li><p><code>error</code>: This message indicates that this is not a valid setting for an option.</p></li><li><p><code>warning</code>: This message is providing information you should take into account.</p></li></ul>
 */
@property (nonatomic, assign) AWSElasticbeanstalkValidationSeverity severity;

@end

NS_ASSUME_NONNULL_END
