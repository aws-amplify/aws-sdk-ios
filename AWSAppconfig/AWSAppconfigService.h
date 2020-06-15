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
#import "AWSAppconfigModel.h"
#import "AWSAppconfigResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSAppconfig
FOUNDATION_EXPORT NSString *const AWSAppconfigSDKVersion;

/**
 <fullname>AWS AppConfig</fullname><p>Use AWS AppConfig, a capability of AWS Systems Manager, to create, manage, and quickly deploy application configurations. AppConfig supports controlled deployments to applications of any size and includes built-in validation checks and monitoring. You can use AppConfig with applications hosted on Amazon EC2 instances, AWS Lambda, containers, mobile applications, or IoT devices.</p><p>To prevent errors when deploying application configurations, especially for production systems where a simple typo could cause an unexpected outage, AppConfig includes validators. A validator provides a syntactic or semantic check to ensure that the configuration you want to deploy works as intended. To validate your application configuration data, you provide a schema or a Lambda function that runs against the configuration. The configuration deployment or update can only proceed when the configuration data is valid.</p><p>During a configuration deployment, AppConfig monitors the application to ensure that the deployment is successful. If the system encounters an error, AppConfig rolls back the change to minimize impact for your application users. You can configure a deployment strategy for each application or environment that includes deployment criteria, including velocity, bake time, and alarms to monitor. Similar to error monitoring, if a deployment triggers an alarm, AppConfig automatically rolls back to the previous version. </p><p>AppConfig supports multiple use cases. Here are some examples.</p><ul><li><p><b>Application tuning</b>: Use AppConfig to carefully introduce changes to your application that can only be tested with production traffic.</p></li><li><p><b>Feature toggle</b>: Use AppConfig to turn on new features that require a timely deployment, such as a product launch or announcement. </p></li><li><p><b>Allow list</b>: Use AppConfig to allow premium subscribers to access paid content. </p></li><li><p><b>Operational issues</b>: Use AppConfig to reduce stress on your application when a dependency or other external factor impacts the system.</p></li></ul><p>This reference is intended to be used with the <a href="http://docs.aws.amazon.com/systems-manager/latest/userguide/appconfig.html">AWS AppConfig User Guide</a>.</p>
 */
@interface AWSAppconfig : AWSService

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

     let Appconfig = AWSAppconfig.default()

 *Objective-C*

     AWSAppconfig *Appconfig = [AWSAppconfig defaultAppconfig];

 @return The default service client.
 */
+ (instancetype)defaultAppconfig;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSAppconfig.register(with: configuration!, forKey: "USWest2Appconfig")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSAppconfig registerAppconfigWithConfiguration:configuration forKey:@"USWest2Appconfig"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Appconfig = AWSAppconfig(forKey: "USWest2Appconfig")

 *Objective-C*

     AWSAppconfig *Appconfig = [AWSAppconfig AppconfigForKey:@"USWest2Appconfig"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerAppconfigWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerAppconfigWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSAppconfig.register(with: configuration!, forKey: "USWest2Appconfig")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSAppconfig registerAppconfigWithConfiguration:configuration forKey:@"USWest2Appconfig"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Appconfig = AWSAppconfig(forKey: "USWest2Appconfig")

 *Objective-C*

     AWSAppconfig *Appconfig = [AWSAppconfig AppconfigForKey:@"USWest2Appconfig"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)AppconfigForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeAppconfigForKey:(NSString *)key;

/**
 <p>An application in AppConfig is a logical unit of code that provides capabilities for your customers. For example, an application can be a microservice that runs on Amazon EC2 instances, a mobile application installed by your users, a serverless application using Amazon API Gateway and AWS Lambda, or any system you run on behalf of others.</p>
 
 @param request A container for the necessary parameters to execute the CreateApplication service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigApplication`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigCreateApplicationRequest
 @see AWSAppconfigApplication
 */
- (AWSTask<AWSAppconfigApplication *> *)createApplication:(AWSAppconfigCreateApplicationRequest *)request;

/**
 <p>An application in AppConfig is a logical unit of code that provides capabilities for your customers. For example, an application can be a microservice that runs on Amazon EC2 instances, a mobile application installed by your users, a serverless application using Amazon API Gateway and AWS Lambda, or any system you run on behalf of others.</p>
 
 @param request A container for the necessary parameters to execute the CreateApplication service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigCreateApplicationRequest
 @see AWSAppconfigApplication
 */
- (void)createApplication:(AWSAppconfigCreateApplicationRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigApplication * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Information that enables AppConfig to access the configuration source. Valid configuration sources include Systems Manager (SSM) documents, SSM Parameter Store parameters, and Amazon S3 objects. A configuration profile includes the following information.</p><ul><li><p>The Uri location of the configuration data.</p></li><li><p>The AWS Identity and Access Management (IAM) role that provides access to the configuration data.</p></li><li><p>A validator for the configuration data. Available validators include either a JSON Schema or an AWS Lambda function.</p></li></ul><p>For more information, see <a href="http://docs.aws.amazon.com/systems-manager/latest/userguide/appconfig-creating-configuration-and-profile.html">Create a Configuration and a Configuration Profile</a> in the <i>AWS AppConfig User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateConfigurationProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigConfigurationProfile`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigCreateConfigurationProfileRequest
 @see AWSAppconfigConfigurationProfile
 */
- (AWSTask<AWSAppconfigConfigurationProfile *> *)createConfigurationProfile:(AWSAppconfigCreateConfigurationProfileRequest *)request;

/**
 <p>Information that enables AppConfig to access the configuration source. Valid configuration sources include Systems Manager (SSM) documents, SSM Parameter Store parameters, and Amazon S3 objects. A configuration profile includes the following information.</p><ul><li><p>The Uri location of the configuration data.</p></li><li><p>The AWS Identity and Access Management (IAM) role that provides access to the configuration data.</p></li><li><p>A validator for the configuration data. Available validators include either a JSON Schema or an AWS Lambda function.</p></li></ul><p>For more information, see <a href="http://docs.aws.amazon.com/systems-manager/latest/userguide/appconfig-creating-configuration-and-profile.html">Create a Configuration and a Configuration Profile</a> in the <i>AWS AppConfig User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateConfigurationProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigCreateConfigurationProfileRequest
 @see AWSAppconfigConfigurationProfile
 */
- (void)createConfigurationProfile:(AWSAppconfigCreateConfigurationProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigConfigurationProfile * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>A deployment strategy defines important criteria for rolling out your configuration to the designated targets. A deployment strategy includes: the overall duration required, a percentage of targets to receive the deployment during each interval, an algorithm that defines how percentage grows, and bake time.</p>
 
 @param request A container for the necessary parameters to execute the CreateDeploymentStrategy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigDeploymentStrategy`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigCreateDeploymentStrategyRequest
 @see AWSAppconfigDeploymentStrategy
 */
- (AWSTask<AWSAppconfigDeploymentStrategy *> *)createDeploymentStrategy:(AWSAppconfigCreateDeploymentStrategyRequest *)request;

/**
 <p>A deployment strategy defines important criteria for rolling out your configuration to the designated targets. A deployment strategy includes: the overall duration required, a percentage of targets to receive the deployment during each interval, an algorithm that defines how percentage grows, and bake time.</p>
 
 @param request A container for the necessary parameters to execute the CreateDeploymentStrategy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigCreateDeploymentStrategyRequest
 @see AWSAppconfigDeploymentStrategy
 */
- (void)createDeploymentStrategy:(AWSAppconfigCreateDeploymentStrategyRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigDeploymentStrategy * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>For each application, you define one or more environments. An environment is a logical deployment group of AppConfig targets, such as applications in a <code>Beta</code> or <code>Production</code> environment. You can also define environments for application subcomponents such as the <code>Web</code>, <code>Mobile</code> and <code>Back-end</code> components for your application. You can configure Amazon CloudWatch alarms for each environment. The system monitors alarms during a configuration deployment. If an alarm is triggered, the system rolls back the configuration.</p>
 
 @param request A container for the necessary parameters to execute the CreateEnvironment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigEnvironment`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigCreateEnvironmentRequest
 @see AWSAppconfigEnvironment
 */
- (AWSTask<AWSAppconfigEnvironment *> *)createEnvironment:(AWSAppconfigCreateEnvironmentRequest *)request;

/**
 <p>For each application, you define one or more environments. An environment is a logical deployment group of AppConfig targets, such as applications in a <code>Beta</code> or <code>Production</code> environment. You can also define environments for application subcomponents such as the <code>Web</code>, <code>Mobile</code> and <code>Back-end</code> components for your application. You can configure Amazon CloudWatch alarms for each environment. The system monitors alarms during a configuration deployment. If an alarm is triggered, the system rolls back the configuration.</p>
 
 @param request A container for the necessary parameters to execute the CreateEnvironment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigCreateEnvironmentRequest
 @see AWSAppconfigEnvironment
 */
- (void)createEnvironment:(AWSAppconfigCreateEnvironmentRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigEnvironment * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Create a new configuration in the AppConfig configuration store.</p>
 
 @param request A container for the necessary parameters to execute the CreateHostedConfigurationVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigHostedConfigurationVersion`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorServiceQuotaExceeded`, `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorConflict`, `AWSAppconfigErrorPayloadTooLarge`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigCreateHostedConfigurationVersionRequest
 @see AWSAppconfigHostedConfigurationVersion
 */
- (AWSTask<AWSAppconfigHostedConfigurationVersion *> *)createHostedConfigurationVersion:(AWSAppconfigCreateHostedConfigurationVersionRequest *)request;

/**
 <p>Create a new configuration in the AppConfig configuration store.</p>
 
 @param request A container for the necessary parameters to execute the CreateHostedConfigurationVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorServiceQuotaExceeded`, `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorConflict`, `AWSAppconfigErrorPayloadTooLarge`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigCreateHostedConfigurationVersionRequest
 @see AWSAppconfigHostedConfigurationVersion
 */
- (void)createHostedConfigurationVersion:(AWSAppconfigCreateHostedConfigurationVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigHostedConfigurationVersion * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Delete an application. Deleting an application does not delete a configuration from a host.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApplication service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigDeleteApplicationRequest
 */
- (AWSTask *)deleteApplication:(AWSAppconfigDeleteApplicationRequest *)request;

/**
 <p>Delete an application. Deleting an application does not delete a configuration from a host.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApplication service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigDeleteApplicationRequest
 */
- (void)deleteApplication:(AWSAppconfigDeleteApplicationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Delete a configuration profile. Deleting a configuration profile does not delete a configuration from a host.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConfigurationProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorConflict`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigDeleteConfigurationProfileRequest
 */
- (AWSTask *)deleteConfigurationProfile:(AWSAppconfigDeleteConfigurationProfileRequest *)request;

/**
 <p>Delete a configuration profile. Deleting a configuration profile does not delete a configuration from a host.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConfigurationProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorConflict`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigDeleteConfigurationProfileRequest
 */
- (void)deleteConfigurationProfile:(AWSAppconfigDeleteConfigurationProfileRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Delete a deployment strategy. Deleting a deployment strategy does not delete a configuration from a host.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDeploymentStrategy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigDeleteDeploymentStrategyRequest
 */
- (AWSTask *)deleteDeploymentStrategy:(AWSAppconfigDeleteDeploymentStrategyRequest *)request;

/**
 <p>Delete a deployment strategy. Deleting a deployment strategy does not delete a configuration from a host.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDeploymentStrategy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigDeleteDeploymentStrategyRequest
 */
- (void)deleteDeploymentStrategy:(AWSAppconfigDeleteDeploymentStrategyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Delete an environment. Deleting an environment does not delete a configuration from a host.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEnvironment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorConflict`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigDeleteEnvironmentRequest
 */
- (AWSTask *)deleteEnvironment:(AWSAppconfigDeleteEnvironmentRequest *)request;

/**
 <p>Delete an environment. Deleting an environment does not delete a configuration from a host.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEnvironment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorConflict`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigDeleteEnvironmentRequest
 */
- (void)deleteEnvironment:(AWSAppconfigDeleteEnvironmentRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Delete a version of a configuration from the AppConfig configuration store.</p>
 
 @param request A container for the necessary parameters to execute the DeleteHostedConfigurationVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigDeleteHostedConfigurationVersionRequest
 */
- (AWSTask *)deleteHostedConfigurationVersion:(AWSAppconfigDeleteHostedConfigurationVersionRequest *)request;

/**
 <p>Delete a version of a configuration from the AppConfig configuration store.</p>
 
 @param request A container for the necessary parameters to execute the DeleteHostedConfigurationVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigDeleteHostedConfigurationVersionRequest
 */
- (void)deleteHostedConfigurationVersion:(AWSAppconfigDeleteHostedConfigurationVersionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve information about an application.</p>
 
 @param request A container for the necessary parameters to execute the GetApplication service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigApplication`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigGetApplicationRequest
 @see AWSAppconfigApplication
 */
- (AWSTask<AWSAppconfigApplication *> *)getApplication:(AWSAppconfigGetApplicationRequest *)request;

/**
 <p>Retrieve information about an application.</p>
 
 @param request A container for the necessary parameters to execute the GetApplication service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigGetApplicationRequest
 @see AWSAppconfigApplication
 */
- (void)getApplication:(AWSAppconfigGetApplicationRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigApplication * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Receive information about a configuration.</p><important><p>AWS AppConfig uses the value of the <code>ClientConfigurationVersion</code> parameter to identify the configuration version on your clients. If you don’t send <code>ClientConfigurationVersion</code> with each call to <code>GetConfiguration</code>, your clients receive the current configuration. You are charged each time your clients receive a configuration.</p><p>To avoid excess charges, we recommend that you include the <code>ClientConfigurationVersion</code> value with every call to <code>GetConfiguration</code>. This value must be saved on your client. Subsequent calls to <code>GetConfiguration</code> must pass this value by using the <code>ClientConfigurationVersion</code> parameter. </p></important>
 
 @param request A container for the necessary parameters to execute the GetConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigGetConfigurationRequest
 @see AWSAppconfigConfiguration
 */
- (AWSTask<AWSAppconfigConfiguration *> *)getConfiguration:(AWSAppconfigGetConfigurationRequest *)request;

/**
 <p>Receive information about a configuration.</p><important><p>AWS AppConfig uses the value of the <code>ClientConfigurationVersion</code> parameter to identify the configuration version on your clients. If you don’t send <code>ClientConfigurationVersion</code> with each call to <code>GetConfiguration</code>, your clients receive the current configuration. You are charged each time your clients receive a configuration.</p><p>To avoid excess charges, we recommend that you include the <code>ClientConfigurationVersion</code> value with every call to <code>GetConfiguration</code>. This value must be saved on your client. Subsequent calls to <code>GetConfiguration</code> must pass this value by using the <code>ClientConfigurationVersion</code> parameter. </p></important>
 
 @param request A container for the necessary parameters to execute the GetConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigGetConfigurationRequest
 @see AWSAppconfigConfiguration
 */
- (void)getConfiguration:(AWSAppconfigGetConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve information about a configuration profile.</p>
 
 @param request A container for the necessary parameters to execute the GetConfigurationProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigConfigurationProfile`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigGetConfigurationProfileRequest
 @see AWSAppconfigConfigurationProfile
 */
- (AWSTask<AWSAppconfigConfigurationProfile *> *)getConfigurationProfile:(AWSAppconfigGetConfigurationProfileRequest *)request;

/**
 <p>Retrieve information about a configuration profile.</p>
 
 @param request A container for the necessary parameters to execute the GetConfigurationProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigGetConfigurationProfileRequest
 @see AWSAppconfigConfigurationProfile
 */
- (void)getConfigurationProfile:(AWSAppconfigGetConfigurationProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigConfigurationProfile * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve information about a configuration deployment.</p>
 
 @param request A container for the necessary parameters to execute the GetDeployment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigDeployment`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigGetDeploymentRequest
 @see AWSAppconfigDeployment
 */
- (AWSTask<AWSAppconfigDeployment *> *)getDeployment:(AWSAppconfigGetDeploymentRequest *)request;

/**
 <p>Retrieve information about a configuration deployment.</p>
 
 @param request A container for the necessary parameters to execute the GetDeployment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigGetDeploymentRequest
 @see AWSAppconfigDeployment
 */
- (void)getDeployment:(AWSAppconfigGetDeploymentRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigDeployment * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve information about a deployment strategy. A deployment strategy defines important criteria for rolling out your configuration to the designated targets. A deployment strategy includes: the overall duration required, a percentage of targets to receive the deployment during each interval, an algorithm that defines how percentage grows, and bake time.</p>
 
 @param request A container for the necessary parameters to execute the GetDeploymentStrategy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigDeploymentStrategy`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigGetDeploymentStrategyRequest
 @see AWSAppconfigDeploymentStrategy
 */
- (AWSTask<AWSAppconfigDeploymentStrategy *> *)getDeploymentStrategy:(AWSAppconfigGetDeploymentStrategyRequest *)request;

/**
 <p>Retrieve information about a deployment strategy. A deployment strategy defines important criteria for rolling out your configuration to the designated targets. A deployment strategy includes: the overall duration required, a percentage of targets to receive the deployment during each interval, an algorithm that defines how percentage grows, and bake time.</p>
 
 @param request A container for the necessary parameters to execute the GetDeploymentStrategy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigGetDeploymentStrategyRequest
 @see AWSAppconfigDeploymentStrategy
 */
- (void)getDeploymentStrategy:(AWSAppconfigGetDeploymentStrategyRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigDeploymentStrategy * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve information about an environment. An environment is a logical deployment group of AppConfig applications, such as applications in a <code>Production</code> environment or in an <code>EU_Region</code> environment. Each configuration deployment targets an environment. You can enable one or more Amazon CloudWatch alarms for an environment. If an alarm is triggered during a deployment, AppConfig roles back the configuration.</p>
 
 @param request A container for the necessary parameters to execute the GetEnvironment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigEnvironment`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigGetEnvironmentRequest
 @see AWSAppconfigEnvironment
 */
- (AWSTask<AWSAppconfigEnvironment *> *)getEnvironment:(AWSAppconfigGetEnvironmentRequest *)request;

/**
 <p>Retrieve information about an environment. An environment is a logical deployment group of AppConfig applications, such as applications in a <code>Production</code> environment or in an <code>EU_Region</code> environment. Each configuration deployment targets an environment. You can enable one or more Amazon CloudWatch alarms for an environment. If an alarm is triggered during a deployment, AppConfig roles back the configuration.</p>
 
 @param request A container for the necessary parameters to execute the GetEnvironment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigGetEnvironmentRequest
 @see AWSAppconfigEnvironment
 */
- (void)getEnvironment:(AWSAppconfigGetEnvironmentRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigEnvironment * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get information about a specific configuration version.</p>
 
 @param request A container for the necessary parameters to execute the GetHostedConfigurationVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigHostedConfigurationVersion`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigGetHostedConfigurationVersionRequest
 @see AWSAppconfigHostedConfigurationVersion
 */
- (AWSTask<AWSAppconfigHostedConfigurationVersion *> *)getHostedConfigurationVersion:(AWSAppconfigGetHostedConfigurationVersionRequest *)request;

/**
 <p>Get information about a specific configuration version.</p>
 
 @param request A container for the necessary parameters to execute the GetHostedConfigurationVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigGetHostedConfigurationVersionRequest
 @see AWSAppconfigHostedConfigurationVersion
 */
- (void)getHostedConfigurationVersion:(AWSAppconfigGetHostedConfigurationVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigHostedConfigurationVersion * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List all applications in your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListApplications service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigApplications`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigListApplicationsRequest
 @see AWSAppconfigApplications
 */
- (AWSTask<AWSAppconfigApplications *> *)listApplications:(AWSAppconfigListApplicationsRequest *)request;

/**
 <p>List all applications in your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListApplications service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigListApplicationsRequest
 @see AWSAppconfigApplications
 */
- (void)listApplications:(AWSAppconfigListApplicationsRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigApplications * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the configuration profiles for an application.</p>
 
 @param request A container for the necessary parameters to execute the ListConfigurationProfiles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigConfigurationProfiles`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigListConfigurationProfilesRequest
 @see AWSAppconfigConfigurationProfiles
 */
- (AWSTask<AWSAppconfigConfigurationProfiles *> *)listConfigurationProfiles:(AWSAppconfigListConfigurationProfilesRequest *)request;

/**
 <p>Lists the configuration profiles for an application.</p>
 
 @param request A container for the necessary parameters to execute the ListConfigurationProfiles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigListConfigurationProfilesRequest
 @see AWSAppconfigConfigurationProfiles
 */
- (void)listConfigurationProfiles:(AWSAppconfigListConfigurationProfilesRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigConfigurationProfiles * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List deployment strategies.</p>
 
 @param request A container for the necessary parameters to execute the ListDeploymentStrategies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigDeploymentStrategies`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigListDeploymentStrategiesRequest
 @see AWSAppconfigDeploymentStrategies
 */
- (AWSTask<AWSAppconfigDeploymentStrategies *> *)listDeploymentStrategies:(AWSAppconfigListDeploymentStrategiesRequest *)request;

/**
 <p>List deployment strategies.</p>
 
 @param request A container for the necessary parameters to execute the ListDeploymentStrategies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigListDeploymentStrategiesRequest
 @see AWSAppconfigDeploymentStrategies
 */
- (void)listDeploymentStrategies:(AWSAppconfigListDeploymentStrategiesRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigDeploymentStrategies * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the deployments for an environment.</p>
 
 @param request A container for the necessary parameters to execute the ListDeployments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigDeployments`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigListDeploymentsRequest
 @see AWSAppconfigDeployments
 */
- (AWSTask<AWSAppconfigDeployments *> *)listDeployments:(AWSAppconfigListDeploymentsRequest *)request;

/**
 <p>Lists the deployments for an environment.</p>
 
 @param request A container for the necessary parameters to execute the ListDeployments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigListDeploymentsRequest
 @see AWSAppconfigDeployments
 */
- (void)listDeployments:(AWSAppconfigListDeploymentsRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigDeployments * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List the environments for an application.</p>
 
 @param request A container for the necessary parameters to execute the ListEnvironments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigEnvironments`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigListEnvironmentsRequest
 @see AWSAppconfigEnvironments
 */
- (AWSTask<AWSAppconfigEnvironments *> *)listEnvironments:(AWSAppconfigListEnvironmentsRequest *)request;

/**
 <p>List the environments for an application.</p>
 
 @param request A container for the necessary parameters to execute the ListEnvironments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigListEnvironmentsRequest
 @see AWSAppconfigEnvironments
 */
- (void)listEnvironments:(AWSAppconfigListEnvironmentsRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigEnvironments * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>View a list of configurations stored in the AppConfig configuration store by version.</p>
 
 @param request A container for the necessary parameters to execute the ListHostedConfigurationVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigHostedConfigurationVersions`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigListHostedConfigurationVersionsRequest
 @see AWSAppconfigHostedConfigurationVersions
 */
- (AWSTask<AWSAppconfigHostedConfigurationVersions *> *)listHostedConfigurationVersions:(AWSAppconfigListHostedConfigurationVersionsRequest *)request;

/**
 <p>View a list of configurations stored in the AppConfig configuration store by version.</p>
 
 @param request A container for the necessary parameters to execute the ListHostedConfigurationVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigListHostedConfigurationVersionsRequest
 @see AWSAppconfigHostedConfigurationVersions
 */
- (void)listHostedConfigurationVersions:(AWSAppconfigListHostedConfigurationVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigHostedConfigurationVersions * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the list of key-value tags assigned to the resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigResourceTags`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigListTagsForResourceRequest
 @see AWSAppconfigResourceTags
 */
- (AWSTask<AWSAppconfigResourceTags *> *)listTagsForResource:(AWSAppconfigListTagsForResourceRequest *)request;

/**
 <p>Retrieves the list of key-value tags assigned to the resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigListTagsForResourceRequest
 @see AWSAppconfigResourceTags
 */
- (void)listTagsForResource:(AWSAppconfigListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigResourceTags * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a deployment.</p>
 
 @param request A container for the necessary parameters to execute the StartDeployment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigDeployment`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorConflict`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigStartDeploymentRequest
 @see AWSAppconfigDeployment
 */
- (AWSTask<AWSAppconfigDeployment *> *)startDeployment:(AWSAppconfigStartDeploymentRequest *)request;

/**
 <p>Starts a deployment.</p>
 
 @param request A container for the necessary parameters to execute the StartDeployment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorConflict`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigStartDeploymentRequest
 @see AWSAppconfigDeployment
 */
- (void)startDeployment:(AWSAppconfigStartDeploymentRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigDeployment * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops a deployment. This API action works only on deployments that have a status of <code>DEPLOYING</code>. This action moves the deployment to a status of <code>ROLLED_BACK</code>.</p>
 
 @param request A container for the necessary parameters to execute the StopDeployment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigDeployment`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigStopDeploymentRequest
 @see AWSAppconfigDeployment
 */
- (AWSTask<AWSAppconfigDeployment *> *)stopDeployment:(AWSAppconfigStopDeploymentRequest *)request;

/**
 <p>Stops a deployment. This API action works only on deployments that have a status of <code>DEPLOYING</code>. This action moves the deployment to a status of <code>ROLLED_BACK</code>.</p>
 
 @param request A container for the necessary parameters to execute the StopDeployment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`, `AWSAppconfigErrorBadRequest`.
 
 @see AWSAppconfigStopDeploymentRequest
 @see AWSAppconfigDeployment
 */
- (void)stopDeployment:(AWSAppconfigStopDeploymentRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigDeployment * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Metadata to assign to an AppConfig resource. Tags help organize and categorize your AppConfig resources. Each tag consists of a key and an optional value, both of which you define. You can specify a maximum of 50 tags for a resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigTagResourceRequest
 */
- (AWSTask *)tagResource:(AWSAppconfigTagResourceRequest *)request;

/**
 <p>Metadata to assign to an AppConfig resource. Tags help organize and categorize your AppConfig resources. Each tag consists of a key and an optional value, both of which you define. You can specify a maximum of 50 tags for a resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigTagResourceRequest
 */
- (void)tagResource:(AWSAppconfigTagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a tag key and value from an AppConfig resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigUntagResourceRequest
 */
- (AWSTask *)untagResource:(AWSAppconfigUntagResourceRequest *)request;

/**
 <p>Deletes a tag key and value from an AppConfig resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigUntagResourceRequest
 */
- (void)untagResource:(AWSAppconfigUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApplication service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigApplication`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigUpdateApplicationRequest
 @see AWSAppconfigApplication
 */
- (AWSTask<AWSAppconfigApplication *> *)updateApplication:(AWSAppconfigUpdateApplicationRequest *)request;

/**
 <p>Updates an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApplication service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigUpdateApplicationRequest
 @see AWSAppconfigApplication
 */
- (void)updateApplication:(AWSAppconfigUpdateApplicationRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigApplication * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a configuration profile.</p>
 
 @param request A container for the necessary parameters to execute the UpdateConfigurationProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigConfigurationProfile`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigUpdateConfigurationProfileRequest
 @see AWSAppconfigConfigurationProfile
 */
- (AWSTask<AWSAppconfigConfigurationProfile *> *)updateConfigurationProfile:(AWSAppconfigUpdateConfigurationProfileRequest *)request;

/**
 <p>Updates a configuration profile.</p>
 
 @param request A container for the necessary parameters to execute the UpdateConfigurationProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigUpdateConfigurationProfileRequest
 @see AWSAppconfigConfigurationProfile
 */
- (void)updateConfigurationProfile:(AWSAppconfigUpdateConfigurationProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigConfigurationProfile * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a deployment strategy.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDeploymentStrategy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigDeploymentStrategy`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigUpdateDeploymentStrategyRequest
 @see AWSAppconfigDeploymentStrategy
 */
- (AWSTask<AWSAppconfigDeploymentStrategy *> *)updateDeploymentStrategy:(AWSAppconfigUpdateDeploymentStrategyRequest *)request;

/**
 <p>Updates a deployment strategy.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDeploymentStrategy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigUpdateDeploymentStrategyRequest
 @see AWSAppconfigDeploymentStrategy
 */
- (void)updateDeploymentStrategy:(AWSAppconfigUpdateDeploymentStrategyRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigDeploymentStrategy * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an environment.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEnvironment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppconfigEnvironment`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigUpdateEnvironmentRequest
 @see AWSAppconfigEnvironment
 */
- (AWSTask<AWSAppconfigEnvironment *> *)updateEnvironment:(AWSAppconfigUpdateEnvironmentRequest *)request;

/**
 <p>Updates an environment.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEnvironment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigUpdateEnvironmentRequest
 @see AWSAppconfigEnvironment
 */
- (void)updateEnvironment:(AWSAppconfigUpdateEnvironmentRequest *)request completionHandler:(void (^ _Nullable)(AWSAppconfigEnvironment * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Uses the validators in a configuration profile to validate a configuration.</p>
 
 @param request A container for the necessary parameters to execute the ValidateConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigValidateConfigurationRequest
 */
- (AWSTask *)validateConfiguration:(AWSAppconfigValidateConfigurationRequest *)request;

/**
 <p>Uses the validators in a configuration profile to validate a configuration.</p>
 
 @param request A container for the necessary parameters to execute the ValidateConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppconfigErrorDomain` domain and the following error code: `AWSAppconfigErrorBadRequest`, `AWSAppconfigErrorResourceNotFound`, `AWSAppconfigErrorInternalServer`.
 
 @see AWSAppconfigValidateConfigurationRequest
 */
- (void)validateConfiguration:(AWSAppconfigValidateConfigurationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
