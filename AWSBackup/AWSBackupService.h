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
#import "AWSBackupModel.h"
#import "AWSBackupResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSBackup
FOUNDATION_EXPORT NSString *const AWSBackupSDKVersion;

/**
 <fullname>AWS Backup</fullname><p>AWS Backup is a unified backup service designed to protect AWS services and their associated data. AWS Backup simplifies the creation, migration, restoration, and deletion of backups, while also providing reporting and auditing.</p>
 */
@interface AWSBackup : AWSService

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

     let Backup = AWSBackup.default()

 *Objective-C*

     AWSBackup *Backup = [AWSBackup defaultBackup];

 @return The default service client.
 */
+ (instancetype)defaultBackup;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSBackup.register(with: configuration!, forKey: "USWest2Backup")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSBackup registerBackupWithConfiguration:configuration forKey:@"USWest2Backup"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Backup = AWSBackup(forKey: "USWest2Backup")

 *Objective-C*

     AWSBackup *Backup = [AWSBackup BackupForKey:@"USWest2Backup"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerBackupWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerBackupWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSBackup.register(with: configuration!, forKey: "USWest2Backup")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSBackup registerBackupWithConfiguration:configuration forKey:@"USWest2Backup"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Backup = AWSBackup(forKey: "USWest2Backup")

 *Objective-C*

     AWSBackup *Backup = [AWSBackup BackupForKey:@"USWest2Backup"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)BackupForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeBackupForKey:(NSString *)key;

/**
 <p>Backup plans are documents that contain information that AWS Backup uses to schedule tasks that create recovery points of resources.</p><p>If you call <code>CreateBackupPlan</code> with a plan that already exists, an <code>AlreadyExistsException</code> is returned.</p>
 
 @param request A container for the necessary parameters to execute the CreateBackupPlan service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupCreateBackupPlanOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorLimitExceeded`, `AWSBackupErrorAlreadyExists`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupCreateBackupPlanInput
 @see AWSBackupCreateBackupPlanOutput
 */
- (AWSTask<AWSBackupCreateBackupPlanOutput *> *)createBackupPlan:(AWSBackupCreateBackupPlanInput *)request;

/**
 <p>Backup plans are documents that contain information that AWS Backup uses to schedule tasks that create recovery points of resources.</p><p>If you call <code>CreateBackupPlan</code> with a plan that already exists, an <code>AlreadyExistsException</code> is returned.</p>
 
 @param request A container for the necessary parameters to execute the CreateBackupPlan service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorLimitExceeded`, `AWSBackupErrorAlreadyExists`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupCreateBackupPlanInput
 @see AWSBackupCreateBackupPlanOutput
 */
- (void)createBackupPlan:(AWSBackupCreateBackupPlanInput *)request completionHandler:(void (^ _Nullable)(AWSBackupCreateBackupPlanOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a JSON document that specifies a set of resources to assign to a backup plan. Resources can be included by specifying patterns for a <code>ListOfTags</code> and selected <code>Resources</code>. </p><p>For example, consider the following patterns:</p><ul><li><p><code>Resources: "arn:aws:ec2:region:account-id:volume/volume-id"</code></p></li><li><p><code>ConditionKey:"department"</code></p><p><code>ConditionValue:"finance"</code></p><p><code>ConditionType:"STRINGEQUALS"</code></p></li><li><p><code>ConditionKey:"importance"</code></p><p><code>ConditionValue:"critical"</code></p><p><code>ConditionType:"STRINGEQUALS"</code></p></li></ul><p>Using these patterns would back up all Amazon Elastic Block Store (Amazon EBS) volumes that are tagged as <code>"department=finance"</code>, <code>"importance=critical"</code>, in addition to an EBS volume with the specified volume Id.</p><p>Resources and conditions are additive in that all resources that match the pattern are selected. This shouldn't be confused with a logical AND, where all conditions must match. The matching patterns are logically 'put together using the OR operator. In other words, all patterns that match are selected for backup.</p>
 
 @param request A container for the necessary parameters to execute the CreateBackupSelection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupCreateBackupSelectionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorLimitExceeded`, `AWSBackupErrorAlreadyExists`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupCreateBackupSelectionInput
 @see AWSBackupCreateBackupSelectionOutput
 */
- (AWSTask<AWSBackupCreateBackupSelectionOutput *> *)createBackupSelection:(AWSBackupCreateBackupSelectionInput *)request;

/**
 <p>Creates a JSON document that specifies a set of resources to assign to a backup plan. Resources can be included by specifying patterns for a <code>ListOfTags</code> and selected <code>Resources</code>. </p><p>For example, consider the following patterns:</p><ul><li><p><code>Resources: "arn:aws:ec2:region:account-id:volume/volume-id"</code></p></li><li><p><code>ConditionKey:"department"</code></p><p><code>ConditionValue:"finance"</code></p><p><code>ConditionType:"STRINGEQUALS"</code></p></li><li><p><code>ConditionKey:"importance"</code></p><p><code>ConditionValue:"critical"</code></p><p><code>ConditionType:"STRINGEQUALS"</code></p></li></ul><p>Using these patterns would back up all Amazon Elastic Block Store (Amazon EBS) volumes that are tagged as <code>"department=finance"</code>, <code>"importance=critical"</code>, in addition to an EBS volume with the specified volume Id.</p><p>Resources and conditions are additive in that all resources that match the pattern are selected. This shouldn't be confused with a logical AND, where all conditions must match. The matching patterns are logically 'put together using the OR operator. In other words, all patterns that match are selected for backup.</p>
 
 @param request A container for the necessary parameters to execute the CreateBackupSelection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorLimitExceeded`, `AWSBackupErrorAlreadyExists`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupCreateBackupSelectionInput
 @see AWSBackupCreateBackupSelectionOutput
 */
- (void)createBackupSelection:(AWSBackupCreateBackupSelectionInput *)request completionHandler:(void (^ _Nullable)(AWSBackupCreateBackupSelectionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a logical container where backups are stored. A <code>CreateBackupVault</code> request includes a name, optionally one or more resource tags, an encryption key, and a request ID.</p><note><p>Sensitive data, such as passport numbers, should not be included the name of a backup vault.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateBackupVault service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupCreateBackupVaultOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorLimitExceeded`, `AWSBackupErrorAlreadyExists`.
 
 @see AWSBackupCreateBackupVaultInput
 @see AWSBackupCreateBackupVaultOutput
 */
- (AWSTask<AWSBackupCreateBackupVaultOutput *> *)createBackupVault:(AWSBackupCreateBackupVaultInput *)request;

/**
 <p>Creates a logical container where backups are stored. A <code>CreateBackupVault</code> request includes a name, optionally one or more resource tags, an encryption key, and a request ID.</p><note><p>Sensitive data, such as passport numbers, should not be included the name of a backup vault.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateBackupVault service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorLimitExceeded`, `AWSBackupErrorAlreadyExists`.
 
 @see AWSBackupCreateBackupVaultInput
 @see AWSBackupCreateBackupVaultOutput
 */
- (void)createBackupVault:(AWSBackupCreateBackupVaultInput *)request completionHandler:(void (^ _Nullable)(AWSBackupCreateBackupVaultOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a backup plan. A backup plan can only be deleted after all associated selections of resources have been deleted. Deleting a backup plan deletes the current version of a backup plan. Previous versions, if any, will still exist.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBackupPlan service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupDeleteBackupPlanOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorInvalidRequest`.
 
 @see AWSBackupDeleteBackupPlanInput
 @see AWSBackupDeleteBackupPlanOutput
 */
- (AWSTask<AWSBackupDeleteBackupPlanOutput *> *)deleteBackupPlan:(AWSBackupDeleteBackupPlanInput *)request;

/**
 <p>Deletes a backup plan. A backup plan can only be deleted after all associated selections of resources have been deleted. Deleting a backup plan deletes the current version of a backup plan. Previous versions, if any, will still exist.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBackupPlan service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorInvalidRequest`.
 
 @see AWSBackupDeleteBackupPlanInput
 @see AWSBackupDeleteBackupPlanOutput
 */
- (void)deleteBackupPlan:(AWSBackupDeleteBackupPlanInput *)request completionHandler:(void (^ _Nullable)(AWSBackupDeleteBackupPlanOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the resource selection associated with a backup plan that is specified by the <code>SelectionId</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBackupSelection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupDeleteBackupSelectionInput
 */
- (AWSTask *)deleteBackupSelection:(AWSBackupDeleteBackupSelectionInput *)request;

/**
 <p>Deletes the resource selection associated with a backup plan that is specified by the <code>SelectionId</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBackupSelection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupDeleteBackupSelectionInput
 */
- (void)deleteBackupSelection:(AWSBackupDeleteBackupSelectionInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the backup vault identified by its name. A vault can be deleted only if it is empty.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBackupVault service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorInvalidRequest`.
 
 @see AWSBackupDeleteBackupVaultInput
 */
- (AWSTask *)deleteBackupVault:(AWSBackupDeleteBackupVaultInput *)request;

/**
 <p>Deletes the backup vault identified by its name. A vault can be deleted only if it is empty.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBackupVault service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorInvalidRequest`.
 
 @see AWSBackupDeleteBackupVaultInput
 */
- (void)deleteBackupVault:(AWSBackupDeleteBackupVaultInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the policy document that manages permissions on a backup vault.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBackupVaultAccessPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupDeleteBackupVaultAccessPolicyInput
 */
- (AWSTask *)deleteBackupVaultAccessPolicy:(AWSBackupDeleteBackupVaultAccessPolicyInput *)request;

/**
 <p>Deletes the policy document that manages permissions on a backup vault.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBackupVaultAccessPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupDeleteBackupVaultAccessPolicyInput
 */
- (void)deleteBackupVaultAccessPolicy:(AWSBackupDeleteBackupVaultAccessPolicyInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes event notifications for the specified backup vault.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBackupVaultNotifications service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupDeleteBackupVaultNotificationsInput
 */
- (AWSTask *)deleteBackupVaultNotifications:(AWSBackupDeleteBackupVaultNotificationsInput *)request;

/**
 <p>Deletes event notifications for the specified backup vault.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBackupVaultNotifications service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupDeleteBackupVaultNotificationsInput
 */
- (void)deleteBackupVaultNotifications:(AWSBackupDeleteBackupVaultNotificationsInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the recovery point specified by a recovery point ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRecoveryPoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorInvalidRequest`.
 
 @see AWSBackupDeleteRecoveryPointInput
 */
- (AWSTask *)deleteRecoveryPoint:(AWSBackupDeleteRecoveryPointInput *)request;

/**
 <p>Deletes the recovery point specified by a recovery point ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRecoveryPoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorInvalidRequest`.
 
 @see AWSBackupDeleteRecoveryPointInput
 */
- (void)deleteRecoveryPoint:(AWSBackupDeleteRecoveryPointInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Returns metadata associated with creating a backup of a resource.</p>
 
 @param request A container for the necessary parameters to execute the DescribeBackupJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupDescribeBackupJobOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorDependencyFailure`.
 
 @see AWSBackupDescribeBackupJobInput
 @see AWSBackupDescribeBackupJobOutput
 */
- (AWSTask<AWSBackupDescribeBackupJobOutput *> *)describeBackupJob:(AWSBackupDescribeBackupJobInput *)request;

/**
 <p>Returns metadata associated with creating a backup of a resource.</p>
 
 @param request A container for the necessary parameters to execute the DescribeBackupJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorDependencyFailure`.
 
 @see AWSBackupDescribeBackupJobInput
 @see AWSBackupDescribeBackupJobOutput
 */
- (void)describeBackupJob:(AWSBackupDescribeBackupJobInput *)request completionHandler:(void (^ _Nullable)(AWSBackupDescribeBackupJobOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns metadata about a backup vault specified by its name.</p>
 
 @param request A container for the necessary parameters to execute the DescribeBackupVault service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupDescribeBackupVaultOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupDescribeBackupVaultInput
 @see AWSBackupDescribeBackupVaultOutput
 */
- (AWSTask<AWSBackupDescribeBackupVaultOutput *> *)describeBackupVault:(AWSBackupDescribeBackupVaultInput *)request;

/**
 <p>Returns metadata about a backup vault specified by its name.</p>
 
 @param request A container for the necessary parameters to execute the DescribeBackupVault service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupDescribeBackupVaultInput
 @see AWSBackupDescribeBackupVaultOutput
 */
- (void)describeBackupVault:(AWSBackupDescribeBackupVaultInput *)request completionHandler:(void (^ _Nullable)(AWSBackupDescribeBackupVaultOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns metadata associated with creating a copy of a resource.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCopyJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupDescribeCopyJobOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupDescribeCopyJobInput
 @see AWSBackupDescribeCopyJobOutput
 */
- (AWSTask<AWSBackupDescribeCopyJobOutput *> *)describeCopyJob:(AWSBackupDescribeCopyJobInput *)request;

/**
 <p>Returns metadata associated with creating a copy of a resource.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCopyJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupDescribeCopyJobInput
 @see AWSBackupDescribeCopyJobOutput
 */
- (void)describeCopyJob:(AWSBackupDescribeCopyJobInput *)request completionHandler:(void (^ _Nullable)(AWSBackupDescribeCopyJobOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a saved resource, including the last time it was backed up, its Amazon Resource Name (ARN), and the AWS service type of the saved resource.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProtectedResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupDescribeProtectedResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorResourceNotFound`.
 
 @see AWSBackupDescribeProtectedResourceInput
 @see AWSBackupDescribeProtectedResourceOutput
 */
- (AWSTask<AWSBackupDescribeProtectedResourceOutput *> *)describeProtectedResource:(AWSBackupDescribeProtectedResourceInput *)request;

/**
 <p>Returns information about a saved resource, including the last time it was backed up, its Amazon Resource Name (ARN), and the AWS service type of the saved resource.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProtectedResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorResourceNotFound`.
 
 @see AWSBackupDescribeProtectedResourceInput
 @see AWSBackupDescribeProtectedResourceOutput
 */
- (void)describeProtectedResource:(AWSBackupDescribeProtectedResourceInput *)request completionHandler:(void (^ _Nullable)(AWSBackupDescribeProtectedResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns metadata associated with a recovery point, including ID, status, encryption, and lifecycle.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRecoveryPoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupDescribeRecoveryPointOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupDescribeRecoveryPointInput
 @see AWSBackupDescribeRecoveryPointOutput
 */
- (AWSTask<AWSBackupDescribeRecoveryPointOutput *> *)describeRecoveryPoint:(AWSBackupDescribeRecoveryPointInput *)request;

/**
 <p>Returns metadata associated with a recovery point, including ID, status, encryption, and lifecycle.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRecoveryPoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupDescribeRecoveryPointInput
 @see AWSBackupDescribeRecoveryPointOutput
 */
- (void)describeRecoveryPoint:(AWSBackupDescribeRecoveryPointInput *)request completionHandler:(void (^ _Nullable)(AWSBackupDescribeRecoveryPointOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the current service opt-in settings for the Region. If the service has a value set to <code>true</code>, AWS Backup attempts to protect that service's resources in this Region, when included in an on-demand backup or scheduled backup plan. If the value is set to <code>false</code> for a service, AWS Backup does not attempt to protect that service's resources in this Region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRegionSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupDescribeRegionSettingsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupDescribeRegionSettingsInput
 @see AWSBackupDescribeRegionSettingsOutput
 */
- (AWSTask<AWSBackupDescribeRegionSettingsOutput *> *)describeRegionSettings:(AWSBackupDescribeRegionSettingsInput *)request;

/**
 <p>Returns the current service opt-in settings for the Region. If the service has a value set to <code>true</code>, AWS Backup attempts to protect that service's resources in this Region, when included in an on-demand backup or scheduled backup plan. If the value is set to <code>false</code> for a service, AWS Backup does not attempt to protect that service's resources in this Region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRegionSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupDescribeRegionSettingsInput
 @see AWSBackupDescribeRegionSettingsOutput
 */
- (void)describeRegionSettings:(AWSBackupDescribeRegionSettingsInput *)request completionHandler:(void (^ _Nullable)(AWSBackupDescribeRegionSettingsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns metadata associated with a restore job that is specified by a job ID.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRestoreJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupDescribeRestoreJobOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorDependencyFailure`.
 
 @see AWSBackupDescribeRestoreJobInput
 @see AWSBackupDescribeRestoreJobOutput
 */
- (AWSTask<AWSBackupDescribeRestoreJobOutput *> *)describeRestoreJob:(AWSBackupDescribeRestoreJobInput *)request;

/**
 <p>Returns metadata associated with a restore job that is specified by a job ID.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRestoreJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorDependencyFailure`.
 
 @see AWSBackupDescribeRestoreJobInput
 @see AWSBackupDescribeRestoreJobOutput
 */
- (void)describeRestoreJob:(AWSBackupDescribeRestoreJobInput *)request completionHandler:(void (^ _Nullable)(AWSBackupDescribeRestoreJobOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the backup plan that is specified by the plan ID as a backup template.</p>
 
 @param request A container for the necessary parameters to execute the ExportBackupPlanTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupExportBackupPlanTemplateOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorResourceNotFound`.
 
 @see AWSBackupExportBackupPlanTemplateInput
 @see AWSBackupExportBackupPlanTemplateOutput
 */
- (AWSTask<AWSBackupExportBackupPlanTemplateOutput *> *)exportBackupPlanTemplate:(AWSBackupExportBackupPlanTemplateInput *)request;

/**
 <p>Returns the backup plan that is specified by the plan ID as a backup template.</p>
 
 @param request A container for the necessary parameters to execute the ExportBackupPlanTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorResourceNotFound`.
 
 @see AWSBackupExportBackupPlanTemplateInput
 @see AWSBackupExportBackupPlanTemplateOutput
 */
- (void)exportBackupPlanTemplate:(AWSBackupExportBackupPlanTemplateInput *)request completionHandler:(void (^ _Nullable)(AWSBackupExportBackupPlanTemplateOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the body of a backup plan in JSON format, in addition to plan metadata.</p>
 
 @param request A container for the necessary parameters to execute the GetBackupPlan service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupGetBackupPlanOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupGetBackupPlanInput
 @see AWSBackupGetBackupPlanOutput
 */
- (AWSTask<AWSBackupGetBackupPlanOutput *> *)getBackupPlan:(AWSBackupGetBackupPlanInput *)request;

/**
 <p>Returns the body of a backup plan in JSON format, in addition to plan metadata.</p>
 
 @param request A container for the necessary parameters to execute the GetBackupPlan service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupGetBackupPlanInput
 @see AWSBackupGetBackupPlanOutput
 */
- (void)getBackupPlan:(AWSBackupGetBackupPlanInput *)request completionHandler:(void (^ _Nullable)(AWSBackupGetBackupPlanOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a valid JSON document specifying a backup plan or an error.</p>
 
 @param request A container for the necessary parameters to execute the GetBackupPlanFromJSON service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupGetBackupPlanFromJSONOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorLimitExceeded`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorInvalidRequest`.
 
 @see AWSBackupGetBackupPlanFromJSONInput
 @see AWSBackupGetBackupPlanFromJSONOutput
 */
- (AWSTask<AWSBackupGetBackupPlanFromJSONOutput *> *)getBackupPlanFromJSON:(AWSBackupGetBackupPlanFromJSONInput *)request;

/**
 <p>Returns a valid JSON document specifying a backup plan or an error.</p>
 
 @param request A container for the necessary parameters to execute the GetBackupPlanFromJSON service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorLimitExceeded`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorInvalidRequest`.
 
 @see AWSBackupGetBackupPlanFromJSONInput
 @see AWSBackupGetBackupPlanFromJSONOutput
 */
- (void)getBackupPlanFromJSON:(AWSBackupGetBackupPlanFromJSONInput *)request completionHandler:(void (^ _Nullable)(AWSBackupGetBackupPlanFromJSONOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the template specified by its <code>templateId</code> as a backup plan.</p>
 
 @param request A container for the necessary parameters to execute the GetBackupPlanFromTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupGetBackupPlanFromTemplateOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorResourceNotFound`.
 
 @see AWSBackupGetBackupPlanFromTemplateInput
 @see AWSBackupGetBackupPlanFromTemplateOutput
 */
- (AWSTask<AWSBackupGetBackupPlanFromTemplateOutput *> *)getBackupPlanFromTemplate:(AWSBackupGetBackupPlanFromTemplateInput *)request;

/**
 <p>Returns the template specified by its <code>templateId</code> as a backup plan.</p>
 
 @param request A container for the necessary parameters to execute the GetBackupPlanFromTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorResourceNotFound`.
 
 @see AWSBackupGetBackupPlanFromTemplateInput
 @see AWSBackupGetBackupPlanFromTemplateOutput
 */
- (void)getBackupPlanFromTemplate:(AWSBackupGetBackupPlanFromTemplateInput *)request completionHandler:(void (^ _Nullable)(AWSBackupGetBackupPlanFromTemplateOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns selection metadata and a document in JSON format that specifies a list of resources that are associated with a backup plan.</p>
 
 @param request A container for the necessary parameters to execute the GetBackupSelection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupGetBackupSelectionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupGetBackupSelectionInput
 @see AWSBackupGetBackupSelectionOutput
 */
- (AWSTask<AWSBackupGetBackupSelectionOutput *> *)getBackupSelection:(AWSBackupGetBackupSelectionInput *)request;

/**
 <p>Returns selection metadata and a document in JSON format that specifies a list of resources that are associated with a backup plan.</p>
 
 @param request A container for the necessary parameters to execute the GetBackupSelection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupGetBackupSelectionInput
 @see AWSBackupGetBackupSelectionOutput
 */
- (void)getBackupSelection:(AWSBackupGetBackupSelectionInput *)request completionHandler:(void (^ _Nullable)(AWSBackupGetBackupSelectionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the access policy document that is associated with the named backup vault.</p>
 
 @param request A container for the necessary parameters to execute the GetBackupVaultAccessPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupGetBackupVaultAccessPolicyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupGetBackupVaultAccessPolicyInput
 @see AWSBackupGetBackupVaultAccessPolicyOutput
 */
- (AWSTask<AWSBackupGetBackupVaultAccessPolicyOutput *> *)getBackupVaultAccessPolicy:(AWSBackupGetBackupVaultAccessPolicyInput *)request;

/**
 <p>Returns the access policy document that is associated with the named backup vault.</p>
 
 @param request A container for the necessary parameters to execute the GetBackupVaultAccessPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupGetBackupVaultAccessPolicyInput
 @see AWSBackupGetBackupVaultAccessPolicyOutput
 */
- (void)getBackupVaultAccessPolicy:(AWSBackupGetBackupVaultAccessPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSBackupGetBackupVaultAccessPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns event notifications for the specified backup vault.</p>
 
 @param request A container for the necessary parameters to execute the GetBackupVaultNotifications service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupGetBackupVaultNotificationsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupGetBackupVaultNotificationsInput
 @see AWSBackupGetBackupVaultNotificationsOutput
 */
- (AWSTask<AWSBackupGetBackupVaultNotificationsOutput *> *)getBackupVaultNotifications:(AWSBackupGetBackupVaultNotificationsInput *)request;

/**
 <p>Returns event notifications for the specified backup vault.</p>
 
 @param request A container for the necessary parameters to execute the GetBackupVaultNotifications service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupGetBackupVaultNotificationsInput
 @see AWSBackupGetBackupVaultNotificationsOutput
 */
- (void)getBackupVaultNotifications:(AWSBackupGetBackupVaultNotificationsInput *)request completionHandler:(void (^ _Nullable)(AWSBackupGetBackupVaultNotificationsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a set of metadata key-value pairs that were used to create the backup.</p>
 
 @param request A container for the necessary parameters to execute the GetRecoveryPointRestoreMetadata service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupGetRecoveryPointRestoreMetadataOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupGetRecoveryPointRestoreMetadataInput
 @see AWSBackupGetRecoveryPointRestoreMetadataOutput
 */
- (AWSTask<AWSBackupGetRecoveryPointRestoreMetadataOutput *> *)getRecoveryPointRestoreMetadata:(AWSBackupGetRecoveryPointRestoreMetadataInput *)request;

/**
 <p>Returns a set of metadata key-value pairs that were used to create the backup.</p>
 
 @param request A container for the necessary parameters to execute the GetRecoveryPointRestoreMetadata service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupGetRecoveryPointRestoreMetadataInput
 @see AWSBackupGetRecoveryPointRestoreMetadataOutput
 */
- (void)getRecoveryPointRestoreMetadata:(AWSBackupGetRecoveryPointRestoreMetadataInput *)request completionHandler:(void (^ _Nullable)(AWSBackupGetRecoveryPointRestoreMetadataOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the AWS resource types supported by AWS Backup.</p>
 
 @param request A container for the necessary parameters to execute the GetSupportedResourceTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupGetSupportedResourceTypesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorServiceUnavailable`.
 
 @see AWSRequest
 @see AWSBackupGetSupportedResourceTypesOutput
 */
- (AWSTask<AWSBackupGetSupportedResourceTypesOutput *> *)getSupportedResourceTypes:(AWSRequest *)request;

/**
 <p>Returns the AWS resource types supported by AWS Backup.</p>
 
 @param request A container for the necessary parameters to execute the GetSupportedResourceTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorServiceUnavailable`.
 
 @see AWSRequest
 @see AWSBackupGetSupportedResourceTypesOutput
 */
- (void)getSupportedResourceTypes:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSBackupGetSupportedResourceTypesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns metadata about your backup jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListBackupJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupListBackupJobsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupListBackupJobsInput
 @see AWSBackupListBackupJobsOutput
 */
- (AWSTask<AWSBackupListBackupJobsOutput *> *)listBackupJobs:(AWSBackupListBackupJobsInput *)request;

/**
 <p>Returns metadata about your backup jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListBackupJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupListBackupJobsInput
 @see AWSBackupListBackupJobsOutput
 */
- (void)listBackupJobs:(AWSBackupListBackupJobsInput *)request completionHandler:(void (^ _Nullable)(AWSBackupListBackupJobsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns metadata of your saved backup plan templates, including the template ID, name, and the creation and deletion dates.</p>
 
 @param request A container for the necessary parameters to execute the ListBackupPlanTemplates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupListBackupPlanTemplatesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorResourceNotFound`.
 
 @see AWSBackupListBackupPlanTemplatesInput
 @see AWSBackupListBackupPlanTemplatesOutput
 */
- (AWSTask<AWSBackupListBackupPlanTemplatesOutput *> *)listBackupPlanTemplates:(AWSBackupListBackupPlanTemplatesInput *)request;

/**
 <p>Returns metadata of your saved backup plan templates, including the template ID, name, and the creation and deletion dates.</p>
 
 @param request A container for the necessary parameters to execute the ListBackupPlanTemplates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorResourceNotFound`.
 
 @see AWSBackupListBackupPlanTemplatesInput
 @see AWSBackupListBackupPlanTemplatesOutput
 */
- (void)listBackupPlanTemplates:(AWSBackupListBackupPlanTemplatesInput *)request completionHandler:(void (^ _Nullable)(AWSBackupListBackupPlanTemplatesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns version metadata of your backup plans, including Amazon Resource Names (ARNs), backup plan IDs, creation and deletion dates, plan names, and version IDs.</p>
 
 @param request A container for the necessary parameters to execute the ListBackupPlanVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupListBackupPlanVersionsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupListBackupPlanVersionsInput
 @see AWSBackupListBackupPlanVersionsOutput
 */
- (AWSTask<AWSBackupListBackupPlanVersionsOutput *> *)listBackupPlanVersions:(AWSBackupListBackupPlanVersionsInput *)request;

/**
 <p>Returns version metadata of your backup plans, including Amazon Resource Names (ARNs), backup plan IDs, creation and deletion dates, plan names, and version IDs.</p>
 
 @param request A container for the necessary parameters to execute the ListBackupPlanVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupListBackupPlanVersionsInput
 @see AWSBackupListBackupPlanVersionsOutput
 */
- (void)listBackupPlanVersions:(AWSBackupListBackupPlanVersionsInput *)request completionHandler:(void (^ _Nullable)(AWSBackupListBackupPlanVersionsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns metadata of your saved backup plans, including Amazon Resource Names (ARNs), plan IDs, creation and deletion dates, version IDs, plan names, and creator request IDs.</p>
 
 @param request A container for the necessary parameters to execute the ListBackupPlans service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupListBackupPlansOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupListBackupPlansInput
 @see AWSBackupListBackupPlansOutput
 */
- (AWSTask<AWSBackupListBackupPlansOutput *> *)listBackupPlans:(AWSBackupListBackupPlansInput *)request;

/**
 <p>Returns metadata of your saved backup plans, including Amazon Resource Names (ARNs), plan IDs, creation and deletion dates, version IDs, plan names, and creator request IDs.</p>
 
 @param request A container for the necessary parameters to execute the ListBackupPlans service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupListBackupPlansInput
 @see AWSBackupListBackupPlansOutput
 */
- (void)listBackupPlans:(AWSBackupListBackupPlansInput *)request completionHandler:(void (^ _Nullable)(AWSBackupListBackupPlansOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an array containing metadata of the resources associated with the target backup plan.</p>
 
 @param request A container for the necessary parameters to execute the ListBackupSelections service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupListBackupSelectionsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupListBackupSelectionsInput
 @see AWSBackupListBackupSelectionsOutput
 */
- (AWSTask<AWSBackupListBackupSelectionsOutput *> *)listBackupSelections:(AWSBackupListBackupSelectionsInput *)request;

/**
 <p>Returns an array containing metadata of the resources associated with the target backup plan.</p>
 
 @param request A container for the necessary parameters to execute the ListBackupSelections service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupListBackupSelectionsInput
 @see AWSBackupListBackupSelectionsOutput
 */
- (void)listBackupSelections:(AWSBackupListBackupSelectionsInput *)request completionHandler:(void (^ _Nullable)(AWSBackupListBackupSelectionsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of recovery point storage containers along with information about them.</p>
 
 @param request A container for the necessary parameters to execute the ListBackupVaults service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupListBackupVaultsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupListBackupVaultsInput
 @see AWSBackupListBackupVaultsOutput
 */
- (AWSTask<AWSBackupListBackupVaultsOutput *> *)listBackupVaults:(AWSBackupListBackupVaultsInput *)request;

/**
 <p>Returns a list of recovery point storage containers along with information about them.</p>
 
 @param request A container for the necessary parameters to execute the ListBackupVaults service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupListBackupVaultsInput
 @see AWSBackupListBackupVaultsOutput
 */
- (void)listBackupVaults:(AWSBackupListBackupVaultsInput *)request completionHandler:(void (^ _Nullable)(AWSBackupListBackupVaultsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns metadata about your copy jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListCopyJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupListCopyJobsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupListCopyJobsInput
 @see AWSBackupListCopyJobsOutput
 */
- (AWSTask<AWSBackupListCopyJobsOutput *> *)listCopyJobs:(AWSBackupListCopyJobsInput *)request;

/**
 <p>Returns metadata about your copy jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListCopyJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupListCopyJobsInput
 @see AWSBackupListCopyJobsOutput
 */
- (void)listCopyJobs:(AWSBackupListCopyJobsInput *)request completionHandler:(void (^ _Nullable)(AWSBackupListCopyJobsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an array of resources successfully backed up by AWS Backup, including the time the resource was saved, an Amazon Resource Name (ARN) of the resource, and a resource type.</p>
 
 @param request A container for the necessary parameters to execute the ListProtectedResources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupListProtectedResourcesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupListProtectedResourcesInput
 @see AWSBackupListProtectedResourcesOutput
 */
- (AWSTask<AWSBackupListProtectedResourcesOutput *> *)listProtectedResources:(AWSBackupListProtectedResourcesInput *)request;

/**
 <p>Returns an array of resources successfully backed up by AWS Backup, including the time the resource was saved, an Amazon Resource Name (ARN) of the resource, and a resource type.</p>
 
 @param request A container for the necessary parameters to execute the ListProtectedResources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupListProtectedResourcesInput
 @see AWSBackupListProtectedResourcesOutput
 */
- (void)listProtectedResources:(AWSBackupListProtectedResourcesInput *)request completionHandler:(void (^ _Nullable)(AWSBackupListProtectedResourcesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns detailed information about the recovery points stored in a backup vault.</p>
 
 @param request A container for the necessary parameters to execute the ListRecoveryPointsByBackupVault service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupListRecoveryPointsByBackupVaultOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupListRecoveryPointsByBackupVaultInput
 @see AWSBackupListRecoveryPointsByBackupVaultOutput
 */
- (AWSTask<AWSBackupListRecoveryPointsByBackupVaultOutput *> *)listRecoveryPointsByBackupVault:(AWSBackupListRecoveryPointsByBackupVaultInput *)request;

/**
 <p>Returns detailed information about the recovery points stored in a backup vault.</p>
 
 @param request A container for the necessary parameters to execute the ListRecoveryPointsByBackupVault service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupListRecoveryPointsByBackupVaultInput
 @see AWSBackupListRecoveryPointsByBackupVaultOutput
 */
- (void)listRecoveryPointsByBackupVault:(AWSBackupListRecoveryPointsByBackupVaultInput *)request completionHandler:(void (^ _Nullable)(AWSBackupListRecoveryPointsByBackupVaultOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns detailed information about recovery points of the type specified by a resource Amazon Resource Name (ARN).</p>
 
 @param request A container for the necessary parameters to execute the ListRecoveryPointsByResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupListRecoveryPointsByResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupListRecoveryPointsByResourceInput
 @see AWSBackupListRecoveryPointsByResourceOutput
 */
- (AWSTask<AWSBackupListRecoveryPointsByResourceOutput *> *)listRecoveryPointsByResource:(AWSBackupListRecoveryPointsByResourceInput *)request;

/**
 <p>Returns detailed information about recovery points of the type specified by a resource Amazon Resource Name (ARN).</p>
 
 @param request A container for the necessary parameters to execute the ListRecoveryPointsByResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupListRecoveryPointsByResourceInput
 @see AWSBackupListRecoveryPointsByResourceOutput
 */
- (void)listRecoveryPointsByResource:(AWSBackupListRecoveryPointsByResourceInput *)request completionHandler:(void (^ _Nullable)(AWSBackupListRecoveryPointsByResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of jobs that AWS Backup initiated to restore a saved resource, including metadata about the recovery process.</p>
 
 @param request A container for the necessary parameters to execute the ListRestoreJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupListRestoreJobsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupListRestoreJobsInput
 @see AWSBackupListRestoreJobsOutput
 */
- (AWSTask<AWSBackupListRestoreJobsOutput *> *)listRestoreJobs:(AWSBackupListRestoreJobsInput *)request;

/**
 <p>Returns a list of jobs that AWS Backup initiated to restore a saved resource, including metadata about the recovery process.</p>
 
 @param request A container for the necessary parameters to execute the ListRestoreJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupListRestoreJobsInput
 @see AWSBackupListRestoreJobsOutput
 */
- (void)listRestoreJobs:(AWSBackupListRestoreJobsInput *)request completionHandler:(void (^ _Nullable)(AWSBackupListRestoreJobsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of key-value pairs assigned to a target recovery point, backup plan, or backup vault.</p><note><p><code>ListTags</code> are currently only supported with Amazon EFS backups.</p></note>
 
 @param request A container for the necessary parameters to execute the ListTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupListTagsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupListTagsInput
 @see AWSBackupListTagsOutput
 */
- (AWSTask<AWSBackupListTagsOutput *> *)listTags:(AWSBackupListTagsInput *)request;

/**
 <p>Returns a list of key-value pairs assigned to a target recovery point, backup plan, or backup vault.</p><note><p><code>ListTags</code> are currently only supported with Amazon EFS backups.</p></note>
 
 @param request A container for the necessary parameters to execute the ListTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupListTagsInput
 @see AWSBackupListTagsOutput
 */
- (void)listTags:(AWSBackupListTagsInput *)request completionHandler:(void (^ _Nullable)(AWSBackupListTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets a resource-based policy that is used to manage access permissions on the target backup vault. Requires a backup vault name and an access policy document in JSON format.</p>
 
 @param request A container for the necessary parameters to execute the PutBackupVaultAccessPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupPutBackupVaultAccessPolicyInput
 */
- (AWSTask *)putBackupVaultAccessPolicy:(AWSBackupPutBackupVaultAccessPolicyInput *)request;

/**
 <p>Sets a resource-based policy that is used to manage access permissions on the target backup vault. Requires a backup vault name and an access policy document in JSON format.</p>
 
 @param request A container for the necessary parameters to execute the PutBackupVaultAccessPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupPutBackupVaultAccessPolicyInput
 */
- (void)putBackupVaultAccessPolicy:(AWSBackupPutBackupVaultAccessPolicyInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Turns on notifications on a backup vault for the specified topic and events.</p>
 
 @param request A container for the necessary parameters to execute the PutBackupVaultNotifications service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupPutBackupVaultNotificationsInput
 */
- (AWSTask *)putBackupVaultNotifications:(AWSBackupPutBackupVaultNotificationsInput *)request;

/**
 <p>Turns on notifications on a backup vault for the specified topic and events.</p>
 
 @param request A container for the necessary parameters to execute the PutBackupVaultNotifications service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupPutBackupVaultNotificationsInput
 */
- (void)putBackupVaultNotifications:(AWSBackupPutBackupVaultNotificationsInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Starts a job to create a one-time backup of the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the StartBackupJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupStartBackupJobOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorLimitExceeded`.
 
 @see AWSBackupStartBackupJobInput
 @see AWSBackupStartBackupJobOutput
 */
- (AWSTask<AWSBackupStartBackupJobOutput *> *)startBackupJob:(AWSBackupStartBackupJobInput *)request;

/**
 <p>Starts a job to create a one-time backup of the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the StartBackupJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorLimitExceeded`.
 
 @see AWSBackupStartBackupJobInput
 @see AWSBackupStartBackupJobOutput
 */
- (void)startBackupJob:(AWSBackupStartBackupJobInput *)request completionHandler:(void (^ _Nullable)(AWSBackupStartBackupJobOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a job to create a one-time copy of the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the StartCopyJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupStartCopyJobOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorLimitExceeded`.
 
 @see AWSBackupStartCopyJobInput
 @see AWSBackupStartCopyJobOutput
 */
- (AWSTask<AWSBackupStartCopyJobOutput *> *)startCopyJob:(AWSBackupStartCopyJobInput *)request;

/**
 <p>Starts a job to create a one-time copy of the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the StartCopyJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorLimitExceeded`.
 
 @see AWSBackupStartCopyJobInput
 @see AWSBackupStartCopyJobOutput
 */
- (void)startCopyJob:(AWSBackupStartCopyJobInput *)request completionHandler:(void (^ _Nullable)(AWSBackupStartCopyJobOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Recovers the saved resource identified by an Amazon Resource Name (ARN). </p><p>If the resource ARN is included in the request, then the last complete backup of that resource is recovered. If the ARN of a recovery point is supplied, then that recovery point is restored.</p>
 
 @param request A container for the necessary parameters to execute the StartRestoreJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupStartRestoreJobOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupStartRestoreJobInput
 @see AWSBackupStartRestoreJobOutput
 */
- (AWSTask<AWSBackupStartRestoreJobOutput *> *)startRestoreJob:(AWSBackupStartRestoreJobInput *)request;

/**
 <p>Recovers the saved resource identified by an Amazon Resource Name (ARN). </p><p>If the resource ARN is included in the request, then the last complete backup of that resource is recovered. If the ARN of a recovery point is supplied, then that recovery point is restored.</p>
 
 @param request A container for the necessary parameters to execute the StartRestoreJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupStartRestoreJobInput
 @see AWSBackupStartRestoreJobOutput
 */
- (void)startRestoreJob:(AWSBackupStartRestoreJobInput *)request completionHandler:(void (^ _Nullable)(AWSBackupStartRestoreJobOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attempts to cancel a job to create a one-time backup of a resource.</p>
 
 @param request A container for the necessary parameters to execute the StopBackupJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorInvalidRequest`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupStopBackupJobInput
 */
- (AWSTask *)stopBackupJob:(AWSBackupStopBackupJobInput *)request;

/**
 <p>Attempts to cancel a job to create a one-time backup of a resource.</p>
 
 @param request A container for the necessary parameters to execute the StopBackupJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorInvalidRequest`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupStopBackupJobInput
 */
- (void)stopBackupJob:(AWSBackupStopBackupJobInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Assigns a set of key-value pairs to a recovery point, backup plan, or backup vault identified by an Amazon Resource Name (ARN).</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorLimitExceeded`.
 
 @see AWSBackupTagResourceInput
 */
- (AWSTask *)tagResource:(AWSBackupTagResourceInput *)request;

/**
 <p>Assigns a set of key-value pairs to a recovery point, backup plan, or backup vault identified by an Amazon Resource Name (ARN).</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorLimitExceeded`.
 
 @see AWSBackupTagResourceInput
 */
- (void)tagResource:(AWSBackupTagResourceInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes a set of key-value pairs from a recovery point, backup plan, or backup vault identified by an Amazon Resource Name (ARN)</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupUntagResourceInput
 */
- (AWSTask *)untagResource:(AWSBackupUntagResourceInput *)request;

/**
 <p>Removes a set of key-value pairs from a recovery point, backup plan, or backup vault identified by an Amazon Resource Name (ARN)</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupUntagResourceInput
 */
- (void)untagResource:(AWSBackupUntagResourceInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Replaces the body of a saved backup plan identified by its <code>backupPlanId</code> with the input document in JSON format. The new version is uniquely identified by a <code>VersionId</code>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateBackupPlan service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupUpdateBackupPlanOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupUpdateBackupPlanInput
 @see AWSBackupUpdateBackupPlanOutput
 */
- (AWSTask<AWSBackupUpdateBackupPlanOutput *> *)updateBackupPlan:(AWSBackupUpdateBackupPlanInput *)request;

/**
 <p>Replaces the body of a saved backup plan identified by its <code>backupPlanId</code> with the input document in JSON format. The new version is uniquely identified by a <code>VersionId</code>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateBackupPlan service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupUpdateBackupPlanInput
 @see AWSBackupUpdateBackupPlanOutput
 */
- (void)updateBackupPlan:(AWSBackupUpdateBackupPlanInput *)request completionHandler:(void (^ _Nullable)(AWSBackupUpdateBackupPlanOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the transition lifecycle of a recovery point.</p><p>The lifecycle defines when a protected resource is transitioned to cold storage and when it expires. AWS Backup transitions and expires backups automatically according to the lifecycle that you define. </p><p>Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days. Therefore, the “expire after days” setting must be 90 days greater than the “transition to cold after days” setting. The “transition to cold after days” setting cannot be changed after a backup has been transitioned to cold. </p>
 
 @param request A container for the necessary parameters to execute the UpdateRecoveryPointLifecycle service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSBackupUpdateRecoveryPointLifecycleOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupUpdateRecoveryPointLifecycleInput
 @see AWSBackupUpdateRecoveryPointLifecycleOutput
 */
- (AWSTask<AWSBackupUpdateRecoveryPointLifecycleOutput *> *)updateRecoveryPointLifecycle:(AWSBackupUpdateRecoveryPointLifecycleInput *)request;

/**
 <p>Sets the transition lifecycle of a recovery point.</p><p>The lifecycle defines when a protected resource is transitioned to cold storage and when it expires. AWS Backup transitions and expires backups automatically according to the lifecycle that you define. </p><p>Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days. Therefore, the “expire after days” setting must be 90 days greater than the “transition to cold after days” setting. The “transition to cold after days” setting cannot be changed after a backup has been transitioned to cold. </p>
 
 @param request A container for the necessary parameters to execute the UpdateRecoveryPointLifecycle service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorResourceNotFound`, `AWSBackupErrorInvalidParameterValue`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorServiceUnavailable`.
 
 @see AWSBackupUpdateRecoveryPointLifecycleInput
 @see AWSBackupUpdateRecoveryPointLifecycleOutput
 */
- (void)updateRecoveryPointLifecycle:(AWSBackupUpdateRecoveryPointLifecycleInput *)request completionHandler:(void (^ _Nullable)(AWSBackupUpdateRecoveryPointLifecycleOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the current service opt-in settings for the Region. If the service has a value set to <code>true</code>, AWS Backup attempts to protect that service's resources in this Region, when included in an on-demand backup or scheduled backup plan. If the value is set to <code>false</code> for a service, AWS Backup does not attempt to protect that service's resources in this Region.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRegionSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorInvalidParameterValue`.
 
 @see AWSBackupUpdateRegionSettingsInput
 */
- (AWSTask *)updateRegionSettings:(AWSBackupUpdateRegionSettingsInput *)request;

/**
 <p>Updates the current service opt-in settings for the Region. If the service has a value set to <code>true</code>, AWS Backup attempts to protect that service's resources in this Region, when included in an on-demand backup or scheduled backup plan. If the value is set to <code>false</code> for a service, AWS Backup does not attempt to protect that service's resources in this Region.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRegionSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSBackupErrorDomain` domain and the following error code: `AWSBackupErrorServiceUnavailable`, `AWSBackupErrorMissingParameterValue`, `AWSBackupErrorInvalidParameterValue`.
 
 @see AWSBackupUpdateRegionSettingsInput
 */
- (void)updateRegionSettings:(AWSBackupUpdateRegionSettingsInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
