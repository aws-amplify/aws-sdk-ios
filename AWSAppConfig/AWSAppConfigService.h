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
#import <AWSCore/AWSCore.h>
#import "AWSAppConfigModel.h"
#import "AWSAppConfigResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSAppConfig
FOUNDATION_EXPORT NSString *const AWSAppConfigSDKVersion;

/**
 <fullname>AWS AppConfig</fullname><p>Use AWS AppConfig, a capability of AWS Systems Manager, to create, manage, and quickly deploy application configurations. AppConfig supports controlled deployments to applications of any size and includes built-in validation checks and monitoring. You can use AppConfig with applications hosted on Amazon EC2 instances, AWS Lambda, containers, mobile applications, or IoT devices.</p><p>To prevent errors when deploying application configurations, especially for production systems where a simple typo could cause an unexpected outage, AppConfig includes validators. A validator provides a syntactic or semantic check to ensure that the configuration you want to deploy works as intended. To validate your application configuration data, you provide a schema or a Lambda function that runs against the configuration. The configuration deployment or update can only proceed when the configuration data is valid.</p><p>During a configuration deployment, AppConfig monitors the application to ensure that the deployment is successful. If the system encounters an error, AppConfig rolls back the change to minimize impact for your application users. You can configure a deployment strategy for each application or environment that includes deployment criteria, including velocity, bake time, and alarms to monitor. Similar to error monitoring, if a deployment triggers an alarm, AppConfig automatically rolls back to the previous version. </p><p>AppConfig supports multiple use cases. Here are some examples.</p><ul><li><p><b>Application tuning</b>: Use AppConfig to carefully introduce changes to your application that can only be tested with production traffic.</p></li><li><p><b>Feature toggle</b>: Use AppConfig to turn on new features that require a timely deployment, such as a product launch or announcement. </p></li><li><p><b>User membership</b>: Use AppConfig to allow premium subscribers to access paid content. </p></li><li><p><b>Operational issues</b>: Use AppConfig to reduce stress on your application when a dependency or other external factor impacts the system.</p></li></ul><p>This reference is intended to be used with the <a href="http://docs.aws.amazon.com/systems-manager/latest/userguide/appconfig.html">AWS AppConfig User Guide</a>.</p>
 */
@interface AWSAppConfig : AWSService

/**
 The service configuration used to instantiate this service client.
 
 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 */
@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

/**
 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`
 
 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
          AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                          identityPoolId:@"YourIdentityPoolId"];
          AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
          [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;

          return YES;
      }

 Then call the following to get the default service client:

 *Swift*

     let AppConfig = AWSAppConfig.default()

 *Objective-C*

     AWSAppConfig *AppConfig = [AWSAppConfig defaultAppConfig];

 @return The default service client.
 */
+ (instancetype)defaultAppConfig;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSAppConfig.register(with: configuration!, forKey: "USWest2AppConfig")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSAppConfig registerAppConfigWithConfiguration:configuration forKey:@"USWest2AppConfig"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let AppConfig = AWSAppConfig(forKey: "USWest2AppConfig")

 *Objective-C*

     AWSAppConfig *AppConfig = [AWSAppConfig AppConfigForKey:@"USWest2AppConfig"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerAppConfigWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerAppConfigWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSAppConfig.register(with: configuration!, forKey: "USWest2AppConfig")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSAppConfig registerAppConfigWithConfiguration:configuration forKey:@"USWest2AppConfig"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let AppConfig = AWSAppConfig(forKey: "USWest2AppConfig")

 *Objective-C*

     AWSAppConfig *AppConfig = [AWSAppConfig AppConfigForKey:@"USWest2AppConfig"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)AppConfigForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeAppConfigForKey:(NSString *)key;

/**
 <p>An application in AppConfig is a logical unit of code that provides capabilities for your customers. For example, an application can be a microservice that runs on Amazon EC2 instances, a mobile application installed by your users, a serverless application using Amazon API Gateway and AWS Lambda, or any system you run on behalf of others.</p>
 
 @param request A container for the necessary parameters to execute the CreateApplication service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppConfigApplication`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorBadRequest`, `AWSAppConfigErrorInternalServer`.
 
 @see AWSAppConfigCreateApplicationRequest
 @see AWSAppConfigApplication
 */
- (AWSTask<AWSAppConfigApplication *> *)createApplication:(AWSAppConfigCreateApplicationRequest *)request;

/**
 <p>An application in AppConfig is a logical unit of code that provides capabilities for your customers. For example, an application can be a microservice that runs on Amazon EC2 instances, a mobile application installed by your users, a serverless application using Amazon API Gateway and AWS Lambda, or any system you run on behalf of others.</p>
 
 @param request A container for the necessary parameters to execute the CreateApplication service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorBadRequest`, `AWSAppConfigErrorInternalServer`.
 
 @see AWSAppConfigCreateApplicationRequest
 @see AWSAppConfigApplication
 */
- (void)createApplication:(AWSAppConfigCreateApplicationRequest *)request completionHandler:(void (^ _Nullable)(AWSAppConfigApplication * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Information that enables AppConfig to access the configuration source. Valid configuration sources include Systems Manager (SSM) documents, SSM Parameter Store parameters, and Amazon S3 objects. A configuration profile includes the following information.</p><ul><li><p>The Uri location of the configuration data.</p></li><li><p>The AWS Identity and Access Management (IAM) role that provides access to the configuration data.</p></li><li><p>A validator for the configuration data. Available validators include either a JSON Schema or an AWS Lambda function.</p></li></ul><p>For more information, see <a href="http://docs.aws.amazon.com/systems-manager/latest/userguide/appconfig-creating-configuration-and-profile.html">Create a Configuration and a Configuration Profile</a> in the <i>AWS AppConfig User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateConfigurationProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppConfigConfigurationProfile`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorBadRequest`, `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`.
 
 @see AWSAppConfigCreateConfigurationProfileRequest
 @see AWSAppConfigConfigurationProfile
 */
- (AWSTask<AWSAppConfigConfigurationProfile *> *)createConfigurationProfile:(AWSAppConfigCreateConfigurationProfileRequest *)request;

/**
 <p>Information that enables AppConfig to access the configuration source. Valid configuration sources include Systems Manager (SSM) documents, SSM Parameter Store parameters, and Amazon S3 objects. A configuration profile includes the following information.</p><ul><li><p>The Uri location of the configuration data.</p></li><li><p>The AWS Identity and Access Management (IAM) role that provides access to the configuration data.</p></li><li><p>A validator for the configuration data. Available validators include either a JSON Schema or an AWS Lambda function.</p></li></ul><p>For more information, see <a href="http://docs.aws.amazon.com/systems-manager/latest/userguide/appconfig-creating-configuration-and-profile.html">Create a Configuration and a Configuration Profile</a> in the <i>AWS AppConfig User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateConfigurationProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorBadRequest`, `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`.
 
 @see AWSAppConfigCreateConfigurationProfileRequest
 @see AWSAppConfigConfigurationProfile
 */
- (void)createConfigurationProfile:(AWSAppConfigCreateConfigurationProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSAppConfigConfigurationProfile * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>A deployment strategy defines important criteria for rolling out your configuration to the designated targets. A deployment strategy includes: the overall duration required, a percentage of targets to receive the deployment during each interval, an algorithm that defines how percentage grows, and bake time.</p>
 
 @param request A container for the necessary parameters to execute the CreateDeploymentStrategy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppConfigDeploymentStrategy`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigCreateDeploymentStrategyRequest
 @see AWSAppConfigDeploymentStrategy
 */
- (AWSTask<AWSAppConfigDeploymentStrategy *> *)createDeploymentStrategy:(AWSAppConfigCreateDeploymentStrategyRequest *)request;

/**
 <p>A deployment strategy defines important criteria for rolling out your configuration to the designated targets. A deployment strategy includes: the overall duration required, a percentage of targets to receive the deployment during each interval, an algorithm that defines how percentage grows, and bake time.</p>
 
 @param request A container for the necessary parameters to execute the CreateDeploymentStrategy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigCreateDeploymentStrategyRequest
 @see AWSAppConfigDeploymentStrategy
 */
- (void)createDeploymentStrategy:(AWSAppConfigCreateDeploymentStrategyRequest *)request completionHandler:(void (^ _Nullable)(AWSAppConfigDeploymentStrategy * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>For each application, you define one or more environments. An environment is a logical deployment group of AppConfig targets, such as applications in a <code>Beta</code> or <code>Production</code> environment. You can also define environments for application subcomponents such as the <code>Web</code>, <code>Mobile</code> and <code>Back-end</code> components for your application. You can configure Amazon CloudWatch alarms for each environment. The system monitors alarms during a configuration deployment. If an alarm is triggered, the system rolls back the configuration.</p>
 
 @param request A container for the necessary parameters to execute the CreateEnvironment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppConfigEnvironment`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigCreateEnvironmentRequest
 @see AWSAppConfigEnvironment
 */
- (AWSTask<AWSAppConfigEnvironment *> *)createEnvironment:(AWSAppConfigCreateEnvironmentRequest *)request;

/**
 <p>For each application, you define one or more environments. An environment is a logical deployment group of AppConfig targets, such as applications in a <code>Beta</code> or <code>Production</code> environment. You can also define environments for application subcomponents such as the <code>Web</code>, <code>Mobile</code> and <code>Back-end</code> components for your application. You can configure Amazon CloudWatch alarms for each environment. The system monitors alarms during a configuration deployment. If an alarm is triggered, the system rolls back the configuration.</p>
 
 @param request A container for the necessary parameters to execute the CreateEnvironment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigCreateEnvironmentRequest
 @see AWSAppConfigEnvironment
 */
- (void)createEnvironment:(AWSAppConfigCreateEnvironmentRequest *)request completionHandler:(void (^ _Nullable)(AWSAppConfigEnvironment * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Delete an application. Deleting an application does not delete a configuration from a host.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApplication service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigDeleteApplicationRequest
 */
- (AWSTask *)deleteApplication:(AWSAppConfigDeleteApplicationRequest *)request;

/**
 <p>Delete an application. Deleting an application does not delete a configuration from a host.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApplication service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigDeleteApplicationRequest
 */
- (void)deleteApplication:(AWSAppConfigDeleteApplicationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Delete a configuration profile. Deleting a configuration profile does not delete a configuration from a host.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConfigurationProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorConflict`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigDeleteConfigurationProfileRequest
 */
- (AWSTask *)deleteConfigurationProfile:(AWSAppConfigDeleteConfigurationProfileRequest *)request;

/**
 <p>Delete a configuration profile. Deleting a configuration profile does not delete a configuration from a host.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConfigurationProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorConflict`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigDeleteConfigurationProfileRequest
 */
- (void)deleteConfigurationProfile:(AWSAppConfigDeleteConfigurationProfileRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Delete a deployment strategy. Deleting a deployment strategy does not delete a configuration from a host.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDeploymentStrategy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigDeleteDeploymentStrategyRequest
 */
- (AWSTask *)deleteDeploymentStrategy:(AWSAppConfigDeleteDeploymentStrategyRequest *)request;

/**
 <p>Delete a deployment strategy. Deleting a deployment strategy does not delete a configuration from a host.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDeploymentStrategy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigDeleteDeploymentStrategyRequest
 */
- (void)deleteDeploymentStrategy:(AWSAppConfigDeleteDeploymentStrategyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Delete an environment. Deleting an environment does not delete a configuration from a host.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEnvironment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorConflict`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigDeleteEnvironmentRequest
 */
- (AWSTask *)deleteEnvironment:(AWSAppConfigDeleteEnvironmentRequest *)request;

/**
 <p>Delete an environment. Deleting an environment does not delete a configuration from a host.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEnvironment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorConflict`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigDeleteEnvironmentRequest
 */
- (void)deleteEnvironment:(AWSAppConfigDeleteEnvironmentRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve information about an application.</p>
 
 @param request A container for the necessary parameters to execute the GetApplication service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppConfigApplication`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigGetApplicationRequest
 @see AWSAppConfigApplication
 */
- (AWSTask<AWSAppConfigApplication *> *)getApplication:(AWSAppConfigGetApplicationRequest *)request;

/**
 <p>Retrieve information about an application.</p>
 
 @param request A container for the necessary parameters to execute the GetApplication service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigGetApplicationRequest
 @see AWSAppConfigApplication
 */
- (void)getApplication:(AWSAppConfigGetApplicationRequest *)request completionHandler:(void (^ _Nullable)(AWSAppConfigApplication * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Receive information about a configuration.</p><important><p>AWS AppConfig uses the value of the <code>ClientConfigurationVersion</code> parameter to identify the configuration version on your clients. If you don’t send <code>ClientConfigurationVersion</code> with each call to <code>GetConfiguration</code>, your clients receive the current configuration. You are charged each time your clients receive a configuration.</p><p>To avoid excess charges, we recommend that you include the <code>ClientConfigurationVersion</code> value with every call to <code>GetConfiguration</code>. This value must be saved on your client. Subsequent calls to <code>GetConfiguration</code> must pass this value by using the <code>ClientConfigurationVersion</code> parameter. </p></important>
 
 @param request A container for the necessary parameters to execute the GetConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppConfigConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigGetConfigurationRequest
 @see AWSAppConfigConfiguration
 */
- (AWSTask<AWSAppConfigConfiguration *> *)getConfiguration:(AWSAppConfigGetConfigurationRequest *)request;

/**
 <p>Receive information about a configuration.</p><important><p>AWS AppConfig uses the value of the <code>ClientConfigurationVersion</code> parameter to identify the configuration version on your clients. If you don’t send <code>ClientConfigurationVersion</code> with each call to <code>GetConfiguration</code>, your clients receive the current configuration. You are charged each time your clients receive a configuration.</p><p>To avoid excess charges, we recommend that you include the <code>ClientConfigurationVersion</code> value with every call to <code>GetConfiguration</code>. This value must be saved on your client. Subsequent calls to <code>GetConfiguration</code> must pass this value by using the <code>ClientConfigurationVersion</code> parameter. </p></important>
 
 @param request A container for the necessary parameters to execute the GetConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigGetConfigurationRequest
 @see AWSAppConfigConfiguration
 */
- (void)getConfiguration:(AWSAppConfigGetConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSAppConfigConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve information about a configuration profile.</p>
 
 @param request A container for the necessary parameters to execute the GetConfigurationProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppConfigConfigurationProfile`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigGetConfigurationProfileRequest
 @see AWSAppConfigConfigurationProfile
 */
- (AWSTask<AWSAppConfigConfigurationProfile *> *)getConfigurationProfile:(AWSAppConfigGetConfigurationProfileRequest *)request;

/**
 <p>Retrieve information about a configuration profile.</p>
 
 @param request A container for the necessary parameters to execute the GetConfigurationProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigGetConfigurationProfileRequest
 @see AWSAppConfigConfigurationProfile
 */
- (void)getConfigurationProfile:(AWSAppConfigGetConfigurationProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSAppConfigConfigurationProfile * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve information about a configuration deployment.</p>
 
 @param request A container for the necessary parameters to execute the GetDeployment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppConfigDeployment`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigGetDeploymentRequest
 @see AWSAppConfigDeployment
 */
- (AWSTask<AWSAppConfigDeployment *> *)getDeployment:(AWSAppConfigGetDeploymentRequest *)request;

/**
 <p>Retrieve information about a configuration deployment.</p>
 
 @param request A container for the necessary parameters to execute the GetDeployment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigGetDeploymentRequest
 @see AWSAppConfigDeployment
 */
- (void)getDeployment:(AWSAppConfigGetDeploymentRequest *)request completionHandler:(void (^ _Nullable)(AWSAppConfigDeployment * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve information about a deployment strategy. A deployment strategy defines important criteria for rolling out your configuration to the designated targets. A deployment strategy includes: the overall duration required, a percentage of targets to receive the deployment during each interval, an algorithm that defines how percentage grows, and bake time.</p>
 
 @param request A container for the necessary parameters to execute the GetDeploymentStrategy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppConfigDeploymentStrategy`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigGetDeploymentStrategyRequest
 @see AWSAppConfigDeploymentStrategy
 */
- (AWSTask<AWSAppConfigDeploymentStrategy *> *)getDeploymentStrategy:(AWSAppConfigGetDeploymentStrategyRequest *)request;

/**
 <p>Retrieve information about a deployment strategy. A deployment strategy defines important criteria for rolling out your configuration to the designated targets. A deployment strategy includes: the overall duration required, a percentage of targets to receive the deployment during each interval, an algorithm that defines how percentage grows, and bake time.</p>
 
 @param request A container for the necessary parameters to execute the GetDeploymentStrategy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigGetDeploymentStrategyRequest
 @see AWSAppConfigDeploymentStrategy
 */
- (void)getDeploymentStrategy:(AWSAppConfigGetDeploymentStrategyRequest *)request completionHandler:(void (^ _Nullable)(AWSAppConfigDeploymentStrategy * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve information about an environment. An environment is a logical deployment group of AppConfig applications, such as applications in a <code>Production</code> environment or in an <code>EU_Region</code> environment. Each configuration deployment targets an environment. You can enable one or more Amazon CloudWatch alarms for an environment. If an alarm is triggered during a deployment, AppConfig roles back the configuration.</p>
 
 @param request A container for the necessary parameters to execute the GetEnvironment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppConfigEnvironment`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigGetEnvironmentRequest
 @see AWSAppConfigEnvironment
 */
- (AWSTask<AWSAppConfigEnvironment *> *)getEnvironment:(AWSAppConfigGetEnvironmentRequest *)request;

/**
 <p>Retrieve information about an environment. An environment is a logical deployment group of AppConfig applications, such as applications in a <code>Production</code> environment or in an <code>EU_Region</code> environment. Each configuration deployment targets an environment. You can enable one or more Amazon CloudWatch alarms for an environment. If an alarm is triggered during a deployment, AppConfig roles back the configuration.</p>
 
 @param request A container for the necessary parameters to execute the GetEnvironment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigGetEnvironmentRequest
 @see AWSAppConfigEnvironment
 */
- (void)getEnvironment:(AWSAppConfigGetEnvironmentRequest *)request completionHandler:(void (^ _Nullable)(AWSAppConfigEnvironment * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List all applications in your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListApplications service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppConfigApplications`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigListApplicationsRequest
 @see AWSAppConfigApplications
 */
- (AWSTask<AWSAppConfigApplications *> *)listApplications:(AWSAppConfigListApplicationsRequest *)request;

/**
 <p>List all applications in your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListApplications service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigListApplicationsRequest
 @see AWSAppConfigApplications
 */
- (void)listApplications:(AWSAppConfigListApplicationsRequest *)request completionHandler:(void (^ _Nullable)(AWSAppConfigApplications * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the configuration profiles for an application.</p>
 
 @param request A container for the necessary parameters to execute the ListConfigurationProfiles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppConfigConfigurationProfiles`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigListConfigurationProfilesRequest
 @see AWSAppConfigConfigurationProfiles
 */
- (AWSTask<AWSAppConfigConfigurationProfiles *> *)listConfigurationProfiles:(AWSAppConfigListConfigurationProfilesRequest *)request;

/**
 <p>Lists the configuration profiles for an application.</p>
 
 @param request A container for the necessary parameters to execute the ListConfigurationProfiles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigListConfigurationProfilesRequest
 @see AWSAppConfigConfigurationProfiles
 */
- (void)listConfigurationProfiles:(AWSAppConfigListConfigurationProfilesRequest *)request completionHandler:(void (^ _Nullable)(AWSAppConfigConfigurationProfiles * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List deployment strategies.</p>
 
 @param request A container for the necessary parameters to execute the ListDeploymentStrategies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppConfigDeploymentStrategies`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigListDeploymentStrategiesRequest
 @see AWSAppConfigDeploymentStrategies
 */
- (AWSTask<AWSAppConfigDeploymentStrategies *> *)listDeploymentStrategies:(AWSAppConfigListDeploymentStrategiesRequest *)request;

/**
 <p>List deployment strategies.</p>
 
 @param request A container for the necessary parameters to execute the ListDeploymentStrategies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigListDeploymentStrategiesRequest
 @see AWSAppConfigDeploymentStrategies
 */
- (void)listDeploymentStrategies:(AWSAppConfigListDeploymentStrategiesRequest *)request completionHandler:(void (^ _Nullable)(AWSAppConfigDeploymentStrategies * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the deployments for an environment.</p>
 
 @param request A container for the necessary parameters to execute the ListDeployments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppConfigDeployments`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigListDeploymentsRequest
 @see AWSAppConfigDeployments
 */
- (AWSTask<AWSAppConfigDeployments *> *)listDeployments:(AWSAppConfigListDeploymentsRequest *)request;

/**
 <p>Lists the deployments for an environment.</p>
 
 @param request A container for the necessary parameters to execute the ListDeployments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigListDeploymentsRequest
 @see AWSAppConfigDeployments
 */
- (void)listDeployments:(AWSAppConfigListDeploymentsRequest *)request completionHandler:(void (^ _Nullable)(AWSAppConfigDeployments * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List the environments for an application.</p>
 
 @param request A container for the necessary parameters to execute the ListEnvironments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppConfigEnvironments`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigListEnvironmentsRequest
 @see AWSAppConfigEnvironments
 */
- (AWSTask<AWSAppConfigEnvironments *> *)listEnvironments:(AWSAppConfigListEnvironmentsRequest *)request;

/**
 <p>List the environments for an application.</p>
 
 @param request A container for the necessary parameters to execute the ListEnvironments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigListEnvironmentsRequest
 @see AWSAppConfigEnvironments
 */
- (void)listEnvironments:(AWSAppConfigListEnvironmentsRequest *)request completionHandler:(void (^ _Nullable)(AWSAppConfigEnvironments * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the list of key-value tags assigned to the resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppConfigResourceTags`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorBadRequest`, `AWSAppConfigErrorInternalServer`.
 
 @see AWSAppConfigListTagsForResourceRequest
 @see AWSAppConfigResourceTags
 */
- (AWSTask<AWSAppConfigResourceTags *> *)listTagsForResource:(AWSAppConfigListTagsForResourceRequest *)request;

/**
 <p>Retrieves the list of key-value tags assigned to the resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorBadRequest`, `AWSAppConfigErrorInternalServer`.
 
 @see AWSAppConfigListTagsForResourceRequest
 @see AWSAppConfigResourceTags
 */
- (void)listTagsForResource:(AWSAppConfigListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSAppConfigResourceTags * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a deployment.</p>
 
 @param request A container for the necessary parameters to execute the StartDeployment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppConfigDeployment`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorBadRequest`, `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorConflict`, `AWSAppConfigErrorInternalServer`.
 
 @see AWSAppConfigStartDeploymentRequest
 @see AWSAppConfigDeployment
 */
- (AWSTask<AWSAppConfigDeployment *> *)startDeployment:(AWSAppConfigStartDeploymentRequest *)request;

/**
 <p>Starts a deployment.</p>
 
 @param request A container for the necessary parameters to execute the StartDeployment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorBadRequest`, `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorConflict`, `AWSAppConfigErrorInternalServer`.
 
 @see AWSAppConfigStartDeploymentRequest
 @see AWSAppConfigDeployment
 */
- (void)startDeployment:(AWSAppConfigStartDeploymentRequest *)request completionHandler:(void (^ _Nullable)(AWSAppConfigDeployment * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops a deployment. This API action works only on deployments that have a status of <code>DEPLOYING</code>. This action moves the deployment to a status of <code>ROLLED_BACK</code>.</p>
 
 @param request A container for the necessary parameters to execute the StopDeployment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppConfigDeployment`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigStopDeploymentRequest
 @see AWSAppConfigDeployment
 */
- (AWSTask<AWSAppConfigDeployment *> *)stopDeployment:(AWSAppConfigStopDeploymentRequest *)request;

/**
 <p>Stops a deployment. This API action works only on deployments that have a status of <code>DEPLOYING</code>. This action moves the deployment to a status of <code>ROLLED_BACK</code>.</p>
 
 @param request A container for the necessary parameters to execute the StopDeployment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`, `AWSAppConfigErrorBadRequest`.
 
 @see AWSAppConfigStopDeploymentRequest
 @see AWSAppConfigDeployment
 */
- (void)stopDeployment:(AWSAppConfigStopDeploymentRequest *)request completionHandler:(void (^ _Nullable)(AWSAppConfigDeployment * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Metadata to assign to an AppConfig resource. Tags help organize and categorize your AppConfig resources. Each tag consists of a key and an optional value, both of which you define. You can specify a maximum of 50 tags for a resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorBadRequest`, `AWSAppConfigErrorInternalServer`.
 
 @see AWSAppConfigTagResourceRequest
 */
- (AWSTask *)tagResource:(AWSAppConfigTagResourceRequest *)request;

/**
 <p>Metadata to assign to an AppConfig resource. Tags help organize and categorize your AppConfig resources. Each tag consists of a key and an optional value, both of which you define. You can specify a maximum of 50 tags for a resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorBadRequest`, `AWSAppConfigErrorInternalServer`.
 
 @see AWSAppConfigTagResourceRequest
 */
- (void)tagResource:(AWSAppConfigTagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a tag key and value from an AppConfig resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorBadRequest`, `AWSAppConfigErrorInternalServer`.
 
 @see AWSAppConfigUntagResourceRequest
 */
- (AWSTask *)untagResource:(AWSAppConfigUntagResourceRequest *)request;

/**
 <p>Deletes a tag key and value from an AppConfig resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorBadRequest`, `AWSAppConfigErrorInternalServer`.
 
 @see AWSAppConfigUntagResourceRequest
 */
- (void)untagResource:(AWSAppConfigUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApplication service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppConfigApplication`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorBadRequest`, `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`.
 
 @see AWSAppConfigUpdateApplicationRequest
 @see AWSAppConfigApplication
 */
- (AWSTask<AWSAppConfigApplication *> *)updateApplication:(AWSAppConfigUpdateApplicationRequest *)request;

/**
 <p>Updates an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApplication service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorBadRequest`, `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`.
 
 @see AWSAppConfigUpdateApplicationRequest
 @see AWSAppConfigApplication
 */
- (void)updateApplication:(AWSAppConfigUpdateApplicationRequest *)request completionHandler:(void (^ _Nullable)(AWSAppConfigApplication * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a configuration profile.</p>
 
 @param request A container for the necessary parameters to execute the UpdateConfigurationProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppConfigConfigurationProfile`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorBadRequest`, `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`.
 
 @see AWSAppConfigUpdateConfigurationProfileRequest
 @see AWSAppConfigConfigurationProfile
 */
- (AWSTask<AWSAppConfigConfigurationProfile *> *)updateConfigurationProfile:(AWSAppConfigUpdateConfigurationProfileRequest *)request;

/**
 <p>Updates a configuration profile.</p>
 
 @param request A container for the necessary parameters to execute the UpdateConfigurationProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorBadRequest`, `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`.
 
 @see AWSAppConfigUpdateConfigurationProfileRequest
 @see AWSAppConfigConfigurationProfile
 */
- (void)updateConfigurationProfile:(AWSAppConfigUpdateConfigurationProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSAppConfigConfigurationProfile * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a deployment strategy.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDeploymentStrategy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppConfigDeploymentStrategy`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorBadRequest`, `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`.
 
 @see AWSAppConfigUpdateDeploymentStrategyRequest
 @see AWSAppConfigDeploymentStrategy
 */
- (AWSTask<AWSAppConfigDeploymentStrategy *> *)updateDeploymentStrategy:(AWSAppConfigUpdateDeploymentStrategyRequest *)request;

/**
 <p>Updates a deployment strategy.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDeploymentStrategy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorBadRequest`, `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`.
 
 @see AWSAppConfigUpdateDeploymentStrategyRequest
 @see AWSAppConfigDeploymentStrategy
 */
- (void)updateDeploymentStrategy:(AWSAppConfigUpdateDeploymentStrategyRequest *)request completionHandler:(void (^ _Nullable)(AWSAppConfigDeploymentStrategy * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an environment.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEnvironment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppConfigEnvironment`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorBadRequest`, `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`.
 
 @see AWSAppConfigUpdateEnvironmentRequest
 @see AWSAppConfigEnvironment
 */
- (AWSTask<AWSAppConfigEnvironment *> *)updateEnvironment:(AWSAppConfigUpdateEnvironmentRequest *)request;

/**
 <p>Updates an environment.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEnvironment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorBadRequest`, `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`.
 
 @see AWSAppConfigUpdateEnvironmentRequest
 @see AWSAppConfigEnvironment
 */
- (void)updateEnvironment:(AWSAppConfigUpdateEnvironmentRequest *)request completionHandler:(void (^ _Nullable)(AWSAppConfigEnvironment * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Uses the validators in a configuration profile to validate a configuration.</p>
 
 @param request A container for the necessary parameters to execute the ValidateConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorBadRequest`, `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`.
 
 @see AWSAppConfigValidateConfigurationRequest
 */
- (AWSTask *)validateConfiguration:(AWSAppConfigValidateConfigurationRequest *)request;

/**
 <p>Uses the validators in a configuration profile to validate a configuration.</p>
 
 @param request A container for the necessary parameters to execute the ValidateConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppConfigErrorDomain` domain and the following error code: `AWSAppConfigErrorBadRequest`, `AWSAppConfigErrorResourceNotFound`, `AWSAppConfigErrorInternalServer`.
 
 @see AWSAppConfigValidateConfigurationRequest
 */
- (void)validateConfiguration:(AWSAppConfigValidateConfigurationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
