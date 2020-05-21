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
#import "AWSCodebuildModel.h"
#import "AWSCodebuildResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSCodebuild
FOUNDATION_EXPORT NSString *const AWSCodebuildSDKVersion;

/**
 <fullname>AWS CodeBuild</fullname><p>AWS CodeBuild is a fully managed build service in the cloud. AWS CodeBuild compiles your source code, runs unit tests, and produces artifacts that are ready to deploy. AWS CodeBuild eliminates the need to provision, manage, and scale your own build servers. It provides prepackaged build environments for the most popular programming languages and build tools, such as Apache Maven, Gradle, and more. You can also fully customize build environments in AWS CodeBuild to use your own build tools. AWS CodeBuild scales automatically to meet peak build requests. You pay only for the build time you consume. For more information about AWS CodeBuild, see the <i><a href="https://docs.aws.amazon.com/codebuild/latest/userguide/welcome.html">AWS CodeBuild User Guide</a>.</i></p><p>AWS CodeBuild supports these operations:</p><ul><li><p><code>BatchDeleteBuilds</code>: Deletes one or more builds.</p></li><li><p><code>BatchGetBuilds</code>: Gets information about one or more builds.</p></li><li><p><code>BatchGetProjects</code>: Gets information about one or more build projects. A <i>build project</i> defines how AWS CodeBuild runs a build. This includes information such as where to get the source code to build, the build environment to use, the build commands to run, and where to store the build output. A <i>build environment</i> is a representation of operating system, programming language runtime, and tools that AWS CodeBuild uses to run a build. You can add tags to build projects to help manage your resources and costs.</p></li><li><p><code>BatchGetReportGroups</code>: Returns an array of report groups. </p></li><li><p><code>BatchGetReports</code>: Returns an array of reports. </p></li><li><p><code>CreateProject</code>: Creates a build project.</p></li><li><p><code>CreateReportGroup</code>: Creates a report group. A report group contains a collection of reports. </p></li><li><p><code>CreateWebhook</code>: For an existing AWS CodeBuild build project that has its source code stored in a GitHub or Bitbucket repository, enables AWS CodeBuild to start rebuilding the source code every time a code change is pushed to the repository.</p></li><li><p><code>DeleteProject</code>: Deletes a build project.</p></li><li><p><code>DeleteReport</code>: Deletes a report. </p></li><li><p><code>DeleteReportGroup</code>: Deletes a report group. </p></li><li><p><code>DeleteResourcePolicy</code>: Deletes a resource policy that is identified by its resource ARN. </p></li><li><p><code>DeleteSourceCredentials</code>: Deletes a set of GitHub, GitHub Enterprise, or Bitbucket source credentials.</p></li><li><p><code>DeleteWebhook</code>: For an existing AWS CodeBuild build project that has its source code stored in a GitHub or Bitbucket repository, stops AWS CodeBuild from rebuilding the source code every time a code change is pushed to the repository.</p></li><li><p><code>DescribeTestCases</code>: Returns a list of details about test cases for a report. </p></li><li><p><code>GetResourcePolicy</code>: Gets a resource policy that is identified by its resource ARN. </p></li><li><p><code>ImportSourceCredentials</code>: Imports the source repository credentials for an AWS CodeBuild project that has its source code stored in a GitHub, GitHub Enterprise, or Bitbucket repository.</p></li><li><p><code>InvalidateProjectCache</code>: Resets the cache for a project.</p></li><li><p><code>ListBuilds</code>: Gets a list of build IDs, with each build ID representing a single build.</p></li><li><p><code>ListBuildsForProject</code>: Gets a list of build IDs for the specified build project, with each build ID representing a single build.</p></li><li><p><code>ListCuratedEnvironmentImages</code>: Gets information about Docker images that are managed by AWS CodeBuild.</p></li><li><p><code>ListProjects</code>: Gets a list of build project names, with each build project name representing a single build project.</p></li><li><p><code>ListReportGroups</code>: Gets a list ARNs for the report groups in the current AWS account. </p></li><li><p><code>ListReports</code>: Gets a list ARNs for the reports in the current AWS account. </p></li><li><p><code>ListReportsForReportGroup</code>: Returns a list of ARNs for the reports that belong to a <code>ReportGroup</code>. </p></li><li><p><code>ListSharedProjects</code>: Gets a list of ARNs associated with projects shared with the current AWS account or user.</p></li><li><p><code>ListSharedReportGroups</code>: Gets a list of ARNs associated with report groups shared with the current AWS account or user</p></li><li><p><code>ListSourceCredentials</code>: Returns a list of <code>SourceCredentialsInfo</code> objects. Each <code>SourceCredentialsInfo</code> object includes the authentication type, token ARN, and type of source provider for one set of credentials.</p></li><li><p><code>PutResourcePolicy</code>: Stores a resource policy for the ARN of a <code>Project</code> or <code>ReportGroup</code> object. </p></li><li><p><code>StartBuild</code>: Starts running a build.</p></li><li><p><code>StopBuild</code>: Attempts to stop running a build.</p></li><li><p><code>UpdateProject</code>: Changes the settings of an existing build project.</p></li><li><p><code>UpdateReportGroup</code>: Changes a report group.</p></li><li><p><code>UpdateWebhook</code>: Changes the settings of an existing webhook.</p></li></ul>
 */
@interface AWSCodebuild : AWSService

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

     let Codebuild = AWSCodebuild.default()

 *Objective-C*

     AWSCodebuild *Codebuild = [AWSCodebuild defaultCodebuild];

 @return The default service client.
 */
+ (instancetype)defaultCodebuild;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSCodebuild.register(with: configuration!, forKey: "USWest2Codebuild")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSCodebuild registerCodebuildWithConfiguration:configuration forKey:@"USWest2Codebuild"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Codebuild = AWSCodebuild(forKey: "USWest2Codebuild")

 *Objective-C*

     AWSCodebuild *Codebuild = [AWSCodebuild CodebuildForKey:@"USWest2Codebuild"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerCodebuildWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerCodebuildWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSCodebuild.register(with: configuration!, forKey: "USWest2Codebuild")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSCodebuild registerCodebuildWithConfiguration:configuration forKey:@"USWest2Codebuild"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Codebuild = AWSCodebuild(forKey: "USWest2Codebuild")

 *Objective-C*

     AWSCodebuild *Codebuild = [AWSCodebuild CodebuildForKey:@"USWest2Codebuild"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)CodebuildForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeCodebuildForKey:(NSString *)key;

/**
 <p>Deletes one or more builds.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeleteBuilds service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildBatchDeleteBuildsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildBatchDeleteBuildsInput
 @see AWSCodebuildBatchDeleteBuildsOutput
 */
- (AWSTask<AWSCodebuildBatchDeleteBuildsOutput *> *)batchDeleteBuilds:(AWSCodebuildBatchDeleteBuildsInput *)request;

/**
 <p>Deletes one or more builds.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeleteBuilds service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildBatchDeleteBuildsInput
 @see AWSCodebuildBatchDeleteBuildsOutput
 */
- (void)batchDeleteBuilds:(AWSCodebuildBatchDeleteBuildsInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildBatchDeleteBuildsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about one or more builds.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetBuilds service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildBatchGetBuildsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildBatchGetBuildsInput
 @see AWSCodebuildBatchGetBuildsOutput
 */
- (AWSTask<AWSCodebuildBatchGetBuildsOutput *> *)batchGetBuilds:(AWSCodebuildBatchGetBuildsInput *)request;

/**
 <p>Gets information about one or more builds.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetBuilds service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildBatchGetBuildsInput
 @see AWSCodebuildBatchGetBuildsOutput
 */
- (void)batchGetBuilds:(AWSCodebuildBatchGetBuildsInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildBatchGetBuildsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about one or more build projects.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetProjects service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildBatchGetProjectsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildBatchGetProjectsInput
 @see AWSCodebuildBatchGetProjectsOutput
 */
- (AWSTask<AWSCodebuildBatchGetProjectsOutput *> *)batchGetProjects:(AWSCodebuildBatchGetProjectsInput *)request;

/**
 <p>Gets information about one or more build projects.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetProjects service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildBatchGetProjectsInput
 @see AWSCodebuildBatchGetProjectsOutput
 */
- (void)batchGetProjects:(AWSCodebuildBatchGetProjectsInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildBatchGetProjectsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns an array of report groups. </p>
 
 @param request A container for the necessary parameters to execute the BatchGetReportGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildBatchGetReportGroupsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildBatchGetReportGroupsInput
 @see AWSCodebuildBatchGetReportGroupsOutput
 */
- (AWSTask<AWSCodebuildBatchGetReportGroupsOutput *> *)batchGetReportGroups:(AWSCodebuildBatchGetReportGroupsInput *)request;

/**
 <p> Returns an array of report groups. </p>
 
 @param request A container for the necessary parameters to execute the BatchGetReportGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildBatchGetReportGroupsInput
 @see AWSCodebuildBatchGetReportGroupsOutput
 */
- (void)batchGetReportGroups:(AWSCodebuildBatchGetReportGroupsInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildBatchGetReportGroupsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns an array of reports. </p>
 
 @param request A container for the necessary parameters to execute the BatchGetReports service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildBatchGetReportsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildBatchGetReportsInput
 @see AWSCodebuildBatchGetReportsOutput
 */
- (AWSTask<AWSCodebuildBatchGetReportsOutput *> *)batchGetReports:(AWSCodebuildBatchGetReportsInput *)request;

/**
 <p> Returns an array of reports. </p>
 
 @param request A container for the necessary parameters to execute the BatchGetReports service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildBatchGetReportsInput
 @see AWSCodebuildBatchGetReportsOutput
 */
- (void)batchGetReports:(AWSCodebuildBatchGetReportsInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildBatchGetReportsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a build project.</p>
 
 @param request A container for the necessary parameters to execute the CreateProject service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildCreateProjectOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceAlreadyExists`, `AWSCodebuildErrorAccountLimitExceeded`.
 
 @see AWSCodebuildCreateProjectInput
 @see AWSCodebuildCreateProjectOutput
 */
- (AWSTask<AWSCodebuildCreateProjectOutput *> *)createProject:(AWSCodebuildCreateProjectInput *)request;

/**
 <p>Creates a build project.</p>
 
 @param request A container for the necessary parameters to execute the CreateProject service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceAlreadyExists`, `AWSCodebuildErrorAccountLimitExceeded`.
 
 @see AWSCodebuildCreateProjectInput
 @see AWSCodebuildCreateProjectOutput
 */
- (void)createProject:(AWSCodebuildCreateProjectInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildCreateProjectOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Creates a report group. A report group contains a collection of reports. </p>
 
 @param request A container for the necessary parameters to execute the CreateReportGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildCreateReportGroupOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceAlreadyExists`, `AWSCodebuildErrorAccountLimitExceeded`.
 
 @see AWSCodebuildCreateReportGroupInput
 @see AWSCodebuildCreateReportGroupOutput
 */
- (AWSTask<AWSCodebuildCreateReportGroupOutput *> *)createReportGroup:(AWSCodebuildCreateReportGroupInput *)request;

/**
 <p> Creates a report group. A report group contains a collection of reports. </p>
 
 @param request A container for the necessary parameters to execute the CreateReportGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceAlreadyExists`, `AWSCodebuildErrorAccountLimitExceeded`.
 
 @see AWSCodebuildCreateReportGroupInput
 @see AWSCodebuildCreateReportGroupOutput
 */
- (void)createReportGroup:(AWSCodebuildCreateReportGroupInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildCreateReportGroupOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>For an existing AWS CodeBuild build project that has its source code stored in a GitHub or Bitbucket repository, enables AWS CodeBuild to start rebuilding the source code every time a code change is pushed to the repository.</p><important><p>If you enable webhooks for an AWS CodeBuild project, and the project is used as a build step in AWS CodePipeline, then two identical builds are created for each commit. One build is triggered through webhooks, and one through AWS CodePipeline. Because billing is on a per-build basis, you are billed for both builds. Therefore, if you are using AWS CodePipeline, we recommend that you disable webhooks in AWS CodeBuild. In the AWS CodeBuild console, clear the Webhook box. For more information, see step 5 in <a href="https://docs.aws.amazon.com/codebuild/latest/userguide/change-project.html#change-project-console">Change a Build Project's Settings</a>.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateWebhook service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildCreateWebhookOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorOAuthProvider`, `AWSCodebuildErrorResourceAlreadyExists`, `AWSCodebuildErrorResourceNotFound`.
 
 @see AWSCodebuildCreateWebhookInput
 @see AWSCodebuildCreateWebhookOutput
 */
- (AWSTask<AWSCodebuildCreateWebhookOutput *> *)createWebhook:(AWSCodebuildCreateWebhookInput *)request;

/**
 <p>For an existing AWS CodeBuild build project that has its source code stored in a GitHub or Bitbucket repository, enables AWS CodeBuild to start rebuilding the source code every time a code change is pushed to the repository.</p><important><p>If you enable webhooks for an AWS CodeBuild project, and the project is used as a build step in AWS CodePipeline, then two identical builds are created for each commit. One build is triggered through webhooks, and one through AWS CodePipeline. Because billing is on a per-build basis, you are billed for both builds. Therefore, if you are using AWS CodePipeline, we recommend that you disable webhooks in AWS CodeBuild. In the AWS CodeBuild console, clear the Webhook box. For more information, see step 5 in <a href="https://docs.aws.amazon.com/codebuild/latest/userguide/change-project.html#change-project-console">Change a Build Project's Settings</a>.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateWebhook service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorOAuthProvider`, `AWSCodebuildErrorResourceAlreadyExists`, `AWSCodebuildErrorResourceNotFound`.
 
 @see AWSCodebuildCreateWebhookInput
 @see AWSCodebuildCreateWebhookOutput
 */
- (void)createWebhook:(AWSCodebuildCreateWebhookInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildCreateWebhookOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes a build project. When you delete a project, its builds are not deleted. </p>
 
 @param request A container for the necessary parameters to execute the DeleteProject service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildDeleteProjectOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildDeleteProjectInput
 @see AWSCodebuildDeleteProjectOutput
 */
- (AWSTask<AWSCodebuildDeleteProjectOutput *> *)deleteProject:(AWSCodebuildDeleteProjectInput *)request;

/**
 <p> Deletes a build project. When you delete a project, its builds are not deleted. </p>
 
 @param request A container for the necessary parameters to execute the DeleteProject service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildDeleteProjectInput
 @see AWSCodebuildDeleteProjectOutput
 */
- (void)deleteProject:(AWSCodebuildDeleteProjectInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildDeleteProjectOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes a report. </p>
 
 @param request A container for the necessary parameters to execute the DeleteReport service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildDeleteReportOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildDeleteReportInput
 @see AWSCodebuildDeleteReportOutput
 */
- (AWSTask<AWSCodebuildDeleteReportOutput *> *)deleteReport:(AWSCodebuildDeleteReportInput *)request;

/**
 <p> Deletes a report. </p>
 
 @param request A container for the necessary parameters to execute the DeleteReport service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildDeleteReportInput
 @see AWSCodebuildDeleteReportOutput
 */
- (void)deleteReport:(AWSCodebuildDeleteReportInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildDeleteReportOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p><code>DeleteReportGroup</code>: Deletes a report group. Before you delete a report group, you must delete its reports. Use <a href="https://docs.aws.amazon.com/codebuild/latest/APIReference/API_ListReportsForReportGroup.html">ListReportsForReportGroup</a> to get the reports in a report group. Use <a href="https://docs.aws.amazon.com/codebuild/latest/APIReference/API_DeleteReport.html">DeleteReport</a> to delete the reports. If you call <code>DeleteReportGroup</code> for a report group that contains one or more reports, an exception is thrown. </p>
 
 @param request A container for the necessary parameters to execute the DeleteReportGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildDeleteReportGroupOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildDeleteReportGroupInput
 @see AWSCodebuildDeleteReportGroupOutput
 */
- (AWSTask<AWSCodebuildDeleteReportGroupOutput *> *)deleteReportGroup:(AWSCodebuildDeleteReportGroupInput *)request;

/**
 <p><code>DeleteReportGroup</code>: Deletes a report group. Before you delete a report group, you must delete its reports. Use <a href="https://docs.aws.amazon.com/codebuild/latest/APIReference/API_ListReportsForReportGroup.html">ListReportsForReportGroup</a> to get the reports in a report group. Use <a href="https://docs.aws.amazon.com/codebuild/latest/APIReference/API_DeleteReport.html">DeleteReport</a> to delete the reports. If you call <code>DeleteReportGroup</code> for a report group that contains one or more reports, an exception is thrown. </p>
 
 @param request A container for the necessary parameters to execute the DeleteReportGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildDeleteReportGroupInput
 @see AWSCodebuildDeleteReportGroupOutput
 */
- (void)deleteReportGroup:(AWSCodebuildDeleteReportGroupInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildDeleteReportGroupOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes a resource policy that is identified by its resource ARN. </p>
 
 @param request A container for the necessary parameters to execute the DeleteResourcePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildDeleteResourcePolicyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildDeleteResourcePolicyInput
 @see AWSCodebuildDeleteResourcePolicyOutput
 */
- (AWSTask<AWSCodebuildDeleteResourcePolicyOutput *> *)deleteResourcePolicy:(AWSCodebuildDeleteResourcePolicyInput *)request;

/**
 <p> Deletes a resource policy that is identified by its resource ARN. </p>
 
 @param request A container for the necessary parameters to execute the DeleteResourcePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildDeleteResourcePolicyInput
 @see AWSCodebuildDeleteResourcePolicyOutput
 */
- (void)deleteResourcePolicy:(AWSCodebuildDeleteResourcePolicyInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildDeleteResourcePolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes a set of GitHub, GitHub Enterprise, or Bitbucket source credentials. </p>
 
 @param request A container for the necessary parameters to execute the DeleteSourceCredentials service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildDeleteSourceCredentialsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceNotFound`.
 
 @see AWSCodebuildDeleteSourceCredentialsInput
 @see AWSCodebuildDeleteSourceCredentialsOutput
 */
- (AWSTask<AWSCodebuildDeleteSourceCredentialsOutput *> *)deleteSourceCredentials:(AWSCodebuildDeleteSourceCredentialsInput *)request;

/**
 <p> Deletes a set of GitHub, GitHub Enterprise, or Bitbucket source credentials. </p>
 
 @param request A container for the necessary parameters to execute the DeleteSourceCredentials service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceNotFound`.
 
 @see AWSCodebuildDeleteSourceCredentialsInput
 @see AWSCodebuildDeleteSourceCredentialsOutput
 */
- (void)deleteSourceCredentials:(AWSCodebuildDeleteSourceCredentialsInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildDeleteSourceCredentialsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>For an existing AWS CodeBuild build project that has its source code stored in a GitHub or Bitbucket repository, stops AWS CodeBuild from rebuilding the source code every time a code change is pushed to the repository.</p>
 
 @param request A container for the necessary parameters to execute the DeleteWebhook service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildDeleteWebhookOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceNotFound`, `AWSCodebuildErrorOAuthProvider`.
 
 @see AWSCodebuildDeleteWebhookInput
 @see AWSCodebuildDeleteWebhookOutput
 */
- (AWSTask<AWSCodebuildDeleteWebhookOutput *> *)deleteWebhook:(AWSCodebuildDeleteWebhookInput *)request;

/**
 <p>For an existing AWS CodeBuild build project that has its source code stored in a GitHub or Bitbucket repository, stops AWS CodeBuild from rebuilding the source code every time a code change is pushed to the repository.</p>
 
 @param request A container for the necessary parameters to execute the DeleteWebhook service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceNotFound`, `AWSCodebuildErrorOAuthProvider`.
 
 @see AWSCodebuildDeleteWebhookInput
 @see AWSCodebuildDeleteWebhookOutput
 */
- (void)deleteWebhook:(AWSCodebuildDeleteWebhookInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildDeleteWebhookOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of details about test cases for a report. </p>
 
 @param request A container for the necessary parameters to execute the DescribeTestCases service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildDescribeTestCasesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceNotFound`.
 
 @see AWSCodebuildDescribeTestCasesInput
 @see AWSCodebuildDescribeTestCasesOutput
 */
- (AWSTask<AWSCodebuildDescribeTestCasesOutput *> *)describeTestCases:(AWSCodebuildDescribeTestCasesInput *)request;

/**
 <p> Returns a list of details about test cases for a report. </p>
 
 @param request A container for the necessary parameters to execute the DescribeTestCases service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceNotFound`.
 
 @see AWSCodebuildDescribeTestCasesInput
 @see AWSCodebuildDescribeTestCasesOutput
 */
- (void)describeTestCases:(AWSCodebuildDescribeTestCasesInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildDescribeTestCasesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets a resource policy that is identified by its resource ARN. </p>
 
 @param request A container for the necessary parameters to execute the GetResourcePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildGetResourcePolicyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorResourceNotFound`, `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildGetResourcePolicyInput
 @see AWSCodebuildGetResourcePolicyOutput
 */
- (AWSTask<AWSCodebuildGetResourcePolicyOutput *> *)getResourcePolicy:(AWSCodebuildGetResourcePolicyInput *)request;

/**
 <p> Gets a resource policy that is identified by its resource ARN. </p>
 
 @param request A container for the necessary parameters to execute the GetResourcePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorResourceNotFound`, `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildGetResourcePolicyInput
 @see AWSCodebuildGetResourcePolicyOutput
 */
- (void)getResourcePolicy:(AWSCodebuildGetResourcePolicyInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildGetResourcePolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Imports the source repository credentials for an AWS CodeBuild project that has its source code stored in a GitHub, GitHub Enterprise, or Bitbucket repository. </p>
 
 @param request A container for the necessary parameters to execute the ImportSourceCredentials service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildImportSourceCredentialsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorAccountLimitExceeded`, `AWSCodebuildErrorResourceAlreadyExists`.
 
 @see AWSCodebuildImportSourceCredentialsInput
 @see AWSCodebuildImportSourceCredentialsOutput
 */
- (AWSTask<AWSCodebuildImportSourceCredentialsOutput *> *)importSourceCredentials:(AWSCodebuildImportSourceCredentialsInput *)request;

/**
 <p> Imports the source repository credentials for an AWS CodeBuild project that has its source code stored in a GitHub, GitHub Enterprise, or Bitbucket repository. </p>
 
 @param request A container for the necessary parameters to execute the ImportSourceCredentials service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorAccountLimitExceeded`, `AWSCodebuildErrorResourceAlreadyExists`.
 
 @see AWSCodebuildImportSourceCredentialsInput
 @see AWSCodebuildImportSourceCredentialsOutput
 */
- (void)importSourceCredentials:(AWSCodebuildImportSourceCredentialsInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildImportSourceCredentialsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Resets the cache for a project.</p>
 
 @param request A container for the necessary parameters to execute the InvalidateProjectCache service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildInvalidateProjectCacheOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceNotFound`.
 
 @see AWSCodebuildInvalidateProjectCacheInput
 @see AWSCodebuildInvalidateProjectCacheOutput
 */
- (AWSTask<AWSCodebuildInvalidateProjectCacheOutput *> *)invalidateProjectCache:(AWSCodebuildInvalidateProjectCacheInput *)request;

/**
 <p>Resets the cache for a project.</p>
 
 @param request A container for the necessary parameters to execute the InvalidateProjectCache service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceNotFound`.
 
 @see AWSCodebuildInvalidateProjectCacheInput
 @see AWSCodebuildInvalidateProjectCacheOutput
 */
- (void)invalidateProjectCache:(AWSCodebuildInvalidateProjectCacheInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildInvalidateProjectCacheOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of build IDs, with each build ID representing a single build.</p>
 
 @param request A container for the necessary parameters to execute the ListBuilds service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildListBuildsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildListBuildsInput
 @see AWSCodebuildListBuildsOutput
 */
- (AWSTask<AWSCodebuildListBuildsOutput *> *)listBuilds:(AWSCodebuildListBuildsInput *)request;

/**
 <p>Gets a list of build IDs, with each build ID representing a single build.</p>
 
 @param request A container for the necessary parameters to execute the ListBuilds service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildListBuildsInput
 @see AWSCodebuildListBuildsOutput
 */
- (void)listBuilds:(AWSCodebuildListBuildsInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildListBuildsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of build IDs for the specified build project, with each build ID representing a single build.</p>
 
 @param request A container for the necessary parameters to execute the ListBuildsForProject service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildListBuildsForProjectOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceNotFound`.
 
 @see AWSCodebuildListBuildsForProjectInput
 @see AWSCodebuildListBuildsForProjectOutput
 */
- (AWSTask<AWSCodebuildListBuildsForProjectOutput *> *)listBuildsForProject:(AWSCodebuildListBuildsForProjectInput *)request;

/**
 <p>Gets a list of build IDs for the specified build project, with each build ID representing a single build.</p>
 
 @param request A container for the necessary parameters to execute the ListBuildsForProject service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceNotFound`.
 
 @see AWSCodebuildListBuildsForProjectInput
 @see AWSCodebuildListBuildsForProjectOutput
 */
- (void)listBuildsForProject:(AWSCodebuildListBuildsForProjectInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildListBuildsForProjectOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about Docker images that are managed by AWS CodeBuild.</p>
 
 @param request A container for the necessary parameters to execute the ListCuratedEnvironmentImages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildListCuratedEnvironmentImagesOutput`.
 
 @see AWSCodebuildListCuratedEnvironmentImagesInput
 @see AWSCodebuildListCuratedEnvironmentImagesOutput
 */
- (AWSTask<AWSCodebuildListCuratedEnvironmentImagesOutput *> *)listCuratedEnvironmentImages:(AWSCodebuildListCuratedEnvironmentImagesInput *)request;

/**
 <p>Gets information about Docker images that are managed by AWS CodeBuild.</p>
 
 @param request A container for the necessary parameters to execute the ListCuratedEnvironmentImages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCodebuildListCuratedEnvironmentImagesInput
 @see AWSCodebuildListCuratedEnvironmentImagesOutput
 */
- (void)listCuratedEnvironmentImages:(AWSCodebuildListCuratedEnvironmentImagesInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildListCuratedEnvironmentImagesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of build project names, with each build project name representing a single build project.</p>
 
 @param request A container for the necessary parameters to execute the ListProjects service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildListProjectsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildListProjectsInput
 @see AWSCodebuildListProjectsOutput
 */
- (AWSTask<AWSCodebuildListProjectsOutput *> *)listProjects:(AWSCodebuildListProjectsInput *)request;

/**
 <p>Gets a list of build project names, with each build project name representing a single build project.</p>
 
 @param request A container for the necessary parameters to execute the ListProjects service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildListProjectsInput
 @see AWSCodebuildListProjectsOutput
 */
- (void)listProjects:(AWSCodebuildListProjectsInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildListProjectsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets a list ARNs for the report groups in the current AWS account. </p>
 
 @param request A container for the necessary parameters to execute the ListReportGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildListReportGroupsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildListReportGroupsInput
 @see AWSCodebuildListReportGroupsOutput
 */
- (AWSTask<AWSCodebuildListReportGroupsOutput *> *)listReportGroups:(AWSCodebuildListReportGroupsInput *)request;

/**
 <p> Gets a list ARNs for the report groups in the current AWS account. </p>
 
 @param request A container for the necessary parameters to execute the ListReportGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildListReportGroupsInput
 @see AWSCodebuildListReportGroupsOutput
 */
- (void)listReportGroups:(AWSCodebuildListReportGroupsInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildListReportGroupsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of ARNs for the reports in the current AWS account. </p>
 
 @param request A container for the necessary parameters to execute the ListReports service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildListReportsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildListReportsInput
 @see AWSCodebuildListReportsOutput
 */
- (AWSTask<AWSCodebuildListReportsOutput *> *)listReports:(AWSCodebuildListReportsInput *)request;

/**
 <p> Returns a list of ARNs for the reports in the current AWS account. </p>
 
 @param request A container for the necessary parameters to execute the ListReports service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildListReportsInput
 @see AWSCodebuildListReportsOutput
 */
- (void)listReports:(AWSCodebuildListReportsInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildListReportsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of ARNs for the reports that belong to a <code>ReportGroup</code>. </p>
 
 @param request A container for the necessary parameters to execute the ListReportsForReportGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildListReportsForReportGroupOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceNotFound`.
 
 @see AWSCodebuildListReportsForReportGroupInput
 @see AWSCodebuildListReportsForReportGroupOutput
 */
- (AWSTask<AWSCodebuildListReportsForReportGroupOutput *> *)listReportsForReportGroup:(AWSCodebuildListReportsForReportGroupInput *)request;

/**
 <p> Returns a list of ARNs for the reports that belong to a <code>ReportGroup</code>. </p>
 
 @param request A container for the necessary parameters to execute the ListReportsForReportGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceNotFound`.
 
 @see AWSCodebuildListReportsForReportGroupInput
 @see AWSCodebuildListReportsForReportGroupOutput
 */
- (void)listReportsForReportGroup:(AWSCodebuildListReportsForReportGroupInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildListReportsForReportGroupOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets a list of projects that are shared with other AWS accounts or users. </p>
 
 @param request A container for the necessary parameters to execute the ListSharedProjects service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildListSharedProjectsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildListSharedProjectsInput
 @see AWSCodebuildListSharedProjectsOutput
 */
- (AWSTask<AWSCodebuildListSharedProjectsOutput *> *)listSharedProjects:(AWSCodebuildListSharedProjectsInput *)request;

/**
 <p> Gets a list of projects that are shared with other AWS accounts or users. </p>
 
 @param request A container for the necessary parameters to execute the ListSharedProjects service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildListSharedProjectsInput
 @see AWSCodebuildListSharedProjectsOutput
 */
- (void)listSharedProjects:(AWSCodebuildListSharedProjectsInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildListSharedProjectsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets a list of report groups that are shared with other AWS accounts or users. </p>
 
 @param request A container for the necessary parameters to execute the ListSharedReportGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildListSharedReportGroupsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildListSharedReportGroupsInput
 @see AWSCodebuildListSharedReportGroupsOutput
 */
- (AWSTask<AWSCodebuildListSharedReportGroupsOutput *> *)listSharedReportGroups:(AWSCodebuildListSharedReportGroupsInput *)request;

/**
 <p> Gets a list of report groups that are shared with other AWS accounts or users. </p>
 
 @param request A container for the necessary parameters to execute the ListSharedReportGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildListSharedReportGroupsInput
 @see AWSCodebuildListSharedReportGroupsOutput
 */
- (void)listSharedReportGroups:(AWSCodebuildListSharedReportGroupsInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildListSharedReportGroupsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of <code>SourceCredentialsInfo</code> objects. </p>
 
 @param request A container for the necessary parameters to execute the ListSourceCredentials service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildListSourceCredentialsOutput`.
 
 @see AWSCodebuildListSourceCredentialsInput
 @see AWSCodebuildListSourceCredentialsOutput
 */
- (AWSTask<AWSCodebuildListSourceCredentialsOutput *> *)listSourceCredentials:(AWSCodebuildListSourceCredentialsInput *)request;

/**
 <p> Returns a list of <code>SourceCredentialsInfo</code> objects. </p>
 
 @param request A container for the necessary parameters to execute the ListSourceCredentials service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCodebuildListSourceCredentialsInput
 @see AWSCodebuildListSourceCredentialsOutput
 */
- (void)listSourceCredentials:(AWSCodebuildListSourceCredentialsInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildListSourceCredentialsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Stores a resource policy for the ARN of a <code>Project</code> or <code>ReportGroup</code> object. </p>
 
 @param request A container for the necessary parameters to execute the PutResourcePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildPutResourcePolicyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorResourceNotFound`, `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildPutResourcePolicyInput
 @see AWSCodebuildPutResourcePolicyOutput
 */
- (AWSTask<AWSCodebuildPutResourcePolicyOutput *> *)putResourcePolicy:(AWSCodebuildPutResourcePolicyInput *)request;

/**
 <p> Stores a resource policy for the ARN of a <code>Project</code> or <code>ReportGroup</code> object. </p>
 
 @param request A container for the necessary parameters to execute the PutResourcePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorResourceNotFound`, `AWSCodebuildErrorInvalidInput`.
 
 @see AWSCodebuildPutResourcePolicyInput
 @see AWSCodebuildPutResourcePolicyOutput
 */
- (void)putResourcePolicy:(AWSCodebuildPutResourcePolicyInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildPutResourcePolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts running a build.</p>
 
 @param request A container for the necessary parameters to execute the StartBuild service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildStartBuildOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceNotFound`, `AWSCodebuildErrorAccountLimitExceeded`.
 
 @see AWSCodebuildStartBuildInput
 @see AWSCodebuildStartBuildOutput
 */
- (AWSTask<AWSCodebuildStartBuildOutput *> *)startBuild:(AWSCodebuildStartBuildInput *)request;

/**
 <p>Starts running a build.</p>
 
 @param request A container for the necessary parameters to execute the StartBuild service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceNotFound`, `AWSCodebuildErrorAccountLimitExceeded`.
 
 @see AWSCodebuildStartBuildInput
 @see AWSCodebuildStartBuildOutput
 */
- (void)startBuild:(AWSCodebuildStartBuildInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildStartBuildOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attempts to stop running a build.</p>
 
 @param request A container for the necessary parameters to execute the StopBuild service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildStopBuildOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceNotFound`.
 
 @see AWSCodebuildStopBuildInput
 @see AWSCodebuildStopBuildOutput
 */
- (AWSTask<AWSCodebuildStopBuildOutput *> *)stopBuild:(AWSCodebuildStopBuildInput *)request;

/**
 <p>Attempts to stop running a build.</p>
 
 @param request A container for the necessary parameters to execute the StopBuild service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceNotFound`.
 
 @see AWSCodebuildStopBuildInput
 @see AWSCodebuildStopBuildOutput
 */
- (void)stopBuild:(AWSCodebuildStopBuildInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildStopBuildOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Changes the settings of a build project.</p>
 
 @param request A container for the necessary parameters to execute the UpdateProject service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildUpdateProjectOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceNotFound`.
 
 @see AWSCodebuildUpdateProjectInput
 @see AWSCodebuildUpdateProjectOutput
 */
- (AWSTask<AWSCodebuildUpdateProjectOutput *> *)updateProject:(AWSCodebuildUpdateProjectInput *)request;

/**
 <p>Changes the settings of a build project.</p>
 
 @param request A container for the necessary parameters to execute the UpdateProject service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceNotFound`.
 
 @see AWSCodebuildUpdateProjectInput
 @see AWSCodebuildUpdateProjectOutput
 */
- (void)updateProject:(AWSCodebuildUpdateProjectInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildUpdateProjectOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Updates a report group. </p>
 
 @param request A container for the necessary parameters to execute the UpdateReportGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildUpdateReportGroupOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceNotFound`.
 
 @see AWSCodebuildUpdateReportGroupInput
 @see AWSCodebuildUpdateReportGroupOutput
 */
- (AWSTask<AWSCodebuildUpdateReportGroupOutput *> *)updateReportGroup:(AWSCodebuildUpdateReportGroupInput *)request;

/**
 <p> Updates a report group. </p>
 
 @param request A container for the necessary parameters to execute the UpdateReportGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceNotFound`.
 
 @see AWSCodebuildUpdateReportGroupInput
 @see AWSCodebuildUpdateReportGroupOutput
 */
- (void)updateReportGroup:(AWSCodebuildUpdateReportGroupInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildUpdateReportGroupOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Updates the webhook associated with an AWS CodeBuild build project. </p><note><p> If you use Bitbucket for your repository, <code>rotateSecret</code> is ignored. </p></note>
 
 @param request A container for the necessary parameters to execute the UpdateWebhook service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodebuildUpdateWebhookOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceNotFound`, `AWSCodebuildErrorOAuthProvider`.
 
 @see AWSCodebuildUpdateWebhookInput
 @see AWSCodebuildUpdateWebhookOutput
 */
- (AWSTask<AWSCodebuildUpdateWebhookOutput *> *)updateWebhook:(AWSCodebuildUpdateWebhookInput *)request;

/**
 <p> Updates the webhook associated with an AWS CodeBuild build project. </p><note><p> If you use Bitbucket for your repository, <code>rotateSecret</code> is ignored. </p></note>
 
 @param request A container for the necessary parameters to execute the UpdateWebhook service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodebuildErrorDomain` domain and the following error code: `AWSCodebuildErrorInvalidInput`, `AWSCodebuildErrorResourceNotFound`, `AWSCodebuildErrorOAuthProvider`.
 
 @see AWSCodebuildUpdateWebhookInput
 @see AWSCodebuildUpdateWebhookOutput
 */
- (void)updateWebhook:(AWSCodebuildUpdateWebhookInput *)request completionHandler:(void (^ _Nullable)(AWSCodebuildUpdateWebhookOutput * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
