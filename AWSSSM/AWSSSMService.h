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
#import "AWSSSMModel.h"
#import "AWSSSMResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSSSM
FOUNDATION_EXPORT NSString *const AWSSSMSDKVersion;

/**
 <fullname>AWS Systems Manager</fullname><p>AWS Systems Manager is a collection of capabilities that helps you automate management tasks such as collecting system inventory, applying operating system (OS) patches, automating the creation of Amazon Machine Images (AMIs), and configuring operating systems (OSs) and applications at scale. Systems Manager lets you remotely and securely manage the configuration of your managed instances. A <i>managed instance</i> is any Amazon Elastic Compute Cloud instance (EC2 instance), or any on-premises server or virtual machine (VM) in your hybrid environment that has been configured for Systems Manager.</p><p>This reference is intended to be used with the <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/">AWS Systems Manager User Guide</a>.</p><p>To get started, verify prerequisites and configure managed instances. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-setting-up.html">Setting up AWS Systems Manager</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>For information about other API actions you can perform on EC2 instances, see the <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/">Amazon EC2 API Reference</a>. For information about how to use a Query API, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/making-api-requests.html">Making API requests</a>. </p>
 */
@interface AWSSSM : AWSService

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

     let SSM = AWSSSM.default()

 *Objective-C*

     AWSSSM *SSM = [AWSSSM defaultSSM];

 @return The default service client.
 */
+ (instancetype)defaultSSM;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSSM.register(with: configuration!, forKey: "USWest2SSM")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSSM registerSSMWithConfiguration:configuration forKey:@"USWest2SSM"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let SSM = AWSSSM(forKey: "USWest2SSM")

 *Objective-C*

     AWSSSM *SSM = [AWSSSM SSMForKey:@"USWest2SSM"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerSSMWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerSSMWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSSM.register(with: configuration!, forKey: "USWest2SSM")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSSM registerSSMWithConfiguration:configuration forKey:@"USWest2SSM"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let SSM = AWSSSM(forKey: "USWest2SSM")

 *Objective-C*

     AWSSSM *SSM = [AWSSSM SSMForKey:@"USWest2SSM"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)SSMForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeSSMForKey:(NSString *)key;

/**
 <p>Adds or overwrites one or more tags for the specified resource. Tags are metadata that you can assign to your documents, managed instances, maintenance windows, Parameter Store parameters, and patch baselines. Tags enable you to categorize your resources in different ways, for example, by purpose, owner, or environment. Each tag consists of a key and an optional value, both of which you define. For example, you could define a set of tags for your account's managed instances that helps you track each instance's owner and stack level. For example: Key=Owner and Value=DbAdmin, SysAdmin, or Dev. Or Key=Stack and Value=Production, Pre-Production, or Test.</p><p>Each resource can have a maximum of 50 tags. </p><p>We recommend that you devise a set of tag keys that meets your needs for each resource type. Using a consistent set of tag keys makes it easier for you to manage your resources. You can search and filter the resources based on the tags you add. Tags don't have any semantic meaning to Amazon EC2 and are interpreted strictly as a string of characters. </p><p>For more information about tags, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging your Amazon EC2 resources</a> in the <i>Amazon EC2 User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AddTagsToResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMAddTagsToResourceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidResourceType`, `AWSSSMErrorInvalidResourceId`, `AWSSSMErrorInternalServer`, `AWSSSMErrorTooManyTags`, `AWSSSMErrorTooManyUpdates`.
 
 @see AWSSSMAddTagsToResourceRequest
 @see AWSSSMAddTagsToResourceResult
 */
- (AWSTask<AWSSSMAddTagsToResourceResult *> *)addTagsToResource:(AWSSSMAddTagsToResourceRequest *)request;

/**
 <p>Adds or overwrites one or more tags for the specified resource. Tags are metadata that you can assign to your documents, managed instances, maintenance windows, Parameter Store parameters, and patch baselines. Tags enable you to categorize your resources in different ways, for example, by purpose, owner, or environment. Each tag consists of a key and an optional value, both of which you define. For example, you could define a set of tags for your account's managed instances that helps you track each instance's owner and stack level. For example: Key=Owner and Value=DbAdmin, SysAdmin, or Dev. Or Key=Stack and Value=Production, Pre-Production, or Test.</p><p>Each resource can have a maximum of 50 tags. </p><p>We recommend that you devise a set of tag keys that meets your needs for each resource type. Using a consistent set of tag keys makes it easier for you to manage your resources. You can search and filter the resources based on the tags you add. Tags don't have any semantic meaning to Amazon EC2 and are interpreted strictly as a string of characters. </p><p>For more information about tags, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging your Amazon EC2 resources</a> in the <i>Amazon EC2 User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AddTagsToResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidResourceType`, `AWSSSMErrorInvalidResourceId`, `AWSSSMErrorInternalServer`, `AWSSSMErrorTooManyTags`, `AWSSSMErrorTooManyUpdates`.
 
 @see AWSSSMAddTagsToResourceRequest
 @see AWSSSMAddTagsToResourceResult
 */
- (void)addTagsToResource:(AWSSSMAddTagsToResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMAddTagsToResourceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attempts to cancel the command specified by the Command ID. There is no guarantee that the command will be terminated and the underlying process stopped.</p>
 
 @param request A container for the necessary parameters to execute the CancelCommand service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMCancelCommandResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidCommandId`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorDuplicateInstanceId`.
 
 @see AWSSSMCancelCommandRequest
 @see AWSSSMCancelCommandResult
 */
- (AWSTask<AWSSSMCancelCommandResult *> *)cancelCommand:(AWSSSMCancelCommandRequest *)request;

/**
 <p>Attempts to cancel the command specified by the Command ID. There is no guarantee that the command will be terminated and the underlying process stopped.</p>
 
 @param request A container for the necessary parameters to execute the CancelCommand service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidCommandId`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorDuplicateInstanceId`.
 
 @see AWSSSMCancelCommandRequest
 @see AWSSSMCancelCommandResult
 */
- (void)cancelCommand:(AWSSSMCancelCommandRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMCancelCommandResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops a maintenance window execution that is already in progress and cancels any tasks in the window that have not already starting running. (Tasks already in progress will continue to completion.)</p>
 
 @param request A container for the necessary parameters to execute the CancelMaintenanceWindowExecution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMCancelMaintenanceWindowExecutionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorDoesNotExist`.
 
 @see AWSSSMCancelMaintenanceWindowExecutionRequest
 @see AWSSSMCancelMaintenanceWindowExecutionResult
 */
- (AWSTask<AWSSSMCancelMaintenanceWindowExecutionResult *> *)cancelMaintenanceWindowExecution:(AWSSSMCancelMaintenanceWindowExecutionRequest *)request;

/**
 <p>Stops a maintenance window execution that is already in progress and cancels any tasks in the window that have not already starting running. (Tasks already in progress will continue to completion.)</p>
 
 @param request A container for the necessary parameters to execute the CancelMaintenanceWindowExecution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorDoesNotExist`.
 
 @see AWSSSMCancelMaintenanceWindowExecutionRequest
 @see AWSSSMCancelMaintenanceWindowExecutionResult
 */
- (void)cancelMaintenanceWindowExecution:(AWSSSMCancelMaintenanceWindowExecutionRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMCancelMaintenanceWindowExecutionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Generates an activation code and activation ID you can use to register your on-premises server or virtual machine (VM) with Systems Manager. Registering these machines with Systems Manager makes it possible to manage them using Systems Manager capabilities. You use the activation code and ID when installing SSM Agent on machines in your hybrid environment. For more information about requirements for managing on-premises instances and VMs using Systems Manager, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-managedinstances.html">Setting up AWS Systems Manager for hybrid environments</a> in the <i>AWS Systems Manager User Guide</i>. </p><note><p>On-premises servers or VMs that are registered with Systems Manager and EC2 instances that you manage with Systems Manager are all called <i>managed instances</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateActivation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMCreateActivationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMCreateActivationRequest
 @see AWSSSMCreateActivationResult
 */
- (AWSTask<AWSSSMCreateActivationResult *> *)createActivation:(AWSSSMCreateActivationRequest *)request;

/**
 <p>Generates an activation code and activation ID you can use to register your on-premises server or virtual machine (VM) with Systems Manager. Registering these machines with Systems Manager makes it possible to manage them using Systems Manager capabilities. You use the activation code and ID when installing SSM Agent on machines in your hybrid environment. For more information about requirements for managing on-premises instances and VMs using Systems Manager, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-managedinstances.html">Setting up AWS Systems Manager for hybrid environments</a> in the <i>AWS Systems Manager User Guide</i>. </p><note><p>On-premises servers or VMs that are registered with Systems Manager and EC2 instances that you manage with Systems Manager are all called <i>managed instances</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateActivation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMCreateActivationRequest
 @see AWSSSMCreateActivationResult
 */
- (void)createActivation:(AWSSSMCreateActivationRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMCreateActivationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates the specified Systems Manager document with the specified instances or targets.</p><p>When you associate a document with one or more instances using instance IDs or tags, SSM Agent running on the instance processes the document and configures the instance as specified.</p><p>If you associate a document with an instance that already has an associated document, the system returns the AssociationAlreadyExists exception.</p>
 
 @param request A container for the necessary parameters to execute the CreateAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMCreateAssociationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorAssociationAlreadyExists`, `AWSSSMErrorAssociationLimitExceeded`, `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidDocumentVersion`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorUnsupportedPlatformType`, `AWSSSMErrorInvalidOutputLocation`, `AWSSSMErrorInvalidParameters`, `AWSSSMErrorInvalidTarget`, `AWSSSMErrorInvalidSchedule`.
 
 @see AWSSSMCreateAssociationRequest
 @see AWSSSMCreateAssociationResult
 */
- (AWSTask<AWSSSMCreateAssociationResult *> *)createAssociation:(AWSSSMCreateAssociationRequest *)request;

/**
 <p>Associates the specified Systems Manager document with the specified instances or targets.</p><p>When you associate a document with one or more instances using instance IDs or tags, SSM Agent running on the instance processes the document and configures the instance as specified.</p><p>If you associate a document with an instance that already has an associated document, the system returns the AssociationAlreadyExists exception.</p>
 
 @param request A container for the necessary parameters to execute the CreateAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorAssociationAlreadyExists`, `AWSSSMErrorAssociationLimitExceeded`, `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidDocumentVersion`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorUnsupportedPlatformType`, `AWSSSMErrorInvalidOutputLocation`, `AWSSSMErrorInvalidParameters`, `AWSSSMErrorInvalidTarget`, `AWSSSMErrorInvalidSchedule`.
 
 @see AWSSSMCreateAssociationRequest
 @see AWSSSMCreateAssociationResult
 */
- (void)createAssociation:(AWSSSMCreateAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMCreateAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates the specified Systems Manager document with the specified instances or targets.</p><p>When you associate a document with one or more instances using instance IDs or tags, SSM Agent running on the instance processes the document and configures the instance as specified.</p><p>If you associate a document with an instance that already has an associated document, the system returns the AssociationAlreadyExists exception.</p>
 
 @param request A container for the necessary parameters to execute the CreateAssociationBatch service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMCreateAssociationBatchResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidDocumentVersion`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInvalidParameters`, `AWSSSMErrorDuplicateInstanceId`, `AWSSSMErrorAssociationLimitExceeded`, `AWSSSMErrorUnsupportedPlatformType`, `AWSSSMErrorInvalidOutputLocation`, `AWSSSMErrorInvalidTarget`, `AWSSSMErrorInvalidSchedule`.
 
 @see AWSSSMCreateAssociationBatchRequest
 @see AWSSSMCreateAssociationBatchResult
 */
- (AWSTask<AWSSSMCreateAssociationBatchResult *> *)createAssociationBatch:(AWSSSMCreateAssociationBatchRequest *)request;

/**
 <p>Associates the specified Systems Manager document with the specified instances or targets.</p><p>When you associate a document with one or more instances using instance IDs or tags, SSM Agent running on the instance processes the document and configures the instance as specified.</p><p>If you associate a document with an instance that already has an associated document, the system returns the AssociationAlreadyExists exception.</p>
 
 @param request A container for the necessary parameters to execute the CreateAssociationBatch service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidDocumentVersion`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInvalidParameters`, `AWSSSMErrorDuplicateInstanceId`, `AWSSSMErrorAssociationLimitExceeded`, `AWSSSMErrorUnsupportedPlatformType`, `AWSSSMErrorInvalidOutputLocation`, `AWSSSMErrorInvalidTarget`, `AWSSSMErrorInvalidSchedule`.
 
 @see AWSSSMCreateAssociationBatchRequest
 @see AWSSSMCreateAssociationBatchResult
 */
- (void)createAssociationBatch:(AWSSSMCreateAssociationBatchRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMCreateAssociationBatchResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Systems Manager (SSM) document. An SSM document defines the actions that Systems Manager performs on your managed instances. For more information about SSM documents, including information about supported schemas, features, and syntax, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-ssm-docs.html">AWS Systems Manager Documents</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDocument service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMCreateDocumentResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDocumentAlreadyExists`, `AWSSSMErrorMaxDocumentSizeExceeded`, `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDocumentContent`, `AWSSSMErrorDocumentLimitExceeded`, `AWSSSMErrorInvalidDocumentSchemaVersion`.
 
 @see AWSSSMCreateDocumentRequest
 @see AWSSSMCreateDocumentResult
 */
- (AWSTask<AWSSSMCreateDocumentResult *> *)createDocument:(AWSSSMCreateDocumentRequest *)request;

/**
 <p>Creates a Systems Manager (SSM) document. An SSM document defines the actions that Systems Manager performs on your managed instances. For more information about SSM documents, including information about supported schemas, features, and syntax, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-ssm-docs.html">AWS Systems Manager Documents</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDocument service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDocumentAlreadyExists`, `AWSSSMErrorMaxDocumentSizeExceeded`, `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDocumentContent`, `AWSSSMErrorDocumentLimitExceeded`, `AWSSSMErrorInvalidDocumentSchemaVersion`.
 
 @see AWSSSMCreateDocumentRequest
 @see AWSSSMCreateDocumentResult
 */
- (void)createDocument:(AWSSSMCreateDocumentRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMCreateDocumentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new maintenance window.</p><note><p>The value you specify for <code>Duration</code> determines the specific end time for the maintenance window based on the time it begins. No maintenance window tasks are permitted to start after the resulting endtime minus the number of hours you specify for <code>Cutoff</code>. For example, if the maintenance window starts at 3 PM, the duration is three hours, and the value you specify for <code>Cutoff</code> is one hour, no maintenance window tasks can start after 5 PM.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateMaintenanceWindow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMCreateMaintenanceWindowResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorIdempotentParameterMismatch`, `AWSSSMErrorResourceLimitExceeded`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMCreateMaintenanceWindowRequest
 @see AWSSSMCreateMaintenanceWindowResult
 */
- (AWSTask<AWSSSMCreateMaintenanceWindowResult *> *)createMaintenanceWindow:(AWSSSMCreateMaintenanceWindowRequest *)request;

/**
 <p>Creates a new maintenance window.</p><note><p>The value you specify for <code>Duration</code> determines the specific end time for the maintenance window based on the time it begins. No maintenance window tasks are permitted to start after the resulting endtime minus the number of hours you specify for <code>Cutoff</code>. For example, if the maintenance window starts at 3 PM, the duration is three hours, and the value you specify for <code>Cutoff</code> is one hour, no maintenance window tasks can start after 5 PM.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateMaintenanceWindow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorIdempotentParameterMismatch`, `AWSSSMErrorResourceLimitExceeded`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMCreateMaintenanceWindowRequest
 @see AWSSSMCreateMaintenanceWindowResult
 */
- (void)createMaintenanceWindow:(AWSSSMCreateMaintenanceWindowRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMCreateMaintenanceWindowResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new OpsItem. You must have permission in AWS Identity and Access Management (IAM) to create a new OpsItem. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the CreateOpsItem service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMCreateOpsItemResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorOpsItemAlreadyExists`, `AWSSSMErrorOpsItemLimitExceeded`, `AWSSSMErrorOpsItemInvalidParameter`.
 
 @see AWSSSMCreateOpsItemRequest
 @see AWSSSMCreateOpsItemResponse
 */
- (AWSTask<AWSSSMCreateOpsItemResponse *> *)createOpsItem:(AWSSSMCreateOpsItemRequest *)request;

/**
 <p>Creates a new OpsItem. You must have permission in AWS Identity and Access Management (IAM) to create a new OpsItem. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the CreateOpsItem service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorOpsItemAlreadyExists`, `AWSSSMErrorOpsItemLimitExceeded`, `AWSSSMErrorOpsItemInvalidParameter`.
 
 @see AWSSSMCreateOpsItemRequest
 @see AWSSSMCreateOpsItemResponse
 */
- (void)createOpsItem:(AWSSSMCreateOpsItemRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMCreateOpsItemResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a patch baseline.</p><note><p>For information about valid key and value pairs in <code>PatchFilters</code> for each supported operating system type, see <a href="http://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html">PatchFilter</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreatePatchBaseline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMCreatePatchBaselineResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorIdempotentParameterMismatch`, `AWSSSMErrorResourceLimitExceeded`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMCreatePatchBaselineRequest
 @see AWSSSMCreatePatchBaselineResult
 */
- (AWSTask<AWSSSMCreatePatchBaselineResult *> *)createPatchBaseline:(AWSSSMCreatePatchBaselineRequest *)request;

/**
 <p>Creates a patch baseline.</p><note><p>For information about valid key and value pairs in <code>PatchFilters</code> for each supported operating system type, see <a href="http://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html">PatchFilter</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreatePatchBaseline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorIdempotentParameterMismatch`, `AWSSSMErrorResourceLimitExceeded`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMCreatePatchBaselineRequest
 @see AWSSSMCreatePatchBaselineResult
 */
- (void)createPatchBaseline:(AWSSSMCreatePatchBaselineRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMCreatePatchBaselineResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>A resource data sync helps you view data from multiple sources in a single location. Systems Manager offers two types of resource data sync: <code>SyncToDestination</code> and <code>SyncFromSource</code>.</p><p>You can configure Systems Manager Inventory to use the <code>SyncToDestination</code> type to synchronize Inventory data from multiple AWS Regions to a single S3 bucket. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-datasync.html">Configuring Resource Data Sync for Inventory</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>You can configure Systems Manager Explorer to use the <code>SyncFromSource</code> type to synchronize operational work items (OpsItems) and operational data (OpsData) from multiple AWS Regions to a single S3 bucket. This type can synchronize OpsItems and OpsData from multiple AWS accounts and Regions or <code>EntireOrganization</code> by using AWS Organizations. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/Explorer-resource-data-sync.html">Setting up Systems Manager Explorer to display data from multiple accounts and Regions</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>A resource data sync is an asynchronous operation that returns immediately. After a successful initial sync is completed, the system continuously syncs data. To check the status of a sync, use the <a>ListResourceDataSync</a>.</p><note><p>By default, data is not encrypted in Amazon S3. We strongly recommend that you enable encryption in Amazon S3 to ensure secure data storage. We also recommend that you secure access to the Amazon S3 bucket by creating a restrictive bucket policy. </p></note>
 
 @param request A container for the necessary parameters to execute the CreateResourceDataSync service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMCreateResourceDataSyncResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorResourceDataSyncCountExceeded`, `AWSSSMErrorResourceDataSyncAlreadyExists`, `AWSSSMErrorResourceDataSyncInvalidConfiguration`.
 
 @see AWSSSMCreateResourceDataSyncRequest
 @see AWSSSMCreateResourceDataSyncResult
 */
- (AWSTask<AWSSSMCreateResourceDataSyncResult *> *)createResourceDataSync:(AWSSSMCreateResourceDataSyncRequest *)request;

/**
 <p>A resource data sync helps you view data from multiple sources in a single location. Systems Manager offers two types of resource data sync: <code>SyncToDestination</code> and <code>SyncFromSource</code>.</p><p>You can configure Systems Manager Inventory to use the <code>SyncToDestination</code> type to synchronize Inventory data from multiple AWS Regions to a single S3 bucket. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-datasync.html">Configuring Resource Data Sync for Inventory</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>You can configure Systems Manager Explorer to use the <code>SyncFromSource</code> type to synchronize operational work items (OpsItems) and operational data (OpsData) from multiple AWS Regions to a single S3 bucket. This type can synchronize OpsItems and OpsData from multiple AWS accounts and Regions or <code>EntireOrganization</code> by using AWS Organizations. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/Explorer-resource-data-sync.html">Setting up Systems Manager Explorer to display data from multiple accounts and Regions</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>A resource data sync is an asynchronous operation that returns immediately. After a successful initial sync is completed, the system continuously syncs data. To check the status of a sync, use the <a>ListResourceDataSync</a>.</p><note><p>By default, data is not encrypted in Amazon S3. We strongly recommend that you enable encryption in Amazon S3 to ensure secure data storage. We also recommend that you secure access to the Amazon S3 bucket by creating a restrictive bucket policy. </p></note>
 
 @param request A container for the necessary parameters to execute the CreateResourceDataSync service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorResourceDataSyncCountExceeded`, `AWSSSMErrorResourceDataSyncAlreadyExists`, `AWSSSMErrorResourceDataSyncInvalidConfiguration`.
 
 @see AWSSSMCreateResourceDataSyncRequest
 @see AWSSSMCreateResourceDataSyncResult
 */
- (void)createResourceDataSync:(AWSSSMCreateResourceDataSyncRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMCreateResourceDataSyncResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an activation. You are not required to delete an activation. If you delete an activation, you can no longer use it to register additional managed instances. Deleting an activation does not de-register managed instances. You must manually de-register managed instances.</p>
 
 @param request A container for the necessary parameters to execute the DeleteActivation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDeleteActivationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidActivationId`, `AWSSSMErrorInvalidActivation`, `AWSSSMErrorInternalServer`, `AWSSSMErrorTooManyUpdates`.
 
 @see AWSSSMDeleteActivationRequest
 @see AWSSSMDeleteActivationResult
 */
- (AWSTask<AWSSSMDeleteActivationResult *> *)deleteActivation:(AWSSSMDeleteActivationRequest *)request;

/**
 <p>Deletes an activation. You are not required to delete an activation. If you delete an activation, you can no longer use it to register additional managed instances. Deleting an activation does not de-register managed instances. You must manually de-register managed instances.</p>
 
 @param request A container for the necessary parameters to execute the DeleteActivation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidActivationId`, `AWSSSMErrorInvalidActivation`, `AWSSSMErrorInternalServer`, `AWSSSMErrorTooManyUpdates`.
 
 @see AWSSSMDeleteActivationRequest
 @see AWSSSMDeleteActivationResult
 */
- (void)deleteActivation:(AWSSSMDeleteActivationRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDeleteActivationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates the specified Systems Manager document from the specified instance.</p><p>When you disassociate a document from an instance, it does not change the configuration of the instance. To change the configuration state of an instance after you disassociate a document, you must create a new document with the desired configuration and associate it with the instance.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDeleteAssociationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorAssociationDoesNotExist`, `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorTooManyUpdates`.
 
 @see AWSSSMDeleteAssociationRequest
 @see AWSSSMDeleteAssociationResult
 */
- (AWSTask<AWSSSMDeleteAssociationResult *> *)deleteAssociation:(AWSSSMDeleteAssociationRequest *)request;

/**
 <p>Disassociates the specified Systems Manager document from the specified instance.</p><p>When you disassociate a document from an instance, it does not change the configuration of the instance. To change the configuration state of an instance after you disassociate a document, you must create a new document with the desired configuration and associate it with the instance.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorAssociationDoesNotExist`, `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorTooManyUpdates`.
 
 @see AWSSSMDeleteAssociationRequest
 @see AWSSSMDeleteAssociationResult
 */
- (void)deleteAssociation:(AWSSSMDeleteAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDeleteAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the Systems Manager document and all instance associations to the document.</p><p>Before you delete the document, we recommend that you use <a>DeleteAssociation</a> to disassociate all instances that are associated with the document.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDocument service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDeleteDocumentResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidDocumentOperation`, `AWSSSMErrorAssociatedInstances`.
 
 @see AWSSSMDeleteDocumentRequest
 @see AWSSSMDeleteDocumentResult
 */
- (AWSTask<AWSSSMDeleteDocumentResult *> *)deleteDocument:(AWSSSMDeleteDocumentRequest *)request;

/**
 <p>Deletes the Systems Manager document and all instance associations to the document.</p><p>Before you delete the document, we recommend that you use <a>DeleteAssociation</a> to disassociate all instances that are associated with the document.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDocument service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidDocumentOperation`, `AWSSSMErrorAssociatedInstances`.
 
 @see AWSSSMDeleteDocumentRequest
 @see AWSSSMDeleteDocumentResult
 */
- (void)deleteDocument:(AWSSSMDeleteDocumentRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDeleteDocumentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Delete a custom inventory type, or the data associated with a custom Inventory type. Deleting a custom inventory type is also referred to as deleting a custom inventory schema.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInventory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDeleteInventoryResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidTypeName`, `AWSSSMErrorInvalidOption`, `AWSSSMErrorInvalidDeleteInventoryParameters`, `AWSSSMErrorInvalidInventoryRequest`.
 
 @see AWSSSMDeleteInventoryRequest
 @see AWSSSMDeleteInventoryResult
 */
- (AWSTask<AWSSSMDeleteInventoryResult *> *)deleteInventory:(AWSSSMDeleteInventoryRequest *)request;

/**
 <p>Delete a custom inventory type, or the data associated with a custom Inventory type. Deleting a custom inventory type is also referred to as deleting a custom inventory schema.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInventory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidTypeName`, `AWSSSMErrorInvalidOption`, `AWSSSMErrorInvalidDeleteInventoryParameters`, `AWSSSMErrorInvalidInventoryRequest`.
 
 @see AWSSSMDeleteInventoryRequest
 @see AWSSSMDeleteInventoryResult
 */
- (void)deleteInventory:(AWSSSMDeleteInventoryRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDeleteInventoryResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMaintenanceWindow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDeleteMaintenanceWindowResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDeleteMaintenanceWindowRequest
 @see AWSSSMDeleteMaintenanceWindowResult
 */
- (AWSTask<AWSSSMDeleteMaintenanceWindowResult *> *)deleteMaintenanceWindow:(AWSSSMDeleteMaintenanceWindowRequest *)request;

/**
 <p>Deletes a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMaintenanceWindow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDeleteMaintenanceWindowRequest
 @see AWSSSMDeleteMaintenanceWindowResult
 */
- (void)deleteMaintenanceWindow:(AWSSSMDeleteMaintenanceWindowRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDeleteMaintenanceWindowResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Delete a parameter from the system.</p>
 
 @param request A container for the necessary parameters to execute the DeleteParameter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDeleteParameterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorParameterNotFound`.
 
 @see AWSSSMDeleteParameterRequest
 @see AWSSSMDeleteParameterResult
 */
- (AWSTask<AWSSSMDeleteParameterResult *> *)deleteParameter:(AWSSSMDeleteParameterRequest *)request;

/**
 <p>Delete a parameter from the system.</p>
 
 @param request A container for the necessary parameters to execute the DeleteParameter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorParameterNotFound`.
 
 @see AWSSSMDeleteParameterRequest
 @see AWSSSMDeleteParameterResult
 */
- (void)deleteParameter:(AWSSSMDeleteParameterRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDeleteParameterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Delete a list of parameters.</p>
 
 @param request A container for the necessary parameters to execute the DeleteParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDeleteParametersResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDeleteParametersRequest
 @see AWSSSMDeleteParametersResult
 */
- (AWSTask<AWSSSMDeleteParametersResult *> *)deleteParameters:(AWSSSMDeleteParametersRequest *)request;

/**
 <p>Delete a list of parameters.</p>
 
 @param request A container for the necessary parameters to execute the DeleteParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDeleteParametersRequest
 @see AWSSSMDeleteParametersResult
 */
- (void)deleteParameters:(AWSSSMDeleteParametersRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDeleteParametersResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a patch baseline.</p>
 
 @param request A container for the necessary parameters to execute the DeletePatchBaseline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDeletePatchBaselineResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorResourceInUse`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDeletePatchBaselineRequest
 @see AWSSSMDeletePatchBaselineResult
 */
- (AWSTask<AWSSSMDeletePatchBaselineResult *> *)deletePatchBaseline:(AWSSSMDeletePatchBaselineRequest *)request;

/**
 <p>Deletes a patch baseline.</p>
 
 @param request A container for the necessary parameters to execute the DeletePatchBaseline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorResourceInUse`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDeletePatchBaselineRequest
 @see AWSSSMDeletePatchBaselineResult
 */
- (void)deletePatchBaseline:(AWSSSMDeletePatchBaselineRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDeletePatchBaselineResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a Resource Data Sync configuration. After the configuration is deleted, changes to data on managed instances are no longer synced to or from the target. Deleting a sync configuration does not delete data.</p>
 
 @param request A container for the necessary parameters to execute the DeleteResourceDataSync service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDeleteResourceDataSyncResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorResourceDataSyncNotFound`, `AWSSSMErrorResourceDataSyncInvalidConfiguration`.
 
 @see AWSSSMDeleteResourceDataSyncRequest
 @see AWSSSMDeleteResourceDataSyncResult
 */
- (AWSTask<AWSSSMDeleteResourceDataSyncResult *> *)deleteResourceDataSync:(AWSSSMDeleteResourceDataSyncRequest *)request;

/**
 <p>Deletes a Resource Data Sync configuration. After the configuration is deleted, changes to data on managed instances are no longer synced to or from the target. Deleting a sync configuration does not delete data.</p>
 
 @param request A container for the necessary parameters to execute the DeleteResourceDataSync service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorResourceDataSyncNotFound`, `AWSSSMErrorResourceDataSyncInvalidConfiguration`.
 
 @see AWSSSMDeleteResourceDataSyncRequest
 @see AWSSSMDeleteResourceDataSyncResult
 */
- (void)deleteResourceDataSync:(AWSSSMDeleteResourceDataSyncRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDeleteResourceDataSyncResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the server or virtual machine from the list of registered servers. You can reregister the instance again at any time. If you don't plan to use Run Command on the server, we suggest uninstalling SSM Agent first.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterManagedInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDeregisterManagedInstanceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDeregisterManagedInstanceRequest
 @see AWSSSMDeregisterManagedInstanceResult
 */
- (AWSTask<AWSSSMDeregisterManagedInstanceResult *> *)deregisterManagedInstance:(AWSSSMDeregisterManagedInstanceRequest *)request;

/**
 <p>Removes the server or virtual machine from the list of registered servers. You can reregister the instance again at any time. If you don't plan to use Run Command on the server, we suggest uninstalling SSM Agent first.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterManagedInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDeregisterManagedInstanceRequest
 @see AWSSSMDeregisterManagedInstanceResult
 */
- (void)deregisterManagedInstance:(AWSSSMDeregisterManagedInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDeregisterManagedInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a patch group from a patch baseline.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterPatchBaselineForPatchGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDeregisterPatchBaselineForPatchGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidResourceId`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDeregisterPatchBaselineForPatchGroupRequest
 @see AWSSSMDeregisterPatchBaselineForPatchGroupResult
 */
- (AWSTask<AWSSSMDeregisterPatchBaselineForPatchGroupResult *> *)deregisterPatchBaselineForPatchGroup:(AWSSSMDeregisterPatchBaselineForPatchGroupRequest *)request;

/**
 <p>Removes a patch group from a patch baseline.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterPatchBaselineForPatchGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidResourceId`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDeregisterPatchBaselineForPatchGroupRequest
 @see AWSSSMDeregisterPatchBaselineForPatchGroupResult
 */
- (void)deregisterPatchBaselineForPatchGroup:(AWSSSMDeregisterPatchBaselineForPatchGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDeregisterPatchBaselineForPatchGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a target from a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterTargetFromMaintenanceWindow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDeregisterTargetFromMaintenanceWindowResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`, `AWSSSMErrorTargetInUse`.
 
 @see AWSSSMDeregisterTargetFromMaintenanceWindowRequest
 @see AWSSSMDeregisterTargetFromMaintenanceWindowResult
 */
- (AWSTask<AWSSSMDeregisterTargetFromMaintenanceWindowResult *> *)deregisterTargetFromMaintenanceWindow:(AWSSSMDeregisterTargetFromMaintenanceWindowRequest *)request;

/**
 <p>Removes a target from a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterTargetFromMaintenanceWindow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`, `AWSSSMErrorTargetInUse`.
 
 @see AWSSSMDeregisterTargetFromMaintenanceWindowRequest
 @see AWSSSMDeregisterTargetFromMaintenanceWindowResult
 */
- (void)deregisterTargetFromMaintenanceWindow:(AWSSSMDeregisterTargetFromMaintenanceWindowRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDeregisterTargetFromMaintenanceWindowResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a task from a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterTaskFromMaintenanceWindow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDeregisterTaskFromMaintenanceWindowResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDeregisterTaskFromMaintenanceWindowRequest
 @see AWSSSMDeregisterTaskFromMaintenanceWindowResult
 */
- (AWSTask<AWSSSMDeregisterTaskFromMaintenanceWindowResult *> *)deregisterTaskFromMaintenanceWindow:(AWSSSMDeregisterTaskFromMaintenanceWindowRequest *)request;

/**
 <p>Removes a task from a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterTaskFromMaintenanceWindow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDeregisterTaskFromMaintenanceWindowRequest
 @see AWSSSMDeregisterTaskFromMaintenanceWindowResult
 */
- (void)deregisterTaskFromMaintenanceWindow:(AWSSSMDeregisterTaskFromMaintenanceWindowRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDeregisterTaskFromMaintenanceWindowResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes details about the activation, such as the date and time the activation was created, its expiration date, the IAM role assigned to the instances in the activation, and the number of instances registered by using this activation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeActivations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeActivationsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidFilter`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeActivationsRequest
 @see AWSSSMDescribeActivationsResult
 */
- (AWSTask<AWSSSMDescribeActivationsResult *> *)describeActivations:(AWSSSMDescribeActivationsRequest *)request;

/**
 <p>Describes details about the activation, such as the date and time the activation was created, its expiration date, the IAM role assigned to the instances in the activation, and the number of instances registered by using this activation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeActivations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidFilter`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeActivationsRequest
 @see AWSSSMDescribeActivationsResult
 */
- (void)describeActivations:(AWSSSMDescribeActivationsRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeActivationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the association for the specified target or instance. If you created the association by using the <code>Targets</code> parameter, then you must retrieve the association by using the association ID. If you created the association by specifying an instance ID and a Systems Manager document, then you retrieve the association by specifying the document name and the instance ID. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeAssociationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorAssociationDoesNotExist`, `AWSSSMErrorInvalidAssociationVersion`, `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidInstanceId`.
 
 @see AWSSSMDescribeAssociationRequest
 @see AWSSSMDescribeAssociationResult
 */
- (AWSTask<AWSSSMDescribeAssociationResult *> *)describeAssociation:(AWSSSMDescribeAssociationRequest *)request;

/**
 <p>Describes the association for the specified target or instance. If you created the association by using the <code>Targets</code> parameter, then you must retrieve the association by using the association ID. If you created the association by specifying an instance ID and a Systems Manager document, then you retrieve the association by specifying the document name and the instance ID. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorAssociationDoesNotExist`, `AWSSSMErrorInvalidAssociationVersion`, `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidInstanceId`.
 
 @see AWSSSMDescribeAssociationRequest
 @see AWSSSMDescribeAssociationResult
 */
- (void)describeAssociation:(AWSSSMDescribeAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Use this API action to view information about a specific execution of a specific association.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAssociationExecutionTargets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeAssociationExecutionTargetsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorAssociationDoesNotExist`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorAssociationExecutionDoesNotExist`.
 
 @see AWSSSMDescribeAssociationExecutionTargetsRequest
 @see AWSSSMDescribeAssociationExecutionTargetsResult
 */
- (AWSTask<AWSSSMDescribeAssociationExecutionTargetsResult *> *)describeAssociationExecutionTargets:(AWSSSMDescribeAssociationExecutionTargetsRequest *)request;

/**
 <p>Use this API action to view information about a specific execution of a specific association.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAssociationExecutionTargets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorAssociationDoesNotExist`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorAssociationExecutionDoesNotExist`.
 
 @see AWSSSMDescribeAssociationExecutionTargetsRequest
 @see AWSSSMDescribeAssociationExecutionTargetsResult
 */
- (void)describeAssociationExecutionTargets:(AWSSSMDescribeAssociationExecutionTargetsRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeAssociationExecutionTargetsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Use this API action to view all executions for a specific association ID. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAssociationExecutions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeAssociationExecutionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorAssociationDoesNotExist`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMDescribeAssociationExecutionsRequest
 @see AWSSSMDescribeAssociationExecutionsResult
 */
- (AWSTask<AWSSSMDescribeAssociationExecutionsResult *> *)describeAssociationExecutions:(AWSSSMDescribeAssociationExecutionsRequest *)request;

/**
 <p>Use this API action to view all executions for a specific association ID. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAssociationExecutions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorAssociationDoesNotExist`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMDescribeAssociationExecutionsRequest
 @see AWSSSMDescribeAssociationExecutionsResult
 */
- (void)describeAssociationExecutions:(AWSSSMDescribeAssociationExecutionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeAssociationExecutionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides details about all active and terminated Automation executions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutomationExecutions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeAutomationExecutionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidFilterKey`, `AWSSSMErrorInvalidFilterValue`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeAutomationExecutionsRequest
 @see AWSSSMDescribeAutomationExecutionsResult
 */
- (AWSTask<AWSSSMDescribeAutomationExecutionsResult *> *)describeAutomationExecutions:(AWSSSMDescribeAutomationExecutionsRequest *)request;

/**
 <p>Provides details about all active and terminated Automation executions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutomationExecutions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidFilterKey`, `AWSSSMErrorInvalidFilterValue`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeAutomationExecutionsRequest
 @see AWSSSMDescribeAutomationExecutionsResult
 */
- (void)describeAutomationExecutions:(AWSSSMDescribeAutomationExecutionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeAutomationExecutionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Information about all active and terminated step executions in an Automation workflow.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutomationStepExecutions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeAutomationStepExecutionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorAutomationExecutionNotFound`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorInvalidFilterKey`, `AWSSSMErrorInvalidFilterValue`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeAutomationStepExecutionsRequest
 @see AWSSSMDescribeAutomationStepExecutionsResult
 */
- (AWSTask<AWSSSMDescribeAutomationStepExecutionsResult *> *)describeAutomationStepExecutions:(AWSSSMDescribeAutomationStepExecutionsRequest *)request;

/**
 <p>Information about all active and terminated step executions in an Automation workflow.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutomationStepExecutions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorAutomationExecutionNotFound`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorInvalidFilterKey`, `AWSSSMErrorInvalidFilterValue`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeAutomationStepExecutionsRequest
 @see AWSSSMDescribeAutomationStepExecutionsResult
 */
- (void)describeAutomationStepExecutions:(AWSSSMDescribeAutomationStepExecutionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeAutomationStepExecutionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all patches eligible to be included in a patch baseline.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAvailablePatches service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeAvailablePatchesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeAvailablePatchesRequest
 @see AWSSSMDescribeAvailablePatchesResult
 */
- (AWSTask<AWSSSMDescribeAvailablePatchesResult *> *)describeAvailablePatches:(AWSSSMDescribeAvailablePatchesRequest *)request;

/**
 <p>Lists all patches eligible to be included in a patch baseline.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAvailablePatches service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeAvailablePatchesRequest
 @see AWSSSMDescribeAvailablePatchesResult
 */
- (void)describeAvailablePatches:(AWSSSMDescribeAvailablePatchesRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeAvailablePatchesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified Systems Manager document.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDocument service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeDocumentResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidDocumentVersion`.
 
 @see AWSSSMDescribeDocumentRequest
 @see AWSSSMDescribeDocumentResult
 */
- (AWSTask<AWSSSMDescribeDocumentResult *> *)describeDocument:(AWSSSMDescribeDocumentRequest *)request;

/**
 <p>Describes the specified Systems Manager document.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDocument service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidDocumentVersion`.
 
 @see AWSSSMDescribeDocumentRequest
 @see AWSSSMDescribeDocumentResult
 */
- (void)describeDocument:(AWSSSMDescribeDocumentRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeDocumentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the permissions for a Systems Manager document. If you created the document, you are the owner. If a document is shared, it can either be shared privately (by specifying a user's AWS account ID) or publicly (<i>All</i>). </p>
 
 @param request A container for the necessary parameters to execute the DescribeDocumentPermission service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeDocumentPermissionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidPermissionType`.
 
 @see AWSSSMDescribeDocumentPermissionRequest
 @see AWSSSMDescribeDocumentPermissionResponse
 */
- (AWSTask<AWSSSMDescribeDocumentPermissionResponse *> *)describeDocumentPermission:(AWSSSMDescribeDocumentPermissionRequest *)request;

/**
 <p>Describes the permissions for a Systems Manager document. If you created the document, you are the owner. If a document is shared, it can either be shared privately (by specifying a user's AWS account ID) or publicly (<i>All</i>). </p>
 
 @param request A container for the necessary parameters to execute the DescribeDocumentPermission service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidPermissionType`.
 
 @see AWSSSMDescribeDocumentPermissionRequest
 @see AWSSSMDescribeDocumentPermissionResponse
 */
- (void)describeDocumentPermission:(AWSSSMDescribeDocumentPermissionRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeDocumentPermissionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>All associations for the instance(s).</p>
 
 @param request A container for the necessary parameters to execute the DescribeEffectiveInstanceAssociations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeEffectiveInstanceAssociationsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMDescribeEffectiveInstanceAssociationsRequest
 @see AWSSSMDescribeEffectiveInstanceAssociationsResult
 */
- (AWSTask<AWSSSMDescribeEffectiveInstanceAssociationsResult *> *)describeEffectiveInstanceAssociations:(AWSSSMDescribeEffectiveInstanceAssociationsRequest *)request;

/**
 <p>All associations for the instance(s).</p>
 
 @param request A container for the necessary parameters to execute the DescribeEffectiveInstanceAssociations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMDescribeEffectiveInstanceAssociationsRequest
 @see AWSSSMDescribeEffectiveInstanceAssociationsResult
 */
- (void)describeEffectiveInstanceAssociations:(AWSSSMDescribeEffectiveInstanceAssociationsRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeEffectiveInstanceAssociationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the current effective patches (the patch and the approval state) for the specified patch baseline. Note that this API applies only to Windows patch baselines.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEffectivePatchesForPatchBaseline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeEffectivePatchesForPatchBaselineResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidResourceId`, `AWSSSMErrorDoesNotExist`, `AWSSSMErrorUnsupportedOperatingSystem`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeEffectivePatchesForPatchBaselineRequest
 @see AWSSSMDescribeEffectivePatchesForPatchBaselineResult
 */
- (AWSTask<AWSSSMDescribeEffectivePatchesForPatchBaselineResult *> *)describeEffectivePatchesForPatchBaseline:(AWSSSMDescribeEffectivePatchesForPatchBaselineRequest *)request;

/**
 <p>Retrieves the current effective patches (the patch and the approval state) for the specified patch baseline. Note that this API applies only to Windows patch baselines.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEffectivePatchesForPatchBaseline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidResourceId`, `AWSSSMErrorDoesNotExist`, `AWSSSMErrorUnsupportedOperatingSystem`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeEffectivePatchesForPatchBaselineRequest
 @see AWSSSMDescribeEffectivePatchesForPatchBaselineResult
 */
- (void)describeEffectivePatchesForPatchBaseline:(AWSSSMDescribeEffectivePatchesForPatchBaselineRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeEffectivePatchesForPatchBaselineResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>The status of the associations for the instance(s).</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceAssociationsStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeInstanceAssociationsStatusResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMDescribeInstanceAssociationsStatusRequest
 @see AWSSSMDescribeInstanceAssociationsStatusResult
 */
- (AWSTask<AWSSSMDescribeInstanceAssociationsStatusResult *> *)describeInstanceAssociationsStatus:(AWSSSMDescribeInstanceAssociationsStatusRequest *)request;

/**
 <p>The status of the associations for the instance(s).</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceAssociationsStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMDescribeInstanceAssociationsStatusRequest
 @see AWSSSMDescribeInstanceAssociationsStatusResult
 */
- (void)describeInstanceAssociationsStatus:(AWSSSMDescribeInstanceAssociationsStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeInstanceAssociationsStatusResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your instances, including information about the operating system platform, the version of SSM Agent installed on the instance, instance status, and so on.</p><p>If you specify one or more instance IDs, it returns information for those instances. If you do not specify instance IDs, it returns information for all your instances. If you specify an instance ID that is not valid or an instance that you do not own, you receive an error.</p><note><p>The IamRole field for this API action is the Amazon Identity and Access Management (IAM) role assigned to on-premises instances. This call does not return the IAM role for EC2 instances.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceInformation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeInstanceInformationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorInvalidInstanceInformationFilterValue`, `AWSSSMErrorInvalidFilterKey`.
 
 @see AWSSSMDescribeInstanceInformationRequest
 @see AWSSSMDescribeInstanceInformationResult
 */
- (AWSTask<AWSSSMDescribeInstanceInformationResult *> *)describeInstanceInformation:(AWSSSMDescribeInstanceInformationRequest *)request;

/**
 <p>Describes one or more of your instances, including information about the operating system platform, the version of SSM Agent installed on the instance, instance status, and so on.</p><p>If you specify one or more instance IDs, it returns information for those instances. If you do not specify instance IDs, it returns information for all your instances. If you specify an instance ID that is not valid or an instance that you do not own, you receive an error.</p><note><p>The IamRole field for this API action is the Amazon Identity and Access Management (IAM) role assigned to on-premises instances. This call does not return the IAM role for EC2 instances.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceInformation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorInvalidInstanceInformationFilterValue`, `AWSSSMErrorInvalidFilterKey`.
 
 @see AWSSSMDescribeInstanceInformationRequest
 @see AWSSSMDescribeInstanceInformationResult
 */
- (void)describeInstanceInformation:(AWSSSMDescribeInstanceInformationRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeInstanceInformationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the high-level patch state of one or more instances.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstancePatchStates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeInstancePatchStatesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMDescribeInstancePatchStatesRequest
 @see AWSSSMDescribeInstancePatchStatesResult
 */
- (AWSTask<AWSSSMDescribeInstancePatchStatesResult *> *)describeInstancePatchStates:(AWSSSMDescribeInstancePatchStatesRequest *)request;

/**
 <p>Retrieves the high-level patch state of one or more instances.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstancePatchStates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMDescribeInstancePatchStatesRequest
 @see AWSSSMDescribeInstancePatchStatesResult
 */
- (void)describeInstancePatchStates:(AWSSSMDescribeInstancePatchStatesRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeInstancePatchStatesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the high-level patch state for the instances in the specified patch group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstancePatchStatesForPatchGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeInstancePatchStatesForPatchGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidFilter`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMDescribeInstancePatchStatesForPatchGroupRequest
 @see AWSSSMDescribeInstancePatchStatesForPatchGroupResult
 */
- (AWSTask<AWSSSMDescribeInstancePatchStatesForPatchGroupResult *> *)describeInstancePatchStatesForPatchGroup:(AWSSSMDescribeInstancePatchStatesForPatchGroupRequest *)request;

/**
 <p>Retrieves the high-level patch state for the instances in the specified patch group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstancePatchStatesForPatchGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidFilter`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMDescribeInstancePatchStatesForPatchGroupRequest
 @see AWSSSMDescribeInstancePatchStatesForPatchGroupResult
 */
- (void)describeInstancePatchStatesForPatchGroup:(AWSSSMDescribeInstancePatchStatesForPatchGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeInstancePatchStatesForPatchGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the patches on the specified instance and their state relative to the patch baseline being used for the instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstancePatches service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeInstancePatchesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInvalidFilter`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMDescribeInstancePatchesRequest
 @see AWSSSMDescribeInstancePatchesResult
 */
- (AWSTask<AWSSSMDescribeInstancePatchesResult *> *)describeInstancePatches:(AWSSSMDescribeInstancePatchesRequest *)request;

/**
 <p>Retrieves information about the patches on the specified instance and their state relative to the patch baseline being used for the instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstancePatches service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInvalidFilter`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMDescribeInstancePatchesRequest
 @see AWSSSMDescribeInstancePatchesResult
 */
- (void)describeInstancePatches:(AWSSSMDescribeInstancePatchesRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeInstancePatchesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes a specific delete inventory operation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInventoryDeletions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeInventoryDeletionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDeletionId`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMDescribeInventoryDeletionsRequest
 @see AWSSSMDescribeInventoryDeletionsResult
 */
- (AWSTask<AWSSSMDescribeInventoryDeletionsResult *> *)describeInventoryDeletions:(AWSSSMDescribeInventoryDeletionsRequest *)request;

/**
 <p>Describes a specific delete inventory operation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInventoryDeletions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDeletionId`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMDescribeInventoryDeletionsRequest
 @see AWSSSMDescribeInventoryDeletionsResult
 */
- (void)describeInventoryDeletions:(AWSSSMDescribeInventoryDeletionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeInventoryDeletionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the individual task executions (one per target) for a particular task run as part of a maintenance window execution.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowExecutionTaskInvocations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsRequest
 @see AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsResult
 */
- (AWSTask<AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsResult *> *)describeMaintenanceWindowExecutionTaskInvocations:(AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsRequest *)request;

/**
 <p>Retrieves the individual task executions (one per target) for a particular task run as part of a maintenance window execution.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowExecutionTaskInvocations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsRequest
 @see AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsResult
 */
- (void)describeMaintenanceWindowExecutionTaskInvocations:(AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>For a given maintenance window execution, lists the tasks that were run.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowExecutionTasks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeMaintenanceWindowExecutionTasksResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeMaintenanceWindowExecutionTasksRequest
 @see AWSSSMDescribeMaintenanceWindowExecutionTasksResult
 */
- (AWSTask<AWSSSMDescribeMaintenanceWindowExecutionTasksResult *> *)describeMaintenanceWindowExecutionTasks:(AWSSSMDescribeMaintenanceWindowExecutionTasksRequest *)request;

/**
 <p>For a given maintenance window execution, lists the tasks that were run.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowExecutionTasks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeMaintenanceWindowExecutionTasksRequest
 @see AWSSSMDescribeMaintenanceWindowExecutionTasksResult
 */
- (void)describeMaintenanceWindowExecutionTasks:(AWSSSMDescribeMaintenanceWindowExecutionTasksRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeMaintenanceWindowExecutionTasksResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the executions of a maintenance window. This includes information about when the maintenance window was scheduled to be active, and information about tasks registered and run with the maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowExecutions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeMaintenanceWindowExecutionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeMaintenanceWindowExecutionsRequest
 @see AWSSSMDescribeMaintenanceWindowExecutionsResult
 */
- (AWSTask<AWSSSMDescribeMaintenanceWindowExecutionsResult *> *)describeMaintenanceWindowExecutions:(AWSSSMDescribeMaintenanceWindowExecutionsRequest *)request;

/**
 <p>Lists the executions of a maintenance window. This includes information about when the maintenance window was scheduled to be active, and information about tasks registered and run with the maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowExecutions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeMaintenanceWindowExecutionsRequest
 @see AWSSSMDescribeMaintenanceWindowExecutionsResult
 */
- (void)describeMaintenanceWindowExecutions:(AWSSSMDescribeMaintenanceWindowExecutionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeMaintenanceWindowExecutionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about upcoming executions of a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeMaintenanceWindowScheduleResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorDoesNotExist`.
 
 @see AWSSSMDescribeMaintenanceWindowScheduleRequest
 @see AWSSSMDescribeMaintenanceWindowScheduleResult
 */
- (AWSTask<AWSSSMDescribeMaintenanceWindowScheduleResult *> *)describeMaintenanceWindowSchedule:(AWSSSMDescribeMaintenanceWindowScheduleRequest *)request;

/**
 <p>Retrieves information about upcoming executions of a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorDoesNotExist`.
 
 @see AWSSSMDescribeMaintenanceWindowScheduleRequest
 @see AWSSSMDescribeMaintenanceWindowScheduleResult
 */
- (void)describeMaintenanceWindowSchedule:(AWSSSMDescribeMaintenanceWindowScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeMaintenanceWindowScheduleResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the targets registered with the maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowTargets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeMaintenanceWindowTargetsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeMaintenanceWindowTargetsRequest
 @see AWSSSMDescribeMaintenanceWindowTargetsResult
 */
- (AWSTask<AWSSSMDescribeMaintenanceWindowTargetsResult *> *)describeMaintenanceWindowTargets:(AWSSSMDescribeMaintenanceWindowTargetsRequest *)request;

/**
 <p>Lists the targets registered with the maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowTargets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeMaintenanceWindowTargetsRequest
 @see AWSSSMDescribeMaintenanceWindowTargetsResult
 */
- (void)describeMaintenanceWindowTargets:(AWSSSMDescribeMaintenanceWindowTargetsRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeMaintenanceWindowTargetsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tasks in a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowTasks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeMaintenanceWindowTasksResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeMaintenanceWindowTasksRequest
 @see AWSSSMDescribeMaintenanceWindowTasksResult
 */
- (AWSTask<AWSSSMDescribeMaintenanceWindowTasksResult *> *)describeMaintenanceWindowTasks:(AWSSSMDescribeMaintenanceWindowTasksRequest *)request;

/**
 <p>Lists the tasks in a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowTasks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeMaintenanceWindowTasksRequest
 @see AWSSSMDescribeMaintenanceWindowTasksResult
 */
- (void)describeMaintenanceWindowTasks:(AWSSSMDescribeMaintenanceWindowTasksRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeMaintenanceWindowTasksResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the maintenance windows in an AWS account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindows service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeMaintenanceWindowsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeMaintenanceWindowsRequest
 @see AWSSSMDescribeMaintenanceWindowsResult
 */
- (AWSTask<AWSSSMDescribeMaintenanceWindowsResult *> *)describeMaintenanceWindows:(AWSSSMDescribeMaintenanceWindowsRequest *)request;

/**
 <p>Retrieves the maintenance windows in an AWS account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindows service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeMaintenanceWindowsRequest
 @see AWSSSMDescribeMaintenanceWindowsResult
 */
- (void)describeMaintenanceWindows:(AWSSSMDescribeMaintenanceWindowsRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeMaintenanceWindowsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the maintenance window targets or tasks that an instance is associated with.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowsForTarget service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeMaintenanceWindowsForTargetResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeMaintenanceWindowsForTargetRequest
 @see AWSSSMDescribeMaintenanceWindowsForTargetResult
 */
- (AWSTask<AWSSSMDescribeMaintenanceWindowsForTargetResult *> *)describeMaintenanceWindowsForTarget:(AWSSSMDescribeMaintenanceWindowsForTargetRequest *)request;

/**
 <p>Retrieves information about the maintenance window targets or tasks that an instance is associated with.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceWindowsForTarget service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeMaintenanceWindowsForTargetRequest
 @see AWSSSMDescribeMaintenanceWindowsForTargetResult
 */
- (void)describeMaintenanceWindowsForTarget:(AWSSSMDescribeMaintenanceWindowsForTargetRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeMaintenanceWindowsForTargetResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Query a set of OpsItems. You must have permission in AWS Identity and Access Management (IAM) to query a list of OpsItems. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeOpsItems service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeOpsItemsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeOpsItemsRequest
 @see AWSSSMDescribeOpsItemsResponse
 */
- (AWSTask<AWSSSMDescribeOpsItemsResponse *> *)describeOpsItems:(AWSSSMDescribeOpsItemsRequest *)request;

/**
 <p>Query a set of OpsItems. You must have permission in AWS Identity and Access Management (IAM) to query a list of OpsItems. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeOpsItems service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribeOpsItemsRequest
 @see AWSSSMDescribeOpsItemsResponse
 */
- (void)describeOpsItems:(AWSSSMDescribeOpsItemsRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeOpsItemsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get information about a parameter.</p><note><p>Request results are returned on a best-effort basis. If you specify <code>MaxResults</code> in the request, the response includes information up to the limit specified. The number of items returned, however, can be between zero and the value of <code>MaxResults</code>. If the service reaches an internal limit while processing the results, it stops the operation and returns the matching values up to that point and a <code>NextToken</code>. You can specify the <code>NextToken</code> in a subsequent call to get the next set of results.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeParametersResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidFilterKey`, `AWSSSMErrorInvalidFilterOption`, `AWSSSMErrorInvalidFilterValue`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMDescribeParametersRequest
 @see AWSSSMDescribeParametersResult
 */
- (AWSTask<AWSSSMDescribeParametersResult *> *)describeParameters:(AWSSSMDescribeParametersRequest *)request;

/**
 <p>Get information about a parameter.</p><note><p>Request results are returned on a best-effort basis. If you specify <code>MaxResults</code> in the request, the response includes information up to the limit specified. The number of items returned, however, can be between zero and the value of <code>MaxResults</code>. If the service reaches an internal limit while processing the results, it stops the operation and returns the matching values up to that point and a <code>NextToken</code>. You can specify the <code>NextToken</code> in a subsequent call to get the next set of results.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidFilterKey`, `AWSSSMErrorInvalidFilterOption`, `AWSSSMErrorInvalidFilterValue`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMDescribeParametersRequest
 @see AWSSSMDescribeParametersResult
 */
- (void)describeParameters:(AWSSSMDescribeParametersRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeParametersResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the patch baselines in your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the DescribePatchBaselines service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribePatchBaselinesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribePatchBaselinesRequest
 @see AWSSSMDescribePatchBaselinesResult
 */
- (AWSTask<AWSSSMDescribePatchBaselinesResult *> *)describePatchBaselines:(AWSSSMDescribePatchBaselinesRequest *)request;

/**
 <p>Lists the patch baselines in your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the DescribePatchBaselines service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribePatchBaselinesRequest
 @see AWSSSMDescribePatchBaselinesResult
 */
- (void)describePatchBaselines:(AWSSSMDescribePatchBaselinesRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribePatchBaselinesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns high-level aggregated patch compliance state for a patch group.</p>
 
 @param request A container for the necessary parameters to execute the DescribePatchGroupState service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribePatchGroupStateResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMDescribePatchGroupStateRequest
 @see AWSSSMDescribePatchGroupStateResult
 */
- (AWSTask<AWSSSMDescribePatchGroupStateResult *> *)describePatchGroupState:(AWSSSMDescribePatchGroupStateRequest *)request;

/**
 <p>Returns high-level aggregated patch compliance state for a patch group.</p>
 
 @param request A container for the necessary parameters to execute the DescribePatchGroupState service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMDescribePatchGroupStateRequest
 @see AWSSSMDescribePatchGroupStateResult
 */
- (void)describePatchGroupState:(AWSSSMDescribePatchGroupStateRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribePatchGroupStateResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all patch groups that have been registered with patch baselines.</p>
 
 @param request A container for the necessary parameters to execute the DescribePatchGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribePatchGroupsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribePatchGroupsRequest
 @see AWSSSMDescribePatchGroupsResult
 */
- (AWSTask<AWSSSMDescribePatchGroupsResult *> *)describePatchGroups:(AWSSSMDescribePatchGroupsRequest *)request;

/**
 <p>Lists all patch groups that have been registered with patch baselines.</p>
 
 @param request A container for the necessary parameters to execute the DescribePatchGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribePatchGroupsRequest
 @see AWSSSMDescribePatchGroupsResult
 */
- (void)describePatchGroups:(AWSSSMDescribePatchGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribePatchGroupsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the properties of available patches organized by product, product family, classification, severity, and other properties of available patches. You can use the reported properties in the filters you specify in requests for actions such as <a>CreatePatchBaseline</a>, <a>UpdatePatchBaseline</a>, <a>DescribeAvailablePatches</a>, and <a>DescribePatchBaselines</a>.</p><p>The following section lists the properties that can be used in filters for each major operating system type:</p><dl><dt>WINDOWS</dt><dd><p>Valid properties: PRODUCT, PRODUCT_FAMILY, CLASSIFICATION, MSRC_SEVERITY</p></dd><dt>AMAZON_LINUX</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd><dt>AMAZON_LINUX_2</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd><dt>UBUNTU </dt><dd><p>Valid properties: PRODUCT, PRIORITY</p></dd><dt>REDHAT_ENTERPRISE_LINUX</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd><dt>SUSE</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd><dt>CENTOS</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd></dl>
 
 @param request A container for the necessary parameters to execute the DescribePatchProperties service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribePatchPropertiesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribePatchPropertiesRequest
 @see AWSSSMDescribePatchPropertiesResult
 */
- (AWSTask<AWSSSMDescribePatchPropertiesResult *> *)describePatchProperties:(AWSSSMDescribePatchPropertiesRequest *)request;

/**
 <p>Lists the properties of available patches organized by product, product family, classification, severity, and other properties of available patches. You can use the reported properties in the filters you specify in requests for actions such as <a>CreatePatchBaseline</a>, <a>UpdatePatchBaseline</a>, <a>DescribeAvailablePatches</a>, and <a>DescribePatchBaselines</a>.</p><p>The following section lists the properties that can be used in filters for each major operating system type:</p><dl><dt>WINDOWS</dt><dd><p>Valid properties: PRODUCT, PRODUCT_FAMILY, CLASSIFICATION, MSRC_SEVERITY</p></dd><dt>AMAZON_LINUX</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd><dt>AMAZON_LINUX_2</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd><dt>UBUNTU </dt><dd><p>Valid properties: PRODUCT, PRIORITY</p></dd><dt>REDHAT_ENTERPRISE_LINUX</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd><dt>SUSE</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd><dt>CENTOS</dt><dd><p>Valid properties: PRODUCT, CLASSIFICATION, SEVERITY</p></dd></dl>
 
 @param request A container for the necessary parameters to execute the DescribePatchProperties service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMDescribePatchPropertiesRequest
 @see AWSSSMDescribePatchPropertiesResult
 */
- (void)describePatchProperties:(AWSSSMDescribePatchPropertiesRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribePatchPropertiesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of all active sessions (both connected and disconnected) or terminated sessions from the past 30 days.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSessions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMDescribeSessionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidFilterKey`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMDescribeSessionsRequest
 @see AWSSSMDescribeSessionsResponse
 */
- (AWSTask<AWSSSMDescribeSessionsResponse *> *)describeSessions:(AWSSSMDescribeSessionsRequest *)request;

/**
 <p>Retrieves a list of all active sessions (both connected and disconnected) or terminated sessions from the past 30 days.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSessions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidFilterKey`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMDescribeSessionsRequest
 @see AWSSSMDescribeSessionsResponse
 */
- (void)describeSessions:(AWSSSMDescribeSessionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMDescribeSessionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get detailed information about a particular Automation execution.</p>
 
 @param request A container for the necessary parameters to execute the GetAutomationExecution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMGetAutomationExecutionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorAutomationExecutionNotFound`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMGetAutomationExecutionRequest
 @see AWSSSMGetAutomationExecutionResult
 */
- (AWSTask<AWSSSMGetAutomationExecutionResult *> *)getAutomationExecution:(AWSSSMGetAutomationExecutionRequest *)request;

/**
 <p>Get detailed information about a particular Automation execution.</p>
 
 @param request A container for the necessary parameters to execute the GetAutomationExecution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorAutomationExecutionNotFound`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMGetAutomationExecutionRequest
 @see AWSSSMGetAutomationExecutionResult
 */
- (void)getAutomationExecution:(AWSSSMGetAutomationExecutionRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMGetAutomationExecutionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the state of the AWS Systems Manager Change Calendar at an optional, specified time. If you specify a time, <code>GetCalendarState</code> returns the state of the calendar at a specific time, and returns the next time that the Change Calendar state will transition. If you do not specify a time, <code>GetCalendarState</code> assumes the current time. Change Calendar entries have two possible states: <code>OPEN</code> or <code>CLOSED</code>. For more information about Systems Manager Change Calendar, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar.html">AWS Systems Manager Change Calendar</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetCalendarState service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMGetCalendarStateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidDocumentType`, `AWSSSMErrorUnsupportedCalendar`.
 
 @see AWSSSMGetCalendarStateRequest
 @see AWSSSMGetCalendarStateResponse
 */
- (AWSTask<AWSSSMGetCalendarStateResponse *> *)getCalendarState:(AWSSSMGetCalendarStateRequest *)request;

/**
 <p>Gets the state of the AWS Systems Manager Change Calendar at an optional, specified time. If you specify a time, <code>GetCalendarState</code> returns the state of the calendar at a specific time, and returns the next time that the Change Calendar state will transition. If you do not specify a time, <code>GetCalendarState</code> assumes the current time. Change Calendar entries have two possible states: <code>OPEN</code> or <code>CLOSED</code>. For more information about Systems Manager Change Calendar, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar.html">AWS Systems Manager Change Calendar</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetCalendarState service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidDocumentType`, `AWSSSMErrorUnsupportedCalendar`.
 
 @see AWSSSMGetCalendarStateRequest
 @see AWSSSMGetCalendarStateResponse
 */
- (void)getCalendarState:(AWSSSMGetCalendarStateRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMGetCalendarStateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns detailed information about command execution for an invocation or plugin. </p>
 
 @param request A container for the necessary parameters to execute the GetCommandInvocation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMGetCommandInvocationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidCommandId`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInvalidPluginName`, `AWSSSMErrorInvocationDoesNotExist`.
 
 @see AWSSSMGetCommandInvocationRequest
 @see AWSSSMGetCommandInvocationResult
 */
- (AWSTask<AWSSSMGetCommandInvocationResult *> *)getCommandInvocation:(AWSSSMGetCommandInvocationRequest *)request;

/**
 <p>Returns detailed information about command execution for an invocation or plugin. </p>
 
 @param request A container for the necessary parameters to execute the GetCommandInvocation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidCommandId`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInvalidPluginName`, `AWSSSMErrorInvocationDoesNotExist`.
 
 @see AWSSSMGetCommandInvocationRequest
 @see AWSSSMGetCommandInvocationResult
 */
- (void)getCommandInvocation:(AWSSSMGetCommandInvocationRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMGetCommandInvocationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the Session Manager connection status for an instance to determine whether it is running and ready to receive Session Manager connections.</p>
 
 @param request A container for the necessary parameters to execute the GetConnectionStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMGetConnectionStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMGetConnectionStatusRequest
 @see AWSSSMGetConnectionStatusResponse
 */
- (AWSTask<AWSSSMGetConnectionStatusResponse *> *)getConnectionStatus:(AWSSSMGetConnectionStatusRequest *)request;

/**
 <p>Retrieves the Session Manager connection status for an instance to determine whether it is running and ready to receive Session Manager connections.</p>
 
 @param request A container for the necessary parameters to execute the GetConnectionStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMGetConnectionStatusRequest
 @see AWSSSMGetConnectionStatusResponse
 */
- (void)getConnectionStatus:(AWSSSMGetConnectionStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMGetConnectionStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the default patch baseline. Note that Systems Manager supports creating multiple default patch baselines. For example, you can create a default patch baseline for each operating system.</p><p>If you do not specify an operating system value, the default patch baseline for Windows is returned.</p>
 
 @param request A container for the necessary parameters to execute the GetDefaultPatchBaseline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMGetDefaultPatchBaselineResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMGetDefaultPatchBaselineRequest
 @see AWSSSMGetDefaultPatchBaselineResult
 */
- (AWSTask<AWSSSMGetDefaultPatchBaselineResult *> *)getDefaultPatchBaseline:(AWSSSMGetDefaultPatchBaselineRequest *)request;

/**
 <p>Retrieves the default patch baseline. Note that Systems Manager supports creating multiple default patch baselines. For example, you can create a default patch baseline for each operating system.</p><p>If you do not specify an operating system value, the default patch baseline for Windows is returned.</p>
 
 @param request A container for the necessary parameters to execute the GetDefaultPatchBaseline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMGetDefaultPatchBaselineRequest
 @see AWSSSMGetDefaultPatchBaselineResult
 */
- (void)getDefaultPatchBaseline:(AWSSSMGetDefaultPatchBaselineRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMGetDefaultPatchBaselineResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the current snapshot for the patch baseline the instance uses. This API is primarily used by the AWS-RunPatchBaseline Systems Manager document. </p>
 
 @param request A container for the necessary parameters to execute the GetDeployablePatchSnapshotForInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMGetDeployablePatchSnapshotForInstanceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorUnsupportedOperatingSystem`, `AWSSSMErrorUnsupportedFeatureRequired`.
 
 @see AWSSSMGetDeployablePatchSnapshotForInstanceRequest
 @see AWSSSMGetDeployablePatchSnapshotForInstanceResult
 */
- (AWSTask<AWSSSMGetDeployablePatchSnapshotForInstanceResult *> *)getDeployablePatchSnapshotForInstance:(AWSSSMGetDeployablePatchSnapshotForInstanceRequest *)request;

/**
 <p>Retrieves the current snapshot for the patch baseline the instance uses. This API is primarily used by the AWS-RunPatchBaseline Systems Manager document. </p>
 
 @param request A container for the necessary parameters to execute the GetDeployablePatchSnapshotForInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorUnsupportedOperatingSystem`, `AWSSSMErrorUnsupportedFeatureRequired`.
 
 @see AWSSSMGetDeployablePatchSnapshotForInstanceRequest
 @see AWSSSMGetDeployablePatchSnapshotForInstanceResult
 */
- (void)getDeployablePatchSnapshotForInstance:(AWSSSMGetDeployablePatchSnapshotForInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMGetDeployablePatchSnapshotForInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the contents of the specified Systems Manager document.</p>
 
 @param request A container for the necessary parameters to execute the GetDocument service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMGetDocumentResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidDocumentVersion`.
 
 @see AWSSSMGetDocumentRequest
 @see AWSSSMGetDocumentResult
 */
- (AWSTask<AWSSSMGetDocumentResult *> *)getDocument:(AWSSSMGetDocumentRequest *)request;

/**
 <p>Gets the contents of the specified Systems Manager document.</p>
 
 @param request A container for the necessary parameters to execute the GetDocument service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidDocumentVersion`.
 
 @see AWSSSMGetDocumentRequest
 @see AWSSSMGetDocumentResult
 */
- (void)getDocument:(AWSSSMGetDocumentRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMGetDocumentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Query inventory information.</p>
 
 @param request A container for the necessary parameters to execute the GetInventory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMGetInventoryResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidFilter`, `AWSSSMErrorInvalidInventoryGroup`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorInvalidTypeName`, `AWSSSMErrorInvalidAggregator`, `AWSSSMErrorInvalidResultAttribute`.
 
 @see AWSSSMGetInventoryRequest
 @see AWSSSMGetInventoryResult
 */
- (AWSTask<AWSSSMGetInventoryResult *> *)getInventory:(AWSSSMGetInventoryRequest *)request;

/**
 <p>Query inventory information.</p>
 
 @param request A container for the necessary parameters to execute the GetInventory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidFilter`, `AWSSSMErrorInvalidInventoryGroup`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorInvalidTypeName`, `AWSSSMErrorInvalidAggregator`, `AWSSSMErrorInvalidResultAttribute`.
 
 @see AWSSSMGetInventoryRequest
 @see AWSSSMGetInventoryResult
 */
- (void)getInventory:(AWSSSMGetInventoryRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMGetInventoryResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Return a list of inventory type names for the account, or return a list of attribute names for a specific Inventory item type.</p>
 
 @param request A container for the necessary parameters to execute the GetInventorySchema service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMGetInventorySchemaResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidTypeName`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMGetInventorySchemaRequest
 @see AWSSSMGetInventorySchemaResult
 */
- (AWSTask<AWSSSMGetInventorySchemaResult *> *)getInventorySchema:(AWSSSMGetInventorySchemaRequest *)request;

/**
 <p>Return a list of inventory type names for the account, or return a list of attribute names for a specific Inventory item type.</p>
 
 @param request A container for the necessary parameters to execute the GetInventorySchema service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidTypeName`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMGetInventorySchemaRequest
 @see AWSSSMGetInventorySchemaResult
 */
- (void)getInventorySchema:(AWSSSMGetInventorySchemaRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMGetInventorySchemaResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMGetMaintenanceWindowResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMGetMaintenanceWindowRequest
 @see AWSSSMGetMaintenanceWindowResult
 */
- (AWSTask<AWSSSMGetMaintenanceWindowResult *> *)getMaintenanceWindow:(AWSSSMGetMaintenanceWindowRequest *)request;

/**
 <p>Retrieves a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMGetMaintenanceWindowRequest
 @see AWSSSMGetMaintenanceWindowResult
 */
- (void)getMaintenanceWindow:(AWSSSMGetMaintenanceWindowRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMGetMaintenanceWindowResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves details about a specific a maintenance window execution.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindowExecution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMGetMaintenanceWindowExecutionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMGetMaintenanceWindowExecutionRequest
 @see AWSSSMGetMaintenanceWindowExecutionResult
 */
- (AWSTask<AWSSSMGetMaintenanceWindowExecutionResult *> *)getMaintenanceWindowExecution:(AWSSSMGetMaintenanceWindowExecutionRequest *)request;

/**
 <p>Retrieves details about a specific a maintenance window execution.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindowExecution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMGetMaintenanceWindowExecutionRequest
 @see AWSSSMGetMaintenanceWindowExecutionResult
 */
- (void)getMaintenanceWindowExecution:(AWSSSMGetMaintenanceWindowExecutionRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMGetMaintenanceWindowExecutionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the details about a specific task run as part of a maintenance window execution.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindowExecutionTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMGetMaintenanceWindowExecutionTaskResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMGetMaintenanceWindowExecutionTaskRequest
 @see AWSSSMGetMaintenanceWindowExecutionTaskResult
 */
- (AWSTask<AWSSSMGetMaintenanceWindowExecutionTaskResult *> *)getMaintenanceWindowExecutionTask:(AWSSSMGetMaintenanceWindowExecutionTaskRequest *)request;

/**
 <p>Retrieves the details about a specific task run as part of a maintenance window execution.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindowExecutionTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMGetMaintenanceWindowExecutionTaskRequest
 @see AWSSSMGetMaintenanceWindowExecutionTaskResult
 */
- (void)getMaintenanceWindowExecutionTask:(AWSSSMGetMaintenanceWindowExecutionTaskRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMGetMaintenanceWindowExecutionTaskResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a specific task running on a specific target.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindowExecutionTaskInvocation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMGetMaintenanceWindowExecutionTaskInvocationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMGetMaintenanceWindowExecutionTaskInvocationRequest
 @see AWSSSMGetMaintenanceWindowExecutionTaskInvocationResult
 */
- (AWSTask<AWSSSMGetMaintenanceWindowExecutionTaskInvocationResult *> *)getMaintenanceWindowExecutionTaskInvocation:(AWSSSMGetMaintenanceWindowExecutionTaskInvocationRequest *)request;

/**
 <p>Retrieves information about a specific task running on a specific target.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindowExecutionTaskInvocation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMGetMaintenanceWindowExecutionTaskInvocationRequest
 @see AWSSSMGetMaintenanceWindowExecutionTaskInvocationResult
 */
- (void)getMaintenanceWindowExecutionTaskInvocation:(AWSSSMGetMaintenanceWindowExecutionTaskInvocationRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMGetMaintenanceWindowExecutionTaskInvocationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tasks in a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindowTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMGetMaintenanceWindowTaskResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMGetMaintenanceWindowTaskRequest
 @see AWSSSMGetMaintenanceWindowTaskResult
 */
- (AWSTask<AWSSSMGetMaintenanceWindowTaskResult *> *)getMaintenanceWindowTask:(AWSSSMGetMaintenanceWindowTaskRequest *)request;

/**
 <p>Lists the tasks in a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the GetMaintenanceWindowTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMGetMaintenanceWindowTaskRequest
 @see AWSSSMGetMaintenanceWindowTaskResult
 */
- (void)getMaintenanceWindowTask:(AWSSSMGetMaintenanceWindowTaskRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMGetMaintenanceWindowTaskResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get information about an OpsItem by using the ID. You must have permission in AWS Identity and Access Management (IAM) to view information about an OpsItem. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the GetOpsItem service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMGetOpsItemResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorOpsItemNotFound`.
 
 @see AWSSSMGetOpsItemRequest
 @see AWSSSMGetOpsItemResponse
 */
- (AWSTask<AWSSSMGetOpsItemResponse *> *)getOpsItem:(AWSSSMGetOpsItemRequest *)request;

/**
 <p>Get information about an OpsItem by using the ID. You must have permission in AWS Identity and Access Management (IAM) to view information about an OpsItem. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the GetOpsItem service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorOpsItemNotFound`.
 
 @see AWSSSMGetOpsItemRequest
 @see AWSSSMGetOpsItemResponse
 */
- (void)getOpsItem:(AWSSSMGetOpsItemRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMGetOpsItemResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>View a summary of OpsItems based on specified filters and aggregators.</p>
 
 @param request A container for the necessary parameters to execute the GetOpsSummary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMGetOpsSummaryResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorResourceDataSyncNotFound`, `AWSSSMErrorInvalidFilter`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorInvalidTypeName`, `AWSSSMErrorInvalidAggregator`.
 
 @see AWSSSMGetOpsSummaryRequest
 @see AWSSSMGetOpsSummaryResult
 */
- (AWSTask<AWSSSMGetOpsSummaryResult *> *)getOpsSummary:(AWSSSMGetOpsSummaryRequest *)request;

/**
 <p>View a summary of OpsItems based on specified filters and aggregators.</p>
 
 @param request A container for the necessary parameters to execute the GetOpsSummary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorResourceDataSyncNotFound`, `AWSSSMErrorInvalidFilter`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorInvalidTypeName`, `AWSSSMErrorInvalidAggregator`.
 
 @see AWSSSMGetOpsSummaryRequest
 @see AWSSSMGetOpsSummaryResult
 */
- (void)getOpsSummary:(AWSSSMGetOpsSummaryRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMGetOpsSummaryResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get information about a parameter by using the parameter name. Don't confuse this API action with the <a>GetParameters</a> API action.</p>
 
 @param request A container for the necessary parameters to execute the GetParameter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMGetParameterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidKeyId`, `AWSSSMErrorParameterNotFound`, `AWSSSMErrorParameterVersionNotFound`.
 
 @see AWSSSMGetParameterRequest
 @see AWSSSMGetParameterResult
 */
- (AWSTask<AWSSSMGetParameterResult *> *)getParameter:(AWSSSMGetParameterRequest *)request;

/**
 <p>Get information about a parameter by using the parameter name. Don't confuse this API action with the <a>GetParameters</a> API action.</p>
 
 @param request A container for the necessary parameters to execute the GetParameter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidKeyId`, `AWSSSMErrorParameterNotFound`, `AWSSSMErrorParameterVersionNotFound`.
 
 @see AWSSSMGetParameterRequest
 @see AWSSSMGetParameterResult
 */
- (void)getParameter:(AWSSSMGetParameterRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMGetParameterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Query a list of all parameters used by the AWS account.</p>
 
 @param request A container for the necessary parameters to execute the GetParameterHistory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMGetParameterHistoryResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorParameterNotFound`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorInvalidKeyId`.
 
 @see AWSSSMGetParameterHistoryRequest
 @see AWSSSMGetParameterHistoryResult
 */
- (AWSTask<AWSSSMGetParameterHistoryResult *> *)getParameterHistory:(AWSSSMGetParameterHistoryRequest *)request;

/**
 <p>Query a list of all parameters used by the AWS account.</p>
 
 @param request A container for the necessary parameters to execute the GetParameterHistory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorParameterNotFound`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorInvalidKeyId`.
 
 @see AWSSSMGetParameterHistoryRequest
 @see AWSSSMGetParameterHistoryResult
 */
- (void)getParameterHistory:(AWSSSMGetParameterHistoryRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMGetParameterHistoryResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get details of a parameter. Don't confuse this API action with the <a>GetParameter</a> API action.</p>
 
 @param request A container for the necessary parameters to execute the GetParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMGetParametersResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidKeyId`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMGetParametersRequest
 @see AWSSSMGetParametersResult
 */
- (AWSTask<AWSSSMGetParametersResult *> *)getParameters:(AWSSSMGetParametersRequest *)request;

/**
 <p>Get details of a parameter. Don't confuse this API action with the <a>GetParameter</a> API action.</p>
 
 @param request A container for the necessary parameters to execute the GetParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidKeyId`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMGetParametersRequest
 @see AWSSSMGetParametersResult
 */
- (void)getParameters:(AWSSSMGetParametersRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMGetParametersResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve information about one or more parameters in a specific hierarchy. </p><note><p>Request results are returned on a best-effort basis. If you specify <code>MaxResults</code> in the request, the response includes information up to the limit specified. The number of items returned, however, can be between zero and the value of <code>MaxResults</code>. If the service reaches an internal limit while processing the results, it stops the operation and returns the matching values up to that point and a <code>NextToken</code>. You can specify the <code>NextToken</code> in a subsequent call to get the next set of results.</p></note>
 
 @param request A container for the necessary parameters to execute the GetParametersByPath service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMGetParametersByPathResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidFilterKey`, `AWSSSMErrorInvalidFilterOption`, `AWSSSMErrorInvalidFilterValue`, `AWSSSMErrorInvalidKeyId`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMGetParametersByPathRequest
 @see AWSSSMGetParametersByPathResult
 */
- (AWSTask<AWSSSMGetParametersByPathResult *> *)getParametersByPath:(AWSSSMGetParametersByPathRequest *)request;

/**
 <p>Retrieve information about one or more parameters in a specific hierarchy. </p><note><p>Request results are returned on a best-effort basis. If you specify <code>MaxResults</code> in the request, the response includes information up to the limit specified. The number of items returned, however, can be between zero and the value of <code>MaxResults</code>. If the service reaches an internal limit while processing the results, it stops the operation and returns the matching values up to that point and a <code>NextToken</code>. You can specify the <code>NextToken</code> in a subsequent call to get the next set of results.</p></note>
 
 @param request A container for the necessary parameters to execute the GetParametersByPath service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidFilterKey`, `AWSSSMErrorInvalidFilterOption`, `AWSSSMErrorInvalidFilterValue`, `AWSSSMErrorInvalidKeyId`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMGetParametersByPathRequest
 @see AWSSSMGetParametersByPathResult
 */
- (void)getParametersByPath:(AWSSSMGetParametersByPathRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMGetParametersByPathResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a patch baseline.</p>
 
 @param request A container for the necessary parameters to execute the GetPatchBaseline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMGetPatchBaselineResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInvalidResourceId`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMGetPatchBaselineRequest
 @see AWSSSMGetPatchBaselineResult
 */
- (AWSTask<AWSSSMGetPatchBaselineResult *> *)getPatchBaseline:(AWSSSMGetPatchBaselineRequest *)request;

/**
 <p>Retrieves information about a patch baseline.</p>
 
 @param request A container for the necessary parameters to execute the GetPatchBaseline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInvalidResourceId`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMGetPatchBaselineRequest
 @see AWSSSMGetPatchBaselineResult
 */
- (void)getPatchBaseline:(AWSSSMGetPatchBaselineRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMGetPatchBaselineResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the patch baseline that should be used for the specified patch group.</p>
 
 @param request A container for the necessary parameters to execute the GetPatchBaselineForPatchGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMGetPatchBaselineForPatchGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMGetPatchBaselineForPatchGroupRequest
 @see AWSSSMGetPatchBaselineForPatchGroupResult
 */
- (AWSTask<AWSSSMGetPatchBaselineForPatchGroupResult *> *)getPatchBaselineForPatchGroup:(AWSSSMGetPatchBaselineForPatchGroupRequest *)request;

/**
 <p>Retrieves the patch baseline that should be used for the specified patch group.</p>
 
 @param request A container for the necessary parameters to execute the GetPatchBaselineForPatchGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`.
 
 @see AWSSSMGetPatchBaselineForPatchGroupRequest
 @see AWSSSMGetPatchBaselineForPatchGroupResult
 */
- (void)getPatchBaselineForPatchGroup:(AWSSSMGetPatchBaselineForPatchGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMGetPatchBaselineForPatchGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p><code>ServiceSetting</code> is an account-level setting for an AWS service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an AWS service charges money to the account based on feature or service usage, then the AWS service team might create a default setting of "false". This means the user can't use this feature unless they change the setting to "true" and intentionally opt in for a paid feature.</p><p>Services map a <code>SettingId</code> object to a setting value. AWS services teams define the default value for a <code>SettingId</code>. You can't create a new <code>SettingId</code>, but you can overwrite the default value if you have the <code>ssm:UpdateServiceSetting</code> permission for the setting. Use the <a>UpdateServiceSetting</a> API action to change the default setting. Or use the <a>ResetServiceSetting</a> to change the value back to the original value defined by the AWS service team.</p><p>Query the current service setting for the account. </p>
 
 @param request A container for the necessary parameters to execute the GetServiceSetting service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMGetServiceSettingResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorServiceSettingNotFound`.
 
 @see AWSSSMGetServiceSettingRequest
 @see AWSSSMGetServiceSettingResult
 */
- (AWSTask<AWSSSMGetServiceSettingResult *> *)getServiceSetting:(AWSSSMGetServiceSettingRequest *)request;

/**
 <p><code>ServiceSetting</code> is an account-level setting for an AWS service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an AWS service charges money to the account based on feature or service usage, then the AWS service team might create a default setting of "false". This means the user can't use this feature unless they change the setting to "true" and intentionally opt in for a paid feature.</p><p>Services map a <code>SettingId</code> object to a setting value. AWS services teams define the default value for a <code>SettingId</code>. You can't create a new <code>SettingId</code>, but you can overwrite the default value if you have the <code>ssm:UpdateServiceSetting</code> permission for the setting. Use the <a>UpdateServiceSetting</a> API action to change the default setting. Or use the <a>ResetServiceSetting</a> to change the value back to the original value defined by the AWS service team.</p><p>Query the current service setting for the account. </p>
 
 @param request A container for the necessary parameters to execute the GetServiceSetting service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorServiceSettingNotFound`.
 
 @see AWSSSMGetServiceSettingRequest
 @see AWSSSMGetServiceSettingResult
 */
- (void)getServiceSetting:(AWSSSMGetServiceSettingRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMGetServiceSettingResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>A parameter label is a user-defined alias to help you manage different versions of a parameter. When you modify a parameter, Systems Manager automatically saves a new version and increments the version number by one. A label can help you remember the purpose of a parameter when there are multiple versions. </p><p>Parameter labels have the following requirements and restrictions.</p><ul><li><p>A version of a parameter can have a maximum of 10 labels.</p></li><li><p>You can't attach the same label to different versions of the same parameter. For example, if version 1 has the label Production, then you can't attach Production to version 2.</p></li><li><p>You can move a label from one version of a parameter to another.</p></li><li><p>You can't create a label when you create a new parameter. You must attach a label to a specific version of a parameter.</p></li><li><p>You can't delete a parameter label. If you no longer want to use a parameter label, then you must move it to a different version of a parameter.</p></li><li><p>A label can have a maximum of 100 characters.</p></li><li><p>Labels can contain letters (case sensitive), numbers, periods (.), hyphens (-), or underscores (_).</p></li><li><p>Labels can't begin with a number, "aws," or "ssm" (not case sensitive). If a label fails to meet these requirements, then the label is not associated with a parameter and the system displays it in the list of InvalidLabels.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the LabelParameterVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMLabelParameterVersionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorTooManyUpdates`, `AWSSSMErrorParameterNotFound`, `AWSSSMErrorParameterVersionNotFound`, `AWSSSMErrorParameterVersionLabelLimitExceeded`.
 
 @see AWSSSMLabelParameterVersionRequest
 @see AWSSSMLabelParameterVersionResult
 */
- (AWSTask<AWSSSMLabelParameterVersionResult *> *)labelParameterVersion:(AWSSSMLabelParameterVersionRequest *)request;

/**
 <p>A parameter label is a user-defined alias to help you manage different versions of a parameter. When you modify a parameter, Systems Manager automatically saves a new version and increments the version number by one. A label can help you remember the purpose of a parameter when there are multiple versions. </p><p>Parameter labels have the following requirements and restrictions.</p><ul><li><p>A version of a parameter can have a maximum of 10 labels.</p></li><li><p>You can't attach the same label to different versions of the same parameter. For example, if version 1 has the label Production, then you can't attach Production to version 2.</p></li><li><p>You can move a label from one version of a parameter to another.</p></li><li><p>You can't create a label when you create a new parameter. You must attach a label to a specific version of a parameter.</p></li><li><p>You can't delete a parameter label. If you no longer want to use a parameter label, then you must move it to a different version of a parameter.</p></li><li><p>A label can have a maximum of 100 characters.</p></li><li><p>Labels can contain letters (case sensitive), numbers, periods (.), hyphens (-), or underscores (_).</p></li><li><p>Labels can't begin with a number, "aws," or "ssm" (not case sensitive). If a label fails to meet these requirements, then the label is not associated with a parameter and the system displays it in the list of InvalidLabels.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the LabelParameterVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorTooManyUpdates`, `AWSSSMErrorParameterNotFound`, `AWSSSMErrorParameterVersionNotFound`, `AWSSSMErrorParameterVersionLabelLimitExceeded`.
 
 @see AWSSSMLabelParameterVersionRequest
 @see AWSSSMLabelParameterVersionResult
 */
- (void)labelParameterVersion:(AWSSSMLabelParameterVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMLabelParameterVersionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves all versions of an association for a specific association ID.</p>
 
 @param request A container for the necessary parameters to execute the ListAssociationVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMListAssociationVersionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorAssociationDoesNotExist`.
 
 @see AWSSSMListAssociationVersionsRequest
 @see AWSSSMListAssociationVersionsResult
 */
- (AWSTask<AWSSSMListAssociationVersionsResult *> *)listAssociationVersions:(AWSSSMListAssociationVersionsRequest *)request;

/**
 <p>Retrieves all versions of an association for a specific association ID.</p>
 
 @param request A container for the necessary parameters to execute the ListAssociationVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorAssociationDoesNotExist`.
 
 @see AWSSSMListAssociationVersionsRequest
 @see AWSSSMListAssociationVersionsResult
 */
- (void)listAssociationVersions:(AWSSSMListAssociationVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMListAssociationVersionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns all State Manager associations in the current AWS account and Region. You can limit the results to a specific State Manager association document or instance by specifying a filter.</p>
 
 @param request A container for the necessary parameters to execute the ListAssociations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMListAssociationsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMListAssociationsRequest
 @see AWSSSMListAssociationsResult
 */
- (AWSTask<AWSSSMListAssociationsResult *> *)listAssociations:(AWSSSMListAssociationsRequest *)request;

/**
 <p>Returns all State Manager associations in the current AWS account and Region. You can limit the results to a specific State Manager association document or instance by specifying a filter.</p>
 
 @param request A container for the necessary parameters to execute the ListAssociations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMListAssociationsRequest
 @see AWSSSMListAssociationsResult
 */
- (void)listAssociations:(AWSSSMListAssociationsRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMListAssociationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>An invocation is copy of a command sent to a specific instance. A command can apply to one or more instances. A command invocation applies to one instance. For example, if a user runs SendCommand against three instances, then a command invocation is created for each requested instance ID. ListCommandInvocations provide status about command execution.</p>
 
 @param request A container for the necessary parameters to execute the ListCommandInvocations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMListCommandInvocationsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidCommandId`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInvalidFilterKey`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMListCommandInvocationsRequest
 @see AWSSSMListCommandInvocationsResult
 */
- (AWSTask<AWSSSMListCommandInvocationsResult *> *)listCommandInvocations:(AWSSSMListCommandInvocationsRequest *)request;

/**
 <p>An invocation is copy of a command sent to a specific instance. A command can apply to one or more instances. A command invocation applies to one instance. For example, if a user runs SendCommand against three instances, then a command invocation is created for each requested instance ID. ListCommandInvocations provide status about command execution.</p>
 
 @param request A container for the necessary parameters to execute the ListCommandInvocations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidCommandId`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInvalidFilterKey`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMListCommandInvocationsRequest
 @see AWSSSMListCommandInvocationsResult
 */
- (void)listCommandInvocations:(AWSSSMListCommandInvocationsRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMListCommandInvocationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the commands requested by users of the AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListCommands service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMListCommandsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidCommandId`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInvalidFilterKey`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMListCommandsRequest
 @see AWSSSMListCommandsResult
 */
- (AWSTask<AWSSSMListCommandsResult *> *)listCommands:(AWSSSMListCommandsRequest *)request;

/**
 <p>Lists the commands requested by users of the AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListCommands service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidCommandId`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInvalidFilterKey`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMListCommandsRequest
 @see AWSSSMListCommandsResult
 */
- (void)listCommands:(AWSSSMListCommandsRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMListCommandsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>For a specified resource ID, this API action returns a list of compliance statuses for different resource types. Currently, you can only specify one resource ID per call. List results depend on the criteria specified in the filter.</p>
 
 @param request A container for the necessary parameters to execute the ListComplianceItems service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMListComplianceItemsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidResourceType`, `AWSSSMErrorInvalidResourceId`, `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidFilter`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMListComplianceItemsRequest
 @see AWSSSMListComplianceItemsResult
 */
- (AWSTask<AWSSSMListComplianceItemsResult *> *)listComplianceItems:(AWSSSMListComplianceItemsRequest *)request;

/**
 <p>For a specified resource ID, this API action returns a list of compliance statuses for different resource types. Currently, you can only specify one resource ID per call. List results depend on the criteria specified in the filter.</p>
 
 @param request A container for the necessary parameters to execute the ListComplianceItems service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidResourceType`, `AWSSSMErrorInvalidResourceId`, `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidFilter`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMListComplianceItemsRequest
 @see AWSSSMListComplianceItemsResult
 */
- (void)listComplianceItems:(AWSSSMListComplianceItemsRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMListComplianceItemsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a summary count of compliant and non-compliant resources for a compliance type. For example, this call can return State Manager associations, patches, or custom compliance types according to the filter criteria that you specify.</p>
 
 @param request A container for the necessary parameters to execute the ListComplianceSummaries service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMListComplianceSummariesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidFilter`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMListComplianceSummariesRequest
 @see AWSSSMListComplianceSummariesResult
 */
- (AWSTask<AWSSSMListComplianceSummariesResult *> *)listComplianceSummaries:(AWSSSMListComplianceSummariesRequest *)request;

/**
 <p>Returns a summary count of compliant and non-compliant resources for a compliance type. For example, this call can return State Manager associations, patches, or custom compliance types according to the filter criteria that you specify.</p>
 
 @param request A container for the necessary parameters to execute the ListComplianceSummaries service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidFilter`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMListComplianceSummariesRequest
 @see AWSSSMListComplianceSummariesResult
 */
- (void)listComplianceSummaries:(AWSSSMListComplianceSummariesRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMListComplianceSummariesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List all versions for a document.</p>
 
 @param request A container for the necessary parameters to execute the ListDocumentVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMListDocumentVersionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorInvalidDocument`.
 
 @see AWSSSMListDocumentVersionsRequest
 @see AWSSSMListDocumentVersionsResult
 */
- (AWSTask<AWSSSMListDocumentVersionsResult *> *)listDocumentVersions:(AWSSSMListDocumentVersionsRequest *)request;

/**
 <p>List all versions for a document.</p>
 
 @param request A container for the necessary parameters to execute the ListDocumentVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorInvalidDocument`.
 
 @see AWSSSMListDocumentVersionsRequest
 @see AWSSSMListDocumentVersionsResult
 */
- (void)listDocumentVersions:(AWSSSMListDocumentVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMListDocumentVersionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns all Systems Manager (SSM) documents in the current AWS account and Region. You can limit the results of this request by using a filter.</p>
 
 @param request A container for the necessary parameters to execute the ListDocuments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMListDocumentsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorInvalidFilterKey`.
 
 @see AWSSSMListDocumentsRequest
 @see AWSSSMListDocumentsResult
 */
- (AWSTask<AWSSSMListDocumentsResult *> *)listDocuments:(AWSSSMListDocumentsRequest *)request;

/**
 <p>Returns all Systems Manager (SSM) documents in the current AWS account and Region. You can limit the results of this request by using a filter.</p>
 
 @param request A container for the necessary parameters to execute the ListDocuments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorInvalidFilterKey`.
 
 @see AWSSSMListDocumentsRequest
 @see AWSSSMListDocumentsResult
 */
- (void)listDocuments:(AWSSSMListDocumentsRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMListDocumentsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>A list of inventory items returned by the request.</p>
 
 @param request A container for the necessary parameters to execute the ListInventoryEntries service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMListInventoryEntriesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInvalidTypeName`, `AWSSSMErrorInvalidFilter`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMListInventoryEntriesRequest
 @see AWSSSMListInventoryEntriesResult
 */
- (AWSTask<AWSSSMListInventoryEntriesResult *> *)listInventoryEntries:(AWSSSMListInventoryEntriesRequest *)request;

/**
 <p>A list of inventory items returned by the request.</p>
 
 @param request A container for the necessary parameters to execute the ListInventoryEntries service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInvalidTypeName`, `AWSSSMErrorInvalidFilter`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMListInventoryEntriesRequest
 @see AWSSSMListInventoryEntriesResult
 */
- (void)listInventoryEntries:(AWSSSMListInventoryEntriesRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMListInventoryEntriesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a resource-level summary count. The summary includes information about compliant and non-compliant statuses and detailed compliance-item severity counts, according to the filter criteria you specify.</p>
 
 @param request A container for the necessary parameters to execute the ListResourceComplianceSummaries service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMListResourceComplianceSummariesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidFilter`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMListResourceComplianceSummariesRequest
 @see AWSSSMListResourceComplianceSummariesResult
 */
- (AWSTask<AWSSSMListResourceComplianceSummariesResult *> *)listResourceComplianceSummaries:(AWSSSMListResourceComplianceSummariesRequest *)request;

/**
 <p>Returns a resource-level summary count. The summary includes information about compliant and non-compliant statuses and detailed compliance-item severity counts, according to the filter criteria you specify.</p>
 
 @param request A container for the necessary parameters to execute the ListResourceComplianceSummaries service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidFilter`, `AWSSSMErrorInvalidNextToken`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMListResourceComplianceSummariesRequest
 @see AWSSSMListResourceComplianceSummariesResult
 */
- (void)listResourceComplianceSummaries:(AWSSSMListResourceComplianceSummariesRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMListResourceComplianceSummariesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists your resource data sync configurations. Includes information about the last time a sync attempted to start, the last sync status, and the last time a sync successfully completed.</p><p>The number of sync configurations might be too large to return using a single call to <code>ListResourceDataSync</code>. You can limit the number of sync configurations returned by using the <code>MaxResults</code> parameter. To determine whether there are more sync configurations to list, check the value of <code>NextToken</code> in the output. If there are more sync configurations to list, you can request them by specifying the <code>NextToken</code> returned in the call to the parameter of a subsequent call. </p>
 
 @param request A container for the necessary parameters to execute the ListResourceDataSync service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMListResourceDataSyncResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorResourceDataSyncInvalidConfiguration`, `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMListResourceDataSyncRequest
 @see AWSSSMListResourceDataSyncResult
 */
- (AWSTask<AWSSSMListResourceDataSyncResult *> *)listResourceDataSync:(AWSSSMListResourceDataSyncRequest *)request;

/**
 <p>Lists your resource data sync configurations. Includes information about the last time a sync attempted to start, the last sync status, and the last time a sync successfully completed.</p><p>The number of sync configurations might be too large to return using a single call to <code>ListResourceDataSync</code>. You can limit the number of sync configurations returned by using the <code>MaxResults</code> parameter. To determine whether there are more sync configurations to list, check the value of <code>NextToken</code> in the output. If there are more sync configurations to list, you can request them by specifying the <code>NextToken</code> returned in the call to the parameter of a subsequent call. </p>
 
 @param request A container for the necessary parameters to execute the ListResourceDataSync service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorResourceDataSyncInvalidConfiguration`, `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidNextToken`.
 
 @see AWSSSMListResourceDataSyncRequest
 @see AWSSSMListResourceDataSyncResult
 */
- (void)listResourceDataSync:(AWSSSMListResourceDataSyncRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMListResourceDataSyncResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the tags assigned to the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMListTagsForResourceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidResourceType`, `AWSSSMErrorInvalidResourceId`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMListTagsForResourceRequest
 @see AWSSSMListTagsForResourceResult
 */
- (AWSTask<AWSSSMListTagsForResourceResult *> *)listTagsForResource:(AWSSSMListTagsForResourceRequest *)request;

/**
 <p>Returns a list of the tags assigned to the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidResourceType`, `AWSSSMErrorInvalidResourceId`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMListTagsForResourceRequest
 @see AWSSSMListTagsForResourceResult
 */
- (void)listTagsForResource:(AWSSSMListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMListTagsForResourceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Shares a Systems Manager document publicly or privately. If you share a document privately, you must specify the AWS user account IDs for those people who can use the document. If you share a document publicly, you must specify <i>All</i> as the account ID.</p>
 
 @param request A container for the necessary parameters to execute the ModifyDocumentPermission service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMModifyDocumentPermissionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidPermissionType`, `AWSSSMErrorDocumentPermissionLimit`, `AWSSSMErrorDocumentLimitExceeded`.
 
 @see AWSSSMModifyDocumentPermissionRequest
 @see AWSSSMModifyDocumentPermissionResponse
 */
- (AWSTask<AWSSSMModifyDocumentPermissionResponse *> *)modifyDocumentPermission:(AWSSSMModifyDocumentPermissionRequest *)request;

/**
 <p>Shares a Systems Manager document publicly or privately. If you share a document privately, you must specify the AWS user account IDs for those people who can use the document. If you share a document publicly, you must specify <i>All</i> as the account ID.</p>
 
 @param request A container for the necessary parameters to execute the ModifyDocumentPermission service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidPermissionType`, `AWSSSMErrorDocumentPermissionLimit`, `AWSSSMErrorDocumentLimitExceeded`.
 
 @see AWSSSMModifyDocumentPermissionRequest
 @see AWSSSMModifyDocumentPermissionResponse
 */
- (void)modifyDocumentPermission:(AWSSSMModifyDocumentPermissionRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMModifyDocumentPermissionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers a compliance type and other compliance details on a designated resource. This action lets you register custom compliance details with a resource. This call overwrites existing compliance information on the resource, so you must provide a full list of compliance items each time that you send the request.</p><p>ComplianceType can be one of the following:</p><ul><li><p>ExecutionId: The execution ID when the patch, association, or custom compliance item was applied.</p></li><li><p>ExecutionType: Specify patch, association, or Custom:<code>string</code>.</p></li><li><p>ExecutionTime. The time the patch, association, or custom compliance item was applied to the instance.</p></li><li><p>Id: The patch, association, or custom compliance ID.</p></li><li><p>Title: A title.</p></li><li><p>Status: The status of the compliance item. For example, <code>approved</code> for patches, or <code>Failed</code> for associations.</p></li><li><p>Severity: A patch severity. For example, <code>critical</code>.</p></li><li><p>DocumentName: A SSM document name. For example, AWS-RunPatchBaseline.</p></li><li><p>DocumentVersion: An SSM document version number. For example, 4.</p></li><li><p>Classification: A patch classification. For example, <code>security updates</code>.</p></li><li><p>PatchBaselineId: A patch baseline ID.</p></li><li><p>PatchSeverity: A patch severity. For example, <code>Critical</code>.</p></li><li><p>PatchState: A patch state. For example, <code>InstancesWithFailedPatches</code>.</p></li><li><p>PatchGroup: The name of a patch group.</p></li><li><p>InstalledTime: The time the association, patch, or custom compliance item was applied to the resource. Specify the time by using the following format: yyyy-MM-dd'T'HH:mm:ss'Z'</p></li></ul>
 
 @param request A container for the necessary parameters to execute the PutComplianceItems service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMPutComplianceItemsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidItemContent`, `AWSSSMErrorTotalSizeLimitExceeded`, `AWSSSMErrorItemSizeLimitExceeded`, `AWSSSMErrorComplianceTypeCountLimitExceeded`, `AWSSSMErrorInvalidResourceType`, `AWSSSMErrorInvalidResourceId`.
 
 @see AWSSSMPutComplianceItemsRequest
 @see AWSSSMPutComplianceItemsResult
 */
- (AWSTask<AWSSSMPutComplianceItemsResult *> *)putComplianceItems:(AWSSSMPutComplianceItemsRequest *)request;

/**
 <p>Registers a compliance type and other compliance details on a designated resource. This action lets you register custom compliance details with a resource. This call overwrites existing compliance information on the resource, so you must provide a full list of compliance items each time that you send the request.</p><p>ComplianceType can be one of the following:</p><ul><li><p>ExecutionId: The execution ID when the patch, association, or custom compliance item was applied.</p></li><li><p>ExecutionType: Specify patch, association, or Custom:<code>string</code>.</p></li><li><p>ExecutionTime. The time the patch, association, or custom compliance item was applied to the instance.</p></li><li><p>Id: The patch, association, or custom compliance ID.</p></li><li><p>Title: A title.</p></li><li><p>Status: The status of the compliance item. For example, <code>approved</code> for patches, or <code>Failed</code> for associations.</p></li><li><p>Severity: A patch severity. For example, <code>critical</code>.</p></li><li><p>DocumentName: A SSM document name. For example, AWS-RunPatchBaseline.</p></li><li><p>DocumentVersion: An SSM document version number. For example, 4.</p></li><li><p>Classification: A patch classification. For example, <code>security updates</code>.</p></li><li><p>PatchBaselineId: A patch baseline ID.</p></li><li><p>PatchSeverity: A patch severity. For example, <code>Critical</code>.</p></li><li><p>PatchState: A patch state. For example, <code>InstancesWithFailedPatches</code>.</p></li><li><p>PatchGroup: The name of a patch group.</p></li><li><p>InstalledTime: The time the association, patch, or custom compliance item was applied to the resource. Specify the time by using the following format: yyyy-MM-dd'T'HH:mm:ss'Z'</p></li></ul>
 
 @param request A container for the necessary parameters to execute the PutComplianceItems service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidItemContent`, `AWSSSMErrorTotalSizeLimitExceeded`, `AWSSSMErrorItemSizeLimitExceeded`, `AWSSSMErrorComplianceTypeCountLimitExceeded`, `AWSSSMErrorInvalidResourceType`, `AWSSSMErrorInvalidResourceId`.
 
 @see AWSSSMPutComplianceItemsRequest
 @see AWSSSMPutComplianceItemsResult
 */
- (void)putComplianceItems:(AWSSSMPutComplianceItemsRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMPutComplianceItemsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Bulk update custom inventory items on one more instance. The request adds an inventory item, if it doesn't already exist, or updates an inventory item, if it does exist.</p>
 
 @param request A container for the necessary parameters to execute the PutInventory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMPutInventoryResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInvalidTypeName`, `AWSSSMErrorInvalidItemContent`, `AWSSSMErrorTotalSizeLimitExceeded`, `AWSSSMErrorItemSizeLimitExceeded`, `AWSSSMErrorItemContentMismatch`, `AWSSSMErrorCustomSchemaCountLimitExceeded`, `AWSSSMErrorUnsupportedInventorySchemaVersion`, `AWSSSMErrorUnsupportedInventoryItemContext`, `AWSSSMErrorInvalidInventoryItemContext`, `AWSSSMErrorSubTypeCountLimitExceeded`.
 
 @see AWSSSMPutInventoryRequest
 @see AWSSSMPutInventoryResult
 */
- (AWSTask<AWSSSMPutInventoryResult *> *)putInventory:(AWSSSMPutInventoryRequest *)request;

/**
 <p>Bulk update custom inventory items on one more instance. The request adds an inventory item, if it doesn't already exist, or updates an inventory item, if it does exist.</p>
 
 @param request A container for the necessary parameters to execute the PutInventory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInvalidTypeName`, `AWSSSMErrorInvalidItemContent`, `AWSSSMErrorTotalSizeLimitExceeded`, `AWSSSMErrorItemSizeLimitExceeded`, `AWSSSMErrorItemContentMismatch`, `AWSSSMErrorCustomSchemaCountLimitExceeded`, `AWSSSMErrorUnsupportedInventorySchemaVersion`, `AWSSSMErrorUnsupportedInventoryItemContext`, `AWSSSMErrorInvalidInventoryItemContext`, `AWSSSMErrorSubTypeCountLimitExceeded`.
 
 @see AWSSSMPutInventoryRequest
 @see AWSSSMPutInventoryResult
 */
- (void)putInventory:(AWSSSMPutInventoryRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMPutInventoryResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Add a parameter to the system.</p>
 
 @param request A container for the necessary parameters to execute the PutParameter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMPutParameterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidKeyId`, `AWSSSMErrorParameterLimitExceeded`, `AWSSSMErrorTooManyUpdates`, `AWSSSMErrorParameterAlreadyExists`, `AWSSSMErrorHierarchyLevelLimitExceeded`, `AWSSSMErrorHierarchyTypeMismatch`, `AWSSSMErrorInvalidAllowedPattern`, `AWSSSMErrorParameterMaxVersionLimitExceeded`, `AWSSSMErrorParameterPatternMismatch`, `AWSSSMErrorUnsupportedParameterType`, `AWSSSMErrorPoliciesLimitExceeded`, `AWSSSMErrorInvalidPolicyType`, `AWSSSMErrorInvalidPolicyAttribute`, `AWSSSMErrorIncompatiblePolicy`.
 
 @see AWSSSMPutParameterRequest
 @see AWSSSMPutParameterResult
 */
- (AWSTask<AWSSSMPutParameterResult *> *)putParameter:(AWSSSMPutParameterRequest *)request;

/**
 <p>Add a parameter to the system.</p>
 
 @param request A container for the necessary parameters to execute the PutParameter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidKeyId`, `AWSSSMErrorParameterLimitExceeded`, `AWSSSMErrorTooManyUpdates`, `AWSSSMErrorParameterAlreadyExists`, `AWSSSMErrorHierarchyLevelLimitExceeded`, `AWSSSMErrorHierarchyTypeMismatch`, `AWSSSMErrorInvalidAllowedPattern`, `AWSSSMErrorParameterMaxVersionLimitExceeded`, `AWSSSMErrorParameterPatternMismatch`, `AWSSSMErrorUnsupportedParameterType`, `AWSSSMErrorPoliciesLimitExceeded`, `AWSSSMErrorInvalidPolicyType`, `AWSSSMErrorInvalidPolicyAttribute`, `AWSSSMErrorIncompatiblePolicy`.
 
 @see AWSSSMPutParameterRequest
 @see AWSSSMPutParameterResult
 */
- (void)putParameter:(AWSSSMPutParameterRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMPutParameterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Defines the default patch baseline for the relevant operating system.</p><p>To reset the AWS predefined patch baseline as the default, specify the full patch baseline ARN as the baseline ID value. For example, for CentOS, specify <code>arn:aws:ssm:us-east-2:733109147000:patchbaseline/pb-0574b43a65ea646ed</code> instead of <code>pb-0574b43a65ea646ed</code>.</p>
 
 @param request A container for the necessary parameters to execute the RegisterDefaultPatchBaseline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMRegisterDefaultPatchBaselineResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidResourceId`, `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMRegisterDefaultPatchBaselineRequest
 @see AWSSSMRegisterDefaultPatchBaselineResult
 */
- (AWSTask<AWSSSMRegisterDefaultPatchBaselineResult *> *)registerDefaultPatchBaseline:(AWSSSMRegisterDefaultPatchBaselineRequest *)request;

/**
 <p>Defines the default patch baseline for the relevant operating system.</p><p>To reset the AWS predefined patch baseline as the default, specify the full patch baseline ARN as the baseline ID value. For example, for CentOS, specify <code>arn:aws:ssm:us-east-2:733109147000:patchbaseline/pb-0574b43a65ea646ed</code> instead of <code>pb-0574b43a65ea646ed</code>.</p>
 
 @param request A container for the necessary parameters to execute the RegisterDefaultPatchBaseline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidResourceId`, `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMRegisterDefaultPatchBaselineRequest
 @see AWSSSMRegisterDefaultPatchBaselineResult
 */
- (void)registerDefaultPatchBaseline:(AWSSSMRegisterDefaultPatchBaselineRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMRegisterDefaultPatchBaselineResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers a patch baseline for a patch group.</p>
 
 @param request A container for the necessary parameters to execute the RegisterPatchBaselineForPatchGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMRegisterPatchBaselineForPatchGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorAlreadyExists`, `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInvalidResourceId`, `AWSSSMErrorResourceLimitExceeded`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMRegisterPatchBaselineForPatchGroupRequest
 @see AWSSSMRegisterPatchBaselineForPatchGroupResult
 */
- (AWSTask<AWSSSMRegisterPatchBaselineForPatchGroupResult *> *)registerPatchBaselineForPatchGroup:(AWSSSMRegisterPatchBaselineForPatchGroupRequest *)request;

/**
 <p>Registers a patch baseline for a patch group.</p>
 
 @param request A container for the necessary parameters to execute the RegisterPatchBaselineForPatchGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorAlreadyExists`, `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInvalidResourceId`, `AWSSSMErrorResourceLimitExceeded`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMRegisterPatchBaselineForPatchGroupRequest
 @see AWSSSMRegisterPatchBaselineForPatchGroupResult
 */
- (void)registerPatchBaselineForPatchGroup:(AWSSSMRegisterPatchBaselineForPatchGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMRegisterPatchBaselineForPatchGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers a target with a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the RegisterTargetWithMaintenanceWindow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMRegisterTargetWithMaintenanceWindowResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorIdempotentParameterMismatch`, `AWSSSMErrorDoesNotExist`, `AWSSSMErrorResourceLimitExceeded`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMRegisterTargetWithMaintenanceWindowRequest
 @see AWSSSMRegisterTargetWithMaintenanceWindowResult
 */
- (AWSTask<AWSSSMRegisterTargetWithMaintenanceWindowResult *> *)registerTargetWithMaintenanceWindow:(AWSSSMRegisterTargetWithMaintenanceWindowRequest *)request;

/**
 <p>Registers a target with a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the RegisterTargetWithMaintenanceWindow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorIdempotentParameterMismatch`, `AWSSSMErrorDoesNotExist`, `AWSSSMErrorResourceLimitExceeded`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMRegisterTargetWithMaintenanceWindowRequest
 @see AWSSSMRegisterTargetWithMaintenanceWindowResult
 */
- (void)registerTargetWithMaintenanceWindow:(AWSSSMRegisterTargetWithMaintenanceWindowRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMRegisterTargetWithMaintenanceWindowResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds a new task to a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the RegisterTaskWithMaintenanceWindow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMRegisterTaskWithMaintenanceWindowResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorIdempotentParameterMismatch`, `AWSSSMErrorDoesNotExist`, `AWSSSMErrorResourceLimitExceeded`, `AWSSSMErrorFeatureNotAvailable`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMRegisterTaskWithMaintenanceWindowRequest
 @see AWSSSMRegisterTaskWithMaintenanceWindowResult
 */
- (AWSTask<AWSSSMRegisterTaskWithMaintenanceWindowResult *> *)registerTaskWithMaintenanceWindow:(AWSSSMRegisterTaskWithMaintenanceWindowRequest *)request;

/**
 <p>Adds a new task to a maintenance window.</p>
 
 @param request A container for the necessary parameters to execute the RegisterTaskWithMaintenanceWindow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorIdempotentParameterMismatch`, `AWSSSMErrorDoesNotExist`, `AWSSSMErrorResourceLimitExceeded`, `AWSSSMErrorFeatureNotAvailable`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMRegisterTaskWithMaintenanceWindowRequest
 @see AWSSSMRegisterTaskWithMaintenanceWindowResult
 */
- (void)registerTaskWithMaintenanceWindow:(AWSSSMRegisterTaskWithMaintenanceWindowRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMRegisterTaskWithMaintenanceWindowResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes tag keys from the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTagsFromResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMRemoveTagsFromResourceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidResourceType`, `AWSSSMErrorInvalidResourceId`, `AWSSSMErrorInternalServer`, `AWSSSMErrorTooManyUpdates`.
 
 @see AWSSSMRemoveTagsFromResourceRequest
 @see AWSSSMRemoveTagsFromResourceResult
 */
- (AWSTask<AWSSSMRemoveTagsFromResourceResult *> *)removeTagsFromResource:(AWSSSMRemoveTagsFromResourceRequest *)request;

/**
 <p>Removes tag keys from the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTagsFromResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidResourceType`, `AWSSSMErrorInvalidResourceId`, `AWSSSMErrorInternalServer`, `AWSSSMErrorTooManyUpdates`.
 
 @see AWSSSMRemoveTagsFromResourceRequest
 @see AWSSSMRemoveTagsFromResourceResult
 */
- (void)removeTagsFromResource:(AWSSSMRemoveTagsFromResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMRemoveTagsFromResourceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p><code>ServiceSetting</code> is an account-level setting for an AWS service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an AWS service charges money to the account based on feature or service usage, then the AWS service team might create a default setting of "false". This means the user can't use this feature unless they change the setting to "true" and intentionally opt in for a paid feature.</p><p>Services map a <code>SettingId</code> object to a setting value. AWS services teams define the default value for a <code>SettingId</code>. You can't create a new <code>SettingId</code>, but you can overwrite the default value if you have the <code>ssm:UpdateServiceSetting</code> permission for the setting. Use the <a>GetServiceSetting</a> API action to view the current value. Use the <a>UpdateServiceSetting</a> API action to change the default setting. </p><p>Reset the service setting for the account to the default value as provisioned by the AWS service team. </p>
 
 @param request A container for the necessary parameters to execute the ResetServiceSetting service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMResetServiceSettingResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorServiceSettingNotFound`, `AWSSSMErrorTooManyUpdates`.
 
 @see AWSSSMResetServiceSettingRequest
 @see AWSSSMResetServiceSettingResult
 */
- (AWSTask<AWSSSMResetServiceSettingResult *> *)resetServiceSetting:(AWSSSMResetServiceSettingRequest *)request;

/**
 <p><code>ServiceSetting</code> is an account-level setting for an AWS service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an AWS service charges money to the account based on feature or service usage, then the AWS service team might create a default setting of "false". This means the user can't use this feature unless they change the setting to "true" and intentionally opt in for a paid feature.</p><p>Services map a <code>SettingId</code> object to a setting value. AWS services teams define the default value for a <code>SettingId</code>. You can't create a new <code>SettingId</code>, but you can overwrite the default value if you have the <code>ssm:UpdateServiceSetting</code> permission for the setting. Use the <a>GetServiceSetting</a> API action to view the current value. Use the <a>UpdateServiceSetting</a> API action to change the default setting. </p><p>Reset the service setting for the account to the default value as provisioned by the AWS service team. </p>
 
 @param request A container for the necessary parameters to execute the ResetServiceSetting service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorServiceSettingNotFound`, `AWSSSMErrorTooManyUpdates`.
 
 @see AWSSSMResetServiceSettingRequest
 @see AWSSSMResetServiceSettingResult
 */
- (void)resetServiceSetting:(AWSSSMResetServiceSettingRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMResetServiceSettingResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Reconnects a session to an instance after it has been disconnected. Connections can be resumed for disconnected sessions, but not terminated sessions.</p><note><p>This command is primarily for use by client machines to automatically reconnect during intermittent network issues. It is not intended for any other use.</p></note>
 
 @param request A container for the necessary parameters to execute the ResumeSession service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMResumeSessionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMResumeSessionRequest
 @see AWSSSMResumeSessionResponse
 */
- (AWSTask<AWSSSMResumeSessionResponse *> *)resumeSession:(AWSSSMResumeSessionRequest *)request;

/**
 <p>Reconnects a session to an instance after it has been disconnected. Connections can be resumed for disconnected sessions, but not terminated sessions.</p><note><p>This command is primarily for use by client machines to automatically reconnect during intermittent network issues. It is not intended for any other use.</p></note>
 
 @param request A container for the necessary parameters to execute the ResumeSession service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMResumeSessionRequest
 @see AWSSSMResumeSessionResponse
 */
- (void)resumeSession:(AWSSSMResumeSessionRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMResumeSessionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sends a signal to an Automation execution to change the current behavior or status of the execution. </p>
 
 @param request A container for the necessary parameters to execute the SendAutomationSignal service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMSendAutomationSignalResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorAutomationExecutionNotFound`, `AWSSSMErrorAutomationStepNotFound`, `AWSSSMErrorInvalidAutomationSignal`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMSendAutomationSignalRequest
 @see AWSSSMSendAutomationSignalResult
 */
- (AWSTask<AWSSSMSendAutomationSignalResult *> *)sendAutomationSignal:(AWSSSMSendAutomationSignalRequest *)request;

/**
 <p>Sends a signal to an Automation execution to change the current behavior or status of the execution. </p>
 
 @param request A container for the necessary parameters to execute the SendAutomationSignal service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorAutomationExecutionNotFound`, `AWSSSMErrorAutomationStepNotFound`, `AWSSSMErrorInvalidAutomationSignal`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMSendAutomationSignalRequest
 @see AWSSSMSendAutomationSignalResult
 */
- (void)sendAutomationSignal:(AWSSSMSendAutomationSignalRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMSendAutomationSignalResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Runs commands on one or more managed instances.</p>
 
 @param request A container for the necessary parameters to execute the SendCommand service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMSendCommandResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDuplicateInstanceId`, `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidDocumentVersion`, `AWSSSMErrorInvalidOutputFolder`, `AWSSSMErrorInvalidParameters`, `AWSSSMErrorUnsupportedPlatformType`, `AWSSSMErrorMaxDocumentSizeExceeded`, `AWSSSMErrorInvalidRole`, `AWSSSMErrorInvalidNotificationConfig`.
 
 @see AWSSSMSendCommandRequest
 @see AWSSSMSendCommandResult
 */
- (AWSTask<AWSSSMSendCommandResult *> *)sendCommand:(AWSSSMSendCommandRequest *)request;

/**
 <p>Runs commands on one or more managed instances.</p>
 
 @param request A container for the necessary parameters to execute the SendCommand service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDuplicateInstanceId`, `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidDocumentVersion`, `AWSSSMErrorInvalidOutputFolder`, `AWSSSMErrorInvalidParameters`, `AWSSSMErrorUnsupportedPlatformType`, `AWSSSMErrorMaxDocumentSizeExceeded`, `AWSSSMErrorInvalidRole`, `AWSSSMErrorInvalidNotificationConfig`.
 
 @see AWSSSMSendCommandRequest
 @see AWSSSMSendCommandResult
 */
- (void)sendCommand:(AWSSSMSendCommandRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMSendCommandResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Use this API action to run an association immediately and only one time. This action can be helpful when troubleshooting associations.</p>
 
 @param request A container for the necessary parameters to execute the StartAssociationsOnce service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMStartAssociationsOnceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidAssociation`, `AWSSSMErrorAssociationDoesNotExist`.
 
 @see AWSSSMStartAssociationsOnceRequest
 @see AWSSSMStartAssociationsOnceResult
 */
- (AWSTask<AWSSSMStartAssociationsOnceResult *> *)startAssociationsOnce:(AWSSSMStartAssociationsOnceRequest *)request;

/**
 <p>Use this API action to run an association immediately and only one time. This action can be helpful when troubleshooting associations.</p>
 
 @param request A container for the necessary parameters to execute the StartAssociationsOnce service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidAssociation`, `AWSSSMErrorAssociationDoesNotExist`.
 
 @see AWSSSMStartAssociationsOnceRequest
 @see AWSSSMStartAssociationsOnceResult
 */
- (void)startAssociationsOnce:(AWSSSMStartAssociationsOnceRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMStartAssociationsOnceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates execution of an Automation document.</p>
 
 @param request A container for the necessary parameters to execute the StartAutomationExecution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMStartAutomationExecutionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorAutomationDefinitionNotFound`, `AWSSSMErrorInvalidAutomationExecutionParameters`, `AWSSSMErrorAutomationExecutionLimitExceeded`, `AWSSSMErrorAutomationDefinitionVersionNotFound`, `AWSSSMErrorIdempotentParameterMismatch`, `AWSSSMErrorInvalidTarget`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMStartAutomationExecutionRequest
 @see AWSSSMStartAutomationExecutionResult
 */
- (AWSTask<AWSSSMStartAutomationExecutionResult *> *)startAutomationExecution:(AWSSSMStartAutomationExecutionRequest *)request;

/**
 <p>Initiates execution of an Automation document.</p>
 
 @param request A container for the necessary parameters to execute the StartAutomationExecution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorAutomationDefinitionNotFound`, `AWSSSMErrorInvalidAutomationExecutionParameters`, `AWSSSMErrorAutomationExecutionLimitExceeded`, `AWSSSMErrorAutomationDefinitionVersionNotFound`, `AWSSSMErrorIdempotentParameterMismatch`, `AWSSSMErrorInvalidTarget`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMStartAutomationExecutionRequest
 @see AWSSSMStartAutomationExecutionResult
 */
- (void)startAutomationExecution:(AWSSSMStartAutomationExecutionRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMStartAutomationExecutionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates a connection to a target (for example, an instance) for a Session Manager session. Returns a URL and token that can be used to open a WebSocket connection for sending input and receiving outputs.</p><note><p>AWS CLI usage: <code>start-session</code> is an interactive command that requires the Session Manager plugin to be installed on the client machine making the call. For information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html">Install the Session Manager plugin for the AWS CLI</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>AWS Tools for PowerShell usage: Start-SSMSession is not currently supported by AWS Tools for PowerShell on Windows local machines.</p></note>
 
 @param request A container for the necessary parameters to execute the StartSession service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMStartSessionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidDocument`, `AWSSSMErrorTargetNotConnected`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMStartSessionRequest
 @see AWSSSMStartSessionResponse
 */
- (AWSTask<AWSSSMStartSessionResponse *> *)startSession:(AWSSSMStartSessionRequest *)request;

/**
 <p>Initiates a connection to a target (for example, an instance) for a Session Manager session. Returns a URL and token that can be used to open a WebSocket connection for sending input and receiving outputs.</p><note><p>AWS CLI usage: <code>start-session</code> is an interactive command that requires the Session Manager plugin to be installed on the client machine making the call. For information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html">Install the Session Manager plugin for the AWS CLI</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>AWS Tools for PowerShell usage: Start-SSMSession is not currently supported by AWS Tools for PowerShell on Windows local machines.</p></note>
 
 @param request A container for the necessary parameters to execute the StartSession service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidDocument`, `AWSSSMErrorTargetNotConnected`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMStartSessionRequest
 @see AWSSSMStartSessionResponse
 */
- (void)startSession:(AWSSSMStartSessionRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMStartSessionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stop an Automation that is currently running.</p>
 
 @param request A container for the necessary parameters to execute the StopAutomationExecution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMStopAutomationExecutionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorAutomationExecutionNotFound`, `AWSSSMErrorInvalidAutomationStatusUpdate`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMStopAutomationExecutionRequest
 @see AWSSSMStopAutomationExecutionResult
 */
- (AWSTask<AWSSSMStopAutomationExecutionResult *> *)stopAutomationExecution:(AWSSSMStopAutomationExecutionRequest *)request;

/**
 <p>Stop an Automation that is currently running.</p>
 
 @param request A container for the necessary parameters to execute the StopAutomationExecution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorAutomationExecutionNotFound`, `AWSSSMErrorInvalidAutomationStatusUpdate`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMStopAutomationExecutionRequest
 @see AWSSSMStopAutomationExecutionResult
 */
- (void)stopAutomationExecution:(AWSSSMStopAutomationExecutionRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMStopAutomationExecutionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Permanently ends a session and closes the data connection between the Session Manager client and SSM Agent on the instance. A terminated session cannot be resumed.</p>
 
 @param request A container for the necessary parameters to execute the TerminateSession service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMTerminateSessionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMTerminateSessionRequest
 @see AWSSSMTerminateSessionResponse
 */
- (AWSTask<AWSSSMTerminateSessionResponse *> *)terminateSession:(AWSSSMTerminateSessionRequest *)request;

/**
 <p>Permanently ends a session and closes the data connection between the Session Manager client and SSM Agent on the instance. A terminated session cannot be resumed.</p>
 
 @param request A container for the necessary parameters to execute the TerminateSession service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMTerminateSessionRequest
 @see AWSSSMTerminateSessionResponse
 */
- (void)terminateSession:(AWSSSMTerminateSessionRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMTerminateSessionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an association. You can update the association name and version, the document version, schedule, parameters, and Amazon S3 output. </p><p>In order to call this API action, your IAM user account, group, or role must be configured with permission to call the <a>DescribeAssociation</a> API action. If you don't have permission to call DescribeAssociation, then you receive the following error: <code>An error occurred (AccessDeniedException) when calling the UpdateAssociation operation: User: &lt;user_arn&gt; is not authorized to perform: ssm:DescribeAssociation on resource: &lt;resource_arn&gt;</code></p><important><p>When you update an association, the association immediately runs against the specified targets.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMUpdateAssociationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidSchedule`, `AWSSSMErrorInvalidParameters`, `AWSSSMErrorInvalidOutputLocation`, `AWSSSMErrorInvalidDocumentVersion`, `AWSSSMErrorAssociationDoesNotExist`, `AWSSSMErrorInvalidUpdate`, `AWSSSMErrorTooManyUpdates`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidTarget`, `AWSSSMErrorInvalidAssociationVersion`, `AWSSSMErrorAssociationVersionLimitExceeded`.
 
 @see AWSSSMUpdateAssociationRequest
 @see AWSSSMUpdateAssociationResult
 */
- (AWSTask<AWSSSMUpdateAssociationResult *> *)updateAssociation:(AWSSSMUpdateAssociationRequest *)request;

/**
 <p>Updates an association. You can update the association name and version, the document version, schedule, parameters, and Amazon S3 output. </p><p>In order to call this API action, your IAM user account, group, or role must be configured with permission to call the <a>DescribeAssociation</a> API action. If you don't have permission to call DescribeAssociation, then you receive the following error: <code>An error occurred (AccessDeniedException) when calling the UpdateAssociation operation: User: &lt;user_arn&gt; is not authorized to perform: ssm:DescribeAssociation on resource: &lt;resource_arn&gt;</code></p><important><p>When you update an association, the association immediately runs against the specified targets.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidSchedule`, `AWSSSMErrorInvalidParameters`, `AWSSSMErrorInvalidOutputLocation`, `AWSSSMErrorInvalidDocumentVersion`, `AWSSSMErrorAssociationDoesNotExist`, `AWSSSMErrorInvalidUpdate`, `AWSSSMErrorTooManyUpdates`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidTarget`, `AWSSSMErrorInvalidAssociationVersion`, `AWSSSMErrorAssociationVersionLimitExceeded`.
 
 @see AWSSSMUpdateAssociationRequest
 @see AWSSSMUpdateAssociationResult
 */
- (void)updateAssociation:(AWSSSMUpdateAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMUpdateAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the status of the Systems Manager document associated with the specified instance.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAssociationStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMUpdateAssociationStatusResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorAssociationDoesNotExist`, `AWSSSMErrorStatusUnchanged`, `AWSSSMErrorTooManyUpdates`.
 
 @see AWSSSMUpdateAssociationStatusRequest
 @see AWSSSMUpdateAssociationStatusResult
 */
- (AWSTask<AWSSSMUpdateAssociationStatusResult *> *)updateAssociationStatus:(AWSSSMUpdateAssociationStatusRequest *)request;

/**
 <p>Updates the status of the Systems Manager document associated with the specified instance.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAssociationStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorAssociationDoesNotExist`, `AWSSSMErrorStatusUnchanged`, `AWSSSMErrorTooManyUpdates`.
 
 @see AWSSSMUpdateAssociationStatusRequest
 @see AWSSSMUpdateAssociationStatusResult
 */
- (void)updateAssociationStatus:(AWSSSMUpdateAssociationStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMUpdateAssociationStatusResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates one or more values for an SSM document.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDocument service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMUpdateDocumentResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorMaxDocumentSizeExceeded`, `AWSSSMErrorDocumentVersionLimitExceeded`, `AWSSSMErrorInternalServer`, `AWSSSMErrorDuplicateDocumentContent`, `AWSSSMErrorDuplicateDocumentVersionName`, `AWSSSMErrorInvalidDocumentContent`, `AWSSSMErrorInvalidDocumentVersion`, `AWSSSMErrorInvalidDocumentSchemaVersion`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidDocumentOperation`.
 
 @see AWSSSMUpdateDocumentRequest
 @see AWSSSMUpdateDocumentResult
 */
- (AWSTask<AWSSSMUpdateDocumentResult *> *)updateDocument:(AWSSSMUpdateDocumentRequest *)request;

/**
 <p>Updates one or more values for an SSM document.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDocument service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorMaxDocumentSizeExceeded`, `AWSSSMErrorDocumentVersionLimitExceeded`, `AWSSSMErrorInternalServer`, `AWSSSMErrorDuplicateDocumentContent`, `AWSSSMErrorDuplicateDocumentVersionName`, `AWSSSMErrorInvalidDocumentContent`, `AWSSSMErrorInvalidDocumentVersion`, `AWSSSMErrorInvalidDocumentSchemaVersion`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidDocumentOperation`.
 
 @see AWSSSMUpdateDocumentRequest
 @see AWSSSMUpdateDocumentResult
 */
- (void)updateDocument:(AWSSSMUpdateDocumentRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMUpdateDocumentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Set the default version of a document. </p>
 
 @param request A container for the necessary parameters to execute the UpdateDocumentDefaultVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMUpdateDocumentDefaultVersionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidDocumentVersion`, `AWSSSMErrorInvalidDocumentSchemaVersion`.
 
 @see AWSSSMUpdateDocumentDefaultVersionRequest
 @see AWSSSMUpdateDocumentDefaultVersionResult
 */
- (AWSTask<AWSSSMUpdateDocumentDefaultVersionResult *> *)updateDocumentDefaultVersion:(AWSSSMUpdateDocumentDefaultVersionRequest *)request;

/**
 <p>Set the default version of a document. </p>
 
 @param request A container for the necessary parameters to execute the UpdateDocumentDefaultVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorInvalidDocument`, `AWSSSMErrorInvalidDocumentVersion`, `AWSSSMErrorInvalidDocumentSchemaVersion`.
 
 @see AWSSSMUpdateDocumentDefaultVersionRequest
 @see AWSSSMUpdateDocumentDefaultVersionResult
 */
- (void)updateDocumentDefaultVersion:(AWSSSMUpdateDocumentDefaultVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMUpdateDocumentDefaultVersionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing maintenance window. Only specified parameters are modified.</p><note><p>The value you specify for <code>Duration</code> determines the specific end time for the maintenance window based on the time it begins. No maintenance window tasks are permitted to start after the resulting endtime minus the number of hours you specify for <code>Cutoff</code>. For example, if the maintenance window starts at 3 PM, the duration is three hours, and the value you specify for <code>Cutoff</code> is one hour, no maintenance window tasks can start after 5 PM.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateMaintenanceWindow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMUpdateMaintenanceWindowResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMUpdateMaintenanceWindowRequest
 @see AWSSSMUpdateMaintenanceWindowResult
 */
- (AWSTask<AWSSSMUpdateMaintenanceWindowResult *> *)updateMaintenanceWindow:(AWSSSMUpdateMaintenanceWindowRequest *)request;

/**
 <p>Updates an existing maintenance window. Only specified parameters are modified.</p><note><p>The value you specify for <code>Duration</code> determines the specific end time for the maintenance window based on the time it begins. No maintenance window tasks are permitted to start after the resulting endtime minus the number of hours you specify for <code>Cutoff</code>. For example, if the maintenance window starts at 3 PM, the duration is three hours, and the value you specify for <code>Cutoff</code> is one hour, no maintenance window tasks can start after 5 PM.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateMaintenanceWindow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMUpdateMaintenanceWindowRequest
 @see AWSSSMUpdateMaintenanceWindowResult
 */
- (void)updateMaintenanceWindow:(AWSSSMUpdateMaintenanceWindowRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMUpdateMaintenanceWindowResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the target of an existing maintenance window. You can change the following:</p><ul><li><p>Name</p></li><li><p>Description</p></li><li><p>Owner</p></li><li><p>IDs for an ID target</p></li><li><p>Tags for a Tag target</p></li><li><p>From any supported tag type to another. The three supported tag types are ID target, Tag target, and resource group. For more information, see <a>Target</a>.</p></li></ul><note><p>If a parameter is null, then the corresponding field is not modified.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateMaintenanceWindowTarget service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMUpdateMaintenanceWindowTargetResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMUpdateMaintenanceWindowTargetRequest
 @see AWSSSMUpdateMaintenanceWindowTargetResult
 */
- (AWSTask<AWSSSMUpdateMaintenanceWindowTargetResult *> *)updateMaintenanceWindowTarget:(AWSSSMUpdateMaintenanceWindowTargetRequest *)request;

/**
 <p>Modifies the target of an existing maintenance window. You can change the following:</p><ul><li><p>Name</p></li><li><p>Description</p></li><li><p>Owner</p></li><li><p>IDs for an ID target</p></li><li><p>Tags for a Tag target</p></li><li><p>From any supported tag type to another. The three supported tag types are ID target, Tag target, and resource group. For more information, see <a>Target</a>.</p></li></ul><note><p>If a parameter is null, then the corresponding field is not modified.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateMaintenanceWindowTarget service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMUpdateMaintenanceWindowTargetRequest
 @see AWSSSMUpdateMaintenanceWindowTargetResult
 */
- (void)updateMaintenanceWindowTarget:(AWSSSMUpdateMaintenanceWindowTargetRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMUpdateMaintenanceWindowTargetResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies a task assigned to a maintenance window. You can't change the task type, but you can change the following values:</p><ul><li><p>TaskARN. For example, you can change a RUN_COMMAND task from AWS-RunPowerShellScript to AWS-RunShellScript.</p></li><li><p>ServiceRoleArn</p></li><li><p>TaskInvocationParameters</p></li><li><p>Priority</p></li><li><p>MaxConcurrency</p></li><li><p>MaxErrors</p></li></ul><p>If a parameter is null, then the corresponding field is not modified. Also, if you set Replace to true, then all fields required by the <a>RegisterTaskWithMaintenanceWindow</a> action are required for this request. Optional fields that aren't specified are set to null.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMaintenanceWindowTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMUpdateMaintenanceWindowTaskResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMUpdateMaintenanceWindowTaskRequest
 @see AWSSSMUpdateMaintenanceWindowTaskResult
 */
- (AWSTask<AWSSSMUpdateMaintenanceWindowTaskResult *> *)updateMaintenanceWindowTask:(AWSSSMUpdateMaintenanceWindowTaskRequest *)request;

/**
 <p>Modifies a task assigned to a maintenance window. You can't change the task type, but you can change the following values:</p><ul><li><p>TaskARN. For example, you can change a RUN_COMMAND task from AWS-RunPowerShellScript to AWS-RunShellScript.</p></li><li><p>ServiceRoleArn</p></li><li><p>TaskInvocationParameters</p></li><li><p>Priority</p></li><li><p>MaxConcurrency</p></li><li><p>MaxErrors</p></li></ul><p>If a parameter is null, then the corresponding field is not modified. Also, if you set Replace to true, then all fields required by the <a>RegisterTaskWithMaintenanceWindow</a> action are required for this request. Optional fields that aren't specified are set to null.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMaintenanceWindowTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMUpdateMaintenanceWindowTaskRequest
 @see AWSSSMUpdateMaintenanceWindowTaskResult
 */
- (void)updateMaintenanceWindowTask:(AWSSSMUpdateMaintenanceWindowTaskRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMUpdateMaintenanceWindowTaskResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Changes the Amazon Identity and Access Management (IAM) role that is assigned to the on-premises instance or virtual machines (VM). IAM roles are first assigned to these hybrid instances during the activation process. For more information, see <a>CreateActivation</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateManagedInstanceRole service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMUpdateManagedInstanceRoleResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMUpdateManagedInstanceRoleRequest
 @see AWSSSMUpdateManagedInstanceRoleResult
 */
- (AWSTask<AWSSSMUpdateManagedInstanceRoleResult *> *)updateManagedInstanceRole:(AWSSSMUpdateManagedInstanceRoleRequest *)request;

/**
 <p>Changes the Amazon Identity and Access Management (IAM) role that is assigned to the on-premises instance or virtual machines (VM). IAM roles are first assigned to these hybrid instances during the activation process. For more information, see <a>CreateActivation</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateManagedInstanceRole service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInvalidInstanceId`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMUpdateManagedInstanceRoleRequest
 @see AWSSSMUpdateManagedInstanceRoleResult
 */
- (void)updateManagedInstanceRole:(AWSSSMUpdateManagedInstanceRoleRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMUpdateManagedInstanceRoleResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Edit or change an OpsItem. You must have permission in AWS Identity and Access Management (IAM) to update an OpsItem. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the UpdateOpsItem service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMUpdateOpsItemResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorOpsItemNotFound`, `AWSSSMErrorOpsItemAlreadyExists`, `AWSSSMErrorOpsItemLimitExceeded`, `AWSSSMErrorOpsItemInvalidParameter`.
 
 @see AWSSSMUpdateOpsItemRequest
 @see AWSSSMUpdateOpsItemResponse
 */
- (AWSTask<AWSSSMUpdateOpsItemResponse *> *)updateOpsItem:(AWSSSMUpdateOpsItemRequest *)request;

/**
 <p>Edit or change an OpsItem. You must have permission in AWS Identity and Access Management (IAM) to update an OpsItem. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the UpdateOpsItem service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorOpsItemNotFound`, `AWSSSMErrorOpsItemAlreadyExists`, `AWSSSMErrorOpsItemLimitExceeded`, `AWSSSMErrorOpsItemInvalidParameter`.
 
 @see AWSSSMUpdateOpsItemRequest
 @see AWSSSMUpdateOpsItemResponse
 */
- (void)updateOpsItem:(AWSSSMUpdateOpsItemRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMUpdateOpsItemResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies an existing patch baseline. Fields not specified in the request are left unchanged.</p><note><p>For information about valid key and value pairs in <code>PatchFilters</code> for each supported operating system type, see <a href="http://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html">PatchFilter</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdatePatchBaseline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMUpdatePatchBaselineResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMUpdatePatchBaselineRequest
 @see AWSSSMUpdatePatchBaselineResult
 */
- (AWSTask<AWSSSMUpdatePatchBaselineResult *> *)updatePatchBaseline:(AWSSSMUpdatePatchBaselineRequest *)request;

/**
 <p>Modifies an existing patch baseline. Fields not specified in the request are left unchanged.</p><note><p>For information about valid key and value pairs in <code>PatchFilters</code> for each supported operating system type, see <a href="http://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html">PatchFilter</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdatePatchBaseline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorDoesNotExist`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMUpdatePatchBaselineRequest
 @see AWSSSMUpdatePatchBaselineResult
 */
- (void)updatePatchBaseline:(AWSSSMUpdatePatchBaselineRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMUpdatePatchBaselineResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Update a resource data sync. After you create a resource data sync for a Region, you can't change the account options for that sync. For example, if you create a sync in the us-east-2 (Ohio) Region and you choose the Include only the current account option, you can't edit that sync later and choose the Include all accounts from my AWS Organizations configuration option. Instead, you must delete the first resource data sync, and create a new one.</p><note><p>This API action only supports a resource data sync that was created with a SyncFromSource <code>SyncType</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateResourceDataSync service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMUpdateResourceDataSyncResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorResourceDataSyncNotFound`, `AWSSSMErrorResourceDataSyncInvalidConfiguration`, `AWSSSMErrorResourceDataSyncConflict`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMUpdateResourceDataSyncRequest
 @see AWSSSMUpdateResourceDataSyncResult
 */
- (AWSTask<AWSSSMUpdateResourceDataSyncResult *> *)updateResourceDataSync:(AWSSSMUpdateResourceDataSyncRequest *)request;

/**
 <p>Update a resource data sync. After you create a resource data sync for a Region, you can't change the account options for that sync. For example, if you create a sync in the us-east-2 (Ohio) Region and you choose the Include only the current account option, you can't edit that sync later and choose the Include all accounts from my AWS Organizations configuration option. Instead, you must delete the first resource data sync, and create a new one.</p><note><p>This API action only supports a resource data sync that was created with a SyncFromSource <code>SyncType</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateResourceDataSync service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorResourceDataSyncNotFound`, `AWSSSMErrorResourceDataSyncInvalidConfiguration`, `AWSSSMErrorResourceDataSyncConflict`, `AWSSSMErrorInternalServer`.
 
 @see AWSSSMUpdateResourceDataSyncRequest
 @see AWSSSMUpdateResourceDataSyncResult
 */
- (void)updateResourceDataSync:(AWSSSMUpdateResourceDataSyncRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMUpdateResourceDataSyncResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p><code>ServiceSetting</code> is an account-level setting for an AWS service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an AWS service charges money to the account based on feature or service usage, then the AWS service team might create a default setting of "false". This means the user can't use this feature unless they change the setting to "true" and intentionally opt in for a paid feature.</p><p>Services map a <code>SettingId</code> object to a setting value. AWS services teams define the default value for a <code>SettingId</code>. You can't create a new <code>SettingId</code>, but you can overwrite the default value if you have the <code>ssm:UpdateServiceSetting</code> permission for the setting. Use the <a>GetServiceSetting</a> API action to view the current value. Or, use the <a>ResetServiceSetting</a> to change the value back to the original value defined by the AWS service team.</p><p>Update the service setting for the account. </p>
 
 @param request A container for the necessary parameters to execute the UpdateServiceSetting service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSSMUpdateServiceSettingResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorServiceSettingNotFound`, `AWSSSMErrorTooManyUpdates`.
 
 @see AWSSSMUpdateServiceSettingRequest
 @see AWSSSMUpdateServiceSettingResult
 */
- (AWSTask<AWSSSMUpdateServiceSettingResult *> *)updateServiceSetting:(AWSSSMUpdateServiceSettingRequest *)request;

/**
 <p><code>ServiceSetting</code> is an account-level setting for an AWS service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an AWS service charges money to the account based on feature or service usage, then the AWS service team might create a default setting of "false". This means the user can't use this feature unless they change the setting to "true" and intentionally opt in for a paid feature.</p><p>Services map a <code>SettingId</code> object to a setting value. AWS services teams define the default value for a <code>SettingId</code>. You can't create a new <code>SettingId</code>, but you can overwrite the default value if you have the <code>ssm:UpdateServiceSetting</code> permission for the setting. Use the <a>GetServiceSetting</a> API action to view the current value. Or, use the <a>ResetServiceSetting</a> to change the value back to the original value defined by the AWS service team.</p><p>Update the service setting for the account. </p>
 
 @param request A container for the necessary parameters to execute the UpdateServiceSetting service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSSMErrorDomain` domain and the following error code: `AWSSSMErrorInternalServer`, `AWSSSMErrorServiceSettingNotFound`, `AWSSSMErrorTooManyUpdates`.
 
 @see AWSSSMUpdateServiceSettingRequest
 @see AWSSSMUpdateServiceSettingResult
 */
- (void)updateServiceSetting:(AWSSSMUpdateServiceSettingRequest *)request completionHandler:(void (^ _Nullable)(AWSSSMUpdateServiceSettingResult * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
