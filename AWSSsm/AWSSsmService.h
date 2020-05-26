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
#import "AWSSsmModel.h"
#import "AWSSsmResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSSsm
FOUNDATION_EXPORT NSString *const AWSSsmSDKVersion;

/**
 <fullname>AWS Systems Manager</fullname><p>AWS Systems Manager is a collection of capabilities that helps you automate management tasks such as collecting system inventory, applying operating system (OS) patches, automating the creation of Amazon Machine Images (AMIs), and configuring operating systems (OSs) and applications at scale. Systems Manager lets you remotely and securely manage the configuration of your managed instances. A <i>managed instance</i> is any Amazon Elastic Compute Cloud instance (EC2 instance), or any on-premises server or virtual machine (VM) in your hybrid environment that has been configured for Systems Manager.</p><p>This reference is intended to be used with the <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/">AWS Systems Manager User Guide</a>.</p><p>To get started, verify prerequisites and configure managed instances. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-setting-up.html">Setting up AWS Systems Manager</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>For information about other API actions you can perform on EC2 instances, see the <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/">Amazon EC2 API Reference</a>. For information about how to use a Query API, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/making-api-requests.html">Making API requests</a>. </p>
 */
@interface AWSSsm : AWSService

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

     let Ssm = AWSSsm.default()

 *Objective-C*

     AWSSsm *Ssm = [AWSSsm defaultSsm];

 @return The default service client.
 */
+ (instancetype)defaultSsm;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSsm.register(with: configuration!, forKey: "USWest2Ssm")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSsm registerSsmWithConfiguration:configuration forKey:@"USWest2Ssm"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Ssm = AWSSsm(forKey: "USWest2Ssm")

 *Objective-C*

     AWSSsm *Ssm = [AWSSsm SsmForKey:@"USWest2Ssm"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerSsmWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerSsmWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSsm.register(with: configuration!, forKey: "USWest2Ssm")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSsm registerSsmWithConfiguration:configuration forKey:@"USWest2Ssm"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Ssm = AWSSsm(forKey: "USWest2Ssm")

 *Objective-C*

     AWSSsm *Ssm = [AWSSsm SsmForKey:@"USWest2Ssm"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)SsmForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeSsmForKey:(NSString *)key;

/**
 <p>Adds or overwrites one or more tags for the specified resource. Tags are metadata that you can assign to your documents, managed instances, maintenance windows, Parameter Store parameters, and patch baselines. Tags enable you to categorize your resources in different ways, for example, by purpose, owner, or environment. Each tag consists of a key and an optional value, both of which you define. For example, you could define a set of tags for your account's managed instances that helps you track each instance's owner and stack level. For example: Key=Owner and Value=DbAdmin, SysAdmin, or Dev. Or Key=Stack and Value=Production, Pre-Production, or Test.</p><p>Each resource can have a maximum of 50 tags. </p><p>We recommend that you devise a set of tag keys that meets your needs for each resource type. Using a consistent set of tag keys makes it easier for you to manage your resources. You can search and filter the resources based on the tags you add. Tags don't have any semantic meaning to and are interpreted strictly as a string of characters. </p><p>For more information about using tags with EC2 instances, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging your Amazon EC2 resources</a> in the <i>Amazon EC2 User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AddTagsToResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmAddTagsToResourceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidResourceType`, `AWSSsmErrorInvalidResourceId`, `AWSSsmErrorInternalServer`, `AWSSsmErrorTooManyTags`, `AWSSsmErrorTooManyUpdates`.
 
 @see AWSSsmAddTagsToResourceRequest
 @see AWSSsmAddTagsToResourceResult
 */
- (AWSTask<AWSSsmAddTagsToResourceResult *> *)addTagsToResource:(AWSSsmAddTagsToResourceRequest *)request;

/**
 <p>Adds or overwrites one or more tags for the specified resource. Tags are metadata that you can assign to your documents, managed instances, maintenance windows, Parameter Store parameters, and patch baselines. Tags enable you to categorize your resources in different ways, for example, by purpose, owner, or environment. Each tag consists of a key and an optional value, both of which you define. For example, you could define a set of tags for your account's managed instances that helps you track each instance's owner and stack level. For example: Key=Owner and Value=DbAdmin, SysAdmin, or Dev. Or Key=Stack and Value=Production, Pre-Production, or Test.</p><p>Each resource can have a maximum of 50 tags. </p><p>We recommend that you devise a set of tag keys that meets your needs for each resource type. Using a consistent set of tag keys makes it easier for you to manage your resources. You can search and filter the resources based on the tags you add. Tags don't have any semantic meaning to and are interpreted strictly as a string of characters. </p><p>For more information about using tags with EC2 instances, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging your Amazon EC2 resources</a> in the <i>Amazon EC2 User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AddTagsToResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidResourceType`, `AWSSsmErrorInvalidResourceId`, `AWSSsmErrorInternalServer`, `AWSSsmErrorTooManyTags`, `AWSSsmErrorTooManyUpdates`.
 
 @see AWSSsmAddTagsToResourceRequest
 @see AWSSsmAddTagsToResourceResult
 */
- (void)addTagsToResource:(AWSSsmAddTagsToResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmAddTagsToResourceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attempts to cancel the command specified by the Command ID. There is no guarantee that the command will be terminated and the underlying process stopped.</p>
 
 @param request A container for the necessary parameters to execute the CancelCommand service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmCancelCommandResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidCommandId`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorDuplicateInstanceId`.
 
 @see AWSSsmCancelCommandRequest
 @see AWSSsmCancelCommandResult
 */
- (AWSTask<AWSSsmCancelCommandResult *> *)cancelCommand:(AWSSsmCancelCommandRequest *)request;

/**
 <p>Attempts to cancel the command specified by the Command ID. There is no guarantee that the command will be terminated and the underlying process stopped.</p>
 
 @param request A container for the necessary parameters to execute the CancelCommand service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidCommandId`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorDuplicateInstanceId`.
 
 @see AWSSsmCancelCommandRequest
 @see AWSSsmCancelCommandResult
 */
- (void)cancelCommand:(AWSSsmCancelCommandRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmCancelCommandResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops a maintenance window execution that is already in progress and cancels any tasks in the window that have not already starting running. (Tasks already in progress will continue to completion.)</p>
 
 @param request A container for the necessary parameters to execute the CancelMaintenanceWindowExecution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmCancelMaintenanceWindowExecutionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorDoesNotExist`.
 
 @see AWSSsmCancelMaintenanceWindowExecutionRequest
 @see AWSSsmCancelMaintenanceWindowExecutionResult
 */
- (AWSTask<AWSSsmCancelMaintenanceWindowExecutionResult *> *)cancelMaintenanceWindowExecution:(AWSSsmCancelMaintenanceWindowExecutionRequest *)request;

/**
 <p>Stops a maintenance window execution that is already in progress and cancels any tasks in the window that have not already starting running. (Tasks already in progress will continue to completion.)</p>
 
 @param request A container for the necessary parameters to execute the CancelMaintenanceWindowExecution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorDoesNotExist`.
 
 @see AWSSsmCancelMaintenanceWindowExecutionRequest
 @see AWSSsmCancelMaintenanceWindowExecutionResult
 */
- (void)cancelMaintenanceWindowExecution:(AWSSsmCancelMaintenanceWindowExecutionRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmCancelMaintenanceWindowExecutionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Generates an activation code and activation ID you can use to register your on-premises server or virtual machine (VM) with Systems Manager. Registering these machines with Systems Manager makes it possible to manage them using Systems Manager capabilities. You use the activation code and ID when installing SSM Agent on machines in your hybrid environment. For more information about requirements for managing on-premises instances and VMs using Systems Manager, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-managedinstances.html">Setting up AWS Systems Manager for hybrid environments</a> in the <i>AWS Systems Manager User Guide</i>. </p><note><p>On-premises servers or VMs that are registered with Systems Manager and EC2 instances that you manage with Systems Manager are all called <i>managed instances</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateActivation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmCreateActivationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmCreateActivationRequest
 @see AWSSsmCreateActivationResult
 */
- (AWSTask<AWSSsmCreateActivationResult *> *)createActivation:(AWSSsmCreateActivationRequest *)request;

/**
 <p>Generates an activation code and activation ID you can use to register your on-premises server or virtual machine (VM) with Systems Manager. Registering these machines with Systems Manager makes it possible to manage them using Systems Manager capabilities. You use the activation code and ID when installing SSM Agent on machines in your hybrid environment. For more information about requirements for managing on-premises instances and VMs using Systems Manager, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-managedinstances.html">Setting up AWS Systems Manager for hybrid environments</a> in the <i>AWS Systems Manager User Guide</i>. </p><note><p>On-premises servers or VMs that are registered with Systems Manager and EC2 instances that you manage with Systems Manager are all called <i>managed instances</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateActivation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmCreateActivationRequest
 @see AWSSsmCreateActivationResult
 */
- (void)createActivation:(AWSSsmCreateActivationRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmCreateActivationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates the specified Systems Manager document with the specified instances or targets.</p><p>When you associate a document with one or more instances, SSM Agent running on the instance processes the document and configures the instance as specified. If you associate a document with an instance that already has an associated document, the system returns the <code>AssociationAlreadyExists</code> exception.</p>
 
 @param request A container for the necessary parameters to execute the CreateAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmCreateAssociationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorAssociationAlreadyExists`, `AWSSsmErrorAssociationLimitExceeded`, `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidDocumentVersion`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorUnsupportedPlatformType`, `AWSSsmErrorInvalidOutputLocation`, `AWSSsmErrorInvalidParameters`, `AWSSsmErrorInvalidTarget`, `AWSSsmErrorInvalidSchedule`.
 
 @see AWSSsmCreateAssociationRequest
 @see AWSSsmCreateAssociationResult
 */
- (AWSTask<AWSSsmCreateAssociationResult *> *)createAssociation:(AWSSsmCreateAssociationRequest *)request;

/**
 <p>Associates the specified Systems Manager document with the specified instances or targets.</p><p>When you associate a document with one or more instances, SSM Agent running on the instance processes the document and configures the instance as specified. If you associate a document with an instance that already has an associated document, the system returns the <code>AssociationAlreadyExists</code> exception.</p>
 
 @param request A container for the necessary parameters to execute the CreateAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorAssociationAlreadyExists`, `AWSSsmErrorAssociationLimitExceeded`, `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidDocumentVersion`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorUnsupportedPlatformType`, `AWSSsmErrorInvalidOutputLocation`, `AWSSsmErrorInvalidParameters`, `AWSSsmErrorInvalidTarget`, `AWSSsmErrorInvalidSchedule`.
 
 @see AWSSsmCreateAssociationRequest
 @see AWSSsmCreateAssociationResult
 */
- (void)createAssociation:(AWSSsmCreateAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmCreateAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates the specified Systems Manager document with the specified instances or targets.</p><p>When you associate a document with one or more instances using instance IDs or tags, SSM Agent running on the instance processes the document and configures the instance as specified.</p><p>If you associate a document with an instance that already has an associated document, the system returns the AssociationAlreadyExists exception.</p>
 
 @param request A container for the necessary parameters to execute the CreateAssociationBatch service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmCreateAssociationBatchResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidDocumentVersion`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInvalidParameters`, `AWSSsmErrorDuplicateInstanceId`, `AWSSsmErrorAssociationLimitExceeded`, `AWSSsmErrorUnsupportedPlatformType`, `AWSSsmErrorInvalidOutputLocation`, `AWSSsmErrorInvalidTarget`, `AWSSsmErrorInvalidSchedule`.
 
 @see AWSSsmCreateAssociationBatchRequest
 @see AWSSsmCreateAssociationBatchResult
 */
- (AWSTask<AWSSsmCreateAssociationBatchResult *> *)createAssociationBatch:(AWSSsmCreateAssociationBatchRequest *)request;

/**
 <p>Associates the specified Systems Manager document with the specified instances or targets.</p><p>When you associate a document with one or more instances using instance IDs or tags, SSM Agent running on the instance processes the document and configures the instance as specified.</p><p>If you associate a document with an instance that already has an associated document, the system returns the AssociationAlreadyExists exception.</p>
 
 @param request A container for the necessary parameters to execute the CreateAssociationBatch service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidDocumentVersion`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInvalidParameters`, `AWSSsmErrorDuplicateInstanceId`, `AWSSsmErrorAssociationLimitExceeded`, `AWSSsmErrorUnsupportedPlatformType`, `AWSSsmErrorInvalidOutputLocation`, `AWSSsmErrorInvalidTarget`, `AWSSsmErrorInvalidSchedule`.
 
 @see AWSSsmCreateAssociationBatchRequest
 @see AWSSsmCreateAssociationBatchResult
 */
- (void)createAssociationBatch:(AWSSsmCreateAssociationBatchRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmCreateAssociationBatchResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Systems Manager (SSM) document. An SSM document defines the actions that Systems Manager performs on your managed instances. For more information about SSM documents, including information about supported schemas, features, and syntax, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-ssm-docs.html">AWS Systems Manager Documents</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDocument service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmCreateDocumentResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDocumentAlreadyExists`, `AWSSsmErrorMaxDocumentSizeExceeded`, `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDocumentContent`, `AWSSsmErrorDocumentLimitExceeded`, `AWSSsmErrorInvalidDocumentSchemaVersion`.
 
 @see AWSSsmCreateDocumentRequest
 @see AWSSsmCreateDocumentResult
 */
- (AWSTask<AWSSsmCreateDocumentResult *> *)createDocument:(AWSSsmCreateDocumentRequest *)request;

/**
 <p>Creates a Systems Manager (SSM) document. An SSM document defines the actions that Systems Manager performs on your managed instances. For more information about SSM documents, including information about supported schemas, features, and syntax, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-ssm-docs.html">AWS Systems Manager Documents</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDocument service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDocumentAlreadyExists`, `AWSSsmErrorMaxDocumentSizeExceeded`, `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDocumentContent`, `AWSSsmErrorDocumentLimitExceeded`, `AWSSsmErrorInvalidDocumentSchemaVersion`.
 
 @see AWSSsmCreateDocumentRequest
 @see AWSSsmCreateDocumentResult
 */
- (void)createDocument:(AWSSsmCreateDocumentRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmCreateDocumentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new maintenance window.</p><note><p>The value you specify for <code>Duration</code> determines the specific end time for the maintenance window based on the time it begins. No maintenance window tasks are permitted to start after the resulting endtime minus the number of hours you specify for <code>Cutoff</code>. For example, if the maintenance window starts at 3 PM, the duration is three hours, and the value you specify for <code>Cutoff</code> is one hour, no maintenance window tasks can start after 5 PM.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateMaintenanceWindow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmCreateMaintenanceWindowResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorIdempotentParameterMismatch`, `AWSSsmErrorResourceLimitExceeded`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmCreateMaintenanceWindowRequest
 @see AWSSsmCreateMaintenanceWindowResult
 */
- (AWSTask<AWSSsmCreateMaintenanceWindowResult *> *)createMaintenanceWindow:(AWSSsmCreateMaintenanceWindowRequest *)request;

/**
 <p>Creates a new maintenance window.</p><note><p>The value you specify for <code>Duration</code> determines the specific end time for the maintenance window based on the time it begins. No maintenance window tasks are permitted to start after the resulting endtime minus the number of hours you specify for <code>Cutoff</code>. For example, if the maintenance window starts at 3 PM, the duration is three hours, and the value you specify for <code>Cutoff</code> is one hour, no maintenance window tasks can start after 5 PM.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateMaintenanceWindow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorIdempotentParameterMismatch`, `AWSSsmErrorResourceLimitExceeded`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmCreateMaintenanceWindowRequest
 @see AWSSsmCreateMaintenanceWindowResult
 */
- (void)createMaintenanceWindow:(AWSSsmCreateMaintenanceWindowRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmCreateMaintenanceWindowResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new OpsItem. You must have permission in AWS Identity and Access Management (IAM) to create a new OpsItem. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the CreateOpsItem service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmCreateOpsItemResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorOpsItemAlreadyExists`, `AWSSsmErrorOpsItemLimitExceeded`, `AWSSsmErrorOpsItemInvalidParameter`.
 
 @see AWSSsmCreateOpsItemRequest
 @see AWSSsmCreateOpsItemResponse
 */
- (AWSTask<AWSSsmCreateOpsItemResponse *> *)createOpsItem:(AWSSsmCreateOpsItemRequest *)request;

/**
 <p>Creates a new OpsItem. You must have permission in AWS Identity and Access Management (IAM) to create a new OpsItem. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the CreateOpsItem service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorOpsItemAlreadyExists`, `AWSSsmErrorOpsItemLimitExceeded`, `AWSSsmErrorOpsItemInvalidParameter`.
 
 @see AWSSsmCreateOpsItemRequest
 @see AWSSsmCreateOpsItemResponse
 */
- (void)createOpsItem:(AWSSsmCreateOpsItemRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmCreateOpsItemResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a patch baseline.</p><note><p>For information about valid key and value pairs in <code>PatchFilters</code> for each supported operating system type, see <a href="http://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html">PatchFilter</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreatePatchBaseline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmCreatePatchBaselineResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorIdempotentParameterMismatch`, `AWSSsmErrorResourceLimitExceeded`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmCreatePatchBaselineRequest
 @see AWSSsmCreatePatchBaselineResult
 */
- (AWSTask<AWSSsmCreatePatchBaselineResult *> *)createPatchBaseline:(AWSSsmCreatePatchBaselineRequest *)request;

/**
 <p>Creates a patch baseline.</p><note><p>For information about valid key and value pairs in <code>PatchFilters</code> for each supported operating system type, see <a href="http://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html">PatchFilter</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreatePatchBaseline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorIdempotentParameterMismatch`, `AWSSsmErrorResourceLimitExceeded`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmCreatePatchBaselineRequest
 @see AWSSsmCreatePatchBaselineResult
 */
- (void)createPatchBaseline:(AWSSsmCreatePatchBaselineRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmCreatePatchBaselineResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>A resource data sync helps you view data from multiple sources in a single location. Systems Manager offers two types of resource data sync: <code>SyncToDestination</code> and <code>SyncFromSource</code>.</p><p>You can configure Systems Manager Inventory to use the <code>SyncToDestination</code> type to synchronize Inventory data from multiple AWS Regions to a single S3 bucket. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-datasync.html">Configuring Resource Data Sync for Inventory</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>You can configure Systems Manager Explorer to use the <code>SyncFromSource</code> type to synchronize operational work items (OpsItems) and operational data (OpsData) from multiple AWS Regions to a single S3 bucket. This type can synchronize OpsItems and OpsData from multiple AWS accounts and Regions or <code>EntireOrganization</code> by using AWS Organizations. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/Explorer-resource-data-sync.html">Setting up Systems Manager Explorer to display data from multiple accounts and Regions</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>A resource data sync is an asynchronous operation that returns immediately. After a successful initial sync is completed, the system continuously syncs data. To check the status of a sync, use the <a>ListResourceDataSync</a>.</p><note><p>By default, data is not encrypted in Amazon S3. We strongly recommend that you enable encryption in Amazon S3 to ensure secure data storage. We also recommend that you secure access to the Amazon S3 bucket by creating a restrictive bucket policy. </p></note>
 
 @param request A container for the necessary parameters to execute the CreateResourceDataSync service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmCreateResourceDataSyncResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorResourceDataSyncCountExceeded`, `AWSSsmErrorResourceDataSyncAlreadyExists`, `AWSSsmErrorResourceDataSyncInvalidConfiguration`.
 
 @see AWSSsmCreateResourceDataSyncRequest
 @see AWSSsmCreateResourceDataSyncResult
 */
- (AWSTask<AWSSsmCreateResourceDataSyncResult *> *)createResourceDataSync:(AWSSsmCreateResourceDataSyncRequest *)request;

/**
 <p>A resource data sync helps you view data from multiple sources in a single location. Systems Manager offers two types of resource data sync: <code>SyncToDestination</code> and <code>SyncFromSource</code>.</p><p>You can configure Systems Manager Inventory to use the <code>SyncToDestination</code> type to synchronize Inventory data from multiple AWS Regions to a single S3 bucket. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-datasync.html">Configuring Resource Data Sync for Inventory</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>You can configure Systems Manager Explorer to use the <code>SyncFromSource</code> type to synchronize operational work items (OpsItems) and operational data (OpsData) from multiple AWS Regions to a single S3 bucket. This type can synchronize OpsItems and OpsData from multiple AWS accounts and Regions or <code>EntireOrganization</code> by using AWS Organizations. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/Explorer-resource-data-sync.html">Setting up Systems Manager Explorer to display data from multiple accounts and Regions</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>A resource data sync is an asynchronous operation that returns immediately. After a successful initial sync is completed, the system continuously syncs data. To check the status of a sync, use the <a>ListResourceDataSync</a>.</p><note><p>By default, data is not encrypted in Amazon S3. We strongly recommend that you enable encryption in Amazon S3 to ensure secure data storage. We also recommend that you secure access to the Amazon S3 bucket by creating a restrictive bucket policy. </p></note>
 
 @param request A container for the necessary parameters to execute the CreateResourceDataSync service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorResourceDataSyncCountExceeded`, `AWSSsmErrorResourceDataSyncAlreadyExists`, `AWSSsmErrorResourceDataSyncInvalidConfiguration`.
 
 @see AWSSsmCreateResourceDataSyncRequest
 @see AWSSsmCreateResourceDataSyncResult
 */
- (void)createResourceDataSync:(AWSSsmCreateResourceDataSyncRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmCreateResourceDataSyncResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an activation. You are not required to delete an activation. If you delete an activation, you can no longer use it to register additional managed instances. Deleting an activation does not de-register managed instances. You must manually de-register managed instances.</p>
 
 @param request A container for the necessary parameters to execute the DeleteActivation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDeleteActivationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidActivationId`, `AWSSsmErrorInvalidActivation`, `AWSSsmErrorInternalServer`, `AWSSsmErrorTooManyUpdates`.
 
 @see AWSSsmDeleteActivationRequest
 @see AWSSsmDeleteActivationResult
 */
- (AWSTask<AWSSsmDeleteActivationResult *> *)deleteActivation:(AWSSsmDeleteActivationRequest *)request;

/**
 <p>Deletes an activation. You are not required to delete an activation. If you delete an activation, you can no longer use it to register additional managed instances. Deleting an activation does not de-register managed instances. You must manually de-register managed instances.</p>
 
 @param request A container for the necessary parameters to execute the DeleteActivation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidActivationId`, `AWSSsmErrorInvalidActivation`, `AWSSsmErrorInternalServer`, `AWSSsmErrorTooManyUpdates`.
 
 @see AWSSsmDeleteActivationRequest
 @see AWSSsmDeleteActivationResult
 */
- (void)deleteActivation:(AWSSsmDeleteActivationRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDeleteActivationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates the specified Systems Manager document from the specified instance.</p><p>When you disassociate a document from an instance, it does not change the configuration of the instance. To change the configuration state of an instance after you disassociate a document, you must create a new document with the desired configuration and associate it with the instance.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDeleteAssociationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorAssociationDoesNotExist`, `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorTooManyUpdates`.
 
 @see AWSSsmDeleteAssociationRequest
 @see AWSSsmDeleteAssociationResult
 */
- (AWSTask<AWSSsmDeleteAssociationResult *> *)deleteAssociation:(AWSSsmDeleteAssociationRequest *)request;

/**
 <p>Disassociates the specified Systems Manager document from the specified instance.</p><p>When you disassociate a document from an instance, it does not change the configuration of the instance. To change the configuration state of an instance after you disassociate a document, you must create a new document with the desired configuration and associate it with the instance.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorAssociationDoesNotExist`, `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorTooManyUpdates`.
 
 @see AWSSsmDeleteAssociationRequest
 @see AWSSsmDeleteAssociationResult
 */
- (void)deleteAssociation:(AWSSsmDeleteAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDeleteAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the Systems Manager document and all instance associations to the document.</p><p>Before you delete the document, we recommend that you use <a>DeleteAssociation</a> to disassociate all instances that are associated with the document.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDocument service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDeleteDocumentResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidDocumentOperation`, `AWSSsmErrorAssociatedInstances`.
 
 @see AWSSsmDeleteDocumentRequest
 @see AWSSsmDeleteDocumentResult
 */
- (AWSTask<AWSSsmDeleteDocumentResult *> *)deleteDocument:(AWSSsmDeleteDocumentRequest *)request;

/**
 <p>Deletes the Systems Manager document and all instance associations to the document.</p><p>Before you delete the document, we recommend that you use <a>DeleteAssociation</a> to disassociate all instances that are associated with the document.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDocument service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidDocumentOperation`, `AWSSsmErrorAssociatedInstances`.
 
 @see AWSSsmDeleteDocumentRequest
 @see AWSSsmDeleteDocumentResult
 */
- (void)deleteDocument:(AWSSsmDeleteDocumentRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDeleteDocumentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Delete a custom inventory type, or the data associated with a custom Inventory type. Deleting a custom inventory type is also referred to as deleting a custom inventory schema.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInventory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDeleteInventoryResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidTypeName`, `AWSSsmErrorInvalidOption`, `AWSSsmErrorInvalidDeleteInventoryParameters`, `AWSSsmErrorInvalidInventoryRequest`.
 
 @see AWSSsmDeleteInventoryRequest
 @see AWSSsmDeleteInventoryResult
 */
- (AWSTask<AWSSsmDeleteInventoryResult *> *)deleteInventory:(AWSSsmDeleteInventoryRequest *)request;

/**
 <p>Delete a custom inventory type, or the data associated with a custom Inventory type. Deleting a custom inventory type is also referred to as deleting a custom inventory schema.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInventory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidTypeName`, `AWSSsmErrorInvalidOption`, `AWSSsmErrorInvalidDeleteInventoryParameters`, `AWSSsmErrorInvalidInventoryRequest`.
 
 @see AWSSsmDeleteInventoryRequest
 @see AWSSsmDeleteInventoryResult
 */
- (void)deleteInventory:(AWSSsmDeleteInventoryRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDeleteInventoryResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMaintenanceWindow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDeleteMaintenanceWindowResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDeleteMaintenanceWindowRequest
 @see AWSSsmDeleteMaintenanceWindowResult
 */
- (AWSTask<AWSSsmDeleteMaintenanceWindowResult *> *)deleteMaintenanceWindow:(AWSSsmDeleteMaintenanceWindowRequest *)request;

/**
 <p>Deletes a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMaintenanceWindow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDeleteMaintenanceWindowRequest
 @see AWSSsmDeleteMaintenanceWindowResult
 */
- (void)deleteMaintenanceWindow:(AWSSsmDeleteMaintenanceWindowRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDeleteMaintenanceWindowResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Delete a parameter from the system.</p>
 
 @param request A container for the necessary parameters to execute the DeleteParameter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDeleteParameterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorParameterNotFound`.
 
 @see AWSSsmDeleteParameterRequest
 @see AWSSsmDeleteParameterResult
 */
- (AWSTask<AWSSsmDeleteParameterResult *> *)deleteParameter:(AWSSsmDeleteParameterRequest *)request;

/**
 <p>Delete a parameter from the system.</p>
 
 @param request A container for the necessary parameters to execute the DeleteParameter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorParameterNotFound`.
 
 @see AWSSsmDeleteParameterRequest
 @see AWSSsmDeleteParameterResult
 */
- (void)deleteParameter:(AWSSsmDeleteParameterRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDeleteParameterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Delete a list of parameters.</p>
 
 @param request A container for the necessary parameters to execute the DeleteParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDeleteParametersResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDeleteParametersRequest
 @see AWSSsmDeleteParametersResult
 */
- (AWSTask<AWSSsmDeleteParametersResult *> *)deleteParameters:(AWSSsmDeleteParametersRequest *)request;

/**
 <p>Delete a list of parameters.</p>
 
 @param request A container for the necessary parameters to execute the DeleteParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDeleteParametersRequest
 @see AWSSsmDeleteParametersResult
 */
- (void)deleteParameters:(AWSSsmDeleteParametersRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDeleteParametersResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a patch baseline.</p>
 
 @param request A container for the necessary parameters to execute the DeletePatchBaseline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDeletePatchBaselineResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorResourceInUse`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDeletePatchBaselineRequest
 @see AWSSsmDeletePatchBaselineResult
 */
- (AWSTask<AWSSsmDeletePatchBaselineResult *> *)deletePatchBaseline:(AWSSsmDeletePatchBaselineRequest *)request;

/**
 <p>Deletes a patch baseline.</p>
 
 @param request A container for the necessary parameters to execute the DeletePatchBaseline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorResourceInUse`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDeletePatchBaselineRequest
 @see AWSSsmDeletePatchBaselineResult
 */
- (void)deletePatchBaseline:(AWSSsmDeletePatchBaselineRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDeletePatchBaselineResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a Resource Data Sync configuration. After the configuration is deleted, changes to data on managed instances are no longer synced to or from the target. Deleting a sync configuration does not delete data.</p>
 
 @param request A container for the necessary parameters to execute the DeleteResourceDataSync service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDeleteResourceDataSyncResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorResourceDataSyncNotFound`, `AWSSsmErrorResourceDataSyncInvalidConfiguration`.
 
 @see AWSSsmDeleteResourceDataSyncRequest
 @see AWSSsmDeleteResourceDataSyncResult
 */
- (AWSTask<AWSSsmDeleteResourceDataSyncResult *> *)deleteResourceDataSync:(AWSSsmDeleteResourceDataSyncRequest *)request;

/**
 <p>Deletes a Resource Data Sync configuration. After the configuration is deleted, changes to data on managed instances are no longer synced to or from the target. Deleting a sync configuration does not delete data.</p>
 
 @param request A container for the necessary parameters to execute the DeleteResourceDataSync service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorResourceDataSyncNotFound`, `AWSSsmErrorResourceDataSyncInvalidConfiguration`.
 
 @see AWSSsmDeleteResourceDataSyncRequest
 @see AWSSsmDeleteResourceDataSyncResult
 */
- (void)deleteResourceDataSync:(AWSSsmDeleteResourceDataSyncRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDeleteResourceDataSyncResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the server or virtual machine from the list of registered servers. You can reregister the instance again at any time. If you don't plan to use Run Command on the server, we suggest uninstalling SSM Agent first.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterManagedInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDeregisterManagedInstanceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDeregisterManagedInstanceRequest
 @see AWSSsmDeregisterManagedInstanceResult
 */
- (AWSTask<AWSSsmDeregisterManagedInstanceResult *> *)deregisterManagedInstance:(AWSSsmDeregisterManagedInstanceRequest *)request;

/**
 <p>Removes the server or virtual machine from the list of registered servers. You can reregister the instance again at any time. If you don't plan to use Run Command on the server, we suggest uninstalling SSM Agent first.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterManagedInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDeregisterManagedInstanceRequest
 @see AWSSsmDeregisterManagedInstanceResult
 */
- (void)deregisterManagedInstance:(AWSSsmDeregisterManagedInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDeregisterManagedInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a patch group from a patch baseline.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterPatchBaselineForPatchGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDeregisterPatchBaselineForPatchGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidResourceId`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDeregisterPatchBaselineForPatchGroupRequest
 @see AWSSsmDeregisterPatchBaselineForPatchGroupResult
 */
- (AWSTask<AWSSsmDeregisterPatchBaselineForPatchGroupResult *> *)deregisterPatchBaselineForPatchGroup:(AWSSsmDeregisterPatchBaselineForPatchGroupRequest *)request;

/**
 <p>Removes a patch group from a patch baseline.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterPatchBaselineForPatchGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidResourceId`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDeregisterPatchBaselineForPatchGroupRequest
 @see AWSSsmDeregisterPatchBaselineForPatchGroupResult
 */
- (void)deregisterPatchBaselineForPatchGroup:(AWSSsmDeregisterPatchBaselineForPatchGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDeregisterPatchBaselineForPatchGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a target from a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterTargetFromMaintenanceWindow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDeregisterTargetFromMaintenanceWindowResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`, `AWSSsmErrorTargetInUse`.
 
 @see AWSSsmDeregisterTargetFromMaintenanceWindowRequest
 @see AWSSsmDeregisterTargetFromMaintenanceWindowResult
 */
- (AWSTask<AWSSsmDeregisterTargetFromMaintenanceWindowResult *> *)deregisterTargetFromMaintenanceWindow:(AWSSsmDeregisterTargetFromMaintenanceWindowRequest *)request;

/**
 <p>Removes a target from a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterTargetFromMaintenanceWindow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`, `AWSSsmErrorTargetInUse`.
 
 @see AWSSsmDeregisterTargetFromMaintenanceWindowRequest
 @see AWSSsmDeregisterTargetFromMaintenanceWindowResult
 */
- (void)deregisterTargetFromMaintenanceWindow:(AWSSsmDeregisterTargetFromMaintenanceWindowRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDeregisterTargetFromMaintenanceWindowResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a task from a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterTaskFromMaintenanceWindow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDeregisterTaskFromMaintenanceWindowResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDeregisterTaskFromMaintenanceWindowRequest
 @see AWSSsmDeregisterTaskFromMaintenanceWindowResult
 */
- (AWSTask<AWSSsmDeregisterTaskFromMaintenanceWindowResult *> *)deregisterTaskFromMaintenanceWindow:(AWSSsmDeregisterTaskFromMaintenanceWindowRequest *)request;

/**
 <p>Removes a task from a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterTaskFromMaintenanceWindow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDeregisterTaskFromMaintenanceWindowRequest
 @see AWSSsmDeregisterTaskFromMaintenanceWindowResult
 */
- (void)deregisterTaskFromMaintenanceWindow:(AWSSsmDeregisterTaskFromMaintenanceWindowRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDeregisterTaskFromMaintenanceWindowResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes details about the activation, such as the date and time the activation was created, its expiration date, the IAM role assigned to the instances in the activation, and the number of instances registered by using this activation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeActivations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeActivationsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidFilter`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeActivationsRequest
 @see AWSSsmDescribeActivationsResult
 */
- (AWSTask<AWSSsmDescribeActivationsResult *> *)describeActivations:(AWSSsmDescribeActivationsRequest *)request;

/**
 <p>Describes details about the activation, such as the date and time the activation was created, its expiration date, the IAM role assigned to the instances in the activation, and the number of instances registered by using this activation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeActivations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidFilter`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeActivationsRequest
 @see AWSSsmDescribeActivationsResult
 */
- (void)describeActivations:(AWSSsmDescribeActivationsRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeActivationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the association for the specified target or instance. If you created the association by using the <code>Targets</code> parameter, then you must retrieve the association by using the association ID. If you created the association by specifying an instance ID and a Systems Manager document, then you retrieve the association by specifying the document name and the instance ID. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeAssociationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorAssociationDoesNotExist`, `AWSSsmErrorInvalidAssociationVersion`, `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidInstanceId`.
 
 @see AWSSsmDescribeAssociationRequest
 @see AWSSsmDescribeAssociationResult
 */
- (AWSTask<AWSSsmDescribeAssociationResult *> *)describeAssociation:(AWSSsmDescribeAssociationRequest *)request;

/**
 <p>Describes the association for the specified target or instance. If you created the association by using the <code>Targets</code> parameter, then you must retrieve the association by using the association ID. If you created the association by specifying an instance ID and a Systems Manager document, then you retrieve the association by specifying the document name and the instance ID. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorAssociationDoesNotExist`, `AWSSsmErrorInvalidAssociationVersion`, `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidInstanceId`.
 
 @see AWSSsmDescribeAssociationRequest
 @see AWSSsmDescribeAssociationResult
 */
- (void)describeAssociation:(AWSSsmDescribeAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Use this API action to view information about a specific execution of a specific association.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAssociationExecutionTargets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeAssociationExecutionTargetsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorAssociationDoesNotExist`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorAssociationExecutionDoesNotExist`.
 
 @see AWSSsmDescribeAssociationExecutionTargetsRequest
 @see AWSSsmDescribeAssociationExecutionTargetsResult
 */
- (AWSTask<AWSSsmDescribeAssociationExecutionTargetsResult *> *)describeAssociationExecutionTargets:(AWSSsmDescribeAssociationExecutionTargetsRequest *)request;

/**
 <p>Use this API action to view information about a specific execution of a specific association.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAssociationExecutionTargets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorAssociationDoesNotExist`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorAssociationExecutionDoesNotExist`.
 
 @see AWSSsmDescribeAssociationExecutionTargetsRequest
 @see AWSSsmDescribeAssociationExecutionTargetsResult
 */
- (void)describeAssociationExecutionTargets:(AWSSsmDescribeAssociationExecutionTargetsRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeAssociationExecutionTargetsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Use this API action to view all executions for a specific association ID. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAssociationExecutions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeAssociationExecutionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorAssociationDoesNotExist`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmDescribeAssociationExecutionsRequest
 @see AWSSsmDescribeAssociationExecutionsResult
 */
- (AWSTask<AWSSsmDescribeAssociationExecutionsResult *> *)describeAssociationExecutions:(AWSSsmDescribeAssociationExecutionsRequest *)request;

/**
 <p>Use this API action to view all executions for a specific association ID. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAssociationExecutions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorAssociationDoesNotExist`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmDescribeAssociationExecutionsRequest
 @see AWSSsmDescribeAssociationExecutionsResult
 */
- (void)describeAssociationExecutions:(AWSSsmDescribeAssociationExecutionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeAssociationExecutionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides details about all active and terminated Automation executions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutomationExecutions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeAutomationExecutionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidFilterKey`, `AWSSsmErrorInvalidFilterValue`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeAutomationExecutionsRequest
 @see AWSSsmDescribeAutomationExecutionsResult
 */
- (AWSTask<AWSSsmDescribeAutomationExecutionsResult *> *)describeAutomationExecutions:(AWSSsmDescribeAutomationExecutionsRequest *)request;

/**
 <p>Provides details about all active and terminated Automation executions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutomationExecutions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidFilterKey`, `AWSSsmErrorInvalidFilterValue`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeAutomationExecutionsRequest
 @see AWSSsmDescribeAutomationExecutionsResult
 */
- (void)describeAutomationExecutions:(AWSSsmDescribeAutomationExecutionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeAutomationExecutionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Information about all active and terminated step executions in an Automation workflow.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutomationStepExecutions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeAutomationStepExecutionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorAutomationExecutionNotFound`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorInvalidFilterKey`, `AWSSsmErrorInvalidFilterValue`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeAutomationStepExecutionsRequest
 @see AWSSsmDescribeAutomationStepExecutionsResult
 */
- (AWSTask<AWSSsmDescribeAutomationStepExecutionsResult *> *)describeAutomationStepExecutions:(AWSSsmDescribeAutomationStepExecutionsRequest *)request;

/**
 <p>Information about all active and terminated step executions in an Automation workflow.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutomationStepExecutions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorAutomationExecutionNotFound`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorInvalidFilterKey`, `AWSSsmErrorInvalidFilterValue`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeAutomationStepExecutionsRequest
 @see AWSSsmDescribeAutomationStepExecutionsResult
 */
- (void)describeAutomationStepExecutions:(AWSSsmDescribeAutomationStepExecutionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeAutomationStepExecutionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all patches eligible to be included in a patch baseline.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAvailablePatches service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeAvailablePatchesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeAvailablePatchesRequest
 @see AWSSsmDescribeAvailablePatchesResult
 */
- (AWSTask<AWSSsmDescribeAvailablePatchesResult *> *)describeAvailablePatches:(AWSSsmDescribeAvailablePatchesRequest *)request;

/**
 <p>Lists all patches eligible to be included in a patch baseline.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAvailablePatches service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeAvailablePatchesRequest
 @see AWSSsmDescribeAvailablePatchesResult
 */
- (void)describeAvailablePatches:(AWSSsmDescribeAvailablePatchesRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeAvailablePatchesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified Systems Manager document.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDocument service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeDocumentResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidDocumentVersion`.
 
 @see AWSSsmDescribeDocumentRequest
 @see AWSSsmDescribeDocumentResult
 */
- (AWSTask<AWSSsmDescribeDocumentResult *> *)describeDocument:(AWSSsmDescribeDocumentRequest *)request;

/**
 <p>Describes the specified Systems Manager document.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDocument service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidDocumentVersion`.
 
 @see AWSSsmDescribeDocumentRequest
 @see AWSSsmDescribeDocumentResult
 */
- (void)describeDocument:(AWSSsmDescribeDocumentRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeDocumentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the permissions for a Systems Manager document. If you created the document, you are the owner. If a document is shared, it can either be shared privately (by specifying a user's AWS account ID) or publicly (<i>All</i>). </p>
 
 @param request A container for the necessary parameters to execute the DescribeDocumentPermission service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeDocumentPermissionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidPermissionType`.
 
 @see AWSSsmDescribeDocumentPermissionRequest
 @see AWSSsmDescribeDocumentPermissionResponse
 */
- (AWSTask<AWSSsmDescribeDocumentPermissionResponse *> *)describeDocumentPermission:(AWSSsmDescribeDocumentPermissionRequest *)request;

/**
 <p>Describes the permissions for a Systems Manager document. If you created the document, you are the owner. If a document is shared, it can either be shared privately (by specifying a user's AWS account ID) or publicly (<i>All</i>). </p>
 
 @param request A container for the necessary parameters to execute the DescribeDocumentPermission service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidPermissionType`.
 
 @see AWSSsmDescribeDocumentPermissionRequest
 @see AWSSsmDescribeDocumentPermissionResponse
 */
- (void)describeDocumentPermission:(AWSSsmDescribeDocumentPermissionRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeDocumentPermissionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>All associations for the instance(s).</p>
 
 @param request A container for the necessary parameters to execute the DescribeEffectiveInstanceAssociations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeEffectiveInstanceAssociationsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmDescribeEffectiveInstanceAssociationsRequest
 @see AWSSsmDescribeEffectiveInstanceAssociationsResult
 */
- (AWSTask<AWSSsmDescribeEffectiveInstanceAssociationsResult *> *)describeEffectiveInstanceAssociations:(AWSSsmDescribeEffectiveInstanceAssociationsRequest *)request;

/**
 <p>All associations for the instance(s).</p>
 
 @param request A container for the necessary parameters to execute the DescribeEffectiveInstanceAssociations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmDescribeEffectiveInstanceAssociationsRequest
 @see AWSSsmDescribeEffectiveInstanceAssociationsResult
 */
- (void)describeEffectiveInstanceAssociations:(AWSSsmDescribeEffectiveInstanceAssociationsRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeEffectiveInstanceAssociationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the current effective patches (the patch and the approval state) for the specified patch baseline. Note that this API applies only to Windows patch baselines.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEffectivePatchesForPatchBaseline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeEffectivePatchesForPatchBaselineResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidResourceId`, `AWSSsmErrorDoesNotExist`, `AWSSsmErrorUnsupportedOperatingSystem`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeEffectivePatchesForPatchBaselineRequest
 @see AWSSsmDescribeEffectivePatchesForPatchBaselineResult
 */
- (AWSTask<AWSSsmDescribeEffectivePatchesForPatchBaselineResult *> *)describeEffectivePatchesForPatchBaseline:(AWSSsmDescribeEffectivePatchesForPatchBaselineRequest *)request;

/**
 <p>Retrieves the current effective patches (the patch and the approval state) for the specified patch baseline. Note that this API applies only to Windows patch baselines.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEffectivePatchesForPatchBaseline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidResourceId`, `AWSSsmErrorDoesNotExist`, `AWSSsmErrorUnsupportedOperatingSystem`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeEffectivePatchesForPatchBaselineRequest
 @see AWSSsmDescribeEffectivePatchesForPatchBaselineResult
 */
- (void)describeEffectivePatchesForPatchBaseline:(AWSSsmDescribeEffectivePatchesForPatchBaselineRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeEffectivePatchesForPatchBaselineResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>The status of the associations for the instance(s).</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceAssociationsStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeInstanceAssociationsStatusResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmDescribeInstanceAssociationsStatusRequest
 @see AWSSsmDescribeInstanceAssociationsStatusResult
 */
- (AWSTask<AWSSsmDescribeInstanceAssociationsStatusResult *> *)describeInstanceAssociationsStatus:(AWSSsmDescribeInstanceAssociationsStatusRequest *)request;

/**
 <p>The status of the associations for the instance(s).</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceAssociationsStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmDescribeInstanceAssociationsStatusRequest
 @see AWSSsmDescribeInstanceAssociationsStatusResult
 */
- (void)describeInstanceAssociationsStatus:(AWSSsmDescribeInstanceAssociationsStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeInstanceAssociationsStatusResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your instances, including information about the operating system platform, the version of SSM Agent installed on the instance, instance status, and so on.</p><p>If you specify one or more instance IDs, it returns information for those instances. If you do not specify instance IDs, it returns information for all your instances. If you specify an instance ID that is not valid or an instance that you do not own, you receive an error.</p><note><p>The IamRole field for this API action is the Amazon Identity and Access Management (IAM) role assigned to on-premises instances. This call does not return the IAM role for EC2 instances.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceInformation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeInstanceInformationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorInvalidInstanceInformationFilterValue`, `AWSSsmErrorInvalidFilterKey`.
 
 @see AWSSsmDescribeInstanceInformationRequest
 @see AWSSsmDescribeInstanceInformationResult
 */
- (AWSTask<AWSSsmDescribeInstanceInformationResult *> *)describeInstanceInformation:(AWSSsmDescribeInstanceInformationRequest *)request;

/**
 <p>Describes one or more of your instances, including information about the operating system platform, the version of SSM Agent installed on the instance, instance status, and so on.</p><p>If you specify one or more instance IDs, it returns information for those instances. If you do not specify instance IDs, it returns information for all your instances. If you specify an instance ID that is not valid or an instance that you do not own, you receive an error.</p><note><p>The IamRole field for this API action is the Amazon Identity and Access Management (IAM) role assigned to on-premises instances. This call does not return the IAM role for EC2 instances.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceInformation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorInvalidInstanceInformationFilterValue`, `AWSSsmErrorInvalidFilterKey`.
 
 @see AWSSsmDescribeInstanceInformationRequest
 @see AWSSsmDescribeInstanceInformationResult
 */
- (void)describeInstanceInformation:(AWSSsmDescribeInstanceInformationRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeInstanceInformationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the high-level patch state of one or more instances.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstancePatchStates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeInstancePatchStatesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmDescribeInstancePatchStatesRequest
 @see AWSSsmDescribeInstancePatchStatesResult
 */
- (AWSTask<AWSSsmDescribeInstancePatchStatesResult *> *)describeInstancePatchStates:(AWSSsmDescribeInstancePatchStatesRequest *)request;

/**
 <p>Retrieves the high-level patch state of one or more instances.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstancePatchStates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmDescribeInstancePatchStatesRequest
 @see AWSSsmDescribeInstancePatchStatesResult
 */
- (void)describeInstancePatchStates:(AWSSsmDescribeInstancePatchStatesRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeInstancePatchStatesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the high-level patch state for the instances in the specified patch group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstancePatchStatesForPatchGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeInstancePatchStatesForPatchGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidFilter`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmDescribeInstancePatchStatesForPatchGroupRequest
 @see AWSSsmDescribeInstancePatchStatesForPatchGroupResult
 */
- (AWSTask<AWSSsmDescribeInstancePatchStatesForPatchGroupResult *> *)describeInstancePatchStatesForPatchGroup:(AWSSsmDescribeInstancePatchStatesForPatchGroupRequest *)request;

/**
 <p>Retrieves the high-level patch state for the instances in the specified patch group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstancePatchStatesForPatchGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidFilter`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmDescribeInstancePatchStatesForPatchGroupRequest
 @see AWSSsmDescribeInstancePatchStatesForPatchGroupResult
 */
- (void)describeInstancePatchStatesForPatchGroup:(AWSSsmDescribeInstancePatchStatesForPatchGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeInstancePatchStatesForPatchGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the patches on the specified instance and their state relative to the patch baseline being used for the instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstancePatches service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeInstancePatchesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInvalidFilter`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmDescribeInstancePatchesRequest
 @see AWSSsmDescribeInstancePatchesResult
 */
- (AWSTask<AWSSsmDescribeInstancePatchesResult *> *)describeInstancePatches:(AWSSsmDescribeInstancePatchesRequest *)request;

/**
 <p>Retrieves information about the patches on the specified instance and their state relative to the patch baseline being used for the instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstancePatches service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInvalidFilter`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmDescribeInstancePatchesRequest
 @see AWSSsmDescribeInstancePatchesResult
 */
- (void)describeInstancePatches:(AWSSsmDescribeInstancePatchesRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeInstancePatchesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes a specific delete inventory operation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInventoryDeletions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeInventoryDeletionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDeletionId`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmDescribeInventoryDeletionsRequest
 @see AWSSsmDescribeInventoryDeletionsResult
 */
- (AWSTask<AWSSsmDescribeInventoryDeletionsResult *> *)describeInventoryDeletions:(AWSSsmDescribeInventoryDeletionsRequest *)request;

/**
 <p>Describes a specific delete inventory operation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInventoryDeletions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDeletionId`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmDescribeInventoryDeletionsRequest
 @see AWSSsmDescribeInventoryDeletionsResult
 */
- (void)describeInventoryDeletions:(AWSSsmDescribeInventoryDeletionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeInventoryDeletionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the individual task executions (one per target) for a particular task run as part of a maintenance window execution.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowExecutionTaskInvocations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeMaintenanceWindowExecutionTaskInvocationsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeMaintenanceWindowExecutionTaskInvocationsRequest
 @see AWSSsmDescribeMaintenanceWindowExecutionTaskInvocationsResult
 */
- (AWSTask<AWSSsmDescribeMaintenanceWindowExecutionTaskInvocationsResult *> *)describeMaintenanceWindowExecutionTaskInvocations:(AWSSsmDescribeMaintenanceWindowExecutionTaskInvocationsRequest *)request;

/**
 <p>Retrieves the individual task executions (one per target) for a particular task run as part of a maintenance window execution.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowExecutionTaskInvocations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeMaintenanceWindowExecutionTaskInvocationsRequest
 @see AWSSsmDescribeMaintenanceWindowExecutionTaskInvocationsResult
 */
- (void)describeMaintenanceWindowExecutionTaskInvocations:(AWSSsmDescribeMaintenanceWindowExecutionTaskInvocationsRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeMaintenanceWindowExecutionTaskInvocationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>For a given maintenance window execution, lists the tasks that were run.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowExecutionTasks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeMaintenanceWindowExecutionTasksResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeMaintenanceWindowExecutionTasksRequest
 @see AWSSsmDescribeMaintenanceWindowExecutionTasksResult
 */
- (AWSTask<AWSSsmDescribeMaintenanceWindowExecutionTasksResult *> *)describeMaintenanceWindowExecutionTasks:(AWSSsmDescribeMaintenanceWindowExecutionTasksRequest *)request;

/**
 <p>For a given maintenance window execution, lists the tasks that were run.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowExecutionTasks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeMaintenanceWindowExecutionTasksRequest
 @see AWSSsmDescribeMaintenanceWindowExecutionTasksResult
 */
- (void)describeMaintenanceWindowExecutionTasks:(AWSSsmDescribeMaintenanceWindowExecutionTasksRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeMaintenanceWindowExecutionTasksResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the executions of a maintenance window. This includes information about when the maintenance window was scheduled to be active, and information about tasks registered and run with the maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowExecutions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeMaintenanceWindowExecutionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeMaintenanceWindowExecutionsRequest
 @see AWSSsmDescribeMaintenanceWindowExecutionsResult
 */
- (AWSTask<AWSSsmDescribeMaintenanceWindowExecutionsResult *> *)describeMaintenanceWindowExecutions:(AWSSsmDescribeMaintenanceWindowExecutionsRequest *)request;

/**
 <p>Lists the executions of a maintenance window. This includes information about when the maintenance window was scheduled to be active, and information about tasks registered and run with the maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowExecutions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeMaintenanceWindowExecutionsRequest
 @see AWSSsmDescribeMaintenanceWindowExecutionsResult
 */
- (void)describeMaintenanceWindowExecutions:(AWSSsmDescribeMaintenanceWindowExecutionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeMaintenanceWindowExecutionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about upcoming executions of a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeMaintenanceWindowScheduleResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorDoesNotExist`.
 
 @see AWSSsmDescribeMaintenanceWindowScheduleRequest
 @see AWSSsmDescribeMaintenanceWindowScheduleResult
 */
- (AWSTask<AWSSsmDescribeMaintenanceWindowScheduleResult *> *)describeMaintenanceWindowSchedule:(AWSSsmDescribeMaintenanceWindowScheduleRequest *)request;

/**
 <p>Retrieves information about upcoming executions of a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorDoesNotExist`.
 
 @see AWSSsmDescribeMaintenanceWindowScheduleRequest
 @see AWSSsmDescribeMaintenanceWindowScheduleResult
 */
- (void)describeMaintenanceWindowSchedule:(AWSSsmDescribeMaintenanceWindowScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeMaintenanceWindowScheduleResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the targets registered with the maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowTargets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeMaintenanceWindowTargetsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeMaintenanceWindowTargetsRequest
 @see AWSSsmDescribeMaintenanceWindowTargetsResult
 */
- (AWSTask<AWSSsmDescribeMaintenanceWindowTargetsResult *> *)describeMaintenanceWindowTargets:(AWSSsmDescribeMaintenanceWindowTargetsRequest *)request;

/**
 <p>Lists the targets registered with the maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowTargets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeMaintenanceWindowTargetsRequest
 @see AWSSsmDescribeMaintenanceWindowTargetsResult
 */
- (void)describeMaintenanceWindowTargets:(AWSSsmDescribeMaintenanceWindowTargetsRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeMaintenanceWindowTargetsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tasks in a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowTasks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeMaintenanceWindowTasksResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeMaintenanceWindowTasksRequest
 @see AWSSsmDescribeMaintenanceWindowTasksResult
 */
- (AWSTask<AWSSsmDescribeMaintenanceWindowTasksResult *> *)describeMaintenanceWindowTasks:(AWSSsmDescribeMaintenanceWindowTasksRequest *)request;

/**
 <p>Lists the tasks in a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowTasks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeMaintenanceWindowTasksRequest
 @see AWSSsmDescribeMaintenanceWindowTasksResult
 */
- (void)describeMaintenanceWindowTasks:(AWSSsmDescribeMaintenanceWindowTasksRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeMaintenanceWindowTasksResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the maintenance windows in an AWS account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindows service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeMaintenanceWindowsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeMaintenanceWindowsRequest
 @see AWSSsmDescribeMaintenanceWindowsResult
 */
- (AWSTask<AWSSsmDescribeMaintenanceWindowsResult *> *)describeMaintenanceWindows:(AWSSsmDescribeMaintenanceWindowsRequest *)request;

/**
 <p>Retrieves the maintenance windows in an AWS account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindows service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeMaintenanceWindowsRequest
 @see AWSSsmDescribeMaintenanceWindowsResult
 */
- (void)describeMaintenanceWindows:(AWSSsmDescribeMaintenanceWindowsRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeMaintenanceWindowsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the maintenance window targets or tasks that an instance is associated with.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowsForTarget service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeMaintenanceWindowsForTargetResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeMaintenanceWindowsForTargetRequest
 @see AWSSsmDescribeMaintenanceWindowsForTargetResult
 */
- (AWSTask<AWSSsmDescribeMaintenanceWindowsForTargetResult *> *)describeMaintenanceWindowsForTarget:(AWSSsmDescribeMaintenanceWindowsForTargetRequest *)request;

/**
 <p>Retrieves information about the maintenance window targets or tasks that an instance is associated with.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowsForTarget service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeMaintenanceWindowsForTargetRequest
 @see AWSSsmDescribeMaintenanceWindowsForTargetResult
 */
- (void)describeMaintenanceWindowsForTarget:(AWSSsmDescribeMaintenanceWindowsForTargetRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeMaintenanceWindowsForTargetResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Query a set of OpsItems. You must have permission in AWS Identity and Access Management (IAM) to query a list of OpsItems. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeOpsItems service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeOpsItemsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeOpsItemsRequest
 @see AWSSsmDescribeOpsItemsResponse
 */
- (AWSTask<AWSSsmDescribeOpsItemsResponse *> *)describeOpsItems:(AWSSsmDescribeOpsItemsRequest *)request;

/**
 <p>Query a set of OpsItems. You must have permission in AWS Identity and Access Management (IAM) to query a list of OpsItems. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeOpsItems service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribeOpsItemsRequest
 @see AWSSsmDescribeOpsItemsResponse
 */
- (void)describeOpsItems:(AWSSsmDescribeOpsItemsRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeOpsItemsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get information about a parameter.</p><note><p>Request results are returned on a best-effort basis. If you specify <code>MaxResults</code> in the request, the response includes information up to the limit specified. The number of items returned, however, can be between zero and the value of <code>MaxResults</code>. If the service reaches an internal limit while processing the results, it stops the operation and returns the matching values up to that point and a <code>NextToken</code>. You can specify the <code>NextToken</code> in a subsequent call to get the next set of results.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeParametersResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidFilterKey`, `AWSSsmErrorInvalidFilterOption`, `AWSSsmErrorInvalidFilterValue`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmDescribeParametersRequest
 @see AWSSsmDescribeParametersResult
 */
- (AWSTask<AWSSsmDescribeParametersResult *> *)describeParameters:(AWSSsmDescribeParametersRequest *)request;

/**
 <p>Get information about a parameter.</p><note><p>Request results are returned on a best-effort basis. If you specify <code>MaxResults</code> in the request, the response includes information up to the limit specified. The number of items returned, however, can be between zero and the value of <code>MaxResults</code>. If the service reaches an internal limit while processing the results, it stops the operation and returns the matching values up to that point and a <code>NextToken</code>. You can specify the <code>NextToken</code> in a subsequent call to get the next set of results.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidFilterKey`, `AWSSsmErrorInvalidFilterOption`, `AWSSsmErrorInvalidFilterValue`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmDescribeParametersRequest
 @see AWSSsmDescribeParametersResult
 */
- (void)describeParameters:(AWSSsmDescribeParametersRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeParametersResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the patch baselines in your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the DescribePatchBaselines service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribePatchBaselinesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribePatchBaselinesRequest
 @see AWSSsmDescribePatchBaselinesResult
 */
- (AWSTask<AWSSsmDescribePatchBaselinesResult *> *)describePatchBaselines:(AWSSsmDescribePatchBaselinesRequest *)request;

/**
 <p>Lists the patch baselines in your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the DescribePatchBaselines service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribePatchBaselinesRequest
 @see AWSSsmDescribePatchBaselinesResult
 */
- (void)describePatchBaselines:(AWSSsmDescribePatchBaselinesRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribePatchBaselinesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns high-level aggregated patch compliance state for a patch group.</p>
 
 @param request A container for the necessary parameters to execute the DescribePatchGroupState service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribePatchGroupStateResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmDescribePatchGroupStateRequest
 @see AWSSsmDescribePatchGroupStateResult
 */
- (AWSTask<AWSSsmDescribePatchGroupStateResult *> *)describePatchGroupState:(AWSSsmDescribePatchGroupStateRequest *)request;

/**
 <p>Returns high-level aggregated patch compliance state for a patch group.</p>
 
 @param request A container for the necessary parameters to execute the DescribePatchGroupState service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmDescribePatchGroupStateRequest
 @see AWSSsmDescribePatchGroupStateResult
 */
- (void)describePatchGroupState:(AWSSsmDescribePatchGroupStateRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribePatchGroupStateResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all patch groups that have been registered with patch baselines.</p>
 
 @param request A container for the necessary parameters to execute the DescribePatchGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribePatchGroupsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribePatchGroupsRequest
 @see AWSSsmDescribePatchGroupsResult
 */
- (AWSTask<AWSSsmDescribePatchGroupsResult *> *)describePatchGroups:(AWSSsmDescribePatchGroupsRequest *)request;

/**
 <p>Lists all patch groups that have been registered with patch baselines.</p>
 
 @param request A container for the necessary parameters to execute the DescribePatchGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribePatchGroupsRequest
 @see AWSSsmDescribePatchGroupsResult
 */
- (void)describePatchGroups:(AWSSsmDescribePatchGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribePatchGroupsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the properties of available patches organized by product, product family, classification, severity, and other properties of available patches. You can use the reported properties in the filters you specify in requests for actions such as <a>CreatePatchBaseline</a>, <a>UpdatePatchBaseline</a>, <a>DescribeAvailablePatches</a>, and <a>DescribePatchBaselines</a>.</p><p>The following section lists the properties that can be used in filters for each major operating system type:</p><dl><dt>WINDOWS</dt><dd><p>Valid properties: PRODUCT, PRODUCT_FAMILY, CLASSIFICATION, MSRC_SEVERITY</p></dd><dt>AMAZON_LINUX</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd><dt>AMAZON_LINUX_2</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd><dt>UBUNTU </dt><dd><p>Valid properties: PRODUCT, PRIORITY</p></dd><dt>REDHAT_ENTERPRISE_LINUX</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd><dt>SUSE</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd><dt>CENTOS</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd></dl>
 
 @param request A container for the necessary parameters to execute the DescribePatchProperties service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribePatchPropertiesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribePatchPropertiesRequest
 @see AWSSsmDescribePatchPropertiesResult
 */
- (AWSTask<AWSSsmDescribePatchPropertiesResult *> *)describePatchProperties:(AWSSsmDescribePatchPropertiesRequest *)request;

/**
 <p>Lists the properties of available patches organized by product, product family, classification, severity, and other properties of available patches. You can use the reported properties in the filters you specify in requests for actions such as <a>CreatePatchBaseline</a>, <a>UpdatePatchBaseline</a>, <a>DescribeAvailablePatches</a>, and <a>DescribePatchBaselines</a>.</p><p>The following section lists the properties that can be used in filters for each major operating system type:</p><dl><dt>WINDOWS</dt><dd><p>Valid properties: PRODUCT, PRODUCT_FAMILY, CLASSIFICATION, MSRC_SEVERITY</p></dd><dt>AMAZON_LINUX</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd><dt>AMAZON_LINUX_2</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd><dt>UBUNTU </dt><dd><p>Valid properties: PRODUCT, PRIORITY</p></dd><dt>REDHAT_ENTERPRISE_LINUX</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd><dt>SUSE</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd><dt>CENTOS</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd></dl>
 
 @param request A container for the necessary parameters to execute the DescribePatchProperties service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmDescribePatchPropertiesRequest
 @see AWSSsmDescribePatchPropertiesResult
 */
- (void)describePatchProperties:(AWSSsmDescribePatchPropertiesRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribePatchPropertiesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of all active sessions (both connected and disconnected) or terminated sessions from the past 30 days.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSessions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmDescribeSessionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidFilterKey`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmDescribeSessionsRequest
 @see AWSSsmDescribeSessionsResponse
 */
- (AWSTask<AWSSsmDescribeSessionsResponse *> *)describeSessions:(AWSSsmDescribeSessionsRequest *)request;

/**
 <p>Retrieves a list of all active sessions (both connected and disconnected) or terminated sessions from the past 30 days.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSessions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidFilterKey`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmDescribeSessionsRequest
 @see AWSSsmDescribeSessionsResponse
 */
- (void)describeSessions:(AWSSsmDescribeSessionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmDescribeSessionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get detailed information about a particular Automation execution.</p>
 
 @param request A container for the necessary parameters to execute the GetAutomationExecution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmGetAutomationExecutionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorAutomationExecutionNotFound`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmGetAutomationExecutionRequest
 @see AWSSsmGetAutomationExecutionResult
 */
- (AWSTask<AWSSsmGetAutomationExecutionResult *> *)getAutomationExecution:(AWSSsmGetAutomationExecutionRequest *)request;

/**
 <p>Get detailed information about a particular Automation execution.</p>
 
 @param request A container for the necessary parameters to execute the GetAutomationExecution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorAutomationExecutionNotFound`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmGetAutomationExecutionRequest
 @see AWSSsmGetAutomationExecutionResult
 */
- (void)getAutomationExecution:(AWSSsmGetAutomationExecutionRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmGetAutomationExecutionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the state of the AWS Systems Manager Change Calendar at an optional, specified time. If you specify a time, <code>GetCalendarState</code> returns the state of the calendar at a specific time, and returns the next time that the Change Calendar state will transition. If you do not specify a time, <code>GetCalendarState</code> assumes the current time. Change Calendar entries have two possible states: <code>OPEN</code> or <code>CLOSED</code>. For more information about Systems Manager Change Calendar, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar.html">AWS Systems Manager Change Calendar</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetCalendarState service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmGetCalendarStateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidDocumentType`, `AWSSsmErrorUnsupportedCalendar`.
 
 @see AWSSsmGetCalendarStateRequest
 @see AWSSsmGetCalendarStateResponse
 */
- (AWSTask<AWSSsmGetCalendarStateResponse *> *)getCalendarState:(AWSSsmGetCalendarStateRequest *)request;

/**
 <p>Gets the state of the AWS Systems Manager Change Calendar at an optional, specified time. If you specify a time, <code>GetCalendarState</code> returns the state of the calendar at a specific time, and returns the next time that the Change Calendar state will transition. If you do not specify a time, <code>GetCalendarState</code> assumes the current time. Change Calendar entries have two possible states: <code>OPEN</code> or <code>CLOSED</code>. For more information about Systems Manager Change Calendar, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar.html">AWS Systems Manager Change Calendar</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetCalendarState service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidDocumentType`, `AWSSsmErrorUnsupportedCalendar`.
 
 @see AWSSsmGetCalendarStateRequest
 @see AWSSsmGetCalendarStateResponse
 */
- (void)getCalendarState:(AWSSsmGetCalendarStateRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmGetCalendarStateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns detailed information about command execution for an invocation or plugin. </p>
 
 @param request A container for the necessary parameters to execute the GetCommandInvocation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmGetCommandInvocationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidCommandId`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInvalidPluginName`, `AWSSsmErrorInvocationDoesNotExist`.
 
 @see AWSSsmGetCommandInvocationRequest
 @see AWSSsmGetCommandInvocationResult
 */
- (AWSTask<AWSSsmGetCommandInvocationResult *> *)getCommandInvocation:(AWSSsmGetCommandInvocationRequest *)request;

/**
 <p>Returns detailed information about command execution for an invocation or plugin. </p>
 
 @param request A container for the necessary parameters to execute the GetCommandInvocation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidCommandId`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInvalidPluginName`, `AWSSsmErrorInvocationDoesNotExist`.
 
 @see AWSSsmGetCommandInvocationRequest
 @see AWSSsmGetCommandInvocationResult
 */
- (void)getCommandInvocation:(AWSSsmGetCommandInvocationRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmGetCommandInvocationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the Session Manager connection status for an instance to determine whether it is running and ready to receive Session Manager connections.</p>
 
 @param request A container for the necessary parameters to execute the GetConnectionStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmGetConnectionStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmGetConnectionStatusRequest
 @see AWSSsmGetConnectionStatusResponse
 */
- (AWSTask<AWSSsmGetConnectionStatusResponse *> *)getConnectionStatus:(AWSSsmGetConnectionStatusRequest *)request;

/**
 <p>Retrieves the Session Manager connection status for an instance to determine whether it is running and ready to receive Session Manager connections.</p>
 
 @param request A container for the necessary parameters to execute the GetConnectionStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmGetConnectionStatusRequest
 @see AWSSsmGetConnectionStatusResponse
 */
- (void)getConnectionStatus:(AWSSsmGetConnectionStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmGetConnectionStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the default patch baseline. Note that Systems Manager supports creating multiple default patch baselines. For example, you can create a default patch baseline for each operating system.</p><p>If you do not specify an operating system value, the default patch baseline for Windows is returned.</p>
 
 @param request A container for the necessary parameters to execute the GetDefaultPatchBaseline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmGetDefaultPatchBaselineResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmGetDefaultPatchBaselineRequest
 @see AWSSsmGetDefaultPatchBaselineResult
 */
- (AWSTask<AWSSsmGetDefaultPatchBaselineResult *> *)getDefaultPatchBaseline:(AWSSsmGetDefaultPatchBaselineRequest *)request;

/**
 <p>Retrieves the default patch baseline. Note that Systems Manager supports creating multiple default patch baselines. For example, you can create a default patch baseline for each operating system.</p><p>If you do not specify an operating system value, the default patch baseline for Windows is returned.</p>
 
 @param request A container for the necessary parameters to execute the GetDefaultPatchBaseline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmGetDefaultPatchBaselineRequest
 @see AWSSsmGetDefaultPatchBaselineResult
 */
- (void)getDefaultPatchBaseline:(AWSSsmGetDefaultPatchBaselineRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmGetDefaultPatchBaselineResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the current snapshot for the patch baseline the instance uses. This API is primarily used by the AWS-RunPatchBaseline Systems Manager document. </p>
 
 @param request A container for the necessary parameters to execute the GetDeployablePatchSnapshotForInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmGetDeployablePatchSnapshotForInstanceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorUnsupportedOperatingSystem`, `AWSSsmErrorUnsupportedFeatureRequired`.
 
 @see AWSSsmGetDeployablePatchSnapshotForInstanceRequest
 @see AWSSsmGetDeployablePatchSnapshotForInstanceResult
 */
- (AWSTask<AWSSsmGetDeployablePatchSnapshotForInstanceResult *> *)getDeployablePatchSnapshotForInstance:(AWSSsmGetDeployablePatchSnapshotForInstanceRequest *)request;

/**
 <p>Retrieves the current snapshot for the patch baseline the instance uses. This API is primarily used by the AWS-RunPatchBaseline Systems Manager document. </p>
 
 @param request A container for the necessary parameters to execute the GetDeployablePatchSnapshotForInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorUnsupportedOperatingSystem`, `AWSSsmErrorUnsupportedFeatureRequired`.
 
 @see AWSSsmGetDeployablePatchSnapshotForInstanceRequest
 @see AWSSsmGetDeployablePatchSnapshotForInstanceResult
 */
- (void)getDeployablePatchSnapshotForInstance:(AWSSsmGetDeployablePatchSnapshotForInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmGetDeployablePatchSnapshotForInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the contents of the specified Systems Manager document.</p>
 
 @param request A container for the necessary parameters to execute the GetDocument service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmGetDocumentResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidDocumentVersion`.
 
 @see AWSSsmGetDocumentRequest
 @see AWSSsmGetDocumentResult
 */
- (AWSTask<AWSSsmGetDocumentResult *> *)getDocument:(AWSSsmGetDocumentRequest *)request;

/**
 <p>Gets the contents of the specified Systems Manager document.</p>
 
 @param request A container for the necessary parameters to execute the GetDocument service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidDocumentVersion`.
 
 @see AWSSsmGetDocumentRequest
 @see AWSSsmGetDocumentResult
 */
- (void)getDocument:(AWSSsmGetDocumentRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmGetDocumentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Query inventory information.</p>
 
 @param request A container for the necessary parameters to execute the GetInventory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmGetInventoryResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidFilter`, `AWSSsmErrorInvalidInventoryGroup`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorInvalidTypeName`, `AWSSsmErrorInvalidAggregator`, `AWSSsmErrorInvalidResultAttribute`.
 
 @see AWSSsmGetInventoryRequest
 @see AWSSsmGetInventoryResult
 */
- (AWSTask<AWSSsmGetInventoryResult *> *)getInventory:(AWSSsmGetInventoryRequest *)request;

/**
 <p>Query inventory information.</p>
 
 @param request A container for the necessary parameters to execute the GetInventory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidFilter`, `AWSSsmErrorInvalidInventoryGroup`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorInvalidTypeName`, `AWSSsmErrorInvalidAggregator`, `AWSSsmErrorInvalidResultAttribute`.
 
 @see AWSSsmGetInventoryRequest
 @see AWSSsmGetInventoryResult
 */
- (void)getInventory:(AWSSsmGetInventoryRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmGetInventoryResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Return a list of inventory type names for the account, or return a list of attribute names for a specific Inventory item type.</p>
 
 @param request A container for the necessary parameters to execute the GetInventorySchema service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmGetInventorySchemaResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidTypeName`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmGetInventorySchemaRequest
 @see AWSSsmGetInventorySchemaResult
 */
- (AWSTask<AWSSsmGetInventorySchemaResult *> *)getInventorySchema:(AWSSsmGetInventorySchemaRequest *)request;

/**
 <p>Return a list of inventory type names for the account, or return a list of attribute names for a specific Inventory item type.</p>
 
 @param request A container for the necessary parameters to execute the GetInventorySchema service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidTypeName`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmGetInventorySchemaRequest
 @see AWSSsmGetInventorySchemaResult
 */
- (void)getInventorySchema:(AWSSsmGetInventorySchemaRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmGetInventorySchemaResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmGetMaintenanceWindowResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmGetMaintenanceWindowRequest
 @see AWSSsmGetMaintenanceWindowResult
 */
- (AWSTask<AWSSsmGetMaintenanceWindowResult *> *)getMaintenanceWindow:(AWSSsmGetMaintenanceWindowRequest *)request;

/**
 <p>Retrieves a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmGetMaintenanceWindowRequest
 @see AWSSsmGetMaintenanceWindowResult
 */
- (void)getMaintenanceWindow:(AWSSsmGetMaintenanceWindowRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmGetMaintenanceWindowResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves details about a specific a maintenance window execution.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindowExecution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmGetMaintenanceWindowExecutionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmGetMaintenanceWindowExecutionRequest
 @see AWSSsmGetMaintenanceWindowExecutionResult
 */
- (AWSTask<AWSSsmGetMaintenanceWindowExecutionResult *> *)getMaintenanceWindowExecution:(AWSSsmGetMaintenanceWindowExecutionRequest *)request;

/**
 <p>Retrieves details about a specific a maintenance window execution.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindowExecution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmGetMaintenanceWindowExecutionRequest
 @see AWSSsmGetMaintenanceWindowExecutionResult
 */
- (void)getMaintenanceWindowExecution:(AWSSsmGetMaintenanceWindowExecutionRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmGetMaintenanceWindowExecutionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the details about a specific task run as part of a maintenance window execution.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindowExecutionTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmGetMaintenanceWindowExecutionTaskResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmGetMaintenanceWindowExecutionTaskRequest
 @see AWSSsmGetMaintenanceWindowExecutionTaskResult
 */
- (AWSTask<AWSSsmGetMaintenanceWindowExecutionTaskResult *> *)getMaintenanceWindowExecutionTask:(AWSSsmGetMaintenanceWindowExecutionTaskRequest *)request;

/**
 <p>Retrieves the details about a specific task run as part of a maintenance window execution.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindowExecutionTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmGetMaintenanceWindowExecutionTaskRequest
 @see AWSSsmGetMaintenanceWindowExecutionTaskResult
 */
- (void)getMaintenanceWindowExecutionTask:(AWSSsmGetMaintenanceWindowExecutionTaskRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmGetMaintenanceWindowExecutionTaskResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a specific task running on a specific target.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindowExecutionTaskInvocation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmGetMaintenanceWindowExecutionTaskInvocationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmGetMaintenanceWindowExecutionTaskInvocationRequest
 @see AWSSsmGetMaintenanceWindowExecutionTaskInvocationResult
 */
- (AWSTask<AWSSsmGetMaintenanceWindowExecutionTaskInvocationResult *> *)getMaintenanceWindowExecutionTaskInvocation:(AWSSsmGetMaintenanceWindowExecutionTaskInvocationRequest *)request;

/**
 <p>Retrieves information about a specific task running on a specific target.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindowExecutionTaskInvocation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmGetMaintenanceWindowExecutionTaskInvocationRequest
 @see AWSSsmGetMaintenanceWindowExecutionTaskInvocationResult
 */
- (void)getMaintenanceWindowExecutionTaskInvocation:(AWSSsmGetMaintenanceWindowExecutionTaskInvocationRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmGetMaintenanceWindowExecutionTaskInvocationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tasks in a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindowTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmGetMaintenanceWindowTaskResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmGetMaintenanceWindowTaskRequest
 @see AWSSsmGetMaintenanceWindowTaskResult
 */
- (AWSTask<AWSSsmGetMaintenanceWindowTaskResult *> *)getMaintenanceWindowTask:(AWSSsmGetMaintenanceWindowTaskRequest *)request;

/**
 <p>Lists the tasks in a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindowTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmGetMaintenanceWindowTaskRequest
 @see AWSSsmGetMaintenanceWindowTaskResult
 */
- (void)getMaintenanceWindowTask:(AWSSsmGetMaintenanceWindowTaskRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmGetMaintenanceWindowTaskResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get information about an OpsItem by using the ID. You must have permission in AWS Identity and Access Management (IAM) to view information about an OpsItem. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the GetOpsItem service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmGetOpsItemResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorOpsItemNotFound`.
 
 @see AWSSsmGetOpsItemRequest
 @see AWSSsmGetOpsItemResponse
 */
- (AWSTask<AWSSsmGetOpsItemResponse *> *)getOpsItem:(AWSSsmGetOpsItemRequest *)request;

/**
 <p>Get information about an OpsItem by using the ID. You must have permission in AWS Identity and Access Management (IAM) to view information about an OpsItem. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the GetOpsItem service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorOpsItemNotFound`.
 
 @see AWSSsmGetOpsItemRequest
 @see AWSSsmGetOpsItemResponse
 */
- (void)getOpsItem:(AWSSsmGetOpsItemRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmGetOpsItemResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>View a summary of OpsItems based on specified filters and aggregators.</p>
 
 @param request A container for the necessary parameters to execute the GetOpsSummary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmGetOpsSummaryResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorResourceDataSyncNotFound`, `AWSSsmErrorInvalidFilter`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorInvalidTypeName`, `AWSSsmErrorInvalidAggregator`.
 
 @see AWSSsmGetOpsSummaryRequest
 @see AWSSsmGetOpsSummaryResult
 */
- (AWSTask<AWSSsmGetOpsSummaryResult *> *)getOpsSummary:(AWSSsmGetOpsSummaryRequest *)request;

/**
 <p>View a summary of OpsItems based on specified filters and aggregators.</p>
 
 @param request A container for the necessary parameters to execute the GetOpsSummary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorResourceDataSyncNotFound`, `AWSSsmErrorInvalidFilter`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorInvalidTypeName`, `AWSSsmErrorInvalidAggregator`.
 
 @see AWSSsmGetOpsSummaryRequest
 @see AWSSsmGetOpsSummaryResult
 */
- (void)getOpsSummary:(AWSSsmGetOpsSummaryRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmGetOpsSummaryResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get information about a parameter by using the parameter name. Don't confuse this API action with the <a>GetParameters</a> API action.</p>
 
 @param request A container for the necessary parameters to execute the GetParameter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmGetParameterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidKeyId`, `AWSSsmErrorParameterNotFound`, `AWSSsmErrorParameterVersionNotFound`.
 
 @see AWSSsmGetParameterRequest
 @see AWSSsmGetParameterResult
 */
- (AWSTask<AWSSsmGetParameterResult *> *)getParameter:(AWSSsmGetParameterRequest *)request;

/**
 <p>Get information about a parameter by using the parameter name. Don't confuse this API action with the <a>GetParameters</a> API action.</p>
 
 @param request A container for the necessary parameters to execute the GetParameter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidKeyId`, `AWSSsmErrorParameterNotFound`, `AWSSsmErrorParameterVersionNotFound`.
 
 @see AWSSsmGetParameterRequest
 @see AWSSsmGetParameterResult
 */
- (void)getParameter:(AWSSsmGetParameterRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmGetParameterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Query a list of all parameters used by the AWS account.</p>
 
 @param request A container for the necessary parameters to execute the GetParameterHistory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmGetParameterHistoryResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorParameterNotFound`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorInvalidKeyId`.
 
 @see AWSSsmGetParameterHistoryRequest
 @see AWSSsmGetParameterHistoryResult
 */
- (AWSTask<AWSSsmGetParameterHistoryResult *> *)getParameterHistory:(AWSSsmGetParameterHistoryRequest *)request;

/**
 <p>Query a list of all parameters used by the AWS account.</p>
 
 @param request A container for the necessary parameters to execute the GetParameterHistory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorParameterNotFound`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorInvalidKeyId`.
 
 @see AWSSsmGetParameterHistoryRequest
 @see AWSSsmGetParameterHistoryResult
 */
- (void)getParameterHistory:(AWSSsmGetParameterHistoryRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmGetParameterHistoryResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get details of a parameter. Don't confuse this API action with the <a>GetParameter</a> API action.</p>
 
 @param request A container for the necessary parameters to execute the GetParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmGetParametersResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidKeyId`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmGetParametersRequest
 @see AWSSsmGetParametersResult
 */
- (AWSTask<AWSSsmGetParametersResult *> *)getParameters:(AWSSsmGetParametersRequest *)request;

/**
 <p>Get details of a parameter. Don't confuse this API action with the <a>GetParameter</a> API action.</p>
 
 @param request A container for the necessary parameters to execute the GetParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidKeyId`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmGetParametersRequest
 @see AWSSsmGetParametersResult
 */
- (void)getParameters:(AWSSsmGetParametersRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmGetParametersResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve information about one or more parameters in a specific hierarchy. </p><note><p>Request results are returned on a best-effort basis. If you specify <code>MaxResults</code> in the request, the response includes information up to the limit specified. The number of items returned, however, can be between zero and the value of <code>MaxResults</code>. If the service reaches an internal limit while processing the results, it stops the operation and returns the matching values up to that point and a <code>NextToken</code>. You can specify the <code>NextToken</code> in a subsequent call to get the next set of results.</p></note>
 
 @param request A container for the necessary parameters to execute the GetParametersByPath service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmGetParametersByPathResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidFilterKey`, `AWSSsmErrorInvalidFilterOption`, `AWSSsmErrorInvalidFilterValue`, `AWSSsmErrorInvalidKeyId`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmGetParametersByPathRequest
 @see AWSSsmGetParametersByPathResult
 */
- (AWSTask<AWSSsmGetParametersByPathResult *> *)getParametersByPath:(AWSSsmGetParametersByPathRequest *)request;

/**
 <p>Retrieve information about one or more parameters in a specific hierarchy. </p><note><p>Request results are returned on a best-effort basis. If you specify <code>MaxResults</code> in the request, the response includes information up to the limit specified. The number of items returned, however, can be between zero and the value of <code>MaxResults</code>. If the service reaches an internal limit while processing the results, it stops the operation and returns the matching values up to that point and a <code>NextToken</code>. You can specify the <code>NextToken</code> in a subsequent call to get the next set of results.</p></note>
 
 @param request A container for the necessary parameters to execute the GetParametersByPath service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidFilterKey`, `AWSSsmErrorInvalidFilterOption`, `AWSSsmErrorInvalidFilterValue`, `AWSSsmErrorInvalidKeyId`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmGetParametersByPathRequest
 @see AWSSsmGetParametersByPathResult
 */
- (void)getParametersByPath:(AWSSsmGetParametersByPathRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmGetParametersByPathResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a patch baseline.</p>
 
 @param request A container for the necessary parameters to execute the GetPatchBaseline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmGetPatchBaselineResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInvalidResourceId`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmGetPatchBaselineRequest
 @see AWSSsmGetPatchBaselineResult
 */
- (AWSTask<AWSSsmGetPatchBaselineResult *> *)getPatchBaseline:(AWSSsmGetPatchBaselineRequest *)request;

/**
 <p>Retrieves information about a patch baseline.</p>
 
 @param request A container for the necessary parameters to execute the GetPatchBaseline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInvalidResourceId`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmGetPatchBaselineRequest
 @see AWSSsmGetPatchBaselineResult
 */
- (void)getPatchBaseline:(AWSSsmGetPatchBaselineRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmGetPatchBaselineResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the patch baseline that should be used for the specified patch group.</p>
 
 @param request A container for the necessary parameters to execute the GetPatchBaselineForPatchGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmGetPatchBaselineForPatchGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmGetPatchBaselineForPatchGroupRequest
 @see AWSSsmGetPatchBaselineForPatchGroupResult
 */
- (AWSTask<AWSSsmGetPatchBaselineForPatchGroupResult *> *)getPatchBaselineForPatchGroup:(AWSSsmGetPatchBaselineForPatchGroupRequest *)request;

/**
 <p>Retrieves the patch baseline that should be used for the specified patch group.</p>
 
 @param request A container for the necessary parameters to execute the GetPatchBaselineForPatchGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`.
 
 @see AWSSsmGetPatchBaselineForPatchGroupRequest
 @see AWSSsmGetPatchBaselineForPatchGroupResult
 */
- (void)getPatchBaselineForPatchGroup:(AWSSsmGetPatchBaselineForPatchGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmGetPatchBaselineForPatchGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p><code>ServiceSetting</code> is an account-level setting for an AWS service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an AWS service charges money to the account based on feature or service usage, then the AWS service team might create a default setting of "false". This means the user can't use this feature unless they change the setting to "true" and intentionally opt in for a paid feature.</p><p>Services map a <code>SettingId</code> object to a setting value. AWS services teams define the default value for a <code>SettingId</code>. You can't create a new <code>SettingId</code>, but you can overwrite the default value if you have the <code>ssm:UpdateServiceSetting</code> permission for the setting. Use the <a>UpdateServiceSetting</a> API action to change the default setting. Or use the <a>ResetServiceSetting</a> to change the value back to the original value defined by the AWS service team.</p><p>Query the current service setting for the account. </p>
 
 @param request A container for the necessary parameters to execute the GetServiceSetting service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmGetServiceSettingResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorServiceSettingNotFound`.
 
 @see AWSSsmGetServiceSettingRequest
 @see AWSSsmGetServiceSettingResult
 */
- (AWSTask<AWSSsmGetServiceSettingResult *> *)getServiceSetting:(AWSSsmGetServiceSettingRequest *)request;

/**
 <p><code>ServiceSetting</code> is an account-level setting for an AWS service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an AWS service charges money to the account based on feature or service usage, then the AWS service team might create a default setting of "false". This means the user can't use this feature unless they change the setting to "true" and intentionally opt in for a paid feature.</p><p>Services map a <code>SettingId</code> object to a setting value. AWS services teams define the default value for a <code>SettingId</code>. You can't create a new <code>SettingId</code>, but you can overwrite the default value if you have the <code>ssm:UpdateServiceSetting</code> permission for the setting. Use the <a>UpdateServiceSetting</a> API action to change the default setting. Or use the <a>ResetServiceSetting</a> to change the value back to the original value defined by the AWS service team.</p><p>Query the current service setting for the account. </p>
 
 @param request A container for the necessary parameters to execute the GetServiceSetting service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorServiceSettingNotFound`.
 
 @see AWSSsmGetServiceSettingRequest
 @see AWSSsmGetServiceSettingResult
 */
- (void)getServiceSetting:(AWSSsmGetServiceSettingRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmGetServiceSettingResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>A parameter label is a user-defined alias to help you manage different versions of a parameter. When you modify a parameter, Systems Manager automatically saves a new version and increments the version number by one. A label can help you remember the purpose of a parameter when there are multiple versions. </p><p>Parameter labels have the following requirements and restrictions.</p><ul><li><p>A version of a parameter can have a maximum of 10 labels.</p></li><li><p>You can't attach the same label to different versions of the same parameter. For example, if version 1 has the label Production, then you can't attach Production to version 2.</p></li><li><p>You can move a label from one version of a parameter to another.</p></li><li><p>You can't create a label when you create a new parameter. You must attach a label to a specific version of a parameter.</p></li><li><p>You can't delete a parameter label. If you no longer want to use a parameter label, then you must move it to a different version of a parameter.</p></li><li><p>A label can have a maximum of 100 characters.</p></li><li><p>Labels can contain letters (case sensitive), numbers, periods (.), hyphens (-), or underscores (_).</p></li><li><p>Labels can't begin with a number, "aws," or "ssm" (not case sensitive). If a label fails to meet these requirements, then the label is not associated with a parameter and the system displays it in the list of InvalidLabels.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the LabelParameterVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmLabelParameterVersionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorTooManyUpdates`, `AWSSsmErrorParameterNotFound`, `AWSSsmErrorParameterVersionNotFound`, `AWSSsmErrorParameterVersionLabelLimitExceeded`.
 
 @see AWSSsmLabelParameterVersionRequest
 @see AWSSsmLabelParameterVersionResult
 */
- (AWSTask<AWSSsmLabelParameterVersionResult *> *)labelParameterVersion:(AWSSsmLabelParameterVersionRequest *)request;

/**
 <p>A parameter label is a user-defined alias to help you manage different versions of a parameter. When you modify a parameter, Systems Manager automatically saves a new version and increments the version number by one. A label can help you remember the purpose of a parameter when there are multiple versions. </p><p>Parameter labels have the following requirements and restrictions.</p><ul><li><p>A version of a parameter can have a maximum of 10 labels.</p></li><li><p>You can't attach the same label to different versions of the same parameter. For example, if version 1 has the label Production, then you can't attach Production to version 2.</p></li><li><p>You can move a label from one version of a parameter to another.</p></li><li><p>You can't create a label when you create a new parameter. You must attach a label to a specific version of a parameter.</p></li><li><p>You can't delete a parameter label. If you no longer want to use a parameter label, then you must move it to a different version of a parameter.</p></li><li><p>A label can have a maximum of 100 characters.</p></li><li><p>Labels can contain letters (case sensitive), numbers, periods (.), hyphens (-), or underscores (_).</p></li><li><p>Labels can't begin with a number, "aws," or "ssm" (not case sensitive). If a label fails to meet these requirements, then the label is not associated with a parameter and the system displays it in the list of InvalidLabels.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the LabelParameterVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorTooManyUpdates`, `AWSSsmErrorParameterNotFound`, `AWSSsmErrorParameterVersionNotFound`, `AWSSsmErrorParameterVersionLabelLimitExceeded`.
 
 @see AWSSsmLabelParameterVersionRequest
 @see AWSSsmLabelParameterVersionResult
 */
- (void)labelParameterVersion:(AWSSsmLabelParameterVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmLabelParameterVersionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves all versions of an association for a specific association ID.</p>
 
 @param request A container for the necessary parameters to execute the ListAssociationVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmListAssociationVersionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorAssociationDoesNotExist`.
 
 @see AWSSsmListAssociationVersionsRequest
 @see AWSSsmListAssociationVersionsResult
 */
- (AWSTask<AWSSsmListAssociationVersionsResult *> *)listAssociationVersions:(AWSSsmListAssociationVersionsRequest *)request;

/**
 <p>Retrieves all versions of an association for a specific association ID.</p>
 
 @param request A container for the necessary parameters to execute the ListAssociationVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorAssociationDoesNotExist`.
 
 @see AWSSsmListAssociationVersionsRequest
 @see AWSSsmListAssociationVersionsResult
 */
- (void)listAssociationVersions:(AWSSsmListAssociationVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmListAssociationVersionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns all State Manager associations in the current AWS account and Region. You can limit the results to a specific State Manager association document or instance by specifying a filter.</p>
 
 @param request A container for the necessary parameters to execute the ListAssociations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmListAssociationsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmListAssociationsRequest
 @see AWSSsmListAssociationsResult
 */
- (AWSTask<AWSSsmListAssociationsResult *> *)listAssociations:(AWSSsmListAssociationsRequest *)request;

/**
 <p>Returns all State Manager associations in the current AWS account and Region. You can limit the results to a specific State Manager association document or instance by specifying a filter.</p>
 
 @param request A container for the necessary parameters to execute the ListAssociations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmListAssociationsRequest
 @see AWSSsmListAssociationsResult
 */
- (void)listAssociations:(AWSSsmListAssociationsRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmListAssociationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>An invocation is copy of a command sent to a specific instance. A command can apply to one or more instances. A command invocation applies to one instance. For example, if a user runs SendCommand against three instances, then a command invocation is created for each requested instance ID. ListCommandInvocations provide status about command execution.</p>
 
 @param request A container for the necessary parameters to execute the ListCommandInvocations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmListCommandInvocationsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidCommandId`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInvalidFilterKey`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmListCommandInvocationsRequest
 @see AWSSsmListCommandInvocationsResult
 */
- (AWSTask<AWSSsmListCommandInvocationsResult *> *)listCommandInvocations:(AWSSsmListCommandInvocationsRequest *)request;

/**
 <p>An invocation is copy of a command sent to a specific instance. A command can apply to one or more instances. A command invocation applies to one instance. For example, if a user runs SendCommand against three instances, then a command invocation is created for each requested instance ID. ListCommandInvocations provide status about command execution.</p>
 
 @param request A container for the necessary parameters to execute the ListCommandInvocations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidCommandId`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInvalidFilterKey`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmListCommandInvocationsRequest
 @see AWSSsmListCommandInvocationsResult
 */
- (void)listCommandInvocations:(AWSSsmListCommandInvocationsRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmListCommandInvocationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the commands requested by users of the AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListCommands service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmListCommandsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidCommandId`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInvalidFilterKey`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmListCommandsRequest
 @see AWSSsmListCommandsResult
 */
- (AWSTask<AWSSsmListCommandsResult *> *)listCommands:(AWSSsmListCommandsRequest *)request;

/**
 <p>Lists the commands requested by users of the AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListCommands service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidCommandId`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInvalidFilterKey`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmListCommandsRequest
 @see AWSSsmListCommandsResult
 */
- (void)listCommands:(AWSSsmListCommandsRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmListCommandsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>For a specified resource ID, this API action returns a list of compliance statuses for different resource types. Currently, you can only specify one resource ID per call. List results depend on the criteria specified in the filter.</p>
 
 @param request A container for the necessary parameters to execute the ListComplianceItems service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmListComplianceItemsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidResourceType`, `AWSSsmErrorInvalidResourceId`, `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidFilter`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmListComplianceItemsRequest
 @see AWSSsmListComplianceItemsResult
 */
- (AWSTask<AWSSsmListComplianceItemsResult *> *)listComplianceItems:(AWSSsmListComplianceItemsRequest *)request;

/**
 <p>For a specified resource ID, this API action returns a list of compliance statuses for different resource types. Currently, you can only specify one resource ID per call. List results depend on the criteria specified in the filter.</p>
 
 @param request A container for the necessary parameters to execute the ListComplianceItems service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidResourceType`, `AWSSsmErrorInvalidResourceId`, `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidFilter`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmListComplianceItemsRequest
 @see AWSSsmListComplianceItemsResult
 */
- (void)listComplianceItems:(AWSSsmListComplianceItemsRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmListComplianceItemsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a summary count of compliant and non-compliant resources for a compliance type. For example, this call can return State Manager associations, patches, or custom compliance types according to the filter criteria that you specify.</p>
 
 @param request A container for the necessary parameters to execute the ListComplianceSummaries service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmListComplianceSummariesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidFilter`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmListComplianceSummariesRequest
 @see AWSSsmListComplianceSummariesResult
 */
- (AWSTask<AWSSsmListComplianceSummariesResult *> *)listComplianceSummaries:(AWSSsmListComplianceSummariesRequest *)request;

/**
 <p>Returns a summary count of compliant and non-compliant resources for a compliance type. For example, this call can return State Manager associations, patches, or custom compliance types according to the filter criteria that you specify.</p>
 
 @param request A container for the necessary parameters to execute the ListComplianceSummaries service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidFilter`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmListComplianceSummariesRequest
 @see AWSSsmListComplianceSummariesResult
 */
- (void)listComplianceSummaries:(AWSSsmListComplianceSummariesRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmListComplianceSummariesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List all versions for a document.</p>
 
 @param request A container for the necessary parameters to execute the ListDocumentVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmListDocumentVersionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorInvalidDocument`.
 
 @see AWSSsmListDocumentVersionsRequest
 @see AWSSsmListDocumentVersionsResult
 */
- (AWSTask<AWSSsmListDocumentVersionsResult *> *)listDocumentVersions:(AWSSsmListDocumentVersionsRequest *)request;

/**
 <p>List all versions for a document.</p>
 
 @param request A container for the necessary parameters to execute the ListDocumentVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorInvalidDocument`.
 
 @see AWSSsmListDocumentVersionsRequest
 @see AWSSsmListDocumentVersionsResult
 */
- (void)listDocumentVersions:(AWSSsmListDocumentVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmListDocumentVersionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns all Systems Manager (SSM) documents in the current AWS account and Region. You can limit the results of this request by using a filter.</p>
 
 @param request A container for the necessary parameters to execute the ListDocuments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmListDocumentsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorInvalidFilterKey`.
 
 @see AWSSsmListDocumentsRequest
 @see AWSSsmListDocumentsResult
 */
- (AWSTask<AWSSsmListDocumentsResult *> *)listDocuments:(AWSSsmListDocumentsRequest *)request;

/**
 <p>Returns all Systems Manager (SSM) documents in the current AWS account and Region. You can limit the results of this request by using a filter.</p>
 
 @param request A container for the necessary parameters to execute the ListDocuments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorInvalidFilterKey`.
 
 @see AWSSsmListDocumentsRequest
 @see AWSSsmListDocumentsResult
 */
- (void)listDocuments:(AWSSsmListDocumentsRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmListDocumentsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>A list of inventory items returned by the request.</p>
 
 @param request A container for the necessary parameters to execute the ListInventoryEntries service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmListInventoryEntriesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInvalidTypeName`, `AWSSsmErrorInvalidFilter`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmListInventoryEntriesRequest
 @see AWSSsmListInventoryEntriesResult
 */
- (AWSTask<AWSSsmListInventoryEntriesResult *> *)listInventoryEntries:(AWSSsmListInventoryEntriesRequest *)request;

/**
 <p>A list of inventory items returned by the request.</p>
 
 @param request A container for the necessary parameters to execute the ListInventoryEntries service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInvalidTypeName`, `AWSSsmErrorInvalidFilter`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmListInventoryEntriesRequest
 @see AWSSsmListInventoryEntriesResult
 */
- (void)listInventoryEntries:(AWSSsmListInventoryEntriesRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmListInventoryEntriesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a resource-level summary count. The summary includes information about compliant and non-compliant statuses and detailed compliance-item severity counts, according to the filter criteria you specify.</p>
 
 @param request A container for the necessary parameters to execute the ListResourceComplianceSummaries service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmListResourceComplianceSummariesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidFilter`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmListResourceComplianceSummariesRequest
 @see AWSSsmListResourceComplianceSummariesResult
 */
- (AWSTask<AWSSsmListResourceComplianceSummariesResult *> *)listResourceComplianceSummaries:(AWSSsmListResourceComplianceSummariesRequest *)request;

/**
 <p>Returns a resource-level summary count. The summary includes information about compliant and non-compliant statuses and detailed compliance-item severity counts, according to the filter criteria you specify.</p>
 
 @param request A container for the necessary parameters to execute the ListResourceComplianceSummaries service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidFilter`, `AWSSsmErrorInvalidNextToken`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmListResourceComplianceSummariesRequest
 @see AWSSsmListResourceComplianceSummariesResult
 */
- (void)listResourceComplianceSummaries:(AWSSsmListResourceComplianceSummariesRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmListResourceComplianceSummariesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists your resource data sync configurations. Includes information about the last time a sync attempted to start, the last sync status, and the last time a sync successfully completed.</p><p>The number of sync configurations might be too large to return using a single call to <code>ListResourceDataSync</code>. You can limit the number of sync configurations returned by using the <code>MaxResults</code> parameter. To determine whether there are more sync configurations to list, check the value of <code>NextToken</code> in the output. If there are more sync configurations to list, you can request them by specifying the <code>NextToken</code> returned in the call to the parameter of a subsequent call. </p>
 
 @param request A container for the necessary parameters to execute the ListResourceDataSync service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmListResourceDataSyncResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorResourceDataSyncInvalidConfiguration`, `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmListResourceDataSyncRequest
 @see AWSSsmListResourceDataSyncResult
 */
- (AWSTask<AWSSsmListResourceDataSyncResult *> *)listResourceDataSync:(AWSSsmListResourceDataSyncRequest *)request;

/**
 <p>Lists your resource data sync configurations. Includes information about the last time a sync attempted to start, the last sync status, and the last time a sync successfully completed.</p><p>The number of sync configurations might be too large to return using a single call to <code>ListResourceDataSync</code>. You can limit the number of sync configurations returned by using the <code>MaxResults</code> parameter. To determine whether there are more sync configurations to list, check the value of <code>NextToken</code> in the output. If there are more sync configurations to list, you can request them by specifying the <code>NextToken</code> returned in the call to the parameter of a subsequent call. </p>
 
 @param request A container for the necessary parameters to execute the ListResourceDataSync service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorResourceDataSyncInvalidConfiguration`, `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidNextToken`.
 
 @see AWSSsmListResourceDataSyncRequest
 @see AWSSsmListResourceDataSyncResult
 */
- (void)listResourceDataSync:(AWSSsmListResourceDataSyncRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmListResourceDataSyncResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the tags assigned to the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmListTagsForResourceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidResourceType`, `AWSSsmErrorInvalidResourceId`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmListTagsForResourceRequest
 @see AWSSsmListTagsForResourceResult
 */
- (AWSTask<AWSSsmListTagsForResourceResult *> *)listTagsForResource:(AWSSsmListTagsForResourceRequest *)request;

/**
 <p>Returns a list of the tags assigned to the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidResourceType`, `AWSSsmErrorInvalidResourceId`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmListTagsForResourceRequest
 @see AWSSsmListTagsForResourceResult
 */
- (void)listTagsForResource:(AWSSsmListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmListTagsForResourceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Shares a Systems Manager document publicly or privately. If you share a document privately, you must specify the AWS user account IDs for those people who can use the document. If you share a document publicly, you must specify <i>All</i> as the account ID.</p>
 
 @param request A container for the necessary parameters to execute the ModifyDocumentPermission service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmModifyDocumentPermissionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidPermissionType`, `AWSSsmErrorDocumentPermissionLimit`, `AWSSsmErrorDocumentLimitExceeded`.
 
 @see AWSSsmModifyDocumentPermissionRequest
 @see AWSSsmModifyDocumentPermissionResponse
 */
- (AWSTask<AWSSsmModifyDocumentPermissionResponse *> *)modifyDocumentPermission:(AWSSsmModifyDocumentPermissionRequest *)request;

/**
 <p>Shares a Systems Manager document publicly or privately. If you share a document privately, you must specify the AWS user account IDs for those people who can use the document. If you share a document publicly, you must specify <i>All</i> as the account ID.</p>
 
 @param request A container for the necessary parameters to execute the ModifyDocumentPermission service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidPermissionType`, `AWSSsmErrorDocumentPermissionLimit`, `AWSSsmErrorDocumentLimitExceeded`.
 
 @see AWSSsmModifyDocumentPermissionRequest
 @see AWSSsmModifyDocumentPermissionResponse
 */
- (void)modifyDocumentPermission:(AWSSsmModifyDocumentPermissionRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmModifyDocumentPermissionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers a compliance type and other compliance details on a designated resource. This action lets you register custom compliance details with a resource. This call overwrites existing compliance information on the resource, so you must provide a full list of compliance items each time that you send the request.</p><p>ComplianceType can be one of the following:</p><ul><li><p>ExecutionId: The execution ID when the patch, association, or custom compliance item was applied.</p></li><li><p>ExecutionType: Specify patch, association, or Custom:<code>string</code>.</p></li><li><p>ExecutionTime. The time the patch, association, or custom compliance item was applied to the instance.</p></li><li><p>Id: The patch, association, or custom compliance ID.</p></li><li><p>Title: A title.</p></li><li><p>Status: The status of the compliance item. For example, <code>approved</code> for patches, or <code>Failed</code> for associations.</p></li><li><p>Severity: A patch severity. For example, <code>critical</code>.</p></li><li><p>DocumentName: A SSM document name. For example, AWS-RunPatchBaseline.</p></li><li><p>DocumentVersion: An SSM document version number. For example, 4.</p></li><li><p>Classification: A patch classification. For example, <code>security updates</code>.</p></li><li><p>PatchBaselineId: A patch baseline ID.</p></li><li><p>PatchSeverity: A patch severity. For example, <code>Critical</code>.</p></li><li><p>PatchState: A patch state. For example, <code>InstancesWithFailedPatches</code>.</p></li><li><p>PatchGroup: The name of a patch group.</p></li><li><p>InstalledTime: The time the association, patch, or custom compliance item was applied to the resource. Specify the time by using the following format: yyyy-MM-dd'T'HH:mm:ss'Z'</p></li></ul>
 
 @param request A container for the necessary parameters to execute the PutComplianceItems service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmPutComplianceItemsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidItemContent`, `AWSSsmErrorTotalSizeLimitExceeded`, `AWSSsmErrorItemSizeLimitExceeded`, `AWSSsmErrorComplianceTypeCountLimitExceeded`, `AWSSsmErrorInvalidResourceType`, `AWSSsmErrorInvalidResourceId`.
 
 @see AWSSsmPutComplianceItemsRequest
 @see AWSSsmPutComplianceItemsResult
 */
- (AWSTask<AWSSsmPutComplianceItemsResult *> *)putComplianceItems:(AWSSsmPutComplianceItemsRequest *)request;

/**
 <p>Registers a compliance type and other compliance details on a designated resource. This action lets you register custom compliance details with a resource. This call overwrites existing compliance information on the resource, so you must provide a full list of compliance items each time that you send the request.</p><p>ComplianceType can be one of the following:</p><ul><li><p>ExecutionId: The execution ID when the patch, association, or custom compliance item was applied.</p></li><li><p>ExecutionType: Specify patch, association, or Custom:<code>string</code>.</p></li><li><p>ExecutionTime. The time the patch, association, or custom compliance item was applied to the instance.</p></li><li><p>Id: The patch, association, or custom compliance ID.</p></li><li><p>Title: A title.</p></li><li><p>Status: The status of the compliance item. For example, <code>approved</code> for patches, or <code>Failed</code> for associations.</p></li><li><p>Severity: A patch severity. For example, <code>critical</code>.</p></li><li><p>DocumentName: A SSM document name. For example, AWS-RunPatchBaseline.</p></li><li><p>DocumentVersion: An SSM document version number. For example, 4.</p></li><li><p>Classification: A patch classification. For example, <code>security updates</code>.</p></li><li><p>PatchBaselineId: A patch baseline ID.</p></li><li><p>PatchSeverity: A patch severity. For example, <code>Critical</code>.</p></li><li><p>PatchState: A patch state. For example, <code>InstancesWithFailedPatches</code>.</p></li><li><p>PatchGroup: The name of a patch group.</p></li><li><p>InstalledTime: The time the association, patch, or custom compliance item was applied to the resource. Specify the time by using the following format: yyyy-MM-dd'T'HH:mm:ss'Z'</p></li></ul>
 
 @param request A container for the necessary parameters to execute the PutComplianceItems service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidItemContent`, `AWSSsmErrorTotalSizeLimitExceeded`, `AWSSsmErrorItemSizeLimitExceeded`, `AWSSsmErrorComplianceTypeCountLimitExceeded`, `AWSSsmErrorInvalidResourceType`, `AWSSsmErrorInvalidResourceId`.
 
 @see AWSSsmPutComplianceItemsRequest
 @see AWSSsmPutComplianceItemsResult
 */
- (void)putComplianceItems:(AWSSsmPutComplianceItemsRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmPutComplianceItemsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Bulk update custom inventory items on one more instance. The request adds an inventory item, if it doesn't already exist, or updates an inventory item, if it does exist.</p>
 
 @param request A container for the necessary parameters to execute the PutInventory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmPutInventoryResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInvalidTypeName`, `AWSSsmErrorInvalidItemContent`, `AWSSsmErrorTotalSizeLimitExceeded`, `AWSSsmErrorItemSizeLimitExceeded`, `AWSSsmErrorItemContentMismatch`, `AWSSsmErrorCustomSchemaCountLimitExceeded`, `AWSSsmErrorUnsupportedInventorySchemaVersion`, `AWSSsmErrorUnsupportedInventoryItemContext`, `AWSSsmErrorInvalidInventoryItemContext`, `AWSSsmErrorSubTypeCountLimitExceeded`.
 
 @see AWSSsmPutInventoryRequest
 @see AWSSsmPutInventoryResult
 */
- (AWSTask<AWSSsmPutInventoryResult *> *)putInventory:(AWSSsmPutInventoryRequest *)request;

/**
 <p>Bulk update custom inventory items on one more instance. The request adds an inventory item, if it doesn't already exist, or updates an inventory item, if it does exist.</p>
 
 @param request A container for the necessary parameters to execute the PutInventory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInvalidTypeName`, `AWSSsmErrorInvalidItemContent`, `AWSSsmErrorTotalSizeLimitExceeded`, `AWSSsmErrorItemSizeLimitExceeded`, `AWSSsmErrorItemContentMismatch`, `AWSSsmErrorCustomSchemaCountLimitExceeded`, `AWSSsmErrorUnsupportedInventorySchemaVersion`, `AWSSsmErrorUnsupportedInventoryItemContext`, `AWSSsmErrorInvalidInventoryItemContext`, `AWSSsmErrorSubTypeCountLimitExceeded`.
 
 @see AWSSsmPutInventoryRequest
 @see AWSSsmPutInventoryResult
 */
- (void)putInventory:(AWSSsmPutInventoryRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmPutInventoryResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Add a parameter to the system.</p>
 
 @param request A container for the necessary parameters to execute the PutParameter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmPutParameterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidKeyId`, `AWSSsmErrorParameterLimitExceeded`, `AWSSsmErrorTooManyUpdates`, `AWSSsmErrorParameterAlreadyExists`, `AWSSsmErrorHierarchyLevelLimitExceeded`, `AWSSsmErrorHierarchyTypeMismatch`, `AWSSsmErrorInvalidAllowedPattern`, `AWSSsmErrorParameterMaxVersionLimitExceeded`, `AWSSsmErrorParameterPatternMismatch`, `AWSSsmErrorUnsupportedParameterType`, `AWSSsmErrorPoliciesLimitExceeded`, `AWSSsmErrorInvalidPolicyType`, `AWSSsmErrorInvalidPolicyAttribute`, `AWSSsmErrorIncompatiblePolicy`.
 
 @see AWSSsmPutParameterRequest
 @see AWSSsmPutParameterResult
 */
- (AWSTask<AWSSsmPutParameterResult *> *)putParameter:(AWSSsmPutParameterRequest *)request;

/**
 <p>Add a parameter to the system.</p>
 
 @param request A container for the necessary parameters to execute the PutParameter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidKeyId`, `AWSSsmErrorParameterLimitExceeded`, `AWSSsmErrorTooManyUpdates`, `AWSSsmErrorParameterAlreadyExists`, `AWSSsmErrorHierarchyLevelLimitExceeded`, `AWSSsmErrorHierarchyTypeMismatch`, `AWSSsmErrorInvalidAllowedPattern`, `AWSSsmErrorParameterMaxVersionLimitExceeded`, `AWSSsmErrorParameterPatternMismatch`, `AWSSsmErrorUnsupportedParameterType`, `AWSSsmErrorPoliciesLimitExceeded`, `AWSSsmErrorInvalidPolicyType`, `AWSSsmErrorInvalidPolicyAttribute`, `AWSSsmErrorIncompatiblePolicy`.
 
 @see AWSSsmPutParameterRequest
 @see AWSSsmPutParameterResult
 */
- (void)putParameter:(AWSSsmPutParameterRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmPutParameterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Defines the default patch baseline for the relevant operating system.</p><p>To reset the AWS predefined patch baseline as the default, specify the full patch baseline ARN as the baseline ID value. For example, for CentOS, specify <code>arn:aws:ssm:us-east-2:733109147000:patchbaseline/pb-0574b43a65ea646ed</code> instead of <code>pb-0574b43a65ea646ed</code>.</p>
 
 @param request A container for the necessary parameters to execute the RegisterDefaultPatchBaseline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmRegisterDefaultPatchBaselineResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidResourceId`, `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmRegisterDefaultPatchBaselineRequest
 @see AWSSsmRegisterDefaultPatchBaselineResult
 */
- (AWSTask<AWSSsmRegisterDefaultPatchBaselineResult *> *)registerDefaultPatchBaseline:(AWSSsmRegisterDefaultPatchBaselineRequest *)request;

/**
 <p>Defines the default patch baseline for the relevant operating system.</p><p>To reset the AWS predefined patch baseline as the default, specify the full patch baseline ARN as the baseline ID value. For example, for CentOS, specify <code>arn:aws:ssm:us-east-2:733109147000:patchbaseline/pb-0574b43a65ea646ed</code> instead of <code>pb-0574b43a65ea646ed</code>.</p>
 
 @param request A container for the necessary parameters to execute the RegisterDefaultPatchBaseline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidResourceId`, `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmRegisterDefaultPatchBaselineRequest
 @see AWSSsmRegisterDefaultPatchBaselineResult
 */
- (void)registerDefaultPatchBaseline:(AWSSsmRegisterDefaultPatchBaselineRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmRegisterDefaultPatchBaselineResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers a patch baseline for a patch group.</p>
 
 @param request A container for the necessary parameters to execute the RegisterPatchBaselineForPatchGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmRegisterPatchBaselineForPatchGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorAlreadyExists`, `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInvalidResourceId`, `AWSSsmErrorResourceLimitExceeded`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmRegisterPatchBaselineForPatchGroupRequest
 @see AWSSsmRegisterPatchBaselineForPatchGroupResult
 */
- (AWSTask<AWSSsmRegisterPatchBaselineForPatchGroupResult *> *)registerPatchBaselineForPatchGroup:(AWSSsmRegisterPatchBaselineForPatchGroupRequest *)request;

/**
 <p>Registers a patch baseline for a patch group.</p>
 
 @param request A container for the necessary parameters to execute the RegisterPatchBaselineForPatchGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorAlreadyExists`, `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInvalidResourceId`, `AWSSsmErrorResourceLimitExceeded`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmRegisterPatchBaselineForPatchGroupRequest
 @see AWSSsmRegisterPatchBaselineForPatchGroupResult
 */
- (void)registerPatchBaselineForPatchGroup:(AWSSsmRegisterPatchBaselineForPatchGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmRegisterPatchBaselineForPatchGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers a target with a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the RegisterTargetWithMaintenanceWindow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmRegisterTargetWithMaintenanceWindowResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorIdempotentParameterMismatch`, `AWSSsmErrorDoesNotExist`, `AWSSsmErrorResourceLimitExceeded`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmRegisterTargetWithMaintenanceWindowRequest
 @see AWSSsmRegisterTargetWithMaintenanceWindowResult
 */
- (AWSTask<AWSSsmRegisterTargetWithMaintenanceWindowResult *> *)registerTargetWithMaintenanceWindow:(AWSSsmRegisterTargetWithMaintenanceWindowRequest *)request;

/**
 <p>Registers a target with a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the RegisterTargetWithMaintenanceWindow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorIdempotentParameterMismatch`, `AWSSsmErrorDoesNotExist`, `AWSSsmErrorResourceLimitExceeded`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmRegisterTargetWithMaintenanceWindowRequest
 @see AWSSsmRegisterTargetWithMaintenanceWindowResult
 */
- (void)registerTargetWithMaintenanceWindow:(AWSSsmRegisterTargetWithMaintenanceWindowRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmRegisterTargetWithMaintenanceWindowResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds a new task to a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the RegisterTaskWithMaintenanceWindow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmRegisterTaskWithMaintenanceWindowResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorIdempotentParameterMismatch`, `AWSSsmErrorDoesNotExist`, `AWSSsmErrorResourceLimitExceeded`, `AWSSsmErrorFeatureNotAvailable`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmRegisterTaskWithMaintenanceWindowRequest
 @see AWSSsmRegisterTaskWithMaintenanceWindowResult
 */
- (AWSTask<AWSSsmRegisterTaskWithMaintenanceWindowResult *> *)registerTaskWithMaintenanceWindow:(AWSSsmRegisterTaskWithMaintenanceWindowRequest *)request;

/**
 <p>Adds a new task to a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the RegisterTaskWithMaintenanceWindow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorIdempotentParameterMismatch`, `AWSSsmErrorDoesNotExist`, `AWSSsmErrorResourceLimitExceeded`, `AWSSsmErrorFeatureNotAvailable`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmRegisterTaskWithMaintenanceWindowRequest
 @see AWSSsmRegisterTaskWithMaintenanceWindowResult
 */
- (void)registerTaskWithMaintenanceWindow:(AWSSsmRegisterTaskWithMaintenanceWindowRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmRegisterTaskWithMaintenanceWindowResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes tag keys from the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTagsFromResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmRemoveTagsFromResourceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidResourceType`, `AWSSsmErrorInvalidResourceId`, `AWSSsmErrorInternalServer`, `AWSSsmErrorTooManyUpdates`.
 
 @see AWSSsmRemoveTagsFromResourceRequest
 @see AWSSsmRemoveTagsFromResourceResult
 */
- (AWSTask<AWSSsmRemoveTagsFromResourceResult *> *)removeTagsFromResource:(AWSSsmRemoveTagsFromResourceRequest *)request;

/**
 <p>Removes tag keys from the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTagsFromResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidResourceType`, `AWSSsmErrorInvalidResourceId`, `AWSSsmErrorInternalServer`, `AWSSsmErrorTooManyUpdates`.
 
 @see AWSSsmRemoveTagsFromResourceRequest
 @see AWSSsmRemoveTagsFromResourceResult
 */
- (void)removeTagsFromResource:(AWSSsmRemoveTagsFromResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmRemoveTagsFromResourceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p><code>ServiceSetting</code> is an account-level setting for an AWS service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an AWS service charges money to the account based on feature or service usage, then the AWS service team might create a default setting of "false". This means the user can't use this feature unless they change the setting to "true" and intentionally opt in for a paid feature.</p><p>Services map a <code>SettingId</code> object to a setting value. AWS services teams define the default value for a <code>SettingId</code>. You can't create a new <code>SettingId</code>, but you can overwrite the default value if you have the <code>ssm:UpdateServiceSetting</code> permission for the setting. Use the <a>GetServiceSetting</a> API action to view the current value. Use the <a>UpdateServiceSetting</a> API action to change the default setting. </p><p>Reset the service setting for the account to the default value as provisioned by the AWS service team. </p>
 
 @param request A container for the necessary parameters to execute the ResetServiceSetting service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmResetServiceSettingResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorServiceSettingNotFound`, `AWSSsmErrorTooManyUpdates`.
 
 @see AWSSsmResetServiceSettingRequest
 @see AWSSsmResetServiceSettingResult
 */
- (AWSTask<AWSSsmResetServiceSettingResult *> *)resetServiceSetting:(AWSSsmResetServiceSettingRequest *)request;

/**
 <p><code>ServiceSetting</code> is an account-level setting for an AWS service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an AWS service charges money to the account based on feature or service usage, then the AWS service team might create a default setting of "false". This means the user can't use this feature unless they change the setting to "true" and intentionally opt in for a paid feature.</p><p>Services map a <code>SettingId</code> object to a setting value. AWS services teams define the default value for a <code>SettingId</code>. You can't create a new <code>SettingId</code>, but you can overwrite the default value if you have the <code>ssm:UpdateServiceSetting</code> permission for the setting. Use the <a>GetServiceSetting</a> API action to view the current value. Use the <a>UpdateServiceSetting</a> API action to change the default setting. </p><p>Reset the service setting for the account to the default value as provisioned by the AWS service team. </p>
 
 @param request A container for the necessary parameters to execute the ResetServiceSetting service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorServiceSettingNotFound`, `AWSSsmErrorTooManyUpdates`.
 
 @see AWSSsmResetServiceSettingRequest
 @see AWSSsmResetServiceSettingResult
 */
- (void)resetServiceSetting:(AWSSsmResetServiceSettingRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmResetServiceSettingResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Reconnects a session to an instance after it has been disconnected. Connections can be resumed for disconnected sessions, but not terminated sessions.</p><note><p>This command is primarily for use by client machines to automatically reconnect during intermittent network issues. It is not intended for any other use.</p></note>
 
 @param request A container for the necessary parameters to execute the ResumeSession service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmResumeSessionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmResumeSessionRequest
 @see AWSSsmResumeSessionResponse
 */
- (AWSTask<AWSSsmResumeSessionResponse *> *)resumeSession:(AWSSsmResumeSessionRequest *)request;

/**
 <p>Reconnects a session to an instance after it has been disconnected. Connections can be resumed for disconnected sessions, but not terminated sessions.</p><note><p>This command is primarily for use by client machines to automatically reconnect during intermittent network issues. It is not intended for any other use.</p></note>
 
 @param request A container for the necessary parameters to execute the ResumeSession service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmResumeSessionRequest
 @see AWSSsmResumeSessionResponse
 */
- (void)resumeSession:(AWSSsmResumeSessionRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmResumeSessionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sends a signal to an Automation execution to change the current behavior or status of the execution. </p>
 
 @param request A container for the necessary parameters to execute the SendAutomationSignal service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmSendAutomationSignalResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorAutomationExecutionNotFound`, `AWSSsmErrorAutomationStepNotFound`, `AWSSsmErrorInvalidAutomationSignal`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmSendAutomationSignalRequest
 @see AWSSsmSendAutomationSignalResult
 */
- (AWSTask<AWSSsmSendAutomationSignalResult *> *)sendAutomationSignal:(AWSSsmSendAutomationSignalRequest *)request;

/**
 <p>Sends a signal to an Automation execution to change the current behavior or status of the execution. </p>
 
 @param request A container for the necessary parameters to execute the SendAutomationSignal service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorAutomationExecutionNotFound`, `AWSSsmErrorAutomationStepNotFound`, `AWSSsmErrorInvalidAutomationSignal`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmSendAutomationSignalRequest
 @see AWSSsmSendAutomationSignalResult
 */
- (void)sendAutomationSignal:(AWSSsmSendAutomationSignalRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmSendAutomationSignalResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Runs commands on one or more managed instances.</p>
 
 @param request A container for the necessary parameters to execute the SendCommand service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmSendCommandResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDuplicateInstanceId`, `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidDocumentVersion`, `AWSSsmErrorInvalidOutputFolder`, `AWSSsmErrorInvalidParameters`, `AWSSsmErrorUnsupportedPlatformType`, `AWSSsmErrorMaxDocumentSizeExceeded`, `AWSSsmErrorInvalidRole`, `AWSSsmErrorInvalidNotificationConfig`.
 
 @see AWSSsmSendCommandRequest
 @see AWSSsmSendCommandResult
 */
- (AWSTask<AWSSsmSendCommandResult *> *)sendCommand:(AWSSsmSendCommandRequest *)request;

/**
 <p>Runs commands on one or more managed instances.</p>
 
 @param request A container for the necessary parameters to execute the SendCommand service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDuplicateInstanceId`, `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidDocumentVersion`, `AWSSsmErrorInvalidOutputFolder`, `AWSSsmErrorInvalidParameters`, `AWSSsmErrorUnsupportedPlatformType`, `AWSSsmErrorMaxDocumentSizeExceeded`, `AWSSsmErrorInvalidRole`, `AWSSsmErrorInvalidNotificationConfig`.
 
 @see AWSSsmSendCommandRequest
 @see AWSSsmSendCommandResult
 */
- (void)sendCommand:(AWSSsmSendCommandRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmSendCommandResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Use this API action to run an association immediately and only one time. This action can be helpful when troubleshooting associations.</p>
 
 @param request A container for the necessary parameters to execute the StartAssociationsOnce service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmStartAssociationsOnceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidAssociation`, `AWSSsmErrorAssociationDoesNotExist`.
 
 @see AWSSsmStartAssociationsOnceRequest
 @see AWSSsmStartAssociationsOnceResult
 */
- (AWSTask<AWSSsmStartAssociationsOnceResult *> *)startAssociationsOnce:(AWSSsmStartAssociationsOnceRequest *)request;

/**
 <p>Use this API action to run an association immediately and only one time. This action can be helpful when troubleshooting associations.</p>
 
 @param request A container for the necessary parameters to execute the StartAssociationsOnce service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidAssociation`, `AWSSsmErrorAssociationDoesNotExist`.
 
 @see AWSSsmStartAssociationsOnceRequest
 @see AWSSsmStartAssociationsOnceResult
 */
- (void)startAssociationsOnce:(AWSSsmStartAssociationsOnceRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmStartAssociationsOnceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates execution of an Automation document.</p>
 
 @param request A container for the necessary parameters to execute the StartAutomationExecution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmStartAutomationExecutionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorAutomationDefinitionNotFound`, `AWSSsmErrorInvalidAutomationExecutionParameters`, `AWSSsmErrorAutomationExecutionLimitExceeded`, `AWSSsmErrorAutomationDefinitionVersionNotFound`, `AWSSsmErrorIdempotentParameterMismatch`, `AWSSsmErrorInvalidTarget`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmStartAutomationExecutionRequest
 @see AWSSsmStartAutomationExecutionResult
 */
- (AWSTask<AWSSsmStartAutomationExecutionResult *> *)startAutomationExecution:(AWSSsmStartAutomationExecutionRequest *)request;

/**
 <p>Initiates execution of an Automation document.</p>
 
 @param request A container for the necessary parameters to execute the StartAutomationExecution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorAutomationDefinitionNotFound`, `AWSSsmErrorInvalidAutomationExecutionParameters`, `AWSSsmErrorAutomationExecutionLimitExceeded`, `AWSSsmErrorAutomationDefinitionVersionNotFound`, `AWSSsmErrorIdempotentParameterMismatch`, `AWSSsmErrorInvalidTarget`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmStartAutomationExecutionRequest
 @see AWSSsmStartAutomationExecutionResult
 */
- (void)startAutomationExecution:(AWSSsmStartAutomationExecutionRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmStartAutomationExecutionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates a connection to a target (for example, an instance) for a Session Manager session. Returns a URL and token that can be used to open a WebSocket connection for sending input and receiving outputs.</p><note><p>AWS CLI usage: <code>start-session</code> is an interactive command that requires the Session Manager plugin to be installed on the client machine making the call. For information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html">Install the Session Manager plugin for the AWS CLI</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>AWS Tools for PowerShell usage: Start-SSMSession is not currently supported by AWS Tools for PowerShell on Windows local machines.</p></note>
 
 @param request A container for the necessary parameters to execute the StartSession service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmStartSessionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidDocument`, `AWSSsmErrorTargetNotConnected`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmStartSessionRequest
 @see AWSSsmStartSessionResponse
 */
- (AWSTask<AWSSsmStartSessionResponse *> *)startSession:(AWSSsmStartSessionRequest *)request;

/**
 <p>Initiates a connection to a target (for example, an instance) for a Session Manager session. Returns a URL and token that can be used to open a WebSocket connection for sending input and receiving outputs.</p><note><p>AWS CLI usage: <code>start-session</code> is an interactive command that requires the Session Manager plugin to be installed on the client machine making the call. For information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html">Install the Session Manager plugin for the AWS CLI</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>AWS Tools for PowerShell usage: Start-SSMSession is not currently supported by AWS Tools for PowerShell on Windows local machines.</p></note>
 
 @param request A container for the necessary parameters to execute the StartSession service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidDocument`, `AWSSsmErrorTargetNotConnected`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmStartSessionRequest
 @see AWSSsmStartSessionResponse
 */
- (void)startSession:(AWSSsmStartSessionRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmStartSessionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stop an Automation that is currently running.</p>
 
 @param request A container for the necessary parameters to execute the StopAutomationExecution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmStopAutomationExecutionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorAutomationExecutionNotFound`, `AWSSsmErrorInvalidAutomationStatusUpdate`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmStopAutomationExecutionRequest
 @see AWSSsmStopAutomationExecutionResult
 */
- (AWSTask<AWSSsmStopAutomationExecutionResult *> *)stopAutomationExecution:(AWSSsmStopAutomationExecutionRequest *)request;

/**
 <p>Stop an Automation that is currently running.</p>
 
 @param request A container for the necessary parameters to execute the StopAutomationExecution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorAutomationExecutionNotFound`, `AWSSsmErrorInvalidAutomationStatusUpdate`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmStopAutomationExecutionRequest
 @see AWSSsmStopAutomationExecutionResult
 */
- (void)stopAutomationExecution:(AWSSsmStopAutomationExecutionRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmStopAutomationExecutionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Permanently ends a session and closes the data connection between the Session Manager client and SSM Agent on the instance. A terminated session cannot be resumed.</p>
 
 @param request A container for the necessary parameters to execute the TerminateSession service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmTerminateSessionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmTerminateSessionRequest
 @see AWSSsmTerminateSessionResponse
 */
- (AWSTask<AWSSsmTerminateSessionResponse *> *)terminateSession:(AWSSsmTerminateSessionRequest *)request;

/**
 <p>Permanently ends a session and closes the data connection between the Session Manager client and SSM Agent on the instance. A terminated session cannot be resumed.</p>
 
 @param request A container for the necessary parameters to execute the TerminateSession service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmTerminateSessionRequest
 @see AWSSsmTerminateSessionResponse
 */
- (void)terminateSession:(AWSSsmTerminateSessionRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmTerminateSessionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an association. You can update the association name and version, the document version, schedule, parameters, and Amazon S3 output. </p><p>In order to call this API action, your IAM user account, group, or role must be configured with permission to call the <a>DescribeAssociation</a> API action. If you don't have permission to call DescribeAssociation, then you receive the following error: <code>An error occurred (AccessDeniedException) when calling the UpdateAssociation operation: User: &lt;user_arn&gt; is not authorized to perform: ssm:DescribeAssociation on resource: &lt;resource_arn&gt;</code></p><important><p>When you update an association, the association immediately runs against the specified targets.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmUpdateAssociationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidSchedule`, `AWSSsmErrorInvalidParameters`, `AWSSsmErrorInvalidOutputLocation`, `AWSSsmErrorInvalidDocumentVersion`, `AWSSsmErrorAssociationDoesNotExist`, `AWSSsmErrorInvalidUpdate`, `AWSSsmErrorTooManyUpdates`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidTarget`, `AWSSsmErrorInvalidAssociationVersion`, `AWSSsmErrorAssociationVersionLimitExceeded`.
 
 @see AWSSsmUpdateAssociationRequest
 @see AWSSsmUpdateAssociationResult
 */
- (AWSTask<AWSSsmUpdateAssociationResult *> *)updateAssociation:(AWSSsmUpdateAssociationRequest *)request;

/**
 <p>Updates an association. You can update the association name and version, the document version, schedule, parameters, and Amazon S3 output. </p><p>In order to call this API action, your IAM user account, group, or role must be configured with permission to call the <a>DescribeAssociation</a> API action. If you don't have permission to call DescribeAssociation, then you receive the following error: <code>An error occurred (AccessDeniedException) when calling the UpdateAssociation operation: User: &lt;user_arn&gt; is not authorized to perform: ssm:DescribeAssociation on resource: &lt;resource_arn&gt;</code></p><important><p>When you update an association, the association immediately runs against the specified targets.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidSchedule`, `AWSSsmErrorInvalidParameters`, `AWSSsmErrorInvalidOutputLocation`, `AWSSsmErrorInvalidDocumentVersion`, `AWSSsmErrorAssociationDoesNotExist`, `AWSSsmErrorInvalidUpdate`, `AWSSsmErrorTooManyUpdates`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidTarget`, `AWSSsmErrorInvalidAssociationVersion`, `AWSSsmErrorAssociationVersionLimitExceeded`.
 
 @see AWSSsmUpdateAssociationRequest
 @see AWSSsmUpdateAssociationResult
 */
- (void)updateAssociation:(AWSSsmUpdateAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmUpdateAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the status of the Systems Manager document associated with the specified instance.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAssociationStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmUpdateAssociationStatusResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorAssociationDoesNotExist`, `AWSSsmErrorStatusUnchanged`, `AWSSsmErrorTooManyUpdates`.
 
 @see AWSSsmUpdateAssociationStatusRequest
 @see AWSSsmUpdateAssociationStatusResult
 */
- (AWSTask<AWSSsmUpdateAssociationStatusResult *> *)updateAssociationStatus:(AWSSsmUpdateAssociationStatusRequest *)request;

/**
 <p>Updates the status of the Systems Manager document associated with the specified instance.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAssociationStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorAssociationDoesNotExist`, `AWSSsmErrorStatusUnchanged`, `AWSSsmErrorTooManyUpdates`.
 
 @see AWSSsmUpdateAssociationStatusRequest
 @see AWSSsmUpdateAssociationStatusResult
 */
- (void)updateAssociationStatus:(AWSSsmUpdateAssociationStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmUpdateAssociationStatusResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates one or more values for an SSM document.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDocument service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmUpdateDocumentResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorMaxDocumentSizeExceeded`, `AWSSsmErrorDocumentVersionLimitExceeded`, `AWSSsmErrorInternalServer`, `AWSSsmErrorDuplicateDocumentContent`, `AWSSsmErrorDuplicateDocumentVersionName`, `AWSSsmErrorInvalidDocumentContent`, `AWSSsmErrorInvalidDocumentVersion`, `AWSSsmErrorInvalidDocumentSchemaVersion`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidDocumentOperation`.
 
 @see AWSSsmUpdateDocumentRequest
 @see AWSSsmUpdateDocumentResult
 */
- (AWSTask<AWSSsmUpdateDocumentResult *> *)updateDocument:(AWSSsmUpdateDocumentRequest *)request;

/**
 <p>Updates one or more values for an SSM document.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDocument service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorMaxDocumentSizeExceeded`, `AWSSsmErrorDocumentVersionLimitExceeded`, `AWSSsmErrorInternalServer`, `AWSSsmErrorDuplicateDocumentContent`, `AWSSsmErrorDuplicateDocumentVersionName`, `AWSSsmErrorInvalidDocumentContent`, `AWSSsmErrorInvalidDocumentVersion`, `AWSSsmErrorInvalidDocumentSchemaVersion`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidDocumentOperation`.
 
 @see AWSSsmUpdateDocumentRequest
 @see AWSSsmUpdateDocumentResult
 */
- (void)updateDocument:(AWSSsmUpdateDocumentRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmUpdateDocumentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Set the default version of a document. </p>
 
 @param request A container for the necessary parameters to execute the UpdateDocumentDefaultVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmUpdateDocumentDefaultVersionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidDocumentVersion`, `AWSSsmErrorInvalidDocumentSchemaVersion`.
 
 @see AWSSsmUpdateDocumentDefaultVersionRequest
 @see AWSSsmUpdateDocumentDefaultVersionResult
 */
- (AWSTask<AWSSsmUpdateDocumentDefaultVersionResult *> *)updateDocumentDefaultVersion:(AWSSsmUpdateDocumentDefaultVersionRequest *)request;

/**
 <p>Set the default version of a document. </p>
 
 @param request A container for the necessary parameters to execute the UpdateDocumentDefaultVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorInvalidDocument`, `AWSSsmErrorInvalidDocumentVersion`, `AWSSsmErrorInvalidDocumentSchemaVersion`.
 
 @see AWSSsmUpdateDocumentDefaultVersionRequest
 @see AWSSsmUpdateDocumentDefaultVersionResult
 */
- (void)updateDocumentDefaultVersion:(AWSSsmUpdateDocumentDefaultVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmUpdateDocumentDefaultVersionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing maintenance window. Only specified parameters are modified.</p><note><p>The value you specify for <code>Duration</code> determines the specific end time for the maintenance window based on the time it begins. No maintenance window tasks are permitted to start after the resulting endtime minus the number of hours you specify for <code>Cutoff</code>. For example, if the maintenance window starts at 3 PM, the duration is three hours, and the value you specify for <code>Cutoff</code> is one hour, no maintenance window tasks can start after 5 PM.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateMaintenanceWindow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmUpdateMaintenanceWindowResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmUpdateMaintenanceWindowRequest
 @see AWSSsmUpdateMaintenanceWindowResult
 */
- (AWSTask<AWSSsmUpdateMaintenanceWindowResult *> *)updateMaintenanceWindow:(AWSSsmUpdateMaintenanceWindowRequest *)request;

/**
 <p>Updates an existing maintenance window. Only specified parameters are modified.</p><note><p>The value you specify for <code>Duration</code> determines the specific end time for the maintenance window based on the time it begins. No maintenance window tasks are permitted to start after the resulting endtime minus the number of hours you specify for <code>Cutoff</code>. For example, if the maintenance window starts at 3 PM, the duration is three hours, and the value you specify for <code>Cutoff</code> is one hour, no maintenance window tasks can start after 5 PM.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateMaintenanceWindow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmUpdateMaintenanceWindowRequest
 @see AWSSsmUpdateMaintenanceWindowResult
 */
- (void)updateMaintenanceWindow:(AWSSsmUpdateMaintenanceWindowRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmUpdateMaintenanceWindowResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the target of an existing maintenance window. You can change the following:</p><ul><li><p>Name</p></li><li><p>Description</p></li><li><p>Owner</p></li><li><p>IDs for an ID target</p></li><li><p>Tags for a Tag target</p></li><li><p>From any supported tag type to another. The three supported tag types are ID target, Tag target, and resource group. For more information, see <a>Target</a>.</p></li></ul><note><p>If a parameter is null, then the corresponding field is not modified.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateMaintenanceWindowTarget service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmUpdateMaintenanceWindowTargetResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmUpdateMaintenanceWindowTargetRequest
 @see AWSSsmUpdateMaintenanceWindowTargetResult
 */
- (AWSTask<AWSSsmUpdateMaintenanceWindowTargetResult *> *)updateMaintenanceWindowTarget:(AWSSsmUpdateMaintenanceWindowTargetRequest *)request;

/**
 <p>Modifies the target of an existing maintenance window. You can change the following:</p><ul><li><p>Name</p></li><li><p>Description</p></li><li><p>Owner</p></li><li><p>IDs for an ID target</p></li><li><p>Tags for a Tag target</p></li><li><p>From any supported tag type to another. The three supported tag types are ID target, Tag target, and resource group. For more information, see <a>Target</a>.</p></li></ul><note><p>If a parameter is null, then the corresponding field is not modified.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateMaintenanceWindowTarget service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmUpdateMaintenanceWindowTargetRequest
 @see AWSSsmUpdateMaintenanceWindowTargetResult
 */
- (void)updateMaintenanceWindowTarget:(AWSSsmUpdateMaintenanceWindowTargetRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmUpdateMaintenanceWindowTargetResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies a task assigned to a maintenance window. You can't change the task type, but you can change the following values:</p><ul><li><p>TaskARN. For example, you can change a RUN_COMMAND task from AWS-RunPowerShellScript to AWS-RunShellScript.</p></li><li><p>ServiceRoleArn</p></li><li><p>TaskInvocationParameters</p></li><li><p>Priority</p></li><li><p>MaxConcurrency</p></li><li><p>MaxErrors</p></li></ul><p>If a parameter is null, then the corresponding field is not modified. Also, if you set Replace to true, then all fields required by the <a>RegisterTaskWithMaintenanceWindow</a> action are required for this request. Optional fields that aren't specified are set to null.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMaintenanceWindowTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmUpdateMaintenanceWindowTaskResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmUpdateMaintenanceWindowTaskRequest
 @see AWSSsmUpdateMaintenanceWindowTaskResult
 */
- (AWSTask<AWSSsmUpdateMaintenanceWindowTaskResult *> *)updateMaintenanceWindowTask:(AWSSsmUpdateMaintenanceWindowTaskRequest *)request;

/**
 <p>Modifies a task assigned to a maintenance window. You can't change the task type, but you can change the following values:</p><ul><li><p>TaskARN. For example, you can change a RUN_COMMAND task from AWS-RunPowerShellScript to AWS-RunShellScript.</p></li><li><p>ServiceRoleArn</p></li><li><p>TaskInvocationParameters</p></li><li><p>Priority</p></li><li><p>MaxConcurrency</p></li><li><p>MaxErrors</p></li></ul><p>If a parameter is null, then the corresponding field is not modified. Also, if you set Replace to true, then all fields required by the <a>RegisterTaskWithMaintenanceWindow</a> action are required for this request. Optional fields that aren't specified are set to null.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMaintenanceWindowTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmUpdateMaintenanceWindowTaskRequest
 @see AWSSsmUpdateMaintenanceWindowTaskResult
 */
- (void)updateMaintenanceWindowTask:(AWSSsmUpdateMaintenanceWindowTaskRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmUpdateMaintenanceWindowTaskResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Changes the Amazon Identity and Access Management (IAM) role that is assigned to the on-premises instance or virtual machines (VM). IAM roles are first assigned to these hybrid instances during the activation process. For more information, see <a>CreateActivation</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateManagedInstanceRole service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmUpdateManagedInstanceRoleResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmUpdateManagedInstanceRoleRequest
 @see AWSSsmUpdateManagedInstanceRoleResult
 */
- (AWSTask<AWSSsmUpdateManagedInstanceRoleResult *> *)updateManagedInstanceRole:(AWSSsmUpdateManagedInstanceRoleRequest *)request;

/**
 <p>Changes the Amazon Identity and Access Management (IAM) role that is assigned to the on-premises instance or virtual machines (VM). IAM roles are first assigned to these hybrid instances during the activation process. For more information, see <a>CreateActivation</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateManagedInstanceRole service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInvalidInstanceId`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmUpdateManagedInstanceRoleRequest
 @see AWSSsmUpdateManagedInstanceRoleResult
 */
- (void)updateManagedInstanceRole:(AWSSsmUpdateManagedInstanceRoleRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmUpdateManagedInstanceRoleResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Edit or change an OpsItem. You must have permission in AWS Identity and Access Management (IAM) to update an OpsItem. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the UpdateOpsItem service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmUpdateOpsItemResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorOpsItemNotFound`, `AWSSsmErrorOpsItemAlreadyExists`, `AWSSsmErrorOpsItemLimitExceeded`, `AWSSsmErrorOpsItemInvalidParameter`.
 
 @see AWSSsmUpdateOpsItemRequest
 @see AWSSsmUpdateOpsItemResponse
 */
- (AWSTask<AWSSsmUpdateOpsItemResponse *> *)updateOpsItem:(AWSSsmUpdateOpsItemRequest *)request;

/**
 <p>Edit or change an OpsItem. You must have permission in AWS Identity and Access Management (IAM) to update an OpsItem. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the UpdateOpsItem service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorOpsItemNotFound`, `AWSSsmErrorOpsItemAlreadyExists`, `AWSSsmErrorOpsItemLimitExceeded`, `AWSSsmErrorOpsItemInvalidParameter`.
 
 @see AWSSsmUpdateOpsItemRequest
 @see AWSSsmUpdateOpsItemResponse
 */
- (void)updateOpsItem:(AWSSsmUpdateOpsItemRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmUpdateOpsItemResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies an existing patch baseline. Fields not specified in the request are left unchanged.</p><note><p>For information about valid key and value pairs in <code>PatchFilters</code> for each supported operating system type, see <a href="http://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html">PatchFilter</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdatePatchBaseline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmUpdatePatchBaselineResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmUpdatePatchBaselineRequest
 @see AWSSsmUpdatePatchBaselineResult
 */
- (AWSTask<AWSSsmUpdatePatchBaselineResult *> *)updatePatchBaseline:(AWSSsmUpdatePatchBaselineRequest *)request;

/**
 <p>Modifies an existing patch baseline. Fields not specified in the request are left unchanged.</p><note><p>For information about valid key and value pairs in <code>PatchFilters</code> for each supported operating system type, see <a href="http://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html">PatchFilter</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdatePatchBaseline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorDoesNotExist`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmUpdatePatchBaselineRequest
 @see AWSSsmUpdatePatchBaselineResult
 */
- (void)updatePatchBaseline:(AWSSsmUpdatePatchBaselineRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmUpdatePatchBaselineResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Update a resource data sync. After you create a resource data sync for a Region, you can't change the account options for that sync. For example, if you create a sync in the us-east-2 (Ohio) Region and you choose the Include only the current account option, you can't edit that sync later and choose the Include all accounts from my AWS Organizations configuration option. Instead, you must delete the first resource data sync, and create a new one.</p><note><p>This API action only supports a resource data sync that was created with a SyncFromSource <code>SyncType</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateResourceDataSync service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmUpdateResourceDataSyncResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorResourceDataSyncNotFound`, `AWSSsmErrorResourceDataSyncInvalidConfiguration`, `AWSSsmErrorResourceDataSyncConflict`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmUpdateResourceDataSyncRequest
 @see AWSSsmUpdateResourceDataSyncResult
 */
- (AWSTask<AWSSsmUpdateResourceDataSyncResult *> *)updateResourceDataSync:(AWSSsmUpdateResourceDataSyncRequest *)request;

/**
 <p>Update a resource data sync. After you create a resource data sync for a Region, you can't change the account options for that sync. For example, if you create a sync in the us-east-2 (Ohio) Region and you choose the Include only the current account option, you can't edit that sync later and choose the Include all accounts from my AWS Organizations configuration option. Instead, you must delete the first resource data sync, and create a new one.</p><note><p>This API action only supports a resource data sync that was created with a SyncFromSource <code>SyncType</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateResourceDataSync service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorResourceDataSyncNotFound`, `AWSSsmErrorResourceDataSyncInvalidConfiguration`, `AWSSsmErrorResourceDataSyncConflict`, `AWSSsmErrorInternalServer`.
 
 @see AWSSsmUpdateResourceDataSyncRequest
 @see AWSSsmUpdateResourceDataSyncResult
 */
- (void)updateResourceDataSync:(AWSSsmUpdateResourceDataSyncRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmUpdateResourceDataSyncResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p><code>ServiceSetting</code> is an account-level setting for an AWS service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an AWS service charges money to the account based on feature or service usage, then the AWS service team might create a default setting of "false". This means the user can't use this feature unless they change the setting to "true" and intentionally opt in for a paid feature.</p><p>Services map a <code>SettingId</code> object to a setting value. AWS services teams define the default value for a <code>SettingId</code>. You can't create a new <code>SettingId</code>, but you can overwrite the default value if you have the <code>ssm:UpdateServiceSetting</code> permission for the setting. Use the <a>GetServiceSetting</a> API action to view the current value. Or, use the <a>ResetServiceSetting</a> to change the value back to the original value defined by the AWS service team.</p><p>Update the service setting for the account. </p>
 
 @param request A container for the necessary parameters to execute the UpdateServiceSetting service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSsmUpdateServiceSettingResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorServiceSettingNotFound`, `AWSSsmErrorTooManyUpdates`.
 
 @see AWSSsmUpdateServiceSettingRequest
 @see AWSSsmUpdateServiceSettingResult
 */
- (AWSTask<AWSSsmUpdateServiceSettingResult *> *)updateServiceSetting:(AWSSsmUpdateServiceSettingRequest *)request;

/**
 <p><code>ServiceSetting</code> is an account-level setting for an AWS service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an AWS service charges money to the account based on feature or service usage, then the AWS service team might create a default setting of "false". This means the user can't use this feature unless they change the setting to "true" and intentionally opt in for a paid feature.</p><p>Services map a <code>SettingId</code> object to a setting value. AWS services teams define the default value for a <code>SettingId</code>. You can't create a new <code>SettingId</code>, but you can overwrite the default value if you have the <code>ssm:UpdateServiceSetting</code> permission for the setting. Use the <a>GetServiceSetting</a> API action to view the current value. Or, use the <a>ResetServiceSetting</a> to change the value back to the original value defined by the AWS service team.</p><p>Update the service setting for the account. </p>
 
 @param request A container for the necessary parameters to execute the UpdateServiceSetting service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSsmErrorDomain` domain and the following error code: `AWSSsmErrorInternalServer`, `AWSSsmErrorServiceSettingNotFound`, `AWSSsmErrorTooManyUpdates`.
 
 @see AWSSsmUpdateServiceSettingRequest
 @see AWSSsmUpdateServiceSettingResult
 */
- (void)updateServiceSetting:(AWSSsmUpdateServiceSettingRequest *)request completionHandler:(void (^ _Nullable)(AWSSsmUpdateServiceSettingResult * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
