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

FOUNDATION_EXPORT NSString *const AWSAppConfigErrorDomain;

typedef NS_ENUM(NSInteger, AWSAppConfigErrorType) {
    AWSAppConfigErrorUnknown,
    AWSAppConfigErrorBadRequest,
    AWSAppConfigErrorConflict,
    AWSAppConfigErrorInternalServer,
    AWSAppConfigErrorResourceNotFound,
};

typedef NS_ENUM(NSInteger, AWSAppConfigDeploymentEventType) {
    AWSAppConfigDeploymentEventTypeUnknown,
    AWSAppConfigDeploymentEventTypePercentageUpdated,
    AWSAppConfigDeploymentEventTypeRollbackStarted,
    AWSAppConfigDeploymentEventTypeRollbackCompleted,
    AWSAppConfigDeploymentEventTypeBakeTimeStarted,
    AWSAppConfigDeploymentEventTypeDeploymentStarted,
    AWSAppConfigDeploymentEventTypeDeploymentCompleted,
};

typedef NS_ENUM(NSInteger, AWSAppConfigDeploymentState) {
    AWSAppConfigDeploymentStateUnknown,
    AWSAppConfigDeploymentStateBaking,
    AWSAppConfigDeploymentStateValidating,
    AWSAppConfigDeploymentStateDeploying,
    AWSAppConfigDeploymentStateComplete,
    AWSAppConfigDeploymentStateRollingBack,
    AWSAppConfigDeploymentStateRolledBack,
};

typedef NS_ENUM(NSInteger, AWSAppConfigEnvironmentState) {
    AWSAppConfigEnvironmentStateUnknown,
    AWSAppConfigEnvironmentStateReadyForDeployment,
    AWSAppConfigEnvironmentStateDeploying,
    AWSAppConfigEnvironmentStateRollingBack,
    AWSAppConfigEnvironmentStateRolledBack,
};

typedef NS_ENUM(NSInteger, AWSAppConfigGrowthType) {
    AWSAppConfigGrowthTypeUnknown,
    AWSAppConfigGrowthTypeLinear,
    AWSAppConfigGrowthTypeExponential,
};

typedef NS_ENUM(NSInteger, AWSAppConfigReplicateTo) {
    AWSAppConfigReplicateToUnknown,
    AWSAppConfigReplicateToNone,
    AWSAppConfigReplicateToSsmDocument,
};

typedef NS_ENUM(NSInteger, AWSAppConfigTriggeredBy) {
    AWSAppConfigTriggeredByUnknown,
    AWSAppConfigTriggeredByUser,
    AWSAppConfigTriggeredByAppconfig,
    AWSAppConfigTriggeredByCloudwatchAlarm,
    AWSAppConfigTriggeredByInternalError,
};

typedef NS_ENUM(NSInteger, AWSAppConfigValidatorType) {
    AWSAppConfigValidatorTypeUnknown,
    AWSAppConfigValidatorTypeJsonSchema,
    AWSAppConfigValidatorTypeLambda,
};

@class AWSAppConfigApplication;
@class AWSAppConfigApplications;
@class AWSAppConfigConfiguration;
@class AWSAppConfigConfigurationProfile;
@class AWSAppConfigConfigurationProfileSummary;
@class AWSAppConfigConfigurationProfiles;
@class AWSAppConfigCreateApplicationRequest;
@class AWSAppConfigCreateConfigurationProfileRequest;
@class AWSAppConfigCreateDeploymentStrategyRequest;
@class AWSAppConfigCreateEnvironmentRequest;
@class AWSAppConfigDeleteApplicationRequest;
@class AWSAppConfigDeleteConfigurationProfileRequest;
@class AWSAppConfigDeleteDeploymentStrategyRequest;
@class AWSAppConfigDeleteEnvironmentRequest;
@class AWSAppConfigDeployment;
@class AWSAppConfigDeploymentEvent;
@class AWSAppConfigDeploymentStrategies;
@class AWSAppConfigDeploymentStrategy;
@class AWSAppConfigDeploymentSummary;
@class AWSAppConfigDeployments;
@class AWSAppConfigEnvironment;
@class AWSAppConfigEnvironments;
@class AWSAppConfigGetApplicationRequest;
@class AWSAppConfigGetConfigurationProfileRequest;
@class AWSAppConfigGetConfigurationRequest;
@class AWSAppConfigGetDeploymentRequest;
@class AWSAppConfigGetDeploymentStrategyRequest;
@class AWSAppConfigGetEnvironmentRequest;
@class AWSAppConfigListApplicationsRequest;
@class AWSAppConfigListConfigurationProfilesRequest;
@class AWSAppConfigListDeploymentStrategiesRequest;
@class AWSAppConfigListDeploymentsRequest;
@class AWSAppConfigListEnvironmentsRequest;
@class AWSAppConfigListTagsForResourceRequest;
@class AWSAppConfigMonitor;
@class AWSAppConfigResourceTags;
@class AWSAppConfigStartDeploymentRequest;
@class AWSAppConfigStopDeploymentRequest;
@class AWSAppConfigTagResourceRequest;
@class AWSAppConfigUntagResourceRequest;
@class AWSAppConfigUpdateApplicationRequest;
@class AWSAppConfigUpdateConfigurationProfileRequest;
@class AWSAppConfigUpdateDeploymentStrategyRequest;
@class AWSAppConfigUpdateEnvironmentRequest;
@class AWSAppConfigValidateConfigurationRequest;
@class AWSAppConfigValidator;

/**
 
 */
@interface AWSAppConfigApplication : AWSModel


/**
 <p>The description of the application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The application ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The application name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSAppConfigApplications : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppConfigApplication *> * _Nullable items;

/**
 <p>The token for the next set of items to return. Use this token to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAppConfigConfiguration : AWSModel


/**
 <p>The configuration version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationVersion;

/**
 <p>The content of the configuration or the configuration data.</p>
 */
@property (nonatomic, strong) NSData * _Nullable content;

/**
 <p>A standard MIME type describing the format of the configuration content. For more information, see <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17">Content-Type</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

@end

/**
 
 */
@interface AWSAppConfigConfigurationProfile : AWSModel


/**
 <p>The application ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The configuration profile description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The configuration profile ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The URI location of the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable locationUri;

/**
 <p>The name of the configuration profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ARN of an IAM role with permission to access the configuration at the specified LocationUri.</p>
 */
@property (nonatomic, strong) NSString * _Nullable retrievalRoleArn;

/**
 <p>A list of methods for validating the configuration.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppConfigValidator *> * _Nullable validators;

@end

/**
 <p>A summary of a configuration profile.</p>
 */
@interface AWSAppConfigConfigurationProfileSummary : AWSModel


/**
 <p>The application ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The ID of the configuration profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The URI location of the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable locationUri;

/**
 <p>The name of the configuration profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The types of validators in the configuration profile.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable validatorTypes;

@end

/**
 
 */
@interface AWSAppConfigConfigurationProfiles : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppConfigConfigurationProfileSummary *> * _Nullable items;

/**
 <p>The token for the next set of items to return. Use this token to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAppConfigCreateApplicationRequest : AWSRequest


/**
 <p>A description of the application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A name for the application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Metadata to assign to the application. Tags help organize and categorize your AppConfig resources. Each tag consists of a key and an optional value, both of which you define.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSAppConfigCreateConfigurationProfileRequest : AWSRequest


/**
 <p>The application ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>A description of the configuration profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A URI to locate the configuration. You can specify a Systems Manager (SSM) document, an SSM Parameter Store parameter, or an Amazon S3 object. For an SSM document, specify either the document name in the format <code>ssm-document://&lt;Document_name&gt;</code> or the Amazon Resource Name (ARN). For a parameter, specify either the parameter name in the format <code>ssm-parameter://&lt;Parameter_name&gt;</code> or the ARN. For an Amazon S3 object, specify the URI in the following format: <code>s3://&lt;bucket&gt;/&lt;objectKey&gt; </code>. Here is an example: s3://my-bucket/my-app/us-east-1/my-config.json</p>
 */
@property (nonatomic, strong) NSString * _Nullable locationUri;

/**
 <p>A name for the configuration profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ARN of an IAM role with permission to access the configuration at the specified LocationUri.</p>
 */
@property (nonatomic, strong) NSString * _Nullable retrievalRoleArn;

/**
 <p>Metadata to assign to the configuration profile. Tags help organize and categorize your AppConfig resources. Each tag consists of a key and an optional value, both of which you define.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>A list of methods for validating the configuration.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppConfigValidator *> * _Nullable validators;

@end

/**
 
 */
@interface AWSAppConfigCreateDeploymentStrategyRequest : AWSRequest


/**
 <p>Total amount of time for a deployment to last.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deploymentDurationInMinutes;

/**
 <p>A description of the deployment strategy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The amount of time AppConfig monitors for alarms before considering the deployment to be complete and no longer eligible for automatic roll back.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable finalBakeTimeInMinutes;

/**
 <p>The percentage of targets to receive a deployed configuration during each interval.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable growthFactor;

/**
 <p>The algorithm used to define how percentage grows over time. AWS AppConfig supports the following growth types:</p><p><b>Linear</b>: For this type, AppConfig processes the deployment by dividing the total number of targets by the value specified for <code>Step percentage</code>. For example, a linear deployment that uses a <code>Step percentage</code> of 10 deploys the configuration to 10 percent of the hosts. After those deployments are complete, the system deploys the configuration to the next 10 percent. This continues until 100% of the targets have successfully received the configuration.</p><p><b>Exponential</b>: For this type, AppConfig processes the deployment exponentially using the following formula: <code>G*(2^N)</code>. In this formula, <code>G</code> is the growth factor specified by the user and <code>N</code> is the number of steps until the configuration is deployed to all targets. For example, if you specify a growth factor of 2, then the system rolls out the configuration as follows:</p><p><code>2*(2^0)</code></p><p><code>2*(2^1)</code></p><p><code>2*(2^2)</code></p><p>Expressed numerically, the deployment rolls out as follows: 2% of the targets, 4% of the targets, 8% of the targets, and continues until the configuration has been deployed to all targets.</p>
 */
@property (nonatomic, assign) AWSAppConfigGrowthType growthType;

/**
 <p>A name for the deployment strategy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Save the deployment strategy to a Systems Manager (SSM) document.</p>
 */
@property (nonatomic, assign) AWSAppConfigReplicateTo replicateTo;

/**
 <p>Metadata to assign to the deployment strategy. Tags help organize and categorize your AppConfig resources. Each tag consists of a key and an optional value, both of which you define.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSAppConfigCreateEnvironmentRequest : AWSRequest


/**
 <p>The application ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>A description of the environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Amazon CloudWatch alarms to monitor during the deployment process.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppConfigMonitor *> * _Nullable monitors;

/**
 <p>A name for the environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Metadata to assign to the environment. Tags help organize and categorize your AppConfig resources. Each tag consists of a key and an optional value, both of which you define.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSAppConfigDeleteApplicationRequest : AWSRequest


/**
 <p>The ID of the application to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSAppConfigDeleteConfigurationProfileRequest : AWSRequest


/**
 <p>The application ID that includes the configuration profile you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The ID of the configuration profile you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationProfileId;

@end

/**
 
 */
@interface AWSAppConfigDeleteDeploymentStrategyRequest : AWSRequest


/**
 <p>The ID of the deployment strategy you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentStrategyId;

@end

/**
 
 */
@interface AWSAppConfigDeleteEnvironmentRequest : AWSRequest


/**
 <p>The application ID that includes the environment you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The ID of the environment you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentId;

@end

/**
 
 */
@interface AWSAppConfigDeployment : AWSModel


/**
 <p>The ID of the application that was deployed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The time the deployment completed. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable completedAt;

/**
 <p>Information about the source location of the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationLocationUri;

/**
 <p>The name of the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationName;

/**
 <p>The ID of the configuration profile that was deployed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationProfileId;

/**
 <p>The configuration version that was deployed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationVersion;

/**
 <p>Total amount of time the deployment lasted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deploymentDurationInMinutes;

/**
 <p>The sequence number of the deployment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deploymentNumber;

/**
 <p>The ID of the deployment strategy that was deployed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentStrategyId;

/**
 <p>The description of the deployment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID of the environment that was deployed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentId;

/**
 <p>A list containing all events related to a deployment. The most recent events are displayed first.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppConfigDeploymentEvent *> * _Nullable eventLog;

/**
 <p>The amount of time AppConfig monitored for alarms before considering the deployment to be complete and no longer eligible for automatic roll back.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable finalBakeTimeInMinutes;

/**
 <p>The percentage of targets to receive a deployed configuration during each interval.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable growthFactor;

/**
 <p>The algorithm used to define how percentage grew over time.</p>
 */
@property (nonatomic, assign) AWSAppConfigGrowthType growthType;

/**
 <p>The percentage of targets for which the deployment is available.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable percentageComplete;

/**
 <p>The time the deployment started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startedAt;

/**
 <p>The state of the deployment.</p>
 */
@property (nonatomic, assign) AWSAppConfigDeploymentState state;

@end

/**
 <p>An object that describes a deployment event.</p>
 */
@interface AWSAppConfigDeploymentEvent : AWSModel


/**
 <p>A description of the deployment event. Descriptions include, but are not limited to, the user account or the CloudWatch alarm ARN that initiated a rollback, the percentage of hosts that received the deployment, or in the case of an internal error, a recommendation to attempt a new deployment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The type of deployment event. Deployment event types include the start, stop, or completion of a deployment; a percentage update; the start or stop of a bake period; the start or completion of a rollback.</p>
 */
@property (nonatomic, assign) AWSAppConfigDeploymentEventType eventType;

/**
 <p>The date and time the event occurred.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable occurredAt;

/**
 <p>The entity that triggered the deployment event. Events can be triggered by a user, AWS AppConfig, an Amazon CloudWatch alarm, or an internal error.</p>
 */
@property (nonatomic, assign) AWSAppConfigTriggeredBy triggeredBy;

@end

/**
 
 */
@interface AWSAppConfigDeploymentStrategies : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppConfigDeploymentStrategy *> * _Nullable items;

/**
 <p>The token for the next set of items to return. Use this token to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAppConfigDeploymentStrategy : AWSModel


/**
 <p>Total amount of time the deployment lasted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deploymentDurationInMinutes;

/**
 <p>The description of the deployment strategy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The amount of time AppConfig monitored for alarms before considering the deployment to be complete and no longer eligible for automatic roll back.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable finalBakeTimeInMinutes;

/**
 <p>The percentage of targets that received a deployed configuration during each interval.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable growthFactor;

/**
 <p>The algorithm used to define how percentage grew over time.</p>
 */
@property (nonatomic, assign) AWSAppConfigGrowthType growthType;

/**
 <p>The deployment strategy ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the deployment strategy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Save the deployment strategy to a Systems Manager (SSM) document.</p>
 */
@property (nonatomic, assign) AWSAppConfigReplicateTo replicateTo;

@end

/**
 <p>Information about the deployment.</p>
 */
@interface AWSAppConfigDeploymentSummary : AWSModel


/**
 <p>Time the deployment completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completedAt;

/**
 <p>The name of the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationName;

/**
 <p>The version of the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationVersion;

/**
 <p>Total amount of time the deployment lasted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deploymentDurationInMinutes;

/**
 <p>The sequence number of the deployment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deploymentNumber;

/**
 <p>The amount of time AppConfig monitors for alarms before considering the deployment to be complete and no longer eligible for automatic roll back.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable finalBakeTimeInMinutes;

/**
 <p>The percentage of targets to receive a deployed configuration during each interval.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable growthFactor;

/**
 <p>The algorithm used to define how percentage grows over time.</p>
 */
@property (nonatomic, assign) AWSAppConfigGrowthType growthType;

/**
 <p>The percentage of targets for which the deployment is available.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable percentageComplete;

/**
 <p>Time the deployment started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startedAt;

/**
 <p>The state of the deployment.</p>
 */
@property (nonatomic, assign) AWSAppConfigDeploymentState state;

@end

/**
 
 */
@interface AWSAppConfigDeployments : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppConfigDeploymentSummary *> * _Nullable items;

/**
 <p>The token for the next set of items to return. Use this token to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAppConfigEnvironment : AWSModel


/**
 <p>The application ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The description of the environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The environment ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Amazon CloudWatch alarms monitored during the deployment.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppConfigMonitor *> * _Nullable monitors;

/**
 <p>The name of the environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The state of the environment. An environment can be in one of the following states: <code>READY_FOR_DEPLOYMENT</code>, <code>DEPLOYING</code>, <code>ROLLING_BACK</code>, or <code>ROLLED_BACK</code></p>
 */
@property (nonatomic, assign) AWSAppConfigEnvironmentState state;

@end

/**
 
 */
@interface AWSAppConfigEnvironments : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppConfigEnvironment *> * _Nullable items;

/**
 <p>The token for the next set of items to return. Use this token to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAppConfigGetApplicationRequest : AWSRequest


/**
 <p>The ID of the application you want to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSAppConfigGetConfigurationProfileRequest : AWSRequest


/**
 <p>The ID of the application that includes the configuration profile you want to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The ID of the configuration profile you want to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationProfileId;

@end

/**
 
 */
@interface AWSAppConfigGetConfigurationRequest : AWSRequest


/**
 <p>The application to get. Specify either the application name or the application ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable application;

/**
 <p>The configuration version returned in the most recent <code>GetConfiguration</code> response.</p><important><p>AWS AppConfig uses the value of the <code>ClientConfigurationVersion</code> parameter to identify the configuration version on your clients. If you don’t send <code>ClientConfigurationVersion</code> with each call to <code>GetConfiguration</code>, your clients receive the current configuration. You are charged each time your clients receive a configuration.</p><p>To avoid excess charges, we recommend that you include the <code>ClientConfigurationVersion</code> value with every call to <code>GetConfiguration</code>. This value must be saved on your client. Subsequent calls to <code>GetConfiguration</code> must pass this value by using the <code>ClientConfigurationVersion</code> parameter. </p></important><p>For more information about working with configurations, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/appconfig-retrieving-the-configuration.html">Retrieving the Configuration</a> in the <i>AWS AppConfig User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientConfigurationVersion;

/**
 <p>A unique ID to identify the client for the configuration. This ID enables AppConfig to deploy the configuration in intervals, as defined in the deployment strategy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The configuration to get. Specify either the configuration name or the configuration ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configuration;

/**
 <p>The environment to get. Specify either the environment name or the environment ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environment;

@end

/**
 
 */
@interface AWSAppConfigGetDeploymentRequest : AWSRequest


/**
 <p>The ID of the application that includes the deployment you want to get. </p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The sequence number of the deployment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deploymentNumber;

/**
 <p>The ID of the environment that includes the deployment you want to get. </p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentId;

@end

/**
 
 */
@interface AWSAppConfigGetDeploymentStrategyRequest : AWSRequest


/**
 <p>The ID of the deployment strategy to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentStrategyId;

@end

/**
 
 */
@interface AWSAppConfigGetEnvironmentRequest : AWSRequest


/**
 <p>The ID of the application that includes the environment you want to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The ID of the environment you wnat to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentId;

@end

/**
 
 */
@interface AWSAppConfigListApplicationsRequest : AWSRequest


/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to start the list. Use this token to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAppConfigListConfigurationProfilesRequest : AWSRequest


/**
 <p>The application ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to start the list. Use this token to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAppConfigListDeploymentStrategiesRequest : AWSRequest


/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to start the list. Use this token to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAppConfigListDeploymentsRequest : AWSRequest


/**
 <p>The application ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The environment ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentId;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to start the list. Use this token to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAppConfigListEnvironmentsRequest : AWSRequest


/**
 <p>The application ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to start the list. Use this token to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAppConfigListTagsForResourceRequest : AWSRequest


/**
 <p>The resource ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 <p>Amazon CloudWatch alarms to monitor during the deployment process.</p>
 */
@interface AWSAppConfigMonitor : AWSModel


/**
 <p>ARN of the Amazon CloudWatch alarm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmArn;

/**
 <p>ARN of an IAM role for AppConfig to monitor <code>AlarmArn</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmRoleArn;

@end

/**
 
 */
@interface AWSAppConfigResourceTags : AWSModel


/**
 <p>Metadata to assign to AppConfig resources. Tags help organize and categorize your AppConfig resources. Each tag consists of a key and an optional value, both of which you define.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSAppConfigStartDeploymentRequest : AWSRequest


/**
 <p>The application ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The configuration profile ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationProfileId;

/**
 <p>The configuration version to deploy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationVersion;

/**
 <p>The deployment strategy ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentStrategyId;

/**
 <p>A description of the deployment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The environment ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentId;

/**
 <p>Metadata to assign to the deployment. Tags help organize and categorize your AppConfig resources. Each tag consists of a key and an optional value, both of which you define.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSAppConfigStopDeploymentRequest : AWSRequest


/**
 <p>The application ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The sequence number of the deployment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deploymentNumber;

/**
 <p>The environment ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentId;

@end

/**
 
 */
@interface AWSAppConfigTagResourceRequest : AWSRequest


/**
 <p>The ARN of the resource for which to retrieve tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The key-value string map. The valid character set is [a-zA-Z+-=._:/]. The tag key can be up to 128 characters and must not start with <code>aws:</code>. The tag value can be up to 256 characters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSAppConfigUntagResourceRequest : AWSRequest


/**
 <p>The ARN of the resource for which to remove tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tag keys to delete.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSAppConfigUpdateApplicationRequest : AWSRequest


/**
 <p>The application ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>A description of the application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSAppConfigUpdateConfigurationProfileRequest : AWSRequest


/**
 <p>The application ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The ID of the configuration profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationProfileId;

/**
 <p>A description of the configuration profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the configuration profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ARN of an IAM role with permission to access the configuration at the specified LocationUri.</p>
 */
@property (nonatomic, strong) NSString * _Nullable retrievalRoleArn;

/**
 <p>A list of methods for validating the configuration.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppConfigValidator *> * _Nullable validators;

@end

/**
 
 */
@interface AWSAppConfigUpdateDeploymentStrategyRequest : AWSRequest


/**
 <p>Total amount of time for a deployment to last.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deploymentDurationInMinutes;

/**
 <p>The deployment strategy ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentStrategyId;

/**
 <p>A description of the deployment strategy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The amount of time AppConfig monitors for alarms before considering the deployment to be complete and no longer eligible for automatic roll back.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable finalBakeTimeInMinutes;

/**
 <p>The percentage of targets to receive a deployed configuration during each interval.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable growthFactor;

/**
 <p>The algorithm used to define how percentage grows over time. AWS AppConfig supports the following growth types:</p><p><b>Linear</b>: For this type, AppConfig processes the deployment by increments of the growth factor evenly distributed over the deployment time. For example, a linear deployment that uses a growth factor of 20 initially makes the configuration available to 20 percent of the targets. After 1/5th of the deployment time has passed, the system updates the percentage to 40 percent. This continues until 100% of the targets are set to receive the deployed configuration.</p><p><b>Exponential</b>: For this type, AppConfig processes the deployment exponentially using the following formula: <code>G*(2^N)</code>. In this formula, <code>G</code> is the growth factor specified by the user and <code>N</code> is the number of steps until the configuration is deployed to all targets. For example, if you specify a growth factor of 2, then the system rolls out the configuration as follows:</p><p><code>2*(2^0)</code></p><p><code>2*(2^1)</code></p><p><code>2*(2^2)</code></p><p>Expressed numerically, the deployment rolls out as follows: 2% of the targets, 4% of the targets, 8% of the targets, and continues until the configuration has been deployed to all targets.</p>
 */
@property (nonatomic, assign) AWSAppConfigGrowthType growthType;

@end

/**
 
 */
@interface AWSAppConfigUpdateEnvironmentRequest : AWSRequest


/**
 <p>The application ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>A description of the environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The environment ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentId;

/**
 <p>Amazon CloudWatch alarms to monitor during the deployment process.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppConfigMonitor *> * _Nullable monitors;

/**
 <p>The name of the environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSAppConfigValidateConfigurationRequest : AWSRequest


/**
 <p>The application ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The configuration profile ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationProfileId;

/**
 <p>The version of the configuration to validate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationVersion;

@end

/**
 <p>A validator provides a syntactic or semantic check to ensure the configuration you want to deploy functions as intended. To validate your application configuration data, you provide a schema or a Lambda function that runs against the configuration. The configuration deployment or update can only proceed when the configuration data is valid.</p>
 Required parameters: [Type, Content]
 */
@interface AWSAppConfigValidator : AWSModel


/**
 <p>Either the JSON Schema content or the Amazon Resource Name (ARN) of an AWS Lambda function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>AppConfig supports validators of type <code>JSON_SCHEMA</code> and <code>LAMBDA</code></p>
 */
@property (nonatomic, assign) AWSAppConfigValidatorType types;

@end

NS_ASSUME_NONNULL_END
