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
#import "AWSCloudformationModel.h"
#import "AWSCloudformationResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSCloudformation
FOUNDATION_EXPORT NSString *const AWSCloudformationSDKVersion;

/**
 <fullname>AWS CloudFormation</fullname><p>AWS CloudFormation allows you to create and manage AWS infrastructure deployments predictably and repeatedly. You can use AWS CloudFormation to leverage AWS products, such as Amazon Elastic Compute Cloud, Amazon Elastic Block Store, Amazon Simple Notification Service, Elastic Load Balancing, and Auto Scaling to build highly-reliable, highly scalable, cost-effective applications without creating or configuring the underlying AWS infrastructure.</p><p>With AWS CloudFormation, you declare all of your resources and dependencies in a template file. The template defines a collection of resources as a single unit called a stack. AWS CloudFormation creates and deletes all member resources of the stack together and manages all dependencies between the resources for you.</p><p>For more information about AWS CloudFormation, see the <a href="http://aws.amazon.com/cloudformation/">AWS CloudFormation Product Page</a>.</p><p>Amazon CloudFormation makes use of other AWS products. If you need additional technical information about a specific AWS product, you can find the product's technical documentation at <a href="https://docs.aws.amazon.com/">docs.aws.amazon.com</a>.</p>
 */
@interface AWSCloudformation : AWSService

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

     let Cloudformation = AWSCloudformation.default()

 *Objective-C*

     AWSCloudformation *Cloudformation = [AWSCloudformation defaultCloudformation];

 @return The default service client.
 */
+ (instancetype)defaultCloudformation;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSCloudformation.register(with: configuration!, forKey: "USWest2Cloudformation")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:@"USWest2Cloudformation"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Cloudformation = AWSCloudformation(forKey: "USWest2Cloudformation")

 *Objective-C*

     AWSCloudformation *Cloudformation = [AWSCloudformation CloudformationForKey:@"USWest2Cloudformation"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerCloudformationWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerCloudformationWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSCloudformation.register(with: configuration!, forKey: "USWest2Cloudformation")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:@"USWest2Cloudformation"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Cloudformation = AWSCloudformation(forKey: "USWest2Cloudformation")

 *Objective-C*

     AWSCloudformation *Cloudformation = [AWSCloudformation CloudformationForKey:@"USWest2Cloudformation"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)CloudformationForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeCloudformationForKey:(NSString *)key;

/**
 <p>Cancels an update on the specified stack. If the call completes successfully, the stack rolls back the update and reverts to the previous stack configuration.</p><note><p>You can cancel only stacks that are in the UPDATE_IN_PROGRESS state.</p></note>
 
 @param request A container for the necessary parameters to execute the CancelUpdateStack service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorTokenAlreadyExists`.
 
 @see AWSCloudformationCancelUpdateStackInput
 */
- (AWSTask *)cancelUpdateStack:(AWSCloudformationCancelUpdateStackInput *)request;

/**
 <p>Cancels an update on the specified stack. If the call completes successfully, the stack rolls back the update and reverts to the previous stack configuration.</p><note><p>You can cancel only stacks that are in the UPDATE_IN_PROGRESS state.</p></note>
 
 @param request A container for the necessary parameters to execute the CancelUpdateStack service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorTokenAlreadyExists`.
 
 @see AWSCloudformationCancelUpdateStackInput
 */
- (void)cancelUpdateStack:(AWSCloudformationCancelUpdateStackInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>For a specified stack that is in the <code>UPDATE_ROLLBACK_FAILED</code> state, continues rolling it back to the <code>UPDATE_ROLLBACK_COMPLETE</code> state. Depending on the cause of the failure, you can manually <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/troubleshooting.html#troubleshooting-errors-update-rollback-failed"> fix the error</a> and continue the rollback. By continuing the rollback, you can return your stack to a working state (the <code>UPDATE_ROLLBACK_COMPLETE</code> state), and then try to update the stack again.</p><p>A stack goes into the <code>UPDATE_ROLLBACK_FAILED</code> state when AWS CloudFormation cannot roll back all changes after a failed stack update. For example, you might have a stack that is rolling back to an old database instance that was deleted outside of AWS CloudFormation. Because AWS CloudFormation doesn't know the database was deleted, it assumes that the database instance still exists and attempts to roll back to it, causing the update rollback to fail.</p>
 
 @param request A container for the necessary parameters to execute the ContinueUpdateRollback service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationContinueUpdateRollbackOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorTokenAlreadyExists`.
 
 @see AWSCloudformationContinueUpdateRollbackInput
 @see AWSCloudformationContinueUpdateRollbackOutput
 */
- (AWSTask<AWSCloudformationContinueUpdateRollbackOutput *> *)continueUpdateRollback:(AWSCloudformationContinueUpdateRollbackInput *)request;

/**
 <p>For a specified stack that is in the <code>UPDATE_ROLLBACK_FAILED</code> state, continues rolling it back to the <code>UPDATE_ROLLBACK_COMPLETE</code> state. Depending on the cause of the failure, you can manually <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/troubleshooting.html#troubleshooting-errors-update-rollback-failed"> fix the error</a> and continue the rollback. By continuing the rollback, you can return your stack to a working state (the <code>UPDATE_ROLLBACK_COMPLETE</code> state), and then try to update the stack again.</p><p>A stack goes into the <code>UPDATE_ROLLBACK_FAILED</code> state when AWS CloudFormation cannot roll back all changes after a failed stack update. For example, you might have a stack that is rolling back to an old database instance that was deleted outside of AWS CloudFormation. Because AWS CloudFormation doesn't know the database was deleted, it assumes that the database instance still exists and attempts to roll back to it, causing the update rollback to fail.</p>
 
 @param request A container for the necessary parameters to execute the ContinueUpdateRollback service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorTokenAlreadyExists`.
 
 @see AWSCloudformationContinueUpdateRollbackInput
 @see AWSCloudformationContinueUpdateRollbackOutput
 */
- (void)continueUpdateRollback:(AWSCloudformationContinueUpdateRollbackInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationContinueUpdateRollbackOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a list of changes that will be applied to a stack so that you can review the changes before executing them. You can create a change set for a stack that doesn't exist or an existing stack. If you create a change set for a stack that doesn't exist, the change set shows all of the resources that AWS CloudFormation will create. If you create a change set for an existing stack, AWS CloudFormation compares the stack's information with the information that you submit in the change set and lists the differences. Use change sets to understand which resources AWS CloudFormation will create or change, and how it will change resources in an existing stack, before you create or update a stack.</p><p>To create a change set for a stack that doesn't exist, for the <code>ChangeSetType</code> parameter, specify <code>CREATE</code>. To create a change set for an existing stack, specify <code>UPDATE</code> for the <code>ChangeSetType</code> parameter. To create a change set for an import operation, specify <code>IMPORT</code> for the <code>ChangeSetType</code> parameter. After the <code>CreateChangeSet</code> call successfully completes, AWS CloudFormation starts creating the change set. To check the status of the change set or to review it, use the <a>DescribeChangeSet</a> action.</p><p>When you are satisfied with the changes the change set will make, execute the change set by using the <a>ExecuteChangeSet</a> action. AWS CloudFormation doesn't make changes until you execute the change set.</p>
 
 @param request A container for the necessary parameters to execute the CreateChangeSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationCreateChangeSetOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorAlreadyExists`, `AWSCloudformationErrorInsufficientCapabilities`, `AWSCloudformationErrorLimitExceeded`.
 
 @see AWSCloudformationCreateChangeSetInput
 @see AWSCloudformationCreateChangeSetOutput
 */
- (AWSTask<AWSCloudformationCreateChangeSetOutput *> *)createChangeSet:(AWSCloudformationCreateChangeSetInput *)request;

/**
 <p>Creates a list of changes that will be applied to a stack so that you can review the changes before executing them. You can create a change set for a stack that doesn't exist or an existing stack. If you create a change set for a stack that doesn't exist, the change set shows all of the resources that AWS CloudFormation will create. If you create a change set for an existing stack, AWS CloudFormation compares the stack's information with the information that you submit in the change set and lists the differences. Use change sets to understand which resources AWS CloudFormation will create or change, and how it will change resources in an existing stack, before you create or update a stack.</p><p>To create a change set for a stack that doesn't exist, for the <code>ChangeSetType</code> parameter, specify <code>CREATE</code>. To create a change set for an existing stack, specify <code>UPDATE</code> for the <code>ChangeSetType</code> parameter. To create a change set for an import operation, specify <code>IMPORT</code> for the <code>ChangeSetType</code> parameter. After the <code>CreateChangeSet</code> call successfully completes, AWS CloudFormation starts creating the change set. To check the status of the change set or to review it, use the <a>DescribeChangeSet</a> action.</p><p>When you are satisfied with the changes the change set will make, execute the change set by using the <a>ExecuteChangeSet</a> action. AWS CloudFormation doesn't make changes until you execute the change set.</p>
 
 @param request A container for the necessary parameters to execute the CreateChangeSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorAlreadyExists`, `AWSCloudformationErrorInsufficientCapabilities`, `AWSCloudformationErrorLimitExceeded`.
 
 @see AWSCloudformationCreateChangeSetInput
 @see AWSCloudformationCreateChangeSetOutput
 */
- (void)createChangeSet:(AWSCloudformationCreateChangeSetInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationCreateChangeSetOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a stack as specified in the template. After the call completes successfully, the stack creation starts. You can check the status of the stack via the <a>DescribeStacks</a> API.</p>
 
 @param request A container for the necessary parameters to execute the CreateStack service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationCreateStackOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorLimitExceeded`, `AWSCloudformationErrorAlreadyExists`, `AWSCloudformationErrorTokenAlreadyExists`, `AWSCloudformationErrorInsufficientCapabilities`.
 
 @see AWSCloudformationCreateStackInput
 @see AWSCloudformationCreateStackOutput
 */
- (AWSTask<AWSCloudformationCreateStackOutput *> *)createStack:(AWSCloudformationCreateStackInput *)request;

/**
 <p>Creates a stack as specified in the template. After the call completes successfully, the stack creation starts. You can check the status of the stack via the <a>DescribeStacks</a> API.</p>
 
 @param request A container for the necessary parameters to execute the CreateStack service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorLimitExceeded`, `AWSCloudformationErrorAlreadyExists`, `AWSCloudformationErrorTokenAlreadyExists`, `AWSCloudformationErrorInsufficientCapabilities`.
 
 @see AWSCloudformationCreateStackInput
 @see AWSCloudformationCreateStackOutput
 */
- (void)createStack:(AWSCloudformationCreateStackInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationCreateStackOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates stack instances for the specified accounts, within the specified Regions. A stack instance refers to a stack in a specific account and Region. You must specify at least one value for either <code>Accounts</code> or <code>DeploymentTargets</code>, and you must specify at least one value for <code>Regions</code>.</p>
 
 @param request A container for the necessary parameters to execute the CreateStackInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationCreateStackInstancesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotFound`, `AWSCloudformationErrorOperationInProgress`, `AWSCloudformationErrorOperationIdAlreadyExists`, `AWSCloudformationErrorStaleRequest`, `AWSCloudformationErrorInvalidOperation`, `AWSCloudformationErrorLimitExceeded`.
 
 @see AWSCloudformationCreateStackInstancesInput
 @see AWSCloudformationCreateStackInstancesOutput
 */
- (AWSTask<AWSCloudformationCreateStackInstancesOutput *> *)createStackInstances:(AWSCloudformationCreateStackInstancesInput *)request;

/**
 <p>Creates stack instances for the specified accounts, within the specified Regions. A stack instance refers to a stack in a specific account and Region. You must specify at least one value for either <code>Accounts</code> or <code>DeploymentTargets</code>, and you must specify at least one value for <code>Regions</code>.</p>
 
 @param request A container for the necessary parameters to execute the CreateStackInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotFound`, `AWSCloudformationErrorOperationInProgress`, `AWSCloudformationErrorOperationIdAlreadyExists`, `AWSCloudformationErrorStaleRequest`, `AWSCloudformationErrorInvalidOperation`, `AWSCloudformationErrorLimitExceeded`.
 
 @see AWSCloudformationCreateStackInstancesInput
 @see AWSCloudformationCreateStackInstancesOutput
 */
- (void)createStackInstances:(AWSCloudformationCreateStackInstancesInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationCreateStackInstancesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a stack set.</p>
 
 @param request A container for the necessary parameters to execute the CreateStackSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationCreateStackSetOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorNameAlreadyExists`, `AWSCloudformationErrorCreatedButModified`, `AWSCloudformationErrorLimitExceeded`.
 
 @see AWSCloudformationCreateStackSetInput
 @see AWSCloudformationCreateStackSetOutput
 */
- (AWSTask<AWSCloudformationCreateStackSetOutput *> *)createStackSet:(AWSCloudformationCreateStackSetInput *)request;

/**
 <p>Creates a stack set.</p>
 
 @param request A container for the necessary parameters to execute the CreateStackSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorNameAlreadyExists`, `AWSCloudformationErrorCreatedButModified`, `AWSCloudformationErrorLimitExceeded`.
 
 @see AWSCloudformationCreateStackSetInput
 @see AWSCloudformationCreateStackSetOutput
 */
- (void)createStackSet:(AWSCloudformationCreateStackSetInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationCreateStackSetOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified change set. Deleting change sets ensures that no one executes the wrong change set.</p><p>If the call successfully completes, AWS CloudFormation successfully deleted the change set.</p>
 
 @param request A container for the necessary parameters to execute the DeleteChangeSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationDeleteChangeSetOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorInvalidChangeSetStatus`.
 
 @see AWSCloudformationDeleteChangeSetInput
 @see AWSCloudformationDeleteChangeSetOutput
 */
- (AWSTask<AWSCloudformationDeleteChangeSetOutput *> *)deleteChangeSet:(AWSCloudformationDeleteChangeSetInput *)request;

/**
 <p>Deletes the specified change set. Deleting change sets ensures that no one executes the wrong change set.</p><p>If the call successfully completes, AWS CloudFormation successfully deleted the change set.</p>
 
 @param request A container for the necessary parameters to execute the DeleteChangeSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorInvalidChangeSetStatus`.
 
 @see AWSCloudformationDeleteChangeSetInput
 @see AWSCloudformationDeleteChangeSetOutput
 */
- (void)deleteChangeSet:(AWSCloudformationDeleteChangeSetInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationDeleteChangeSetOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified stack. Once the call completes successfully, stack deletion starts. Deleted stacks do not show up in the <a>DescribeStacks</a> API if the deletion has been completed successfully.</p>
 
 @param request A container for the necessary parameters to execute the DeleteStack service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorTokenAlreadyExists`.
 
 @see AWSCloudformationDeleteStackInput
 */
- (AWSTask *)deleteStack:(AWSCloudformationDeleteStackInput *)request;

/**
 <p>Deletes a specified stack. Once the call completes successfully, stack deletion starts. Deleted stacks do not show up in the <a>DescribeStacks</a> API if the deletion has been completed successfully.</p>
 
 @param request A container for the necessary parameters to execute the DeleteStack service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorTokenAlreadyExists`.
 
 @see AWSCloudformationDeleteStackInput
 */
- (void)deleteStack:(AWSCloudformationDeleteStackInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes stack instances for the specified accounts, in the specified Regions. </p>
 
 @param request A container for the necessary parameters to execute the DeleteStackInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationDeleteStackInstancesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotFound`, `AWSCloudformationErrorOperationInProgress`, `AWSCloudformationErrorOperationIdAlreadyExists`, `AWSCloudformationErrorStaleRequest`, `AWSCloudformationErrorInvalidOperation`.
 
 @see AWSCloudformationDeleteStackInstancesInput
 @see AWSCloudformationDeleteStackInstancesOutput
 */
- (AWSTask<AWSCloudformationDeleteStackInstancesOutput *> *)deleteStackInstances:(AWSCloudformationDeleteStackInstancesInput *)request;

/**
 <p>Deletes stack instances for the specified accounts, in the specified Regions. </p>
 
 @param request A container for the necessary parameters to execute the DeleteStackInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotFound`, `AWSCloudformationErrorOperationInProgress`, `AWSCloudformationErrorOperationIdAlreadyExists`, `AWSCloudformationErrorStaleRequest`, `AWSCloudformationErrorInvalidOperation`.
 
 @see AWSCloudformationDeleteStackInstancesInput
 @see AWSCloudformationDeleteStackInstancesOutput
 */
- (void)deleteStackInstances:(AWSCloudformationDeleteStackInstancesInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationDeleteStackInstancesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a stack set. Before you can delete a stack set, all of its member stack instances must be deleted. For more information about how to do this, see <a>DeleteStackInstances</a>. </p>
 
 @param request A container for the necessary parameters to execute the DeleteStackSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationDeleteStackSetOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotEmpty`, `AWSCloudformationErrorOperationInProgress`.
 
 @see AWSCloudformationDeleteStackSetInput
 @see AWSCloudformationDeleteStackSetOutput
 */
- (AWSTask<AWSCloudformationDeleteStackSetOutput *> *)deleteStackSet:(AWSCloudformationDeleteStackSetInput *)request;

/**
 <p>Deletes a stack set. Before you can delete a stack set, all of its member stack instances must be deleted. For more information about how to do this, see <a>DeleteStackInstances</a>. </p>
 
 @param request A container for the necessary parameters to execute the DeleteStackSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotEmpty`, `AWSCloudformationErrorOperationInProgress`.
 
 @see AWSCloudformationDeleteStackSetInput
 @see AWSCloudformationDeleteStackSetOutput
 */
- (void)deleteStackSet:(AWSCloudformationDeleteStackSetInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationDeleteStackSetOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a type or type version from active use in the CloudFormation registry. If a type or type version is deregistered, it cannot be used in CloudFormation operations.</p><p>To deregister a type, you must individually deregister all registered versions of that type. If a type has only a single registered version, deregistering that version results in the type itself being deregistered. </p><p>You cannot deregister the default version of a type, unless it is the only registered version of that type, in which case the type itself is deregistered as well. </p>
 
 @param request A container for the necessary parameters to execute the DeregisterType service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationDeregisterTypeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorCFNRegistry`, `AWSCloudformationErrorTypeNotFound`.
 
 @see AWSCloudformationDeregisterTypeInput
 @see AWSCloudformationDeregisterTypeOutput
 */
- (AWSTask<AWSCloudformationDeregisterTypeOutput *> *)deregisterType:(AWSCloudformationDeregisterTypeInput *)request;

/**
 <p>Removes a type or type version from active use in the CloudFormation registry. If a type or type version is deregistered, it cannot be used in CloudFormation operations.</p><p>To deregister a type, you must individually deregister all registered versions of that type. If a type has only a single registered version, deregistering that version results in the type itself being deregistered. </p><p>You cannot deregister the default version of a type, unless it is the only registered version of that type, in which case the type itself is deregistered as well. </p>
 
 @param request A container for the necessary parameters to execute the DeregisterType service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorCFNRegistry`, `AWSCloudformationErrorTypeNotFound`.
 
 @see AWSCloudformationDeregisterTypeInput
 @see AWSCloudformationDeregisterTypeOutput
 */
- (void)deregisterType:(AWSCloudformationDeregisterTypeInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationDeregisterTypeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves your account's AWS CloudFormation limits, such as the maximum number of stacks that you can create in your account. For more information about account limits, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cloudformation-limits.html">AWS CloudFormation Limits</a> in the <i>AWS CloudFormation User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccountLimits service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationDescribeAccountLimitsOutput`.
 
 @see AWSCloudformationDescribeAccountLimitsInput
 @see AWSCloudformationDescribeAccountLimitsOutput
 */
- (AWSTask<AWSCloudformationDescribeAccountLimitsOutput *> *)describeAccountLimits:(AWSCloudformationDescribeAccountLimitsInput *)request;

/**
 <p>Retrieves your account's AWS CloudFormation limits, such as the maximum number of stacks that you can create in your account. For more information about account limits, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cloudformation-limits.html">AWS CloudFormation Limits</a> in the <i>AWS CloudFormation User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccountLimits service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudformationDescribeAccountLimitsInput
 @see AWSCloudformationDescribeAccountLimitsOutput
 */
- (void)describeAccountLimits:(AWSCloudformationDescribeAccountLimitsInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationDescribeAccountLimitsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the inputs for the change set and a list of changes that AWS CloudFormation will make if you execute the change set. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-changesets.html">Updating Stacks Using Change Sets</a> in the AWS CloudFormation User Guide.</p>
 
 @param request A container for the necessary parameters to execute the DescribeChangeSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationDescribeChangeSetOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorChangeSetNotFound`.
 
 @see AWSCloudformationDescribeChangeSetInput
 @see AWSCloudformationDescribeChangeSetOutput
 */
- (AWSTask<AWSCloudformationDescribeChangeSetOutput *> *)describeChangeSet:(AWSCloudformationDescribeChangeSetInput *)request;

/**
 <p>Returns the inputs for the change set and a list of changes that AWS CloudFormation will make if you execute the change set. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-changesets.html">Updating Stacks Using Change Sets</a> in the AWS CloudFormation User Guide.</p>
 
 @param request A container for the necessary parameters to execute the DescribeChangeSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorChangeSetNotFound`.
 
 @see AWSCloudformationDescribeChangeSetInput
 @see AWSCloudformationDescribeChangeSetOutput
 */
- (void)describeChangeSet:(AWSCloudformationDescribeChangeSetInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationDescribeChangeSetOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a stack drift detection operation. A stack drift detection operation detects whether a stack's actual configuration differs, or has <i>drifted</i>, from it's expected configuration, as defined in the stack template and any values specified as template parameters. A stack is considered to have drifted if one or more of its resources have drifted. For more information on stack and resource drift, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting Unregulated Configuration Changes to Stacks and Resources</a>.</p><p>Use <a>DetectStackDrift</a> to initiate a stack drift detection operation. <code>DetectStackDrift</code> returns a <code>StackDriftDetectionId</code> you can use to monitor the progress of the operation using <code>DescribeStackDriftDetectionStatus</code>. Once the drift detection operation has completed, use <a>DescribeStackResourceDrifts</a> to return drift information about the stack and its resources.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStackDriftDetectionStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationDescribeStackDriftDetectionStatusOutput`.
 
 @see AWSCloudformationDescribeStackDriftDetectionStatusInput
 @see AWSCloudformationDescribeStackDriftDetectionStatusOutput
 */
- (AWSTask<AWSCloudformationDescribeStackDriftDetectionStatusOutput *> *)describeStackDriftDetectionStatus:(AWSCloudformationDescribeStackDriftDetectionStatusInput *)request;

/**
 <p>Returns information about a stack drift detection operation. A stack drift detection operation detects whether a stack's actual configuration differs, or has <i>drifted</i>, from it's expected configuration, as defined in the stack template and any values specified as template parameters. A stack is considered to have drifted if one or more of its resources have drifted. For more information on stack and resource drift, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting Unregulated Configuration Changes to Stacks and Resources</a>.</p><p>Use <a>DetectStackDrift</a> to initiate a stack drift detection operation. <code>DetectStackDrift</code> returns a <code>StackDriftDetectionId</code> you can use to monitor the progress of the operation using <code>DescribeStackDriftDetectionStatus</code>. Once the drift detection operation has completed, use <a>DescribeStackResourceDrifts</a> to return drift information about the stack and its resources.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStackDriftDetectionStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudformationDescribeStackDriftDetectionStatusInput
 @see AWSCloudformationDescribeStackDriftDetectionStatusOutput
 */
- (void)describeStackDriftDetectionStatus:(AWSCloudformationDescribeStackDriftDetectionStatusInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationDescribeStackDriftDetectionStatusOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns all stack related events for a specified stack in reverse chronological order. For more information about a stack's event history, go to <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/concept-stack.html">Stacks</a> in the AWS CloudFormation User Guide.</p><note><p>You can list events for stacks that have failed to create or have been deleted by specifying the unique stack identifier (stack ID).</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeStackEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationDescribeStackEventsOutput`.
 
 @see AWSCloudformationDescribeStackEventsInput
 @see AWSCloudformationDescribeStackEventsOutput
 */
- (AWSTask<AWSCloudformationDescribeStackEventsOutput *> *)describeStackEvents:(AWSCloudformationDescribeStackEventsInput *)request;

/**
 <p>Returns all stack related events for a specified stack in reverse chronological order. For more information about a stack's event history, go to <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/concept-stack.html">Stacks</a> in the AWS CloudFormation User Guide.</p><note><p>You can list events for stacks that have failed to create or have been deleted by specifying the unique stack identifier (stack ID).</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeStackEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudformationDescribeStackEventsInput
 @see AWSCloudformationDescribeStackEventsOutput
 */
- (void)describeStackEvents:(AWSCloudformationDescribeStackEventsInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationDescribeStackEventsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the stack instance that's associated with the specified stack set, AWS account, and Region.</p><p>For a list of stack instances that are associated with a specific stack set, use <a>ListStackInstances</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStackInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationDescribeStackInstanceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotFound`, `AWSCloudformationErrorStackInstanceNotFound`.
 
 @see AWSCloudformationDescribeStackInstanceInput
 @see AWSCloudformationDescribeStackInstanceOutput
 */
- (AWSTask<AWSCloudformationDescribeStackInstanceOutput *> *)describeStackInstance:(AWSCloudformationDescribeStackInstanceInput *)request;

/**
 <p>Returns the stack instance that's associated with the specified stack set, AWS account, and Region.</p><p>For a list of stack instances that are associated with a specific stack set, use <a>ListStackInstances</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStackInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotFound`, `AWSCloudformationErrorStackInstanceNotFound`.
 
 @see AWSCloudformationDescribeStackInstanceInput
 @see AWSCloudformationDescribeStackInstanceOutput
 */
- (void)describeStackInstance:(AWSCloudformationDescribeStackInstanceInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationDescribeStackInstanceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a description of the specified resource in the specified stack.</p><p>For deleted stacks, DescribeStackResource returns resource information for up to 90 days after the stack has been deleted.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStackResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationDescribeStackResourceOutput`.
 
 @see AWSCloudformationDescribeStackResourceInput
 @see AWSCloudformationDescribeStackResourceOutput
 */
- (AWSTask<AWSCloudformationDescribeStackResourceOutput *> *)describeStackResource:(AWSCloudformationDescribeStackResourceInput *)request;

/**
 <p>Returns a description of the specified resource in the specified stack.</p><p>For deleted stacks, DescribeStackResource returns resource information for up to 90 days after the stack has been deleted.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStackResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudformationDescribeStackResourceInput
 @see AWSCloudformationDescribeStackResourceOutput
 */
- (void)describeStackResource:(AWSCloudformationDescribeStackResourceInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationDescribeStackResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns drift information for the resources that have been checked for drift in the specified stack. This includes actual and expected configuration values for resources where AWS CloudFormation detects configuration drift.</p><p>For a given stack, there will be one <code>StackResourceDrift</code> for each stack resource that has been checked for drift. Resources that have not yet been checked for drift are not included. Resources that do not currently support drift detection are not checked, and so not included. For a list of resources that support drift detection, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html">Resources that Support Drift Detection</a>.</p><p>Use <a>DetectStackResourceDrift</a> to detect drift on individual resources, or <a>DetectStackDrift</a> to detect drift on all supported resources for a given stack.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStackResourceDrifts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationDescribeStackResourceDriftsOutput`.
 
 @see AWSCloudformationDescribeStackResourceDriftsInput
 @see AWSCloudformationDescribeStackResourceDriftsOutput
 */
- (AWSTask<AWSCloudformationDescribeStackResourceDriftsOutput *> *)describeStackResourceDrifts:(AWSCloudformationDescribeStackResourceDriftsInput *)request;

/**
 <p>Returns drift information for the resources that have been checked for drift in the specified stack. This includes actual and expected configuration values for resources where AWS CloudFormation detects configuration drift.</p><p>For a given stack, there will be one <code>StackResourceDrift</code> for each stack resource that has been checked for drift. Resources that have not yet been checked for drift are not included. Resources that do not currently support drift detection are not checked, and so not included. For a list of resources that support drift detection, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html">Resources that Support Drift Detection</a>.</p><p>Use <a>DetectStackResourceDrift</a> to detect drift on individual resources, or <a>DetectStackDrift</a> to detect drift on all supported resources for a given stack.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStackResourceDrifts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudformationDescribeStackResourceDriftsInput
 @see AWSCloudformationDescribeStackResourceDriftsOutput
 */
- (void)describeStackResourceDrifts:(AWSCloudformationDescribeStackResourceDriftsInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationDescribeStackResourceDriftsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns AWS resource descriptions for running and deleted stacks. If <code>StackName</code> is specified, all the associated resources that are part of the stack are returned. If <code>PhysicalResourceId</code> is specified, the associated resources of the stack that the resource belongs to are returned.</p><note><p>Only the first 100 resources will be returned. If your stack has more resources than this, you should use <code>ListStackResources</code> instead.</p></note><p>For deleted stacks, <code>DescribeStackResources</code> returns resource information for up to 90 days after the stack has been deleted.</p><p>You must specify either <code>StackName</code> or <code>PhysicalResourceId</code>, but not both. In addition, you can specify <code>LogicalResourceId</code> to filter the returned result. For more information about resources, the <code>LogicalResourceId</code> and <code>PhysicalResourceId</code>, go to the <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/">AWS CloudFormation User Guide</a>.</p><note><p>A <code>ValidationError</code> is returned if you specify both <code>StackName</code> and <code>PhysicalResourceId</code> in the same request.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeStackResources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationDescribeStackResourcesOutput`.
 
 @see AWSCloudformationDescribeStackResourcesInput
 @see AWSCloudformationDescribeStackResourcesOutput
 */
- (AWSTask<AWSCloudformationDescribeStackResourcesOutput *> *)describeStackResources:(AWSCloudformationDescribeStackResourcesInput *)request;

/**
 <p>Returns AWS resource descriptions for running and deleted stacks. If <code>StackName</code> is specified, all the associated resources that are part of the stack are returned. If <code>PhysicalResourceId</code> is specified, the associated resources of the stack that the resource belongs to are returned.</p><note><p>Only the first 100 resources will be returned. If your stack has more resources than this, you should use <code>ListStackResources</code> instead.</p></note><p>For deleted stacks, <code>DescribeStackResources</code> returns resource information for up to 90 days after the stack has been deleted.</p><p>You must specify either <code>StackName</code> or <code>PhysicalResourceId</code>, but not both. In addition, you can specify <code>LogicalResourceId</code> to filter the returned result. For more information about resources, the <code>LogicalResourceId</code> and <code>PhysicalResourceId</code>, go to the <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/">AWS CloudFormation User Guide</a>.</p><note><p>A <code>ValidationError</code> is returned if you specify both <code>StackName</code> and <code>PhysicalResourceId</code> in the same request.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeStackResources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudformationDescribeStackResourcesInput
 @see AWSCloudformationDescribeStackResourcesOutput
 */
- (void)describeStackResources:(AWSCloudformationDescribeStackResourcesInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationDescribeStackResourcesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the description of the specified stack set. </p>
 
 @param request A container for the necessary parameters to execute the DescribeStackSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationDescribeStackSetOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotFound`.
 
 @see AWSCloudformationDescribeStackSetInput
 @see AWSCloudformationDescribeStackSetOutput
 */
- (AWSTask<AWSCloudformationDescribeStackSetOutput *> *)describeStackSet:(AWSCloudformationDescribeStackSetInput *)request;

/**
 <p>Returns the description of the specified stack set. </p>
 
 @param request A container for the necessary parameters to execute the DescribeStackSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotFound`.
 
 @see AWSCloudformationDescribeStackSetInput
 @see AWSCloudformationDescribeStackSetOutput
 */
- (void)describeStackSet:(AWSCloudformationDescribeStackSetInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationDescribeStackSetOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the description of the specified stack set operation. </p>
 
 @param request A container for the necessary parameters to execute the DescribeStackSetOperation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationDescribeStackSetOperationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotFound`, `AWSCloudformationErrorOperationNotFound`.
 
 @see AWSCloudformationDescribeStackSetOperationInput
 @see AWSCloudformationDescribeStackSetOperationOutput
 */
- (AWSTask<AWSCloudformationDescribeStackSetOperationOutput *> *)describeStackSetOperation:(AWSCloudformationDescribeStackSetOperationInput *)request;

/**
 <p>Returns the description of the specified stack set operation. </p>
 
 @param request A container for the necessary parameters to execute the DescribeStackSetOperation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotFound`, `AWSCloudformationErrorOperationNotFound`.
 
 @see AWSCloudformationDescribeStackSetOperationInput
 @see AWSCloudformationDescribeStackSetOperationOutput
 */
- (void)describeStackSetOperation:(AWSCloudformationDescribeStackSetOperationInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationDescribeStackSetOperationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the description for the specified stack; if no stack name was specified, then it returns the description for all the stacks created.</p><note><p>If the stack does not exist, an <code>AmazonCloudFormationException</code> is returned.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeStacks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationDescribeStacksOutput`.
 
 @see AWSCloudformationDescribeStacksInput
 @see AWSCloudformationDescribeStacksOutput
 */
- (AWSTask<AWSCloudformationDescribeStacksOutput *> *)describeStacks:(AWSCloudformationDescribeStacksInput *)request;

/**
 <p>Returns the description for the specified stack; if no stack name was specified, then it returns the description for all the stacks created.</p><note><p>If the stack does not exist, an <code>AmazonCloudFormationException</code> is returned.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeStacks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudformationDescribeStacksInput
 @see AWSCloudformationDescribeStacksOutput
 */
- (void)describeStacks:(AWSCloudformationDescribeStacksInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationDescribeStacksOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns detailed information about a type that has been registered.</p><p>If you specify a <code>VersionId</code>, <code>DescribeType</code> returns information about that specific type version. Otherwise, it returns information about the default type version.</p>
 
 @param request A container for the necessary parameters to execute the DescribeType service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationDescribeTypeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorCFNRegistry`, `AWSCloudformationErrorTypeNotFound`.
 
 @see AWSCloudformationDescribeTypeInput
 @see AWSCloudformationDescribeTypeOutput
 */
- (AWSTask<AWSCloudformationDescribeTypeOutput *> *)describeType:(AWSCloudformationDescribeTypeInput *)request;

/**
 <p>Returns detailed information about a type that has been registered.</p><p>If you specify a <code>VersionId</code>, <code>DescribeType</code> returns information about that specific type version. Otherwise, it returns information about the default type version.</p>
 
 @param request A container for the necessary parameters to execute the DescribeType service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorCFNRegistry`, `AWSCloudformationErrorTypeNotFound`.
 
 @see AWSCloudformationDescribeTypeInput
 @see AWSCloudformationDescribeTypeOutput
 */
- (void)describeType:(AWSCloudformationDescribeTypeInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationDescribeTypeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a type's registration, including its current status and type and version identifiers.</p><p>When you initiate a registration request using <code><a>RegisterType</a></code>, you can then use <code><a>DescribeTypeRegistration</a></code> to monitor the progress of that registration request.</p><p>Once the registration request has completed, use <code><a>DescribeType</a></code> to return detailed informaiton about a type.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTypeRegistration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationDescribeTypeRegistrationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorCFNRegistry`.
 
 @see AWSCloudformationDescribeTypeRegistrationInput
 @see AWSCloudformationDescribeTypeRegistrationOutput
 */
- (AWSTask<AWSCloudformationDescribeTypeRegistrationOutput *> *)describeTypeRegistration:(AWSCloudformationDescribeTypeRegistrationInput *)request;

/**
 <p>Returns information about a type's registration, including its current status and type and version identifiers.</p><p>When you initiate a registration request using <code><a>RegisterType</a></code>, you can then use <code><a>DescribeTypeRegistration</a></code> to monitor the progress of that registration request.</p><p>Once the registration request has completed, use <code><a>DescribeType</a></code> to return detailed informaiton about a type.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTypeRegistration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorCFNRegistry`.
 
 @see AWSCloudformationDescribeTypeRegistrationInput
 @see AWSCloudformationDescribeTypeRegistrationOutput
 */
- (void)describeTypeRegistration:(AWSCloudformationDescribeTypeRegistrationInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationDescribeTypeRegistrationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detects whether a stack's actual configuration differs, or has <i>drifted</i>, from it's expected configuration, as defined in the stack template and any values specified as template parameters. For each resource in the stack that supports drift detection, AWS CloudFormation compares the actual configuration of the resource with its expected template configuration. Only resource properties explicitly defined in the stack template are checked for drift. A stack is considered to have drifted if one or more of its resources differ from their expected template configurations. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting Unregulated Configuration Changes to Stacks and Resources</a>.</p><p>Use <code>DetectStackDrift</code> to detect drift on all supported resources for a given stack, or <a>DetectStackResourceDrift</a> to detect drift on individual resources.</p><p>For a list of stack resources that currently support drift detection, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html">Resources that Support Drift Detection</a>.</p><p><code>DetectStackDrift</code> can take up to several minutes, depending on the number of resources contained within the stack. Use <a>DescribeStackDriftDetectionStatus</a> to monitor the progress of a detect stack drift operation. Once the drift detection operation has completed, use <a>DescribeStackResourceDrifts</a> to return drift information about the stack and its resources.</p><p>When detecting drift on a stack, AWS CloudFormation does not detect drift on any nested stacks belonging to that stack. Perform <code>DetectStackDrift</code> directly on the nested stack itself.</p>
 
 @param request A container for the necessary parameters to execute the DetectStackDrift service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationDetectStackDriftOutput`.
 
 @see AWSCloudformationDetectStackDriftInput
 @see AWSCloudformationDetectStackDriftOutput
 */
- (AWSTask<AWSCloudformationDetectStackDriftOutput *> *)detectStackDrift:(AWSCloudformationDetectStackDriftInput *)request;

/**
 <p>Detects whether a stack's actual configuration differs, or has <i>drifted</i>, from it's expected configuration, as defined in the stack template and any values specified as template parameters. For each resource in the stack that supports drift detection, AWS CloudFormation compares the actual configuration of the resource with its expected template configuration. Only resource properties explicitly defined in the stack template are checked for drift. A stack is considered to have drifted if one or more of its resources differ from their expected template configurations. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting Unregulated Configuration Changes to Stacks and Resources</a>.</p><p>Use <code>DetectStackDrift</code> to detect drift on all supported resources for a given stack, or <a>DetectStackResourceDrift</a> to detect drift on individual resources.</p><p>For a list of stack resources that currently support drift detection, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html">Resources that Support Drift Detection</a>.</p><p><code>DetectStackDrift</code> can take up to several minutes, depending on the number of resources contained within the stack. Use <a>DescribeStackDriftDetectionStatus</a> to monitor the progress of a detect stack drift operation. Once the drift detection operation has completed, use <a>DescribeStackResourceDrifts</a> to return drift information about the stack and its resources.</p><p>When detecting drift on a stack, AWS CloudFormation does not detect drift on any nested stacks belonging to that stack. Perform <code>DetectStackDrift</code> directly on the nested stack itself.</p>
 
 @param request A container for the necessary parameters to execute the DetectStackDrift service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudformationDetectStackDriftInput
 @see AWSCloudformationDetectStackDriftOutput
 */
- (void)detectStackDrift:(AWSCloudformationDetectStackDriftInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationDetectStackDriftOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about whether a resource's actual configuration differs, or has <i>drifted</i>, from it's expected configuration, as defined in the stack template and any values specified as template parameters. This information includes actual and expected property values for resources in which AWS CloudFormation detects drift. Only resource properties explicitly defined in the stack template are checked for drift. For more information about stack and resource drift, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting Unregulated Configuration Changes to Stacks and Resources</a>.</p><p>Use <code>DetectStackResourceDrift</code> to detect drift on individual resources, or <a>DetectStackDrift</a> to detect drift on all resources in a given stack that support drift detection.</p><p>Resources that do not currently support drift detection cannot be checked. For a list of resources that support drift detection, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html">Resources that Support Drift Detection</a>.</p>
 
 @param request A container for the necessary parameters to execute the DetectStackResourceDrift service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationDetectStackResourceDriftOutput`.
 
 @see AWSCloudformationDetectStackResourceDriftInput
 @see AWSCloudformationDetectStackResourceDriftOutput
 */
- (AWSTask<AWSCloudformationDetectStackResourceDriftOutput *> *)detectStackResourceDrift:(AWSCloudformationDetectStackResourceDriftInput *)request;

/**
 <p>Returns information about whether a resource's actual configuration differs, or has <i>drifted</i>, from it's expected configuration, as defined in the stack template and any values specified as template parameters. This information includes actual and expected property values for resources in which AWS CloudFormation detects drift. Only resource properties explicitly defined in the stack template are checked for drift. For more information about stack and resource drift, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting Unregulated Configuration Changes to Stacks and Resources</a>.</p><p>Use <code>DetectStackResourceDrift</code> to detect drift on individual resources, or <a>DetectStackDrift</a> to detect drift on all resources in a given stack that support drift detection.</p><p>Resources that do not currently support drift detection cannot be checked. For a list of resources that support drift detection, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html">Resources that Support Drift Detection</a>.</p>
 
 @param request A container for the necessary parameters to execute the DetectStackResourceDrift service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudformationDetectStackResourceDriftInput
 @see AWSCloudformationDetectStackResourceDriftOutput
 */
- (void)detectStackResourceDrift:(AWSCloudformationDetectStackResourceDriftInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationDetectStackResourceDriftOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detect drift on a stack set. When CloudFormation performs drift detection on a stack set, it performs drift detection on the stack associated with each stack instance in the stack set. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html">How CloudFormation Performs Drift Detection on a Stack Set</a>.</p><p><code>DetectStackSetDrift</code> returns the <code>OperationId</code> of the stack set drift detection operation. Use this operation id with <code><a>DescribeStackSetOperation</a></code> to monitor the progress of the drift detection operation. The drift detection operation may take some time, depending on the number of stack instances included in the stack set, as well as the number of resources included in each stack.</p><p>Once the operation has completed, use the following actions to return drift information:</p><ul><li><p>Use <code><a>DescribeStackSet</a></code> to return detailed informaiton about the stack set, including detailed information about the last <i>completed</i> drift operation performed on the stack set. (Information about drift operations that are in progress is not included.)</p></li><li><p>Use <code><a>ListStackInstances</a></code> to return a list of stack instances belonging to the stack set, including the drift status and last drift time checked of each instance.</p></li><li><p>Use <code><a>DescribeStackInstance</a></code> to return detailed information about a specific stack instance, including its drift status and last drift time checked.</p></li></ul><p>For more information on performing a drift detection operation on a stack set, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html">Detecting Unmanaged Changes in Stack Sets</a>. </p><p>You can only run a single drift detection operation on a given stack set at one time. </p><p>To stop a drift detection stack set operation, use <code><a>StopStackSetOperation</a></code>.</p>
 
 @param request A container for the necessary parameters to execute the DetectStackSetDrift service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationDetectStackSetDriftOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorInvalidOperation`, `AWSCloudformationErrorOperationInProgress`, `AWSCloudformationErrorStackSetNotFound`.
 
 @see AWSCloudformationDetectStackSetDriftInput
 @see AWSCloudformationDetectStackSetDriftOutput
 */
- (AWSTask<AWSCloudformationDetectStackSetDriftOutput *> *)detectStackSetDrift:(AWSCloudformationDetectStackSetDriftInput *)request;

/**
 <p>Detect drift on a stack set. When CloudFormation performs drift detection on a stack set, it performs drift detection on the stack associated with each stack instance in the stack set. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html">How CloudFormation Performs Drift Detection on a Stack Set</a>.</p><p><code>DetectStackSetDrift</code> returns the <code>OperationId</code> of the stack set drift detection operation. Use this operation id with <code><a>DescribeStackSetOperation</a></code> to monitor the progress of the drift detection operation. The drift detection operation may take some time, depending on the number of stack instances included in the stack set, as well as the number of resources included in each stack.</p><p>Once the operation has completed, use the following actions to return drift information:</p><ul><li><p>Use <code><a>DescribeStackSet</a></code> to return detailed informaiton about the stack set, including detailed information about the last <i>completed</i> drift operation performed on the stack set. (Information about drift operations that are in progress is not included.)</p></li><li><p>Use <code><a>ListStackInstances</a></code> to return a list of stack instances belonging to the stack set, including the drift status and last drift time checked of each instance.</p></li><li><p>Use <code><a>DescribeStackInstance</a></code> to return detailed information about a specific stack instance, including its drift status and last drift time checked.</p></li></ul><p>For more information on performing a drift detection operation on a stack set, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html">Detecting Unmanaged Changes in Stack Sets</a>. </p><p>You can only run a single drift detection operation on a given stack set at one time. </p><p>To stop a drift detection stack set operation, use <code><a>StopStackSetOperation</a></code>.</p>
 
 @param request A container for the necessary parameters to execute the DetectStackSetDrift service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorInvalidOperation`, `AWSCloudformationErrorOperationInProgress`, `AWSCloudformationErrorStackSetNotFound`.
 
 @see AWSCloudformationDetectStackSetDriftInput
 @see AWSCloudformationDetectStackSetDriftOutput
 */
- (void)detectStackSetDrift:(AWSCloudformationDetectStackSetDriftInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationDetectStackSetDriftOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the estimated monthly cost of a template. The return value is an AWS Simple Monthly Calculator URL with a query string that describes the resources required to run the template.</p>
 
 @param request A container for the necessary parameters to execute the EstimateTemplateCost service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationEstimateTemplateCostOutput`.
 
 @see AWSCloudformationEstimateTemplateCostInput
 @see AWSCloudformationEstimateTemplateCostOutput
 */
- (AWSTask<AWSCloudformationEstimateTemplateCostOutput *> *)estimateTemplateCost:(AWSCloudformationEstimateTemplateCostInput *)request;

/**
 <p>Returns the estimated monthly cost of a template. The return value is an AWS Simple Monthly Calculator URL with a query string that describes the resources required to run the template.</p>
 
 @param request A container for the necessary parameters to execute the EstimateTemplateCost service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudformationEstimateTemplateCostInput
 @see AWSCloudformationEstimateTemplateCostOutput
 */
- (void)estimateTemplateCost:(AWSCloudformationEstimateTemplateCostInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationEstimateTemplateCostOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a stack using the input information that was provided when the specified change set was created. After the call successfully completes, AWS CloudFormation starts updating the stack. Use the <a>DescribeStacks</a> action to view the status of the update.</p><p>When you execute a change set, AWS CloudFormation deletes all other change sets associated with the stack because they aren't valid for the updated stack.</p><p>If a stack policy is associated with the stack, AWS CloudFormation enforces the policy during the update. You can't specify a temporary stack policy that overrides the current policy.</p>
 
 @param request A container for the necessary parameters to execute the ExecuteChangeSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationExecuteChangeSetOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorInvalidChangeSetStatus`, `AWSCloudformationErrorChangeSetNotFound`, `AWSCloudformationErrorInsufficientCapabilities`, `AWSCloudformationErrorTokenAlreadyExists`.
 
 @see AWSCloudformationExecuteChangeSetInput
 @see AWSCloudformationExecuteChangeSetOutput
 */
- (AWSTask<AWSCloudformationExecuteChangeSetOutput *> *)executeChangeSet:(AWSCloudformationExecuteChangeSetInput *)request;

/**
 <p>Updates a stack using the input information that was provided when the specified change set was created. After the call successfully completes, AWS CloudFormation starts updating the stack. Use the <a>DescribeStacks</a> action to view the status of the update.</p><p>When you execute a change set, AWS CloudFormation deletes all other change sets associated with the stack because they aren't valid for the updated stack.</p><p>If a stack policy is associated with the stack, AWS CloudFormation enforces the policy during the update. You can't specify a temporary stack policy that overrides the current policy.</p>
 
 @param request A container for the necessary parameters to execute the ExecuteChangeSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorInvalidChangeSetStatus`, `AWSCloudformationErrorChangeSetNotFound`, `AWSCloudformationErrorInsufficientCapabilities`, `AWSCloudformationErrorTokenAlreadyExists`.
 
 @see AWSCloudformationExecuteChangeSetInput
 @see AWSCloudformationExecuteChangeSetOutput
 */
- (void)executeChangeSet:(AWSCloudformationExecuteChangeSetInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationExecuteChangeSetOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the stack policy for a specified stack. If a stack doesn't have a policy, a null value is returned.</p>
 
 @param request A container for the necessary parameters to execute the GetStackPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationGetStackPolicyOutput`.
 
 @see AWSCloudformationGetStackPolicyInput
 @see AWSCloudformationGetStackPolicyOutput
 */
- (AWSTask<AWSCloudformationGetStackPolicyOutput *> *)getStackPolicy:(AWSCloudformationGetStackPolicyInput *)request;

/**
 <p>Returns the stack policy for a specified stack. If a stack doesn't have a policy, a null value is returned.</p>
 
 @param request A container for the necessary parameters to execute the GetStackPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudformationGetStackPolicyInput
 @see AWSCloudformationGetStackPolicyOutput
 */
- (void)getStackPolicy:(AWSCloudformationGetStackPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationGetStackPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the template body for a specified stack. You can get the template for running or deleted stacks.</p><p>For deleted stacks, GetTemplate returns the template for up to 90 days after the stack has been deleted.</p><note><p> If the template does not exist, a <code>ValidationError</code> is returned. </p></note>
 
 @param request A container for the necessary parameters to execute the GetTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationGetTemplateOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorChangeSetNotFound`.
 
 @see AWSCloudformationGetTemplateInput
 @see AWSCloudformationGetTemplateOutput
 */
- (AWSTask<AWSCloudformationGetTemplateOutput *> *)getTemplate:(AWSCloudformationGetTemplateInput *)request;

/**
 <p>Returns the template body for a specified stack. You can get the template for running or deleted stacks.</p><p>For deleted stacks, GetTemplate returns the template for up to 90 days after the stack has been deleted.</p><note><p> If the template does not exist, a <code>ValidationError</code> is returned. </p></note>
 
 @param request A container for the necessary parameters to execute the GetTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorChangeSetNotFound`.
 
 @see AWSCloudformationGetTemplateInput
 @see AWSCloudformationGetTemplateOutput
 */
- (void)getTemplate:(AWSCloudformationGetTemplateInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationGetTemplateOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a new or existing template. The <code>GetTemplateSummary</code> action is useful for viewing parameter information, such as default parameter values and parameter types, before you create or update a stack or stack set.</p><p>You can use the <code>GetTemplateSummary</code> action when you submit a template, or you can get template information for a stack set, or a running or deleted stack.</p><p>For deleted stacks, <code>GetTemplateSummary</code> returns the template information for up to 90 days after the stack has been deleted. If the template does not exist, a <code>ValidationError</code> is returned.</p>
 
 @param request A container for the necessary parameters to execute the GetTemplateSummary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationGetTemplateSummaryOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotFound`.
 
 @see AWSCloudformationGetTemplateSummaryInput
 @see AWSCloudformationGetTemplateSummaryOutput
 */
- (AWSTask<AWSCloudformationGetTemplateSummaryOutput *> *)getTemplateSummary:(AWSCloudformationGetTemplateSummaryInput *)request;

/**
 <p>Returns information about a new or existing template. The <code>GetTemplateSummary</code> action is useful for viewing parameter information, such as default parameter values and parameter types, before you create or update a stack or stack set.</p><p>You can use the <code>GetTemplateSummary</code> action when you submit a template, or you can get template information for a stack set, or a running or deleted stack.</p><p>For deleted stacks, <code>GetTemplateSummary</code> returns the template information for up to 90 days after the stack has been deleted. If the template does not exist, a <code>ValidationError</code> is returned.</p>
 
 @param request A container for the necessary parameters to execute the GetTemplateSummary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotFound`.
 
 @see AWSCloudformationGetTemplateSummaryInput
 @see AWSCloudformationGetTemplateSummaryOutput
 */
- (void)getTemplateSummary:(AWSCloudformationGetTemplateSummaryInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationGetTemplateSummaryOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the ID and status of each active change set for a stack. For example, AWS CloudFormation lists change sets that are in the <code>CREATE_IN_PROGRESS</code> or <code>CREATE_PENDING</code> state.</p>
 
 @param request A container for the necessary parameters to execute the ListChangeSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationListChangeSetsOutput`.
 
 @see AWSCloudformationListChangeSetsInput
 @see AWSCloudformationListChangeSetsOutput
 */
- (AWSTask<AWSCloudformationListChangeSetsOutput *> *)listChangeSets:(AWSCloudformationListChangeSetsInput *)request;

/**
 <p>Returns the ID and status of each active change set for a stack. For example, AWS CloudFormation lists change sets that are in the <code>CREATE_IN_PROGRESS</code> or <code>CREATE_PENDING</code> state.</p>
 
 @param request A container for the necessary parameters to execute the ListChangeSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudformationListChangeSetsInput
 @see AWSCloudformationListChangeSetsOutput
 */
- (void)listChangeSets:(AWSCloudformationListChangeSetsInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationListChangeSetsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all exported output values in the account and Region in which you call this action. Use this action to see the exported output values that you can import into other stacks. To import values, use the <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-importvalue.html"><code>Fn::ImportValue</code></a> function. </p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-exports.html"> AWS CloudFormation Export Stack Output Values</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListExports service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationListExportsOutput`.
 
 @see AWSCloudformationListExportsInput
 @see AWSCloudformationListExportsOutput
 */
- (AWSTask<AWSCloudformationListExportsOutput *> *)listExports:(AWSCloudformationListExportsInput *)request;

/**
 <p>Lists all exported output values in the account and Region in which you call this action. Use this action to see the exported output values that you can import into other stacks. To import values, use the <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-importvalue.html"><code>Fn::ImportValue</code></a> function. </p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-exports.html"> AWS CloudFormation Export Stack Output Values</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListExports service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudformationListExportsInput
 @see AWSCloudformationListExportsOutput
 */
- (void)listExports:(AWSCloudformationListExportsInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationListExportsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all stacks that are importing an exported output value. To modify or remove an exported output value, first use this action to see which stacks are using it. To see the exported output values in your account, see <a>ListExports</a>. </p><p>For more information about importing an exported output value, see the <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-importvalue.html"><code>Fn::ImportValue</code></a> function. </p>
 
 @param request A container for the necessary parameters to execute the ListImports service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationListImportsOutput`.
 
 @see AWSCloudformationListImportsInput
 @see AWSCloudformationListImportsOutput
 */
- (AWSTask<AWSCloudformationListImportsOutput *> *)listImports:(AWSCloudformationListImportsInput *)request;

/**
 <p>Lists all stacks that are importing an exported output value. To modify or remove an exported output value, first use this action to see which stacks are using it. To see the exported output values in your account, see <a>ListExports</a>. </p><p>For more information about importing an exported output value, see the <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-importvalue.html"><code>Fn::ImportValue</code></a> function. </p>
 
 @param request A container for the necessary parameters to execute the ListImports service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudformationListImportsInput
 @see AWSCloudformationListImportsOutput
 */
- (void)listImports:(AWSCloudformationListImportsInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationListImportsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns summary information about stack instances that are associated with the specified stack set. You can filter for stack instances that are associated with a specific AWS account name or Region.</p>
 
 @param request A container for the necessary parameters to execute the ListStackInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationListStackInstancesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotFound`.
 
 @see AWSCloudformationListStackInstancesInput
 @see AWSCloudformationListStackInstancesOutput
 */
- (AWSTask<AWSCloudformationListStackInstancesOutput *> *)listStackInstances:(AWSCloudformationListStackInstancesInput *)request;

/**
 <p>Returns summary information about stack instances that are associated with the specified stack set. You can filter for stack instances that are associated with a specific AWS account name or Region.</p>
 
 @param request A container for the necessary parameters to execute the ListStackInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotFound`.
 
 @see AWSCloudformationListStackInstancesInput
 @see AWSCloudformationListStackInstancesOutput
 */
- (void)listStackInstances:(AWSCloudformationListStackInstancesInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationListStackInstancesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns descriptions of all resources of the specified stack.</p><p>For deleted stacks, ListStackResources returns resource information for up to 90 days after the stack has been deleted.</p>
 
 @param request A container for the necessary parameters to execute the ListStackResources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationListStackResourcesOutput`.
 
 @see AWSCloudformationListStackResourcesInput
 @see AWSCloudformationListStackResourcesOutput
 */
- (AWSTask<AWSCloudformationListStackResourcesOutput *> *)listStackResources:(AWSCloudformationListStackResourcesInput *)request;

/**
 <p>Returns descriptions of all resources of the specified stack.</p><p>For deleted stacks, ListStackResources returns resource information for up to 90 days after the stack has been deleted.</p>
 
 @param request A container for the necessary parameters to execute the ListStackResources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudformationListStackResourcesInput
 @see AWSCloudformationListStackResourcesOutput
 */
- (void)listStackResources:(AWSCloudformationListStackResourcesInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationListStackResourcesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns summary information about the results of a stack set operation. </p>
 
 @param request A container for the necessary parameters to execute the ListStackSetOperationResults service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationListStackSetOperationResultsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotFound`, `AWSCloudformationErrorOperationNotFound`.
 
 @see AWSCloudformationListStackSetOperationResultsInput
 @see AWSCloudformationListStackSetOperationResultsOutput
 */
- (AWSTask<AWSCloudformationListStackSetOperationResultsOutput *> *)listStackSetOperationResults:(AWSCloudformationListStackSetOperationResultsInput *)request;

/**
 <p>Returns summary information about the results of a stack set operation. </p>
 
 @param request A container for the necessary parameters to execute the ListStackSetOperationResults service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotFound`, `AWSCloudformationErrorOperationNotFound`.
 
 @see AWSCloudformationListStackSetOperationResultsInput
 @see AWSCloudformationListStackSetOperationResultsOutput
 */
- (void)listStackSetOperationResults:(AWSCloudformationListStackSetOperationResultsInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationListStackSetOperationResultsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns summary information about operations performed on a stack set. </p>
 
 @param request A container for the necessary parameters to execute the ListStackSetOperations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationListStackSetOperationsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotFound`.
 
 @see AWSCloudformationListStackSetOperationsInput
 @see AWSCloudformationListStackSetOperationsOutput
 */
- (AWSTask<AWSCloudformationListStackSetOperationsOutput *> *)listStackSetOperations:(AWSCloudformationListStackSetOperationsInput *)request;

/**
 <p>Returns summary information about operations performed on a stack set. </p>
 
 @param request A container for the necessary parameters to execute the ListStackSetOperations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotFound`.
 
 @see AWSCloudformationListStackSetOperationsInput
 @see AWSCloudformationListStackSetOperationsOutput
 */
- (void)listStackSetOperations:(AWSCloudformationListStackSetOperationsInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationListStackSetOperationsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns summary information about stack sets that are associated with the user.</p>
 
 @param request A container for the necessary parameters to execute the ListStackSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationListStackSetsOutput`.
 
 @see AWSCloudformationListStackSetsInput
 @see AWSCloudformationListStackSetsOutput
 */
- (AWSTask<AWSCloudformationListStackSetsOutput *> *)listStackSets:(AWSCloudformationListStackSetsInput *)request;

/**
 <p>Returns summary information about stack sets that are associated with the user.</p>
 
 @param request A container for the necessary parameters to execute the ListStackSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudformationListStackSetsInput
 @see AWSCloudformationListStackSetsOutput
 */
- (void)listStackSets:(AWSCloudformationListStackSetsInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationListStackSetsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the summary information for stacks whose status matches the specified StackStatusFilter. Summary information for stacks that have been deleted is kept for 90 days after the stack is deleted. If no StackStatusFilter is specified, summary information for all stacks is returned (including existing stacks and stacks that have been deleted).</p>
 
 @param request A container for the necessary parameters to execute the ListStacks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationListStacksOutput`.
 
 @see AWSCloudformationListStacksInput
 @see AWSCloudformationListStacksOutput
 */
- (AWSTask<AWSCloudformationListStacksOutput *> *)listStacks:(AWSCloudformationListStacksInput *)request;

/**
 <p>Returns the summary information for stacks whose status matches the specified StackStatusFilter. Summary information for stacks that have been deleted is kept for 90 days after the stack is deleted. If no StackStatusFilter is specified, summary information for all stacks is returned (including existing stacks and stacks that have been deleted).</p>
 
 @param request A container for the necessary parameters to execute the ListStacks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudformationListStacksInput
 @see AWSCloudformationListStacksOutput
 */
- (void)listStacks:(AWSCloudformationListStacksInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationListStacksOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of registration tokens for the specified type(s).</p>
 
 @param request A container for the necessary parameters to execute the ListTypeRegistrations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationListTypeRegistrationsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorCFNRegistry`.
 
 @see AWSCloudformationListTypeRegistrationsInput
 @see AWSCloudformationListTypeRegistrationsOutput
 */
- (AWSTask<AWSCloudformationListTypeRegistrationsOutput *> *)listTypeRegistrations:(AWSCloudformationListTypeRegistrationsInput *)request;

/**
 <p>Returns a list of registration tokens for the specified type(s).</p>
 
 @param request A container for the necessary parameters to execute the ListTypeRegistrations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorCFNRegistry`.
 
 @see AWSCloudformationListTypeRegistrationsInput
 @see AWSCloudformationListTypeRegistrationsOutput
 */
- (void)listTypeRegistrations:(AWSCloudformationListTypeRegistrationsInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationListTypeRegistrationsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns summary information about the versions of a type.</p>
 
 @param request A container for the necessary parameters to execute the ListTypeVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationListTypeVersionsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorCFNRegistry`.
 
 @see AWSCloudformationListTypeVersionsInput
 @see AWSCloudformationListTypeVersionsOutput
 */
- (AWSTask<AWSCloudformationListTypeVersionsOutput *> *)listTypeVersions:(AWSCloudformationListTypeVersionsInput *)request;

/**
 <p>Returns summary information about the versions of a type.</p>
 
 @param request A container for the necessary parameters to execute the ListTypeVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorCFNRegistry`.
 
 @see AWSCloudformationListTypeVersionsInput
 @see AWSCloudformationListTypeVersionsOutput
 */
- (void)listTypeVersions:(AWSCloudformationListTypeVersionsInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationListTypeVersionsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns summary information about types that have been registered with CloudFormation.</p>
 
 @param request A container for the necessary parameters to execute the ListTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationListTypesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorCFNRegistry`.
 
 @see AWSCloudformationListTypesInput
 @see AWSCloudformationListTypesOutput
 */
- (AWSTask<AWSCloudformationListTypesOutput *> *)listTypes:(AWSCloudformationListTypesInput *)request;

/**
 <p>Returns summary information about types that have been registered with CloudFormation.</p>
 
 @param request A container for the necessary parameters to execute the ListTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorCFNRegistry`.
 
 @see AWSCloudformationListTypesInput
 @see AWSCloudformationListTypesOutput
 */
- (void)listTypes:(AWSCloudformationListTypesInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationListTypesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Reports progress of a resource handler to CloudFormation.</p><p>Reserved for use by the <a href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html">CloudFormation CLI</a>. Do not use this API in your code.</p>
 
 @param request A container for the necessary parameters to execute the RecordHandlerProgress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationRecordHandlerProgressOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorInvalidStateTransition`, `AWSCloudformationErrorOperationStatusCheckFailed`.
 
 @see AWSCloudformationRecordHandlerProgressInput
 @see AWSCloudformationRecordHandlerProgressOutput
 */
- (AWSTask<AWSCloudformationRecordHandlerProgressOutput *> *)recordHandlerProgress:(AWSCloudformationRecordHandlerProgressInput *)request;

/**
 <p>Reports progress of a resource handler to CloudFormation.</p><p>Reserved for use by the <a href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html">CloudFormation CLI</a>. Do not use this API in your code.</p>
 
 @param request A container for the necessary parameters to execute the RecordHandlerProgress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorInvalidStateTransition`, `AWSCloudformationErrorOperationStatusCheckFailed`.
 
 @see AWSCloudformationRecordHandlerProgressInput
 @see AWSCloudformationRecordHandlerProgressOutput
 */
- (void)recordHandlerProgress:(AWSCloudformationRecordHandlerProgressInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationRecordHandlerProgressOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers a type with the CloudFormation service. Registering a type makes it available for use in CloudFormation templates in your AWS account, and includes:</p><ul><li><p>Validating the resource schema</p></li><li><p>Determining which handlers have been specified for the resource</p></li><li><p>Making the resource type available for use in your account</p></li></ul><p>For more information on how to develop types and ready them for registeration, see <a href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-types.html">Creating Resource Providers</a> in the <i>CloudFormation CLI User Guide</i>.</p><p>You can have a maximum of 50 resource type versions registered at a time. This maximum is per account and per region. Use <a href="AWSCloudFormation/latest/APIReference/API_DeregisterType.html">DeregisterType</a> to deregister specific resource type versions if necessary.</p><p>Once you have initiated a registration request using <code><a>RegisterType</a></code>, you can use <code><a>DescribeTypeRegistration</a></code> to monitor the progress of the registration request.</p>
 
 @param request A container for the necessary parameters to execute the RegisterType service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationRegisterTypeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorCFNRegistry`.
 
 @see AWSCloudformationRegisterTypeInput
 @see AWSCloudformationRegisterTypeOutput
 */
- (AWSTask<AWSCloudformationRegisterTypeOutput *> *)registerType:(AWSCloudformationRegisterTypeInput *)request;

/**
 <p>Registers a type with the CloudFormation service. Registering a type makes it available for use in CloudFormation templates in your AWS account, and includes:</p><ul><li><p>Validating the resource schema</p></li><li><p>Determining which handlers have been specified for the resource</p></li><li><p>Making the resource type available for use in your account</p></li></ul><p>For more information on how to develop types and ready them for registeration, see <a href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-types.html">Creating Resource Providers</a> in the <i>CloudFormation CLI User Guide</i>.</p><p>You can have a maximum of 50 resource type versions registered at a time. This maximum is per account and per region. Use <a href="AWSCloudFormation/latest/APIReference/API_DeregisterType.html">DeregisterType</a> to deregister specific resource type versions if necessary.</p><p>Once you have initiated a registration request using <code><a>RegisterType</a></code>, you can use <code><a>DescribeTypeRegistration</a></code> to monitor the progress of the registration request.</p>
 
 @param request A container for the necessary parameters to execute the RegisterType service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorCFNRegistry`.
 
 @see AWSCloudformationRegisterTypeInput
 @see AWSCloudformationRegisterTypeOutput
 */
- (void)registerType:(AWSCloudformationRegisterTypeInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationRegisterTypeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets a stack policy for a specified stack.</p>
 
 @param request A container for the necessary parameters to execute the SetStackPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSCloudformationSetStackPolicyInput
 */
- (AWSTask *)setStackPolicy:(AWSCloudformationSetStackPolicyInput *)request;

/**
 <p>Sets a stack policy for a specified stack.</p>
 
 @param request A container for the necessary parameters to execute the SetStackPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudformationSetStackPolicyInput
 */
- (void)setStackPolicy:(AWSCloudformationSetStackPolicyInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Specify the default version of a type. The default version of a type will be used in CloudFormation operations.</p>
 
 @param request A container for the necessary parameters to execute the SetTypeDefaultVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationSetTypeDefaultVersionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorCFNRegistry`, `AWSCloudformationErrorTypeNotFound`.
 
 @see AWSCloudformationSetTypeDefaultVersionInput
 @see AWSCloudformationSetTypeDefaultVersionOutput
 */
- (AWSTask<AWSCloudformationSetTypeDefaultVersionOutput *> *)setTypeDefaultVersion:(AWSCloudformationSetTypeDefaultVersionInput *)request;

/**
 <p>Specify the default version of a type. The default version of a type will be used in CloudFormation operations.</p>
 
 @param request A container for the necessary parameters to execute the SetTypeDefaultVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorCFNRegistry`, `AWSCloudformationErrorTypeNotFound`.
 
 @see AWSCloudformationSetTypeDefaultVersionInput
 @see AWSCloudformationSetTypeDefaultVersionOutput
 */
- (void)setTypeDefaultVersion:(AWSCloudformationSetTypeDefaultVersionInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationSetTypeDefaultVersionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sends a signal to the specified resource with a success or failure status. You can use the SignalResource API in conjunction with a creation policy or update policy. AWS CloudFormation doesn't proceed with a stack creation or update until resources receive the required number of signals or the timeout period is exceeded. The SignalResource API is useful in cases where you want to send signals from anywhere other than an Amazon EC2 instance.</p>
 
 @param request A container for the necessary parameters to execute the SignalResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSCloudformationSignalResourceInput
 */
- (AWSTask *)signalResource:(AWSCloudformationSignalResourceInput *)request;

/**
 <p>Sends a signal to the specified resource with a success or failure status. You can use the SignalResource API in conjunction with a creation policy or update policy. AWS CloudFormation doesn't proceed with a stack creation or update until resources receive the required number of signals or the timeout period is exceeded. The SignalResource API is useful in cases where you want to send signals from anywhere other than an Amazon EC2 instance.</p>
 
 @param request A container for the necessary parameters to execute the SignalResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudformationSignalResourceInput
 */
- (void)signalResource:(AWSCloudformationSignalResourceInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Stops an in-progress operation on a stack set and its associated stack instances. </p>
 
 @param request A container for the necessary parameters to execute the StopStackSetOperation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationStopStackSetOperationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotFound`, `AWSCloudformationErrorOperationNotFound`, `AWSCloudformationErrorInvalidOperation`.
 
 @see AWSCloudformationStopStackSetOperationInput
 @see AWSCloudformationStopStackSetOperationOutput
 */
- (AWSTask<AWSCloudformationStopStackSetOperationOutput *> *)stopStackSetOperation:(AWSCloudformationStopStackSetOperationInput *)request;

/**
 <p>Stops an in-progress operation on a stack set and its associated stack instances. </p>
 
 @param request A container for the necessary parameters to execute the StopStackSetOperation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotFound`, `AWSCloudformationErrorOperationNotFound`, `AWSCloudformationErrorInvalidOperation`.
 
 @see AWSCloudformationStopStackSetOperationInput
 @see AWSCloudformationStopStackSetOperationOutput
 */
- (void)stopStackSetOperation:(AWSCloudformationStopStackSetOperationInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationStopStackSetOperationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a stack as specified in the template. After the call completes successfully, the stack update starts. You can check the status of the stack via the <a>DescribeStacks</a> action.</p><p>To get a copy of the template for an existing stack, you can use the <a>GetTemplate</a> action.</p><p>For more information about creating an update template, updating a stack, and monitoring the progress of the update, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks.html">Updating a Stack</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateStack service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationUpdateStackOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorInsufficientCapabilities`, `AWSCloudformationErrorTokenAlreadyExists`.
 
 @see AWSCloudformationUpdateStackInput
 @see AWSCloudformationUpdateStackOutput
 */
- (AWSTask<AWSCloudformationUpdateStackOutput *> *)updateStack:(AWSCloudformationUpdateStackInput *)request;

/**
 <p>Updates a stack as specified in the template. After the call completes successfully, the stack update starts. You can check the status of the stack via the <a>DescribeStacks</a> action.</p><p>To get a copy of the template for an existing stack, you can use the <a>GetTemplate</a> action.</p><p>For more information about creating an update template, updating a stack, and monitoring the progress of the update, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks.html">Updating a Stack</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateStack service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorInsufficientCapabilities`, `AWSCloudformationErrorTokenAlreadyExists`.
 
 @see AWSCloudformationUpdateStackInput
 @see AWSCloudformationUpdateStackOutput
 */
- (void)updateStack:(AWSCloudformationUpdateStackInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationUpdateStackOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the parameter values for stack instances for the specified accounts, within the specified Regions. A stack instance refers to a stack in a specific account and Region. </p><p>You can only update stack instances in Regions and accounts where they already exist; to create additional stack instances, use <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_CreateStackInstances.html">CreateStackInstances</a>. </p><p>During stack set updates, any parameters overridden for a stack instance are not updated, but retain their overridden value.</p><p>You can only update the parameter <i>values</i> that are specified in the stack set; to add or delete a parameter itself, use <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html">UpdateStackSet</a> to update the stack set template. If you add a parameter to a template, before you can override the parameter value specified in the stack set you must first use <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html">UpdateStackSet</a> to update all stack instances with the updated template and parameter value specified in the stack set. Once a stack instance has been updated with the new parameter, you can then override the parameter value using <code>UpdateStackInstances</code>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateStackInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationUpdateStackInstancesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotFound`, `AWSCloudformationErrorStackInstanceNotFound`, `AWSCloudformationErrorOperationInProgress`, `AWSCloudformationErrorOperationIdAlreadyExists`, `AWSCloudformationErrorStaleRequest`, `AWSCloudformationErrorInvalidOperation`.
 
 @see AWSCloudformationUpdateStackInstancesInput
 @see AWSCloudformationUpdateStackInstancesOutput
 */
- (AWSTask<AWSCloudformationUpdateStackInstancesOutput *> *)updateStackInstances:(AWSCloudformationUpdateStackInstancesInput *)request;

/**
 <p>Updates the parameter values for stack instances for the specified accounts, within the specified Regions. A stack instance refers to a stack in a specific account and Region. </p><p>You can only update stack instances in Regions and accounts where they already exist; to create additional stack instances, use <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_CreateStackInstances.html">CreateStackInstances</a>. </p><p>During stack set updates, any parameters overridden for a stack instance are not updated, but retain their overridden value.</p><p>You can only update the parameter <i>values</i> that are specified in the stack set; to add or delete a parameter itself, use <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html">UpdateStackSet</a> to update the stack set template. If you add a parameter to a template, before you can override the parameter value specified in the stack set you must first use <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html">UpdateStackSet</a> to update all stack instances with the updated template and parameter value specified in the stack set. Once a stack instance has been updated with the new parameter, you can then override the parameter value using <code>UpdateStackInstances</code>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateStackInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotFound`, `AWSCloudformationErrorStackInstanceNotFound`, `AWSCloudformationErrorOperationInProgress`, `AWSCloudformationErrorOperationIdAlreadyExists`, `AWSCloudformationErrorStaleRequest`, `AWSCloudformationErrorInvalidOperation`.
 
 @see AWSCloudformationUpdateStackInstancesInput
 @see AWSCloudformationUpdateStackInstancesOutput
 */
- (void)updateStackInstances:(AWSCloudformationUpdateStackInstancesInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationUpdateStackInstancesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the stack set, and associated stack instances in the specified accounts and Regions.</p><p>Even if the stack set operation created by updating the stack set fails (completely or partially, below or above a specified failure tolerance), the stack set is updated with your changes. Subsequent <a>CreateStackInstances</a> calls on the specified stack set use the updated stack set.</p>
 
 @param request A container for the necessary parameters to execute the UpdateStackSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationUpdateStackSetOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotFound`, `AWSCloudformationErrorOperationInProgress`, `AWSCloudformationErrorOperationIdAlreadyExists`, `AWSCloudformationErrorStaleRequest`, `AWSCloudformationErrorInvalidOperation`, `AWSCloudformationErrorStackInstanceNotFound`.
 
 @see AWSCloudformationUpdateStackSetInput
 @see AWSCloudformationUpdateStackSetOutput
 */
- (AWSTask<AWSCloudformationUpdateStackSetOutput *> *)updateStackSet:(AWSCloudformationUpdateStackSetInput *)request;

/**
 <p>Updates the stack set, and associated stack instances in the specified accounts and Regions.</p><p>Even if the stack set operation created by updating the stack set fails (completely or partially, below or above a specified failure tolerance), the stack set is updated with your changes. Subsequent <a>CreateStackInstances</a> calls on the specified stack set use the updated stack set.</p>
 
 @param request A container for the necessary parameters to execute the UpdateStackSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudformationErrorDomain` domain and the following error code: `AWSCloudformationErrorStackSetNotFound`, `AWSCloudformationErrorOperationInProgress`, `AWSCloudformationErrorOperationIdAlreadyExists`, `AWSCloudformationErrorStaleRequest`, `AWSCloudformationErrorInvalidOperation`, `AWSCloudformationErrorStackInstanceNotFound`.
 
 @see AWSCloudformationUpdateStackSetInput
 @see AWSCloudformationUpdateStackSetOutput
 */
- (void)updateStackSet:(AWSCloudformationUpdateStackSetInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationUpdateStackSetOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates termination protection for the specified stack. If a user attempts to delete a stack with termination protection enabled, the operation fails and the stack remains unchanged. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html">Protecting a Stack From Being Deleted</a> in the <i>AWS CloudFormation User Guide</i>.</p><p> For <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html">nested stacks</a>, termination protection is set on the root stack and cannot be changed directly on the nested stack.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTerminationProtection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationUpdateTerminationProtectionOutput`.
 
 @see AWSCloudformationUpdateTerminationProtectionInput
 @see AWSCloudformationUpdateTerminationProtectionOutput
 */
- (AWSTask<AWSCloudformationUpdateTerminationProtectionOutput *> *)updateTerminationProtection:(AWSCloudformationUpdateTerminationProtectionInput *)request;

/**
 <p>Updates termination protection for the specified stack. If a user attempts to delete a stack with termination protection enabled, the operation fails and the stack remains unchanged. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html">Protecting a Stack From Being Deleted</a> in the <i>AWS CloudFormation User Guide</i>.</p><p> For <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html">nested stacks</a>, termination protection is set on the root stack and cannot be changed directly on the nested stack.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTerminationProtection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudformationUpdateTerminationProtectionInput
 @see AWSCloudformationUpdateTerminationProtectionOutput
 */
- (void)updateTerminationProtection:(AWSCloudformationUpdateTerminationProtectionInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationUpdateTerminationProtectionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Validates a specified template. AWS CloudFormation first checks if the template is valid JSON. If it isn't, AWS CloudFormation checks if the template is valid YAML. If both these checks fail, AWS CloudFormation returns a template validation error.</p>
 
 @param request A container for the necessary parameters to execute the ValidateTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudformationValidateTemplateOutput`.
 
 @see AWSCloudformationValidateTemplateInput
 @see AWSCloudformationValidateTemplateOutput
 */
- (AWSTask<AWSCloudformationValidateTemplateOutput *> *)validateTemplate:(AWSCloudformationValidateTemplateInput *)request;

/**
 <p>Validates a specified template. AWS CloudFormation first checks if the template is valid JSON. If it isn't, AWS CloudFormation checks if the template is valid YAML. If both these checks fail, AWS CloudFormation returns a template validation error.</p>
 
 @param request A container for the necessary parameters to execute the ValidateTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudformationValidateTemplateInput
 @see AWSCloudformationValidateTemplateOutput
 */
- (void)validateTemplate:(AWSCloudformationValidateTemplateInput *)request completionHandler:(void (^ _Nullable)(AWSCloudformationValidateTemplateOutput * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
