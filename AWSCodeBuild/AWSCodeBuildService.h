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
#import "AWSCodeBuildModel.h"
#import "AWSCodeBuildResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSCodeBuild
FOUNDATION_EXPORT NSString *const AWSCodeBuildSDKVersion;

/**
 <fullname>AWS CodeBuild</fullname><p>AWS CodeBuild is a fully managed build service in the cloud. AWS CodeBuild compiles your source code, runs unit tests, and produces artifacts that are ready to deploy. AWS CodeBuild eliminates the need to provision, manage, and scale your own build servers. It provides prepackaged build environments for the most popular programming languages and build tools, such as Apache Maven, Gradle, and more. You can also fully customize build environments in AWS CodeBuild to use your own build tools. AWS CodeBuild scales automatically to meet peak build requests. You pay only for the build time you consume. For more information about AWS CodeBuild, see the <i><a href="https://docs.aws.amazon.com/codebuild/latest/userguide/welcome.html">AWS CodeBuild User Guide</a>.</i></p><p>AWS CodeBuild supports these operations:</p><ul><li><p><code>BatchDeleteBuilds</code>: Deletes one or more builds.</p></li><li><p><code>BatchGetBuilds</code>: Gets information about one or more builds.</p></li><li><p><code>BatchGetProjects</code>: Gets information about one or more build projects. A <i>build project</i> defines how AWS CodeBuild runs a build. This includes information such as where to get the source code to build, the build environment to use, the build commands to run, and where to store the build output. A <i>build environment</i> is a representation of operating system, programming language runtime, and tools that AWS CodeBuild uses to run a build. You can add tags to build projects to help manage your resources and costs.</p></li><li><p><code>BatchGetReportGroups</code>: Returns an array of report groups. </p></li><li><p><code>BatchGetReports</code>: Returns an array of reports. </p></li><li><p><code>CreateProject</code>: Creates a build project.</p></li><li><p><code>CreateReportGroup</code>: Creates a report group. A report group contains a collection of reports. </p></li><li><p><code>CreateWebhook</code>: For an existing AWS CodeBuild build project that has its source code stored in a GitHub or Bitbucket repository, enables AWS CodeBuild to start rebuilding the source code every time a code change is pushed to the repository.</p></li><li><p><code>DeleteProject</code>: Deletes a build project.</p></li><li><p><code>DeleteReport</code>: Deletes a report. </p></li><li><p><code>DeleteReportGroup</code>: Deletes a report group. </p></li><li><p><code>DeleteResourcePolicy</code>: Deletes a resource policy that is identified by its resource ARN. </p></li><li><p><code>DeleteSourceCredentials</code>: Deletes a set of GitHub, GitHub Enterprise, or Bitbucket source credentials.</p></li><li><p><code>DeleteWebhook</code>: For an existing AWS CodeBuild build project that has its source code stored in a GitHub or Bitbucket repository, stops AWS CodeBuild from rebuilding the source code every time a code change is pushed to the repository.</p></li><li><p><code>DescribeTestCases</code>: Returns a list of details about test cases for a report. </p></li><li><p><code>GetResourcePolicy</code>: Gets a resource policy that is identified by its resource ARN. </p></li><li><p><code>ImportSourceCredentials</code>: Imports the source repository credentials for an AWS CodeBuild project that has its source code stored in a GitHub, GitHub Enterprise, or Bitbucket repository.</p></li><li><p><code>InvalidateProjectCache</code>: Resets the cache for a project.</p></li><li><p><code>ListBuilds</code>: Gets a list of build IDs, with each build ID representing a single build.</p></li><li><p><code>ListBuildsForProject</code>: Gets a list of build IDs for the specified build project, with each build ID representing a single build.</p></li><li><p><code>ListCuratedEnvironmentImages</code>: Gets information about Docker images that are managed by AWS CodeBuild.</p></li><li><p><code>ListProjects</code>: Gets a list of build project names, with each build project name representing a single build project.</p></li><li><p><code>ListReportGroups</code>: Gets a list ARNs for the report groups in the current AWS account. </p></li><li><p><code>ListReports</code>: Gets a list ARNs for the reports in the current AWS account. </p></li><li><p><code>ListReportsForReportGroup</code>: Returns a list of ARNs for the reports that belong to a <code>ReportGroup</code>. </p></li><li><p><code>ListSharedProjects</code>: Gets a list of ARNs associated with projects shared with the current AWS account or user.</p></li><li><p><code>ListSharedReportGroups</code>: Gets a list of ARNs associated with report groups shared with the current AWS account or user</p></li><li><p><code>ListSourceCredentials</code>: Returns a list of <code>SourceCredentialsInfo</code> objects. Each <code>SourceCredentialsInfo</code> object includes the authentication type, token ARN, and type of source provider for one set of credentials.</p></li><li><p><code>PutResourcePolicy</code>: Stores a resource policy for the ARN of a <code>Project</code> or <code>ReportGroup</code> object. </p></li><li><p><code>StartBuild</code>: Starts running a build.</p></li><li><p><code>StopBuild</code>: Attempts to stop running a build.</p></li><li><p><code>UpdateProject</code>: Changes the settings of an existing build project.</p></li><li><p><code>UpdateReportGroup</code>: Changes a report group.</p></li><li><p><code>UpdateWebhook</code>: Changes the settings of an existing webhook.</p></li></ul>
 */
@interface AWSCodeBuild : AWSService

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

     let CodeBuild = AWSCodeBuild.default()

 *Objective-C*

     AWSCodeBuild *CodeBuild = [AWSCodeBuild defaultCodeBuild];

 @return The default service client.
 */
+ (instancetype)defaultCodeBuild;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSCodeBuild.register(with: configuration!, forKey: "USWest2CodeBuild")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:@"USWest2CodeBuild"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let CodeBuild = AWSCodeBuild(forKey: "USWest2CodeBuild")

 *Objective-C*

     AWSCodeBuild *CodeBuild = [AWSCodeBuild CodeBuildForKey:@"USWest2CodeBuild"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerCodeBuildWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerCodeBuildWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSCodeBuild.register(with: configuration!, forKey: "USWest2CodeBuild")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:@"USWest2CodeBuild"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let CodeBuild = AWSCodeBuild(forKey: "USWest2CodeBuild")

 *Objective-C*

     AWSCodeBuild *CodeBuild = [AWSCodeBuild CodeBuildForKey:@"USWest2CodeBuild"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)CodeBuildForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeCodeBuildForKey:(NSString *)key;

/**
 <p>Deletes one or more builds.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeleteBuilds service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildBatchDeleteBuildsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildBatchDeleteBuildsInput
 @see AWSCodeBuildBatchDeleteBuildsOutput
 */
- (AWSTask<AWSCodeBuildBatchDeleteBuildsOutput *> *)batchDeleteBuilds:(AWSCodeBuildBatchDeleteBuildsInput *)request;

/**
 <p>Deletes one or more builds.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeleteBuilds service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildBatchDeleteBuildsInput
 @see AWSCodeBuildBatchDeleteBuildsOutput
 */
- (void)batchDeleteBuilds:(AWSCodeBuildBatchDeleteBuildsInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildBatchDeleteBuildsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about one or more builds.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetBuilds service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildBatchGetBuildsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildBatchGetBuildsInput
 @see AWSCodeBuildBatchGetBuildsOutput
 */
- (AWSTask<AWSCodeBuildBatchGetBuildsOutput *> *)batchGetBuilds:(AWSCodeBuildBatchGetBuildsInput *)request;

/**
 <p>Gets information about one or more builds.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetBuilds service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildBatchGetBuildsInput
 @see AWSCodeBuildBatchGetBuildsOutput
 */
- (void)batchGetBuilds:(AWSCodeBuildBatchGetBuildsInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildBatchGetBuildsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about one or more build projects.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetProjects service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildBatchGetProjectsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildBatchGetProjectsInput
 @see AWSCodeBuildBatchGetProjectsOutput
 */
- (AWSTask<AWSCodeBuildBatchGetProjectsOutput *> *)batchGetProjects:(AWSCodeBuildBatchGetProjectsInput *)request;

/**
 <p>Gets information about one or more build projects.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetProjects service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildBatchGetProjectsInput
 @see AWSCodeBuildBatchGetProjectsOutput
 */
- (void)batchGetProjects:(AWSCodeBuildBatchGetProjectsInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildBatchGetProjectsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns an array of report groups. </p>
 
 @param request A container for the necessary parameters to execute the BatchGetReportGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildBatchGetReportGroupsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildBatchGetReportGroupsInput
 @see AWSCodeBuildBatchGetReportGroupsOutput
 */
- (AWSTask<AWSCodeBuildBatchGetReportGroupsOutput *> *)batchGetReportGroups:(AWSCodeBuildBatchGetReportGroupsInput *)request;

/**
 <p> Returns an array of report groups. </p>
 
 @param request A container for the necessary parameters to execute the BatchGetReportGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildBatchGetReportGroupsInput
 @see AWSCodeBuildBatchGetReportGroupsOutput
 */
- (void)batchGetReportGroups:(AWSCodeBuildBatchGetReportGroupsInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildBatchGetReportGroupsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns an array of reports. </p>
 
 @param request A container for the necessary parameters to execute the BatchGetReports service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildBatchGetReportsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildBatchGetReportsInput
 @see AWSCodeBuildBatchGetReportsOutput
 */
- (AWSTask<AWSCodeBuildBatchGetReportsOutput *> *)batchGetReports:(AWSCodeBuildBatchGetReportsInput *)request;

/**
 <p> Returns an array of reports. </p>
 
 @param request A container for the necessary parameters to execute the BatchGetReports service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildBatchGetReportsInput
 @see AWSCodeBuildBatchGetReportsOutput
 */
- (void)batchGetReports:(AWSCodeBuildBatchGetReportsInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildBatchGetReportsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a build project.</p>
 
 @param request A container for the necessary parameters to execute the CreateProject service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildCreateProjectOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceAlreadyExists`, `AWSCodeBuildErrorAccountLimitExceeded`.
 
 @see AWSCodeBuildCreateProjectInput
 @see AWSCodeBuildCreateProjectOutput
 */
- (AWSTask<AWSCodeBuildCreateProjectOutput *> *)createProject:(AWSCodeBuildCreateProjectInput *)request;

/**
 <p>Creates a build project.</p>
 
 @param request A container for the necessary parameters to execute the CreateProject service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceAlreadyExists`, `AWSCodeBuildErrorAccountLimitExceeded`.
 
 @see AWSCodeBuildCreateProjectInput
 @see AWSCodeBuildCreateProjectOutput
 */
- (void)createProject:(AWSCodeBuildCreateProjectInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildCreateProjectOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Creates a report group. A report group contains a collection of reports. </p>
 
 @param request A container for the necessary parameters to execute the CreateReportGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildCreateReportGroupOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceAlreadyExists`, `AWSCodeBuildErrorAccountLimitExceeded`.
 
 @see AWSCodeBuildCreateReportGroupInput
 @see AWSCodeBuildCreateReportGroupOutput
 */
- (AWSTask<AWSCodeBuildCreateReportGroupOutput *> *)createReportGroup:(AWSCodeBuildCreateReportGroupInput *)request;

/**
 <p> Creates a report group. A report group contains a collection of reports. </p>
 
 @param request A container for the necessary parameters to execute the CreateReportGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceAlreadyExists`, `AWSCodeBuildErrorAccountLimitExceeded`.
 
 @see AWSCodeBuildCreateReportGroupInput
 @see AWSCodeBuildCreateReportGroupOutput
 */
- (void)createReportGroup:(AWSCodeBuildCreateReportGroupInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildCreateReportGroupOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>For an existing AWS CodeBuild build project that has its source code stored in a GitHub or Bitbucket repository, enables AWS CodeBuild to start rebuilding the source code every time a code change is pushed to the repository.</p><important><p>If you enable webhooks for an AWS CodeBuild project, and the project is used as a build step in AWS CodePipeline, then two identical builds are created for each commit. One build is triggered through webhooks, and one through AWS CodePipeline. Because billing is on a per-build basis, you are billed for both builds. Therefore, if you are using AWS CodePipeline, we recommend that you disable webhooks in AWS CodeBuild. In the AWS CodeBuild console, clear the Webhook box. For more information, see step 5 in <a href="https://docs.aws.amazon.com/codebuild/latest/userguide/change-project.html#change-project-console">Change a Build Project's Settings</a>.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateWebhook service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildCreateWebhookOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorOAuthProvider`, `AWSCodeBuildErrorResourceAlreadyExists`, `AWSCodeBuildErrorResourceNotFound`.
 
 @see AWSCodeBuildCreateWebhookInput
 @see AWSCodeBuildCreateWebhookOutput
 */
- (AWSTask<AWSCodeBuildCreateWebhookOutput *> *)createWebhook:(AWSCodeBuildCreateWebhookInput *)request;

/**
 <p>For an existing AWS CodeBuild build project that has its source code stored in a GitHub or Bitbucket repository, enables AWS CodeBuild to start rebuilding the source code every time a code change is pushed to the repository.</p><important><p>If you enable webhooks for an AWS CodeBuild project, and the project is used as a build step in AWS CodePipeline, then two identical builds are created for each commit. One build is triggered through webhooks, and one through AWS CodePipeline. Because billing is on a per-build basis, you are billed for both builds. Therefore, if you are using AWS CodePipeline, we recommend that you disable webhooks in AWS CodeBuild. In the AWS CodeBuild console, clear the Webhook box. For more information, see step 5 in <a href="https://docs.aws.amazon.com/codebuild/latest/userguide/change-project.html#change-project-console">Change a Build Project's Settings</a>.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateWebhook service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorOAuthProvider`, `AWSCodeBuildErrorResourceAlreadyExists`, `AWSCodeBuildErrorResourceNotFound`.
 
 @see AWSCodeBuildCreateWebhookInput
 @see AWSCodeBuildCreateWebhookOutput
 */
- (void)createWebhook:(AWSCodeBuildCreateWebhookInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildCreateWebhookOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes a build project. When you delete a project, its builds are not deleted. </p>
 
 @param request A container for the necessary parameters to execute the DeleteProject service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildDeleteProjectOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildDeleteProjectInput
 @see AWSCodeBuildDeleteProjectOutput
 */
- (AWSTask<AWSCodeBuildDeleteProjectOutput *> *)deleteProject:(AWSCodeBuildDeleteProjectInput *)request;

/**
 <p> Deletes a build project. When you delete a project, its builds are not deleted. </p>
 
 @param request A container for the necessary parameters to execute the DeleteProject service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildDeleteProjectInput
 @see AWSCodeBuildDeleteProjectOutput
 */
- (void)deleteProject:(AWSCodeBuildDeleteProjectInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildDeleteProjectOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes a report. </p>
 
 @param request A container for the necessary parameters to execute the DeleteReport service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildDeleteReportOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildDeleteReportInput
 @see AWSCodeBuildDeleteReportOutput
 */
- (AWSTask<AWSCodeBuildDeleteReportOutput *> *)deleteReport:(AWSCodeBuildDeleteReportInput *)request;

/**
 <p> Deletes a report. </p>
 
 @param request A container for the necessary parameters to execute the DeleteReport service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildDeleteReportInput
 @see AWSCodeBuildDeleteReportOutput
 */
- (void)deleteReport:(AWSCodeBuildDeleteReportInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildDeleteReportOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p><code>DeleteReportGroup</code>: Deletes a report group. Before you delete a report group, you must delete its reports. Use <a href="https://docs.aws.amazon.com/codebuild/latest/APIReference/API_ListReportsForReportGroup.html">ListReportsForReportGroup</a> to get the reports in a report group. Use <a href="https://docs.aws.amazon.com/codebuild/latest/APIReference/API_DeleteReport.html">DeleteReport</a> to delete the reports. If you call <code>DeleteReportGroup</code> for a report group that contains one or more reports, an exception is thrown. </p>
 
 @param request A container for the necessary parameters to execute the DeleteReportGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildDeleteReportGroupOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildDeleteReportGroupInput
 @see AWSCodeBuildDeleteReportGroupOutput
 */
- (AWSTask<AWSCodeBuildDeleteReportGroupOutput *> *)deleteReportGroup:(AWSCodeBuildDeleteReportGroupInput *)request;

/**
 <p><code>DeleteReportGroup</code>: Deletes a report group. Before you delete a report group, you must delete its reports. Use <a href="https://docs.aws.amazon.com/codebuild/latest/APIReference/API_ListReportsForReportGroup.html">ListReportsForReportGroup</a> to get the reports in a report group. Use <a href="https://docs.aws.amazon.com/codebuild/latest/APIReference/API_DeleteReport.html">DeleteReport</a> to delete the reports. If you call <code>DeleteReportGroup</code> for a report group that contains one or more reports, an exception is thrown. </p>
 
 @param request A container for the necessary parameters to execute the DeleteReportGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildDeleteReportGroupInput
 @see AWSCodeBuildDeleteReportGroupOutput
 */
- (void)deleteReportGroup:(AWSCodeBuildDeleteReportGroupInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildDeleteReportGroupOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes a resource policy that is identified by its resource ARN. </p>
 
 @param request A container for the necessary parameters to execute the DeleteResourcePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildDeleteResourcePolicyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildDeleteResourcePolicyInput
 @see AWSCodeBuildDeleteResourcePolicyOutput
 */
- (AWSTask<AWSCodeBuildDeleteResourcePolicyOutput *> *)deleteResourcePolicy:(AWSCodeBuildDeleteResourcePolicyInput *)request;

/**
 <p> Deletes a resource policy that is identified by its resource ARN. </p>
 
 @param request A container for the necessary parameters to execute the DeleteResourcePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildDeleteResourcePolicyInput
 @see AWSCodeBuildDeleteResourcePolicyOutput
 */
- (void)deleteResourcePolicy:(AWSCodeBuildDeleteResourcePolicyInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildDeleteResourcePolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes a set of GitHub, GitHub Enterprise, or Bitbucket source credentials. </p>
 
 @param request A container for the necessary parameters to execute the DeleteSourceCredentials service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildDeleteSourceCredentialsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceNotFound`.
 
 @see AWSCodeBuildDeleteSourceCredentialsInput
 @see AWSCodeBuildDeleteSourceCredentialsOutput
 */
- (AWSTask<AWSCodeBuildDeleteSourceCredentialsOutput *> *)deleteSourceCredentials:(AWSCodeBuildDeleteSourceCredentialsInput *)request;

/**
 <p> Deletes a set of GitHub, GitHub Enterprise, or Bitbucket source credentials. </p>
 
 @param request A container for the necessary parameters to execute the DeleteSourceCredentials service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceNotFound`.
 
 @see AWSCodeBuildDeleteSourceCredentialsInput
 @see AWSCodeBuildDeleteSourceCredentialsOutput
 */
- (void)deleteSourceCredentials:(AWSCodeBuildDeleteSourceCredentialsInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildDeleteSourceCredentialsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>For an existing AWS CodeBuild build project that has its source code stored in a GitHub or Bitbucket repository, stops AWS CodeBuild from rebuilding the source code every time a code change is pushed to the repository.</p>
 
 @param request A container for the necessary parameters to execute the DeleteWebhook service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildDeleteWebhookOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceNotFound`, `AWSCodeBuildErrorOAuthProvider`.
 
 @see AWSCodeBuildDeleteWebhookInput
 @see AWSCodeBuildDeleteWebhookOutput
 */
- (AWSTask<AWSCodeBuildDeleteWebhookOutput *> *)deleteWebhook:(AWSCodeBuildDeleteWebhookInput *)request;

/**
 <p>For an existing AWS CodeBuild build project that has its source code stored in a GitHub or Bitbucket repository, stops AWS CodeBuild from rebuilding the source code every time a code change is pushed to the repository.</p>
 
 @param request A container for the necessary parameters to execute the DeleteWebhook service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceNotFound`, `AWSCodeBuildErrorOAuthProvider`.
 
 @see AWSCodeBuildDeleteWebhookInput
 @see AWSCodeBuildDeleteWebhookOutput
 */
- (void)deleteWebhook:(AWSCodeBuildDeleteWebhookInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildDeleteWebhookOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of details about test cases for a report. </p>
 
 @param request A container for the necessary parameters to execute the DescribeTestCases service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildDescribeTestCasesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceNotFound`.
 
 @see AWSCodeBuildDescribeTestCasesInput
 @see AWSCodeBuildDescribeTestCasesOutput
 */
- (AWSTask<AWSCodeBuildDescribeTestCasesOutput *> *)describeTestCases:(AWSCodeBuildDescribeTestCasesInput *)request;

/**
 <p> Returns a list of details about test cases for a report. </p>
 
 @param request A container for the necessary parameters to execute the DescribeTestCases service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceNotFound`.
 
 @see AWSCodeBuildDescribeTestCasesInput
 @see AWSCodeBuildDescribeTestCasesOutput
 */
- (void)describeTestCases:(AWSCodeBuildDescribeTestCasesInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildDescribeTestCasesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets a resource policy that is identified by its resource ARN. </p>
 
 @param request A container for the necessary parameters to execute the GetResourcePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildGetResourcePolicyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorResourceNotFound`, `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildGetResourcePolicyInput
 @see AWSCodeBuildGetResourcePolicyOutput
 */
- (AWSTask<AWSCodeBuildGetResourcePolicyOutput *> *)getResourcePolicy:(AWSCodeBuildGetResourcePolicyInput *)request;

/**
 <p> Gets a resource policy that is identified by its resource ARN. </p>
 
 @param request A container for the necessary parameters to execute the GetResourcePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorResourceNotFound`, `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildGetResourcePolicyInput
 @see AWSCodeBuildGetResourcePolicyOutput
 */
- (void)getResourcePolicy:(AWSCodeBuildGetResourcePolicyInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildGetResourcePolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Imports the source repository credentials for an AWS CodeBuild project that has its source code stored in a GitHub, GitHub Enterprise, or Bitbucket repository. </p>
 
 @param request A container for the necessary parameters to execute the ImportSourceCredentials service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildImportSourceCredentialsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorAccountLimitExceeded`, `AWSCodeBuildErrorResourceAlreadyExists`.
 
 @see AWSCodeBuildImportSourceCredentialsInput
 @see AWSCodeBuildImportSourceCredentialsOutput
 */
- (AWSTask<AWSCodeBuildImportSourceCredentialsOutput *> *)importSourceCredentials:(AWSCodeBuildImportSourceCredentialsInput *)request;

/**
 <p> Imports the source repository credentials for an AWS CodeBuild project that has its source code stored in a GitHub, GitHub Enterprise, or Bitbucket repository. </p>
 
 @param request A container for the necessary parameters to execute the ImportSourceCredentials service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorAccountLimitExceeded`, `AWSCodeBuildErrorResourceAlreadyExists`.
 
 @see AWSCodeBuildImportSourceCredentialsInput
 @see AWSCodeBuildImportSourceCredentialsOutput
 */
- (void)importSourceCredentials:(AWSCodeBuildImportSourceCredentialsInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildImportSourceCredentialsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Resets the cache for a project.</p>
 
 @param request A container for the necessary parameters to execute the InvalidateProjectCache service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildInvalidateProjectCacheOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceNotFound`.
 
 @see AWSCodeBuildInvalidateProjectCacheInput
 @see AWSCodeBuildInvalidateProjectCacheOutput
 */
- (AWSTask<AWSCodeBuildInvalidateProjectCacheOutput *> *)invalidateProjectCache:(AWSCodeBuildInvalidateProjectCacheInput *)request;

/**
 <p>Resets the cache for a project.</p>
 
 @param request A container for the necessary parameters to execute the InvalidateProjectCache service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceNotFound`.
 
 @see AWSCodeBuildInvalidateProjectCacheInput
 @see AWSCodeBuildInvalidateProjectCacheOutput
 */
- (void)invalidateProjectCache:(AWSCodeBuildInvalidateProjectCacheInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildInvalidateProjectCacheOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of build IDs, with each build ID representing a single build.</p>
 
 @param request A container for the necessary parameters to execute the ListBuilds service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildListBuildsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildListBuildsInput
 @see AWSCodeBuildListBuildsOutput
 */
- (AWSTask<AWSCodeBuildListBuildsOutput *> *)listBuilds:(AWSCodeBuildListBuildsInput *)request;

/**
 <p>Gets a list of build IDs, with each build ID representing a single build.</p>
 
 @param request A container for the necessary parameters to execute the ListBuilds service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildListBuildsInput
 @see AWSCodeBuildListBuildsOutput
 */
- (void)listBuilds:(AWSCodeBuildListBuildsInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildListBuildsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of build IDs for the specified build project, with each build ID representing a single build.</p>
 
 @param request A container for the necessary parameters to execute the ListBuildsForProject service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildListBuildsForProjectOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceNotFound`.
 
 @see AWSCodeBuildListBuildsForProjectInput
 @see AWSCodeBuildListBuildsForProjectOutput
 */
- (AWSTask<AWSCodeBuildListBuildsForProjectOutput *> *)listBuildsForProject:(AWSCodeBuildListBuildsForProjectInput *)request;

/**
 <p>Gets a list of build IDs for the specified build project, with each build ID representing a single build.</p>
 
 @param request A container for the necessary parameters to execute the ListBuildsForProject service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceNotFound`.
 
 @see AWSCodeBuildListBuildsForProjectInput
 @see AWSCodeBuildListBuildsForProjectOutput
 */
- (void)listBuildsForProject:(AWSCodeBuildListBuildsForProjectInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildListBuildsForProjectOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about Docker images that are managed by AWS CodeBuild.</p>
 
 @param request A container for the necessary parameters to execute the ListCuratedEnvironmentImages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildListCuratedEnvironmentImagesOutput`.
 
 @see AWSCodeBuildListCuratedEnvironmentImagesInput
 @see AWSCodeBuildListCuratedEnvironmentImagesOutput
 */
- (AWSTask<AWSCodeBuildListCuratedEnvironmentImagesOutput *> *)listCuratedEnvironmentImages:(AWSCodeBuildListCuratedEnvironmentImagesInput *)request;

/**
 <p>Gets information about Docker images that are managed by AWS CodeBuild.</p>
 
 @param request A container for the necessary parameters to execute the ListCuratedEnvironmentImages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCodeBuildListCuratedEnvironmentImagesInput
 @see AWSCodeBuildListCuratedEnvironmentImagesOutput
 */
- (void)listCuratedEnvironmentImages:(AWSCodeBuildListCuratedEnvironmentImagesInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildListCuratedEnvironmentImagesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of build project names, with each build project name representing a single build project.</p>
 
 @param request A container for the necessary parameters to execute the ListProjects service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildListProjectsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildListProjectsInput
 @see AWSCodeBuildListProjectsOutput
 */
- (AWSTask<AWSCodeBuildListProjectsOutput *> *)listProjects:(AWSCodeBuildListProjectsInput *)request;

/**
 <p>Gets a list of build project names, with each build project name representing a single build project.</p>
 
 @param request A container for the necessary parameters to execute the ListProjects service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildListProjectsInput
 @see AWSCodeBuildListProjectsOutput
 */
- (void)listProjects:(AWSCodeBuildListProjectsInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildListProjectsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets a list ARNs for the report groups in the current AWS account. </p>
 
 @param request A container for the necessary parameters to execute the ListReportGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildListReportGroupsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildListReportGroupsInput
 @see AWSCodeBuildListReportGroupsOutput
 */
- (AWSTask<AWSCodeBuildListReportGroupsOutput *> *)listReportGroups:(AWSCodeBuildListReportGroupsInput *)request;

/**
 <p> Gets a list ARNs for the report groups in the current AWS account. </p>
 
 @param request A container for the necessary parameters to execute the ListReportGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildListReportGroupsInput
 @see AWSCodeBuildListReportGroupsOutput
 */
- (void)listReportGroups:(AWSCodeBuildListReportGroupsInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildListReportGroupsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of ARNs for the reports in the current AWS account. </p>
 
 @param request A container for the necessary parameters to execute the ListReports service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildListReportsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildListReportsInput
 @see AWSCodeBuildListReportsOutput
 */
- (AWSTask<AWSCodeBuildListReportsOutput *> *)listReports:(AWSCodeBuildListReportsInput *)request;

/**
 <p> Returns a list of ARNs for the reports in the current AWS account. </p>
 
 @param request A container for the necessary parameters to execute the ListReports service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildListReportsInput
 @see AWSCodeBuildListReportsOutput
 */
- (void)listReports:(AWSCodeBuildListReportsInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildListReportsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of ARNs for the reports that belong to a <code>ReportGroup</code>. </p>
 
 @param request A container for the necessary parameters to execute the ListReportsForReportGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildListReportsForReportGroupOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceNotFound`.
 
 @see AWSCodeBuildListReportsForReportGroupInput
 @see AWSCodeBuildListReportsForReportGroupOutput
 */
- (AWSTask<AWSCodeBuildListReportsForReportGroupOutput *> *)listReportsForReportGroup:(AWSCodeBuildListReportsForReportGroupInput *)request;

/**
 <p> Returns a list of ARNs for the reports that belong to a <code>ReportGroup</code>. </p>
 
 @param request A container for the necessary parameters to execute the ListReportsForReportGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceNotFound`.
 
 @see AWSCodeBuildListReportsForReportGroupInput
 @see AWSCodeBuildListReportsForReportGroupOutput
 */
- (void)listReportsForReportGroup:(AWSCodeBuildListReportsForReportGroupInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildListReportsForReportGroupOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets a list of projects that are shared with other AWS accounts or users. </p>
 
 @param request A container for the necessary parameters to execute the ListSharedProjects service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildListSharedProjectsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildListSharedProjectsInput
 @see AWSCodeBuildListSharedProjectsOutput
 */
- (AWSTask<AWSCodeBuildListSharedProjectsOutput *> *)listSharedProjects:(AWSCodeBuildListSharedProjectsInput *)request;

/**
 <p> Gets a list of projects that are shared with other AWS accounts or users. </p>
 
 @param request A container for the necessary parameters to execute the ListSharedProjects service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildListSharedProjectsInput
 @see AWSCodeBuildListSharedProjectsOutput
 */
- (void)listSharedProjects:(AWSCodeBuildListSharedProjectsInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildListSharedProjectsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets a list of report groups that are shared with other AWS accounts or users. </p>
 
 @param request A container for the necessary parameters to execute the ListSharedReportGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildListSharedReportGroupsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildListSharedReportGroupsInput
 @see AWSCodeBuildListSharedReportGroupsOutput
 */
- (AWSTask<AWSCodeBuildListSharedReportGroupsOutput *> *)listSharedReportGroups:(AWSCodeBuildListSharedReportGroupsInput *)request;

/**
 <p> Gets a list of report groups that are shared with other AWS accounts or users. </p>
 
 @param request A container for the necessary parameters to execute the ListSharedReportGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildListSharedReportGroupsInput
 @see AWSCodeBuildListSharedReportGroupsOutput
 */
- (void)listSharedReportGroups:(AWSCodeBuildListSharedReportGroupsInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildListSharedReportGroupsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of <code>SourceCredentialsInfo</code> objects. </p>
 
 @param request A container for the necessary parameters to execute the ListSourceCredentials service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildListSourceCredentialsOutput`.
 
 @see AWSCodeBuildListSourceCredentialsInput
 @see AWSCodeBuildListSourceCredentialsOutput
 */
- (AWSTask<AWSCodeBuildListSourceCredentialsOutput *> *)listSourceCredentials:(AWSCodeBuildListSourceCredentialsInput *)request;

/**
 <p> Returns a list of <code>SourceCredentialsInfo</code> objects. </p>
 
 @param request A container for the necessary parameters to execute the ListSourceCredentials service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCodeBuildListSourceCredentialsInput
 @see AWSCodeBuildListSourceCredentialsOutput
 */
- (void)listSourceCredentials:(AWSCodeBuildListSourceCredentialsInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildListSourceCredentialsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Stores a resource policy for the ARN of a <code>Project</code> or <code>ReportGroup</code> object. </p>
 
 @param request A container for the necessary parameters to execute the PutResourcePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildPutResourcePolicyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorResourceNotFound`, `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildPutResourcePolicyInput
 @see AWSCodeBuildPutResourcePolicyOutput
 */
- (AWSTask<AWSCodeBuildPutResourcePolicyOutput *> *)putResourcePolicy:(AWSCodeBuildPutResourcePolicyInput *)request;

/**
 <p> Stores a resource policy for the ARN of a <code>Project</code> or <code>ReportGroup</code> object. </p>
 
 @param request A container for the necessary parameters to execute the PutResourcePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorResourceNotFound`, `AWSCodeBuildErrorInvalidInput`.
 
 @see AWSCodeBuildPutResourcePolicyInput
 @see AWSCodeBuildPutResourcePolicyOutput
 */
- (void)putResourcePolicy:(AWSCodeBuildPutResourcePolicyInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildPutResourcePolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts running a build.</p>
 
 @param request A container for the necessary parameters to execute the StartBuild service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildStartBuildOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceNotFound`, `AWSCodeBuildErrorAccountLimitExceeded`.
 
 @see AWSCodeBuildStartBuildInput
 @see AWSCodeBuildStartBuildOutput
 */
- (AWSTask<AWSCodeBuildStartBuildOutput *> *)startBuild:(AWSCodeBuildStartBuildInput *)request;

/**
 <p>Starts running a build.</p>
 
 @param request A container for the necessary parameters to execute the StartBuild service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceNotFound`, `AWSCodeBuildErrorAccountLimitExceeded`.
 
 @see AWSCodeBuildStartBuildInput
 @see AWSCodeBuildStartBuildOutput
 */
- (void)startBuild:(AWSCodeBuildStartBuildInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildStartBuildOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attempts to stop running a build.</p>
 
 @param request A container for the necessary parameters to execute the StopBuild service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildStopBuildOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceNotFound`.
 
 @see AWSCodeBuildStopBuildInput
 @see AWSCodeBuildStopBuildOutput
 */
- (AWSTask<AWSCodeBuildStopBuildOutput *> *)stopBuild:(AWSCodeBuildStopBuildInput *)request;

/**
 <p>Attempts to stop running a build.</p>
 
 @param request A container for the necessary parameters to execute the StopBuild service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceNotFound`.
 
 @see AWSCodeBuildStopBuildInput
 @see AWSCodeBuildStopBuildOutput
 */
- (void)stopBuild:(AWSCodeBuildStopBuildInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildStopBuildOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Changes the settings of a build project.</p>
 
 @param request A container for the necessary parameters to execute the UpdateProject service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildUpdateProjectOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceNotFound`.
 
 @see AWSCodeBuildUpdateProjectInput
 @see AWSCodeBuildUpdateProjectOutput
 */
- (AWSTask<AWSCodeBuildUpdateProjectOutput *> *)updateProject:(AWSCodeBuildUpdateProjectInput *)request;

/**
 <p>Changes the settings of a build project.</p>
 
 @param request A container for the necessary parameters to execute the UpdateProject service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceNotFound`.
 
 @see AWSCodeBuildUpdateProjectInput
 @see AWSCodeBuildUpdateProjectOutput
 */
- (void)updateProject:(AWSCodeBuildUpdateProjectInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildUpdateProjectOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Updates a report group. </p>
 
 @param request A container for the necessary parameters to execute the UpdateReportGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildUpdateReportGroupOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceNotFound`.
 
 @see AWSCodeBuildUpdateReportGroupInput
 @see AWSCodeBuildUpdateReportGroupOutput
 */
- (AWSTask<AWSCodeBuildUpdateReportGroupOutput *> *)updateReportGroup:(AWSCodeBuildUpdateReportGroupInput *)request;

/**
 <p> Updates a report group. </p>
 
 @param request A container for the necessary parameters to execute the UpdateReportGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceNotFound`.
 
 @see AWSCodeBuildUpdateReportGroupInput
 @see AWSCodeBuildUpdateReportGroupOutput
 */
- (void)updateReportGroup:(AWSCodeBuildUpdateReportGroupInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildUpdateReportGroupOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Updates the webhook associated with an AWS CodeBuild build project. </p><note><p> If you use Bitbucket for your repository, <code>rotateSecret</code> is ignored. </p></note>
 
 @param request A container for the necessary parameters to execute the UpdateWebhook service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeBuildUpdateWebhookOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceNotFound`, `AWSCodeBuildErrorOAuthProvider`.
 
 @see AWSCodeBuildUpdateWebhookInput
 @see AWSCodeBuildUpdateWebhookOutput
 */
- (AWSTask<AWSCodeBuildUpdateWebhookOutput *> *)updateWebhook:(AWSCodeBuildUpdateWebhookInput *)request;

/**
 <p> Updates the webhook associated with an AWS CodeBuild build project. </p><note><p> If you use Bitbucket for your repository, <code>rotateSecret</code> is ignored. </p></note>
 
 @param request A container for the necessary parameters to execute the UpdateWebhook service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeBuildErrorDomain` domain and the following error code: `AWSCodeBuildErrorInvalidInput`, `AWSCodeBuildErrorResourceNotFound`, `AWSCodeBuildErrorOAuthProvider`.
 
 @see AWSCodeBuildUpdateWebhookInput
 @see AWSCodeBuildUpdateWebhookOutput
 */
- (void)updateWebhook:(AWSCodeBuildUpdateWebhookInput *)request completionHandler:(void (^ _Nullable)(AWSCodeBuildUpdateWebhookOutput * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
