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
#import "AWSSimpleSystemsManagerModel.h"
#import "AWSSimpleSystemsManagerResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSSimpleSystemsManager
FOUNDATION_EXPORT NSString *const AWSSimpleSystemsManagerSDKVersion;

/**
 <fullname>AWS Systems Manager</fullname><p>AWS Systems Manager is a collection of capabilities that helps you automate management tasks such as collecting system inventory, applying operating system (OS) patches, automating the creation of Amazon Machine Images (AMIs), and configuring operating systems (OSs) and applications at scale. Systems Manager lets you remotely and securely manage the configuration of your managed instances. A <i>managed instance</i> is any Amazon Elastic Compute Cloud instance (EC2 instance), or any on-premises server or virtual machine (VM) in your hybrid environment that has been configured for Systems Manager.</p><p>This reference is intended to be used with the <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/">AWS Systems Manager User Guide</a>.</p><p>To get started, verify prerequisites and configure managed instances. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-setting-up.html">Setting up AWS Systems Manager</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>For information about other API actions you can perform on EC2 instances, see the <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/">Amazon EC2 API Reference</a>. For information about how to use a Query API, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/making-api-requests.html">Making API requests</a>. </p>
 */
@interface AWSSimpleSystemsManager : AWSService

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

     let SimpleSystemsManager = AWSSimpleSystemsManager.default()

 *Objective-C*

     AWSSimpleSystemsManager *SimpleSystemsManager = [AWSSimpleSystemsManager defaultSimpleSystemsManager];

 @return The default service client.
 */
+ (instancetype)defaultSimpleSystemsManager;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSimpleSystemsManager.register(with: configuration!, forKey: "USWest2SimpleSystemsManager")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:@"USWest2SimpleSystemsManager"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let SimpleSystemsManager = AWSSimpleSystemsManager(forKey: "USWest2SimpleSystemsManager")

 *Objective-C*

     AWSSimpleSystemsManager *SimpleSystemsManager = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:@"USWest2SimpleSystemsManager"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerSimpleSystemsManagerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerSimpleSystemsManagerWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSimpleSystemsManager.register(with: configuration!, forKey: "USWest2SimpleSystemsManager")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:@"USWest2SimpleSystemsManager"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let SimpleSystemsManager = AWSSimpleSystemsManager(forKey: "USWest2SimpleSystemsManager")

 *Objective-C*

     AWSSimpleSystemsManager *SimpleSystemsManager = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:@"USWest2SimpleSystemsManager"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)SimpleSystemsManagerForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeSimpleSystemsManagerForKey:(NSString *)key;

/**
 <p>Adds or overwrites one or more tags for the specified resource. Tags are metadata that you can assign to your documents, managed instances, maintenance windows, Parameter Store parameters, and patch baselines. Tags enable you to categorize your resources in different ways, for example, by purpose, owner, or environment. Each tag consists of a key and an optional value, both of which you define. For example, you could define a set of tags for your account's managed instances that helps you track each instance's owner and stack level. For example: Key=Owner and Value=DbAdmin, SysAdmin, or Dev. Or Key=Stack and Value=Production, Pre-Production, or Test.</p><p>Each resource can have a maximum of 50 tags. </p><p>We recommend that you devise a set of tag keys that meets your needs for each resource type. Using a consistent set of tag keys makes it easier for you to manage your resources. You can search and filter the resources based on the tags you add. Tags don't have any semantic meaning to and are interpreted strictly as a string of characters. </p><p>For more information about using tags with EC2 instances, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging your Amazon EC2 resources</a> in the <i>Amazon EC2 User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AddTagsToResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerAddTagsToResourceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidResourceType`, `AWSSimpleSystemsManagerErrorInvalidResourceId`, `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorTooManyTags`, `AWSSimpleSystemsManagerErrorTooManyUpdates`.
 
 @see AWSSimpleSystemsManagerAddTagsToResourceRequest
 @see AWSSimpleSystemsManagerAddTagsToResourceResult
 */
- (AWSTask<AWSSimpleSystemsManagerAddTagsToResourceResult *> *)addTagsToResource:(AWSSimpleSystemsManagerAddTagsToResourceRequest *)request;

/**
 <p>Adds or overwrites one or more tags for the specified resource. Tags are metadata that you can assign to your documents, managed instances, maintenance windows, Parameter Store parameters, and patch baselines. Tags enable you to categorize your resources in different ways, for example, by purpose, owner, or environment. Each tag consists of a key and an optional value, both of which you define. For example, you could define a set of tags for your account's managed instances that helps you track each instance's owner and stack level. For example: Key=Owner and Value=DbAdmin, SysAdmin, or Dev. Or Key=Stack and Value=Production, Pre-Production, or Test.</p><p>Each resource can have a maximum of 50 tags. </p><p>We recommend that you devise a set of tag keys that meets your needs for each resource type. Using a consistent set of tag keys makes it easier for you to manage your resources. You can search and filter the resources based on the tags you add. Tags don't have any semantic meaning to and are interpreted strictly as a string of characters. </p><p>For more information about using tags with EC2 instances, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging your Amazon EC2 resources</a> in the <i>Amazon EC2 User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AddTagsToResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidResourceType`, `AWSSimpleSystemsManagerErrorInvalidResourceId`, `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorTooManyTags`, `AWSSimpleSystemsManagerErrorTooManyUpdates`.
 
 @see AWSSimpleSystemsManagerAddTagsToResourceRequest
 @see AWSSimpleSystemsManagerAddTagsToResourceResult
 */
- (void)addTagsToResource:(AWSSimpleSystemsManagerAddTagsToResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerAddTagsToResourceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attempts to cancel the command specified by the Command ID. There is no guarantee that the command will be terminated and the underlying process stopped.</p>
 
 @param request A container for the necessary parameters to execute the CancelCommand service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerCancelCommandResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidCommandId`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorDuplicateInstanceId`.
 
 @see AWSSimpleSystemsManagerCancelCommandRequest
 @see AWSSimpleSystemsManagerCancelCommandResult
 */
- (AWSTask<AWSSimpleSystemsManagerCancelCommandResult *> *)cancelCommand:(AWSSimpleSystemsManagerCancelCommandRequest *)request;

/**
 <p>Attempts to cancel the command specified by the Command ID. There is no guarantee that the command will be terminated and the underlying process stopped.</p>
 
 @param request A container for the necessary parameters to execute the CancelCommand service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidCommandId`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorDuplicateInstanceId`.
 
 @see AWSSimpleSystemsManagerCancelCommandRequest
 @see AWSSimpleSystemsManagerCancelCommandResult
 */
- (void)cancelCommand:(AWSSimpleSystemsManagerCancelCommandRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerCancelCommandResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops a maintenance window execution that is already in progress and cancels any tasks in the window that have not already starting running. (Tasks already in progress will continue to completion.)</p>
 
 @param request A container for the necessary parameters to execute the CancelMaintenanceWindowExecution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerCancelMaintenanceWindowExecutionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorDoesNotExist`.
 
 @see AWSSimpleSystemsManagerCancelMaintenanceWindowExecutionRequest
 @see AWSSimpleSystemsManagerCancelMaintenanceWindowExecutionResult
 */
- (AWSTask<AWSSimpleSystemsManagerCancelMaintenanceWindowExecutionResult *> *)cancelMaintenanceWindowExecution:(AWSSimpleSystemsManagerCancelMaintenanceWindowExecutionRequest *)request;

/**
 <p>Stops a maintenance window execution that is already in progress and cancels any tasks in the window that have not already starting running. (Tasks already in progress will continue to completion.)</p>
 
 @param request A container for the necessary parameters to execute the CancelMaintenanceWindowExecution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorDoesNotExist`.
 
 @see AWSSimpleSystemsManagerCancelMaintenanceWindowExecutionRequest
 @see AWSSimpleSystemsManagerCancelMaintenanceWindowExecutionResult
 */
- (void)cancelMaintenanceWindowExecution:(AWSSimpleSystemsManagerCancelMaintenanceWindowExecutionRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerCancelMaintenanceWindowExecutionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Generates an activation code and activation ID you can use to register your on-premises server or virtual machine (VM) with Systems Manager. Registering these machines with Systems Manager makes it possible to manage them using Systems Manager capabilities. You use the activation code and ID when installing SSM Agent on machines in your hybrid environment. For more information about requirements for managing on-premises instances and VMs using Systems Manager, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-managedinstances.html">Setting up AWS Systems Manager for hybrid environments</a> in the <i>AWS Systems Manager User Guide</i>. </p><note><p>On-premises servers or VMs that are registered with Systems Manager and EC2 instances that you manage with Systems Manager are all called <i>managed instances</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateActivation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerCreateActivationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerCreateActivationRequest
 @see AWSSimpleSystemsManagerCreateActivationResult
 */
- (AWSTask<AWSSimpleSystemsManagerCreateActivationResult *> *)createActivation:(AWSSimpleSystemsManagerCreateActivationRequest *)request;

/**
 <p>Generates an activation code and activation ID you can use to register your on-premises server or virtual machine (VM) with Systems Manager. Registering these machines with Systems Manager makes it possible to manage them using Systems Manager capabilities. You use the activation code and ID when installing SSM Agent on machines in your hybrid environment. For more information about requirements for managing on-premises instances and VMs using Systems Manager, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-managedinstances.html">Setting up AWS Systems Manager for hybrid environments</a> in the <i>AWS Systems Manager User Guide</i>. </p><note><p>On-premises servers or VMs that are registered with Systems Manager and EC2 instances that you manage with Systems Manager are all called <i>managed instances</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateActivation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerCreateActivationRequest
 @see AWSSimpleSystemsManagerCreateActivationResult
 */
- (void)createActivation:(AWSSimpleSystemsManagerCreateActivationRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerCreateActivationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates the specified Systems Manager document with the specified instances or targets.</p><p>When you associate a document with one or more instances using instance IDs or tags, SSM Agent running on the instance processes the document and configures the instance as specified.</p><p>If you associate a document with an instance that already has an associated document, the system returns the AssociationAlreadyExists exception.</p>
 
 @param request A container for the necessary parameters to execute the CreateAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerCreateAssociationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorAssociationAlreadyExists`, `AWSSimpleSystemsManagerErrorAssociationLimitExceeded`, `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidDocumentVersion`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorUnsupportedPlatformType`, `AWSSimpleSystemsManagerErrorInvalidOutputLocation`, `AWSSimpleSystemsManagerErrorInvalidParameters`, `AWSSimpleSystemsManagerErrorInvalidTarget`, `AWSSimpleSystemsManagerErrorInvalidSchedule`.
 
 @see AWSSimpleSystemsManagerCreateAssociationRequest
 @see AWSSimpleSystemsManagerCreateAssociationResult
 */
- (AWSTask<AWSSimpleSystemsManagerCreateAssociationResult *> *)createAssociation:(AWSSimpleSystemsManagerCreateAssociationRequest *)request;

/**
 <p>Associates the specified Systems Manager document with the specified instances or targets.</p><p>When you associate a document with one or more instances using instance IDs or tags, SSM Agent running on the instance processes the document and configures the instance as specified.</p><p>If you associate a document with an instance that already has an associated document, the system returns the AssociationAlreadyExists exception.</p>
 
 @param request A container for the necessary parameters to execute the CreateAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorAssociationAlreadyExists`, `AWSSimpleSystemsManagerErrorAssociationLimitExceeded`, `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidDocumentVersion`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorUnsupportedPlatformType`, `AWSSimpleSystemsManagerErrorInvalidOutputLocation`, `AWSSimpleSystemsManagerErrorInvalidParameters`, `AWSSimpleSystemsManagerErrorInvalidTarget`, `AWSSimpleSystemsManagerErrorInvalidSchedule`.
 
 @see AWSSimpleSystemsManagerCreateAssociationRequest
 @see AWSSimpleSystemsManagerCreateAssociationResult
 */
- (void)createAssociation:(AWSSimpleSystemsManagerCreateAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerCreateAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates the specified Systems Manager document with the specified instances or targets.</p><p>When you associate a document with one or more instances using instance IDs or tags, SSM Agent running on the instance processes the document and configures the instance as specified.</p><p>If you associate a document with an instance that already has an associated document, the system returns the AssociationAlreadyExists exception.</p>
 
 @param request A container for the necessary parameters to execute the CreateAssociationBatch service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerCreateAssociationBatchResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidDocumentVersion`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInvalidParameters`, `AWSSimpleSystemsManagerErrorDuplicateInstanceId`, `AWSSimpleSystemsManagerErrorAssociationLimitExceeded`, `AWSSimpleSystemsManagerErrorUnsupportedPlatformType`, `AWSSimpleSystemsManagerErrorInvalidOutputLocation`, `AWSSimpleSystemsManagerErrorInvalidTarget`, `AWSSimpleSystemsManagerErrorInvalidSchedule`.
 
 @see AWSSimpleSystemsManagerCreateAssociationBatchRequest
 @see AWSSimpleSystemsManagerCreateAssociationBatchResult
 */
- (AWSTask<AWSSimpleSystemsManagerCreateAssociationBatchResult *> *)createAssociationBatch:(AWSSimpleSystemsManagerCreateAssociationBatchRequest *)request;

/**
 <p>Associates the specified Systems Manager document with the specified instances or targets.</p><p>When you associate a document with one or more instances using instance IDs or tags, SSM Agent running on the instance processes the document and configures the instance as specified.</p><p>If you associate a document with an instance that already has an associated document, the system returns the AssociationAlreadyExists exception.</p>
 
 @param request A container for the necessary parameters to execute the CreateAssociationBatch service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidDocumentVersion`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInvalidParameters`, `AWSSimpleSystemsManagerErrorDuplicateInstanceId`, `AWSSimpleSystemsManagerErrorAssociationLimitExceeded`, `AWSSimpleSystemsManagerErrorUnsupportedPlatformType`, `AWSSimpleSystemsManagerErrorInvalidOutputLocation`, `AWSSimpleSystemsManagerErrorInvalidTarget`, `AWSSimpleSystemsManagerErrorInvalidSchedule`.
 
 @see AWSSimpleSystemsManagerCreateAssociationBatchRequest
 @see AWSSimpleSystemsManagerCreateAssociationBatchResult
 */
- (void)createAssociationBatch:(AWSSimpleSystemsManagerCreateAssociationBatchRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerCreateAssociationBatchResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Systems Manager (SSM) document. An SSM document defines the actions that Systems Manager performs on your managed instances. For more information about SSM documents, including information about supported schemas, features, and syntax, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-ssm-docs.html">AWS Systems Manager Documents</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDocument service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerCreateDocumentResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDocumentAlreadyExists`, `AWSSimpleSystemsManagerErrorMaxDocumentSizeExceeded`, `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDocumentContent`, `AWSSimpleSystemsManagerErrorDocumentLimitExceeded`, `AWSSimpleSystemsManagerErrorInvalidDocumentSchemaVersion`.
 
 @see AWSSimpleSystemsManagerCreateDocumentRequest
 @see AWSSimpleSystemsManagerCreateDocumentResult
 */
- (AWSTask<AWSSimpleSystemsManagerCreateDocumentResult *> *)createDocument:(AWSSimpleSystemsManagerCreateDocumentRequest *)request;

/**
 <p>Creates a Systems Manager (SSM) document. An SSM document defines the actions that Systems Manager performs on your managed instances. For more information about SSM documents, including information about supported schemas, features, and syntax, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-ssm-docs.html">AWS Systems Manager Documents</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDocument service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDocumentAlreadyExists`, `AWSSimpleSystemsManagerErrorMaxDocumentSizeExceeded`, `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDocumentContent`, `AWSSimpleSystemsManagerErrorDocumentLimitExceeded`, `AWSSimpleSystemsManagerErrorInvalidDocumentSchemaVersion`.
 
 @see AWSSimpleSystemsManagerCreateDocumentRequest
 @see AWSSimpleSystemsManagerCreateDocumentResult
 */
- (void)createDocument:(AWSSimpleSystemsManagerCreateDocumentRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerCreateDocumentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new maintenance window.</p><note><p>The value you specify for <code>Duration</code> determines the specific end time for the maintenance window based on the time it begins. No maintenance window tasks are permitted to start after the resulting endtime minus the number of hours you specify for <code>Cutoff</code>. For example, if the maintenance window starts at 3 PM, the duration is three hours, and the value you specify for <code>Cutoff</code> is one hour, no maintenance window tasks can start after 5 PM.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateMaintenanceWindow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerCreateMaintenanceWindowResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorIdempotentParameterMismatch`, `AWSSimpleSystemsManagerErrorResourceLimitExceeded`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerCreateMaintenanceWindowRequest
 @see AWSSimpleSystemsManagerCreateMaintenanceWindowResult
 */
- (AWSTask<AWSSimpleSystemsManagerCreateMaintenanceWindowResult *> *)createMaintenanceWindow:(AWSSimpleSystemsManagerCreateMaintenanceWindowRequest *)request;

/**
 <p>Creates a new maintenance window.</p><note><p>The value you specify for <code>Duration</code> determines the specific end time for the maintenance window based on the time it begins. No maintenance window tasks are permitted to start after the resulting endtime minus the number of hours you specify for <code>Cutoff</code>. For example, if the maintenance window starts at 3 PM, the duration is three hours, and the value you specify for <code>Cutoff</code> is one hour, no maintenance window tasks can start after 5 PM.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateMaintenanceWindow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorIdempotentParameterMismatch`, `AWSSimpleSystemsManagerErrorResourceLimitExceeded`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerCreateMaintenanceWindowRequest
 @see AWSSimpleSystemsManagerCreateMaintenanceWindowResult
 */
- (void)createMaintenanceWindow:(AWSSimpleSystemsManagerCreateMaintenanceWindowRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerCreateMaintenanceWindowResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new OpsItem. You must have permission in AWS Identity and Access Management (IAM) to create a new OpsItem. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the CreateOpsItem service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerCreateOpsItemResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorOpsItemAlreadyExists`, `AWSSimpleSystemsManagerErrorOpsItemLimitExceeded`, `AWSSimpleSystemsManagerErrorOpsItemInvalidParameter`.
 
 @see AWSSimpleSystemsManagerCreateOpsItemRequest
 @see AWSSimpleSystemsManagerCreateOpsItemResponse
 */
- (AWSTask<AWSSimpleSystemsManagerCreateOpsItemResponse *> *)createOpsItem:(AWSSimpleSystemsManagerCreateOpsItemRequest *)request;

/**
 <p>Creates a new OpsItem. You must have permission in AWS Identity and Access Management (IAM) to create a new OpsItem. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the CreateOpsItem service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorOpsItemAlreadyExists`, `AWSSimpleSystemsManagerErrorOpsItemLimitExceeded`, `AWSSimpleSystemsManagerErrorOpsItemInvalidParameter`.
 
 @see AWSSimpleSystemsManagerCreateOpsItemRequest
 @see AWSSimpleSystemsManagerCreateOpsItemResponse
 */
- (void)createOpsItem:(AWSSimpleSystemsManagerCreateOpsItemRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerCreateOpsItemResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a patch baseline.</p><note><p>For information about valid key and value pairs in <code>PatchFilters</code> for each supported operating system type, see <a href="http://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html">PatchFilter</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreatePatchBaseline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerCreatePatchBaselineResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorIdempotentParameterMismatch`, `AWSSimpleSystemsManagerErrorResourceLimitExceeded`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerCreatePatchBaselineRequest
 @see AWSSimpleSystemsManagerCreatePatchBaselineResult
 */
- (AWSTask<AWSSimpleSystemsManagerCreatePatchBaselineResult *> *)createPatchBaseline:(AWSSimpleSystemsManagerCreatePatchBaselineRequest *)request;

/**
 <p>Creates a patch baseline.</p><note><p>For information about valid key and value pairs in <code>PatchFilters</code> for each supported operating system type, see <a href="http://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html">PatchFilter</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreatePatchBaseline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorIdempotentParameterMismatch`, `AWSSimpleSystemsManagerErrorResourceLimitExceeded`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerCreatePatchBaselineRequest
 @see AWSSimpleSystemsManagerCreatePatchBaselineResult
 */
- (void)createPatchBaseline:(AWSSimpleSystemsManagerCreatePatchBaselineRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerCreatePatchBaselineResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>A resource data sync helps you view data from multiple sources in a single location. Systems Manager offers two types of resource data sync: <code>SyncToDestination</code> and <code>SyncFromSource</code>.</p><p>You can configure Systems Manager Inventory to use the <code>SyncToDestination</code> type to synchronize Inventory data from multiple AWS Regions to a single S3 bucket. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-datasync.html">Configuring Resource Data Sync for Inventory</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>You can configure Systems Manager Explorer to use the <code>SyncFromSource</code> type to synchronize operational work items (OpsItems) and operational data (OpsData) from multiple AWS Regions to a single S3 bucket. This type can synchronize OpsItems and OpsData from multiple AWS accounts and Regions or <code>EntireOrganization</code> by using AWS Organizations. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/Explorer-resource-data-sync.html">Setting up Systems Manager Explorer to display data from multiple accounts and Regions</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>A resource data sync is an asynchronous operation that returns immediately. After a successful initial sync is completed, the system continuously syncs data. To check the status of a sync, use the <a>ListResourceDataSync</a>.</p><note><p>By default, data is not encrypted in Amazon S3. We strongly recommend that you enable encryption in Amazon S3 to ensure secure data storage. We also recommend that you secure access to the Amazon S3 bucket by creating a restrictive bucket policy. </p></note>
 
 @param request A container for the necessary parameters to execute the CreateResourceDataSync service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerCreateResourceDataSyncResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorResourceDataSyncCountExceeded`, `AWSSimpleSystemsManagerErrorResourceDataSyncAlreadyExists`, `AWSSimpleSystemsManagerErrorResourceDataSyncInvalidConfiguration`.
 
 @see AWSSimpleSystemsManagerCreateResourceDataSyncRequest
 @see AWSSimpleSystemsManagerCreateResourceDataSyncResult
 */
- (AWSTask<AWSSimpleSystemsManagerCreateResourceDataSyncResult *> *)createResourceDataSync:(AWSSimpleSystemsManagerCreateResourceDataSyncRequest *)request;

/**
 <p>A resource data sync helps you view data from multiple sources in a single location. Systems Manager offers two types of resource data sync: <code>SyncToDestination</code> and <code>SyncFromSource</code>.</p><p>You can configure Systems Manager Inventory to use the <code>SyncToDestination</code> type to synchronize Inventory data from multiple AWS Regions to a single S3 bucket. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-datasync.html">Configuring Resource Data Sync for Inventory</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>You can configure Systems Manager Explorer to use the <code>SyncFromSource</code> type to synchronize operational work items (OpsItems) and operational data (OpsData) from multiple AWS Regions to a single S3 bucket. This type can synchronize OpsItems and OpsData from multiple AWS accounts and Regions or <code>EntireOrganization</code> by using AWS Organizations. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/Explorer-resource-data-sync.html">Setting up Systems Manager Explorer to display data from multiple accounts and Regions</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>A resource data sync is an asynchronous operation that returns immediately. After a successful initial sync is completed, the system continuously syncs data. To check the status of a sync, use the <a>ListResourceDataSync</a>.</p><note><p>By default, data is not encrypted in Amazon S3. We strongly recommend that you enable encryption in Amazon S3 to ensure secure data storage. We also recommend that you secure access to the Amazon S3 bucket by creating a restrictive bucket policy. </p></note>
 
 @param request A container for the necessary parameters to execute the CreateResourceDataSync service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorResourceDataSyncCountExceeded`, `AWSSimpleSystemsManagerErrorResourceDataSyncAlreadyExists`, `AWSSimpleSystemsManagerErrorResourceDataSyncInvalidConfiguration`.
 
 @see AWSSimpleSystemsManagerCreateResourceDataSyncRequest
 @see AWSSimpleSystemsManagerCreateResourceDataSyncResult
 */
- (void)createResourceDataSync:(AWSSimpleSystemsManagerCreateResourceDataSyncRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerCreateResourceDataSyncResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an activation. You are not required to delete an activation. If you delete an activation, you can no longer use it to register additional managed instances. Deleting an activation does not de-register managed instances. You must manually de-register managed instances.</p>
 
 @param request A container for the necessary parameters to execute the DeleteActivation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDeleteActivationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidActivationId`, `AWSSimpleSystemsManagerErrorInvalidActivation`, `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorTooManyUpdates`.
 
 @see AWSSimpleSystemsManagerDeleteActivationRequest
 @see AWSSimpleSystemsManagerDeleteActivationResult
 */
- (AWSTask<AWSSimpleSystemsManagerDeleteActivationResult *> *)deleteActivation:(AWSSimpleSystemsManagerDeleteActivationRequest *)request;

/**
 <p>Deletes an activation. You are not required to delete an activation. If you delete an activation, you can no longer use it to register additional managed instances. Deleting an activation does not de-register managed instances. You must manually de-register managed instances.</p>
 
 @param request A container for the necessary parameters to execute the DeleteActivation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidActivationId`, `AWSSimpleSystemsManagerErrorInvalidActivation`, `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorTooManyUpdates`.
 
 @see AWSSimpleSystemsManagerDeleteActivationRequest
 @see AWSSimpleSystemsManagerDeleteActivationResult
 */
- (void)deleteActivation:(AWSSimpleSystemsManagerDeleteActivationRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDeleteActivationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates the specified Systems Manager document from the specified instance.</p><p>When you disassociate a document from an instance, it does not change the configuration of the instance. To change the configuration state of an instance after you disassociate a document, you must create a new document with the desired configuration and associate it with the instance.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDeleteAssociationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorAssociationDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorTooManyUpdates`.
 
 @see AWSSimpleSystemsManagerDeleteAssociationRequest
 @see AWSSimpleSystemsManagerDeleteAssociationResult
 */
- (AWSTask<AWSSimpleSystemsManagerDeleteAssociationResult *> *)deleteAssociation:(AWSSimpleSystemsManagerDeleteAssociationRequest *)request;

/**
 <p>Disassociates the specified Systems Manager document from the specified instance.</p><p>When you disassociate a document from an instance, it does not change the configuration of the instance. To change the configuration state of an instance after you disassociate a document, you must create a new document with the desired configuration and associate it with the instance.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorAssociationDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorTooManyUpdates`.
 
 @see AWSSimpleSystemsManagerDeleteAssociationRequest
 @see AWSSimpleSystemsManagerDeleteAssociationResult
 */
- (void)deleteAssociation:(AWSSimpleSystemsManagerDeleteAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDeleteAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the Systems Manager document and all instance associations to the document.</p><p>Before you delete the document, we recommend that you use <a>DeleteAssociation</a> to disassociate all instances that are associated with the document.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDocument service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDeleteDocumentResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidDocumentOperation`, `AWSSimpleSystemsManagerErrorAssociatedInstances`.
 
 @see AWSSimpleSystemsManagerDeleteDocumentRequest
 @see AWSSimpleSystemsManagerDeleteDocumentResult
 */
- (AWSTask<AWSSimpleSystemsManagerDeleteDocumentResult *> *)deleteDocument:(AWSSimpleSystemsManagerDeleteDocumentRequest *)request;

/**
 <p>Deletes the Systems Manager document and all instance associations to the document.</p><p>Before you delete the document, we recommend that you use <a>DeleteAssociation</a> to disassociate all instances that are associated with the document.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDocument service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidDocumentOperation`, `AWSSimpleSystemsManagerErrorAssociatedInstances`.
 
 @see AWSSimpleSystemsManagerDeleteDocumentRequest
 @see AWSSimpleSystemsManagerDeleteDocumentResult
 */
- (void)deleteDocument:(AWSSimpleSystemsManagerDeleteDocumentRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDeleteDocumentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Delete a custom inventory type, or the data associated with a custom Inventory type. Deleting a custom inventory type is also referred to as deleting a custom inventory schema.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInventory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDeleteInventoryResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidTypeName`, `AWSSimpleSystemsManagerErrorInvalidOption`, `AWSSimpleSystemsManagerErrorInvalidDeleteInventoryParameters`, `AWSSimpleSystemsManagerErrorInvalidInventoryRequest`.
 
 @see AWSSimpleSystemsManagerDeleteInventoryRequest
 @see AWSSimpleSystemsManagerDeleteInventoryResult
 */
- (AWSTask<AWSSimpleSystemsManagerDeleteInventoryResult *> *)deleteInventory:(AWSSimpleSystemsManagerDeleteInventoryRequest *)request;

/**
 <p>Delete a custom inventory type, or the data associated with a custom Inventory type. Deleting a custom inventory type is also referred to as deleting a custom inventory schema.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInventory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidTypeName`, `AWSSimpleSystemsManagerErrorInvalidOption`, `AWSSimpleSystemsManagerErrorInvalidDeleteInventoryParameters`, `AWSSimpleSystemsManagerErrorInvalidInventoryRequest`.
 
 @see AWSSimpleSystemsManagerDeleteInventoryRequest
 @see AWSSimpleSystemsManagerDeleteInventoryResult
 */
- (void)deleteInventory:(AWSSimpleSystemsManagerDeleteInventoryRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDeleteInventoryResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMaintenanceWindow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDeleteMaintenanceWindowResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDeleteMaintenanceWindowRequest
 @see AWSSimpleSystemsManagerDeleteMaintenanceWindowResult
 */
- (AWSTask<AWSSimpleSystemsManagerDeleteMaintenanceWindowResult *> *)deleteMaintenanceWindow:(AWSSimpleSystemsManagerDeleteMaintenanceWindowRequest *)request;

/**
 <p>Deletes a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMaintenanceWindow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDeleteMaintenanceWindowRequest
 @see AWSSimpleSystemsManagerDeleteMaintenanceWindowResult
 */
- (void)deleteMaintenanceWindow:(AWSSimpleSystemsManagerDeleteMaintenanceWindowRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDeleteMaintenanceWindowResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Delete a parameter from the system.</p>
 
 @param request A container for the necessary parameters to execute the DeleteParameter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDeleteParameterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorParameterNotFound`.
 
 @see AWSSimpleSystemsManagerDeleteParameterRequest
 @see AWSSimpleSystemsManagerDeleteParameterResult
 */
- (AWSTask<AWSSimpleSystemsManagerDeleteParameterResult *> *)deleteParameter:(AWSSimpleSystemsManagerDeleteParameterRequest *)request;

/**
 <p>Delete a parameter from the system.</p>
 
 @param request A container for the necessary parameters to execute the DeleteParameter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorParameterNotFound`.
 
 @see AWSSimpleSystemsManagerDeleteParameterRequest
 @see AWSSimpleSystemsManagerDeleteParameterResult
 */
- (void)deleteParameter:(AWSSimpleSystemsManagerDeleteParameterRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDeleteParameterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Delete a list of parameters.</p>
 
 @param request A container for the necessary parameters to execute the DeleteParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDeleteParametersResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDeleteParametersRequest
 @see AWSSimpleSystemsManagerDeleteParametersResult
 */
- (AWSTask<AWSSimpleSystemsManagerDeleteParametersResult *> *)deleteParameters:(AWSSimpleSystemsManagerDeleteParametersRequest *)request;

/**
 <p>Delete a list of parameters.</p>
 
 @param request A container for the necessary parameters to execute the DeleteParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDeleteParametersRequest
 @see AWSSimpleSystemsManagerDeleteParametersResult
 */
- (void)deleteParameters:(AWSSimpleSystemsManagerDeleteParametersRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDeleteParametersResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a patch baseline.</p>
 
 @param request A container for the necessary parameters to execute the DeletePatchBaseline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDeletePatchBaselineResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorResourceInUse`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDeletePatchBaselineRequest
 @see AWSSimpleSystemsManagerDeletePatchBaselineResult
 */
- (AWSTask<AWSSimpleSystemsManagerDeletePatchBaselineResult *> *)deletePatchBaseline:(AWSSimpleSystemsManagerDeletePatchBaselineRequest *)request;

/**
 <p>Deletes a patch baseline.</p>
 
 @param request A container for the necessary parameters to execute the DeletePatchBaseline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorResourceInUse`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDeletePatchBaselineRequest
 @see AWSSimpleSystemsManagerDeletePatchBaselineResult
 */
- (void)deletePatchBaseline:(AWSSimpleSystemsManagerDeletePatchBaselineRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDeletePatchBaselineResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a Resource Data Sync configuration. After the configuration is deleted, changes to data on managed instances are no longer synced to or from the target. Deleting a sync configuration does not delete data.</p>
 
 @param request A container for the necessary parameters to execute the DeleteResourceDataSync service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDeleteResourceDataSyncResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorResourceDataSyncNotFound`, `AWSSimpleSystemsManagerErrorResourceDataSyncInvalidConfiguration`.
 
 @see AWSSimpleSystemsManagerDeleteResourceDataSyncRequest
 @see AWSSimpleSystemsManagerDeleteResourceDataSyncResult
 */
- (AWSTask<AWSSimpleSystemsManagerDeleteResourceDataSyncResult *> *)deleteResourceDataSync:(AWSSimpleSystemsManagerDeleteResourceDataSyncRequest *)request;

/**
 <p>Deletes a Resource Data Sync configuration. After the configuration is deleted, changes to data on managed instances are no longer synced to or from the target. Deleting a sync configuration does not delete data.</p>
 
 @param request A container for the necessary parameters to execute the DeleteResourceDataSync service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorResourceDataSyncNotFound`, `AWSSimpleSystemsManagerErrorResourceDataSyncInvalidConfiguration`.
 
 @see AWSSimpleSystemsManagerDeleteResourceDataSyncRequest
 @see AWSSimpleSystemsManagerDeleteResourceDataSyncResult
 */
- (void)deleteResourceDataSync:(AWSSimpleSystemsManagerDeleteResourceDataSyncRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDeleteResourceDataSyncResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the server or virtual machine from the list of registered servers. You can reregister the instance again at any time. If you don't plan to use Run Command on the server, we suggest uninstalling SSM Agent first.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterManagedInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDeregisterManagedInstanceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDeregisterManagedInstanceRequest
 @see AWSSimpleSystemsManagerDeregisterManagedInstanceResult
 */
- (AWSTask<AWSSimpleSystemsManagerDeregisterManagedInstanceResult *> *)deregisterManagedInstance:(AWSSimpleSystemsManagerDeregisterManagedInstanceRequest *)request;

/**
 <p>Removes the server or virtual machine from the list of registered servers. You can reregister the instance again at any time. If you don't plan to use Run Command on the server, we suggest uninstalling SSM Agent first.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterManagedInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDeregisterManagedInstanceRequest
 @see AWSSimpleSystemsManagerDeregisterManagedInstanceResult
 */
- (void)deregisterManagedInstance:(AWSSimpleSystemsManagerDeregisterManagedInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDeregisterManagedInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a patch group from a patch baseline.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterPatchBaselineForPatchGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDeregisterPatchBaselineForPatchGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidResourceId`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDeregisterPatchBaselineForPatchGroupRequest
 @see AWSSimpleSystemsManagerDeregisterPatchBaselineForPatchGroupResult
 */
- (AWSTask<AWSSimpleSystemsManagerDeregisterPatchBaselineForPatchGroupResult *> *)deregisterPatchBaselineForPatchGroup:(AWSSimpleSystemsManagerDeregisterPatchBaselineForPatchGroupRequest *)request;

/**
 <p>Removes a patch group from a patch baseline.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterPatchBaselineForPatchGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidResourceId`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDeregisterPatchBaselineForPatchGroupRequest
 @see AWSSimpleSystemsManagerDeregisterPatchBaselineForPatchGroupResult
 */
- (void)deregisterPatchBaselineForPatchGroup:(AWSSimpleSystemsManagerDeregisterPatchBaselineForPatchGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDeregisterPatchBaselineForPatchGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a target from a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterTargetFromMaintenanceWindow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDeregisterTargetFromMaintenanceWindowResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorTargetInUse`.
 
 @see AWSSimpleSystemsManagerDeregisterTargetFromMaintenanceWindowRequest
 @see AWSSimpleSystemsManagerDeregisterTargetFromMaintenanceWindowResult
 */
- (AWSTask<AWSSimpleSystemsManagerDeregisterTargetFromMaintenanceWindowResult *> *)deregisterTargetFromMaintenanceWindow:(AWSSimpleSystemsManagerDeregisterTargetFromMaintenanceWindowRequest *)request;

/**
 <p>Removes a target from a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterTargetFromMaintenanceWindow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorTargetInUse`.
 
 @see AWSSimpleSystemsManagerDeregisterTargetFromMaintenanceWindowRequest
 @see AWSSimpleSystemsManagerDeregisterTargetFromMaintenanceWindowResult
 */
- (void)deregisterTargetFromMaintenanceWindow:(AWSSimpleSystemsManagerDeregisterTargetFromMaintenanceWindowRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDeregisterTargetFromMaintenanceWindowResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a task from a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterTaskFromMaintenanceWindow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDeregisterTaskFromMaintenanceWindowResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDeregisterTaskFromMaintenanceWindowRequest
 @see AWSSimpleSystemsManagerDeregisterTaskFromMaintenanceWindowResult
 */
- (AWSTask<AWSSimpleSystemsManagerDeregisterTaskFromMaintenanceWindowResult *> *)deregisterTaskFromMaintenanceWindow:(AWSSimpleSystemsManagerDeregisterTaskFromMaintenanceWindowRequest *)request;

/**
 <p>Removes a task from a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterTaskFromMaintenanceWindow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDeregisterTaskFromMaintenanceWindowRequest
 @see AWSSimpleSystemsManagerDeregisterTaskFromMaintenanceWindowResult
 */
- (void)deregisterTaskFromMaintenanceWindow:(AWSSimpleSystemsManagerDeregisterTaskFromMaintenanceWindowRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDeregisterTaskFromMaintenanceWindowResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes details about the activation, such as the date and time the activation was created, its expiration date, the IAM role assigned to the instances in the activation, and the number of instances registered by using this activation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeActivations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeActivationsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidFilter`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeActivationsRequest
 @see AWSSimpleSystemsManagerDescribeActivationsResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeActivationsResult *> *)describeActivations:(AWSSimpleSystemsManagerDescribeActivationsRequest *)request;

/**
 <p>Describes details about the activation, such as the date and time the activation was created, its expiration date, the IAM role assigned to the instances in the activation, and the number of instances registered by using this activation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeActivations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidFilter`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeActivationsRequest
 @see AWSSimpleSystemsManagerDescribeActivationsResult
 */
- (void)describeActivations:(AWSSimpleSystemsManagerDescribeActivationsRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeActivationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the association for the specified target or instance. If you created the association by using the <code>Targets</code> parameter, then you must retrieve the association by using the association ID. If you created the association by specifying an instance ID and a Systems Manager document, then you retrieve the association by specifying the document name and the instance ID. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeAssociationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorAssociationDoesNotExist`, `AWSSimpleSystemsManagerErrorInvalidAssociationVersion`, `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`.
 
 @see AWSSimpleSystemsManagerDescribeAssociationRequest
 @see AWSSimpleSystemsManagerDescribeAssociationResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeAssociationResult *> *)describeAssociation:(AWSSimpleSystemsManagerDescribeAssociationRequest *)request;

/**
 <p>Describes the association for the specified target or instance. If you created the association by using the <code>Targets</code> parameter, then you must retrieve the association by using the association ID. If you created the association by specifying an instance ID and a Systems Manager document, then you retrieve the association by specifying the document name and the instance ID. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorAssociationDoesNotExist`, `AWSSimpleSystemsManagerErrorInvalidAssociationVersion`, `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`.
 
 @see AWSSimpleSystemsManagerDescribeAssociationRequest
 @see AWSSimpleSystemsManagerDescribeAssociationResult
 */
- (void)describeAssociation:(AWSSimpleSystemsManagerDescribeAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Use this API action to view information about a specific execution of a specific association.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAssociationExecutionTargets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeAssociationExecutionTargetsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorAssociationDoesNotExist`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorAssociationExecutionDoesNotExist`.
 
 @see AWSSimpleSystemsManagerDescribeAssociationExecutionTargetsRequest
 @see AWSSimpleSystemsManagerDescribeAssociationExecutionTargetsResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeAssociationExecutionTargetsResult *> *)describeAssociationExecutionTargets:(AWSSimpleSystemsManagerDescribeAssociationExecutionTargetsRequest *)request;

/**
 <p>Use this API action to view information about a specific execution of a specific association.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAssociationExecutionTargets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorAssociationDoesNotExist`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorAssociationExecutionDoesNotExist`.
 
 @see AWSSimpleSystemsManagerDescribeAssociationExecutionTargetsRequest
 @see AWSSimpleSystemsManagerDescribeAssociationExecutionTargetsResult
 */
- (void)describeAssociationExecutionTargets:(AWSSimpleSystemsManagerDescribeAssociationExecutionTargetsRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeAssociationExecutionTargetsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Use this API action to view all executions for a specific association ID. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAssociationExecutions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeAssociationExecutionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorAssociationDoesNotExist`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerDescribeAssociationExecutionsRequest
 @see AWSSimpleSystemsManagerDescribeAssociationExecutionsResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeAssociationExecutionsResult *> *)describeAssociationExecutions:(AWSSimpleSystemsManagerDescribeAssociationExecutionsRequest *)request;

/**
 <p>Use this API action to view all executions for a specific association ID. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAssociationExecutions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorAssociationDoesNotExist`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerDescribeAssociationExecutionsRequest
 @see AWSSimpleSystemsManagerDescribeAssociationExecutionsResult
 */
- (void)describeAssociationExecutions:(AWSSimpleSystemsManagerDescribeAssociationExecutionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeAssociationExecutionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides details about all active and terminated Automation executions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutomationExecutions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeAutomationExecutionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidFilterKey`, `AWSSimpleSystemsManagerErrorInvalidFilterValue`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeAutomationExecutionsRequest
 @see AWSSimpleSystemsManagerDescribeAutomationExecutionsResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeAutomationExecutionsResult *> *)describeAutomationExecutions:(AWSSimpleSystemsManagerDescribeAutomationExecutionsRequest *)request;

/**
 <p>Provides details about all active and terminated Automation executions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutomationExecutions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidFilterKey`, `AWSSimpleSystemsManagerErrorInvalidFilterValue`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeAutomationExecutionsRequest
 @see AWSSimpleSystemsManagerDescribeAutomationExecutionsResult
 */
- (void)describeAutomationExecutions:(AWSSimpleSystemsManagerDescribeAutomationExecutionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeAutomationExecutionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Information about all active and terminated step executions in an Automation workflow.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutomationStepExecutions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeAutomationStepExecutionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorAutomationExecutionNotFound`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorInvalidFilterKey`, `AWSSimpleSystemsManagerErrorInvalidFilterValue`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeAutomationStepExecutionsRequest
 @see AWSSimpleSystemsManagerDescribeAutomationStepExecutionsResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeAutomationStepExecutionsResult *> *)describeAutomationStepExecutions:(AWSSimpleSystemsManagerDescribeAutomationStepExecutionsRequest *)request;

/**
 <p>Information about all active and terminated step executions in an Automation workflow.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutomationStepExecutions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorAutomationExecutionNotFound`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorInvalidFilterKey`, `AWSSimpleSystemsManagerErrorInvalidFilterValue`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeAutomationStepExecutionsRequest
 @see AWSSimpleSystemsManagerDescribeAutomationStepExecutionsResult
 */
- (void)describeAutomationStepExecutions:(AWSSimpleSystemsManagerDescribeAutomationStepExecutionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeAutomationStepExecutionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all patches eligible to be included in a patch baseline.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAvailablePatches service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeAvailablePatchesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeAvailablePatchesRequest
 @see AWSSimpleSystemsManagerDescribeAvailablePatchesResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeAvailablePatchesResult *> *)describeAvailablePatches:(AWSSimpleSystemsManagerDescribeAvailablePatchesRequest *)request;

/**
 <p>Lists all patches eligible to be included in a patch baseline.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAvailablePatches service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeAvailablePatchesRequest
 @see AWSSimpleSystemsManagerDescribeAvailablePatchesResult
 */
- (void)describeAvailablePatches:(AWSSimpleSystemsManagerDescribeAvailablePatchesRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeAvailablePatchesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified Systems Manager document.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDocument service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeDocumentResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidDocumentVersion`.
 
 @see AWSSimpleSystemsManagerDescribeDocumentRequest
 @see AWSSimpleSystemsManagerDescribeDocumentResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeDocumentResult *> *)describeDocument:(AWSSimpleSystemsManagerDescribeDocumentRequest *)request;

/**
 <p>Describes the specified Systems Manager document.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDocument service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidDocumentVersion`.
 
 @see AWSSimpleSystemsManagerDescribeDocumentRequest
 @see AWSSimpleSystemsManagerDescribeDocumentResult
 */
- (void)describeDocument:(AWSSimpleSystemsManagerDescribeDocumentRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeDocumentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the permissions for a Systems Manager document. If you created the document, you are the owner. If a document is shared, it can either be shared privately (by specifying a user's AWS account ID) or publicly (<i>All</i>). </p>
 
 @param request A container for the necessary parameters to execute the DescribeDocumentPermission service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeDocumentPermissionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidPermissionType`.
 
 @see AWSSimpleSystemsManagerDescribeDocumentPermissionRequest
 @see AWSSimpleSystemsManagerDescribeDocumentPermissionResponse
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeDocumentPermissionResponse *> *)describeDocumentPermission:(AWSSimpleSystemsManagerDescribeDocumentPermissionRequest *)request;

/**
 <p>Describes the permissions for a Systems Manager document. If you created the document, you are the owner. If a document is shared, it can either be shared privately (by specifying a user's AWS account ID) or publicly (<i>All</i>). </p>
 
 @param request A container for the necessary parameters to execute the DescribeDocumentPermission service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidPermissionType`.
 
 @see AWSSimpleSystemsManagerDescribeDocumentPermissionRequest
 @see AWSSimpleSystemsManagerDescribeDocumentPermissionResponse
 */
- (void)describeDocumentPermission:(AWSSimpleSystemsManagerDescribeDocumentPermissionRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeDocumentPermissionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>All associations for the instance(s).</p>
 
 @param request A container for the necessary parameters to execute the DescribeEffectiveInstanceAssociations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeEffectiveInstanceAssociationsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerDescribeEffectiveInstanceAssociationsRequest
 @see AWSSimpleSystemsManagerDescribeEffectiveInstanceAssociationsResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeEffectiveInstanceAssociationsResult *> *)describeEffectiveInstanceAssociations:(AWSSimpleSystemsManagerDescribeEffectiveInstanceAssociationsRequest *)request;

/**
 <p>All associations for the instance(s).</p>
 
 @param request A container for the necessary parameters to execute the DescribeEffectiveInstanceAssociations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerDescribeEffectiveInstanceAssociationsRequest
 @see AWSSimpleSystemsManagerDescribeEffectiveInstanceAssociationsResult
 */
- (void)describeEffectiveInstanceAssociations:(AWSSimpleSystemsManagerDescribeEffectiveInstanceAssociationsRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeEffectiveInstanceAssociationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the current effective patches (the patch and the approval state) for the specified patch baseline. Note that this API applies only to Windows patch baselines.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEffectivePatchesForPatchBaseline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeEffectivePatchesForPatchBaselineResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidResourceId`, `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorUnsupportedOperatingSystem`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeEffectivePatchesForPatchBaselineRequest
 @see AWSSimpleSystemsManagerDescribeEffectivePatchesForPatchBaselineResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeEffectivePatchesForPatchBaselineResult *> *)describeEffectivePatchesForPatchBaseline:(AWSSimpleSystemsManagerDescribeEffectivePatchesForPatchBaselineRequest *)request;

/**
 <p>Retrieves the current effective patches (the patch and the approval state) for the specified patch baseline. Note that this API applies only to Windows patch baselines.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEffectivePatchesForPatchBaseline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidResourceId`, `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorUnsupportedOperatingSystem`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeEffectivePatchesForPatchBaselineRequest
 @see AWSSimpleSystemsManagerDescribeEffectivePatchesForPatchBaselineResult
 */
- (void)describeEffectivePatchesForPatchBaseline:(AWSSimpleSystemsManagerDescribeEffectivePatchesForPatchBaselineRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeEffectivePatchesForPatchBaselineResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>The status of the associations for the instance(s).</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceAssociationsStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeInstanceAssociationsStatusResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerDescribeInstanceAssociationsStatusRequest
 @see AWSSimpleSystemsManagerDescribeInstanceAssociationsStatusResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeInstanceAssociationsStatusResult *> *)describeInstanceAssociationsStatus:(AWSSimpleSystemsManagerDescribeInstanceAssociationsStatusRequest *)request;

/**
 <p>The status of the associations for the instance(s).</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceAssociationsStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerDescribeInstanceAssociationsStatusRequest
 @see AWSSimpleSystemsManagerDescribeInstanceAssociationsStatusResult
 */
- (void)describeInstanceAssociationsStatus:(AWSSimpleSystemsManagerDescribeInstanceAssociationsStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeInstanceAssociationsStatusResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your instances, including information about the operating system platform, the version of SSM Agent installed on the instance, instance status, and so on.</p><p>If you specify one or more instance IDs, it returns information for those instances. If you do not specify instance IDs, it returns information for all your instances. If you specify an instance ID that is not valid or an instance that you do not own, you receive an error.</p><note><p>The IamRole field for this API action is the Amazon Identity and Access Management (IAM) role assigned to on-premises instances. This call does not return the IAM role for EC2 instances.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceInformation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeInstanceInformationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorInvalidInstanceInformationFilterValue`, `AWSSimpleSystemsManagerErrorInvalidFilterKey`.
 
 @see AWSSimpleSystemsManagerDescribeInstanceInformationRequest
 @see AWSSimpleSystemsManagerDescribeInstanceInformationResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeInstanceInformationResult *> *)describeInstanceInformation:(AWSSimpleSystemsManagerDescribeInstanceInformationRequest *)request;

/**
 <p>Describes one or more of your instances, including information about the operating system platform, the version of SSM Agent installed on the instance, instance status, and so on.</p><p>If you specify one or more instance IDs, it returns information for those instances. If you do not specify instance IDs, it returns information for all your instances. If you specify an instance ID that is not valid or an instance that you do not own, you receive an error.</p><note><p>The IamRole field for this API action is the Amazon Identity and Access Management (IAM) role assigned to on-premises instances. This call does not return the IAM role for EC2 instances.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceInformation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorInvalidInstanceInformationFilterValue`, `AWSSimpleSystemsManagerErrorInvalidFilterKey`.
 
 @see AWSSimpleSystemsManagerDescribeInstanceInformationRequest
 @see AWSSimpleSystemsManagerDescribeInstanceInformationResult
 */
- (void)describeInstanceInformation:(AWSSimpleSystemsManagerDescribeInstanceInformationRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeInstanceInformationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the high-level patch state of one or more instances.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstancePatchStates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeInstancePatchStatesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerDescribeInstancePatchStatesRequest
 @see AWSSimpleSystemsManagerDescribeInstancePatchStatesResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeInstancePatchStatesResult *> *)describeInstancePatchStates:(AWSSimpleSystemsManagerDescribeInstancePatchStatesRequest *)request;

/**
 <p>Retrieves the high-level patch state of one or more instances.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstancePatchStates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerDescribeInstancePatchStatesRequest
 @see AWSSimpleSystemsManagerDescribeInstancePatchStatesResult
 */
- (void)describeInstancePatchStates:(AWSSimpleSystemsManagerDescribeInstancePatchStatesRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeInstancePatchStatesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the high-level patch state for the instances in the specified patch group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstancePatchStatesForPatchGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeInstancePatchStatesForPatchGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidFilter`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerDescribeInstancePatchStatesForPatchGroupRequest
 @see AWSSimpleSystemsManagerDescribeInstancePatchStatesForPatchGroupResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeInstancePatchStatesForPatchGroupResult *> *)describeInstancePatchStatesForPatchGroup:(AWSSimpleSystemsManagerDescribeInstancePatchStatesForPatchGroupRequest *)request;

/**
 <p>Retrieves the high-level patch state for the instances in the specified patch group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstancePatchStatesForPatchGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidFilter`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerDescribeInstancePatchStatesForPatchGroupRequest
 @see AWSSimpleSystemsManagerDescribeInstancePatchStatesForPatchGroupResult
 */
- (void)describeInstancePatchStatesForPatchGroup:(AWSSimpleSystemsManagerDescribeInstancePatchStatesForPatchGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeInstancePatchStatesForPatchGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the patches on the specified instance and their state relative to the patch baseline being used for the instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstancePatches service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeInstancePatchesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInvalidFilter`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerDescribeInstancePatchesRequest
 @see AWSSimpleSystemsManagerDescribeInstancePatchesResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeInstancePatchesResult *> *)describeInstancePatches:(AWSSimpleSystemsManagerDescribeInstancePatchesRequest *)request;

/**
 <p>Retrieves information about the patches on the specified instance and their state relative to the patch baseline being used for the instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstancePatches service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInvalidFilter`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerDescribeInstancePatchesRequest
 @see AWSSimpleSystemsManagerDescribeInstancePatchesResult
 */
- (void)describeInstancePatches:(AWSSimpleSystemsManagerDescribeInstancePatchesRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeInstancePatchesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes a specific delete inventory operation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInventoryDeletions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeInventoryDeletionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDeletionId`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerDescribeInventoryDeletionsRequest
 @see AWSSimpleSystemsManagerDescribeInventoryDeletionsResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeInventoryDeletionsResult *> *)describeInventoryDeletions:(AWSSimpleSystemsManagerDescribeInventoryDeletionsRequest *)request;

/**
 <p>Describes a specific delete inventory operation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInventoryDeletions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDeletionId`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerDescribeInventoryDeletionsRequest
 @see AWSSimpleSystemsManagerDescribeInventoryDeletionsResult
 */
- (void)describeInventoryDeletions:(AWSSimpleSystemsManagerDescribeInventoryDeletionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeInventoryDeletionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the individual task executions (one per target) for a particular task run as part of a maintenance window execution.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowExecutionTaskInvocations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTaskInvocationsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTaskInvocationsRequest
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTaskInvocationsResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTaskInvocationsResult *> *)describeMaintenanceWindowExecutionTaskInvocations:(AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTaskInvocationsRequest *)request;

/**
 <p>Retrieves the individual task executions (one per target) for a particular task run as part of a maintenance window execution.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowExecutionTaskInvocations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTaskInvocationsRequest
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTaskInvocationsResult
 */
- (void)describeMaintenanceWindowExecutionTaskInvocations:(AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTaskInvocationsRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTaskInvocationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>For a given maintenance window execution, lists the tasks that were run.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowExecutionTasks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTasksResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTasksRequest
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTasksResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTasksResult *> *)describeMaintenanceWindowExecutionTasks:(AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTasksRequest *)request;

/**
 <p>For a given maintenance window execution, lists the tasks that were run.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowExecutionTasks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTasksRequest
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTasksResult
 */
- (void)describeMaintenanceWindowExecutionTasks:(AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTasksRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTasksResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the executions of a maintenance window. This includes information about when the maintenance window was scheduled to be active, and information about tasks registered and run with the maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowExecutions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionsRequest
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionsResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionsResult *> *)describeMaintenanceWindowExecutions:(AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionsRequest *)request;

/**
 <p>Lists the executions of a maintenance window. This includes information about when the maintenance window was scheduled to be active, and information about tasks registered and run with the maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowExecutions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionsRequest
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionsResult
 */
- (void)describeMaintenanceWindowExecutions:(AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about upcoming executions of a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeMaintenanceWindowScheduleResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorDoesNotExist`.
 
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowScheduleRequest
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowScheduleResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeMaintenanceWindowScheduleResult *> *)describeMaintenanceWindowSchedule:(AWSSimpleSystemsManagerDescribeMaintenanceWindowScheduleRequest *)request;

/**
 <p>Retrieves information about upcoming executions of a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorDoesNotExist`.
 
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowScheduleRequest
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowScheduleResult
 */
- (void)describeMaintenanceWindowSchedule:(AWSSimpleSystemsManagerDescribeMaintenanceWindowScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeMaintenanceWindowScheduleResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the targets registered with the maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowTargets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeMaintenanceWindowTargetsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowTargetsRequest
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowTargetsResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeMaintenanceWindowTargetsResult *> *)describeMaintenanceWindowTargets:(AWSSimpleSystemsManagerDescribeMaintenanceWindowTargetsRequest *)request;

/**
 <p>Lists the targets registered with the maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowTargets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowTargetsRequest
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowTargetsResult
 */
- (void)describeMaintenanceWindowTargets:(AWSSimpleSystemsManagerDescribeMaintenanceWindowTargetsRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeMaintenanceWindowTargetsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tasks in a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowTasks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeMaintenanceWindowTasksResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowTasksRequest
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowTasksResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeMaintenanceWindowTasksResult *> *)describeMaintenanceWindowTasks:(AWSSimpleSystemsManagerDescribeMaintenanceWindowTasksRequest *)request;

/**
 <p>Lists the tasks in a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowTasks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowTasksRequest
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowTasksResult
 */
- (void)describeMaintenanceWindowTasks:(AWSSimpleSystemsManagerDescribeMaintenanceWindowTasksRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeMaintenanceWindowTasksResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the maintenance windows in an AWS account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindows service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeMaintenanceWindowsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowsRequest
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowsResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeMaintenanceWindowsResult *> *)describeMaintenanceWindows:(AWSSimpleSystemsManagerDescribeMaintenanceWindowsRequest *)request;

/**
 <p>Retrieves the maintenance windows in an AWS account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindows service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowsRequest
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowsResult
 */
- (void)describeMaintenanceWindows:(AWSSimpleSystemsManagerDescribeMaintenanceWindowsRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeMaintenanceWindowsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the maintenance window targets or tasks that an instance is associated with.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowsForTarget service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeMaintenanceWindowsForTargetResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowsForTargetRequest
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowsForTargetResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeMaintenanceWindowsForTargetResult *> *)describeMaintenanceWindowsForTarget:(AWSSimpleSystemsManagerDescribeMaintenanceWindowsForTargetRequest *)request;

/**
 <p>Retrieves information about the maintenance window targets or tasks that an instance is associated with.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowsForTarget service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowsForTargetRequest
 @see AWSSimpleSystemsManagerDescribeMaintenanceWindowsForTargetResult
 */
- (void)describeMaintenanceWindowsForTarget:(AWSSimpleSystemsManagerDescribeMaintenanceWindowsForTargetRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeMaintenanceWindowsForTargetResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Query a set of OpsItems. You must have permission in AWS Identity and Access Management (IAM) to query a list of OpsItems. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeOpsItems service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeOpsItemsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeOpsItemsRequest
 @see AWSSimpleSystemsManagerDescribeOpsItemsResponse
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeOpsItemsResponse *> *)describeOpsItems:(AWSSimpleSystemsManagerDescribeOpsItemsRequest *)request;

/**
 <p>Query a set of OpsItems. You must have permission in AWS Identity and Access Management (IAM) to query a list of OpsItems. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeOpsItems service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribeOpsItemsRequest
 @see AWSSimpleSystemsManagerDescribeOpsItemsResponse
 */
- (void)describeOpsItems:(AWSSimpleSystemsManagerDescribeOpsItemsRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeOpsItemsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get information about a parameter.</p><note><p>Request results are returned on a best-effort basis. If you specify <code>MaxResults</code> in the request, the response includes information up to the limit specified. The number of items returned, however, can be between zero and the value of <code>MaxResults</code>. If the service reaches an internal limit while processing the results, it stops the operation and returns the matching values up to that point and a <code>NextToken</code>. You can specify the <code>NextToken</code> in a subsequent call to get the next set of results.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeParametersResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidFilterKey`, `AWSSimpleSystemsManagerErrorInvalidFilterOption`, `AWSSimpleSystemsManagerErrorInvalidFilterValue`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerDescribeParametersRequest
 @see AWSSimpleSystemsManagerDescribeParametersResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeParametersResult *> *)describeParameters:(AWSSimpleSystemsManagerDescribeParametersRequest *)request;

/**
 <p>Get information about a parameter.</p><note><p>Request results are returned on a best-effort basis. If you specify <code>MaxResults</code> in the request, the response includes information up to the limit specified. The number of items returned, however, can be between zero and the value of <code>MaxResults</code>. If the service reaches an internal limit while processing the results, it stops the operation and returns the matching values up to that point and a <code>NextToken</code>. You can specify the <code>NextToken</code> in a subsequent call to get the next set of results.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidFilterKey`, `AWSSimpleSystemsManagerErrorInvalidFilterOption`, `AWSSimpleSystemsManagerErrorInvalidFilterValue`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerDescribeParametersRequest
 @see AWSSimpleSystemsManagerDescribeParametersResult
 */
- (void)describeParameters:(AWSSimpleSystemsManagerDescribeParametersRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeParametersResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the patch baselines in your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the DescribePatchBaselines service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribePatchBaselinesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribePatchBaselinesRequest
 @see AWSSimpleSystemsManagerDescribePatchBaselinesResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribePatchBaselinesResult *> *)describePatchBaselines:(AWSSimpleSystemsManagerDescribePatchBaselinesRequest *)request;

/**
 <p>Lists the patch baselines in your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the DescribePatchBaselines service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribePatchBaselinesRequest
 @see AWSSimpleSystemsManagerDescribePatchBaselinesResult
 */
- (void)describePatchBaselines:(AWSSimpleSystemsManagerDescribePatchBaselinesRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribePatchBaselinesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns high-level aggregated patch compliance state for a patch group.</p>
 
 @param request A container for the necessary parameters to execute the DescribePatchGroupState service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribePatchGroupStateResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerDescribePatchGroupStateRequest
 @see AWSSimpleSystemsManagerDescribePatchGroupStateResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribePatchGroupStateResult *> *)describePatchGroupState:(AWSSimpleSystemsManagerDescribePatchGroupStateRequest *)request;

/**
 <p>Returns high-level aggregated patch compliance state for a patch group.</p>
 
 @param request A container for the necessary parameters to execute the DescribePatchGroupState service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerDescribePatchGroupStateRequest
 @see AWSSimpleSystemsManagerDescribePatchGroupStateResult
 */
- (void)describePatchGroupState:(AWSSimpleSystemsManagerDescribePatchGroupStateRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribePatchGroupStateResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all patch groups that have been registered with patch baselines.</p>
 
 @param request A container for the necessary parameters to execute the DescribePatchGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribePatchGroupsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribePatchGroupsRequest
 @see AWSSimpleSystemsManagerDescribePatchGroupsResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribePatchGroupsResult *> *)describePatchGroups:(AWSSimpleSystemsManagerDescribePatchGroupsRequest *)request;

/**
 <p>Lists all patch groups that have been registered with patch baselines.</p>
 
 @param request A container for the necessary parameters to execute the DescribePatchGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribePatchGroupsRequest
 @see AWSSimpleSystemsManagerDescribePatchGroupsResult
 */
- (void)describePatchGroups:(AWSSimpleSystemsManagerDescribePatchGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribePatchGroupsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the properties of available patches organized by product, product family, classification, severity, and other properties of available patches. You can use the reported properties in the filters you specify in requests for actions such as <a>CreatePatchBaseline</a>, <a>UpdatePatchBaseline</a>, <a>DescribeAvailablePatches</a>, and <a>DescribePatchBaselines</a>.</p><p>The following section lists the properties that can be used in filters for each major operating system type:</p><dl><dt>WINDOWS</dt><dd><p>Valid properties: PRODUCT, PRODUCT_FAMILY, CLASSIFICATION, MSRC_SEVERITY</p></dd><dt>AMAZON_LINUX</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd><dt>AMAZON_LINUX_2</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd><dt>UBUNTU </dt><dd><p>Valid properties: PRODUCT, PRIORITY</p></dd><dt>REDHAT_ENTERPRISE_LINUX</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd><dt>SUSE</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd><dt>CENTOS</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd></dl>
 
 @param request A container for the necessary parameters to execute the DescribePatchProperties service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribePatchPropertiesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribePatchPropertiesRequest
 @see AWSSimpleSystemsManagerDescribePatchPropertiesResult
 */
- (AWSTask<AWSSimpleSystemsManagerDescribePatchPropertiesResult *> *)describePatchProperties:(AWSSimpleSystemsManagerDescribePatchPropertiesRequest *)request;

/**
 <p>Lists the properties of available patches organized by product, product family, classification, severity, and other properties of available patches. You can use the reported properties in the filters you specify in requests for actions such as <a>CreatePatchBaseline</a>, <a>UpdatePatchBaseline</a>, <a>DescribeAvailablePatches</a>, and <a>DescribePatchBaselines</a>.</p><p>The following section lists the properties that can be used in filters for each major operating system type:</p><dl><dt>WINDOWS</dt><dd><p>Valid properties: PRODUCT, PRODUCT_FAMILY, CLASSIFICATION, MSRC_SEVERITY</p></dd><dt>AMAZON_LINUX</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd><dt>AMAZON_LINUX_2</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd><dt>UBUNTU </dt><dd><p>Valid properties: PRODUCT, PRIORITY</p></dd><dt>REDHAT_ENTERPRISE_LINUX</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd><dt>SUSE</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd><dt>CENTOS</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd></dl>
 
 @param request A container for the necessary parameters to execute the DescribePatchProperties service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerDescribePatchPropertiesRequest
 @see AWSSimpleSystemsManagerDescribePatchPropertiesResult
 */
- (void)describePatchProperties:(AWSSimpleSystemsManagerDescribePatchPropertiesRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribePatchPropertiesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of all active sessions (both connected and disconnected) or terminated sessions from the past 30 days.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSessions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerDescribeSessionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidFilterKey`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerDescribeSessionsRequest
 @see AWSSimpleSystemsManagerDescribeSessionsResponse
 */
- (AWSTask<AWSSimpleSystemsManagerDescribeSessionsResponse *> *)describeSessions:(AWSSimpleSystemsManagerDescribeSessionsRequest *)request;

/**
 <p>Retrieves a list of all active sessions (both connected and disconnected) or terminated sessions from the past 30 days.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSessions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidFilterKey`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerDescribeSessionsRequest
 @see AWSSimpleSystemsManagerDescribeSessionsResponse
 */
- (void)describeSessions:(AWSSimpleSystemsManagerDescribeSessionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerDescribeSessionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get detailed information about a particular Automation execution.</p>
 
 @param request A container for the necessary parameters to execute the GetAutomationExecution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerGetAutomationExecutionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorAutomationExecutionNotFound`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerGetAutomationExecutionRequest
 @see AWSSimpleSystemsManagerGetAutomationExecutionResult
 */
- (AWSTask<AWSSimpleSystemsManagerGetAutomationExecutionResult *> *)getAutomationExecution:(AWSSimpleSystemsManagerGetAutomationExecutionRequest *)request;

/**
 <p>Get detailed information about a particular Automation execution.</p>
 
 @param request A container for the necessary parameters to execute the GetAutomationExecution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorAutomationExecutionNotFound`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerGetAutomationExecutionRequest
 @see AWSSimpleSystemsManagerGetAutomationExecutionResult
 */
- (void)getAutomationExecution:(AWSSimpleSystemsManagerGetAutomationExecutionRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerGetAutomationExecutionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the state of the AWS Systems Manager Change Calendar at an optional, specified time. If you specify a time, <code>GetCalendarState</code> returns the state of the calendar at a specific time, and returns the next time that the Change Calendar state will transition. If you do not specify a time, <code>GetCalendarState</code> assumes the current time. Change Calendar entries have two possible states: <code>OPEN</code> or <code>CLOSED</code>. For more information about Systems Manager Change Calendar, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar.html">AWS Systems Manager Change Calendar</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetCalendarState service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerGetCalendarStateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidDocumentType`, `AWSSimpleSystemsManagerErrorUnsupportedCalendar`.
 
 @see AWSSimpleSystemsManagerGetCalendarStateRequest
 @see AWSSimpleSystemsManagerGetCalendarStateResponse
 */
- (AWSTask<AWSSimpleSystemsManagerGetCalendarStateResponse *> *)getCalendarState:(AWSSimpleSystemsManagerGetCalendarStateRequest *)request;

/**
 <p>Gets the state of the AWS Systems Manager Change Calendar at an optional, specified time. If you specify a time, <code>GetCalendarState</code> returns the state of the calendar at a specific time, and returns the next time that the Change Calendar state will transition. If you do not specify a time, <code>GetCalendarState</code> assumes the current time. Change Calendar entries have two possible states: <code>OPEN</code> or <code>CLOSED</code>. For more information about Systems Manager Change Calendar, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar.html">AWS Systems Manager Change Calendar</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetCalendarState service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidDocumentType`, `AWSSimpleSystemsManagerErrorUnsupportedCalendar`.
 
 @see AWSSimpleSystemsManagerGetCalendarStateRequest
 @see AWSSimpleSystemsManagerGetCalendarStateResponse
 */
- (void)getCalendarState:(AWSSimpleSystemsManagerGetCalendarStateRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerGetCalendarStateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns detailed information about command execution for an invocation or plugin. </p>
 
 @param request A container for the necessary parameters to execute the GetCommandInvocation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerGetCommandInvocationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidCommandId`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInvalidPluginName`, `AWSSimpleSystemsManagerErrorInvocationDoesNotExist`.
 
 @see AWSSimpleSystemsManagerGetCommandInvocationRequest
 @see AWSSimpleSystemsManagerGetCommandInvocationResult
 */
- (AWSTask<AWSSimpleSystemsManagerGetCommandInvocationResult *> *)getCommandInvocation:(AWSSimpleSystemsManagerGetCommandInvocationRequest *)request;

/**
 <p>Returns detailed information about command execution for an invocation or plugin. </p>
 
 @param request A container for the necessary parameters to execute the GetCommandInvocation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidCommandId`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInvalidPluginName`, `AWSSimpleSystemsManagerErrorInvocationDoesNotExist`.
 
 @see AWSSimpleSystemsManagerGetCommandInvocationRequest
 @see AWSSimpleSystemsManagerGetCommandInvocationResult
 */
- (void)getCommandInvocation:(AWSSimpleSystemsManagerGetCommandInvocationRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerGetCommandInvocationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the Session Manager connection status for an instance to determine whether it is running and ready to receive Session Manager connections.</p>
 
 @param request A container for the necessary parameters to execute the GetConnectionStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerGetConnectionStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerGetConnectionStatusRequest
 @see AWSSimpleSystemsManagerGetConnectionStatusResponse
 */
- (AWSTask<AWSSimpleSystemsManagerGetConnectionStatusResponse *> *)getConnectionStatus:(AWSSimpleSystemsManagerGetConnectionStatusRequest *)request;

/**
 <p>Retrieves the Session Manager connection status for an instance to determine whether it is running and ready to receive Session Manager connections.</p>
 
 @param request A container for the necessary parameters to execute the GetConnectionStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerGetConnectionStatusRequest
 @see AWSSimpleSystemsManagerGetConnectionStatusResponse
 */
- (void)getConnectionStatus:(AWSSimpleSystemsManagerGetConnectionStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerGetConnectionStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the default patch baseline. Note that Systems Manager supports creating multiple default patch baselines. For example, you can create a default patch baseline for each operating system.</p><p>If you do not specify an operating system value, the default patch baseline for Windows is returned.</p>
 
 @param request A container for the necessary parameters to execute the GetDefaultPatchBaseline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerGetDefaultPatchBaselineResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerGetDefaultPatchBaselineRequest
 @see AWSSimpleSystemsManagerGetDefaultPatchBaselineResult
 */
- (AWSTask<AWSSimpleSystemsManagerGetDefaultPatchBaselineResult *> *)getDefaultPatchBaseline:(AWSSimpleSystemsManagerGetDefaultPatchBaselineRequest *)request;

/**
 <p>Retrieves the default patch baseline. Note that Systems Manager supports creating multiple default patch baselines. For example, you can create a default patch baseline for each operating system.</p><p>If you do not specify an operating system value, the default patch baseline for Windows is returned.</p>
 
 @param request A container for the necessary parameters to execute the GetDefaultPatchBaseline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerGetDefaultPatchBaselineRequest
 @see AWSSimpleSystemsManagerGetDefaultPatchBaselineResult
 */
- (void)getDefaultPatchBaseline:(AWSSimpleSystemsManagerGetDefaultPatchBaselineRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerGetDefaultPatchBaselineResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the current snapshot for the patch baseline the instance uses. This API is primarily used by the AWS-RunPatchBaseline Systems Manager document. </p>
 
 @param request A container for the necessary parameters to execute the GetDeployablePatchSnapshotForInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerGetDeployablePatchSnapshotForInstanceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorUnsupportedOperatingSystem`, `AWSSimpleSystemsManagerErrorUnsupportedFeatureRequired`.
 
 @see AWSSimpleSystemsManagerGetDeployablePatchSnapshotForInstanceRequest
 @see AWSSimpleSystemsManagerGetDeployablePatchSnapshotForInstanceResult
 */
- (AWSTask<AWSSimpleSystemsManagerGetDeployablePatchSnapshotForInstanceResult *> *)getDeployablePatchSnapshotForInstance:(AWSSimpleSystemsManagerGetDeployablePatchSnapshotForInstanceRequest *)request;

/**
 <p>Retrieves the current snapshot for the patch baseline the instance uses. This API is primarily used by the AWS-RunPatchBaseline Systems Manager document. </p>
 
 @param request A container for the necessary parameters to execute the GetDeployablePatchSnapshotForInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorUnsupportedOperatingSystem`, `AWSSimpleSystemsManagerErrorUnsupportedFeatureRequired`.
 
 @see AWSSimpleSystemsManagerGetDeployablePatchSnapshotForInstanceRequest
 @see AWSSimpleSystemsManagerGetDeployablePatchSnapshotForInstanceResult
 */
- (void)getDeployablePatchSnapshotForInstance:(AWSSimpleSystemsManagerGetDeployablePatchSnapshotForInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerGetDeployablePatchSnapshotForInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the contents of the specified Systems Manager document.</p>
 
 @param request A container for the necessary parameters to execute the GetDocument service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerGetDocumentResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidDocumentVersion`.
 
 @see AWSSimpleSystemsManagerGetDocumentRequest
 @see AWSSimpleSystemsManagerGetDocumentResult
 */
- (AWSTask<AWSSimpleSystemsManagerGetDocumentResult *> *)getDocument:(AWSSimpleSystemsManagerGetDocumentRequest *)request;

/**
 <p>Gets the contents of the specified Systems Manager document.</p>
 
 @param request A container for the necessary parameters to execute the GetDocument service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidDocumentVersion`.
 
 @see AWSSimpleSystemsManagerGetDocumentRequest
 @see AWSSimpleSystemsManagerGetDocumentResult
 */
- (void)getDocument:(AWSSimpleSystemsManagerGetDocumentRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerGetDocumentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Query inventory information.</p>
 
 @param request A container for the necessary parameters to execute the GetInventory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerGetInventoryResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidFilter`, `AWSSimpleSystemsManagerErrorInvalidInventoryGroup`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorInvalidTypeName`, `AWSSimpleSystemsManagerErrorInvalidAggregator`, `AWSSimpleSystemsManagerErrorInvalidResultAttribute`.
 
 @see AWSSimpleSystemsManagerGetInventoryRequest
 @see AWSSimpleSystemsManagerGetInventoryResult
 */
- (AWSTask<AWSSimpleSystemsManagerGetInventoryResult *> *)getInventory:(AWSSimpleSystemsManagerGetInventoryRequest *)request;

/**
 <p>Query inventory information.</p>
 
 @param request A container for the necessary parameters to execute the GetInventory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidFilter`, `AWSSimpleSystemsManagerErrorInvalidInventoryGroup`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorInvalidTypeName`, `AWSSimpleSystemsManagerErrorInvalidAggregator`, `AWSSimpleSystemsManagerErrorInvalidResultAttribute`.
 
 @see AWSSimpleSystemsManagerGetInventoryRequest
 @see AWSSimpleSystemsManagerGetInventoryResult
 */
- (void)getInventory:(AWSSimpleSystemsManagerGetInventoryRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerGetInventoryResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Return a list of inventory type names for the account, or return a list of attribute names for a specific Inventory item type.</p>
 
 @param request A container for the necessary parameters to execute the GetInventorySchema service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerGetInventorySchemaResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidTypeName`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerGetInventorySchemaRequest
 @see AWSSimpleSystemsManagerGetInventorySchemaResult
 */
- (AWSTask<AWSSimpleSystemsManagerGetInventorySchemaResult *> *)getInventorySchema:(AWSSimpleSystemsManagerGetInventorySchemaRequest *)request;

/**
 <p>Return a list of inventory type names for the account, or return a list of attribute names for a specific Inventory item type.</p>
 
 @param request A container for the necessary parameters to execute the GetInventorySchema service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidTypeName`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerGetInventorySchemaRequest
 @see AWSSimpleSystemsManagerGetInventorySchemaResult
 */
- (void)getInventorySchema:(AWSSimpleSystemsManagerGetInventorySchemaRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerGetInventorySchemaResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerGetMaintenanceWindowResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerGetMaintenanceWindowRequest
 @see AWSSimpleSystemsManagerGetMaintenanceWindowResult
 */
- (AWSTask<AWSSimpleSystemsManagerGetMaintenanceWindowResult *> *)getMaintenanceWindow:(AWSSimpleSystemsManagerGetMaintenanceWindowRequest *)request;

/**
 <p>Retrieves a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerGetMaintenanceWindowRequest
 @see AWSSimpleSystemsManagerGetMaintenanceWindowResult
 */
- (void)getMaintenanceWindow:(AWSSimpleSystemsManagerGetMaintenanceWindowRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerGetMaintenanceWindowResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves details about a specific a maintenance window execution.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindowExecution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerGetMaintenanceWindowExecutionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerGetMaintenanceWindowExecutionRequest
 @see AWSSimpleSystemsManagerGetMaintenanceWindowExecutionResult
 */
- (AWSTask<AWSSimpleSystemsManagerGetMaintenanceWindowExecutionResult *> *)getMaintenanceWindowExecution:(AWSSimpleSystemsManagerGetMaintenanceWindowExecutionRequest *)request;

/**
 <p>Retrieves details about a specific a maintenance window execution.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindowExecution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerGetMaintenanceWindowExecutionRequest
 @see AWSSimpleSystemsManagerGetMaintenanceWindowExecutionResult
 */
- (void)getMaintenanceWindowExecution:(AWSSimpleSystemsManagerGetMaintenanceWindowExecutionRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerGetMaintenanceWindowExecutionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the details about a specific task run as part of a maintenance window execution.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindowExecutionTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskRequest
 @see AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskResult
 */
- (AWSTask<AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskResult *> *)getMaintenanceWindowExecutionTask:(AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskRequest *)request;

/**
 <p>Retrieves the details about a specific task run as part of a maintenance window execution.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindowExecutionTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskRequest
 @see AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskResult
 */
- (void)getMaintenanceWindowExecutionTask:(AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a specific task running on a specific target.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindowExecutionTaskInvocation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskInvocationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskInvocationRequest
 @see AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskInvocationResult
 */
- (AWSTask<AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskInvocationResult *> *)getMaintenanceWindowExecutionTaskInvocation:(AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskInvocationRequest *)request;

/**
 <p>Retrieves information about a specific task running on a specific target.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindowExecutionTaskInvocation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskInvocationRequest
 @see AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskInvocationResult
 */
- (void)getMaintenanceWindowExecutionTaskInvocation:(AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskInvocationRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskInvocationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tasks in a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindowTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerGetMaintenanceWindowTaskResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerGetMaintenanceWindowTaskRequest
 @see AWSSimpleSystemsManagerGetMaintenanceWindowTaskResult
 */
- (AWSTask<AWSSimpleSystemsManagerGetMaintenanceWindowTaskResult *> *)getMaintenanceWindowTask:(AWSSimpleSystemsManagerGetMaintenanceWindowTaskRequest *)request;

/**
 <p>Lists the tasks in a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindowTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerGetMaintenanceWindowTaskRequest
 @see AWSSimpleSystemsManagerGetMaintenanceWindowTaskResult
 */
- (void)getMaintenanceWindowTask:(AWSSimpleSystemsManagerGetMaintenanceWindowTaskRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerGetMaintenanceWindowTaskResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get information about an OpsItem by using the ID. You must have permission in AWS Identity and Access Management (IAM) to view information about an OpsItem. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the GetOpsItem service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerGetOpsItemResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorOpsItemNotFound`.
 
 @see AWSSimpleSystemsManagerGetOpsItemRequest
 @see AWSSimpleSystemsManagerGetOpsItemResponse
 */
- (AWSTask<AWSSimpleSystemsManagerGetOpsItemResponse *> *)getOpsItem:(AWSSimpleSystemsManagerGetOpsItemRequest *)request;

/**
 <p>Get information about an OpsItem by using the ID. You must have permission in AWS Identity and Access Management (IAM) to view information about an OpsItem. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the GetOpsItem service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorOpsItemNotFound`.
 
 @see AWSSimpleSystemsManagerGetOpsItemRequest
 @see AWSSimpleSystemsManagerGetOpsItemResponse
 */
- (void)getOpsItem:(AWSSimpleSystemsManagerGetOpsItemRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerGetOpsItemResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>View a summary of OpsItems based on specified filters and aggregators.</p>
 
 @param request A container for the necessary parameters to execute the GetOpsSummary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerGetOpsSummaryResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorResourceDataSyncNotFound`, `AWSSimpleSystemsManagerErrorInvalidFilter`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorInvalidTypeName`, `AWSSimpleSystemsManagerErrorInvalidAggregator`.
 
 @see AWSSimpleSystemsManagerGetOpsSummaryRequest
 @see AWSSimpleSystemsManagerGetOpsSummaryResult
 */
- (AWSTask<AWSSimpleSystemsManagerGetOpsSummaryResult *> *)getOpsSummary:(AWSSimpleSystemsManagerGetOpsSummaryRequest *)request;

/**
 <p>View a summary of OpsItems based on specified filters and aggregators.</p>
 
 @param request A container for the necessary parameters to execute the GetOpsSummary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorResourceDataSyncNotFound`, `AWSSimpleSystemsManagerErrorInvalidFilter`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorInvalidTypeName`, `AWSSimpleSystemsManagerErrorInvalidAggregator`.
 
 @see AWSSimpleSystemsManagerGetOpsSummaryRequest
 @see AWSSimpleSystemsManagerGetOpsSummaryResult
 */
- (void)getOpsSummary:(AWSSimpleSystemsManagerGetOpsSummaryRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerGetOpsSummaryResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get information about a parameter by using the parameter name. Don't confuse this API action with the <a>GetParameters</a> API action.</p>
 
 @param request A container for the necessary parameters to execute the GetParameter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerGetParameterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidKeyId`, `AWSSimpleSystemsManagerErrorParameterNotFound`, `AWSSimpleSystemsManagerErrorParameterVersionNotFound`.
 
 @see AWSSimpleSystemsManagerGetParameterRequest
 @see AWSSimpleSystemsManagerGetParameterResult
 */
- (AWSTask<AWSSimpleSystemsManagerGetParameterResult *> *)getParameter:(AWSSimpleSystemsManagerGetParameterRequest *)request;

/**
 <p>Get information about a parameter by using the parameter name. Don't confuse this API action with the <a>GetParameters</a> API action.</p>
 
 @param request A container for the necessary parameters to execute the GetParameter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidKeyId`, `AWSSimpleSystemsManagerErrorParameterNotFound`, `AWSSimpleSystemsManagerErrorParameterVersionNotFound`.
 
 @see AWSSimpleSystemsManagerGetParameterRequest
 @see AWSSimpleSystemsManagerGetParameterResult
 */
- (void)getParameter:(AWSSimpleSystemsManagerGetParameterRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerGetParameterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Query a list of all parameters used by the AWS account.</p>
 
 @param request A container for the necessary parameters to execute the GetParameterHistory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerGetParameterHistoryResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorParameterNotFound`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorInvalidKeyId`.
 
 @see AWSSimpleSystemsManagerGetParameterHistoryRequest
 @see AWSSimpleSystemsManagerGetParameterHistoryResult
 */
- (AWSTask<AWSSimpleSystemsManagerGetParameterHistoryResult *> *)getParameterHistory:(AWSSimpleSystemsManagerGetParameterHistoryRequest *)request;

/**
 <p>Query a list of all parameters used by the AWS account.</p>
 
 @param request A container for the necessary parameters to execute the GetParameterHistory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorParameterNotFound`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorInvalidKeyId`.
 
 @see AWSSimpleSystemsManagerGetParameterHistoryRequest
 @see AWSSimpleSystemsManagerGetParameterHistoryResult
 */
- (void)getParameterHistory:(AWSSimpleSystemsManagerGetParameterHistoryRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerGetParameterHistoryResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get details of a parameter. Don't confuse this API action with the <a>GetParameter</a> API action.</p>
 
 @param request A container for the necessary parameters to execute the GetParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerGetParametersResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidKeyId`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerGetParametersRequest
 @see AWSSimpleSystemsManagerGetParametersResult
 */
- (AWSTask<AWSSimpleSystemsManagerGetParametersResult *> *)getParameters:(AWSSimpleSystemsManagerGetParametersRequest *)request;

/**
 <p>Get details of a parameter. Don't confuse this API action with the <a>GetParameter</a> API action.</p>
 
 @param request A container for the necessary parameters to execute the GetParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidKeyId`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerGetParametersRequest
 @see AWSSimpleSystemsManagerGetParametersResult
 */
- (void)getParameters:(AWSSimpleSystemsManagerGetParametersRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerGetParametersResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve information about one or more parameters in a specific hierarchy. </p><note><p>Request results are returned on a best-effort basis. If you specify <code>MaxResults</code> in the request, the response includes information up to the limit specified. The number of items returned, however, can be between zero and the value of <code>MaxResults</code>. If the service reaches an internal limit while processing the results, it stops the operation and returns the matching values up to that point and a <code>NextToken</code>. You can specify the <code>NextToken</code> in a subsequent call to get the next set of results.</p></note>
 
 @param request A container for the necessary parameters to execute the GetParametersByPath service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerGetParametersByPathResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidFilterKey`, `AWSSimpleSystemsManagerErrorInvalidFilterOption`, `AWSSimpleSystemsManagerErrorInvalidFilterValue`, `AWSSimpleSystemsManagerErrorInvalidKeyId`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerGetParametersByPathRequest
 @see AWSSimpleSystemsManagerGetParametersByPathResult
 */
- (AWSTask<AWSSimpleSystemsManagerGetParametersByPathResult *> *)getParametersByPath:(AWSSimpleSystemsManagerGetParametersByPathRequest *)request;

/**
 <p>Retrieve information about one or more parameters in a specific hierarchy. </p><note><p>Request results are returned on a best-effort basis. If you specify <code>MaxResults</code> in the request, the response includes information up to the limit specified. The number of items returned, however, can be between zero and the value of <code>MaxResults</code>. If the service reaches an internal limit while processing the results, it stops the operation and returns the matching values up to that point and a <code>NextToken</code>. You can specify the <code>NextToken</code> in a subsequent call to get the next set of results.</p></note>
 
 @param request A container for the necessary parameters to execute the GetParametersByPath service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidFilterKey`, `AWSSimpleSystemsManagerErrorInvalidFilterOption`, `AWSSimpleSystemsManagerErrorInvalidFilterValue`, `AWSSimpleSystemsManagerErrorInvalidKeyId`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerGetParametersByPathRequest
 @see AWSSimpleSystemsManagerGetParametersByPathResult
 */
- (void)getParametersByPath:(AWSSimpleSystemsManagerGetParametersByPathRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerGetParametersByPathResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a patch baseline.</p>
 
 @param request A container for the necessary parameters to execute the GetPatchBaseline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerGetPatchBaselineResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInvalidResourceId`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerGetPatchBaselineRequest
 @see AWSSimpleSystemsManagerGetPatchBaselineResult
 */
- (AWSTask<AWSSimpleSystemsManagerGetPatchBaselineResult *> *)getPatchBaseline:(AWSSimpleSystemsManagerGetPatchBaselineRequest *)request;

/**
 <p>Retrieves information about a patch baseline.</p>
 
 @param request A container for the necessary parameters to execute the GetPatchBaseline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInvalidResourceId`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerGetPatchBaselineRequest
 @see AWSSimpleSystemsManagerGetPatchBaselineResult
 */
- (void)getPatchBaseline:(AWSSimpleSystemsManagerGetPatchBaselineRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerGetPatchBaselineResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the patch baseline that should be used for the specified patch group.</p>
 
 @param request A container for the necessary parameters to execute the GetPatchBaselineForPatchGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerGetPatchBaselineForPatchGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerGetPatchBaselineForPatchGroupRequest
 @see AWSSimpleSystemsManagerGetPatchBaselineForPatchGroupResult
 */
- (AWSTask<AWSSimpleSystemsManagerGetPatchBaselineForPatchGroupResult *> *)getPatchBaselineForPatchGroup:(AWSSimpleSystemsManagerGetPatchBaselineForPatchGroupRequest *)request;

/**
 <p>Retrieves the patch baseline that should be used for the specified patch group.</p>
 
 @param request A container for the necessary parameters to execute the GetPatchBaselineForPatchGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerGetPatchBaselineForPatchGroupRequest
 @see AWSSimpleSystemsManagerGetPatchBaselineForPatchGroupResult
 */
- (void)getPatchBaselineForPatchGroup:(AWSSimpleSystemsManagerGetPatchBaselineForPatchGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerGetPatchBaselineForPatchGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p><code>ServiceSetting</code> is an account-level setting for an AWS service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an AWS service charges money to the account based on feature or service usage, then the AWS service team might create a default setting of "false". This means the user can't use this feature unless they change the setting to "true" and intentionally opt in for a paid feature.</p><p>Services map a <code>SettingId</code> object to a setting value. AWS services teams define the default value for a <code>SettingId</code>. You can't create a new <code>SettingId</code>, but you can overwrite the default value if you have the <code>ssm:UpdateServiceSetting</code> permission for the setting. Use the <a>UpdateServiceSetting</a> API action to change the default setting. Or use the <a>ResetServiceSetting</a> to change the value back to the original value defined by the AWS service team.</p><p>Query the current service setting for the account. </p>
 
 @param request A container for the necessary parameters to execute the GetServiceSetting service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerGetServiceSettingResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorServiceSettingNotFound`.
 
 @see AWSSimpleSystemsManagerGetServiceSettingRequest
 @see AWSSimpleSystemsManagerGetServiceSettingResult
 */
- (AWSTask<AWSSimpleSystemsManagerGetServiceSettingResult *> *)getServiceSetting:(AWSSimpleSystemsManagerGetServiceSettingRequest *)request;

/**
 <p><code>ServiceSetting</code> is an account-level setting for an AWS service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an AWS service charges money to the account based on feature or service usage, then the AWS service team might create a default setting of "false". This means the user can't use this feature unless they change the setting to "true" and intentionally opt in for a paid feature.</p><p>Services map a <code>SettingId</code> object to a setting value. AWS services teams define the default value for a <code>SettingId</code>. You can't create a new <code>SettingId</code>, but you can overwrite the default value if you have the <code>ssm:UpdateServiceSetting</code> permission for the setting. Use the <a>UpdateServiceSetting</a> API action to change the default setting. Or use the <a>ResetServiceSetting</a> to change the value back to the original value defined by the AWS service team.</p><p>Query the current service setting for the account. </p>
 
 @param request A container for the necessary parameters to execute the GetServiceSetting service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorServiceSettingNotFound`.
 
 @see AWSSimpleSystemsManagerGetServiceSettingRequest
 @see AWSSimpleSystemsManagerGetServiceSettingResult
 */
- (void)getServiceSetting:(AWSSimpleSystemsManagerGetServiceSettingRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerGetServiceSettingResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>A parameter label is a user-defined alias to help you manage different versions of a parameter. When you modify a parameter, Systems Manager automatically saves a new version and increments the version number by one. A label can help you remember the purpose of a parameter when there are multiple versions. </p><p>Parameter labels have the following requirements and restrictions.</p><ul><li><p>A version of a parameter can have a maximum of 10 labels.</p></li><li><p>You can't attach the same label to different versions of the same parameter. For example, if version 1 has the label Production, then you can't attach Production to version 2.</p></li><li><p>You can move a label from one version of a parameter to another.</p></li><li><p>You can't create a label when you create a new parameter. You must attach a label to a specific version of a parameter.</p></li><li><p>You can't delete a parameter label. If you no longer want to use a parameter label, then you must move it to a different version of a parameter.</p></li><li><p>A label can have a maximum of 100 characters.</p></li><li><p>Labels can contain letters (case sensitive), numbers, periods (.), hyphens (-), or underscores (_).</p></li><li><p>Labels can't begin with a number, "aws," or "ssm" (not case sensitive). If a label fails to meet these requirements, then the label is not associated with a parameter and the system displays it in the list of InvalidLabels.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the LabelParameterVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerLabelParameterVersionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorTooManyUpdates`, `AWSSimpleSystemsManagerErrorParameterNotFound`, `AWSSimpleSystemsManagerErrorParameterVersionNotFound`, `AWSSimpleSystemsManagerErrorParameterVersionLabelLimitExceeded`.
 
 @see AWSSimpleSystemsManagerLabelParameterVersionRequest
 @see AWSSimpleSystemsManagerLabelParameterVersionResult
 */
- (AWSTask<AWSSimpleSystemsManagerLabelParameterVersionResult *> *)labelParameterVersion:(AWSSimpleSystemsManagerLabelParameterVersionRequest *)request;

/**
 <p>A parameter label is a user-defined alias to help you manage different versions of a parameter. When you modify a parameter, Systems Manager automatically saves a new version and increments the version number by one. A label can help you remember the purpose of a parameter when there are multiple versions. </p><p>Parameter labels have the following requirements and restrictions.</p><ul><li><p>A version of a parameter can have a maximum of 10 labels.</p></li><li><p>You can't attach the same label to different versions of the same parameter. For example, if version 1 has the label Production, then you can't attach Production to version 2.</p></li><li><p>You can move a label from one version of a parameter to another.</p></li><li><p>You can't create a label when you create a new parameter. You must attach a label to a specific version of a parameter.</p></li><li><p>You can't delete a parameter label. If you no longer want to use a parameter label, then you must move it to a different version of a parameter.</p></li><li><p>A label can have a maximum of 100 characters.</p></li><li><p>Labels can contain letters (case sensitive), numbers, periods (.), hyphens (-), or underscores (_).</p></li><li><p>Labels can't begin with a number, "aws," or "ssm" (not case sensitive). If a label fails to meet these requirements, then the label is not associated with a parameter and the system displays it in the list of InvalidLabels.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the LabelParameterVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorTooManyUpdates`, `AWSSimpleSystemsManagerErrorParameterNotFound`, `AWSSimpleSystemsManagerErrorParameterVersionNotFound`, `AWSSimpleSystemsManagerErrorParameterVersionLabelLimitExceeded`.
 
 @see AWSSimpleSystemsManagerLabelParameterVersionRequest
 @see AWSSimpleSystemsManagerLabelParameterVersionResult
 */
- (void)labelParameterVersion:(AWSSimpleSystemsManagerLabelParameterVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerLabelParameterVersionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves all versions of an association for a specific association ID.</p>
 
 @param request A container for the necessary parameters to execute the ListAssociationVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerListAssociationVersionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorAssociationDoesNotExist`.
 
 @see AWSSimpleSystemsManagerListAssociationVersionsRequest
 @see AWSSimpleSystemsManagerListAssociationVersionsResult
 */
- (AWSTask<AWSSimpleSystemsManagerListAssociationVersionsResult *> *)listAssociationVersions:(AWSSimpleSystemsManagerListAssociationVersionsRequest *)request;

/**
 <p>Retrieves all versions of an association for a specific association ID.</p>
 
 @param request A container for the necessary parameters to execute the ListAssociationVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorAssociationDoesNotExist`.
 
 @see AWSSimpleSystemsManagerListAssociationVersionsRequest
 @see AWSSimpleSystemsManagerListAssociationVersionsResult
 */
- (void)listAssociationVersions:(AWSSimpleSystemsManagerListAssociationVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerListAssociationVersionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns all State Manager associations in the current AWS account and Region. You can limit the results to a specific State Manager association document or instance by specifying a filter.</p>
 
 @param request A container for the necessary parameters to execute the ListAssociations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerListAssociationsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerListAssociationsRequest
 @see AWSSimpleSystemsManagerListAssociationsResult
 */
- (AWSTask<AWSSimpleSystemsManagerListAssociationsResult *> *)listAssociations:(AWSSimpleSystemsManagerListAssociationsRequest *)request;

/**
 <p>Returns all State Manager associations in the current AWS account and Region. You can limit the results to a specific State Manager association document or instance by specifying a filter.</p>
 
 @param request A container for the necessary parameters to execute the ListAssociations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerListAssociationsRequest
 @see AWSSimpleSystemsManagerListAssociationsResult
 */
- (void)listAssociations:(AWSSimpleSystemsManagerListAssociationsRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerListAssociationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>An invocation is copy of a command sent to a specific instance. A command can apply to one or more instances. A command invocation applies to one instance. For example, if a user runs SendCommand against three instances, then a command invocation is created for each requested instance ID. ListCommandInvocations provide status about command execution.</p>
 
 @param request A container for the necessary parameters to execute the ListCommandInvocations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerListCommandInvocationsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidCommandId`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInvalidFilterKey`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerListCommandInvocationsRequest
 @see AWSSimpleSystemsManagerListCommandInvocationsResult
 */
- (AWSTask<AWSSimpleSystemsManagerListCommandInvocationsResult *> *)listCommandInvocations:(AWSSimpleSystemsManagerListCommandInvocationsRequest *)request;

/**
 <p>An invocation is copy of a command sent to a specific instance. A command can apply to one or more instances. A command invocation applies to one instance. For example, if a user runs SendCommand against three instances, then a command invocation is created for each requested instance ID. ListCommandInvocations provide status about command execution.</p>
 
 @param request A container for the necessary parameters to execute the ListCommandInvocations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidCommandId`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInvalidFilterKey`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerListCommandInvocationsRequest
 @see AWSSimpleSystemsManagerListCommandInvocationsResult
 */
- (void)listCommandInvocations:(AWSSimpleSystemsManagerListCommandInvocationsRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerListCommandInvocationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the commands requested by users of the AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListCommands service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerListCommandsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidCommandId`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInvalidFilterKey`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerListCommandsRequest
 @see AWSSimpleSystemsManagerListCommandsResult
 */
- (AWSTask<AWSSimpleSystemsManagerListCommandsResult *> *)listCommands:(AWSSimpleSystemsManagerListCommandsRequest *)request;

/**
 <p>Lists the commands requested by users of the AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListCommands service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidCommandId`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInvalidFilterKey`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerListCommandsRequest
 @see AWSSimpleSystemsManagerListCommandsResult
 */
- (void)listCommands:(AWSSimpleSystemsManagerListCommandsRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerListCommandsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>For a specified resource ID, this API action returns a list of compliance statuses for different resource types. Currently, you can only specify one resource ID per call. List results depend on the criteria specified in the filter.</p>
 
 @param request A container for the necessary parameters to execute the ListComplianceItems service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerListComplianceItemsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidResourceType`, `AWSSimpleSystemsManagerErrorInvalidResourceId`, `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidFilter`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerListComplianceItemsRequest
 @see AWSSimpleSystemsManagerListComplianceItemsResult
 */
- (AWSTask<AWSSimpleSystemsManagerListComplianceItemsResult *> *)listComplianceItems:(AWSSimpleSystemsManagerListComplianceItemsRequest *)request;

/**
 <p>For a specified resource ID, this API action returns a list of compliance statuses for different resource types. Currently, you can only specify one resource ID per call. List results depend on the criteria specified in the filter.</p>
 
 @param request A container for the necessary parameters to execute the ListComplianceItems service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidResourceType`, `AWSSimpleSystemsManagerErrorInvalidResourceId`, `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidFilter`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerListComplianceItemsRequest
 @see AWSSimpleSystemsManagerListComplianceItemsResult
 */
- (void)listComplianceItems:(AWSSimpleSystemsManagerListComplianceItemsRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerListComplianceItemsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a summary count of compliant and non-compliant resources for a compliance type. For example, this call can return State Manager associations, patches, or custom compliance types according to the filter criteria that you specify.</p>
 
 @param request A container for the necessary parameters to execute the ListComplianceSummaries service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerListComplianceSummariesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidFilter`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerListComplianceSummariesRequest
 @see AWSSimpleSystemsManagerListComplianceSummariesResult
 */
- (AWSTask<AWSSimpleSystemsManagerListComplianceSummariesResult *> *)listComplianceSummaries:(AWSSimpleSystemsManagerListComplianceSummariesRequest *)request;

/**
 <p>Returns a summary count of compliant and non-compliant resources for a compliance type. For example, this call can return State Manager associations, patches, or custom compliance types according to the filter criteria that you specify.</p>
 
 @param request A container for the necessary parameters to execute the ListComplianceSummaries service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidFilter`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerListComplianceSummariesRequest
 @see AWSSimpleSystemsManagerListComplianceSummariesResult
 */
- (void)listComplianceSummaries:(AWSSimpleSystemsManagerListComplianceSummariesRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerListComplianceSummariesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List all versions for a document.</p>
 
 @param request A container for the necessary parameters to execute the ListDocumentVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerListDocumentVersionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorInvalidDocument`.
 
 @see AWSSimpleSystemsManagerListDocumentVersionsRequest
 @see AWSSimpleSystemsManagerListDocumentVersionsResult
 */
- (AWSTask<AWSSimpleSystemsManagerListDocumentVersionsResult *> *)listDocumentVersions:(AWSSimpleSystemsManagerListDocumentVersionsRequest *)request;

/**
 <p>List all versions for a document.</p>
 
 @param request A container for the necessary parameters to execute the ListDocumentVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorInvalidDocument`.
 
 @see AWSSimpleSystemsManagerListDocumentVersionsRequest
 @see AWSSimpleSystemsManagerListDocumentVersionsResult
 */
- (void)listDocumentVersions:(AWSSimpleSystemsManagerListDocumentVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerListDocumentVersionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns all Systems Manager (SSM) documents in the current AWS account and Region. You can limit the results of this request by using a filter.</p>
 
 @param request A container for the necessary parameters to execute the ListDocuments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerListDocumentsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorInvalidFilterKey`.
 
 @see AWSSimpleSystemsManagerListDocumentsRequest
 @see AWSSimpleSystemsManagerListDocumentsResult
 */
- (AWSTask<AWSSimpleSystemsManagerListDocumentsResult *> *)listDocuments:(AWSSimpleSystemsManagerListDocumentsRequest *)request;

/**
 <p>Returns all Systems Manager (SSM) documents in the current AWS account and Region. You can limit the results of this request by using a filter.</p>
 
 @param request A container for the necessary parameters to execute the ListDocuments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorInvalidFilterKey`.
 
 @see AWSSimpleSystemsManagerListDocumentsRequest
 @see AWSSimpleSystemsManagerListDocumentsResult
 */
- (void)listDocuments:(AWSSimpleSystemsManagerListDocumentsRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerListDocumentsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>A list of inventory items returned by the request.</p>
 
 @param request A container for the necessary parameters to execute the ListInventoryEntries service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerListInventoryEntriesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInvalidTypeName`, `AWSSimpleSystemsManagerErrorInvalidFilter`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerListInventoryEntriesRequest
 @see AWSSimpleSystemsManagerListInventoryEntriesResult
 */
- (AWSTask<AWSSimpleSystemsManagerListInventoryEntriesResult *> *)listInventoryEntries:(AWSSimpleSystemsManagerListInventoryEntriesRequest *)request;

/**
 <p>A list of inventory items returned by the request.</p>
 
 @param request A container for the necessary parameters to execute the ListInventoryEntries service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInvalidTypeName`, `AWSSimpleSystemsManagerErrorInvalidFilter`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerListInventoryEntriesRequest
 @see AWSSimpleSystemsManagerListInventoryEntriesResult
 */
- (void)listInventoryEntries:(AWSSimpleSystemsManagerListInventoryEntriesRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerListInventoryEntriesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a resource-level summary count. The summary includes information about compliant and non-compliant statuses and detailed compliance-item severity counts, according to the filter criteria you specify.</p>
 
 @param request A container for the necessary parameters to execute the ListResourceComplianceSummaries service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerListResourceComplianceSummariesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidFilter`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerListResourceComplianceSummariesRequest
 @see AWSSimpleSystemsManagerListResourceComplianceSummariesResult
 */
- (AWSTask<AWSSimpleSystemsManagerListResourceComplianceSummariesResult *> *)listResourceComplianceSummaries:(AWSSimpleSystemsManagerListResourceComplianceSummariesRequest *)request;

/**
 <p>Returns a resource-level summary count. The summary includes information about compliant and non-compliant statuses and detailed compliance-item severity counts, according to the filter criteria you specify.</p>
 
 @param request A container for the necessary parameters to execute the ListResourceComplianceSummaries service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidFilter`, `AWSSimpleSystemsManagerErrorInvalidNextToken`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerListResourceComplianceSummariesRequest
 @see AWSSimpleSystemsManagerListResourceComplianceSummariesResult
 */
- (void)listResourceComplianceSummaries:(AWSSimpleSystemsManagerListResourceComplianceSummariesRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerListResourceComplianceSummariesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists your resource data sync configurations. Includes information about the last time a sync attempted to start, the last sync status, and the last time a sync successfully completed.</p><p>The number of sync configurations might be too large to return using a single call to <code>ListResourceDataSync</code>. You can limit the number of sync configurations returned by using the <code>MaxResults</code> parameter. To determine whether there are more sync configurations to list, check the value of <code>NextToken</code> in the output. If there are more sync configurations to list, you can request them by specifying the <code>NextToken</code> returned in the call to the parameter of a subsequent call. </p>
 
 @param request A container for the necessary parameters to execute the ListResourceDataSync service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerListResourceDataSyncResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorResourceDataSyncInvalidConfiguration`, `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerListResourceDataSyncRequest
 @see AWSSimpleSystemsManagerListResourceDataSyncResult
 */
- (AWSTask<AWSSimpleSystemsManagerListResourceDataSyncResult *> *)listResourceDataSync:(AWSSimpleSystemsManagerListResourceDataSyncRequest *)request;

/**
 <p>Lists your resource data sync configurations. Includes information about the last time a sync attempted to start, the last sync status, and the last time a sync successfully completed.</p><p>The number of sync configurations might be too large to return using a single call to <code>ListResourceDataSync</code>. You can limit the number of sync configurations returned by using the <code>MaxResults</code> parameter. To determine whether there are more sync configurations to list, check the value of <code>NextToken</code> in the output. If there are more sync configurations to list, you can request them by specifying the <code>NextToken</code> returned in the call to the parameter of a subsequent call. </p>
 
 @param request A container for the necessary parameters to execute the ListResourceDataSync service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorResourceDataSyncInvalidConfiguration`, `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidNextToken`.
 
 @see AWSSimpleSystemsManagerListResourceDataSyncRequest
 @see AWSSimpleSystemsManagerListResourceDataSyncResult
 */
- (void)listResourceDataSync:(AWSSimpleSystemsManagerListResourceDataSyncRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerListResourceDataSyncResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the tags assigned to the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerListTagsForResourceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidResourceType`, `AWSSimpleSystemsManagerErrorInvalidResourceId`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerListTagsForResourceRequest
 @see AWSSimpleSystemsManagerListTagsForResourceResult
 */
- (AWSTask<AWSSimpleSystemsManagerListTagsForResourceResult *> *)listTagsForResource:(AWSSimpleSystemsManagerListTagsForResourceRequest *)request;

/**
 <p>Returns a list of the tags assigned to the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidResourceType`, `AWSSimpleSystemsManagerErrorInvalidResourceId`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerListTagsForResourceRequest
 @see AWSSimpleSystemsManagerListTagsForResourceResult
 */
- (void)listTagsForResource:(AWSSimpleSystemsManagerListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerListTagsForResourceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Shares a Systems Manager document publicly or privately. If you share a document privately, you must specify the AWS user account IDs for those people who can use the document. If you share a document publicly, you must specify <i>All</i> as the account ID.</p>
 
 @param request A container for the necessary parameters to execute the ModifyDocumentPermission service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerModifyDocumentPermissionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidPermissionType`, `AWSSimpleSystemsManagerErrorDocumentPermissionLimit`, `AWSSimpleSystemsManagerErrorDocumentLimitExceeded`.
 
 @see AWSSimpleSystemsManagerModifyDocumentPermissionRequest
 @see AWSSimpleSystemsManagerModifyDocumentPermissionResponse
 */
- (AWSTask<AWSSimpleSystemsManagerModifyDocumentPermissionResponse *> *)modifyDocumentPermission:(AWSSimpleSystemsManagerModifyDocumentPermissionRequest *)request;

/**
 <p>Shares a Systems Manager document publicly or privately. If you share a document privately, you must specify the AWS user account IDs for those people who can use the document. If you share a document publicly, you must specify <i>All</i> as the account ID.</p>
 
 @param request A container for the necessary parameters to execute the ModifyDocumentPermission service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidPermissionType`, `AWSSimpleSystemsManagerErrorDocumentPermissionLimit`, `AWSSimpleSystemsManagerErrorDocumentLimitExceeded`.
 
 @see AWSSimpleSystemsManagerModifyDocumentPermissionRequest
 @see AWSSimpleSystemsManagerModifyDocumentPermissionResponse
 */
- (void)modifyDocumentPermission:(AWSSimpleSystemsManagerModifyDocumentPermissionRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerModifyDocumentPermissionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers a compliance type and other compliance details on a designated resource. This action lets you register custom compliance details with a resource. This call overwrites existing compliance information on the resource, so you must provide a full list of compliance items each time that you send the request.</p><p>ComplianceType can be one of the following:</p><ul><li><p>ExecutionId: The execution ID when the patch, association, or custom compliance item was applied.</p></li><li><p>ExecutionType: Specify patch, association, or Custom:<code>string</code>.</p></li><li><p>ExecutionTime. The time the patch, association, or custom compliance item was applied to the instance.</p></li><li><p>Id: The patch, association, or custom compliance ID.</p></li><li><p>Title: A title.</p></li><li><p>Status: The status of the compliance item. For example, <code>approved</code> for patches, or <code>Failed</code> for associations.</p></li><li><p>Severity: A patch severity. For example, <code>critical</code>.</p></li><li><p>DocumentName: A SSM document name. For example, AWS-RunPatchBaseline.</p></li><li><p>DocumentVersion: An SSM document version number. For example, 4.</p></li><li><p>Classification: A patch classification. For example, <code>security updates</code>.</p></li><li><p>PatchBaselineId: A patch baseline ID.</p></li><li><p>PatchSeverity: A patch severity. For example, <code>Critical</code>.</p></li><li><p>PatchState: A patch state. For example, <code>InstancesWithFailedPatches</code>.</p></li><li><p>PatchGroup: The name of a patch group.</p></li><li><p>InstalledTime: The time the association, patch, or custom compliance item was applied to the resource. Specify the time by using the following format: yyyy-MM-dd'T'HH:mm:ss'Z'</p></li></ul>
 
 @param request A container for the necessary parameters to execute the PutComplianceItems service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerPutComplianceItemsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidItemContent`, `AWSSimpleSystemsManagerErrorTotalSizeLimitExceeded`, `AWSSimpleSystemsManagerErrorItemSizeLimitExceeded`, `AWSSimpleSystemsManagerErrorComplianceTypeCountLimitExceeded`, `AWSSimpleSystemsManagerErrorInvalidResourceType`, `AWSSimpleSystemsManagerErrorInvalidResourceId`.
 
 @see AWSSimpleSystemsManagerPutComplianceItemsRequest
 @see AWSSimpleSystemsManagerPutComplianceItemsResult
 */
- (AWSTask<AWSSimpleSystemsManagerPutComplianceItemsResult *> *)putComplianceItems:(AWSSimpleSystemsManagerPutComplianceItemsRequest *)request;

/**
 <p>Registers a compliance type and other compliance details on a designated resource. This action lets you register custom compliance details with a resource. This call overwrites existing compliance information on the resource, so you must provide a full list of compliance items each time that you send the request.</p><p>ComplianceType can be one of the following:</p><ul><li><p>ExecutionId: The execution ID when the patch, association, or custom compliance item was applied.</p></li><li><p>ExecutionType: Specify patch, association, or Custom:<code>string</code>.</p></li><li><p>ExecutionTime. The time the patch, association, or custom compliance item was applied to the instance.</p></li><li><p>Id: The patch, association, or custom compliance ID.</p></li><li><p>Title: A title.</p></li><li><p>Status: The status of the compliance item. For example, <code>approved</code> for patches, or <code>Failed</code> for associations.</p></li><li><p>Severity: A patch severity. For example, <code>critical</code>.</p></li><li><p>DocumentName: A SSM document name. For example, AWS-RunPatchBaseline.</p></li><li><p>DocumentVersion: An SSM document version number. For example, 4.</p></li><li><p>Classification: A patch classification. For example, <code>security updates</code>.</p></li><li><p>PatchBaselineId: A patch baseline ID.</p></li><li><p>PatchSeverity: A patch severity. For example, <code>Critical</code>.</p></li><li><p>PatchState: A patch state. For example, <code>InstancesWithFailedPatches</code>.</p></li><li><p>PatchGroup: The name of a patch group.</p></li><li><p>InstalledTime: The time the association, patch, or custom compliance item was applied to the resource. Specify the time by using the following format: yyyy-MM-dd'T'HH:mm:ss'Z'</p></li></ul>
 
 @param request A container for the necessary parameters to execute the PutComplianceItems service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidItemContent`, `AWSSimpleSystemsManagerErrorTotalSizeLimitExceeded`, `AWSSimpleSystemsManagerErrorItemSizeLimitExceeded`, `AWSSimpleSystemsManagerErrorComplianceTypeCountLimitExceeded`, `AWSSimpleSystemsManagerErrorInvalidResourceType`, `AWSSimpleSystemsManagerErrorInvalidResourceId`.
 
 @see AWSSimpleSystemsManagerPutComplianceItemsRequest
 @see AWSSimpleSystemsManagerPutComplianceItemsResult
 */
- (void)putComplianceItems:(AWSSimpleSystemsManagerPutComplianceItemsRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerPutComplianceItemsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Bulk update custom inventory items on one more instance. The request adds an inventory item, if it doesn't already exist, or updates an inventory item, if it does exist.</p>
 
 @param request A container for the necessary parameters to execute the PutInventory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerPutInventoryResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInvalidTypeName`, `AWSSimpleSystemsManagerErrorInvalidItemContent`, `AWSSimpleSystemsManagerErrorTotalSizeLimitExceeded`, `AWSSimpleSystemsManagerErrorItemSizeLimitExceeded`, `AWSSimpleSystemsManagerErrorItemContentMismatch`, `AWSSimpleSystemsManagerErrorCustomSchemaCountLimitExceeded`, `AWSSimpleSystemsManagerErrorUnsupportedInventorySchemaVersion`, `AWSSimpleSystemsManagerErrorUnsupportedInventoryItemContext`, `AWSSimpleSystemsManagerErrorInvalidInventoryItemContext`, `AWSSimpleSystemsManagerErrorSubTypeCountLimitExceeded`.
 
 @see AWSSimpleSystemsManagerPutInventoryRequest
 @see AWSSimpleSystemsManagerPutInventoryResult
 */
- (AWSTask<AWSSimpleSystemsManagerPutInventoryResult *> *)putInventory:(AWSSimpleSystemsManagerPutInventoryRequest *)request;

/**
 <p>Bulk update custom inventory items on one more instance. The request adds an inventory item, if it doesn't already exist, or updates an inventory item, if it does exist.</p>
 
 @param request A container for the necessary parameters to execute the PutInventory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInvalidTypeName`, `AWSSimpleSystemsManagerErrorInvalidItemContent`, `AWSSimpleSystemsManagerErrorTotalSizeLimitExceeded`, `AWSSimpleSystemsManagerErrorItemSizeLimitExceeded`, `AWSSimpleSystemsManagerErrorItemContentMismatch`, `AWSSimpleSystemsManagerErrorCustomSchemaCountLimitExceeded`, `AWSSimpleSystemsManagerErrorUnsupportedInventorySchemaVersion`, `AWSSimpleSystemsManagerErrorUnsupportedInventoryItemContext`, `AWSSimpleSystemsManagerErrorInvalidInventoryItemContext`, `AWSSimpleSystemsManagerErrorSubTypeCountLimitExceeded`.
 
 @see AWSSimpleSystemsManagerPutInventoryRequest
 @see AWSSimpleSystemsManagerPutInventoryResult
 */
- (void)putInventory:(AWSSimpleSystemsManagerPutInventoryRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerPutInventoryResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Add a parameter to the system.</p>
 
 @param request A container for the necessary parameters to execute the PutParameter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerPutParameterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidKeyId`, `AWSSimpleSystemsManagerErrorParameterLimitExceeded`, `AWSSimpleSystemsManagerErrorTooManyUpdates`, `AWSSimpleSystemsManagerErrorParameterAlreadyExists`, `AWSSimpleSystemsManagerErrorHierarchyLevelLimitExceeded`, `AWSSimpleSystemsManagerErrorHierarchyTypeMismatch`, `AWSSimpleSystemsManagerErrorInvalidAllowedPattern`, `AWSSimpleSystemsManagerErrorParameterMaxVersionLimitExceeded`, `AWSSimpleSystemsManagerErrorParameterPatternMismatch`, `AWSSimpleSystemsManagerErrorUnsupportedParameterType`, `AWSSimpleSystemsManagerErrorPoliciesLimitExceeded`, `AWSSimpleSystemsManagerErrorInvalidPolicyType`, `AWSSimpleSystemsManagerErrorInvalidPolicyAttribute`, `AWSSimpleSystemsManagerErrorIncompatiblePolicy`.
 
 @see AWSSimpleSystemsManagerPutParameterRequest
 @see AWSSimpleSystemsManagerPutParameterResult
 */
- (AWSTask<AWSSimpleSystemsManagerPutParameterResult *> *)putParameter:(AWSSimpleSystemsManagerPutParameterRequest *)request;

/**
 <p>Add a parameter to the system.</p>
 
 @param request A container for the necessary parameters to execute the PutParameter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidKeyId`, `AWSSimpleSystemsManagerErrorParameterLimitExceeded`, `AWSSimpleSystemsManagerErrorTooManyUpdates`, `AWSSimpleSystemsManagerErrorParameterAlreadyExists`, `AWSSimpleSystemsManagerErrorHierarchyLevelLimitExceeded`, `AWSSimpleSystemsManagerErrorHierarchyTypeMismatch`, `AWSSimpleSystemsManagerErrorInvalidAllowedPattern`, `AWSSimpleSystemsManagerErrorParameterMaxVersionLimitExceeded`, `AWSSimpleSystemsManagerErrorParameterPatternMismatch`, `AWSSimpleSystemsManagerErrorUnsupportedParameterType`, `AWSSimpleSystemsManagerErrorPoliciesLimitExceeded`, `AWSSimpleSystemsManagerErrorInvalidPolicyType`, `AWSSimpleSystemsManagerErrorInvalidPolicyAttribute`, `AWSSimpleSystemsManagerErrorIncompatiblePolicy`.
 
 @see AWSSimpleSystemsManagerPutParameterRequest
 @see AWSSimpleSystemsManagerPutParameterResult
 */
- (void)putParameter:(AWSSimpleSystemsManagerPutParameterRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerPutParameterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Defines the default patch baseline for the relevant operating system.</p><p>To reset the AWS predefined patch baseline as the default, specify the full patch baseline ARN as the baseline ID value. For example, for CentOS, specify <code>arn:aws:ssm:us-east-2:733109147000:patchbaseline/pb-0574b43a65ea646ed</code> instead of <code>pb-0574b43a65ea646ed</code>.</p>
 
 @param request A container for the necessary parameters to execute the RegisterDefaultPatchBaseline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerRegisterDefaultPatchBaselineResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidResourceId`, `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerRegisterDefaultPatchBaselineRequest
 @see AWSSimpleSystemsManagerRegisterDefaultPatchBaselineResult
 */
- (AWSTask<AWSSimpleSystemsManagerRegisterDefaultPatchBaselineResult *> *)registerDefaultPatchBaseline:(AWSSimpleSystemsManagerRegisterDefaultPatchBaselineRequest *)request;

/**
 <p>Defines the default patch baseline for the relevant operating system.</p><p>To reset the AWS predefined patch baseline as the default, specify the full patch baseline ARN as the baseline ID value. For example, for CentOS, specify <code>arn:aws:ssm:us-east-2:733109147000:patchbaseline/pb-0574b43a65ea646ed</code> instead of <code>pb-0574b43a65ea646ed</code>.</p>
 
 @param request A container for the necessary parameters to execute the RegisterDefaultPatchBaseline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidResourceId`, `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerRegisterDefaultPatchBaselineRequest
 @see AWSSimpleSystemsManagerRegisterDefaultPatchBaselineResult
 */
- (void)registerDefaultPatchBaseline:(AWSSimpleSystemsManagerRegisterDefaultPatchBaselineRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerRegisterDefaultPatchBaselineResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers a patch baseline for a patch group.</p>
 
 @param request A container for the necessary parameters to execute the RegisterPatchBaselineForPatchGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerRegisterPatchBaselineForPatchGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorAlreadyExists`, `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInvalidResourceId`, `AWSSimpleSystemsManagerErrorResourceLimitExceeded`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerRegisterPatchBaselineForPatchGroupRequest
 @see AWSSimpleSystemsManagerRegisterPatchBaselineForPatchGroupResult
 */
- (AWSTask<AWSSimpleSystemsManagerRegisterPatchBaselineForPatchGroupResult *> *)registerPatchBaselineForPatchGroup:(AWSSimpleSystemsManagerRegisterPatchBaselineForPatchGroupRequest *)request;

/**
 <p>Registers a patch baseline for a patch group.</p>
 
 @param request A container for the necessary parameters to execute the RegisterPatchBaselineForPatchGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorAlreadyExists`, `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInvalidResourceId`, `AWSSimpleSystemsManagerErrorResourceLimitExceeded`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerRegisterPatchBaselineForPatchGroupRequest
 @see AWSSimpleSystemsManagerRegisterPatchBaselineForPatchGroupResult
 */
- (void)registerPatchBaselineForPatchGroup:(AWSSimpleSystemsManagerRegisterPatchBaselineForPatchGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerRegisterPatchBaselineForPatchGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers a target with a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the RegisterTargetWithMaintenanceWindow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerRegisterTargetWithMaintenanceWindowResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorIdempotentParameterMismatch`, `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorResourceLimitExceeded`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerRegisterTargetWithMaintenanceWindowRequest
 @see AWSSimpleSystemsManagerRegisterTargetWithMaintenanceWindowResult
 */
- (AWSTask<AWSSimpleSystemsManagerRegisterTargetWithMaintenanceWindowResult *> *)registerTargetWithMaintenanceWindow:(AWSSimpleSystemsManagerRegisterTargetWithMaintenanceWindowRequest *)request;

/**
 <p>Registers a target with a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the RegisterTargetWithMaintenanceWindow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorIdempotentParameterMismatch`, `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorResourceLimitExceeded`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerRegisterTargetWithMaintenanceWindowRequest
 @see AWSSimpleSystemsManagerRegisterTargetWithMaintenanceWindowResult
 */
- (void)registerTargetWithMaintenanceWindow:(AWSSimpleSystemsManagerRegisterTargetWithMaintenanceWindowRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerRegisterTargetWithMaintenanceWindowResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds a new task to a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the RegisterTaskWithMaintenanceWindow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerRegisterTaskWithMaintenanceWindowResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorIdempotentParameterMismatch`, `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorResourceLimitExceeded`, `AWSSimpleSystemsManagerErrorFeatureNotAvailable`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerRegisterTaskWithMaintenanceWindowRequest
 @see AWSSimpleSystemsManagerRegisterTaskWithMaintenanceWindowResult
 */
- (AWSTask<AWSSimpleSystemsManagerRegisterTaskWithMaintenanceWindowResult *> *)registerTaskWithMaintenanceWindow:(AWSSimpleSystemsManagerRegisterTaskWithMaintenanceWindowRequest *)request;

/**
 <p>Adds a new task to a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the RegisterTaskWithMaintenanceWindow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorIdempotentParameterMismatch`, `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorResourceLimitExceeded`, `AWSSimpleSystemsManagerErrorFeatureNotAvailable`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerRegisterTaskWithMaintenanceWindowRequest
 @see AWSSimpleSystemsManagerRegisterTaskWithMaintenanceWindowResult
 */
- (void)registerTaskWithMaintenanceWindow:(AWSSimpleSystemsManagerRegisterTaskWithMaintenanceWindowRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerRegisterTaskWithMaintenanceWindowResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes tag keys from the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTagsFromResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerRemoveTagsFromResourceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidResourceType`, `AWSSimpleSystemsManagerErrorInvalidResourceId`, `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorTooManyUpdates`.
 
 @see AWSSimpleSystemsManagerRemoveTagsFromResourceRequest
 @see AWSSimpleSystemsManagerRemoveTagsFromResourceResult
 */
- (AWSTask<AWSSimpleSystemsManagerRemoveTagsFromResourceResult *> *)removeTagsFromResource:(AWSSimpleSystemsManagerRemoveTagsFromResourceRequest *)request;

/**
 <p>Removes tag keys from the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTagsFromResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidResourceType`, `AWSSimpleSystemsManagerErrorInvalidResourceId`, `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorTooManyUpdates`.
 
 @see AWSSimpleSystemsManagerRemoveTagsFromResourceRequest
 @see AWSSimpleSystemsManagerRemoveTagsFromResourceResult
 */
- (void)removeTagsFromResource:(AWSSimpleSystemsManagerRemoveTagsFromResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerRemoveTagsFromResourceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p><code>ServiceSetting</code> is an account-level setting for an AWS service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an AWS service charges money to the account based on feature or service usage, then the AWS service team might create a default setting of "false". This means the user can't use this feature unless they change the setting to "true" and intentionally opt in for a paid feature.</p><p>Services map a <code>SettingId</code> object to a setting value. AWS services teams define the default value for a <code>SettingId</code>. You can't create a new <code>SettingId</code>, but you can overwrite the default value if you have the <code>ssm:UpdateServiceSetting</code> permission for the setting. Use the <a>GetServiceSetting</a> API action to view the current value. Use the <a>UpdateServiceSetting</a> API action to change the default setting. </p><p>Reset the service setting for the account to the default value as provisioned by the AWS service team. </p>
 
 @param request A container for the necessary parameters to execute the ResetServiceSetting service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerResetServiceSettingResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorServiceSettingNotFound`, `AWSSimpleSystemsManagerErrorTooManyUpdates`.
 
 @see AWSSimpleSystemsManagerResetServiceSettingRequest
 @see AWSSimpleSystemsManagerResetServiceSettingResult
 */
- (AWSTask<AWSSimpleSystemsManagerResetServiceSettingResult *> *)resetServiceSetting:(AWSSimpleSystemsManagerResetServiceSettingRequest *)request;

/**
 <p><code>ServiceSetting</code> is an account-level setting for an AWS service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an AWS service charges money to the account based on feature or service usage, then the AWS service team might create a default setting of "false". This means the user can't use this feature unless they change the setting to "true" and intentionally opt in for a paid feature.</p><p>Services map a <code>SettingId</code> object to a setting value. AWS services teams define the default value for a <code>SettingId</code>. You can't create a new <code>SettingId</code>, but you can overwrite the default value if you have the <code>ssm:UpdateServiceSetting</code> permission for the setting. Use the <a>GetServiceSetting</a> API action to view the current value. Use the <a>UpdateServiceSetting</a> API action to change the default setting. </p><p>Reset the service setting for the account to the default value as provisioned by the AWS service team. </p>
 
 @param request A container for the necessary parameters to execute the ResetServiceSetting service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorServiceSettingNotFound`, `AWSSimpleSystemsManagerErrorTooManyUpdates`.
 
 @see AWSSimpleSystemsManagerResetServiceSettingRequest
 @see AWSSimpleSystemsManagerResetServiceSettingResult
 */
- (void)resetServiceSetting:(AWSSimpleSystemsManagerResetServiceSettingRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerResetServiceSettingResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Reconnects a session to an instance after it has been disconnected. Connections can be resumed for disconnected sessions, but not terminated sessions.</p><note><p>This command is primarily for use by client machines to automatically reconnect during intermittent network issues. It is not intended for any other use.</p></note>
 
 @param request A container for the necessary parameters to execute the ResumeSession service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerResumeSessionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerResumeSessionRequest
 @see AWSSimpleSystemsManagerResumeSessionResponse
 */
- (AWSTask<AWSSimpleSystemsManagerResumeSessionResponse *> *)resumeSession:(AWSSimpleSystemsManagerResumeSessionRequest *)request;

/**
 <p>Reconnects a session to an instance after it has been disconnected. Connections can be resumed for disconnected sessions, but not terminated sessions.</p><note><p>This command is primarily for use by client machines to automatically reconnect during intermittent network issues. It is not intended for any other use.</p></note>
 
 @param request A container for the necessary parameters to execute the ResumeSession service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerResumeSessionRequest
 @see AWSSimpleSystemsManagerResumeSessionResponse
 */
- (void)resumeSession:(AWSSimpleSystemsManagerResumeSessionRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerResumeSessionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sends a signal to an Automation execution to change the current behavior or status of the execution. </p>
 
 @param request A container for the necessary parameters to execute the SendAutomationSignal service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerSendAutomationSignalResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorAutomationExecutionNotFound`, `AWSSimpleSystemsManagerErrorAutomationStepNotFound`, `AWSSimpleSystemsManagerErrorInvalidAutomationSignal`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerSendAutomationSignalRequest
 @see AWSSimpleSystemsManagerSendAutomationSignalResult
 */
- (AWSTask<AWSSimpleSystemsManagerSendAutomationSignalResult *> *)sendAutomationSignal:(AWSSimpleSystemsManagerSendAutomationSignalRequest *)request;

/**
 <p>Sends a signal to an Automation execution to change the current behavior or status of the execution. </p>
 
 @param request A container for the necessary parameters to execute the SendAutomationSignal service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorAutomationExecutionNotFound`, `AWSSimpleSystemsManagerErrorAutomationStepNotFound`, `AWSSimpleSystemsManagerErrorInvalidAutomationSignal`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerSendAutomationSignalRequest
 @see AWSSimpleSystemsManagerSendAutomationSignalResult
 */
- (void)sendAutomationSignal:(AWSSimpleSystemsManagerSendAutomationSignalRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerSendAutomationSignalResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Runs commands on one or more managed instances.</p>
 
 @param request A container for the necessary parameters to execute the SendCommand service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerSendCommandResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDuplicateInstanceId`, `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidDocumentVersion`, `AWSSimpleSystemsManagerErrorInvalidOutputFolder`, `AWSSimpleSystemsManagerErrorInvalidParameters`, `AWSSimpleSystemsManagerErrorUnsupportedPlatformType`, `AWSSimpleSystemsManagerErrorMaxDocumentSizeExceeded`, `AWSSimpleSystemsManagerErrorInvalidRole`, `AWSSimpleSystemsManagerErrorInvalidNotificationConfig`.
 
 @see AWSSimpleSystemsManagerSendCommandRequest
 @see AWSSimpleSystemsManagerSendCommandResult
 */
- (AWSTask<AWSSimpleSystemsManagerSendCommandResult *> *)sendCommand:(AWSSimpleSystemsManagerSendCommandRequest *)request;

/**
 <p>Runs commands on one or more managed instances.</p>
 
 @param request A container for the necessary parameters to execute the SendCommand service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDuplicateInstanceId`, `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidDocumentVersion`, `AWSSimpleSystemsManagerErrorInvalidOutputFolder`, `AWSSimpleSystemsManagerErrorInvalidParameters`, `AWSSimpleSystemsManagerErrorUnsupportedPlatformType`, `AWSSimpleSystemsManagerErrorMaxDocumentSizeExceeded`, `AWSSimpleSystemsManagerErrorInvalidRole`, `AWSSimpleSystemsManagerErrorInvalidNotificationConfig`.
 
 @see AWSSimpleSystemsManagerSendCommandRequest
 @see AWSSimpleSystemsManagerSendCommandResult
 */
- (void)sendCommand:(AWSSimpleSystemsManagerSendCommandRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerSendCommandResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Use this API action to run an association immediately and only one time. This action can be helpful when troubleshooting associations.</p>
 
 @param request A container for the necessary parameters to execute the StartAssociationsOnce service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerStartAssociationsOnceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidAssociation`, `AWSSimpleSystemsManagerErrorAssociationDoesNotExist`.
 
 @see AWSSimpleSystemsManagerStartAssociationsOnceRequest
 @see AWSSimpleSystemsManagerStartAssociationsOnceResult
 */
- (AWSTask<AWSSimpleSystemsManagerStartAssociationsOnceResult *> *)startAssociationsOnce:(AWSSimpleSystemsManagerStartAssociationsOnceRequest *)request;

/**
 <p>Use this API action to run an association immediately and only one time. This action can be helpful when troubleshooting associations.</p>
 
 @param request A container for the necessary parameters to execute the StartAssociationsOnce service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidAssociation`, `AWSSimpleSystemsManagerErrorAssociationDoesNotExist`.
 
 @see AWSSimpleSystemsManagerStartAssociationsOnceRequest
 @see AWSSimpleSystemsManagerStartAssociationsOnceResult
 */
- (void)startAssociationsOnce:(AWSSimpleSystemsManagerStartAssociationsOnceRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerStartAssociationsOnceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates execution of an Automation document.</p>
 
 @param request A container for the necessary parameters to execute the StartAutomationExecution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerStartAutomationExecutionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorAutomationDefinitionNotFound`, `AWSSimpleSystemsManagerErrorInvalidAutomationExecutionParameters`, `AWSSimpleSystemsManagerErrorAutomationExecutionLimitExceeded`, `AWSSimpleSystemsManagerErrorAutomationDefinitionVersionNotFound`, `AWSSimpleSystemsManagerErrorIdempotentParameterMismatch`, `AWSSimpleSystemsManagerErrorInvalidTarget`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerStartAutomationExecutionRequest
 @see AWSSimpleSystemsManagerStartAutomationExecutionResult
 */
- (AWSTask<AWSSimpleSystemsManagerStartAutomationExecutionResult *> *)startAutomationExecution:(AWSSimpleSystemsManagerStartAutomationExecutionRequest *)request;

/**
 <p>Initiates execution of an Automation document.</p>
 
 @param request A container for the necessary parameters to execute the StartAutomationExecution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorAutomationDefinitionNotFound`, `AWSSimpleSystemsManagerErrorInvalidAutomationExecutionParameters`, `AWSSimpleSystemsManagerErrorAutomationExecutionLimitExceeded`, `AWSSimpleSystemsManagerErrorAutomationDefinitionVersionNotFound`, `AWSSimpleSystemsManagerErrorIdempotentParameterMismatch`, `AWSSimpleSystemsManagerErrorInvalidTarget`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerStartAutomationExecutionRequest
 @see AWSSimpleSystemsManagerStartAutomationExecutionResult
 */
- (void)startAutomationExecution:(AWSSimpleSystemsManagerStartAutomationExecutionRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerStartAutomationExecutionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates a connection to a target (for example, an instance) for a Session Manager session. Returns a URL and token that can be used to open a WebSocket connection for sending input and receiving outputs.</p><note><p>AWS CLI usage: <code>start-session</code> is an interactive command that requires the Session Manager plugin to be installed on the client machine making the call. For information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html">Install the Session Manager plugin for the AWS CLI</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>AWS Tools for PowerShell usage: Start-SSMSession is not currently supported by AWS Tools for PowerShell on Windows local machines.</p></note>
 
 @param request A container for the necessary parameters to execute the StartSession service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerStartSessionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorTargetNotConnected`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerStartSessionRequest
 @see AWSSimpleSystemsManagerStartSessionResponse
 */
- (AWSTask<AWSSimpleSystemsManagerStartSessionResponse *> *)startSession:(AWSSimpleSystemsManagerStartSessionRequest *)request;

/**
 <p>Initiates a connection to a target (for example, an instance) for a Session Manager session. Returns a URL and token that can be used to open a WebSocket connection for sending input and receiving outputs.</p><note><p>AWS CLI usage: <code>start-session</code> is an interactive command that requires the Session Manager plugin to be installed on the client machine making the call. For information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html">Install the Session Manager plugin for the AWS CLI</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>AWS Tools for PowerShell usage: Start-SSMSession is not currently supported by AWS Tools for PowerShell on Windows local machines.</p></note>
 
 @param request A container for the necessary parameters to execute the StartSession service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorTargetNotConnected`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerStartSessionRequest
 @see AWSSimpleSystemsManagerStartSessionResponse
 */
- (void)startSession:(AWSSimpleSystemsManagerStartSessionRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerStartSessionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stop an Automation that is currently running.</p>
 
 @param request A container for the necessary parameters to execute the StopAutomationExecution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerStopAutomationExecutionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorAutomationExecutionNotFound`, `AWSSimpleSystemsManagerErrorInvalidAutomationStatusUpdate`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerStopAutomationExecutionRequest
 @see AWSSimpleSystemsManagerStopAutomationExecutionResult
 */
- (AWSTask<AWSSimpleSystemsManagerStopAutomationExecutionResult *> *)stopAutomationExecution:(AWSSimpleSystemsManagerStopAutomationExecutionRequest *)request;

/**
 <p>Stop an Automation that is currently running.</p>
 
 @param request A container for the necessary parameters to execute the StopAutomationExecution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorAutomationExecutionNotFound`, `AWSSimpleSystemsManagerErrorInvalidAutomationStatusUpdate`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerStopAutomationExecutionRequest
 @see AWSSimpleSystemsManagerStopAutomationExecutionResult
 */
- (void)stopAutomationExecution:(AWSSimpleSystemsManagerStopAutomationExecutionRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerStopAutomationExecutionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Permanently ends a session and closes the data connection between the Session Manager client and SSM Agent on the instance. A terminated session cannot be resumed.</p>
 
 @param request A container for the necessary parameters to execute the TerminateSession service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerTerminateSessionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerTerminateSessionRequest
 @see AWSSimpleSystemsManagerTerminateSessionResponse
 */
- (AWSTask<AWSSimpleSystemsManagerTerminateSessionResponse *> *)terminateSession:(AWSSimpleSystemsManagerTerminateSessionRequest *)request;

/**
 <p>Permanently ends a session and closes the data connection between the Session Manager client and SSM Agent on the instance. A terminated session cannot be resumed.</p>
 
 @param request A container for the necessary parameters to execute the TerminateSession service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerTerminateSessionRequest
 @see AWSSimpleSystemsManagerTerminateSessionResponse
 */
- (void)terminateSession:(AWSSimpleSystemsManagerTerminateSessionRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerTerminateSessionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an association. You can update the association name and version, the document version, schedule, parameters, and Amazon S3 output. </p><p>In order to call this API action, your IAM user account, group, or role must be configured with permission to call the <a>DescribeAssociation</a> API action. If you don't have permission to call DescribeAssociation, then you receive the following error: <code>An error occurred (AccessDeniedException) when calling the UpdateAssociation operation: User: &lt;user_arn&gt; is not authorized to perform: ssm:DescribeAssociation on resource: &lt;resource_arn&gt;</code></p><important><p>When you update an association, the association immediately runs against the specified targets.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerUpdateAssociationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidSchedule`, `AWSSimpleSystemsManagerErrorInvalidParameters`, `AWSSimpleSystemsManagerErrorInvalidOutputLocation`, `AWSSimpleSystemsManagerErrorInvalidDocumentVersion`, `AWSSimpleSystemsManagerErrorAssociationDoesNotExist`, `AWSSimpleSystemsManagerErrorInvalidUpdate`, `AWSSimpleSystemsManagerErrorTooManyUpdates`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidTarget`, `AWSSimpleSystemsManagerErrorInvalidAssociationVersion`, `AWSSimpleSystemsManagerErrorAssociationVersionLimitExceeded`.
 
 @see AWSSimpleSystemsManagerUpdateAssociationRequest
 @see AWSSimpleSystemsManagerUpdateAssociationResult
 */
- (AWSTask<AWSSimpleSystemsManagerUpdateAssociationResult *> *)updateAssociation:(AWSSimpleSystemsManagerUpdateAssociationRequest *)request;

/**
 <p>Updates an association. You can update the association name and version, the document version, schedule, parameters, and Amazon S3 output. </p><p>In order to call this API action, your IAM user account, group, or role must be configured with permission to call the <a>DescribeAssociation</a> API action. If you don't have permission to call DescribeAssociation, then you receive the following error: <code>An error occurred (AccessDeniedException) when calling the UpdateAssociation operation: User: &lt;user_arn&gt; is not authorized to perform: ssm:DescribeAssociation on resource: &lt;resource_arn&gt;</code></p><important><p>When you update an association, the association immediately runs against the specified targets.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidSchedule`, `AWSSimpleSystemsManagerErrorInvalidParameters`, `AWSSimpleSystemsManagerErrorInvalidOutputLocation`, `AWSSimpleSystemsManagerErrorInvalidDocumentVersion`, `AWSSimpleSystemsManagerErrorAssociationDoesNotExist`, `AWSSimpleSystemsManagerErrorInvalidUpdate`, `AWSSimpleSystemsManagerErrorTooManyUpdates`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidTarget`, `AWSSimpleSystemsManagerErrorInvalidAssociationVersion`, `AWSSimpleSystemsManagerErrorAssociationVersionLimitExceeded`.
 
 @see AWSSimpleSystemsManagerUpdateAssociationRequest
 @see AWSSimpleSystemsManagerUpdateAssociationResult
 */
- (void)updateAssociation:(AWSSimpleSystemsManagerUpdateAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerUpdateAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the status of the Systems Manager document associated with the specified instance.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAssociationStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerUpdateAssociationStatusResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorAssociationDoesNotExist`, `AWSSimpleSystemsManagerErrorStatusUnchanged`, `AWSSimpleSystemsManagerErrorTooManyUpdates`.
 
 @see AWSSimpleSystemsManagerUpdateAssociationStatusRequest
 @see AWSSimpleSystemsManagerUpdateAssociationStatusResult
 */
- (AWSTask<AWSSimpleSystemsManagerUpdateAssociationStatusResult *> *)updateAssociationStatus:(AWSSimpleSystemsManagerUpdateAssociationStatusRequest *)request;

/**
 <p>Updates the status of the Systems Manager document associated with the specified instance.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAssociationStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorAssociationDoesNotExist`, `AWSSimpleSystemsManagerErrorStatusUnchanged`, `AWSSimpleSystemsManagerErrorTooManyUpdates`.
 
 @see AWSSimpleSystemsManagerUpdateAssociationStatusRequest
 @see AWSSimpleSystemsManagerUpdateAssociationStatusResult
 */
- (void)updateAssociationStatus:(AWSSimpleSystemsManagerUpdateAssociationStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerUpdateAssociationStatusResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates one or more values for an SSM document.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDocument service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerUpdateDocumentResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorMaxDocumentSizeExceeded`, `AWSSimpleSystemsManagerErrorDocumentVersionLimitExceeded`, `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorDuplicateDocumentContent`, `AWSSimpleSystemsManagerErrorDuplicateDocumentVersionName`, `AWSSimpleSystemsManagerErrorInvalidDocumentContent`, `AWSSimpleSystemsManagerErrorInvalidDocumentVersion`, `AWSSimpleSystemsManagerErrorInvalidDocumentSchemaVersion`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidDocumentOperation`.
 
 @see AWSSimpleSystemsManagerUpdateDocumentRequest
 @see AWSSimpleSystemsManagerUpdateDocumentResult
 */
- (AWSTask<AWSSimpleSystemsManagerUpdateDocumentResult *> *)updateDocument:(AWSSimpleSystemsManagerUpdateDocumentRequest *)request;

/**
 <p>Updates one or more values for an SSM document.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDocument service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorMaxDocumentSizeExceeded`, `AWSSimpleSystemsManagerErrorDocumentVersionLimitExceeded`, `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorDuplicateDocumentContent`, `AWSSimpleSystemsManagerErrorDuplicateDocumentVersionName`, `AWSSimpleSystemsManagerErrorInvalidDocumentContent`, `AWSSimpleSystemsManagerErrorInvalidDocumentVersion`, `AWSSimpleSystemsManagerErrorInvalidDocumentSchemaVersion`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidDocumentOperation`.
 
 @see AWSSimpleSystemsManagerUpdateDocumentRequest
 @see AWSSimpleSystemsManagerUpdateDocumentResult
 */
- (void)updateDocument:(AWSSimpleSystemsManagerUpdateDocumentRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerUpdateDocumentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Set the default version of a document. </p>
 
 @param request A container for the necessary parameters to execute the UpdateDocumentDefaultVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerUpdateDocumentDefaultVersionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidDocumentVersion`, `AWSSimpleSystemsManagerErrorInvalidDocumentSchemaVersion`.
 
 @see AWSSimpleSystemsManagerUpdateDocumentDefaultVersionRequest
 @see AWSSimpleSystemsManagerUpdateDocumentDefaultVersionResult
 */
- (AWSTask<AWSSimpleSystemsManagerUpdateDocumentDefaultVersionResult *> *)updateDocumentDefaultVersion:(AWSSimpleSystemsManagerUpdateDocumentDefaultVersionRequest *)request;

/**
 <p>Set the default version of a document. </p>
 
 @param request A container for the necessary parameters to execute the UpdateDocumentDefaultVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorInvalidDocument`, `AWSSimpleSystemsManagerErrorInvalidDocumentVersion`, `AWSSimpleSystemsManagerErrorInvalidDocumentSchemaVersion`.
 
 @see AWSSimpleSystemsManagerUpdateDocumentDefaultVersionRequest
 @see AWSSimpleSystemsManagerUpdateDocumentDefaultVersionResult
 */
- (void)updateDocumentDefaultVersion:(AWSSimpleSystemsManagerUpdateDocumentDefaultVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerUpdateDocumentDefaultVersionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing maintenance window. Only specified parameters are modified.</p><note><p>The value you specify for <code>Duration</code> determines the specific end time for the maintenance window based on the time it begins. No maintenance window tasks are permitted to start after the resulting endtime minus the number of hours you specify for <code>Cutoff</code>. For example, if the maintenance window starts at 3 PM, the duration is three hours, and the value you specify for <code>Cutoff</code> is one hour, no maintenance window tasks can start after 5 PM.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateMaintenanceWindow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerUpdateMaintenanceWindowResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerUpdateMaintenanceWindowRequest
 @see AWSSimpleSystemsManagerUpdateMaintenanceWindowResult
 */
- (AWSTask<AWSSimpleSystemsManagerUpdateMaintenanceWindowResult *> *)updateMaintenanceWindow:(AWSSimpleSystemsManagerUpdateMaintenanceWindowRequest *)request;

/**
 <p>Updates an existing maintenance window. Only specified parameters are modified.</p><note><p>The value you specify for <code>Duration</code> determines the specific end time for the maintenance window based on the time it begins. No maintenance window tasks are permitted to start after the resulting endtime minus the number of hours you specify for <code>Cutoff</code>. For example, if the maintenance window starts at 3 PM, the duration is three hours, and the value you specify for <code>Cutoff</code> is one hour, no maintenance window tasks can start after 5 PM.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateMaintenanceWindow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerUpdateMaintenanceWindowRequest
 @see AWSSimpleSystemsManagerUpdateMaintenanceWindowResult
 */
- (void)updateMaintenanceWindow:(AWSSimpleSystemsManagerUpdateMaintenanceWindowRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerUpdateMaintenanceWindowResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the target of an existing maintenance window. You can change the following:</p><ul><li><p>Name</p></li><li><p>Description</p></li><li><p>Owner</p></li><li><p>IDs for an ID target</p></li><li><p>Tags for a Tag target</p></li><li><p>From any supported tag type to another. The three supported tag types are ID target, Tag target, and resource group. For more information, see <a>Target</a>.</p></li></ul><note><p>If a parameter is null, then the corresponding field is not modified.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateMaintenanceWindowTarget service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerUpdateMaintenanceWindowTargetResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerUpdateMaintenanceWindowTargetRequest
 @see AWSSimpleSystemsManagerUpdateMaintenanceWindowTargetResult
 */
- (AWSTask<AWSSimpleSystemsManagerUpdateMaintenanceWindowTargetResult *> *)updateMaintenanceWindowTarget:(AWSSimpleSystemsManagerUpdateMaintenanceWindowTargetRequest *)request;

/**
 <p>Modifies the target of an existing maintenance window. You can change the following:</p><ul><li><p>Name</p></li><li><p>Description</p></li><li><p>Owner</p></li><li><p>IDs for an ID target</p></li><li><p>Tags for a Tag target</p></li><li><p>From any supported tag type to another. The three supported tag types are ID target, Tag target, and resource group. For more information, see <a>Target</a>.</p></li></ul><note><p>If a parameter is null, then the corresponding field is not modified.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateMaintenanceWindowTarget service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerUpdateMaintenanceWindowTargetRequest
 @see AWSSimpleSystemsManagerUpdateMaintenanceWindowTargetResult
 */
- (void)updateMaintenanceWindowTarget:(AWSSimpleSystemsManagerUpdateMaintenanceWindowTargetRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerUpdateMaintenanceWindowTargetResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies a task assigned to a maintenance window. You can't change the task type, but you can change the following values:</p><ul><li><p>TaskARN. For example, you can change a RUN_COMMAND task from AWS-RunPowerShellScript to AWS-RunShellScript.</p></li><li><p>ServiceRoleArn</p></li><li><p>TaskInvocationParameters</p></li><li><p>Priority</p></li><li><p>MaxConcurrency</p></li><li><p>MaxErrors</p></li></ul><p>If a parameter is null, then the corresponding field is not modified. Also, if you set Replace to true, then all fields required by the <a>RegisterTaskWithMaintenanceWindow</a> action are required for this request. Optional fields that aren't specified are set to null.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMaintenanceWindowTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerUpdateMaintenanceWindowTaskResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerUpdateMaintenanceWindowTaskRequest
 @see AWSSimpleSystemsManagerUpdateMaintenanceWindowTaskResult
 */
- (AWSTask<AWSSimpleSystemsManagerUpdateMaintenanceWindowTaskResult *> *)updateMaintenanceWindowTask:(AWSSimpleSystemsManagerUpdateMaintenanceWindowTaskRequest *)request;

/**
 <p>Modifies a task assigned to a maintenance window. You can't change the task type, but you can change the following values:</p><ul><li><p>TaskARN. For example, you can change a RUN_COMMAND task from AWS-RunPowerShellScript to AWS-RunShellScript.</p></li><li><p>ServiceRoleArn</p></li><li><p>TaskInvocationParameters</p></li><li><p>Priority</p></li><li><p>MaxConcurrency</p></li><li><p>MaxErrors</p></li></ul><p>If a parameter is null, then the corresponding field is not modified. Also, if you set Replace to true, then all fields required by the <a>RegisterTaskWithMaintenanceWindow</a> action are required for this request. Optional fields that aren't specified are set to null.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMaintenanceWindowTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerUpdateMaintenanceWindowTaskRequest
 @see AWSSimpleSystemsManagerUpdateMaintenanceWindowTaskResult
 */
- (void)updateMaintenanceWindowTask:(AWSSimpleSystemsManagerUpdateMaintenanceWindowTaskRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerUpdateMaintenanceWindowTaskResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Changes the Amazon Identity and Access Management (IAM) role that is assigned to the on-premises instance or virtual machines (VM). IAM roles are first assigned to these hybrid instances during the activation process. For more information, see <a>CreateActivation</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateManagedInstanceRole service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerUpdateManagedInstanceRoleResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerUpdateManagedInstanceRoleRequest
 @see AWSSimpleSystemsManagerUpdateManagedInstanceRoleResult
 */
- (AWSTask<AWSSimpleSystemsManagerUpdateManagedInstanceRoleResult *> *)updateManagedInstanceRole:(AWSSimpleSystemsManagerUpdateManagedInstanceRoleRequest *)request;

/**
 <p>Changes the Amazon Identity and Access Management (IAM) role that is assigned to the on-premises instance or virtual machines (VM). IAM roles are first assigned to these hybrid instances during the activation process. For more information, see <a>CreateActivation</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateManagedInstanceRole service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInvalidInstanceId`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerUpdateManagedInstanceRoleRequest
 @see AWSSimpleSystemsManagerUpdateManagedInstanceRoleResult
 */
- (void)updateManagedInstanceRole:(AWSSimpleSystemsManagerUpdateManagedInstanceRoleRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerUpdateManagedInstanceRoleResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Edit or change an OpsItem. You must have permission in AWS Identity and Access Management (IAM) to update an OpsItem. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the UpdateOpsItem service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerUpdateOpsItemResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorOpsItemNotFound`, `AWSSimpleSystemsManagerErrorOpsItemAlreadyExists`, `AWSSimpleSystemsManagerErrorOpsItemLimitExceeded`, `AWSSimpleSystemsManagerErrorOpsItemInvalidParameter`.
 
 @see AWSSimpleSystemsManagerUpdateOpsItemRequest
 @see AWSSimpleSystemsManagerUpdateOpsItemResponse
 */
- (AWSTask<AWSSimpleSystemsManagerUpdateOpsItemResponse *> *)updateOpsItem:(AWSSimpleSystemsManagerUpdateOpsItemRequest *)request;

/**
 <p>Edit or change an OpsItem. You must have permission in AWS Identity and Access Management (IAM) to update an OpsItem. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the UpdateOpsItem service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorOpsItemNotFound`, `AWSSimpleSystemsManagerErrorOpsItemAlreadyExists`, `AWSSimpleSystemsManagerErrorOpsItemLimitExceeded`, `AWSSimpleSystemsManagerErrorOpsItemInvalidParameter`.
 
 @see AWSSimpleSystemsManagerUpdateOpsItemRequest
 @see AWSSimpleSystemsManagerUpdateOpsItemResponse
 */
- (void)updateOpsItem:(AWSSimpleSystemsManagerUpdateOpsItemRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerUpdateOpsItemResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies an existing patch baseline. Fields not specified in the request are left unchanged.</p><note><p>For information about valid key and value pairs in <code>PatchFilters</code> for each supported operating system type, see <a href="http://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html">PatchFilter</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdatePatchBaseline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerUpdatePatchBaselineResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerUpdatePatchBaselineRequest
 @see AWSSimpleSystemsManagerUpdatePatchBaselineResult
 */
- (AWSTask<AWSSimpleSystemsManagerUpdatePatchBaselineResult *> *)updatePatchBaseline:(AWSSimpleSystemsManagerUpdatePatchBaselineRequest *)request;

/**
 <p>Modifies an existing patch baseline. Fields not specified in the request are left unchanged.</p><note><p>For information about valid key and value pairs in <code>PatchFilters</code> for each supported operating system type, see <a href="http://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html">PatchFilter</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdatePatchBaseline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorDoesNotExist`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerUpdatePatchBaselineRequest
 @see AWSSimpleSystemsManagerUpdatePatchBaselineResult
 */
- (void)updatePatchBaseline:(AWSSimpleSystemsManagerUpdatePatchBaselineRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerUpdatePatchBaselineResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Update a resource data sync. After you create a resource data sync for a Region, you can't change the account options for that sync. For example, if you create a sync in the us-east-2 (Ohio) Region and you choose the Include only the current account option, you can't edit that sync later and choose the Include all accounts from my AWS Organizations configuration option. Instead, you must delete the first resource data sync, and create a new one.</p><note><p>This API action only supports a resource data sync that was created with a SyncFromSource <code>SyncType</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateResourceDataSync service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerUpdateResourceDataSyncResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorResourceDataSyncNotFound`, `AWSSimpleSystemsManagerErrorResourceDataSyncInvalidConfiguration`, `AWSSimpleSystemsManagerErrorResourceDataSyncConflict`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerUpdateResourceDataSyncRequest
 @see AWSSimpleSystemsManagerUpdateResourceDataSyncResult
 */
- (AWSTask<AWSSimpleSystemsManagerUpdateResourceDataSyncResult *> *)updateResourceDataSync:(AWSSimpleSystemsManagerUpdateResourceDataSyncRequest *)request;

/**
 <p>Update a resource data sync. After you create a resource data sync for a Region, you can't change the account options for that sync. For example, if you create a sync in the us-east-2 (Ohio) Region and you choose the Include only the current account option, you can't edit that sync later and choose the Include all accounts from my AWS Organizations configuration option. Instead, you must delete the first resource data sync, and create a new one.</p><note><p>This API action only supports a resource data sync that was created with a SyncFromSource <code>SyncType</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateResourceDataSync service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorResourceDataSyncNotFound`, `AWSSimpleSystemsManagerErrorResourceDataSyncInvalidConfiguration`, `AWSSimpleSystemsManagerErrorResourceDataSyncConflict`, `AWSSimpleSystemsManagerErrorInternalServer`.
 
 @see AWSSimpleSystemsManagerUpdateResourceDataSyncRequest
 @see AWSSimpleSystemsManagerUpdateResourceDataSyncResult
 */
- (void)updateResourceDataSync:(AWSSimpleSystemsManagerUpdateResourceDataSyncRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerUpdateResourceDataSyncResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p><code>ServiceSetting</code> is an account-level setting for an AWS service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an AWS service charges money to the account based on feature or service usage, then the AWS service team might create a default setting of "false". This means the user can't use this feature unless they change the setting to "true" and intentionally opt in for a paid feature.</p><p>Services map a <code>SettingId</code> object to a setting value. AWS services teams define the default value for a <code>SettingId</code>. You can't create a new <code>SettingId</code>, but you can overwrite the default value if you have the <code>ssm:UpdateServiceSetting</code> permission for the setting. Use the <a>GetServiceSetting</a> API action to view the current value. Or, use the <a>ResetServiceSetting</a> to change the value back to the original value defined by the AWS service team.</p><p>Update the service setting for the account. </p>
 
 @param request A container for the necessary parameters to execute the UpdateServiceSetting service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSimpleSystemsManagerUpdateServiceSettingResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorServiceSettingNotFound`, `AWSSimpleSystemsManagerErrorTooManyUpdates`.
 
 @see AWSSimpleSystemsManagerUpdateServiceSettingRequest
 @see AWSSimpleSystemsManagerUpdateServiceSettingResult
 */
- (AWSTask<AWSSimpleSystemsManagerUpdateServiceSettingResult *> *)updateServiceSetting:(AWSSimpleSystemsManagerUpdateServiceSettingRequest *)request;

/**
 <p><code>ServiceSetting</code> is an account-level setting for an AWS service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an AWS service charges money to the account based on feature or service usage, then the AWS service team might create a default setting of "false". This means the user can't use this feature unless they change the setting to "true" and intentionally opt in for a paid feature.</p><p>Services map a <code>SettingId</code> object to a setting value. AWS services teams define the default value for a <code>SettingId</code>. You can't create a new <code>SettingId</code>, but you can overwrite the default value if you have the <code>ssm:UpdateServiceSetting</code> permission for the setting. Use the <a>GetServiceSetting</a> API action to view the current value. Or, use the <a>ResetServiceSetting</a> to change the value back to the original value defined by the AWS service team.</p><p>Update the service setting for the account. </p>
 
 @param request A container for the necessary parameters to execute the UpdateServiceSetting service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSimpleSystemsManagerErrorDomain` domain and the following error code: `AWSSimpleSystemsManagerErrorInternalServer`, `AWSSimpleSystemsManagerErrorServiceSettingNotFound`, `AWSSimpleSystemsManagerErrorTooManyUpdates`.
 
 @see AWSSimpleSystemsManagerUpdateServiceSettingRequest
 @see AWSSimpleSystemsManagerUpdateServiceSettingResult
 */
- (void)updateServiceSetting:(AWSSimpleSystemsManagerUpdateServiceSettingRequest *)request completionHandler:(void (^ _Nullable)(AWSSimpleSystemsManagerUpdateServiceSettingResult * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
