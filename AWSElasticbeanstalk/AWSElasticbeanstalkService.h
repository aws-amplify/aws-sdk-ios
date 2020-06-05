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
#import "AWSElasticbeanstalkModel.h"
#import "AWSElasticbeanstalkResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSElasticbeanstalk
FOUNDATION_EXPORT NSString *const AWSElasticbeanstalkSDKVersion;

/**
 <fullname>AWS Elastic Beanstalk</fullname><p>AWS Elastic Beanstalk makes it easy for you to create, deploy, and manage scalable, fault-tolerant applications running on the Amazon Web Services cloud.</p><p>For more information about this product, go to the <a href="http://aws.amazon.com/elasticbeanstalk/">AWS Elastic Beanstalk</a> details page. The location of the latest AWS Elastic Beanstalk WSDL is <a href="https://elasticbeanstalk.s3.amazonaws.com/doc/2010-12-01/AWSElasticBeanstalk.wsdl">https://elasticbeanstalk.s3.amazonaws.com/doc/2010-12-01/AWSElasticBeanstalk.wsdl</a>. To install the Software Development Kits (SDKs), Integrated Development Environment (IDE) Toolkits, and command line tools that enable you to access the API, go to <a href="http://aws.amazon.com/tools/">Tools for Amazon Web Services</a>.</p><p><b>Endpoints</b></p><p>For a list of region-specific endpoints that AWS Elastic Beanstalk supports, go to <a href="https://docs.aws.amazon.com/general/latest/gr/rande.html#elasticbeanstalk_region">Regions and Endpoints</a> in the <i>Amazon Web Services Glossary</i>.</p>
 */
@interface AWSElasticbeanstalk : AWSService

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

     let Elasticbeanstalk = AWSElasticbeanstalk.default()

 *Objective-C*

     AWSElasticbeanstalk *Elasticbeanstalk = [AWSElasticbeanstalk defaultElasticbeanstalk];

 @return The default service client.
 */
+ (instancetype)defaultElasticbeanstalk;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSElasticbeanstalk.register(with: configuration!, forKey: "USWest2Elasticbeanstalk")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:@"USWest2Elasticbeanstalk"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Elasticbeanstalk = AWSElasticbeanstalk(forKey: "USWest2Elasticbeanstalk")

 *Objective-C*

     AWSElasticbeanstalk *Elasticbeanstalk = [AWSElasticbeanstalk ElasticbeanstalkForKey:@"USWest2Elasticbeanstalk"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerElasticbeanstalkWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerElasticbeanstalkWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSElasticbeanstalk.register(with: configuration!, forKey: "USWest2Elasticbeanstalk")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:@"USWest2Elasticbeanstalk"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Elasticbeanstalk = AWSElasticbeanstalk(forKey: "USWest2Elasticbeanstalk")

 *Objective-C*

     AWSElasticbeanstalk *Elasticbeanstalk = [AWSElasticbeanstalk ElasticbeanstalkForKey:@"USWest2Elasticbeanstalk"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)ElasticbeanstalkForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeElasticbeanstalkForKey:(NSString *)key;

/**
 <p>Cancels in-progress environment configuration update or application version deployment.</p>
 
 @param request A container for the necessary parameters to execute the AbortEnvironmentUpdate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`.
 
 @see AWSElasticbeanstalkAbortEnvironmentUpdateMessage
 */
- (AWSTask *)abortEnvironmentUpdate:(AWSElasticbeanstalkAbortEnvironmentUpdateMessage *)request;

/**
 <p>Cancels in-progress environment configuration update or application version deployment.</p>
 
 @param request A container for the necessary parameters to execute the AbortEnvironmentUpdate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`.
 
 @see AWSElasticbeanstalkAbortEnvironmentUpdateMessage
 */
- (void)abortEnvironmentUpdate:(AWSElasticbeanstalkAbortEnvironmentUpdateMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Applies a scheduled managed action immediately. A managed action can be applied only if its status is <code>Scheduled</code>. Get the status and action ID of a managed action with <a>DescribeEnvironmentManagedActions</a>.</p>
 
 @param request A container for the necessary parameters to execute the ApplyEnvironmentManagedAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkApplyEnvironmentManagedActionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorElasticBeanstalkService`, `AWSElasticbeanstalkErrorManagedActionInvalidState`.
 
 @see AWSElasticbeanstalkApplyEnvironmentManagedActionRequest
 @see AWSElasticbeanstalkApplyEnvironmentManagedActionResult
 */
- (AWSTask<AWSElasticbeanstalkApplyEnvironmentManagedActionResult *> *)applyEnvironmentManagedAction:(AWSElasticbeanstalkApplyEnvironmentManagedActionRequest *)request;

/**
 <p>Applies a scheduled managed action immediately. A managed action can be applied only if its status is <code>Scheduled</code>. Get the status and action ID of a managed action with <a>DescribeEnvironmentManagedActions</a>.</p>
 
 @param request A container for the necessary parameters to execute the ApplyEnvironmentManagedAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorElasticBeanstalkService`, `AWSElasticbeanstalkErrorManagedActionInvalidState`.
 
 @see AWSElasticbeanstalkApplyEnvironmentManagedActionRequest
 @see AWSElasticbeanstalkApplyEnvironmentManagedActionResult
 */
- (void)applyEnvironmentManagedAction:(AWSElasticbeanstalkApplyEnvironmentManagedActionRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkApplyEnvironmentManagedActionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Add or change the operations role used by an environment. After this call is made, Elastic Beanstalk uses the associated operations role for permissions to downstream services during subsequent calls acting on this environment. For more information, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/iam-operationsrole.html">Operations roles</a> in the <i>AWS Elastic Beanstalk Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AssociateEnvironmentOperationsRole service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`.
 
 @see AWSElasticbeanstalkAssociateEnvironmentOperationsRoleMessage
 */
- (AWSTask *)associateEnvironmentOperationsRole:(AWSElasticbeanstalkAssociateEnvironmentOperationsRoleMessage *)request;

/**
 <p>Add or change the operations role used by an environment. After this call is made, Elastic Beanstalk uses the associated operations role for permissions to downstream services during subsequent calls acting on this environment. For more information, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/iam-operationsrole.html">Operations roles</a> in the <i>AWS Elastic Beanstalk Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AssociateEnvironmentOperationsRole service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`.
 
 @see AWSElasticbeanstalkAssociateEnvironmentOperationsRoleMessage
 */
- (void)associateEnvironmentOperationsRole:(AWSElasticbeanstalkAssociateEnvironmentOperationsRoleMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Checks if the specified CNAME is available.</p>
 
 @param request A container for the necessary parameters to execute the CheckDNSAvailability service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkCheckDNSAvailabilityResultMessage`.
 
 @see AWSElasticbeanstalkCheckDNSAvailabilityMessage
 @see AWSElasticbeanstalkCheckDNSAvailabilityResultMessage
 */
- (AWSTask<AWSElasticbeanstalkCheckDNSAvailabilityResultMessage *> *)checkDNSAvailability:(AWSElasticbeanstalkCheckDNSAvailabilityMessage *)request;

/**
 <p>Checks if the specified CNAME is available.</p>
 
 @param request A container for the necessary parameters to execute the CheckDNSAvailability service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSElasticbeanstalkCheckDNSAvailabilityMessage
 @see AWSElasticbeanstalkCheckDNSAvailabilityResultMessage
 */
- (void)checkDNSAvailability:(AWSElasticbeanstalkCheckDNSAvailabilityMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkCheckDNSAvailabilityResultMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Create or update a group of environments that each run a separate component of a single application. Takes a list of version labels that specify application source bundles for each of the environments to create or update. The name of each environment and other required information must be included in the source bundles in an environment manifest named <code>env.yaml</code>. See <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-mgmt-compose.html">Compose Environments</a> for details.</p>
 
 @param request A container for the necessary parameters to execute the ComposeEnvironments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkEnvironmentDescriptionsMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorTooManyEnvironments`, `AWSElasticbeanstalkErrorInsufficientPrivileges`.
 
 @see AWSElasticbeanstalkComposeEnvironmentsMessage
 @see AWSElasticbeanstalkEnvironmentDescriptionsMessage
 */
- (AWSTask<AWSElasticbeanstalkEnvironmentDescriptionsMessage *> *)composeEnvironments:(AWSElasticbeanstalkComposeEnvironmentsMessage *)request;

/**
 <p>Create or update a group of environments that each run a separate component of a single application. Takes a list of version labels that specify application source bundles for each of the environments to create or update. The name of each environment and other required information must be included in the source bundles in an environment manifest named <code>env.yaml</code>. See <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-mgmt-compose.html">Compose Environments</a> for details.</p>
 
 @param request A container for the necessary parameters to execute the ComposeEnvironments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorTooManyEnvironments`, `AWSElasticbeanstalkErrorInsufficientPrivileges`.
 
 @see AWSElasticbeanstalkComposeEnvironmentsMessage
 @see AWSElasticbeanstalkEnvironmentDescriptionsMessage
 */
- (void)composeEnvironments:(AWSElasticbeanstalkComposeEnvironmentsMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkEnvironmentDescriptionsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an application that has one configuration template named <code>default</code> and no application versions.</p>
 
 @param request A container for the necessary parameters to execute the CreateApplication service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkApplicationDescriptionMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorTooManyApplications`.
 
 @see AWSElasticbeanstalkCreateApplicationMessage
 @see AWSElasticbeanstalkApplicationDescriptionMessage
 */
- (AWSTask<AWSElasticbeanstalkApplicationDescriptionMessage *> *)createApplication:(AWSElasticbeanstalkCreateApplicationMessage *)request;

/**
 <p>Creates an application that has one configuration template named <code>default</code> and no application versions.</p>
 
 @param request A container for the necessary parameters to execute the CreateApplication service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorTooManyApplications`.
 
 @see AWSElasticbeanstalkCreateApplicationMessage
 @see AWSElasticbeanstalkApplicationDescriptionMessage
 */
- (void)createApplication:(AWSElasticbeanstalkCreateApplicationMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkApplicationDescriptionMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an application version for the specified application. You can create an application version from a source bundle in Amazon S3, a commit in AWS CodeCommit, or the output of an AWS CodeBuild build as follows:</p><p>Specify a commit in an AWS CodeCommit repository with <code>SourceBuildInformation</code>.</p><p>Specify a build in an AWS CodeBuild with <code>SourceBuildInformation</code> and <code>BuildConfiguration</code>.</p><p>Specify a source bundle in S3 with <code>SourceBundle</code></p><p>Omit both <code>SourceBuildInformation</code> and <code>SourceBundle</code> to use the default sample application.</p><note><p>After you create an application version with a specified Amazon S3 bucket and key location, you can't change that Amazon S3 location. If you change the Amazon S3 location, you receive an exception when you attempt to launch an environment from the application version.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateApplicationVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkApplicationVersionDescriptionMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorTooManyApplications`, `AWSElasticbeanstalkErrorTooManyApplicationVersions`, `AWSElasticbeanstalkErrorInsufficientPrivileges`, `AWSElasticbeanstalkErrorS3LocationNotInServiceRegion`, `AWSElasticbeanstalkErrorCodeBuildNotInServiceRegion`.
 
 @see AWSElasticbeanstalkCreateApplicationVersionMessage
 @see AWSElasticbeanstalkApplicationVersionDescriptionMessage
 */
- (AWSTask<AWSElasticbeanstalkApplicationVersionDescriptionMessage *> *)createApplicationVersion:(AWSElasticbeanstalkCreateApplicationVersionMessage *)request;

/**
 <p>Creates an application version for the specified application. You can create an application version from a source bundle in Amazon S3, a commit in AWS CodeCommit, or the output of an AWS CodeBuild build as follows:</p><p>Specify a commit in an AWS CodeCommit repository with <code>SourceBuildInformation</code>.</p><p>Specify a build in an AWS CodeBuild with <code>SourceBuildInformation</code> and <code>BuildConfiguration</code>.</p><p>Specify a source bundle in S3 with <code>SourceBundle</code></p><p>Omit both <code>SourceBuildInformation</code> and <code>SourceBundle</code> to use the default sample application.</p><note><p>After you create an application version with a specified Amazon S3 bucket and key location, you can't change that Amazon S3 location. If you change the Amazon S3 location, you receive an exception when you attempt to launch an environment from the application version.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateApplicationVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorTooManyApplications`, `AWSElasticbeanstalkErrorTooManyApplicationVersions`, `AWSElasticbeanstalkErrorInsufficientPrivileges`, `AWSElasticbeanstalkErrorS3LocationNotInServiceRegion`, `AWSElasticbeanstalkErrorCodeBuildNotInServiceRegion`.
 
 @see AWSElasticbeanstalkCreateApplicationVersionMessage
 @see AWSElasticbeanstalkApplicationVersionDescriptionMessage
 */
- (void)createApplicationVersion:(AWSElasticbeanstalkCreateApplicationVersionMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkApplicationVersionDescriptionMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an AWS Elastic Beanstalk configuration template, associated with a specific Elastic Beanstalk application. You define application configuration settings in a configuration template. You can then use the configuration template to deploy different versions of the application with the same configuration settings.</p><p>Templates aren't associated with any environment. The <code>EnvironmentName</code> response element is always <code>null</code>.</p><p>Related Topics</p><ul><li><p><a>DescribeConfigurationOptions</a></p></li><li><p><a>DescribeConfigurationSettings</a></p></li><li><p><a>ListAvailableSolutionStacks</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateConfigurationTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkConfigurationSettingsDescription`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`, `AWSElasticbeanstalkErrorTooManyBuckets`, `AWSElasticbeanstalkErrorTooManyConfigurationTemplates`.
 
 @see AWSElasticbeanstalkCreateConfigurationTemplateMessage
 @see AWSElasticbeanstalkConfigurationSettingsDescription
 */
- (AWSTask<AWSElasticbeanstalkConfigurationSettingsDescription *> *)createConfigurationTemplate:(AWSElasticbeanstalkCreateConfigurationTemplateMessage *)request;

/**
 <p>Creates an AWS Elastic Beanstalk configuration template, associated with a specific Elastic Beanstalk application. You define application configuration settings in a configuration template. You can then use the configuration template to deploy different versions of the application with the same configuration settings.</p><p>Templates aren't associated with any environment. The <code>EnvironmentName</code> response element is always <code>null</code>.</p><p>Related Topics</p><ul><li><p><a>DescribeConfigurationOptions</a></p></li><li><p><a>DescribeConfigurationSettings</a></p></li><li><p><a>ListAvailableSolutionStacks</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateConfigurationTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`, `AWSElasticbeanstalkErrorTooManyBuckets`, `AWSElasticbeanstalkErrorTooManyConfigurationTemplates`.
 
 @see AWSElasticbeanstalkCreateConfigurationTemplateMessage
 @see AWSElasticbeanstalkConfigurationSettingsDescription
 */
- (void)createConfigurationTemplate:(AWSElasticbeanstalkCreateConfigurationTemplateMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkConfigurationSettingsDescription * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Launches an AWS Elastic Beanstalk environment for the specified application using the specified configuration.</p>
 
 @param request A container for the necessary parameters to execute the CreateEnvironment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkEnvironmentDescription`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorTooManyEnvironments`, `AWSElasticbeanstalkErrorInsufficientPrivileges`.
 
 @see AWSElasticbeanstalkCreateEnvironmentMessage
 @see AWSElasticbeanstalkEnvironmentDescription
 */
- (AWSTask<AWSElasticbeanstalkEnvironmentDescription *> *)createEnvironment:(AWSElasticbeanstalkCreateEnvironmentMessage *)request;

/**
 <p>Launches an AWS Elastic Beanstalk environment for the specified application using the specified configuration.</p>
 
 @param request A container for the necessary parameters to execute the CreateEnvironment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorTooManyEnvironments`, `AWSElasticbeanstalkErrorInsufficientPrivileges`.
 
 @see AWSElasticbeanstalkCreateEnvironmentMessage
 @see AWSElasticbeanstalkEnvironmentDescription
 */
- (void)createEnvironment:(AWSElasticbeanstalkCreateEnvironmentMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkEnvironmentDescription * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Create a new version of your custom platform.</p>
 
 @param request A container for the necessary parameters to execute the CreatePlatformVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkCreatePlatformVersionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`, `AWSElasticbeanstalkErrorElasticBeanstalkService`, `AWSElasticbeanstalkErrorTooManyPlatforms`.
 
 @see AWSElasticbeanstalkCreatePlatformVersionRequest
 @see AWSElasticbeanstalkCreatePlatformVersionResult
 */
- (AWSTask<AWSElasticbeanstalkCreatePlatformVersionResult *> *)createPlatformVersion:(AWSElasticbeanstalkCreatePlatformVersionRequest *)request;

/**
 <p>Create a new version of your custom platform.</p>
 
 @param request A container for the necessary parameters to execute the CreatePlatformVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`, `AWSElasticbeanstalkErrorElasticBeanstalkService`, `AWSElasticbeanstalkErrorTooManyPlatforms`.
 
 @see AWSElasticbeanstalkCreatePlatformVersionRequest
 @see AWSElasticbeanstalkCreatePlatformVersionResult
 */
- (void)createPlatformVersion:(AWSElasticbeanstalkCreatePlatformVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkCreatePlatformVersionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a bucket in Amazon S3 to store application versions, logs, and other files used by Elastic Beanstalk environments. The Elastic Beanstalk console and EB CLI call this API the first time you create an environment in a region. If the storage location already exists, <code>CreateStorageLocation</code> still returns the bucket name but does not create a new bucket.</p>
 
 @param request A container for the necessary parameters to execute the CreateStorageLocation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkCreateStorageLocationResultMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorTooManyBuckets`, `AWSElasticbeanstalkErrorS3SubscriptionRequired`, `AWSElasticbeanstalkErrorInsufficientPrivileges`.
 
 @see AWSRequest
 @see AWSElasticbeanstalkCreateStorageLocationResultMessage
 */
- (AWSTask<AWSElasticbeanstalkCreateStorageLocationResultMessage *> *)createStorageLocation:(AWSRequest *)request;

/**
 <p>Creates a bucket in Amazon S3 to store application versions, logs, and other files used by Elastic Beanstalk environments. The Elastic Beanstalk console and EB CLI call this API the first time you create an environment in a region. If the storage location already exists, <code>CreateStorageLocation</code> still returns the bucket name but does not create a new bucket.</p>
 
 @param request A container for the necessary parameters to execute the CreateStorageLocation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorTooManyBuckets`, `AWSElasticbeanstalkErrorS3SubscriptionRequired`, `AWSElasticbeanstalkErrorInsufficientPrivileges`.
 
 @see AWSRequest
 @see AWSElasticbeanstalkCreateStorageLocationResultMessage
 */
- (void)createStorageLocation:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkCreateStorageLocationResultMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified application along with all associated versions and configurations. The application versions will not be deleted from your Amazon S3 bucket.</p><note><p>You cannot delete an application that has a running environment.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteApplication service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorOperationInProgress`.
 
 @see AWSElasticbeanstalkDeleteApplicationMessage
 */
- (AWSTask *)deleteApplication:(AWSElasticbeanstalkDeleteApplicationMessage *)request;

/**
 <p>Deletes the specified application along with all associated versions and configurations. The application versions will not be deleted from your Amazon S3 bucket.</p><note><p>You cannot delete an application that has a running environment.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteApplication service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorOperationInProgress`.
 
 @see AWSElasticbeanstalkDeleteApplicationMessage
 */
- (void)deleteApplication:(AWSElasticbeanstalkDeleteApplicationMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified version from the specified application.</p><note><p>You cannot delete an application version that is associated with a running environment.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteApplicationVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorSourceBundleDeletion`, `AWSElasticbeanstalkErrorInsufficientPrivileges`, `AWSElasticbeanstalkErrorOperationInProgress`, `AWSElasticbeanstalkErrorS3LocationNotInServiceRegion`.
 
 @see AWSElasticbeanstalkDeleteApplicationVersionMessage
 */
- (AWSTask *)deleteApplicationVersion:(AWSElasticbeanstalkDeleteApplicationVersionMessage *)request;

/**
 <p>Deletes the specified version from the specified application.</p><note><p>You cannot delete an application version that is associated with a running environment.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteApplicationVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorSourceBundleDeletion`, `AWSElasticbeanstalkErrorInsufficientPrivileges`, `AWSElasticbeanstalkErrorOperationInProgress`, `AWSElasticbeanstalkErrorS3LocationNotInServiceRegion`.
 
 @see AWSElasticbeanstalkDeleteApplicationVersionMessage
 */
- (void)deleteApplicationVersion:(AWSElasticbeanstalkDeleteApplicationVersionMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified configuration template.</p><note><p>When you launch an environment using a configuration template, the environment gets a copy of the template. You can delete or modify the environment's copy of the template without affecting the running environment.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteConfigurationTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorOperationInProgress`.
 
 @see AWSElasticbeanstalkDeleteConfigurationTemplateMessage
 */
- (AWSTask *)deleteConfigurationTemplate:(AWSElasticbeanstalkDeleteConfigurationTemplateMessage *)request;

/**
 <p>Deletes the specified configuration template.</p><note><p>When you launch an environment using a configuration template, the environment gets a copy of the template. You can delete or modify the environment's copy of the template without affecting the running environment.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteConfigurationTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorOperationInProgress`.
 
 @see AWSElasticbeanstalkDeleteConfigurationTemplateMessage
 */
- (void)deleteConfigurationTemplate:(AWSElasticbeanstalkDeleteConfigurationTemplateMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the draft configuration associated with the running environment.</p><p>Updating a running environment with any configuration changes creates a draft configuration set. You can get the draft configuration using <a>DescribeConfigurationSettings</a> while the update is in progress or if the update fails. The <code>DeploymentStatus</code> for the draft configuration indicates whether the deployment is in process or has failed. The draft configuration remains in existence until it is deleted with this action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEnvironmentConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSElasticbeanstalkDeleteEnvironmentConfigurationMessage
 */
- (AWSTask *)deleteEnvironmentConfiguration:(AWSElasticbeanstalkDeleteEnvironmentConfigurationMessage *)request;

/**
 <p>Deletes the draft configuration associated with the running environment.</p><p>Updating a running environment with any configuration changes creates a draft configuration set. You can get the draft configuration using <a>DescribeConfigurationSettings</a> while the update is in progress or if the update fails. The <code>DeploymentStatus</code> for the draft configuration indicates whether the deployment is in process or has failed. The draft configuration remains in existence until it is deleted with this action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEnvironmentConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSElasticbeanstalkDeleteEnvironmentConfigurationMessage
 */
- (void)deleteEnvironmentConfiguration:(AWSElasticbeanstalkDeleteEnvironmentConfigurationMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified version of a custom platform.</p>
 
 @param request A container for the necessary parameters to execute the DeletePlatformVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkDeletePlatformVersionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorOperationInProgress`, `AWSElasticbeanstalkErrorInsufficientPrivileges`, `AWSElasticbeanstalkErrorElasticBeanstalkService`, `AWSElasticbeanstalkErrorPlatformVersionStillReferenced`.
 
 @see AWSElasticbeanstalkDeletePlatformVersionRequest
 @see AWSElasticbeanstalkDeletePlatformVersionResult
 */
- (AWSTask<AWSElasticbeanstalkDeletePlatformVersionResult *> *)deletePlatformVersion:(AWSElasticbeanstalkDeletePlatformVersionRequest *)request;

/**
 <p>Deletes the specified version of a custom platform.</p>
 
 @param request A container for the necessary parameters to execute the DeletePlatformVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorOperationInProgress`, `AWSElasticbeanstalkErrorInsufficientPrivileges`, `AWSElasticbeanstalkErrorElasticBeanstalkService`, `AWSElasticbeanstalkErrorPlatformVersionStillReferenced`.
 
 @see AWSElasticbeanstalkDeletePlatformVersionRequest
 @see AWSElasticbeanstalkDeletePlatformVersionResult
 */
- (void)deletePlatformVersion:(AWSElasticbeanstalkDeletePlatformVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkDeletePlatformVersionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns attributes related to AWS Elastic Beanstalk that are associated with the calling AWS account.</p><p>The result currently has one set of attributes—resource quotas.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccountAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkDescribeAccountAttributesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`.
 
 @see AWSRequest
 @see AWSElasticbeanstalkDescribeAccountAttributesResult
 */
- (AWSTask<AWSElasticbeanstalkDescribeAccountAttributesResult *> *)describeAccountAttributes:(AWSRequest *)request;

/**
 <p>Returns attributes related to AWS Elastic Beanstalk that are associated with the calling AWS account.</p><p>The result currently has one set of attributes—resource quotas.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccountAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`.
 
 @see AWSRequest
 @see AWSElasticbeanstalkDescribeAccountAttributesResult
 */
- (void)describeAccountAttributes:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkDescribeAccountAttributesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve a list of application versions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeApplicationVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkApplicationVersionDescriptionsMessage`.
 
 @see AWSElasticbeanstalkDescribeApplicationVersionsMessage
 @see AWSElasticbeanstalkApplicationVersionDescriptionsMessage
 */
- (AWSTask<AWSElasticbeanstalkApplicationVersionDescriptionsMessage *> *)describeApplicationVersions:(AWSElasticbeanstalkDescribeApplicationVersionsMessage *)request;

/**
 <p>Retrieve a list of application versions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeApplicationVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSElasticbeanstalkDescribeApplicationVersionsMessage
 @see AWSElasticbeanstalkApplicationVersionDescriptionsMessage
 */
- (void)describeApplicationVersions:(AWSElasticbeanstalkDescribeApplicationVersionsMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkApplicationVersionDescriptionsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the descriptions of existing applications.</p>
 
 @param request A container for the necessary parameters to execute the DescribeApplications service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkApplicationDescriptionsMessage`.
 
 @see AWSElasticbeanstalkDescribeApplicationsMessage
 @see AWSElasticbeanstalkApplicationDescriptionsMessage
 */
- (AWSTask<AWSElasticbeanstalkApplicationDescriptionsMessage *> *)describeApplications:(AWSElasticbeanstalkDescribeApplicationsMessage *)request;

/**
 <p>Returns the descriptions of existing applications.</p>
 
 @param request A container for the necessary parameters to execute the DescribeApplications service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSElasticbeanstalkDescribeApplicationsMessage
 @see AWSElasticbeanstalkApplicationDescriptionsMessage
 */
- (void)describeApplications:(AWSElasticbeanstalkDescribeApplicationsMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkApplicationDescriptionsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the configuration options that are used in a particular configuration template or environment, or that a specified solution stack defines. The description includes the values the options, their default values, and an indication of the required action on a running environment if an option value is changed.</p>
 
 @param request A container for the necessary parameters to execute the DescribeConfigurationOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkConfigurationOptionsDescription`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorTooManyBuckets`.
 
 @see AWSElasticbeanstalkDescribeConfigurationOptionsMessage
 @see AWSElasticbeanstalkConfigurationOptionsDescription
 */
- (AWSTask<AWSElasticbeanstalkConfigurationOptionsDescription *> *)describeConfigurationOptions:(AWSElasticbeanstalkDescribeConfigurationOptionsMessage *)request;

/**
 <p>Describes the configuration options that are used in a particular configuration template or environment, or that a specified solution stack defines. The description includes the values the options, their default values, and an indication of the required action on a running environment if an option value is changed.</p>
 
 @param request A container for the necessary parameters to execute the DescribeConfigurationOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorTooManyBuckets`.
 
 @see AWSElasticbeanstalkDescribeConfigurationOptionsMessage
 @see AWSElasticbeanstalkConfigurationOptionsDescription
 */
- (void)describeConfigurationOptions:(AWSElasticbeanstalkDescribeConfigurationOptionsMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkConfigurationOptionsDescription * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a description of the settings for the specified configuration set, that is, either a configuration template or the configuration set associated with a running environment.</p><p>When describing the settings for the configuration set associated with a running environment, it is possible to receive two sets of setting descriptions. One is the deployed configuration set, and the other is a draft configuration of an environment that is either in the process of deployment or that failed to deploy.</p><p>Related Topics</p><ul><li><p><a>DeleteEnvironmentConfiguration</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeConfigurationSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkConfigurationSettingsDescriptions`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorTooManyBuckets`.
 
 @see AWSElasticbeanstalkDescribeConfigurationSettingsMessage
 @see AWSElasticbeanstalkConfigurationSettingsDescriptions
 */
- (AWSTask<AWSElasticbeanstalkConfigurationSettingsDescriptions *> *)describeConfigurationSettings:(AWSElasticbeanstalkDescribeConfigurationSettingsMessage *)request;

/**
 <p>Returns a description of the settings for the specified configuration set, that is, either a configuration template or the configuration set associated with a running environment.</p><p>When describing the settings for the configuration set associated with a running environment, it is possible to receive two sets of setting descriptions. One is the deployed configuration set, and the other is a draft configuration of an environment that is either in the process of deployment or that failed to deploy.</p><p>Related Topics</p><ul><li><p><a>DeleteEnvironmentConfiguration</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeConfigurationSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorTooManyBuckets`.
 
 @see AWSElasticbeanstalkDescribeConfigurationSettingsMessage
 @see AWSElasticbeanstalkConfigurationSettingsDescriptions
 */
- (void)describeConfigurationSettings:(AWSElasticbeanstalkDescribeConfigurationSettingsMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkConfigurationSettingsDescriptions * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the overall health of the specified environment. The <b>DescribeEnvironmentHealth</b> operation is only available with AWS Elastic Beanstalk Enhanced Health.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEnvironmentHealth service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkDescribeEnvironmentHealthResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInvalidRequest`, `AWSElasticbeanstalkErrorElasticBeanstalkService`.
 
 @see AWSElasticbeanstalkDescribeEnvironmentHealthRequest
 @see AWSElasticbeanstalkDescribeEnvironmentHealthResult
 */
- (AWSTask<AWSElasticbeanstalkDescribeEnvironmentHealthResult *> *)describeEnvironmentHealth:(AWSElasticbeanstalkDescribeEnvironmentHealthRequest *)request;

/**
 <p>Returns information about the overall health of the specified environment. The <b>DescribeEnvironmentHealth</b> operation is only available with AWS Elastic Beanstalk Enhanced Health.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEnvironmentHealth service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInvalidRequest`, `AWSElasticbeanstalkErrorElasticBeanstalkService`.
 
 @see AWSElasticbeanstalkDescribeEnvironmentHealthRequest
 @see AWSElasticbeanstalkDescribeEnvironmentHealthResult
 */
- (void)describeEnvironmentHealth:(AWSElasticbeanstalkDescribeEnvironmentHealthRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkDescribeEnvironmentHealthResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists an environment's completed and failed managed actions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEnvironmentManagedActionHistory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorElasticBeanstalkService`.
 
 @see AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryRequest
 @see AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryResult
 */
- (AWSTask<AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryResult *> *)describeEnvironmentManagedActionHistory:(AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryRequest *)request;

/**
 <p>Lists an environment's completed and failed managed actions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEnvironmentManagedActionHistory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorElasticBeanstalkService`.
 
 @see AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryRequest
 @see AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryResult
 */
- (void)describeEnvironmentManagedActionHistory:(AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists an environment's upcoming and in-progress managed actions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEnvironmentManagedActions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkDescribeEnvironmentManagedActionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorElasticBeanstalkService`.
 
 @see AWSElasticbeanstalkDescribeEnvironmentManagedActionsRequest
 @see AWSElasticbeanstalkDescribeEnvironmentManagedActionsResult
 */
- (AWSTask<AWSElasticbeanstalkDescribeEnvironmentManagedActionsResult *> *)describeEnvironmentManagedActions:(AWSElasticbeanstalkDescribeEnvironmentManagedActionsRequest *)request;

/**
 <p>Lists an environment's upcoming and in-progress managed actions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEnvironmentManagedActions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorElasticBeanstalkService`.
 
 @see AWSElasticbeanstalkDescribeEnvironmentManagedActionsRequest
 @see AWSElasticbeanstalkDescribeEnvironmentManagedActionsResult
 */
- (void)describeEnvironmentManagedActions:(AWSElasticbeanstalkDescribeEnvironmentManagedActionsRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkDescribeEnvironmentManagedActionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns AWS resources for this environment.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEnvironmentResources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkEnvironmentResourceDescriptionsMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`.
 
 @see AWSElasticbeanstalkDescribeEnvironmentResourcesMessage
 @see AWSElasticbeanstalkEnvironmentResourceDescriptionsMessage
 */
- (AWSTask<AWSElasticbeanstalkEnvironmentResourceDescriptionsMessage *> *)describeEnvironmentResources:(AWSElasticbeanstalkDescribeEnvironmentResourcesMessage *)request;

/**
 <p>Returns AWS resources for this environment.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEnvironmentResources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`.
 
 @see AWSElasticbeanstalkDescribeEnvironmentResourcesMessage
 @see AWSElasticbeanstalkEnvironmentResourceDescriptionsMessage
 */
- (void)describeEnvironmentResources:(AWSElasticbeanstalkDescribeEnvironmentResourcesMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkEnvironmentResourceDescriptionsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns descriptions for existing environments.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEnvironments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkEnvironmentDescriptionsMessage`.
 
 @see AWSElasticbeanstalkDescribeEnvironmentsMessage
 @see AWSElasticbeanstalkEnvironmentDescriptionsMessage
 */
- (AWSTask<AWSElasticbeanstalkEnvironmentDescriptionsMessage *> *)describeEnvironments:(AWSElasticbeanstalkDescribeEnvironmentsMessage *)request;

/**
 <p>Returns descriptions for existing environments.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEnvironments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSElasticbeanstalkDescribeEnvironmentsMessage
 @see AWSElasticbeanstalkEnvironmentDescriptionsMessage
 */
- (void)describeEnvironments:(AWSElasticbeanstalkDescribeEnvironmentsMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkEnvironmentDescriptionsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns list of event descriptions matching criteria up to the last 6 weeks.</p><note><p>This action returns the most recent 1,000 events from the specified <code>NextToken</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkEventDescriptionsMessage`.
 
 @see AWSElasticbeanstalkDescribeEventsMessage
 @see AWSElasticbeanstalkEventDescriptionsMessage
 */
- (AWSTask<AWSElasticbeanstalkEventDescriptionsMessage *> *)describeEvents:(AWSElasticbeanstalkDescribeEventsMessage *)request;

/**
 <p>Returns list of event descriptions matching criteria up to the last 6 weeks.</p><note><p>This action returns the most recent 1,000 events from the specified <code>NextToken</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSElasticbeanstalkDescribeEventsMessage
 @see AWSElasticbeanstalkEventDescriptionsMessage
 */
- (void)describeEvents:(AWSElasticbeanstalkDescribeEventsMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkEventDescriptionsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves detailed information about the health of instances in your AWS Elastic Beanstalk. This operation requires <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced.html">enhanced health reporting</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstancesHealth service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkDescribeInstancesHealthResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInvalidRequest`, `AWSElasticbeanstalkErrorElasticBeanstalkService`.
 
 @see AWSElasticbeanstalkDescribeInstancesHealthRequest
 @see AWSElasticbeanstalkDescribeInstancesHealthResult
 */
- (AWSTask<AWSElasticbeanstalkDescribeInstancesHealthResult *> *)describeInstancesHealth:(AWSElasticbeanstalkDescribeInstancesHealthRequest *)request;

/**
 <p>Retrieves detailed information about the health of instances in your AWS Elastic Beanstalk. This operation requires <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced.html">enhanced health reporting</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstancesHealth service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInvalidRequest`, `AWSElasticbeanstalkErrorElasticBeanstalkService`.
 
 @see AWSElasticbeanstalkDescribeInstancesHealthRequest
 @see AWSElasticbeanstalkDescribeInstancesHealthResult
 */
- (void)describeInstancesHealth:(AWSElasticbeanstalkDescribeInstancesHealthRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkDescribeInstancesHealthResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes a platform version. Provides full details. Compare to <a>ListPlatformVersions</a>, which provides summary information about a list of platform versions.</p><p>For definitions of platform version and other platform-related terms, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/platforms-glossary.html">AWS Elastic Beanstalk Platforms Glossary</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribePlatformVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkDescribePlatformVersionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`, `AWSElasticbeanstalkErrorElasticBeanstalkService`.
 
 @see AWSElasticbeanstalkDescribePlatformVersionRequest
 @see AWSElasticbeanstalkDescribePlatformVersionResult
 */
- (AWSTask<AWSElasticbeanstalkDescribePlatformVersionResult *> *)describePlatformVersion:(AWSElasticbeanstalkDescribePlatformVersionRequest *)request;

/**
 <p>Describes a platform version. Provides full details. Compare to <a>ListPlatformVersions</a>, which provides summary information about a list of platform versions.</p><p>For definitions of platform version and other platform-related terms, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/platforms-glossary.html">AWS Elastic Beanstalk Platforms Glossary</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribePlatformVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`, `AWSElasticbeanstalkErrorElasticBeanstalkService`.
 
 @see AWSElasticbeanstalkDescribePlatformVersionRequest
 @see AWSElasticbeanstalkDescribePlatformVersionResult
 */
- (void)describePlatformVersion:(AWSElasticbeanstalkDescribePlatformVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkDescribePlatformVersionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociate the operations role from an environment. After this call is made, Elastic Beanstalk uses the caller's permissions for permissions to downstream services during subsequent calls acting on this environment. For more information, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/iam-operationsrole.html">Operations roles</a> in the <i>AWS Elastic Beanstalk Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateEnvironmentOperationsRole service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`.
 
 @see AWSElasticbeanstalkDisassociateEnvironmentOperationsRoleMessage
 */
- (AWSTask *)disassociateEnvironmentOperationsRole:(AWSElasticbeanstalkDisassociateEnvironmentOperationsRoleMessage *)request;

/**
 <p>Disassociate the operations role from an environment. After this call is made, Elastic Beanstalk uses the caller's permissions for permissions to downstream services during subsequent calls acting on this environment. For more information, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/iam-operationsrole.html">Operations roles</a> in the <i>AWS Elastic Beanstalk Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateEnvironmentOperationsRole service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`.
 
 @see AWSElasticbeanstalkDisassociateEnvironmentOperationsRoleMessage
 */
- (void)disassociateEnvironmentOperationsRole:(AWSElasticbeanstalkDisassociateEnvironmentOperationsRoleMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the available solution stack names, with the public version first and then in reverse chronological order.</p>
 
 @param request A container for the necessary parameters to execute the ListAvailableSolutionStacks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkListAvailableSolutionStacksResultMessage`.
 
 @see AWSRequest
 @see AWSElasticbeanstalkListAvailableSolutionStacksResultMessage
 */
- (AWSTask<AWSElasticbeanstalkListAvailableSolutionStacksResultMessage *> *)listAvailableSolutionStacks:(AWSRequest *)request;

/**
 <p>Returns a list of the available solution stack names, with the public version first and then in reverse chronological order.</p>
 
 @param request A container for the necessary parameters to execute the ListAvailableSolutionStacks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSRequest
 @see AWSElasticbeanstalkListAvailableSolutionStacksResultMessage
 */
- (void)listAvailableSolutionStacks:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkListAvailableSolutionStacksResultMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the platform branches available for your account in an AWS Region. Provides summary information about each platform branch.</p><p>For definitions of platform branch and other platform-related terms, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/platforms-glossary.html">AWS Elastic Beanstalk Platforms Glossary</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListPlatformBranches service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkListPlatformBranchesResult`.
 
 @see AWSElasticbeanstalkListPlatformBranchesRequest
 @see AWSElasticbeanstalkListPlatformBranchesResult
 */
- (AWSTask<AWSElasticbeanstalkListPlatformBranchesResult *> *)listPlatformBranches:(AWSElasticbeanstalkListPlatformBranchesRequest *)request;

/**
 <p>Lists the platform branches available for your account in an AWS Region. Provides summary information about each platform branch.</p><p>For definitions of platform branch and other platform-related terms, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/platforms-glossary.html">AWS Elastic Beanstalk Platforms Glossary</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListPlatformBranches service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSElasticbeanstalkListPlatformBranchesRequest
 @see AWSElasticbeanstalkListPlatformBranchesResult
 */
- (void)listPlatformBranches:(AWSElasticbeanstalkListPlatformBranchesRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkListPlatformBranchesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the platform versions available for your account in an AWS Region. Provides summary information about each platform version. Compare to <a>DescribePlatformVersion</a>, which provides full details about a single platform version.</p><p>For definitions of platform version and other platform-related terms, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/platforms-glossary.html">AWS Elastic Beanstalk Platforms Glossary</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListPlatformVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkListPlatformVersionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`, `AWSElasticbeanstalkErrorElasticBeanstalkService`.
 
 @see AWSElasticbeanstalkListPlatformVersionsRequest
 @see AWSElasticbeanstalkListPlatformVersionsResult
 */
- (AWSTask<AWSElasticbeanstalkListPlatformVersionsResult *> *)listPlatformVersions:(AWSElasticbeanstalkListPlatformVersionsRequest *)request;

/**
 <p>Lists the platform versions available for your account in an AWS Region. Provides summary information about each platform version. Compare to <a>DescribePlatformVersion</a>, which provides full details about a single platform version.</p><p>For definitions of platform version and other platform-related terms, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/platforms-glossary.html">AWS Elastic Beanstalk Platforms Glossary</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListPlatformVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`, `AWSElasticbeanstalkErrorElasticBeanstalkService`.
 
 @see AWSElasticbeanstalkListPlatformVersionsRequest
 @see AWSElasticbeanstalkListPlatformVersionsResult
 */
- (void)listPlatformVersions:(AWSElasticbeanstalkListPlatformVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkListPlatformVersionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Return the tags applied to an AWS Elastic Beanstalk resource. The response contains a list of tag key-value pairs.</p><p>Elastic Beanstalk supports tagging of all of its resources. For details about resource tagging, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/applications-tagging-resources.html">Tagging Application Resources</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkResourceTagsDescriptionMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`, `AWSElasticbeanstalkErrorResourceNotFound`, `AWSElasticbeanstalkErrorResourceTypeNotSupported`.
 
 @see AWSElasticbeanstalkListTagsForResourceMessage
 @see AWSElasticbeanstalkResourceTagsDescriptionMessage
 */
- (AWSTask<AWSElasticbeanstalkResourceTagsDescriptionMessage *> *)listTagsForResource:(AWSElasticbeanstalkListTagsForResourceMessage *)request;

/**
 <p>Return the tags applied to an AWS Elastic Beanstalk resource. The response contains a list of tag key-value pairs.</p><p>Elastic Beanstalk supports tagging of all of its resources. For details about resource tagging, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/applications-tagging-resources.html">Tagging Application Resources</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`, `AWSElasticbeanstalkErrorResourceNotFound`, `AWSElasticbeanstalkErrorResourceTypeNotSupported`.
 
 @see AWSElasticbeanstalkListTagsForResourceMessage
 @see AWSElasticbeanstalkResourceTagsDescriptionMessage
 */
- (void)listTagsForResource:(AWSElasticbeanstalkListTagsForResourceMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkResourceTagsDescriptionMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes and recreates all of the AWS resources (for example: the Auto Scaling group, load balancer, etc.) for a specified environment and forces a restart.</p>
 
 @param request A container for the necessary parameters to execute the RebuildEnvironment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`.
 
 @see AWSElasticbeanstalkRebuildEnvironmentMessage
 */
- (AWSTask *)rebuildEnvironment:(AWSElasticbeanstalkRebuildEnvironmentMessage *)request;

/**
 <p>Deletes and recreates all of the AWS resources (for example: the Auto Scaling group, load balancer, etc.) for a specified environment and forces a restart.</p>
 
 @param request A container for the necessary parameters to execute the RebuildEnvironment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`.
 
 @see AWSElasticbeanstalkRebuildEnvironmentMessage
 */
- (void)rebuildEnvironment:(AWSElasticbeanstalkRebuildEnvironmentMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Initiates a request to compile the specified type of information of the deployed environment.</p><p> Setting the <code>InfoType</code> to <code>tail</code> compiles the last lines from the application server log files of every Amazon EC2 instance in your environment. </p><p> Setting the <code>InfoType</code> to <code>bundle</code> compresses the application server log files for every Amazon EC2 instance into a <code>.zip</code> file. Legacy and .NET containers do not support bundle logs. </p><p> Use <a>RetrieveEnvironmentInfo</a> to obtain the set of logs. </p><p>Related Topics</p><ul><li><p><a>RetrieveEnvironmentInfo</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the RequestEnvironmentInfo service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSElasticbeanstalkRequestEnvironmentInfoMessage
 */
- (AWSTask *)requestEnvironmentInfo:(AWSElasticbeanstalkRequestEnvironmentInfoMessage *)request;

/**
 <p>Initiates a request to compile the specified type of information of the deployed environment.</p><p> Setting the <code>InfoType</code> to <code>tail</code> compiles the last lines from the application server log files of every Amazon EC2 instance in your environment. </p><p> Setting the <code>InfoType</code> to <code>bundle</code> compresses the application server log files for every Amazon EC2 instance into a <code>.zip</code> file. Legacy and .NET containers do not support bundle logs. </p><p> Use <a>RetrieveEnvironmentInfo</a> to obtain the set of logs. </p><p>Related Topics</p><ul><li><p><a>RetrieveEnvironmentInfo</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the RequestEnvironmentInfo service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSElasticbeanstalkRequestEnvironmentInfoMessage
 */
- (void)requestEnvironmentInfo:(AWSElasticbeanstalkRequestEnvironmentInfoMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Causes the environment to restart the application container server running on each Amazon EC2 instance.</p>
 
 @param request A container for the necessary parameters to execute the RestartAppServer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSElasticbeanstalkRestartAppServerMessage
 */
- (AWSTask *)restartAppServer:(AWSElasticbeanstalkRestartAppServerMessage *)request;

/**
 <p>Causes the environment to restart the application container server running on each Amazon EC2 instance.</p>
 
 @param request A container for the necessary parameters to execute the RestartAppServer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSElasticbeanstalkRestartAppServerMessage
 */
- (void)restartAppServer:(AWSElasticbeanstalkRestartAppServerMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the compiled information from a <a>RequestEnvironmentInfo</a> request.</p><p>Related Topics</p><ul><li><p><a>RequestEnvironmentInfo</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the RetrieveEnvironmentInfo service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkRetrieveEnvironmentInfoResultMessage`.
 
 @see AWSElasticbeanstalkRetrieveEnvironmentInfoMessage
 @see AWSElasticbeanstalkRetrieveEnvironmentInfoResultMessage
 */
- (AWSTask<AWSElasticbeanstalkRetrieveEnvironmentInfoResultMessage *> *)retrieveEnvironmentInfo:(AWSElasticbeanstalkRetrieveEnvironmentInfoMessage *)request;

/**
 <p>Retrieves the compiled information from a <a>RequestEnvironmentInfo</a> request.</p><p>Related Topics</p><ul><li><p><a>RequestEnvironmentInfo</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the RetrieveEnvironmentInfo service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSElasticbeanstalkRetrieveEnvironmentInfoMessage
 @see AWSElasticbeanstalkRetrieveEnvironmentInfoResultMessage
 */
- (void)retrieveEnvironmentInfo:(AWSElasticbeanstalkRetrieveEnvironmentInfoMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkRetrieveEnvironmentInfoResultMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Swaps the CNAMEs of two environments.</p>
 
 @param request A container for the necessary parameters to execute the SwapEnvironmentCNAMEs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSElasticbeanstalkSwapEnvironmentCNAMEsMessage
 */
- (AWSTask *)swapEnvironmentCNAMEs:(AWSElasticbeanstalkSwapEnvironmentCNAMEsMessage *)request;

/**
 <p>Swaps the CNAMEs of two environments.</p>
 
 @param request A container for the necessary parameters to execute the SwapEnvironmentCNAMEs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSElasticbeanstalkSwapEnvironmentCNAMEsMessage
 */
- (void)swapEnvironmentCNAMEs:(AWSElasticbeanstalkSwapEnvironmentCNAMEsMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Terminates the specified environment.</p>
 
 @param request A container for the necessary parameters to execute the TerminateEnvironment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkEnvironmentDescription`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`.
 
 @see AWSElasticbeanstalkTerminateEnvironmentMessage
 @see AWSElasticbeanstalkEnvironmentDescription
 */
- (AWSTask<AWSElasticbeanstalkEnvironmentDescription *> *)terminateEnvironment:(AWSElasticbeanstalkTerminateEnvironmentMessage *)request;

/**
 <p>Terminates the specified environment.</p>
 
 @param request A container for the necessary parameters to execute the TerminateEnvironment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`.
 
 @see AWSElasticbeanstalkTerminateEnvironmentMessage
 @see AWSElasticbeanstalkEnvironmentDescription
 */
- (void)terminateEnvironment:(AWSElasticbeanstalkTerminateEnvironmentMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkEnvironmentDescription * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified application to have the specified properties.</p><note><p>If a property (for example, <code>description</code>) is not provided, the value remains unchanged. To clear these properties, specify an empty string.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateApplication service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkApplicationDescriptionMessage`.
 
 @see AWSElasticbeanstalkUpdateApplicationMessage
 @see AWSElasticbeanstalkApplicationDescriptionMessage
 */
- (AWSTask<AWSElasticbeanstalkApplicationDescriptionMessage *> *)updateApplication:(AWSElasticbeanstalkUpdateApplicationMessage *)request;

/**
 <p>Updates the specified application to have the specified properties.</p><note><p>If a property (for example, <code>description</code>) is not provided, the value remains unchanged. To clear these properties, specify an empty string.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateApplication service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSElasticbeanstalkUpdateApplicationMessage
 @see AWSElasticbeanstalkApplicationDescriptionMessage
 */
- (void)updateApplication:(AWSElasticbeanstalkUpdateApplicationMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkApplicationDescriptionMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies lifecycle settings for an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApplicationResourceLifecycle service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkApplicationResourceLifecycleDescriptionMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`.
 
 @see AWSElasticbeanstalkUpdateApplicationResourceLifecycleMessage
 @see AWSElasticbeanstalkApplicationResourceLifecycleDescriptionMessage
 */
- (AWSTask<AWSElasticbeanstalkApplicationResourceLifecycleDescriptionMessage *> *)updateApplicationResourceLifecycle:(AWSElasticbeanstalkUpdateApplicationResourceLifecycleMessage *)request;

/**
 <p>Modifies lifecycle settings for an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApplicationResourceLifecycle service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`.
 
 @see AWSElasticbeanstalkUpdateApplicationResourceLifecycleMessage
 @see AWSElasticbeanstalkApplicationResourceLifecycleDescriptionMessage
 */
- (void)updateApplicationResourceLifecycle:(AWSElasticbeanstalkUpdateApplicationResourceLifecycleMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkApplicationResourceLifecycleDescriptionMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified application version to have the specified properties.</p><note><p>If a property (for example, <code>description</code>) is not provided, the value remains unchanged. To clear properties, specify an empty string.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateApplicationVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkApplicationVersionDescriptionMessage`.
 
 @see AWSElasticbeanstalkUpdateApplicationVersionMessage
 @see AWSElasticbeanstalkApplicationVersionDescriptionMessage
 */
- (AWSTask<AWSElasticbeanstalkApplicationVersionDescriptionMessage *> *)updateApplicationVersion:(AWSElasticbeanstalkUpdateApplicationVersionMessage *)request;

/**
 <p>Updates the specified application version to have the specified properties.</p><note><p>If a property (for example, <code>description</code>) is not provided, the value remains unchanged. To clear properties, specify an empty string.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateApplicationVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSElasticbeanstalkUpdateApplicationVersionMessage
 @see AWSElasticbeanstalkApplicationVersionDescriptionMessage
 */
- (void)updateApplicationVersion:(AWSElasticbeanstalkUpdateApplicationVersionMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkApplicationVersionDescriptionMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified configuration template to have the specified properties or configuration option values.</p><note><p>If a property (for example, <code>ApplicationName</code>) is not provided, its value remains unchanged. To clear such properties, specify an empty string.</p></note><p>Related Topics</p><ul><li><p><a>DescribeConfigurationOptions</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the UpdateConfigurationTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkConfigurationSettingsDescription`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`, `AWSElasticbeanstalkErrorTooManyBuckets`.
 
 @see AWSElasticbeanstalkUpdateConfigurationTemplateMessage
 @see AWSElasticbeanstalkConfigurationSettingsDescription
 */
- (AWSTask<AWSElasticbeanstalkConfigurationSettingsDescription *> *)updateConfigurationTemplate:(AWSElasticbeanstalkUpdateConfigurationTemplateMessage *)request;

/**
 <p>Updates the specified configuration template to have the specified properties or configuration option values.</p><note><p>If a property (for example, <code>ApplicationName</code>) is not provided, its value remains unchanged. To clear such properties, specify an empty string.</p></note><p>Related Topics</p><ul><li><p><a>DescribeConfigurationOptions</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the UpdateConfigurationTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`, `AWSElasticbeanstalkErrorTooManyBuckets`.
 
 @see AWSElasticbeanstalkUpdateConfigurationTemplateMessage
 @see AWSElasticbeanstalkConfigurationSettingsDescription
 */
- (void)updateConfigurationTemplate:(AWSElasticbeanstalkUpdateConfigurationTemplateMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkConfigurationSettingsDescription * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the environment description, deploys a new application version, updates the configuration settings to an entirely new configuration template, or updates select configuration option values in the running environment.</p><p> Attempting to update both the release and configuration is not allowed and AWS Elastic Beanstalk returns an <code>InvalidParameterCombination</code> error. </p><p> When updating the configuration settings to a new template or individual settings, a draft configuration is created and <a>DescribeConfigurationSettings</a> for this environment returns two setting descriptions with different <code>DeploymentStatus</code> values. </p>
 
 @param request A container for the necessary parameters to execute the UpdateEnvironment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkEnvironmentDescription`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`, `AWSElasticbeanstalkErrorTooManyBuckets`.
 
 @see AWSElasticbeanstalkUpdateEnvironmentMessage
 @see AWSElasticbeanstalkEnvironmentDescription
 */
- (AWSTask<AWSElasticbeanstalkEnvironmentDescription *> *)updateEnvironment:(AWSElasticbeanstalkUpdateEnvironmentMessage *)request;

/**
 <p>Updates the environment description, deploys a new application version, updates the configuration settings to an entirely new configuration template, or updates select configuration option values in the running environment.</p><p> Attempting to update both the release and configuration is not allowed and AWS Elastic Beanstalk returns an <code>InvalidParameterCombination</code> error. </p><p> When updating the configuration settings to a new template or individual settings, a draft configuration is created and <a>DescribeConfigurationSettings</a> for this environment returns two setting descriptions with different <code>DeploymentStatus</code> values. </p>
 
 @param request A container for the necessary parameters to execute the UpdateEnvironment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`, `AWSElasticbeanstalkErrorTooManyBuckets`.
 
 @see AWSElasticbeanstalkUpdateEnvironmentMessage
 @see AWSElasticbeanstalkEnvironmentDescription
 */
- (void)updateEnvironment:(AWSElasticbeanstalkUpdateEnvironmentMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkEnvironmentDescription * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Update the list of tags applied to an AWS Elastic Beanstalk resource. Two lists can be passed: <code>TagsToAdd</code> for tags to add or update, and <code>TagsToRemove</code>.</p><p>Elastic Beanstalk supports tagging of all of its resources. For details about resource tagging, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/applications-tagging-resources.html">Tagging Application Resources</a>.</p><p>If you create a custom IAM user policy to control permission to this operation, specify one of the following two virtual actions (or both) instead of the API operation name:</p><dl><dt>elasticbeanstalk:AddTags</dt><dd><p>Controls permission to call <code>UpdateTagsForResource</code> and pass a list of tags to add in the <code>TagsToAdd</code> parameter.</p></dd><dt>elasticbeanstalk:RemoveTags</dt><dd><p>Controls permission to call <code>UpdateTagsForResource</code> and pass a list of tag keys to remove in the <code>TagsToRemove</code> parameter.</p></dd></dl><p>For details about creating a custom user policy, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/AWSHowTo.iam.managed-policies.html#AWSHowTo.iam.policies">Creating a Custom User Policy</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`, `AWSElasticbeanstalkErrorOperationInProgress`, `AWSElasticbeanstalkErrorTooManyTags`, `AWSElasticbeanstalkErrorResourceNotFound`, `AWSElasticbeanstalkErrorResourceTypeNotSupported`.
 
 @see AWSElasticbeanstalkUpdateTagsForResourceMessage
 */
- (AWSTask *)updateTagsForResource:(AWSElasticbeanstalkUpdateTagsForResourceMessage *)request;

/**
 <p>Update the list of tags applied to an AWS Elastic Beanstalk resource. Two lists can be passed: <code>TagsToAdd</code> for tags to add or update, and <code>TagsToRemove</code>.</p><p>Elastic Beanstalk supports tagging of all of its resources. For details about resource tagging, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/applications-tagging-resources.html">Tagging Application Resources</a>.</p><p>If you create a custom IAM user policy to control permission to this operation, specify one of the following two virtual actions (or both) instead of the API operation name:</p><dl><dt>elasticbeanstalk:AddTags</dt><dd><p>Controls permission to call <code>UpdateTagsForResource</code> and pass a list of tags to add in the <code>TagsToAdd</code> parameter.</p></dd><dt>elasticbeanstalk:RemoveTags</dt><dd><p>Controls permission to call <code>UpdateTagsForResource</code> and pass a list of tag keys to remove in the <code>TagsToRemove</code> parameter.</p></dd></dl><p>For details about creating a custom user policy, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/AWSHowTo.iam.managed-policies.html#AWSHowTo.iam.policies">Creating a Custom User Policy</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`, `AWSElasticbeanstalkErrorOperationInProgress`, `AWSElasticbeanstalkErrorTooManyTags`, `AWSElasticbeanstalkErrorResourceNotFound`, `AWSElasticbeanstalkErrorResourceTypeNotSupported`.
 
 @see AWSElasticbeanstalkUpdateTagsForResourceMessage
 */
- (void)updateTagsForResource:(AWSElasticbeanstalkUpdateTagsForResourceMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Takes a set of configuration settings and either a configuration template or environment, and determines whether those values are valid.</p><p>This action returns a list of messages indicating any errors or warnings associated with the selection of option values.</p>
 
 @param request A container for the necessary parameters to execute the ValidateConfigurationSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticbeanstalkConfigurationSettingsValidationMessages`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`, `AWSElasticbeanstalkErrorTooManyBuckets`.
 
 @see AWSElasticbeanstalkValidateConfigurationSettingsMessage
 @see AWSElasticbeanstalkConfigurationSettingsValidationMessages
 */
- (AWSTask<AWSElasticbeanstalkConfigurationSettingsValidationMessages *> *)validateConfigurationSettings:(AWSElasticbeanstalkValidateConfigurationSettingsMessage *)request;

/**
 <p>Takes a set of configuration settings and either a configuration template or environment, and determines whether those values are valid.</p><p>This action returns a list of messages indicating any errors or warnings associated with the selection of option values.</p>
 
 @param request A container for the necessary parameters to execute the ValidateConfigurationSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticbeanstalkErrorDomain` domain and the following error code: `AWSElasticbeanstalkErrorInsufficientPrivileges`, `AWSElasticbeanstalkErrorTooManyBuckets`.
 
 @see AWSElasticbeanstalkValidateConfigurationSettingsMessage
 @see AWSElasticbeanstalkConfigurationSettingsValidationMessages
 */
- (void)validateConfigurationSettings:(AWSElasticbeanstalkValidateConfigurationSettingsMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticbeanstalkConfigurationSettingsValidationMessages * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
