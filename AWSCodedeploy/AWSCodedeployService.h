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
#import "AWSCodedeployModel.h"
#import "AWSCodedeployResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSCodedeploy
FOUNDATION_EXPORT NSString *const AWSCodedeploySDKVersion;

/**
 <fullname>AWS CodeDeploy</fullname><p>AWS CodeDeploy is a deployment service that automates application deployments to Amazon EC2 instances, on-premises instances running in your own facility, serverless AWS Lambda functions, or applications in an Amazon ECS service.</p><p>You can deploy a nearly unlimited variety of application content, such as an updated Lambda function, updated applications in an Amazon ECS service, code, web and configuration files, executables, packages, scripts, multimedia files, and so on. AWS CodeDeploy can deploy application content stored in Amazon S3 buckets, GitHub repositories, or Bitbucket repositories. You do not need to make changes to your existing code before you can use AWS CodeDeploy.</p><p>AWS CodeDeploy makes it easier for you to rapidly release new features, helps you avoid downtime during application deployment, and handles the complexity of updating your applications, without many of the risks associated with error-prone manual deployments.</p><p><b>AWS CodeDeploy Components</b></p><p>Use the information in this guide to help you work with the following AWS CodeDeploy components:</p><ul><li><p><b>Application</b>: A name that uniquely identifies the application you want to deploy. AWS CodeDeploy uses this name, which functions as a container, to ensure the correct combination of revision, deployment configuration, and deployment group are referenced during a deployment.</p></li><li><p><b>Deployment group</b>: A set of individual instances, CodeDeploy Lambda deployment configuration settings, or an Amazon ECS service and network details. A Lambda deployment group specifies how to route traffic to a new version of a Lambda function. An Amazon ECS deployment group specifies the service created in Amazon ECS to deploy, a load balancer, and a listener to reroute production traffic to an updated containerized application. An EC2/On-premises deployment group contains individually tagged instances, Amazon EC2 instances in Amazon EC2 Auto Scaling groups, or both. All deployment groups can specify optional trigger, alarm, and rollback settings.</p></li><li><p><b>Deployment configuration</b>: A set of deployment rules and deployment success and failure conditions used by AWS CodeDeploy during a deployment.</p></li><li><p><b>Deployment</b>: The process and the components used when updating a Lambda function, a containerized application in an Amazon ECS service, or of installing content on one or more instances. </p></li><li><p><b>Application revisions</b>: For an AWS Lambda deployment, this is an AppSpec file that specifies the Lambda function to be updated and one or more functions to validate deployment lifecycle events. For an Amazon ECS deployment, this is an AppSpec file that specifies the Amazon ECS task definition, container, and port where production traffic is rerouted. For an EC2/On-premises deployment, this is an archive file that contains source content—source code, webpages, executable files, and deployment scripts—along with an AppSpec file. Revisions are stored in Amazon S3 buckets or GitHub repositories. For Amazon S3, a revision is uniquely identified by its Amazon S3 object key and its ETag, version, or both. For GitHub, a revision is uniquely identified by its commit ID.</p></li></ul><p>This guide also contains information to help you get details about the instances in your deployments, to make on-premises instances available for AWS CodeDeploy deployments, to get details about a Lambda function deployment, and to get details about Amazon ECS service deployments.</p><p><b>AWS CodeDeploy Information Resources</b></p><ul><li><p><a href="https://docs.aws.amazon.com/codedeploy/latest/userguide">AWS CodeDeploy User Guide</a></p></li><li><p><a href="https://docs.aws.amazon.com/codedeploy/latest/APIReference/">AWS CodeDeploy API Reference Guide</a></p></li><li><p><a href="https://docs.aws.amazon.com/cli/latest/reference/deploy/index.html">AWS CLI Reference for AWS CodeDeploy</a></p></li><li><p><a href="https://forums.aws.amazon.com/forum.jspa?forumID=179">AWS CodeDeploy Developer Forum</a></p></li></ul>
 */
@interface AWSCodedeploy : AWSService

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

     let Codedeploy = AWSCodedeploy.default()

 *Objective-C*

     AWSCodedeploy *Codedeploy = [AWSCodedeploy defaultCodedeploy];

 @return The default service client.
 */
+ (instancetype)defaultCodedeploy;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSCodedeploy.register(with: configuration!, forKey: "USWest2Codedeploy")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:@"USWest2Codedeploy"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Codedeploy = AWSCodedeploy(forKey: "USWest2Codedeploy")

 *Objective-C*

     AWSCodedeploy *Codedeploy = [AWSCodedeploy CodedeployForKey:@"USWest2Codedeploy"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerCodedeployWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerCodedeployWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSCodedeploy.register(with: configuration!, forKey: "USWest2Codedeploy")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:@"USWest2Codedeploy"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Codedeploy = AWSCodedeploy(forKey: "USWest2Codedeploy")

 *Objective-C*

     AWSCodedeploy *Codedeploy = [AWSCodedeploy CodedeployForKey:@"USWest2Codedeploy"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)CodedeployForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeCodedeployForKey:(NSString *)key;

/**
 <p>Adds tags to on-premises instances.</p>
 
 @param request A container for the necessary parameters to execute the AddTagsToOnPremisesInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInstanceNameRequired`, `AWSCodedeployErrorInvalidInstanceName`, `AWSCodedeployErrorTagRequired`, `AWSCodedeployErrorInvalidTag`, `AWSCodedeployErrorTagLimitExceeded`, `AWSCodedeployErrorInstanceLimitExceeded`, `AWSCodedeployErrorInstanceNotRegistered`.
 
 @see AWSCodedeployAddTagsToOnPremisesInstancesInput
 */
- (AWSTask *)addTagsToOnPremisesInstances:(AWSCodedeployAddTagsToOnPremisesInstancesInput *)request;

/**
 <p>Adds tags to on-premises instances.</p>
 
 @param request A container for the necessary parameters to execute the AddTagsToOnPremisesInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInstanceNameRequired`, `AWSCodedeployErrorInvalidInstanceName`, `AWSCodedeployErrorTagRequired`, `AWSCodedeployErrorInvalidTag`, `AWSCodedeployErrorTagLimitExceeded`, `AWSCodedeployErrorInstanceLimitExceeded`, `AWSCodedeployErrorInstanceNotRegistered`.
 
 @see AWSCodedeployAddTagsToOnPremisesInstancesInput
 */
- (void)addTagsToOnPremisesInstances:(AWSCodedeployAddTagsToOnPremisesInstancesInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about one or more application revisions. The maximum number of application revisions that can be returned is 25.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetApplicationRevisions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployBatchGetApplicationRevisionsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorRevisionRequired`, `AWSCodedeployErrorInvalidRevision`, `AWSCodedeployErrorBatchLimitExceeded`.
 
 @see AWSCodedeployBatchGetApplicationRevisionsInput
 @see AWSCodedeployBatchGetApplicationRevisionsOutput
 */
- (AWSTask<AWSCodedeployBatchGetApplicationRevisionsOutput *> *)batchGetApplicationRevisions:(AWSCodedeployBatchGetApplicationRevisionsInput *)request;

/**
 <p>Gets information about one or more application revisions. The maximum number of application revisions that can be returned is 25.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetApplicationRevisions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorRevisionRequired`, `AWSCodedeployErrorInvalidRevision`, `AWSCodedeployErrorBatchLimitExceeded`.
 
 @see AWSCodedeployBatchGetApplicationRevisionsInput
 @see AWSCodedeployBatchGetApplicationRevisionsOutput
 */
- (void)batchGetApplicationRevisions:(AWSCodedeployBatchGetApplicationRevisionsInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployBatchGetApplicationRevisionsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about one or more applications. The maximum number of applications that can be returned is 100.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetApplications service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployBatchGetApplicationsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorBatchLimitExceeded`.
 
 @see AWSCodedeployBatchGetApplicationsInput
 @see AWSCodedeployBatchGetApplicationsOutput
 */
- (AWSTask<AWSCodedeployBatchGetApplicationsOutput *> *)batchGetApplications:(AWSCodedeployBatchGetApplicationsInput *)request;

/**
 <p>Gets information about one or more applications. The maximum number of applications that can be returned is 100.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetApplications service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorBatchLimitExceeded`.
 
 @see AWSCodedeployBatchGetApplicationsInput
 @see AWSCodedeployBatchGetApplicationsOutput
 */
- (void)batchGetApplications:(AWSCodedeployBatchGetApplicationsInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployBatchGetApplicationsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about one or more deployment groups.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetDeploymentGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployBatchGetDeploymentGroupsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorDeploymentGroupNameRequired`, `AWSCodedeployErrorInvalidDeploymentGroupName`, `AWSCodedeployErrorBatchLimitExceeded`, `AWSCodedeployErrorDeploymentConfigDoesNotExist`.
 
 @see AWSCodedeployBatchGetDeploymentGroupsInput
 @see AWSCodedeployBatchGetDeploymentGroupsOutput
 */
- (AWSTask<AWSCodedeployBatchGetDeploymentGroupsOutput *> *)batchGetDeploymentGroups:(AWSCodedeployBatchGetDeploymentGroupsInput *)request;

/**
 <p>Gets information about one or more deployment groups.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetDeploymentGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorDeploymentGroupNameRequired`, `AWSCodedeployErrorInvalidDeploymentGroupName`, `AWSCodedeployErrorBatchLimitExceeded`, `AWSCodedeployErrorDeploymentConfigDoesNotExist`.
 
 @see AWSCodedeployBatchGetDeploymentGroupsInput
 @see AWSCodedeployBatchGetDeploymentGroupsOutput
 */
- (void)batchGetDeploymentGroups:(AWSCodedeployBatchGetDeploymentGroupsInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployBatchGetDeploymentGroupsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p> This method works, but is deprecated. Use <code>BatchGetDeploymentTargets</code> instead. </p></note><p> Returns an array of one or more instances associated with a deployment. This method works with EC2/On-premises and AWS Lambda compute platforms. The newer <code>BatchGetDeploymentTargets</code> works with all compute platforms. The maximum number of instances that can be returned is 25.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetDeploymentInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployBatchGetDeploymentInstancesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorDeploymentIdRequired`, `AWSCodedeployErrorDeploymentDoesNotExist`, `AWSCodedeployErrorInstanceIdRequired`, `AWSCodedeployErrorInvalidDeploymentId`, `AWSCodedeployErrorInvalidInstanceName`, `AWSCodedeployErrorBatchLimitExceeded`, `AWSCodedeployErrorInvalidComputePlatform`.
 
 @see AWSCodedeployBatchGetDeploymentInstancesInput
 @see AWSCodedeployBatchGetDeploymentInstancesOutput
 */
- (AWSTask<AWSCodedeployBatchGetDeploymentInstancesOutput *> *)batchGetDeploymentInstances:(AWSCodedeployBatchGetDeploymentInstancesInput *)request;

/**
 <note><p> This method works, but is deprecated. Use <code>BatchGetDeploymentTargets</code> instead. </p></note><p> Returns an array of one or more instances associated with a deployment. This method works with EC2/On-premises and AWS Lambda compute platforms. The newer <code>BatchGetDeploymentTargets</code> works with all compute platforms. The maximum number of instances that can be returned is 25.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetDeploymentInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorDeploymentIdRequired`, `AWSCodedeployErrorDeploymentDoesNotExist`, `AWSCodedeployErrorInstanceIdRequired`, `AWSCodedeployErrorInvalidDeploymentId`, `AWSCodedeployErrorInvalidInstanceName`, `AWSCodedeployErrorBatchLimitExceeded`, `AWSCodedeployErrorInvalidComputePlatform`.
 
 @see AWSCodedeployBatchGetDeploymentInstancesInput
 @see AWSCodedeployBatchGetDeploymentInstancesOutput
 */
- (void)batchGetDeploymentInstances:(AWSCodedeployBatchGetDeploymentInstancesInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployBatchGetDeploymentInstancesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns an array of one or more targets associated with a deployment. This method works with all compute types and should be used instead of the deprecated <code>BatchGetDeploymentInstances</code>. The maximum number of targets that can be returned is 25.</p><p> The type of targets returned depends on the deployment's compute platform or deployment method: </p><ul><li><p><b>EC2/On-premises</b>: Information about EC2 instance targets. </p></li><li><p><b>AWS Lambda</b>: Information about Lambda functions targets. </p></li><li><p><b>Amazon ECS</b>: Information about Amazon ECS service targets. </p></li><li><p><b>CloudFormation</b>: Information about targets of blue/green deployments initiated by a CloudFormation stack update.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the BatchGetDeploymentTargets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployBatchGetDeploymentTargetsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInvalidDeploymentId`, `AWSCodedeployErrorDeploymentIdRequired`, `AWSCodedeployErrorDeploymentDoesNotExist`, `AWSCodedeployErrorDeploymentNotStarted`, `AWSCodedeployErrorDeploymentTargetIdRequired`, `AWSCodedeployErrorInvalidDeploymentTargetId`, `AWSCodedeployErrorDeploymentTargetDoesNotExist`, `AWSCodedeployErrorDeploymentTargetListSizeExceeded`, `AWSCodedeployErrorInstanceDoesNotExist`.
 
 @see AWSCodedeployBatchGetDeploymentTargetsInput
 @see AWSCodedeployBatchGetDeploymentTargetsOutput
 */
- (AWSTask<AWSCodedeployBatchGetDeploymentTargetsOutput *> *)batchGetDeploymentTargets:(AWSCodedeployBatchGetDeploymentTargetsInput *)request;

/**
 <p> Returns an array of one or more targets associated with a deployment. This method works with all compute types and should be used instead of the deprecated <code>BatchGetDeploymentInstances</code>. The maximum number of targets that can be returned is 25.</p><p> The type of targets returned depends on the deployment's compute platform or deployment method: </p><ul><li><p><b>EC2/On-premises</b>: Information about EC2 instance targets. </p></li><li><p><b>AWS Lambda</b>: Information about Lambda functions targets. </p></li><li><p><b>Amazon ECS</b>: Information about Amazon ECS service targets. </p></li><li><p><b>CloudFormation</b>: Information about targets of blue/green deployments initiated by a CloudFormation stack update.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the BatchGetDeploymentTargets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInvalidDeploymentId`, `AWSCodedeployErrorDeploymentIdRequired`, `AWSCodedeployErrorDeploymentDoesNotExist`, `AWSCodedeployErrorDeploymentNotStarted`, `AWSCodedeployErrorDeploymentTargetIdRequired`, `AWSCodedeployErrorInvalidDeploymentTargetId`, `AWSCodedeployErrorDeploymentTargetDoesNotExist`, `AWSCodedeployErrorDeploymentTargetListSizeExceeded`, `AWSCodedeployErrorInstanceDoesNotExist`.
 
 @see AWSCodedeployBatchGetDeploymentTargetsInput
 @see AWSCodedeployBatchGetDeploymentTargetsOutput
 */
- (void)batchGetDeploymentTargets:(AWSCodedeployBatchGetDeploymentTargetsInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployBatchGetDeploymentTargetsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about one or more deployments. The maximum number of deployments that can be returned is 25.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetDeployments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployBatchGetDeploymentsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorDeploymentIdRequired`, `AWSCodedeployErrorInvalidDeploymentId`, `AWSCodedeployErrorBatchLimitExceeded`.
 
 @see AWSCodedeployBatchGetDeploymentsInput
 @see AWSCodedeployBatchGetDeploymentsOutput
 */
- (AWSTask<AWSCodedeployBatchGetDeploymentsOutput *> *)batchGetDeployments:(AWSCodedeployBatchGetDeploymentsInput *)request;

/**
 <p>Gets information about one or more deployments. The maximum number of deployments that can be returned is 25.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetDeployments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorDeploymentIdRequired`, `AWSCodedeployErrorInvalidDeploymentId`, `AWSCodedeployErrorBatchLimitExceeded`.
 
 @see AWSCodedeployBatchGetDeploymentsInput
 @see AWSCodedeployBatchGetDeploymentsOutput
 */
- (void)batchGetDeployments:(AWSCodedeployBatchGetDeploymentsInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployBatchGetDeploymentsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about one or more on-premises instances. The maximum number of on-premises instances that can be returned is 25.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetOnPremisesInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployBatchGetOnPremisesInstancesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInstanceNameRequired`, `AWSCodedeployErrorInvalidInstanceName`, `AWSCodedeployErrorBatchLimitExceeded`.
 
 @see AWSCodedeployBatchGetOnPremisesInstancesInput
 @see AWSCodedeployBatchGetOnPremisesInstancesOutput
 */
- (AWSTask<AWSCodedeployBatchGetOnPremisesInstancesOutput *> *)batchGetOnPremisesInstances:(AWSCodedeployBatchGetOnPremisesInstancesInput *)request;

/**
 <p>Gets information about one or more on-premises instances. The maximum number of on-premises instances that can be returned is 25.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetOnPremisesInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInstanceNameRequired`, `AWSCodedeployErrorInvalidInstanceName`, `AWSCodedeployErrorBatchLimitExceeded`.
 
 @see AWSCodedeployBatchGetOnPremisesInstancesInput
 @see AWSCodedeployBatchGetOnPremisesInstancesOutput
 */
- (void)batchGetOnPremisesInstances:(AWSCodedeployBatchGetOnPremisesInstancesInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployBatchGetOnPremisesInstancesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>For a blue/green deployment, starts the process of rerouting traffic from instances in the original environment to instances in the replacement environment without waiting for a specified wait time to elapse. (Traffic rerouting, which is achieved by registering instances in the replacement environment with the load balancer, can start as soon as all instances have a status of Ready.) </p>
 
 @param request A container for the necessary parameters to execute the ContinueDeployment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorDeploymentIdRequired`, `AWSCodedeployErrorDeploymentDoesNotExist`, `AWSCodedeployErrorDeploymentAlreadyCompleted`, `AWSCodedeployErrorInvalidDeploymentId`, `AWSCodedeployErrorDeploymentIsNotInReadyState`, `AWSCodedeployErrorUnsupportedActionForDeploymentType`, `AWSCodedeployErrorInvalidDeploymentWaitType`, `AWSCodedeployErrorInvalidDeploymentStatus`.
 
 @see AWSCodedeployContinueDeploymentInput
 */
- (AWSTask *)continueDeployment:(AWSCodedeployContinueDeploymentInput *)request;

/**
 <p>For a blue/green deployment, starts the process of rerouting traffic from instances in the original environment to instances in the replacement environment without waiting for a specified wait time to elapse. (Traffic rerouting, which is achieved by registering instances in the replacement environment with the load balancer, can start as soon as all instances have a status of Ready.) </p>
 
 @param request A container for the necessary parameters to execute the ContinueDeployment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorDeploymentIdRequired`, `AWSCodedeployErrorDeploymentDoesNotExist`, `AWSCodedeployErrorDeploymentAlreadyCompleted`, `AWSCodedeployErrorInvalidDeploymentId`, `AWSCodedeployErrorDeploymentIsNotInReadyState`, `AWSCodedeployErrorUnsupportedActionForDeploymentType`, `AWSCodedeployErrorInvalidDeploymentWaitType`, `AWSCodedeployErrorInvalidDeploymentStatus`.
 
 @see AWSCodedeployContinueDeploymentInput
 */
- (void)continueDeployment:(AWSCodedeployContinueDeploymentInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates an application.</p>
 
 @param request A container for the necessary parameters to execute the CreateApplication service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployCreateApplicationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorApplicationAlreadyExists`, `AWSCodedeployErrorApplicationLimitExceeded`, `AWSCodedeployErrorInvalidComputePlatform`, `AWSCodedeployErrorInvalidTagsToAdd`.
 
 @see AWSCodedeployCreateApplicationInput
 @see AWSCodedeployCreateApplicationOutput
 */
- (AWSTask<AWSCodedeployCreateApplicationOutput *> *)createApplication:(AWSCodedeployCreateApplicationInput *)request;

/**
 <p>Creates an application.</p>
 
 @param request A container for the necessary parameters to execute the CreateApplication service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorApplicationAlreadyExists`, `AWSCodedeployErrorApplicationLimitExceeded`, `AWSCodedeployErrorInvalidComputePlatform`, `AWSCodedeployErrorInvalidTagsToAdd`.
 
 @see AWSCodedeployCreateApplicationInput
 @see AWSCodedeployCreateApplicationOutput
 */
- (void)createApplication:(AWSCodedeployCreateApplicationInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployCreateApplicationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deploys an application revision through the specified deployment group.</p>
 
 @param request A container for the necessary parameters to execute the CreateDeployment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployCreateDeploymentOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorDeploymentGroupNameRequired`, `AWSCodedeployErrorInvalidDeploymentGroupName`, `AWSCodedeployErrorDeploymentGroupDoesNotExist`, `AWSCodedeployErrorRevisionRequired`, `AWSCodedeployErrorRevisionDoesNotExist`, `AWSCodedeployErrorInvalidRevision`, `AWSCodedeployErrorInvalidDeploymentConfigName`, `AWSCodedeployErrorDeploymentConfigDoesNotExist`, `AWSCodedeployErrorDescriptionTooLong`, `AWSCodedeployErrorDeploymentLimitExceeded`, `AWSCodedeployErrorInvalidTargetInstances`, `AWSCodedeployErrorInvalidAutoRollbackConfig`, `AWSCodedeployErrorInvalidLoadBalancerInfo`, `AWSCodedeployErrorInvalidFileExistsBehavior`, `AWSCodedeployErrorInvalidRole`, `AWSCodedeployErrorInvalidAutoScalingGroup`, `AWSCodedeployErrorThrottling`, `AWSCodedeployErrorInvalidUpdateOutdatedInstancesOnlyValue`, `AWSCodedeployErrorInvalidIgnoreApplicationStopFailuresValue`, `AWSCodedeployErrorInvalidGitHubAccountToken`, `AWSCodedeployErrorInvalidTrafficRoutingConfiguration`.
 
 @see AWSCodedeployCreateDeploymentInput
 @see AWSCodedeployCreateDeploymentOutput
 */
- (AWSTask<AWSCodedeployCreateDeploymentOutput *> *)createDeployment:(AWSCodedeployCreateDeploymentInput *)request;

/**
 <p>Deploys an application revision through the specified deployment group.</p>
 
 @param request A container for the necessary parameters to execute the CreateDeployment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorDeploymentGroupNameRequired`, `AWSCodedeployErrorInvalidDeploymentGroupName`, `AWSCodedeployErrorDeploymentGroupDoesNotExist`, `AWSCodedeployErrorRevisionRequired`, `AWSCodedeployErrorRevisionDoesNotExist`, `AWSCodedeployErrorInvalidRevision`, `AWSCodedeployErrorInvalidDeploymentConfigName`, `AWSCodedeployErrorDeploymentConfigDoesNotExist`, `AWSCodedeployErrorDescriptionTooLong`, `AWSCodedeployErrorDeploymentLimitExceeded`, `AWSCodedeployErrorInvalidTargetInstances`, `AWSCodedeployErrorInvalidAutoRollbackConfig`, `AWSCodedeployErrorInvalidLoadBalancerInfo`, `AWSCodedeployErrorInvalidFileExistsBehavior`, `AWSCodedeployErrorInvalidRole`, `AWSCodedeployErrorInvalidAutoScalingGroup`, `AWSCodedeployErrorThrottling`, `AWSCodedeployErrorInvalidUpdateOutdatedInstancesOnlyValue`, `AWSCodedeployErrorInvalidIgnoreApplicationStopFailuresValue`, `AWSCodedeployErrorInvalidGitHubAccountToken`, `AWSCodedeployErrorInvalidTrafficRoutingConfiguration`.
 
 @see AWSCodedeployCreateDeploymentInput
 @see AWSCodedeployCreateDeploymentOutput
 */
- (void)createDeployment:(AWSCodedeployCreateDeploymentInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployCreateDeploymentOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Creates a deployment configuration. </p>
 
 @param request A container for the necessary parameters to execute the CreateDeploymentConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployCreateDeploymentConfigOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInvalidDeploymentConfigName`, `AWSCodedeployErrorDeploymentConfigNameRequired`, `AWSCodedeployErrorDeploymentConfigAlreadyExists`, `AWSCodedeployErrorInvalidMinimumHealthyHostValue`, `AWSCodedeployErrorDeploymentConfigLimitExceeded`, `AWSCodedeployErrorInvalidComputePlatform`, `AWSCodedeployErrorInvalidTrafficRoutingConfiguration`.
 
 @see AWSCodedeployCreateDeploymentConfigInput
 @see AWSCodedeployCreateDeploymentConfigOutput
 */
- (AWSTask<AWSCodedeployCreateDeploymentConfigOutput *> *)createDeploymentConfig:(AWSCodedeployCreateDeploymentConfigInput *)request;

/**
 <p> Creates a deployment configuration. </p>
 
 @param request A container for the necessary parameters to execute the CreateDeploymentConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInvalidDeploymentConfigName`, `AWSCodedeployErrorDeploymentConfigNameRequired`, `AWSCodedeployErrorDeploymentConfigAlreadyExists`, `AWSCodedeployErrorInvalidMinimumHealthyHostValue`, `AWSCodedeployErrorDeploymentConfigLimitExceeded`, `AWSCodedeployErrorInvalidComputePlatform`, `AWSCodedeployErrorInvalidTrafficRoutingConfiguration`.
 
 @see AWSCodedeployCreateDeploymentConfigInput
 @see AWSCodedeployCreateDeploymentConfigOutput
 */
- (void)createDeploymentConfig:(AWSCodedeployCreateDeploymentConfigInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployCreateDeploymentConfigOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a deployment group to which application revisions are deployed.</p>
 
 @param request A container for the necessary parameters to execute the CreateDeploymentGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployCreateDeploymentGroupOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorDeploymentGroupNameRequired`, `AWSCodedeployErrorInvalidDeploymentGroupName`, `AWSCodedeployErrorDeploymentGroupAlreadyExists`, `AWSCodedeployErrorInvalidEC2Tag`, `AWSCodedeployErrorInvalidTag`, `AWSCodedeployErrorInvalidAutoScalingGroup`, `AWSCodedeployErrorInvalidDeploymentConfigName`, `AWSCodedeployErrorDeploymentConfigDoesNotExist`, `AWSCodedeployErrorRoleRequired`, `AWSCodedeployErrorInvalidRole`, `AWSCodedeployErrorDeploymentGroupLimitExceeded`, `AWSCodedeployErrorLifecycleHookLimitExceeded`, `AWSCodedeployErrorInvalidTriggerConfig`, `AWSCodedeployErrorTriggerTargetsLimitExceeded`, `AWSCodedeployErrorInvalidAlarmConfig`, `AWSCodedeployErrorAlarmsLimitExceeded`, `AWSCodedeployErrorInvalidAutoRollbackConfig`, `AWSCodedeployErrorInvalidLoadBalancerInfo`, `AWSCodedeployErrorInvalidDeploymentStyle`, `AWSCodedeployErrorInvalidBlueGreenDeploymentConfiguration`, `AWSCodedeployErrorInvalidEC2TagCombination`, `AWSCodedeployErrorInvalidOnPremisesTagCombination`, `AWSCodedeployErrorTagSetListLimitExceeded`, `AWSCodedeployErrorInvalidInput`, `AWSCodedeployErrorThrottling`, `AWSCodedeployErrorInvalidECSService`, `AWSCodedeployErrorInvalidTargetGroupPair`, `AWSCodedeployErrorECSServiceMappingLimitExceeded`, `AWSCodedeployErrorInvalidTagsToAdd`, `AWSCodedeployErrorInvalidTrafficRoutingConfiguration`.
 
 @see AWSCodedeployCreateDeploymentGroupInput
 @see AWSCodedeployCreateDeploymentGroupOutput
 */
- (AWSTask<AWSCodedeployCreateDeploymentGroupOutput *> *)createDeploymentGroup:(AWSCodedeployCreateDeploymentGroupInput *)request;

/**
 <p>Creates a deployment group to which application revisions are deployed.</p>
 
 @param request A container for the necessary parameters to execute the CreateDeploymentGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorDeploymentGroupNameRequired`, `AWSCodedeployErrorInvalidDeploymentGroupName`, `AWSCodedeployErrorDeploymentGroupAlreadyExists`, `AWSCodedeployErrorInvalidEC2Tag`, `AWSCodedeployErrorInvalidTag`, `AWSCodedeployErrorInvalidAutoScalingGroup`, `AWSCodedeployErrorInvalidDeploymentConfigName`, `AWSCodedeployErrorDeploymentConfigDoesNotExist`, `AWSCodedeployErrorRoleRequired`, `AWSCodedeployErrorInvalidRole`, `AWSCodedeployErrorDeploymentGroupLimitExceeded`, `AWSCodedeployErrorLifecycleHookLimitExceeded`, `AWSCodedeployErrorInvalidTriggerConfig`, `AWSCodedeployErrorTriggerTargetsLimitExceeded`, `AWSCodedeployErrorInvalidAlarmConfig`, `AWSCodedeployErrorAlarmsLimitExceeded`, `AWSCodedeployErrorInvalidAutoRollbackConfig`, `AWSCodedeployErrorInvalidLoadBalancerInfo`, `AWSCodedeployErrorInvalidDeploymentStyle`, `AWSCodedeployErrorInvalidBlueGreenDeploymentConfiguration`, `AWSCodedeployErrorInvalidEC2TagCombination`, `AWSCodedeployErrorInvalidOnPremisesTagCombination`, `AWSCodedeployErrorTagSetListLimitExceeded`, `AWSCodedeployErrorInvalidInput`, `AWSCodedeployErrorThrottling`, `AWSCodedeployErrorInvalidECSService`, `AWSCodedeployErrorInvalidTargetGroupPair`, `AWSCodedeployErrorECSServiceMappingLimitExceeded`, `AWSCodedeployErrorInvalidTagsToAdd`, `AWSCodedeployErrorInvalidTrafficRoutingConfiguration`.
 
 @see AWSCodedeployCreateDeploymentGroupInput
 @see AWSCodedeployCreateDeploymentGroupOutput
 */
- (void)createDeploymentGroup:(AWSCodedeployCreateDeploymentGroupInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployCreateDeploymentGroupOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an application.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApplication service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorInvalidRole`.
 
 @see AWSCodedeployDeleteApplicationInput
 */
- (AWSTask *)deleteApplication:(AWSCodedeployDeleteApplicationInput *)request;

/**
 <p>Deletes an application.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApplication service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorInvalidRole`.
 
 @see AWSCodedeployDeleteApplicationInput
 */
- (void)deleteApplication:(AWSCodedeployDeleteApplicationInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a deployment configuration.</p><note><p>A deployment configuration cannot be deleted if it is currently in use. Predefined configurations cannot be deleted.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDeploymentConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInvalidDeploymentConfigName`, `AWSCodedeployErrorDeploymentConfigNameRequired`, `AWSCodedeployErrorDeploymentConfigInUse`, `AWSCodedeployErrorInvalidOperation`.
 
 @see AWSCodedeployDeleteDeploymentConfigInput
 */
- (AWSTask *)deleteDeploymentConfig:(AWSCodedeployDeleteDeploymentConfigInput *)request;

/**
 <p>Deletes a deployment configuration.</p><note><p>A deployment configuration cannot be deleted if it is currently in use. Predefined configurations cannot be deleted.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDeploymentConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInvalidDeploymentConfigName`, `AWSCodedeployErrorDeploymentConfigNameRequired`, `AWSCodedeployErrorDeploymentConfigInUse`, `AWSCodedeployErrorInvalidOperation`.
 
 @see AWSCodedeployDeleteDeploymentConfigInput
 */
- (void)deleteDeploymentConfig:(AWSCodedeployDeleteDeploymentConfigInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a deployment group.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDeploymentGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployDeleteDeploymentGroupOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorDeploymentGroupNameRequired`, `AWSCodedeployErrorInvalidDeploymentGroupName`, `AWSCodedeployErrorInvalidRole`.
 
 @see AWSCodedeployDeleteDeploymentGroupInput
 @see AWSCodedeployDeleteDeploymentGroupOutput
 */
- (AWSTask<AWSCodedeployDeleteDeploymentGroupOutput *> *)deleteDeploymentGroup:(AWSCodedeployDeleteDeploymentGroupInput *)request;

/**
 <p>Deletes a deployment group.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDeploymentGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorDeploymentGroupNameRequired`, `AWSCodedeployErrorInvalidDeploymentGroupName`, `AWSCodedeployErrorInvalidRole`.
 
 @see AWSCodedeployDeleteDeploymentGroupInput
 @see AWSCodedeployDeleteDeploymentGroupOutput
 */
- (void)deleteDeploymentGroup:(AWSCodedeployDeleteDeploymentGroupInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployDeleteDeploymentGroupOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a GitHub account connection.</p>
 
 @param request A container for the necessary parameters to execute the DeleteGitHubAccountToken service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployDeleteGitHubAccountTokenOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorGitHubAccountTokenNameRequired`, `AWSCodedeployErrorGitHubAccountTokenDoesNotExist`, `AWSCodedeployErrorInvalidGitHubAccountTokenName`, `AWSCodedeployErrorResourceValidation`, `AWSCodedeployErrorOperationNotSupported`.
 
 @see AWSCodedeployDeleteGitHubAccountTokenInput
 @see AWSCodedeployDeleteGitHubAccountTokenOutput
 */
- (AWSTask<AWSCodedeployDeleteGitHubAccountTokenOutput *> *)deleteGitHubAccountToken:(AWSCodedeployDeleteGitHubAccountTokenInput *)request;

/**
 <p>Deletes a GitHub account connection.</p>
 
 @param request A container for the necessary parameters to execute the DeleteGitHubAccountToken service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorGitHubAccountTokenNameRequired`, `AWSCodedeployErrorGitHubAccountTokenDoesNotExist`, `AWSCodedeployErrorInvalidGitHubAccountTokenName`, `AWSCodedeployErrorResourceValidation`, `AWSCodedeployErrorOperationNotSupported`.
 
 @see AWSCodedeployDeleteGitHubAccountTokenInput
 @see AWSCodedeployDeleteGitHubAccountTokenOutput
 */
- (void)deleteGitHubAccountToken:(AWSCodedeployDeleteGitHubAccountTokenInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployDeleteGitHubAccountTokenOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes resources linked to an external ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteResourcesByExternalId service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployDeleteResourcesByExternalIdOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: .
 
 @see AWSCodedeployDeleteResourcesByExternalIdInput
 @see AWSCodedeployDeleteResourcesByExternalIdOutput
 */
- (AWSTask<AWSCodedeployDeleteResourcesByExternalIdOutput *> *)deleteResourcesByExternalId:(AWSCodedeployDeleteResourcesByExternalIdInput *)request;

/**
 <p>Deletes resources linked to an external ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteResourcesByExternalId service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: .
 
 @see AWSCodedeployDeleteResourcesByExternalIdInput
 @see AWSCodedeployDeleteResourcesByExternalIdOutput
 */
- (void)deleteResourcesByExternalId:(AWSCodedeployDeleteResourcesByExternalIdInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployDeleteResourcesByExternalIdOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deregisters an on-premises instance.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterOnPremisesInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInstanceNameRequired`, `AWSCodedeployErrorInvalidInstanceName`.
 
 @see AWSCodedeployDeregisterOnPremisesInstanceInput
 */
- (AWSTask *)deregisterOnPremisesInstance:(AWSCodedeployDeregisterOnPremisesInstanceInput *)request;

/**
 <p>Deregisters an on-premises instance.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterOnPremisesInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInstanceNameRequired`, `AWSCodedeployErrorInvalidInstanceName`.
 
 @see AWSCodedeployDeregisterOnPremisesInstanceInput
 */
- (void)deregisterOnPremisesInstance:(AWSCodedeployDeregisterOnPremisesInstanceInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about an application.</p>
 
 @param request A container for the necessary parameters to execute the GetApplication service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployGetApplicationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorApplicationDoesNotExist`.
 
 @see AWSCodedeployGetApplicationInput
 @see AWSCodedeployGetApplicationOutput
 */
- (AWSTask<AWSCodedeployGetApplicationOutput *> *)getApplication:(AWSCodedeployGetApplicationInput *)request;

/**
 <p>Gets information about an application.</p>
 
 @param request A container for the necessary parameters to execute the GetApplication service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorApplicationDoesNotExist`.
 
 @see AWSCodedeployGetApplicationInput
 @see AWSCodedeployGetApplicationOutput
 */
- (void)getApplication:(AWSCodedeployGetApplicationInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployGetApplicationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about an application revision.</p>
 
 @param request A container for the necessary parameters to execute the GetApplicationRevision service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployGetApplicationRevisionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorRevisionDoesNotExist`, `AWSCodedeployErrorRevisionRequired`, `AWSCodedeployErrorInvalidRevision`.
 
 @see AWSCodedeployGetApplicationRevisionInput
 @see AWSCodedeployGetApplicationRevisionOutput
 */
- (AWSTask<AWSCodedeployGetApplicationRevisionOutput *> *)getApplicationRevision:(AWSCodedeployGetApplicationRevisionInput *)request;

/**
 <p>Gets information about an application revision.</p>
 
 @param request A container for the necessary parameters to execute the GetApplicationRevision service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorRevisionDoesNotExist`, `AWSCodedeployErrorRevisionRequired`, `AWSCodedeployErrorInvalidRevision`.
 
 @see AWSCodedeployGetApplicationRevisionInput
 @see AWSCodedeployGetApplicationRevisionOutput
 */
- (void)getApplicationRevision:(AWSCodedeployGetApplicationRevisionInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployGetApplicationRevisionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about a deployment.</p><note><p> The <code>content</code> property of the <code>appSpecContent</code> object in the returned revision is always null. Use <code>GetApplicationRevision</code> and the <code>sha256</code> property of the returned <code>appSpecContent</code> object to get the content of the deployment’s AppSpec file. </p></note>
 
 @param request A container for the necessary parameters to execute the GetDeployment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployGetDeploymentOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorDeploymentIdRequired`, `AWSCodedeployErrorInvalidDeploymentId`, `AWSCodedeployErrorDeploymentDoesNotExist`.
 
 @see AWSCodedeployGetDeploymentInput
 @see AWSCodedeployGetDeploymentOutput
 */
- (AWSTask<AWSCodedeployGetDeploymentOutput *> *)getDeployment:(AWSCodedeployGetDeploymentInput *)request;

/**
 <p>Gets information about a deployment.</p><note><p> The <code>content</code> property of the <code>appSpecContent</code> object in the returned revision is always null. Use <code>GetApplicationRevision</code> and the <code>sha256</code> property of the returned <code>appSpecContent</code> object to get the content of the deployment’s AppSpec file. </p></note>
 
 @param request A container for the necessary parameters to execute the GetDeployment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorDeploymentIdRequired`, `AWSCodedeployErrorInvalidDeploymentId`, `AWSCodedeployErrorDeploymentDoesNotExist`.
 
 @see AWSCodedeployGetDeploymentInput
 @see AWSCodedeployGetDeploymentOutput
 */
- (void)getDeployment:(AWSCodedeployGetDeploymentInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployGetDeploymentOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about a deployment configuration.</p>
 
 @param request A container for the necessary parameters to execute the GetDeploymentConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployGetDeploymentConfigOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInvalidDeploymentConfigName`, `AWSCodedeployErrorDeploymentConfigNameRequired`, `AWSCodedeployErrorDeploymentConfigDoesNotExist`, `AWSCodedeployErrorInvalidComputePlatform`.
 
 @see AWSCodedeployGetDeploymentConfigInput
 @see AWSCodedeployGetDeploymentConfigOutput
 */
- (AWSTask<AWSCodedeployGetDeploymentConfigOutput *> *)getDeploymentConfig:(AWSCodedeployGetDeploymentConfigInput *)request;

/**
 <p>Gets information about a deployment configuration.</p>
 
 @param request A container for the necessary parameters to execute the GetDeploymentConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInvalidDeploymentConfigName`, `AWSCodedeployErrorDeploymentConfigNameRequired`, `AWSCodedeployErrorDeploymentConfigDoesNotExist`, `AWSCodedeployErrorInvalidComputePlatform`.
 
 @see AWSCodedeployGetDeploymentConfigInput
 @see AWSCodedeployGetDeploymentConfigOutput
 */
- (void)getDeploymentConfig:(AWSCodedeployGetDeploymentConfigInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployGetDeploymentConfigOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about a deployment group.</p>
 
 @param request A container for the necessary parameters to execute the GetDeploymentGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployGetDeploymentGroupOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorDeploymentGroupNameRequired`, `AWSCodedeployErrorInvalidDeploymentGroupName`, `AWSCodedeployErrorDeploymentGroupDoesNotExist`, `AWSCodedeployErrorDeploymentConfigDoesNotExist`.
 
 @see AWSCodedeployGetDeploymentGroupInput
 @see AWSCodedeployGetDeploymentGroupOutput
 */
- (AWSTask<AWSCodedeployGetDeploymentGroupOutput *> *)getDeploymentGroup:(AWSCodedeployGetDeploymentGroupInput *)request;

/**
 <p>Gets information about a deployment group.</p>
 
 @param request A container for the necessary parameters to execute the GetDeploymentGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorDeploymentGroupNameRequired`, `AWSCodedeployErrorInvalidDeploymentGroupName`, `AWSCodedeployErrorDeploymentGroupDoesNotExist`, `AWSCodedeployErrorDeploymentConfigDoesNotExist`.
 
 @see AWSCodedeployGetDeploymentGroupInput
 @see AWSCodedeployGetDeploymentGroupOutput
 */
- (void)getDeploymentGroup:(AWSCodedeployGetDeploymentGroupInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployGetDeploymentGroupOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about an instance as part of a deployment.</p>
 
 @param request A container for the necessary parameters to execute the GetDeploymentInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployGetDeploymentInstanceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorDeploymentIdRequired`, `AWSCodedeployErrorDeploymentDoesNotExist`, `AWSCodedeployErrorInstanceIdRequired`, `AWSCodedeployErrorInvalidDeploymentId`, `AWSCodedeployErrorInstanceDoesNotExist`, `AWSCodedeployErrorInvalidInstanceName`, `AWSCodedeployErrorInvalidComputePlatform`.
 
 @see AWSCodedeployGetDeploymentInstanceInput
 @see AWSCodedeployGetDeploymentInstanceOutput
 */
- (AWSTask<AWSCodedeployGetDeploymentInstanceOutput *> *)getDeploymentInstance:(AWSCodedeployGetDeploymentInstanceInput *)request;

/**
 <p>Gets information about an instance as part of a deployment.</p>
 
 @param request A container for the necessary parameters to execute the GetDeploymentInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorDeploymentIdRequired`, `AWSCodedeployErrorDeploymentDoesNotExist`, `AWSCodedeployErrorInstanceIdRequired`, `AWSCodedeployErrorInvalidDeploymentId`, `AWSCodedeployErrorInstanceDoesNotExist`, `AWSCodedeployErrorInvalidInstanceName`, `AWSCodedeployErrorInvalidComputePlatform`.
 
 @see AWSCodedeployGetDeploymentInstanceInput
 @see AWSCodedeployGetDeploymentInstanceOutput
 */
- (void)getDeploymentInstance:(AWSCodedeployGetDeploymentInstanceInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployGetDeploymentInstanceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns information about a deployment target. </p>
 
 @param request A container for the necessary parameters to execute the GetDeploymentTarget service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployGetDeploymentTargetOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInvalidDeploymentId`, `AWSCodedeployErrorDeploymentIdRequired`, `AWSCodedeployErrorDeploymentDoesNotExist`, `AWSCodedeployErrorDeploymentNotStarted`, `AWSCodedeployErrorDeploymentTargetIdRequired`, `AWSCodedeployErrorInvalidDeploymentTargetId`, `AWSCodedeployErrorDeploymentTargetDoesNotExist`, `AWSCodedeployErrorInvalidInstanceName`.
 
 @see AWSCodedeployGetDeploymentTargetInput
 @see AWSCodedeployGetDeploymentTargetOutput
 */
- (AWSTask<AWSCodedeployGetDeploymentTargetOutput *> *)getDeploymentTarget:(AWSCodedeployGetDeploymentTargetInput *)request;

/**
 <p> Returns information about a deployment target. </p>
 
 @param request A container for the necessary parameters to execute the GetDeploymentTarget service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInvalidDeploymentId`, `AWSCodedeployErrorDeploymentIdRequired`, `AWSCodedeployErrorDeploymentDoesNotExist`, `AWSCodedeployErrorDeploymentNotStarted`, `AWSCodedeployErrorDeploymentTargetIdRequired`, `AWSCodedeployErrorInvalidDeploymentTargetId`, `AWSCodedeployErrorDeploymentTargetDoesNotExist`, `AWSCodedeployErrorInvalidInstanceName`.
 
 @see AWSCodedeployGetDeploymentTargetInput
 @see AWSCodedeployGetDeploymentTargetOutput
 */
- (void)getDeploymentTarget:(AWSCodedeployGetDeploymentTargetInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployGetDeploymentTargetOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets information about an on-premises instance. </p>
 
 @param request A container for the necessary parameters to execute the GetOnPremisesInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployGetOnPremisesInstanceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInstanceNameRequired`, `AWSCodedeployErrorInstanceNotRegistered`, `AWSCodedeployErrorInvalidInstanceName`.
 
 @see AWSCodedeployGetOnPremisesInstanceInput
 @see AWSCodedeployGetOnPremisesInstanceOutput
 */
- (AWSTask<AWSCodedeployGetOnPremisesInstanceOutput *> *)getOnPremisesInstance:(AWSCodedeployGetOnPremisesInstanceInput *)request;

/**
 <p> Gets information about an on-premises instance. </p>
 
 @param request A container for the necessary parameters to execute the GetOnPremisesInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInstanceNameRequired`, `AWSCodedeployErrorInstanceNotRegistered`, `AWSCodedeployErrorInvalidInstanceName`.
 
 @see AWSCodedeployGetOnPremisesInstanceInput
 @see AWSCodedeployGetOnPremisesInstanceOutput
 */
- (void)getOnPremisesInstance:(AWSCodedeployGetOnPremisesInstanceInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployGetOnPremisesInstanceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists information about revisions for an application.</p>
 
 @param request A container for the necessary parameters to execute the ListApplicationRevisions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployListApplicationRevisionsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorInvalidSortBy`, `AWSCodedeployErrorInvalidSortOrder`, `AWSCodedeployErrorInvalidBucketNameFilter`, `AWSCodedeployErrorInvalidKeyPrefixFilter`, `AWSCodedeployErrorBucketNameFilterRequired`, `AWSCodedeployErrorInvalidDeployedStateFilter`, `AWSCodedeployErrorInvalidNextToken`.
 
 @see AWSCodedeployListApplicationRevisionsInput
 @see AWSCodedeployListApplicationRevisionsOutput
 */
- (AWSTask<AWSCodedeployListApplicationRevisionsOutput *> *)listApplicationRevisions:(AWSCodedeployListApplicationRevisionsInput *)request;

/**
 <p>Lists information about revisions for an application.</p>
 
 @param request A container for the necessary parameters to execute the ListApplicationRevisions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorInvalidSortBy`, `AWSCodedeployErrorInvalidSortOrder`, `AWSCodedeployErrorInvalidBucketNameFilter`, `AWSCodedeployErrorInvalidKeyPrefixFilter`, `AWSCodedeployErrorBucketNameFilterRequired`, `AWSCodedeployErrorInvalidDeployedStateFilter`, `AWSCodedeployErrorInvalidNextToken`.
 
 @see AWSCodedeployListApplicationRevisionsInput
 @see AWSCodedeployListApplicationRevisionsOutput
 */
- (void)listApplicationRevisions:(AWSCodedeployListApplicationRevisionsInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployListApplicationRevisionsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the applications registered with the IAM user or AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListApplications service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployListApplicationsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInvalidNextToken`.
 
 @see AWSCodedeployListApplicationsInput
 @see AWSCodedeployListApplicationsOutput
 */
- (AWSTask<AWSCodedeployListApplicationsOutput *> *)listApplications:(AWSCodedeployListApplicationsInput *)request;

/**
 <p>Lists the applications registered with the IAM user or AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListApplications service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInvalidNextToken`.
 
 @see AWSCodedeployListApplicationsInput
 @see AWSCodedeployListApplicationsOutput
 */
- (void)listApplications:(AWSCodedeployListApplicationsInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployListApplicationsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the deployment configurations with the IAM user or AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListDeploymentConfigs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployListDeploymentConfigsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInvalidNextToken`.
 
 @see AWSCodedeployListDeploymentConfigsInput
 @see AWSCodedeployListDeploymentConfigsOutput
 */
- (AWSTask<AWSCodedeployListDeploymentConfigsOutput *> *)listDeploymentConfigs:(AWSCodedeployListDeploymentConfigsInput *)request;

/**
 <p>Lists the deployment configurations with the IAM user or AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListDeploymentConfigs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInvalidNextToken`.
 
 @see AWSCodedeployListDeploymentConfigsInput
 @see AWSCodedeployListDeploymentConfigsOutput
 */
- (void)listDeploymentConfigs:(AWSCodedeployListDeploymentConfigsInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployListDeploymentConfigsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the deployment groups for an application registered with the IAM user or AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListDeploymentGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployListDeploymentGroupsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorInvalidNextToken`.
 
 @see AWSCodedeployListDeploymentGroupsInput
 @see AWSCodedeployListDeploymentGroupsOutput
 */
- (AWSTask<AWSCodedeployListDeploymentGroupsOutput *> *)listDeploymentGroups:(AWSCodedeployListDeploymentGroupsInput *)request;

/**
 <p>Lists the deployment groups for an application registered with the IAM user or AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListDeploymentGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorInvalidNextToken`.
 
 @see AWSCodedeployListDeploymentGroupsInput
 @see AWSCodedeployListDeploymentGroupsOutput
 */
- (void)listDeploymentGroups:(AWSCodedeployListDeploymentGroupsInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployListDeploymentGroupsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p> The newer <code>BatchGetDeploymentTargets</code> should be used instead because it works with all compute types. <code>ListDeploymentInstances</code> throws an exception if it is used with a compute platform other than EC2/On-premises or AWS Lambda. </p></note><p> Lists the instance for a deployment associated with the IAM user or AWS account. </p>
 
 @param request A container for the necessary parameters to execute the ListDeploymentInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployListDeploymentInstancesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorDeploymentIdRequired`, `AWSCodedeployErrorDeploymentDoesNotExist`, `AWSCodedeployErrorDeploymentNotStarted`, `AWSCodedeployErrorInvalidNextToken`, `AWSCodedeployErrorInvalidDeploymentId`, `AWSCodedeployErrorInvalidInstanceStatus`, `AWSCodedeployErrorInvalidInstanceType`, `AWSCodedeployErrorInvalidDeploymentInstanceType`, `AWSCodedeployErrorInvalidTargetFilterName`, `AWSCodedeployErrorInvalidComputePlatform`.
 
 @see AWSCodedeployListDeploymentInstancesInput
 @see AWSCodedeployListDeploymentInstancesOutput
 */
- (AWSTask<AWSCodedeployListDeploymentInstancesOutput *> *)listDeploymentInstances:(AWSCodedeployListDeploymentInstancesInput *)request;

/**
 <note><p> The newer <code>BatchGetDeploymentTargets</code> should be used instead because it works with all compute types. <code>ListDeploymentInstances</code> throws an exception if it is used with a compute platform other than EC2/On-premises or AWS Lambda. </p></note><p> Lists the instance for a deployment associated with the IAM user or AWS account. </p>
 
 @param request A container for the necessary parameters to execute the ListDeploymentInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorDeploymentIdRequired`, `AWSCodedeployErrorDeploymentDoesNotExist`, `AWSCodedeployErrorDeploymentNotStarted`, `AWSCodedeployErrorInvalidNextToken`, `AWSCodedeployErrorInvalidDeploymentId`, `AWSCodedeployErrorInvalidInstanceStatus`, `AWSCodedeployErrorInvalidInstanceType`, `AWSCodedeployErrorInvalidDeploymentInstanceType`, `AWSCodedeployErrorInvalidTargetFilterName`, `AWSCodedeployErrorInvalidComputePlatform`.
 
 @see AWSCodedeployListDeploymentInstancesInput
 @see AWSCodedeployListDeploymentInstancesOutput
 */
- (void)listDeploymentInstances:(AWSCodedeployListDeploymentInstancesInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployListDeploymentInstancesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns an array of target IDs that are associated a deployment. </p>
 
 @param request A container for the necessary parameters to execute the ListDeploymentTargets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployListDeploymentTargetsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorDeploymentIdRequired`, `AWSCodedeployErrorDeploymentDoesNotExist`, `AWSCodedeployErrorDeploymentNotStarted`, `AWSCodedeployErrorInvalidNextToken`, `AWSCodedeployErrorInvalidDeploymentId`, `AWSCodedeployErrorInvalidInstanceStatus`, `AWSCodedeployErrorInvalidInstanceType`, `AWSCodedeployErrorInvalidDeploymentInstanceType`.
 
 @see AWSCodedeployListDeploymentTargetsInput
 @see AWSCodedeployListDeploymentTargetsOutput
 */
- (AWSTask<AWSCodedeployListDeploymentTargetsOutput *> *)listDeploymentTargets:(AWSCodedeployListDeploymentTargetsInput *)request;

/**
 <p> Returns an array of target IDs that are associated a deployment. </p>
 
 @param request A container for the necessary parameters to execute the ListDeploymentTargets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorDeploymentIdRequired`, `AWSCodedeployErrorDeploymentDoesNotExist`, `AWSCodedeployErrorDeploymentNotStarted`, `AWSCodedeployErrorInvalidNextToken`, `AWSCodedeployErrorInvalidDeploymentId`, `AWSCodedeployErrorInvalidInstanceStatus`, `AWSCodedeployErrorInvalidInstanceType`, `AWSCodedeployErrorInvalidDeploymentInstanceType`.
 
 @see AWSCodedeployListDeploymentTargetsInput
 @see AWSCodedeployListDeploymentTargetsOutput
 */
- (void)listDeploymentTargets:(AWSCodedeployListDeploymentTargetsInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployListDeploymentTargetsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the deployments in a deployment group for an application registered with the IAM user or AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListDeployments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployListDeploymentsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorInvalidDeploymentGroupName`, `AWSCodedeployErrorDeploymentGroupDoesNotExist`, `AWSCodedeployErrorDeploymentGroupNameRequired`, `AWSCodedeployErrorInvalidTimeRange`, `AWSCodedeployErrorInvalidDeploymentStatus`, `AWSCodedeployErrorInvalidNextToken`, `AWSCodedeployErrorInvalidExternalId`, `AWSCodedeployErrorInvalidInput`.
 
 @see AWSCodedeployListDeploymentsInput
 @see AWSCodedeployListDeploymentsOutput
 */
- (AWSTask<AWSCodedeployListDeploymentsOutput *> *)listDeployments:(AWSCodedeployListDeploymentsInput *)request;

/**
 <p>Lists the deployments in a deployment group for an application registered with the IAM user or AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListDeployments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorInvalidDeploymentGroupName`, `AWSCodedeployErrorDeploymentGroupDoesNotExist`, `AWSCodedeployErrorDeploymentGroupNameRequired`, `AWSCodedeployErrorInvalidTimeRange`, `AWSCodedeployErrorInvalidDeploymentStatus`, `AWSCodedeployErrorInvalidNextToken`, `AWSCodedeployErrorInvalidExternalId`, `AWSCodedeployErrorInvalidInput`.
 
 @see AWSCodedeployListDeploymentsInput
 @see AWSCodedeployListDeploymentsOutput
 */
- (void)listDeployments:(AWSCodedeployListDeploymentsInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployListDeploymentsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the names of stored connections to GitHub accounts.</p>
 
 @param request A container for the necessary parameters to execute the ListGitHubAccountTokenNames service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployListGitHubAccountTokenNamesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInvalidNextToken`, `AWSCodedeployErrorResourceValidation`, `AWSCodedeployErrorOperationNotSupported`.
 
 @see AWSCodedeployListGitHubAccountTokenNamesInput
 @see AWSCodedeployListGitHubAccountTokenNamesOutput
 */
- (AWSTask<AWSCodedeployListGitHubAccountTokenNamesOutput *> *)listGitHubAccountTokenNames:(AWSCodedeployListGitHubAccountTokenNamesInput *)request;

/**
 <p>Lists the names of stored connections to GitHub accounts.</p>
 
 @param request A container for the necessary parameters to execute the ListGitHubAccountTokenNames service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInvalidNextToken`, `AWSCodedeployErrorResourceValidation`, `AWSCodedeployErrorOperationNotSupported`.
 
 @see AWSCodedeployListGitHubAccountTokenNamesInput
 @see AWSCodedeployListGitHubAccountTokenNamesOutput
 */
- (void)listGitHubAccountTokenNames:(AWSCodedeployListGitHubAccountTokenNamesInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployListGitHubAccountTokenNamesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of names for one or more on-premises instances.</p><p>Unless otherwise specified, both registered and deregistered on-premises instance names are listed. To list only registered or deregistered on-premises instance names, use the registration status parameter.</p>
 
 @param request A container for the necessary parameters to execute the ListOnPremisesInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployListOnPremisesInstancesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInvalidRegistrationStatus`, `AWSCodedeployErrorInvalidTagFilter`, `AWSCodedeployErrorInvalidNextToken`.
 
 @see AWSCodedeployListOnPremisesInstancesInput
 @see AWSCodedeployListOnPremisesInstancesOutput
 */
- (AWSTask<AWSCodedeployListOnPremisesInstancesOutput *> *)listOnPremisesInstances:(AWSCodedeployListOnPremisesInstancesInput *)request;

/**
 <p>Gets a list of names for one or more on-premises instances.</p><p>Unless otherwise specified, both registered and deregistered on-premises instance names are listed. To list only registered or deregistered on-premises instance names, use the registration status parameter.</p>
 
 @param request A container for the necessary parameters to execute the ListOnPremisesInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInvalidRegistrationStatus`, `AWSCodedeployErrorInvalidTagFilter`, `AWSCodedeployErrorInvalidNextToken`.
 
 @see AWSCodedeployListOnPremisesInstancesInput
 @see AWSCodedeployListOnPremisesInstancesOutput
 */
- (void)listOnPremisesInstances:(AWSCodedeployListOnPremisesInstancesInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployListOnPremisesInstancesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of tags for the resource identified by a specified Amazon Resource Name (ARN). Tags are used to organize and categorize your CodeDeploy resources. </p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployListTagsForResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorArnNotSupported`, `AWSCodedeployErrorInvalidArn`, `AWSCodedeployErrorResourceArnRequired`.
 
 @see AWSCodedeployListTagsForResourceInput
 @see AWSCodedeployListTagsForResourceOutput
 */
- (AWSTask<AWSCodedeployListTagsForResourceOutput *> *)listTagsForResource:(AWSCodedeployListTagsForResourceInput *)request;

/**
 <p> Returns a list of tags for the resource identified by a specified Amazon Resource Name (ARN). Tags are used to organize and categorize your CodeDeploy resources. </p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorArnNotSupported`, `AWSCodedeployErrorInvalidArn`, `AWSCodedeployErrorResourceArnRequired`.
 
 @see AWSCodedeployListTagsForResourceInput
 @see AWSCodedeployListTagsForResourceOutput
 */
- (void)listTagsForResource:(AWSCodedeployListTagsForResourceInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployListTagsForResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Sets the result of a Lambda validation function. The function validates lifecycle hooks during a deployment that uses the AWS Lambda or Amazon ECS compute platform. For AWS Lambda deployments, the available lifecycle hooks are <code>BeforeAllowTraffic</code> and <code>AfterAllowTraffic</code>. For Amazon ECS deployments, the available lifecycle hooks are <code>BeforeInstall</code>, <code>AfterInstall</code>, <code>AfterAllowTestTraffic</code>, <code>BeforeAllowTraffic</code>, and <code>AfterAllowTraffic</code>. Lambda validation functions return <code>Succeeded</code> or <code>Failed</code>. For more information, see <a href="https://docs.aws.amazon.com/codedeploy/latest/userguide/reference-appspec-file-structure-hooks.html#appspec-hooks-lambda">AppSpec 'hooks' Section for an AWS Lambda Deployment </a> and <a href="https://docs.aws.amazon.com/codedeploy/latest/userguide/reference-appspec-file-structure-hooks.html#appspec-hooks-ecs">AppSpec 'hooks' Section for an Amazon ECS Deployment</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutLifecycleEventHookExecutionStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployPutLifecycleEventHookExecutionStatusOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInvalidLifecycleEventHookExecutionStatus`, `AWSCodedeployErrorInvalidLifecycleEventHookExecutionId`, `AWSCodedeployErrorLifecycleEventAlreadyCompleted`, `AWSCodedeployErrorDeploymentIdRequired`, `AWSCodedeployErrorDeploymentDoesNotExist`, `AWSCodedeployErrorInvalidDeploymentId`, `AWSCodedeployErrorUnsupportedActionForDeploymentType`.
 
 @see AWSCodedeployPutLifecycleEventHookExecutionStatusInput
 @see AWSCodedeployPutLifecycleEventHookExecutionStatusOutput
 */
- (AWSTask<AWSCodedeployPutLifecycleEventHookExecutionStatusOutput *> *)putLifecycleEventHookExecutionStatus:(AWSCodedeployPutLifecycleEventHookExecutionStatusInput *)request;

/**
 <p> Sets the result of a Lambda validation function. The function validates lifecycle hooks during a deployment that uses the AWS Lambda or Amazon ECS compute platform. For AWS Lambda deployments, the available lifecycle hooks are <code>BeforeAllowTraffic</code> and <code>AfterAllowTraffic</code>. For Amazon ECS deployments, the available lifecycle hooks are <code>BeforeInstall</code>, <code>AfterInstall</code>, <code>AfterAllowTestTraffic</code>, <code>BeforeAllowTraffic</code>, and <code>AfterAllowTraffic</code>. Lambda validation functions return <code>Succeeded</code> or <code>Failed</code>. For more information, see <a href="https://docs.aws.amazon.com/codedeploy/latest/userguide/reference-appspec-file-structure-hooks.html#appspec-hooks-lambda">AppSpec 'hooks' Section for an AWS Lambda Deployment </a> and <a href="https://docs.aws.amazon.com/codedeploy/latest/userguide/reference-appspec-file-structure-hooks.html#appspec-hooks-ecs">AppSpec 'hooks' Section for an Amazon ECS Deployment</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutLifecycleEventHookExecutionStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInvalidLifecycleEventHookExecutionStatus`, `AWSCodedeployErrorInvalidLifecycleEventHookExecutionId`, `AWSCodedeployErrorLifecycleEventAlreadyCompleted`, `AWSCodedeployErrorDeploymentIdRequired`, `AWSCodedeployErrorDeploymentDoesNotExist`, `AWSCodedeployErrorInvalidDeploymentId`, `AWSCodedeployErrorUnsupportedActionForDeploymentType`.
 
 @see AWSCodedeployPutLifecycleEventHookExecutionStatusInput
 @see AWSCodedeployPutLifecycleEventHookExecutionStatusOutput
 */
- (void)putLifecycleEventHookExecutionStatus:(AWSCodedeployPutLifecycleEventHookExecutionStatusInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployPutLifecycleEventHookExecutionStatusOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers with AWS CodeDeploy a revision for the specified application.</p>
 
 @param request A container for the necessary parameters to execute the RegisterApplicationRevision service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorDescriptionTooLong`, `AWSCodedeployErrorRevisionRequired`, `AWSCodedeployErrorInvalidRevision`.
 
 @see AWSCodedeployRegisterApplicationRevisionInput
 */
- (AWSTask *)registerApplicationRevision:(AWSCodedeployRegisterApplicationRevisionInput *)request;

/**
 <p>Registers with AWS CodeDeploy a revision for the specified application.</p>
 
 @param request A container for the necessary parameters to execute the RegisterApplicationRevision service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorDescriptionTooLong`, `AWSCodedeployErrorRevisionRequired`, `AWSCodedeployErrorInvalidRevision`.
 
 @see AWSCodedeployRegisterApplicationRevisionInput
 */
- (void)registerApplicationRevision:(AWSCodedeployRegisterApplicationRevisionInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Registers an on-premises instance.</p><note><p>Only one IAM ARN (an IAM session ARN or IAM user ARN) is supported in the request. You cannot use both.</p></note>
 
 @param request A container for the necessary parameters to execute the RegisterOnPremisesInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInstanceNameAlreadyRegistered`, `AWSCodedeployErrorIamArnRequired`, `AWSCodedeployErrorIamSessionArnAlreadyRegistered`, `AWSCodedeployErrorIamUserArnAlreadyRegistered`, `AWSCodedeployErrorInstanceNameRequired`, `AWSCodedeployErrorIamUserArnRequired`, `AWSCodedeployErrorInvalidInstanceName`, `AWSCodedeployErrorInvalidIamSessionArn`, `AWSCodedeployErrorInvalidIamUserArn`, `AWSCodedeployErrorMultipleIamArnsProvided`.
 
 @see AWSCodedeployRegisterOnPremisesInstanceInput
 */
- (AWSTask *)registerOnPremisesInstance:(AWSCodedeployRegisterOnPremisesInstanceInput *)request;

/**
 <p>Registers an on-premises instance.</p><note><p>Only one IAM ARN (an IAM session ARN or IAM user ARN) is supported in the request. You cannot use both.</p></note>
 
 @param request A container for the necessary parameters to execute the RegisterOnPremisesInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInstanceNameAlreadyRegistered`, `AWSCodedeployErrorIamArnRequired`, `AWSCodedeployErrorIamSessionArnAlreadyRegistered`, `AWSCodedeployErrorIamUserArnAlreadyRegistered`, `AWSCodedeployErrorInstanceNameRequired`, `AWSCodedeployErrorIamUserArnRequired`, `AWSCodedeployErrorInvalidInstanceName`, `AWSCodedeployErrorInvalidIamSessionArn`, `AWSCodedeployErrorInvalidIamUserArn`, `AWSCodedeployErrorMultipleIamArnsProvided`.
 
 @see AWSCodedeployRegisterOnPremisesInstanceInput
 */
- (void)registerOnPremisesInstance:(AWSCodedeployRegisterOnPremisesInstanceInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes one or more tags from one or more on-premises instances.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTagsFromOnPremisesInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInstanceNameRequired`, `AWSCodedeployErrorInvalidInstanceName`, `AWSCodedeployErrorTagRequired`, `AWSCodedeployErrorInvalidTag`, `AWSCodedeployErrorTagLimitExceeded`, `AWSCodedeployErrorInstanceLimitExceeded`, `AWSCodedeployErrorInstanceNotRegistered`.
 
 @see AWSCodedeployRemoveTagsFromOnPremisesInstancesInput
 */
- (AWSTask *)removeTagsFromOnPremisesInstances:(AWSCodedeployRemoveTagsFromOnPremisesInstancesInput *)request;

/**
 <p>Removes one or more tags from one or more on-premises instances.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTagsFromOnPremisesInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorInstanceNameRequired`, `AWSCodedeployErrorInvalidInstanceName`, `AWSCodedeployErrorTagRequired`, `AWSCodedeployErrorInvalidTag`, `AWSCodedeployErrorTagLimitExceeded`, `AWSCodedeployErrorInstanceLimitExceeded`, `AWSCodedeployErrorInstanceNotRegistered`.
 
 @see AWSCodedeployRemoveTagsFromOnPremisesInstancesInput
 */
- (void)removeTagsFromOnPremisesInstances:(AWSCodedeployRemoveTagsFromOnPremisesInstancesInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>In a blue/green deployment, overrides any specified wait time and starts terminating instances immediately after the traffic routing is complete.</p>
 
 @param request A container for the necessary parameters to execute the SkipWaitTimeForInstanceTermination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorDeploymentIdRequired`, `AWSCodedeployErrorDeploymentDoesNotExist`, `AWSCodedeployErrorDeploymentAlreadyCompleted`, `AWSCodedeployErrorInvalidDeploymentId`, `AWSCodedeployErrorDeploymentNotStarted`, `AWSCodedeployErrorUnsupportedActionForDeploymentType`.
 
 @see AWSCodedeploySkipWaitTimeForInstanceTerminationInput
 */
- (AWSTask *)skipWaitTimeForInstanceTermination:(AWSCodedeploySkipWaitTimeForInstanceTerminationInput *)request;

/**
 <p>In a blue/green deployment, overrides any specified wait time and starts terminating instances immediately after the traffic routing is complete.</p>
 
 @param request A container for the necessary parameters to execute the SkipWaitTimeForInstanceTermination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorDeploymentIdRequired`, `AWSCodedeployErrorDeploymentDoesNotExist`, `AWSCodedeployErrorDeploymentAlreadyCompleted`, `AWSCodedeployErrorInvalidDeploymentId`, `AWSCodedeployErrorDeploymentNotStarted`, `AWSCodedeployErrorUnsupportedActionForDeploymentType`.
 
 @see AWSCodedeploySkipWaitTimeForInstanceTerminationInput
 */
- (void)skipWaitTimeForInstanceTermination:(AWSCodedeploySkipWaitTimeForInstanceTerminationInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Attempts to stop an ongoing deployment.</p>
 
 @param request A container for the necessary parameters to execute the StopDeployment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployStopDeploymentOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorDeploymentIdRequired`, `AWSCodedeployErrorDeploymentDoesNotExist`, `AWSCodedeployErrorDeploymentGroupDoesNotExist`, `AWSCodedeployErrorDeploymentAlreadyCompleted`, `AWSCodedeployErrorInvalidDeploymentId`, `AWSCodedeployErrorUnsupportedActionForDeploymentType`.
 
 @see AWSCodedeployStopDeploymentInput
 @see AWSCodedeployStopDeploymentOutput
 */
- (AWSTask<AWSCodedeployStopDeploymentOutput *> *)stopDeployment:(AWSCodedeployStopDeploymentInput *)request;

/**
 <p>Attempts to stop an ongoing deployment.</p>
 
 @param request A container for the necessary parameters to execute the StopDeployment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorDeploymentIdRequired`, `AWSCodedeployErrorDeploymentDoesNotExist`, `AWSCodedeployErrorDeploymentGroupDoesNotExist`, `AWSCodedeployErrorDeploymentAlreadyCompleted`, `AWSCodedeployErrorInvalidDeploymentId`, `AWSCodedeployErrorUnsupportedActionForDeploymentType`.
 
 @see AWSCodedeployStopDeploymentInput
 @see AWSCodedeployStopDeploymentOutput
 */
- (void)stopDeployment:(AWSCodedeployStopDeploymentInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployStopDeploymentOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Associates the list of tags in the input <code>Tags</code> parameter with the resource identified by the <code>ResourceArn</code> input parameter. </p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployTagResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorResourceArnRequired`, `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorDeploymentGroupDoesNotExist`, `AWSCodedeployErrorDeploymentConfigDoesNotExist`, `AWSCodedeployErrorTagRequired`, `AWSCodedeployErrorInvalidTagsToAdd`, `AWSCodedeployErrorArnNotSupported`, `AWSCodedeployErrorInvalidArn`.
 
 @see AWSCodedeployTagResourceInput
 @see AWSCodedeployTagResourceOutput
 */
- (AWSTask<AWSCodedeployTagResourceOutput *> *)tagResource:(AWSCodedeployTagResourceInput *)request;

/**
 <p> Associates the list of tags in the input <code>Tags</code> parameter with the resource identified by the <code>ResourceArn</code> input parameter. </p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorResourceArnRequired`, `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorDeploymentGroupDoesNotExist`, `AWSCodedeployErrorDeploymentConfigDoesNotExist`, `AWSCodedeployErrorTagRequired`, `AWSCodedeployErrorInvalidTagsToAdd`, `AWSCodedeployErrorArnNotSupported`, `AWSCodedeployErrorInvalidArn`.
 
 @see AWSCodedeployTagResourceInput
 @see AWSCodedeployTagResourceOutput
 */
- (void)tagResource:(AWSCodedeployTagResourceInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployTagResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Disassociates a resource from a list of tags. The resource is identified by the <code>ResourceArn</code> input parameter. The tags are identified by the list of keys in the <code>TagKeys</code> input parameter. </p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployUntagResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorResourceArnRequired`, `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorDeploymentGroupDoesNotExist`, `AWSCodedeployErrorDeploymentConfigDoesNotExist`, `AWSCodedeployErrorTagRequired`, `AWSCodedeployErrorInvalidTagsToAdd`, `AWSCodedeployErrorArnNotSupported`, `AWSCodedeployErrorInvalidArn`.
 
 @see AWSCodedeployUntagResourceInput
 @see AWSCodedeployUntagResourceOutput
 */
- (AWSTask<AWSCodedeployUntagResourceOutput *> *)untagResource:(AWSCodedeployUntagResourceInput *)request;

/**
 <p> Disassociates a resource from a list of tags. The resource is identified by the <code>ResourceArn</code> input parameter. The tags are identified by the list of keys in the <code>TagKeys</code> input parameter. </p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorResourceArnRequired`, `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorDeploymentGroupDoesNotExist`, `AWSCodedeployErrorDeploymentConfigDoesNotExist`, `AWSCodedeployErrorTagRequired`, `AWSCodedeployErrorInvalidTagsToAdd`, `AWSCodedeployErrorArnNotSupported`, `AWSCodedeployErrorInvalidArn`.
 
 @see AWSCodedeployUntagResourceInput
 @see AWSCodedeployUntagResourceOutput
 */
- (void)untagResource:(AWSCodedeployUntagResourceInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployUntagResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Changes the name of an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApplication service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorApplicationAlreadyExists`, `AWSCodedeployErrorApplicationDoesNotExist`.
 
 @see AWSCodedeployUpdateApplicationInput
 */
- (AWSTask *)updateApplication:(AWSCodedeployUpdateApplicationInput *)request;

/**
 <p>Changes the name of an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApplication service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorApplicationAlreadyExists`, `AWSCodedeployErrorApplicationDoesNotExist`.
 
 @see AWSCodedeployUpdateApplicationInput
 */
- (void)updateApplication:(AWSCodedeployUpdateApplicationInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Changes information about a deployment group.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDeploymentGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodedeployUpdateDeploymentGroupOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorInvalidDeploymentGroupName`, `AWSCodedeployErrorDeploymentGroupAlreadyExists`, `AWSCodedeployErrorDeploymentGroupNameRequired`, `AWSCodedeployErrorDeploymentGroupDoesNotExist`, `AWSCodedeployErrorInvalidEC2Tag`, `AWSCodedeployErrorInvalidTag`, `AWSCodedeployErrorInvalidAutoScalingGroup`, `AWSCodedeployErrorInvalidDeploymentConfigName`, `AWSCodedeployErrorDeploymentConfigDoesNotExist`, `AWSCodedeployErrorInvalidRole`, `AWSCodedeployErrorLifecycleHookLimitExceeded`, `AWSCodedeployErrorInvalidTriggerConfig`, `AWSCodedeployErrorTriggerTargetsLimitExceeded`, `AWSCodedeployErrorInvalidAlarmConfig`, `AWSCodedeployErrorAlarmsLimitExceeded`, `AWSCodedeployErrorInvalidAutoRollbackConfig`, `AWSCodedeployErrorInvalidLoadBalancerInfo`, `AWSCodedeployErrorInvalidDeploymentStyle`, `AWSCodedeployErrorInvalidBlueGreenDeploymentConfiguration`, `AWSCodedeployErrorInvalidEC2TagCombination`, `AWSCodedeployErrorInvalidOnPremisesTagCombination`, `AWSCodedeployErrorTagSetListLimitExceeded`, `AWSCodedeployErrorInvalidInput`, `AWSCodedeployErrorThrottling`, `AWSCodedeployErrorInvalidECSService`, `AWSCodedeployErrorInvalidTargetGroupPair`, `AWSCodedeployErrorECSServiceMappingLimitExceeded`, `AWSCodedeployErrorInvalidTrafficRoutingConfiguration`.
 
 @see AWSCodedeployUpdateDeploymentGroupInput
 @see AWSCodedeployUpdateDeploymentGroupOutput
 */
- (AWSTask<AWSCodedeployUpdateDeploymentGroupOutput *> *)updateDeploymentGroup:(AWSCodedeployUpdateDeploymentGroupInput *)request;

/**
 <p>Changes information about a deployment group.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDeploymentGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodedeployErrorDomain` domain and the following error code: `AWSCodedeployErrorApplicationNameRequired`, `AWSCodedeployErrorInvalidApplicationName`, `AWSCodedeployErrorApplicationDoesNotExist`, `AWSCodedeployErrorInvalidDeploymentGroupName`, `AWSCodedeployErrorDeploymentGroupAlreadyExists`, `AWSCodedeployErrorDeploymentGroupNameRequired`, `AWSCodedeployErrorDeploymentGroupDoesNotExist`, `AWSCodedeployErrorInvalidEC2Tag`, `AWSCodedeployErrorInvalidTag`, `AWSCodedeployErrorInvalidAutoScalingGroup`, `AWSCodedeployErrorInvalidDeploymentConfigName`, `AWSCodedeployErrorDeploymentConfigDoesNotExist`, `AWSCodedeployErrorInvalidRole`, `AWSCodedeployErrorLifecycleHookLimitExceeded`, `AWSCodedeployErrorInvalidTriggerConfig`, `AWSCodedeployErrorTriggerTargetsLimitExceeded`, `AWSCodedeployErrorInvalidAlarmConfig`, `AWSCodedeployErrorAlarmsLimitExceeded`, `AWSCodedeployErrorInvalidAutoRollbackConfig`, `AWSCodedeployErrorInvalidLoadBalancerInfo`, `AWSCodedeployErrorInvalidDeploymentStyle`, `AWSCodedeployErrorInvalidBlueGreenDeploymentConfiguration`, `AWSCodedeployErrorInvalidEC2TagCombination`, `AWSCodedeployErrorInvalidOnPremisesTagCombination`, `AWSCodedeployErrorTagSetListLimitExceeded`, `AWSCodedeployErrorInvalidInput`, `AWSCodedeployErrorThrottling`, `AWSCodedeployErrorInvalidECSService`, `AWSCodedeployErrorInvalidTargetGroupPair`, `AWSCodedeployErrorECSServiceMappingLimitExceeded`, `AWSCodedeployErrorInvalidTrafficRoutingConfiguration`.
 
 @see AWSCodedeployUpdateDeploymentGroupInput
 @see AWSCodedeployUpdateDeploymentGroupOutput
 */
- (void)updateDeploymentGroup:(AWSCodedeployUpdateDeploymentGroupInput *)request completionHandler:(void (^ _Nullable)(AWSCodedeployUpdateDeploymentGroupOutput * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
