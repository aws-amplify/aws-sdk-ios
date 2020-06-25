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
#import "AWSGlueModel.h"
#import "AWSGlueResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSGlue
FOUNDATION_EXPORT NSString *const AWSGlueSDKVersion;

/**
 <fullname>AWS Glue</fullname><p>Defines the public endpoint for the AWS Glue service.</p>
 */
@interface AWSGlue : AWSService

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

     let Glue = AWSGlue.default()

 *Objective-C*

     AWSGlue *Glue = [AWSGlue defaultGlue];

 @return The default service client.
 */
+ (instancetype)defaultGlue;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSGlue.register(with: configuration!, forKey: "USWest2Glue")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSGlue registerGlueWithConfiguration:configuration forKey:@"USWest2Glue"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Glue = AWSGlue(forKey: "USWest2Glue")

 *Objective-C*

     AWSGlue *Glue = [AWSGlue GlueForKey:@"USWest2Glue"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerGlueWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerGlueWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSGlue.register(with: configuration!, forKey: "USWest2Glue")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSGlue registerGlueWithConfiguration:configuration forKey:@"USWest2Glue"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Glue = AWSGlue(forKey: "USWest2Glue")

 *Objective-C*

     AWSGlue *Glue = [AWSGlue GlueForKey:@"USWest2Glue"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)GlueForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeGlueForKey:(NSString *)key;

/**
 <p>Creates one or more partitions in a batch operation.</p>
 
 @param request A container for the necessary parameters to execute the BatchCreatePartition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueBatchCreatePartitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorAlreadyExists`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorInternalService`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueBatchCreatePartitionRequest
 @see AWSGlueBatchCreatePartitionResponse
 */
- (AWSTask<AWSGlueBatchCreatePartitionResponse *> *)batchCreatePartition:(AWSGlueBatchCreatePartitionRequest *)request;

/**
 <p>Creates one or more partitions in a batch operation.</p>
 
 @param request A container for the necessary parameters to execute the BatchCreatePartition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorAlreadyExists`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorInternalService`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueBatchCreatePartitionRequest
 @see AWSGlueBatchCreatePartitionResponse
 */
- (void)batchCreatePartition:(AWSGlueBatchCreatePartitionRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueBatchCreatePartitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a list of connection definitions from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeleteConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueBatchDeleteConnectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueBatchDeleteConnectionRequest
 @see AWSGlueBatchDeleteConnectionResponse
 */
- (AWSTask<AWSGlueBatchDeleteConnectionResponse *> *)batchDeleteConnection:(AWSGlueBatchDeleteConnectionRequest *)request;

/**
 <p>Deletes a list of connection definitions from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeleteConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueBatchDeleteConnectionRequest
 @see AWSGlueBatchDeleteConnectionResponse
 */
- (void)batchDeleteConnection:(AWSGlueBatchDeleteConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueBatchDeleteConnectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes one or more partitions in a batch operation.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeletePartition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueBatchDeletePartitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueBatchDeletePartitionRequest
 @see AWSGlueBatchDeletePartitionResponse
 */
- (AWSTask<AWSGlueBatchDeletePartitionResponse *> *)batchDeletePartition:(AWSGlueBatchDeletePartitionRequest *)request;

/**
 <p>Deletes one or more partitions in a batch operation.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeletePartition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueBatchDeletePartitionRequest
 @see AWSGlueBatchDeletePartitionResponse
 */
- (void)batchDeletePartition:(AWSGlueBatchDeletePartitionRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueBatchDeletePartitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes multiple tables at once.</p><note><p>After completing this operation, you no longer have access to the table versions and partitions that belong to the deleted table. AWS Glue deletes these "orphaned" resources asynchronously in a timely manner, at the discretion of the service.</p><p>To ensure the immediate deletion of all related resources, before calling <code>BatchDeleteTable</code>, use <code>DeleteTableVersion</code> or <code>BatchDeleteTableVersion</code>, and <code>DeletePartition</code> or <code>BatchDeletePartition</code>, to delete any resources that belong to the table.</p></note>
 
 @param request A container for the necessary parameters to execute the BatchDeleteTable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueBatchDeleteTableResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueBatchDeleteTableRequest
 @see AWSGlueBatchDeleteTableResponse
 */
- (AWSTask<AWSGlueBatchDeleteTableResponse *> *)batchDeleteTable:(AWSGlueBatchDeleteTableRequest *)request;

/**
 <p>Deletes multiple tables at once.</p><note><p>After completing this operation, you no longer have access to the table versions and partitions that belong to the deleted table. AWS Glue deletes these "orphaned" resources asynchronously in a timely manner, at the discretion of the service.</p><p>To ensure the immediate deletion of all related resources, before calling <code>BatchDeleteTable</code>, use <code>DeleteTableVersion</code> or <code>BatchDeleteTableVersion</code>, and <code>DeletePartition</code> or <code>BatchDeletePartition</code>, to delete any resources that belong to the table.</p></note>
 
 @param request A container for the necessary parameters to execute the BatchDeleteTable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueBatchDeleteTableRequest
 @see AWSGlueBatchDeleteTableResponse
 */
- (void)batchDeleteTable:(AWSGlueBatchDeleteTableRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueBatchDeleteTableResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified batch of versions of a table.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeleteTableVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueBatchDeleteTableVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueBatchDeleteTableVersionRequest
 @see AWSGlueBatchDeleteTableVersionResponse
 */
- (AWSTask<AWSGlueBatchDeleteTableVersionResponse *> *)batchDeleteTableVersion:(AWSGlueBatchDeleteTableVersionRequest *)request;

/**
 <p>Deletes a specified batch of versions of a table.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeleteTableVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueBatchDeleteTableVersionRequest
 @see AWSGlueBatchDeleteTableVersionResponse
 */
- (void)batchDeleteTableVersion:(AWSGlueBatchDeleteTableVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueBatchDeleteTableVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of resource metadata for a given list of crawler names. After calling the <code>ListCrawlers</code> operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetCrawlers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueBatchGetCrawlersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueBatchGetCrawlersRequest
 @see AWSGlueBatchGetCrawlersResponse
 */
- (AWSTask<AWSGlueBatchGetCrawlersResponse *> *)batchGetCrawlers:(AWSGlueBatchGetCrawlersRequest *)request;

/**
 <p>Returns a list of resource metadata for a given list of crawler names. After calling the <code>ListCrawlers</code> operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetCrawlers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueBatchGetCrawlersRequest
 @see AWSGlueBatchGetCrawlersResponse
 */
- (void)batchGetCrawlers:(AWSGlueBatchGetCrawlersRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueBatchGetCrawlersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of resource metadata for a given list of development endpoint names. After calling the <code>ListDevEndpoints</code> operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetDevEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueBatchGetDevEndpointsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorAccessDenied`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`.
 
 @see AWSGlueBatchGetDevEndpointsRequest
 @see AWSGlueBatchGetDevEndpointsResponse
 */
- (AWSTask<AWSGlueBatchGetDevEndpointsResponse *> *)batchGetDevEndpoints:(AWSGlueBatchGetDevEndpointsRequest *)request;

/**
 <p>Returns a list of resource metadata for a given list of development endpoint names. After calling the <code>ListDevEndpoints</code> operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetDevEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorAccessDenied`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`.
 
 @see AWSGlueBatchGetDevEndpointsRequest
 @see AWSGlueBatchGetDevEndpointsResponse
 */
- (void)batchGetDevEndpoints:(AWSGlueBatchGetDevEndpointsRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueBatchGetDevEndpointsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of resource metadata for a given list of job names. After calling the <code>ListJobs</code> operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags. </p>
 
 @param request A container for the necessary parameters to execute the BatchGetJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueBatchGetJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`.
 
 @see AWSGlueBatchGetJobsRequest
 @see AWSGlueBatchGetJobsResponse
 */
- (AWSTask<AWSGlueBatchGetJobsResponse *> *)batchGetJobs:(AWSGlueBatchGetJobsRequest *)request;

/**
 <p>Returns a list of resource metadata for a given list of job names. After calling the <code>ListJobs</code> operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags. </p>
 
 @param request A container for the necessary parameters to execute the BatchGetJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`.
 
 @see AWSGlueBatchGetJobsRequest
 @see AWSGlueBatchGetJobsResponse
 */
- (void)batchGetJobs:(AWSGlueBatchGetJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueBatchGetJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves partitions in a batch request.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetPartition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueBatchGetPartitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueBatchGetPartitionRequest
 @see AWSGlueBatchGetPartitionResponse
 */
- (AWSTask<AWSGlueBatchGetPartitionResponse *> *)batchGetPartition:(AWSGlueBatchGetPartitionRequest *)request;

/**
 <p>Retrieves partitions in a batch request.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetPartition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueBatchGetPartitionRequest
 @see AWSGlueBatchGetPartitionResponse
 */
- (void)batchGetPartition:(AWSGlueBatchGetPartitionRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueBatchGetPartitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of resource metadata for a given list of trigger names. After calling the <code>ListTriggers</code> operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetTriggers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueBatchGetTriggersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`.
 
 @see AWSGlueBatchGetTriggersRequest
 @see AWSGlueBatchGetTriggersResponse
 */
- (AWSTask<AWSGlueBatchGetTriggersResponse *> *)batchGetTriggers:(AWSGlueBatchGetTriggersRequest *)request;

/**
 <p>Returns a list of resource metadata for a given list of trigger names. After calling the <code>ListTriggers</code> operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetTriggers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`.
 
 @see AWSGlueBatchGetTriggersRequest
 @see AWSGlueBatchGetTriggersResponse
 */
- (void)batchGetTriggers:(AWSGlueBatchGetTriggersRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueBatchGetTriggersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of resource metadata for a given list of workflow names. After calling the <code>ListWorkflows</code> operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetWorkflows service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueBatchGetWorkflowsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`.
 
 @see AWSGlueBatchGetWorkflowsRequest
 @see AWSGlueBatchGetWorkflowsResponse
 */
- (AWSTask<AWSGlueBatchGetWorkflowsResponse *> *)batchGetWorkflows:(AWSGlueBatchGetWorkflowsRequest *)request;

/**
 <p>Returns a list of resource metadata for a given list of workflow names. After calling the <code>ListWorkflows</code> operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetWorkflows service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`.
 
 @see AWSGlueBatchGetWorkflowsRequest
 @see AWSGlueBatchGetWorkflowsResponse
 */
- (void)batchGetWorkflows:(AWSGlueBatchGetWorkflowsRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueBatchGetWorkflowsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops one or more job runs for a specified job definition.</p>
 
 @param request A container for the necessary parameters to execute the BatchStopJobRun service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueBatchStopJobRunResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueBatchStopJobRunRequest
 @see AWSGlueBatchStopJobRunResponse
 */
- (AWSTask<AWSGlueBatchStopJobRunResponse *> *)batchStopJobRun:(AWSGlueBatchStopJobRunRequest *)request;

/**
 <p>Stops one or more job runs for a specified job definition.</p>
 
 @param request A container for the necessary parameters to execute the BatchStopJobRun service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueBatchStopJobRunRequest
 @see AWSGlueBatchStopJobRunResponse
 */
- (void)batchStopJobRun:(AWSGlueBatchStopJobRunRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueBatchStopJobRunResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels (stops) a task run. Machine learning task runs are asynchronous tasks that AWS Glue runs on your behalf as part of various machine learning workflows. You can cancel a machine learning task run at any time by calling <code>CancelMLTaskRun</code> with a task run's parent transform's <code>TransformID</code> and the task run's <code>TaskRunId</code>. </p>
 
 @param request A container for the necessary parameters to execute the CancelMLTaskRun service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueCancelMLTaskRunResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`.
 
 @see AWSGlueCancelMLTaskRunRequest
 @see AWSGlueCancelMLTaskRunResponse
 */
- (AWSTask<AWSGlueCancelMLTaskRunResponse *> *)cancelMLTaskRun:(AWSGlueCancelMLTaskRunRequest *)request;

/**
 <p>Cancels (stops) a task run. Machine learning task runs are asynchronous tasks that AWS Glue runs on your behalf as part of various machine learning workflows. You can cancel a machine learning task run at any time by calling <code>CancelMLTaskRun</code> with a task run's parent transform's <code>TransformID</code> and the task run's <code>TaskRunId</code>. </p>
 
 @param request A container for the necessary parameters to execute the CancelMLTaskRun service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`.
 
 @see AWSGlueCancelMLTaskRunRequest
 @see AWSGlueCancelMLTaskRunResponse
 */
- (void)cancelMLTaskRun:(AWSGlueCancelMLTaskRunRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueCancelMLTaskRunResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a classifier in the user's account. This can be a <code>GrokClassifier</code>, an <code>XMLClassifier</code>, a <code>JsonClassifier</code>, or a <code>CsvClassifier</code>, depending on which field of the request is present.</p>
 
 @param request A container for the necessary parameters to execute the CreateClassifier service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueCreateClassifierResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorAlreadyExists`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueCreateClassifierRequest
 @see AWSGlueCreateClassifierResponse
 */
- (AWSTask<AWSGlueCreateClassifierResponse *> *)createClassifier:(AWSGlueCreateClassifierRequest *)request;

/**
 <p>Creates a classifier in the user's account. This can be a <code>GrokClassifier</code>, an <code>XMLClassifier</code>, a <code>JsonClassifier</code>, or a <code>CsvClassifier</code>, depending on which field of the request is present.</p>
 
 @param request A container for the necessary parameters to execute the CreateClassifier service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorAlreadyExists`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueCreateClassifierRequest
 @see AWSGlueCreateClassifierResponse
 */
- (void)createClassifier:(AWSGlueCreateClassifierRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueCreateClassifierResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a connection definition in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the CreateConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueCreateConnectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorAlreadyExists`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueCreateConnectionRequest
 @see AWSGlueCreateConnectionResponse
 */
- (AWSTask<AWSGlueCreateConnectionResponse *> *)createConnection:(AWSGlueCreateConnectionRequest *)request;

/**
 <p>Creates a connection definition in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the CreateConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorAlreadyExists`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueCreateConnectionRequest
 @see AWSGlueCreateConnectionResponse
 */
- (void)createConnection:(AWSGlueCreateConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueCreateConnectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new crawler with specified targets, role, configuration, and optional schedule. At least one crawl target must be specified, in the <code>s3Targets</code> field, the <code>jdbcTargets</code> field, or the <code>DynamoDBTargets</code> field.</p>
 
 @param request A container for the necessary parameters to execute the CreateCrawler service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueCreateCrawlerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorAlreadyExists`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorResourceNumberLimitExceeded`.
 
 @see AWSGlueCreateCrawlerRequest
 @see AWSGlueCreateCrawlerResponse
 */
- (AWSTask<AWSGlueCreateCrawlerResponse *> *)createCrawler:(AWSGlueCreateCrawlerRequest *)request;

/**
 <p>Creates a new crawler with specified targets, role, configuration, and optional schedule. At least one crawl target must be specified, in the <code>s3Targets</code> field, the <code>jdbcTargets</code> field, or the <code>DynamoDBTargets</code> field.</p>
 
 @param request A container for the necessary parameters to execute the CreateCrawler service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorAlreadyExists`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorResourceNumberLimitExceeded`.
 
 @see AWSGlueCreateCrawlerRequest
 @see AWSGlueCreateCrawlerResponse
 */
- (void)createCrawler:(AWSGlueCreateCrawlerRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueCreateCrawlerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new database in a Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the CreateDatabase service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueCreateDatabaseResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorAlreadyExists`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueCreateDatabaseRequest
 @see AWSGlueCreateDatabaseResponse
 */
- (AWSTask<AWSGlueCreateDatabaseResponse *> *)createDatabase:(AWSGlueCreateDatabaseRequest *)request;

/**
 <p>Creates a new database in a Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the CreateDatabase service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorAlreadyExists`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueCreateDatabaseRequest
 @see AWSGlueCreateDatabaseResponse
 */
- (void)createDatabase:(AWSGlueCreateDatabaseRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueCreateDatabaseResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new development endpoint.</p>
 
 @param request A container for the necessary parameters to execute the CreateDevEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueCreateDevEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorAccessDenied`, `AWSGlueErrorAlreadyExists`, `AWSGlueErrorIdempotentParameterMismatch`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorValidation`, `AWSGlueErrorResourceNumberLimitExceeded`.
 
 @see AWSGlueCreateDevEndpointRequest
 @see AWSGlueCreateDevEndpointResponse
 */
- (AWSTask<AWSGlueCreateDevEndpointResponse *> *)createDevEndpoint:(AWSGlueCreateDevEndpointRequest *)request;

/**
 <p>Creates a new development endpoint.</p>
 
 @param request A container for the necessary parameters to execute the CreateDevEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorAccessDenied`, `AWSGlueErrorAlreadyExists`, `AWSGlueErrorIdempotentParameterMismatch`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorValidation`, `AWSGlueErrorResourceNumberLimitExceeded`.
 
 @see AWSGlueCreateDevEndpointRequest
 @see AWSGlueCreateDevEndpointResponse
 */
- (void)createDevEndpoint:(AWSGlueCreateDevEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueCreateDevEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new job definition.</p>
 
 @param request A container for the necessary parameters to execute the CreateJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueCreateJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorIdempotentParameterMismatch`, `AWSGlueErrorAlreadyExists`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorConcurrentModification`.
 
 @see AWSGlueCreateJobRequest
 @see AWSGlueCreateJobResponse
 */
- (AWSTask<AWSGlueCreateJobResponse *> *)createJob:(AWSGlueCreateJobRequest *)request;

/**
 <p>Creates a new job definition.</p>
 
 @param request A container for the necessary parameters to execute the CreateJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorIdempotentParameterMismatch`, `AWSGlueErrorAlreadyExists`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorConcurrentModification`.
 
 @see AWSGlueCreateJobRequest
 @see AWSGlueCreateJobResponse
 */
- (void)createJob:(AWSGlueCreateJobRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueCreateJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an AWS Glue machine learning transform. This operation creates the transform and all the necessary parameters to train it.</p><p>Call this operation as the first step in the process of using a machine learning transform (such as the <code>FindMatches</code> transform) for deduplicating data. You can provide an optional <code>Description</code>, in addition to the parameters that you want to use for your algorithm.</p><p>You must also specify certain parameters for the tasks that AWS Glue runs on your behalf as part of learning from your data and creating a high-quality machine learning transform. These parameters include <code>Role</code>, and optionally, <code>AllocatedCapacity</code>, <code>Timeout</code>, and <code>MaxRetries</code>. For more information, see <a href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-jobs-job.html">Jobs</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateMLTransform service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueCreateMLTransformResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorAlreadyExists`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`, `AWSGlueErrorAccessDenied`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorIdempotentParameterMismatch`.
 
 @see AWSGlueCreateMLTransformRequest
 @see AWSGlueCreateMLTransformResponse
 */
- (AWSTask<AWSGlueCreateMLTransformResponse *> *)createMLTransform:(AWSGlueCreateMLTransformRequest *)request;

/**
 <p>Creates an AWS Glue machine learning transform. This operation creates the transform and all the necessary parameters to train it.</p><p>Call this operation as the first step in the process of using a machine learning transform (such as the <code>FindMatches</code> transform) for deduplicating data. You can provide an optional <code>Description</code>, in addition to the parameters that you want to use for your algorithm.</p><p>You must also specify certain parameters for the tasks that AWS Glue runs on your behalf as part of learning from your data and creating a high-quality machine learning transform. These parameters include <code>Role</code>, and optionally, <code>AllocatedCapacity</code>, <code>Timeout</code>, and <code>MaxRetries</code>. For more information, see <a href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-jobs-job.html">Jobs</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateMLTransform service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorAlreadyExists`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`, `AWSGlueErrorAccessDenied`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorIdempotentParameterMismatch`.
 
 @see AWSGlueCreateMLTransformRequest
 @see AWSGlueCreateMLTransformResponse
 */
- (void)createMLTransform:(AWSGlueCreateMLTransformRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueCreateMLTransformResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new partition.</p>
 
 @param request A container for the necessary parameters to execute the CreatePartition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueCreatePartitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorAlreadyExists`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorInternalService`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueCreatePartitionRequest
 @see AWSGlueCreatePartitionResponse
 */
- (AWSTask<AWSGlueCreatePartitionResponse *> *)createPartition:(AWSGlueCreatePartitionRequest *)request;

/**
 <p>Creates a new partition.</p>
 
 @param request A container for the necessary parameters to execute the CreatePartition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorAlreadyExists`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorInternalService`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueCreatePartitionRequest
 @see AWSGlueCreatePartitionResponse
 */
- (void)createPartition:(AWSGlueCreatePartitionRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueCreatePartitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Transforms a directed acyclic graph (DAG) into code.</p>
 
 @param request A container for the necessary parameters to execute the CreateScript service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueCreateScriptResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueCreateScriptRequest
 @see AWSGlueCreateScriptResponse
 */
- (AWSTask<AWSGlueCreateScriptResponse *> *)createScript:(AWSGlueCreateScriptRequest *)request;

/**
 <p>Transforms a directed acyclic graph (DAG) into code.</p>
 
 @param request A container for the necessary parameters to execute the CreateScript service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueCreateScriptRequest
 @see AWSGlueCreateScriptResponse
 */
- (void)createScript:(AWSGlueCreateScriptRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueCreateScriptResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new security configuration. A security configuration is a set of security properties that can be used by AWS Glue. You can use a security configuration to encrypt data at rest. For information about using security configurations in AWS Glue, see <a href="https://docs.aws.amazon.com/glue/latest/dg/encryption-security-configuration.html">Encrypting Data Written by Crawlers, Jobs, and Development Endpoints</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSecurityConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueCreateSecurityConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorAlreadyExists`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorResourceNumberLimitExceeded`.
 
 @see AWSGlueCreateSecurityConfigurationRequest
 @see AWSGlueCreateSecurityConfigurationResponse
 */
- (AWSTask<AWSGlueCreateSecurityConfigurationResponse *> *)createSecurityConfiguration:(AWSGlueCreateSecurityConfigurationRequest *)request;

/**
 <p>Creates a new security configuration. A security configuration is a set of security properties that can be used by AWS Glue. You can use a security configuration to encrypt data at rest. For information about using security configurations in AWS Glue, see <a href="https://docs.aws.amazon.com/glue/latest/dg/encryption-security-configuration.html">Encrypting Data Written by Crawlers, Jobs, and Development Endpoints</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSecurityConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorAlreadyExists`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorResourceNumberLimitExceeded`.
 
 @see AWSGlueCreateSecurityConfigurationRequest
 @see AWSGlueCreateSecurityConfigurationResponse
 */
- (void)createSecurityConfiguration:(AWSGlueCreateSecurityConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueCreateSecurityConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new table definition in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the CreateTable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueCreateTableResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorAlreadyExists`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueCreateTableRequest
 @see AWSGlueCreateTableResponse
 */
- (AWSTask<AWSGlueCreateTableResponse *> *)createTable:(AWSGlueCreateTableRequest *)request;

/**
 <p>Creates a new table definition in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the CreateTable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorAlreadyExists`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueCreateTableRequest
 @see AWSGlueCreateTableResponse
 */
- (void)createTable:(AWSGlueCreateTableRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueCreateTableResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new trigger.</p>
 
 @param request A container for the necessary parameters to execute the CreateTrigger service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueCreateTriggerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorAlreadyExists`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorIdempotentParameterMismatch`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorConcurrentModification`.
 
 @see AWSGlueCreateTriggerRequest
 @see AWSGlueCreateTriggerResponse
 */
- (AWSTask<AWSGlueCreateTriggerResponse *> *)createTrigger:(AWSGlueCreateTriggerRequest *)request;

/**
 <p>Creates a new trigger.</p>
 
 @param request A container for the necessary parameters to execute the CreateTrigger service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorAlreadyExists`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorIdempotentParameterMismatch`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorConcurrentModification`.
 
 @see AWSGlueCreateTriggerRequest
 @see AWSGlueCreateTriggerResponse
 */
- (void)createTrigger:(AWSGlueCreateTriggerRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueCreateTriggerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new function definition in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the CreateUserDefinedFunction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueCreateUserDefinedFunctionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorAlreadyExists`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueCreateUserDefinedFunctionRequest
 @see AWSGlueCreateUserDefinedFunctionResponse
 */
- (AWSTask<AWSGlueCreateUserDefinedFunctionResponse *> *)createUserDefinedFunction:(AWSGlueCreateUserDefinedFunctionRequest *)request;

/**
 <p>Creates a new function definition in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the CreateUserDefinedFunction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorAlreadyExists`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueCreateUserDefinedFunctionRequest
 @see AWSGlueCreateUserDefinedFunctionResponse
 */
- (void)createUserDefinedFunction:(AWSGlueCreateUserDefinedFunctionRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueCreateUserDefinedFunctionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new workflow.</p>
 
 @param request A container for the necessary parameters to execute the CreateWorkflow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueCreateWorkflowResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorAlreadyExists`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorConcurrentModification`.
 
 @see AWSGlueCreateWorkflowRequest
 @see AWSGlueCreateWorkflowResponse
 */
- (AWSTask<AWSGlueCreateWorkflowResponse *> *)createWorkflow:(AWSGlueCreateWorkflowRequest *)request;

/**
 <p>Creates a new workflow.</p>
 
 @param request A container for the necessary parameters to execute the CreateWorkflow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorAlreadyExists`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorConcurrentModification`.
 
 @see AWSGlueCreateWorkflowRequest
 @see AWSGlueCreateWorkflowResponse
 */
- (void)createWorkflow:(AWSGlueCreateWorkflowRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueCreateWorkflowResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a classifier from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the DeleteClassifier service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueDeleteClassifierResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueDeleteClassifierRequest
 @see AWSGlueDeleteClassifierResponse
 */
- (AWSTask<AWSGlueDeleteClassifierResponse *> *)deleteClassifier:(AWSGlueDeleteClassifierRequest *)request;

/**
 <p>Removes a classifier from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the DeleteClassifier service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueDeleteClassifierRequest
 @see AWSGlueDeleteClassifierResponse
 */
- (void)deleteClassifier:(AWSGlueDeleteClassifierRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueDeleteClassifierResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Delete the partition column statistics of a column.</p>
 
 @param request A container for the necessary parameters to execute the DeleteColumnStatisticsForPartition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueDeleteColumnStatisticsForPartitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueDeleteColumnStatisticsForPartitionRequest
 @see AWSGlueDeleteColumnStatisticsForPartitionResponse
 */
- (AWSTask<AWSGlueDeleteColumnStatisticsForPartitionResponse *> *)deleteColumnStatisticsForPartition:(AWSGlueDeleteColumnStatisticsForPartitionRequest *)request;

/**
 <p>Delete the partition column statistics of a column.</p>
 
 @param request A container for the necessary parameters to execute the DeleteColumnStatisticsForPartition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueDeleteColumnStatisticsForPartitionRequest
 @see AWSGlueDeleteColumnStatisticsForPartitionResponse
 */
- (void)deleteColumnStatisticsForPartition:(AWSGlueDeleteColumnStatisticsForPartitionRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueDeleteColumnStatisticsForPartitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves table statistics of columns.</p>
 
 @param request A container for the necessary parameters to execute the DeleteColumnStatisticsForTable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueDeleteColumnStatisticsForTableResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueDeleteColumnStatisticsForTableRequest
 @see AWSGlueDeleteColumnStatisticsForTableResponse
 */
- (AWSTask<AWSGlueDeleteColumnStatisticsForTableResponse *> *)deleteColumnStatisticsForTable:(AWSGlueDeleteColumnStatisticsForTableRequest *)request;

/**
 <p>Retrieves table statistics of columns.</p>
 
 @param request A container for the necessary parameters to execute the DeleteColumnStatisticsForTable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueDeleteColumnStatisticsForTableRequest
 @see AWSGlueDeleteColumnStatisticsForTableResponse
 */
- (void)deleteColumnStatisticsForTable:(AWSGlueDeleteColumnStatisticsForTableRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueDeleteColumnStatisticsForTableResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a connection from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueDeleteConnectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueDeleteConnectionRequest
 @see AWSGlueDeleteConnectionResponse
 */
- (AWSTask<AWSGlueDeleteConnectionResponse *> *)deleteConnection:(AWSGlueDeleteConnectionRequest *)request;

/**
 <p>Deletes a connection from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueDeleteConnectionRequest
 @see AWSGlueDeleteConnectionResponse
 */
- (void)deleteConnection:(AWSGlueDeleteConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueDeleteConnectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a specified crawler from the AWS Glue Data Catalog, unless the crawler state is <code>RUNNING</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCrawler service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueDeleteCrawlerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorCrawlerRunning`, `AWSGlueErrorSchedulerTransitioning`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueDeleteCrawlerRequest
 @see AWSGlueDeleteCrawlerResponse
 */
- (AWSTask<AWSGlueDeleteCrawlerResponse *> *)deleteCrawler:(AWSGlueDeleteCrawlerRequest *)request;

/**
 <p>Removes a specified crawler from the AWS Glue Data Catalog, unless the crawler state is <code>RUNNING</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCrawler service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorCrawlerRunning`, `AWSGlueErrorSchedulerTransitioning`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueDeleteCrawlerRequest
 @see AWSGlueDeleteCrawlerResponse
 */
- (void)deleteCrawler:(AWSGlueDeleteCrawlerRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueDeleteCrawlerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a specified database from a Data Catalog.</p><note><p>After completing this operation, you no longer have access to the tables (and all table versions and partitions that might belong to the tables) and the user-defined functions in the deleted database. AWS Glue deletes these "orphaned" resources asynchronously in a timely manner, at the discretion of the service.</p><p>To ensure the immediate deletion of all related resources, before calling <code>DeleteDatabase</code>, use <code>DeleteTableVersion</code> or <code>BatchDeleteTableVersion</code>, <code>DeletePartition</code> or <code>BatchDeletePartition</code>, <code>DeleteUserDefinedFunction</code>, and <code>DeleteTable</code> or <code>BatchDeleteTable</code>, to delete any resources that belong to the database.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDatabase service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueDeleteDatabaseResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueDeleteDatabaseRequest
 @see AWSGlueDeleteDatabaseResponse
 */
- (AWSTask<AWSGlueDeleteDatabaseResponse *> *)deleteDatabase:(AWSGlueDeleteDatabaseRequest *)request;

/**
 <p>Removes a specified database from a Data Catalog.</p><note><p>After completing this operation, you no longer have access to the tables (and all table versions and partitions that might belong to the tables) and the user-defined functions in the deleted database. AWS Glue deletes these "orphaned" resources asynchronously in a timely manner, at the discretion of the service.</p><p>To ensure the immediate deletion of all related resources, before calling <code>DeleteDatabase</code>, use <code>DeleteTableVersion</code> or <code>BatchDeleteTableVersion</code>, <code>DeletePartition</code> or <code>BatchDeletePartition</code>, <code>DeleteUserDefinedFunction</code>, and <code>DeleteTable</code> or <code>BatchDeleteTable</code>, to delete any resources that belong to the database.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDatabase service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueDeleteDatabaseRequest
 @see AWSGlueDeleteDatabaseResponse
 */
- (void)deleteDatabase:(AWSGlueDeleteDatabaseRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueDeleteDatabaseResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified development endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDevEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueDeleteDevEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`.
 
 @see AWSGlueDeleteDevEndpointRequest
 @see AWSGlueDeleteDevEndpointResponse
 */
- (AWSTask<AWSGlueDeleteDevEndpointResponse *> *)deleteDevEndpoint:(AWSGlueDeleteDevEndpointRequest *)request;

/**
 <p>Deletes a specified development endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDevEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`.
 
 @see AWSGlueDeleteDevEndpointRequest
 @see AWSGlueDeleteDevEndpointResponse
 */
- (void)deleteDevEndpoint:(AWSGlueDeleteDevEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueDeleteDevEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified job definition. If the job definition is not found, no exception is thrown.</p>
 
 @param request A container for the necessary parameters to execute the DeleteJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueDeleteJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueDeleteJobRequest
 @see AWSGlueDeleteJobResponse
 */
- (AWSTask<AWSGlueDeleteJobResponse *> *)deleteJob:(AWSGlueDeleteJobRequest *)request;

/**
 <p>Deletes a specified job definition. If the job definition is not found, no exception is thrown.</p>
 
 @param request A container for the necessary parameters to execute the DeleteJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueDeleteJobRequest
 @see AWSGlueDeleteJobResponse
 */
- (void)deleteJob:(AWSGlueDeleteJobRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueDeleteJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an AWS Glue machine learning transform. Machine learning transforms are a special type of transform that use machine learning to learn the details of the transformation to be performed by learning from examples provided by humans. These transformations are then saved by AWS Glue. If you no longer need a transform, you can delete it by calling <code>DeleteMLTransforms</code>. However, any AWS Glue jobs that still reference the deleted transform will no longer succeed.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMLTransform service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueDeleteMLTransformResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`.
 
 @see AWSGlueDeleteMLTransformRequest
 @see AWSGlueDeleteMLTransformResponse
 */
- (AWSTask<AWSGlueDeleteMLTransformResponse *> *)deleteMLTransform:(AWSGlueDeleteMLTransformRequest *)request;

/**
 <p>Deletes an AWS Glue machine learning transform. Machine learning transforms are a special type of transform that use machine learning to learn the details of the transformation to be performed by learning from examples provided by humans. These transformations are then saved by AWS Glue. If you no longer need a transform, you can delete it by calling <code>DeleteMLTransforms</code>. However, any AWS Glue jobs that still reference the deleted transform will no longer succeed.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMLTransform service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`.
 
 @see AWSGlueDeleteMLTransformRequest
 @see AWSGlueDeleteMLTransformResponse
 */
- (void)deleteMLTransform:(AWSGlueDeleteMLTransformRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueDeleteMLTransformResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified partition.</p>
 
 @param request A container for the necessary parameters to execute the DeletePartition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueDeletePartitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueDeletePartitionRequest
 @see AWSGlueDeletePartitionResponse
 */
- (AWSTask<AWSGlueDeletePartitionResponse *> *)deletePartition:(AWSGlueDeletePartitionRequest *)request;

/**
 <p>Deletes a specified partition.</p>
 
 @param request A container for the necessary parameters to execute the DeletePartition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueDeletePartitionRequest
 @see AWSGlueDeletePartitionResponse
 */
- (void)deletePartition:(AWSGlueDeletePartitionRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueDeletePartitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified policy.</p>
 
 @param request A container for the necessary parameters to execute the DeleteResourcePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueDeleteResourcePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorConditionCheckFailure`.
 
 @see AWSGlueDeleteResourcePolicyRequest
 @see AWSGlueDeleteResourcePolicyResponse
 */
- (AWSTask<AWSGlueDeleteResourcePolicyResponse *> *)deleteResourcePolicy:(AWSGlueDeleteResourcePolicyRequest *)request;

/**
 <p>Deletes a specified policy.</p>
 
 @param request A container for the necessary parameters to execute the DeleteResourcePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorConditionCheckFailure`.
 
 @see AWSGlueDeleteResourcePolicyRequest
 @see AWSGlueDeleteResourcePolicyResponse
 */
- (void)deleteResourcePolicy:(AWSGlueDeleteResourcePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueDeleteResourcePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified security configuration.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSecurityConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueDeleteSecurityConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueDeleteSecurityConfigurationRequest
 @see AWSGlueDeleteSecurityConfigurationResponse
 */
- (AWSTask<AWSGlueDeleteSecurityConfigurationResponse *> *)deleteSecurityConfiguration:(AWSGlueDeleteSecurityConfigurationRequest *)request;

/**
 <p>Deletes a specified security configuration.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSecurityConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueDeleteSecurityConfigurationRequest
 @see AWSGlueDeleteSecurityConfigurationResponse
 */
- (void)deleteSecurityConfiguration:(AWSGlueDeleteSecurityConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueDeleteSecurityConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a table definition from the Data Catalog.</p><note><p>After completing this operation, you no longer have access to the table versions and partitions that belong to the deleted table. AWS Glue deletes these "orphaned" resources asynchronously in a timely manner, at the discretion of the service.</p><p>To ensure the immediate deletion of all related resources, before calling <code>DeleteTable</code>, use <code>DeleteTableVersion</code> or <code>BatchDeleteTableVersion</code>, and <code>DeletePartition</code> or <code>BatchDeletePartition</code>, to delete any resources that belong to the table.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteTable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueDeleteTableResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueDeleteTableRequest
 @see AWSGlueDeleteTableResponse
 */
- (AWSTask<AWSGlueDeleteTableResponse *> *)deleteTable:(AWSGlueDeleteTableRequest *)request;

/**
 <p>Removes a table definition from the Data Catalog.</p><note><p>After completing this operation, you no longer have access to the table versions and partitions that belong to the deleted table. AWS Glue deletes these "orphaned" resources asynchronously in a timely manner, at the discretion of the service.</p><p>To ensure the immediate deletion of all related resources, before calling <code>DeleteTable</code>, use <code>DeleteTableVersion</code> or <code>BatchDeleteTableVersion</code>, and <code>DeletePartition</code> or <code>BatchDeletePartition</code>, to delete any resources that belong to the table.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteTable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueDeleteTableRequest
 @see AWSGlueDeleteTableResponse
 */
- (void)deleteTable:(AWSGlueDeleteTableRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueDeleteTableResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified version of a table.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTableVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueDeleteTableVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueDeleteTableVersionRequest
 @see AWSGlueDeleteTableVersionResponse
 */
- (AWSTask<AWSGlueDeleteTableVersionResponse *> *)deleteTableVersion:(AWSGlueDeleteTableVersionRequest *)request;

/**
 <p>Deletes a specified version of a table.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTableVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueDeleteTableVersionRequest
 @see AWSGlueDeleteTableVersionResponse
 */
- (void)deleteTableVersion:(AWSGlueDeleteTableVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueDeleteTableVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified trigger. If the trigger is not found, no exception is thrown.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrigger service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueDeleteTriggerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorConcurrentModification`.
 
 @see AWSGlueDeleteTriggerRequest
 @see AWSGlueDeleteTriggerResponse
 */
- (AWSTask<AWSGlueDeleteTriggerResponse *> *)deleteTrigger:(AWSGlueDeleteTriggerRequest *)request;

/**
 <p>Deletes a specified trigger. If the trigger is not found, no exception is thrown.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrigger service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorConcurrentModification`.
 
 @see AWSGlueDeleteTriggerRequest
 @see AWSGlueDeleteTriggerResponse
 */
- (void)deleteTrigger:(AWSGlueDeleteTriggerRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueDeleteTriggerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an existing function definition from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUserDefinedFunction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueDeleteUserDefinedFunctionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueDeleteUserDefinedFunctionRequest
 @see AWSGlueDeleteUserDefinedFunctionResponse
 */
- (AWSTask<AWSGlueDeleteUserDefinedFunctionResponse *> *)deleteUserDefinedFunction:(AWSGlueDeleteUserDefinedFunctionRequest *)request;

/**
 <p>Deletes an existing function definition from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUserDefinedFunction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueDeleteUserDefinedFunctionRequest
 @see AWSGlueDeleteUserDefinedFunctionResponse
 */
- (void)deleteUserDefinedFunction:(AWSGlueDeleteUserDefinedFunctionRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueDeleteUserDefinedFunctionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a workflow.</p>
 
 @param request A container for the necessary parameters to execute the DeleteWorkflow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueDeleteWorkflowResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorConcurrentModification`.
 
 @see AWSGlueDeleteWorkflowRequest
 @see AWSGlueDeleteWorkflowResponse
 */
- (AWSTask<AWSGlueDeleteWorkflowResponse *> *)deleteWorkflow:(AWSGlueDeleteWorkflowRequest *)request;

/**
 <p>Deletes a workflow.</p>
 
 @param request A container for the necessary parameters to execute the DeleteWorkflow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorConcurrentModification`.
 
 @see AWSGlueDeleteWorkflowRequest
 @see AWSGlueDeleteWorkflowResponse
 */
- (void)deleteWorkflow:(AWSGlueDeleteWorkflowRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueDeleteWorkflowResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the status of a migration operation.</p>
 
 @param request A container for the necessary parameters to execute the GetCatalogImportStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetCatalogImportStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetCatalogImportStatusRequest
 @see AWSGlueGetCatalogImportStatusResponse
 */
- (AWSTask<AWSGlueGetCatalogImportStatusResponse *> *)getCatalogImportStatus:(AWSGlueGetCatalogImportStatusRequest *)request;

/**
 <p>Retrieves the status of a migration operation.</p>
 
 @param request A container for the necessary parameters to execute the GetCatalogImportStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetCatalogImportStatusRequest
 @see AWSGlueGetCatalogImportStatusResponse
 */
- (void)getCatalogImportStatus:(AWSGlueGetCatalogImportStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetCatalogImportStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve a classifier by name.</p>
 
 @param request A container for the necessary parameters to execute the GetClassifier service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetClassifierResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetClassifierRequest
 @see AWSGlueGetClassifierResponse
 */
- (AWSTask<AWSGlueGetClassifierResponse *> *)getClassifier:(AWSGlueGetClassifierRequest *)request;

/**
 <p>Retrieve a classifier by name.</p>
 
 @param request A container for the necessary parameters to execute the GetClassifier service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetClassifierRequest
 @see AWSGlueGetClassifierResponse
 */
- (void)getClassifier:(AWSGlueGetClassifierRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetClassifierResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all classifier objects in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetClassifiers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetClassifiersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetClassifiersRequest
 @see AWSGlueGetClassifiersResponse
 */
- (AWSTask<AWSGlueGetClassifiersResponse *> *)getClassifiers:(AWSGlueGetClassifiersRequest *)request;

/**
 <p>Lists all classifier objects in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetClassifiers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetClassifiersRequest
 @see AWSGlueGetClassifiersResponse
 */
- (void)getClassifiers:(AWSGlueGetClassifiersRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetClassifiersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves partition statistics of columns.</p>
 
 @param request A container for the necessary parameters to execute the GetColumnStatisticsForPartition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetColumnStatisticsForPartitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetColumnStatisticsForPartitionRequest
 @see AWSGlueGetColumnStatisticsForPartitionResponse
 */
- (AWSTask<AWSGlueGetColumnStatisticsForPartitionResponse *> *)getColumnStatisticsForPartition:(AWSGlueGetColumnStatisticsForPartitionRequest *)request;

/**
 <p>Retrieves partition statistics of columns.</p>
 
 @param request A container for the necessary parameters to execute the GetColumnStatisticsForPartition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetColumnStatisticsForPartitionRequest
 @see AWSGlueGetColumnStatisticsForPartitionResponse
 */
- (void)getColumnStatisticsForPartition:(AWSGlueGetColumnStatisticsForPartitionRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetColumnStatisticsForPartitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves table statistics of columns.</p>
 
 @param request A container for the necessary parameters to execute the GetColumnStatisticsForTable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetColumnStatisticsForTableResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetColumnStatisticsForTableRequest
 @see AWSGlueGetColumnStatisticsForTableResponse
 */
- (AWSTask<AWSGlueGetColumnStatisticsForTableResponse *> *)getColumnStatisticsForTable:(AWSGlueGetColumnStatisticsForTableRequest *)request;

/**
 <p>Retrieves table statistics of columns.</p>
 
 @param request A container for the necessary parameters to execute the GetColumnStatisticsForTable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetColumnStatisticsForTableRequest
 @see AWSGlueGetColumnStatisticsForTableResponse
 */
- (void)getColumnStatisticsForTable:(AWSGlueGetColumnStatisticsForTableRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetColumnStatisticsForTableResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a connection definition from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetConnectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetConnectionRequest
 @see AWSGlueGetConnectionResponse
 */
- (AWSTask<AWSGlueGetConnectionResponse *> *)getConnection:(AWSGlueGetConnectionRequest *)request;

/**
 <p>Retrieves a connection definition from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetConnectionRequest
 @see AWSGlueGetConnectionResponse
 */
- (void)getConnection:(AWSGlueGetConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetConnectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of connection definitions from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetConnections service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetConnectionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetConnectionsRequest
 @see AWSGlueGetConnectionsResponse
 */
- (AWSTask<AWSGlueGetConnectionsResponse *> *)getConnections:(AWSGlueGetConnectionsRequest *)request;

/**
 <p>Retrieves a list of connection definitions from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetConnections service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetConnectionsRequest
 @see AWSGlueGetConnectionsResponse
 */
- (void)getConnections:(AWSGlueGetConnectionsRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetConnectionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves metadata for a specified crawler.</p>
 
 @param request A container for the necessary parameters to execute the GetCrawler service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetCrawlerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetCrawlerRequest
 @see AWSGlueGetCrawlerResponse
 */
- (AWSTask<AWSGlueGetCrawlerResponse *> *)getCrawler:(AWSGlueGetCrawlerRequest *)request;

/**
 <p>Retrieves metadata for a specified crawler.</p>
 
 @param request A container for the necessary parameters to execute the GetCrawler service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetCrawlerRequest
 @see AWSGlueGetCrawlerResponse
 */
- (void)getCrawler:(AWSGlueGetCrawlerRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetCrawlerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves metrics about specified crawlers.</p>
 
 @param request A container for the necessary parameters to execute the GetCrawlerMetrics service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetCrawlerMetricsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetCrawlerMetricsRequest
 @see AWSGlueGetCrawlerMetricsResponse
 */
- (AWSTask<AWSGlueGetCrawlerMetricsResponse *> *)getCrawlerMetrics:(AWSGlueGetCrawlerMetricsRequest *)request;

/**
 <p>Retrieves metrics about specified crawlers.</p>
 
 @param request A container for the necessary parameters to execute the GetCrawlerMetrics service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetCrawlerMetricsRequest
 @see AWSGlueGetCrawlerMetricsResponse
 */
- (void)getCrawlerMetrics:(AWSGlueGetCrawlerMetricsRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetCrawlerMetricsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves metadata for all crawlers defined in the customer account.</p>
 
 @param request A container for the necessary parameters to execute the GetCrawlers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetCrawlersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetCrawlersRequest
 @see AWSGlueGetCrawlersResponse
 */
- (AWSTask<AWSGlueGetCrawlersResponse *> *)getCrawlers:(AWSGlueGetCrawlersRequest *)request;

/**
 <p>Retrieves metadata for all crawlers defined in the customer account.</p>
 
 @param request A container for the necessary parameters to execute the GetCrawlers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetCrawlersRequest
 @see AWSGlueGetCrawlersResponse
 */
- (void)getCrawlers:(AWSGlueGetCrawlersRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetCrawlersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the security configuration for a specified catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetDataCatalogEncryptionSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetDataCatalogEncryptionSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInternalService`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetDataCatalogEncryptionSettingsRequest
 @see AWSGlueGetDataCatalogEncryptionSettingsResponse
 */
- (AWSTask<AWSGlueGetDataCatalogEncryptionSettingsResponse *> *)getDataCatalogEncryptionSettings:(AWSGlueGetDataCatalogEncryptionSettingsRequest *)request;

/**
 <p>Retrieves the security configuration for a specified catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetDataCatalogEncryptionSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInternalService`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetDataCatalogEncryptionSettingsRequest
 @see AWSGlueGetDataCatalogEncryptionSettingsResponse
 */
- (void)getDataCatalogEncryptionSettings:(AWSGlueGetDataCatalogEncryptionSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetDataCatalogEncryptionSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the definition of a specified database.</p>
 
 @param request A container for the necessary parameters to execute the GetDatabase service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetDatabaseResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetDatabaseRequest
 @see AWSGlueGetDatabaseResponse
 */
- (AWSTask<AWSGlueGetDatabaseResponse *> *)getDatabase:(AWSGlueGetDatabaseRequest *)request;

/**
 <p>Retrieves the definition of a specified database.</p>
 
 @param request A container for the necessary parameters to execute the GetDatabase service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetDatabaseRequest
 @see AWSGlueGetDatabaseResponse
 */
- (void)getDatabase:(AWSGlueGetDatabaseRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetDatabaseResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves all databases defined in a given Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetDatabases service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetDatabasesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetDatabasesRequest
 @see AWSGlueGetDatabasesResponse
 */
- (AWSTask<AWSGlueGetDatabasesResponse *> *)getDatabases:(AWSGlueGetDatabasesRequest *)request;

/**
 <p>Retrieves all databases defined in a given Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetDatabases service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetDatabasesRequest
 @see AWSGlueGetDatabasesResponse
 */
- (void)getDatabases:(AWSGlueGetDatabasesRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetDatabasesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Transforms a Python script into a directed acyclic graph (DAG). </p>
 
 @param request A container for the necessary parameters to execute the GetDataflowGraph service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetDataflowGraphResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetDataflowGraphRequest
 @see AWSGlueGetDataflowGraphResponse
 */
- (AWSTask<AWSGlueGetDataflowGraphResponse *> *)getDataflowGraph:(AWSGlueGetDataflowGraphRequest *)request;

/**
 <p>Transforms a Python script into a directed acyclic graph (DAG). </p>
 
 @param request A container for the necessary parameters to execute the GetDataflowGraph service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetDataflowGraphRequest
 @see AWSGlueGetDataflowGraphResponse
 */
- (void)getDataflowGraph:(AWSGlueGetDataflowGraphRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetDataflowGraphResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a specified development endpoint.</p><note><p>When you create a development endpoint in a virtual private cloud (VPC), AWS Glue returns only a private IP address, and the public IP address field is not populated. When you create a non-VPC development endpoint, AWS Glue returns only a public IP address.</p></note>
 
 @param request A container for the necessary parameters to execute the GetDevEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetDevEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`.
 
 @see AWSGlueGetDevEndpointRequest
 @see AWSGlueGetDevEndpointResponse
 */
- (AWSTask<AWSGlueGetDevEndpointResponse *> *)getDevEndpoint:(AWSGlueGetDevEndpointRequest *)request;

/**
 <p>Retrieves information about a specified development endpoint.</p><note><p>When you create a development endpoint in a virtual private cloud (VPC), AWS Glue returns only a private IP address, and the public IP address field is not populated. When you create a non-VPC development endpoint, AWS Glue returns only a public IP address.</p></note>
 
 @param request A container for the necessary parameters to execute the GetDevEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`.
 
 @see AWSGlueGetDevEndpointRequest
 @see AWSGlueGetDevEndpointResponse
 */
- (void)getDevEndpoint:(AWSGlueGetDevEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetDevEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves all the development endpoints in this AWS account.</p><note><p>When you create a development endpoint in a virtual private cloud (VPC), AWS Glue returns only a private IP address and the public IP address field is not populated. When you create a non-VPC development endpoint, AWS Glue returns only a public IP address.</p></note>
 
 @param request A container for the necessary parameters to execute the GetDevEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetDevEndpointsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`.
 
 @see AWSGlueGetDevEndpointsRequest
 @see AWSGlueGetDevEndpointsResponse
 */
- (AWSTask<AWSGlueGetDevEndpointsResponse *> *)getDevEndpoints:(AWSGlueGetDevEndpointsRequest *)request;

/**
 <p>Retrieves all the development endpoints in this AWS account.</p><note><p>When you create a development endpoint in a virtual private cloud (VPC), AWS Glue returns only a private IP address and the public IP address field is not populated. When you create a non-VPC development endpoint, AWS Glue returns only a public IP address.</p></note>
 
 @param request A container for the necessary parameters to execute the GetDevEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`.
 
 @see AWSGlueGetDevEndpointsRequest
 @see AWSGlueGetDevEndpointsResponse
 */
- (void)getDevEndpoints:(AWSGlueGetDevEndpointsRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetDevEndpointsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves an existing job definition.</p>
 
 @param request A container for the necessary parameters to execute the GetJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetJobRequest
 @see AWSGlueGetJobResponse
 */
- (AWSTask<AWSGlueGetJobResponse *> *)getJob:(AWSGlueGetJobRequest *)request;

/**
 <p>Retrieves an existing job definition.</p>
 
 @param request A container for the necessary parameters to execute the GetJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetJobRequest
 @see AWSGlueGetJobResponse
 */
- (void)getJob:(AWSGlueGetJobRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information on a job bookmark entry.</p>
 
 @param request A container for the necessary parameters to execute the GetJobBookmark service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetJobBookmarkResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorValidation`.
 
 @see AWSGlueGetJobBookmarkRequest
 @see AWSGlueGetJobBookmarkResponse
 */
- (AWSTask<AWSGlueGetJobBookmarkResponse *> *)getJobBookmark:(AWSGlueGetJobBookmarkRequest *)request;

/**
 <p>Returns information on a job bookmark entry.</p>
 
 @param request A container for the necessary parameters to execute the GetJobBookmark service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorValidation`.
 
 @see AWSGlueGetJobBookmarkRequest
 @see AWSGlueGetJobBookmarkResponse
 */
- (void)getJobBookmark:(AWSGlueGetJobBookmarkRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetJobBookmarkResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the metadata for a given job run.</p>
 
 @param request A container for the necessary parameters to execute the GetJobRun service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetJobRunResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetJobRunRequest
 @see AWSGlueGetJobRunResponse
 */
- (AWSTask<AWSGlueGetJobRunResponse *> *)getJobRun:(AWSGlueGetJobRunRequest *)request;

/**
 <p>Retrieves the metadata for a given job run.</p>
 
 @param request A container for the necessary parameters to execute the GetJobRun service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetJobRunRequest
 @see AWSGlueGetJobRunResponse
 */
- (void)getJobRun:(AWSGlueGetJobRunRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetJobRunResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves metadata for all runs of a given job definition.</p>
 
 @param request A container for the necessary parameters to execute the GetJobRuns service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetJobRunsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetJobRunsRequest
 @see AWSGlueGetJobRunsResponse
 */
- (AWSTask<AWSGlueGetJobRunsResponse *> *)getJobRuns:(AWSGlueGetJobRunsRequest *)request;

/**
 <p>Retrieves metadata for all runs of a given job definition.</p>
 
 @param request A container for the necessary parameters to execute the GetJobRuns service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetJobRunsRequest
 @see AWSGlueGetJobRunsResponse
 */
- (void)getJobRuns:(AWSGlueGetJobRunsRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetJobRunsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves all current job definitions.</p>
 
 @param request A container for the necessary parameters to execute the GetJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetJobsRequest
 @see AWSGlueGetJobsResponse
 */
- (AWSTask<AWSGlueGetJobsResponse *> *)getJobs:(AWSGlueGetJobsRequest *)request;

/**
 <p>Retrieves all current job definitions.</p>
 
 @param request A container for the necessary parameters to execute the GetJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetJobsRequest
 @see AWSGlueGetJobsResponse
 */
- (void)getJobs:(AWSGlueGetJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets details for a specific task run on a machine learning transform. Machine learning task runs are asynchronous tasks that AWS Glue runs on your behalf as part of various machine learning workflows. You can check the stats of any task run by calling <code>GetMLTaskRun</code> with the <code>TaskRunID</code> and its parent transform's <code>TransformID</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetMLTaskRun service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetMLTaskRunResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`.
 
 @see AWSGlueGetMLTaskRunRequest
 @see AWSGlueGetMLTaskRunResponse
 */
- (AWSTask<AWSGlueGetMLTaskRunResponse *> *)getMLTaskRun:(AWSGlueGetMLTaskRunRequest *)request;

/**
 <p>Gets details for a specific task run on a machine learning transform. Machine learning task runs are asynchronous tasks that AWS Glue runs on your behalf as part of various machine learning workflows. You can check the stats of any task run by calling <code>GetMLTaskRun</code> with the <code>TaskRunID</code> and its parent transform's <code>TransformID</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetMLTaskRun service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`.
 
 @see AWSGlueGetMLTaskRunRequest
 @see AWSGlueGetMLTaskRunResponse
 */
- (void)getMLTaskRun:(AWSGlueGetMLTaskRunRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetMLTaskRunResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of runs for a machine learning transform. Machine learning task runs are asynchronous tasks that AWS Glue runs on your behalf as part of various machine learning workflows. You can get a sortable, filterable list of machine learning task runs by calling <code>GetMLTaskRuns</code> with their parent transform's <code>TransformID</code> and other optional parameters as documented in this section.</p><p>This operation returns a list of historic runs and must be paginated.</p>
 
 @param request A container for the necessary parameters to execute the GetMLTaskRuns service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetMLTaskRunsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`.
 
 @see AWSGlueGetMLTaskRunsRequest
 @see AWSGlueGetMLTaskRunsResponse
 */
- (AWSTask<AWSGlueGetMLTaskRunsResponse *> *)getMLTaskRuns:(AWSGlueGetMLTaskRunsRequest *)request;

/**
 <p>Gets a list of runs for a machine learning transform. Machine learning task runs are asynchronous tasks that AWS Glue runs on your behalf as part of various machine learning workflows. You can get a sortable, filterable list of machine learning task runs by calling <code>GetMLTaskRuns</code> with their parent transform's <code>TransformID</code> and other optional parameters as documented in this section.</p><p>This operation returns a list of historic runs and must be paginated.</p>
 
 @param request A container for the necessary parameters to execute the GetMLTaskRuns service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`.
 
 @see AWSGlueGetMLTaskRunsRequest
 @see AWSGlueGetMLTaskRunsResponse
 */
- (void)getMLTaskRuns:(AWSGlueGetMLTaskRunsRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetMLTaskRunsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets an AWS Glue machine learning transform artifact and all its corresponding metadata. Machine learning transforms are a special type of transform that use machine learning to learn the details of the transformation to be performed by learning from examples provided by humans. These transformations are then saved by AWS Glue. You can retrieve their metadata by calling <code>GetMLTransform</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetMLTransform service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetMLTransformResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`.
 
 @see AWSGlueGetMLTransformRequest
 @see AWSGlueGetMLTransformResponse
 */
- (AWSTask<AWSGlueGetMLTransformResponse *> *)getMLTransform:(AWSGlueGetMLTransformRequest *)request;

/**
 <p>Gets an AWS Glue machine learning transform artifact and all its corresponding metadata. Machine learning transforms are a special type of transform that use machine learning to learn the details of the transformation to be performed by learning from examples provided by humans. These transformations are then saved by AWS Glue. You can retrieve their metadata by calling <code>GetMLTransform</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetMLTransform service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`.
 
 @see AWSGlueGetMLTransformRequest
 @see AWSGlueGetMLTransformResponse
 */
- (void)getMLTransform:(AWSGlueGetMLTransformRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetMLTransformResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a sortable, filterable list of existing AWS Glue machine learning transforms. Machine learning transforms are a special type of transform that use machine learning to learn the details of the transformation to be performed by learning from examples provided by humans. These transformations are then saved by AWS Glue, and you can retrieve their metadata by calling <code>GetMLTransforms</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetMLTransforms service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetMLTransformsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`.
 
 @see AWSGlueGetMLTransformsRequest
 @see AWSGlueGetMLTransformsResponse
 */
- (AWSTask<AWSGlueGetMLTransformsResponse *> *)getMLTransforms:(AWSGlueGetMLTransformsRequest *)request;

/**
 <p>Gets a sortable, filterable list of existing AWS Glue machine learning transforms. Machine learning transforms are a special type of transform that use machine learning to learn the details of the transformation to be performed by learning from examples provided by humans. These transformations are then saved by AWS Glue, and you can retrieve their metadata by calling <code>GetMLTransforms</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetMLTransforms service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`.
 
 @see AWSGlueGetMLTransformsRequest
 @see AWSGlueGetMLTransformsResponse
 */
- (void)getMLTransforms:(AWSGlueGetMLTransformsRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetMLTransformsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates mappings.</p>
 
 @param request A container for the necessary parameters to execute the GetMapping service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetMappingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorEntityNotFound`.
 
 @see AWSGlueGetMappingRequest
 @see AWSGlueGetMappingResponse
 */
- (AWSTask<AWSGlueGetMappingResponse *> *)getMapping:(AWSGlueGetMappingRequest *)request;

/**
 <p>Creates mappings.</p>
 
 @param request A container for the necessary parameters to execute the GetMapping service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorEntityNotFound`.
 
 @see AWSGlueGetMappingRequest
 @see AWSGlueGetMappingResponse
 */
- (void)getMapping:(AWSGlueGetMappingRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetMappingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a specified partition.</p>
 
 @param request A container for the necessary parameters to execute the GetPartition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetPartitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetPartitionRequest
 @see AWSGlueGetPartitionResponse
 */
- (AWSTask<AWSGlueGetPartitionResponse *> *)getPartition:(AWSGlueGetPartitionRequest *)request;

/**
 <p>Retrieves information about a specified partition.</p>
 
 @param request A container for the necessary parameters to execute the GetPartition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetPartitionRequest
 @see AWSGlueGetPartitionResponse
 */
- (void)getPartition:(AWSGlueGetPartitionRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetPartitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the partitions in a table.</p>
 
 @param request A container for the necessary parameters to execute the GetPartitions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetPartitionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetPartitionsRequest
 @see AWSGlueGetPartitionsResponse
 */
- (AWSTask<AWSGlueGetPartitionsResponse *> *)getPartitions:(AWSGlueGetPartitionsRequest *)request;

/**
 <p>Retrieves information about the partitions in a table.</p>
 
 @param request A container for the necessary parameters to execute the GetPartitions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetPartitionsRequest
 @see AWSGlueGetPartitionsResponse
 */
- (void)getPartitions:(AWSGlueGetPartitionsRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetPartitionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets code to perform a specified mapping.</p>
 
 @param request A container for the necessary parameters to execute the GetPlan service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetPlanResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetPlanRequest
 @see AWSGlueGetPlanResponse
 */
- (AWSTask<AWSGlueGetPlanResponse *> *)getPlan:(AWSGlueGetPlanRequest *)request;

/**
 <p>Gets code to perform a specified mapping.</p>
 
 @param request A container for the necessary parameters to execute the GetPlan service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetPlanRequest
 @see AWSGlueGetPlanResponse
 */
- (void)getPlan:(AWSGlueGetPlanRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetPlanResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a specified resource policy.</p>
 
 @param request A container for the necessary parameters to execute the GetResourcePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetResourcePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`.
 
 @see AWSGlueGetResourcePolicyRequest
 @see AWSGlueGetResourcePolicyResponse
 */
- (AWSTask<AWSGlueGetResourcePolicyResponse *> *)getResourcePolicy:(AWSGlueGetResourcePolicyRequest *)request;

/**
 <p>Retrieves a specified resource policy.</p>
 
 @param request A container for the necessary parameters to execute the GetResourcePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`.
 
 @see AWSGlueGetResourcePolicyRequest
 @see AWSGlueGetResourcePolicyResponse
 */
- (void)getResourcePolicy:(AWSGlueGetResourcePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetResourcePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a specified security configuration.</p>
 
 @param request A container for the necessary parameters to execute the GetSecurityConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetSecurityConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetSecurityConfigurationRequest
 @see AWSGlueGetSecurityConfigurationResponse
 */
- (AWSTask<AWSGlueGetSecurityConfigurationResponse *> *)getSecurityConfiguration:(AWSGlueGetSecurityConfigurationRequest *)request;

/**
 <p>Retrieves a specified security configuration.</p>
 
 @param request A container for the necessary parameters to execute the GetSecurityConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetSecurityConfigurationRequest
 @see AWSGlueGetSecurityConfigurationResponse
 */
- (void)getSecurityConfiguration:(AWSGlueGetSecurityConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetSecurityConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of all security configurations.</p>
 
 @param request A container for the necessary parameters to execute the GetSecurityConfigurations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetSecurityConfigurationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetSecurityConfigurationsRequest
 @see AWSGlueGetSecurityConfigurationsResponse
 */
- (AWSTask<AWSGlueGetSecurityConfigurationsResponse *> *)getSecurityConfigurations:(AWSGlueGetSecurityConfigurationsRequest *)request;

/**
 <p>Retrieves a list of all security configurations.</p>
 
 @param request A container for the necessary parameters to execute the GetSecurityConfigurations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetSecurityConfigurationsRequest
 @see AWSGlueGetSecurityConfigurationsResponse
 */
- (void)getSecurityConfigurations:(AWSGlueGetSecurityConfigurationsRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetSecurityConfigurationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the <code>Table</code> definition in a Data Catalog for a specified table.</p>
 
 @param request A container for the necessary parameters to execute the GetTable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetTableResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetTableRequest
 @see AWSGlueGetTableResponse
 */
- (AWSTask<AWSGlueGetTableResponse *> *)getTable:(AWSGlueGetTableRequest *)request;

/**
 <p>Retrieves the <code>Table</code> definition in a Data Catalog for a specified table.</p>
 
 @param request A container for the necessary parameters to execute the GetTable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetTableRequest
 @see AWSGlueGetTableResponse
 */
- (void)getTable:(AWSGlueGetTableRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetTableResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a specified version of a table.</p>
 
 @param request A container for the necessary parameters to execute the GetTableVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetTableVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetTableVersionRequest
 @see AWSGlueGetTableVersionResponse
 */
- (AWSTask<AWSGlueGetTableVersionResponse *> *)getTableVersion:(AWSGlueGetTableVersionRequest *)request;

/**
 <p>Retrieves a specified version of a table.</p>
 
 @param request A container for the necessary parameters to execute the GetTableVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetTableVersionRequest
 @see AWSGlueGetTableVersionResponse
 */
- (void)getTableVersion:(AWSGlueGetTableVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetTableVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of strings that identify available versions of a specified table.</p>
 
 @param request A container for the necessary parameters to execute the GetTableVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetTableVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetTableVersionsRequest
 @see AWSGlueGetTableVersionsResponse
 */
- (AWSTask<AWSGlueGetTableVersionsResponse *> *)getTableVersions:(AWSGlueGetTableVersionsRequest *)request;

/**
 <p>Retrieves a list of strings that identify available versions of a specified table.</p>
 
 @param request A container for the necessary parameters to execute the GetTableVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetTableVersionsRequest
 @see AWSGlueGetTableVersionsResponse
 */
- (void)getTableVersions:(AWSGlueGetTableVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetTableVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the definitions of some or all of the tables in a given <code>Database</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetTables service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetTablesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetTablesRequest
 @see AWSGlueGetTablesResponse
 */
- (AWSTask<AWSGlueGetTablesResponse *> *)getTables:(AWSGlueGetTablesRequest *)request;

/**
 <p>Retrieves the definitions of some or all of the tables in a given <code>Database</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetTables service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetTablesRequest
 @see AWSGlueGetTablesResponse
 */
- (void)getTables:(AWSGlueGetTablesRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetTablesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of tags associated with a resource.</p>
 
 @param request A container for the necessary parameters to execute the GetTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetTagsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorEntityNotFound`.
 
 @see AWSGlueGetTagsRequest
 @see AWSGlueGetTagsResponse
 */
- (AWSTask<AWSGlueGetTagsResponse *> *)getTags:(AWSGlueGetTagsRequest *)request;

/**
 <p>Retrieves a list of tags associated with a resource.</p>
 
 @param request A container for the necessary parameters to execute the GetTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorEntityNotFound`.
 
 @see AWSGlueGetTagsRequest
 @see AWSGlueGetTagsResponse
 */
- (void)getTags:(AWSGlueGetTagsRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetTagsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the definition of a trigger.</p>
 
 @param request A container for the necessary parameters to execute the GetTrigger service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetTriggerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetTriggerRequest
 @see AWSGlueGetTriggerResponse
 */
- (AWSTask<AWSGlueGetTriggerResponse *> *)getTrigger:(AWSGlueGetTriggerRequest *)request;

/**
 <p>Retrieves the definition of a trigger.</p>
 
 @param request A container for the necessary parameters to execute the GetTrigger service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetTriggerRequest
 @see AWSGlueGetTriggerResponse
 */
- (void)getTrigger:(AWSGlueGetTriggerRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetTriggerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets all the triggers associated with a job.</p>
 
 @param request A container for the necessary parameters to execute the GetTriggers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetTriggersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetTriggersRequest
 @see AWSGlueGetTriggersResponse
 */
- (AWSTask<AWSGlueGetTriggersResponse *> *)getTriggers:(AWSGlueGetTriggersRequest *)request;

/**
 <p>Gets all the triggers associated with a job.</p>
 
 @param request A container for the necessary parameters to execute the GetTriggers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetTriggersRequest
 @see AWSGlueGetTriggersResponse
 */
- (void)getTriggers:(AWSGlueGetTriggersRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetTriggersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a specified function definition from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetUserDefinedFunction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetUserDefinedFunctionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetUserDefinedFunctionRequest
 @see AWSGlueGetUserDefinedFunctionResponse
 */
- (AWSTask<AWSGlueGetUserDefinedFunctionResponse *> *)getUserDefinedFunction:(AWSGlueGetUserDefinedFunctionRequest *)request;

/**
 <p>Retrieves a specified function definition from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetUserDefinedFunction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetUserDefinedFunctionRequest
 @see AWSGlueGetUserDefinedFunctionResponse
 */
- (void)getUserDefinedFunction:(AWSGlueGetUserDefinedFunctionRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetUserDefinedFunctionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves multiple function definitions from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetUserDefinedFunctions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetUserDefinedFunctionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetUserDefinedFunctionsRequest
 @see AWSGlueGetUserDefinedFunctionsResponse
 */
- (AWSTask<AWSGlueGetUserDefinedFunctionsResponse *> *)getUserDefinedFunctions:(AWSGlueGetUserDefinedFunctionsRequest *)request;

/**
 <p>Retrieves multiple function definitions from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetUserDefinedFunctions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueGetUserDefinedFunctionsRequest
 @see AWSGlueGetUserDefinedFunctionsResponse
 */
- (void)getUserDefinedFunctions:(AWSGlueGetUserDefinedFunctionsRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetUserDefinedFunctionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves resource metadata for a workflow.</p>
 
 @param request A container for the necessary parameters to execute the GetWorkflow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetWorkflowResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetWorkflowRequest
 @see AWSGlueGetWorkflowResponse
 */
- (AWSTask<AWSGlueGetWorkflowResponse *> *)getWorkflow:(AWSGlueGetWorkflowRequest *)request;

/**
 <p>Retrieves resource metadata for a workflow.</p>
 
 @param request A container for the necessary parameters to execute the GetWorkflow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetWorkflowRequest
 @see AWSGlueGetWorkflowResponse
 */
- (void)getWorkflow:(AWSGlueGetWorkflowRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetWorkflowResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the metadata for a given workflow run. </p>
 
 @param request A container for the necessary parameters to execute the GetWorkflowRun service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetWorkflowRunResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetWorkflowRunRequest
 @see AWSGlueGetWorkflowRunResponse
 */
- (AWSTask<AWSGlueGetWorkflowRunResponse *> *)getWorkflowRun:(AWSGlueGetWorkflowRunRequest *)request;

/**
 <p>Retrieves the metadata for a given workflow run. </p>
 
 @param request A container for the necessary parameters to execute the GetWorkflowRun service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetWorkflowRunRequest
 @see AWSGlueGetWorkflowRunResponse
 */
- (void)getWorkflowRun:(AWSGlueGetWorkflowRunRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetWorkflowRunResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the workflow run properties which were set during the run.</p>
 
 @param request A container for the necessary parameters to execute the GetWorkflowRunProperties service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetWorkflowRunPropertiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetWorkflowRunPropertiesRequest
 @see AWSGlueGetWorkflowRunPropertiesResponse
 */
- (AWSTask<AWSGlueGetWorkflowRunPropertiesResponse *> *)getWorkflowRunProperties:(AWSGlueGetWorkflowRunPropertiesRequest *)request;

/**
 <p>Retrieves the workflow run properties which were set during the run.</p>
 
 @param request A container for the necessary parameters to execute the GetWorkflowRunProperties service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetWorkflowRunPropertiesRequest
 @see AWSGlueGetWorkflowRunPropertiesResponse
 */
- (void)getWorkflowRunProperties:(AWSGlueGetWorkflowRunPropertiesRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetWorkflowRunPropertiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves metadata for all runs of a given workflow.</p>
 
 @param request A container for the necessary parameters to execute the GetWorkflowRuns service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueGetWorkflowRunsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetWorkflowRunsRequest
 @see AWSGlueGetWorkflowRunsResponse
 */
- (AWSTask<AWSGlueGetWorkflowRunsResponse *> *)getWorkflowRuns:(AWSGlueGetWorkflowRunsRequest *)request;

/**
 <p>Retrieves metadata for all runs of a given workflow.</p>
 
 @param request A container for the necessary parameters to execute the GetWorkflowRuns service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueGetWorkflowRunsRequest
 @see AWSGlueGetWorkflowRunsResponse
 */
- (void)getWorkflowRuns:(AWSGlueGetWorkflowRunsRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueGetWorkflowRunsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Imports an existing Amazon Athena Data Catalog to AWS Glue</p>
 
 @param request A container for the necessary parameters to execute the ImportCatalogToGlue service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueImportCatalogToGlueResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueImportCatalogToGlueRequest
 @see AWSGlueImportCatalogToGlueResponse
 */
- (AWSTask<AWSGlueImportCatalogToGlueResponse *> *)importCatalogToGlue:(AWSGlueImportCatalogToGlueRequest *)request;

/**
 <p>Imports an existing Amazon Athena Data Catalog to AWS Glue</p>
 
 @param request A container for the necessary parameters to execute the ImportCatalogToGlue service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueImportCatalogToGlueRequest
 @see AWSGlueImportCatalogToGlueResponse
 */
- (void)importCatalogToGlue:(AWSGlueImportCatalogToGlueRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueImportCatalogToGlueResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the names of all crawler resources in this AWS account, or the resources with the specified tag. This operation allows you to see which resources are available in your account, and their names.</p><p>This operation takes the optional <code>Tags</code> field, which you can use as a filter on the response so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only resources with the tag are retrieved.</p>
 
 @param request A container for the necessary parameters to execute the ListCrawlers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueListCrawlersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueListCrawlersRequest
 @see AWSGlueListCrawlersResponse
 */
- (AWSTask<AWSGlueListCrawlersResponse *> *)listCrawlers:(AWSGlueListCrawlersRequest *)request;

/**
 <p>Retrieves the names of all crawler resources in this AWS account, or the resources with the specified tag. This operation allows you to see which resources are available in your account, and their names.</p><p>This operation takes the optional <code>Tags</code> field, which you can use as a filter on the response so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only resources with the tag are retrieved.</p>
 
 @param request A container for the necessary parameters to execute the ListCrawlers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueListCrawlersRequest
 @see AWSGlueListCrawlersResponse
 */
- (void)listCrawlers:(AWSGlueListCrawlersRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueListCrawlersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the names of all <code>DevEndpoint</code> resources in this AWS account, or the resources with the specified tag. This operation allows you to see which resources are available in your account, and their names.</p><p>This operation takes the optional <code>Tags</code> field, which you can use as a filter on the response so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only resources with the tag are retrieved.</p>
 
 @param request A container for the necessary parameters to execute the ListDevEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueListDevEndpointsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueListDevEndpointsRequest
 @see AWSGlueListDevEndpointsResponse
 */
- (AWSTask<AWSGlueListDevEndpointsResponse *> *)listDevEndpoints:(AWSGlueListDevEndpointsRequest *)request;

/**
 <p>Retrieves the names of all <code>DevEndpoint</code> resources in this AWS account, or the resources with the specified tag. This operation allows you to see which resources are available in your account, and their names.</p><p>This operation takes the optional <code>Tags</code> field, which you can use as a filter on the response so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only resources with the tag are retrieved.</p>
 
 @param request A container for the necessary parameters to execute the ListDevEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueListDevEndpointsRequest
 @see AWSGlueListDevEndpointsResponse
 */
- (void)listDevEndpoints:(AWSGlueListDevEndpointsRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueListDevEndpointsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the names of all job resources in this AWS account, or the resources with the specified tag. This operation allows you to see which resources are available in your account, and their names.</p><p>This operation takes the optional <code>Tags</code> field, which you can use as a filter on the response so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only resources with the tag are retrieved.</p>
 
 @param request A container for the necessary parameters to execute the ListJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueListJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueListJobsRequest
 @see AWSGlueListJobsResponse
 */
- (AWSTask<AWSGlueListJobsResponse *> *)listJobs:(AWSGlueListJobsRequest *)request;

/**
 <p>Retrieves the names of all job resources in this AWS account, or the resources with the specified tag. This operation allows you to see which resources are available in your account, and their names.</p><p>This operation takes the optional <code>Tags</code> field, which you can use as a filter on the response so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only resources with the tag are retrieved.</p>
 
 @param request A container for the necessary parameters to execute the ListJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueListJobsRequest
 @see AWSGlueListJobsResponse
 */
- (void)listJobs:(AWSGlueListJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueListJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Retrieves a sortable, filterable list of existing AWS Glue machine learning transforms in this AWS account, or the resources with the specified tag. This operation takes the optional <code>Tags</code> field, which you can use as a filter of the responses so that tagged resources can be retrieved as a group. If you choose to use tag filtering, only resources with the tags are retrieved. </p>
 
 @param request A container for the necessary parameters to execute the ListMLTransforms service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueListMLTransformsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`.
 
 @see AWSGlueListMLTransformsRequest
 @see AWSGlueListMLTransformsResponse
 */
- (AWSTask<AWSGlueListMLTransformsResponse *> *)listMLTransforms:(AWSGlueListMLTransformsRequest *)request;

/**
 <p> Retrieves a sortable, filterable list of existing AWS Glue machine learning transforms in this AWS account, or the resources with the specified tag. This operation takes the optional <code>Tags</code> field, which you can use as a filter of the responses so that tagged resources can be retrieved as a group. If you choose to use tag filtering, only resources with the tags are retrieved. </p>
 
 @param request A container for the necessary parameters to execute the ListMLTransforms service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`.
 
 @see AWSGlueListMLTransformsRequest
 @see AWSGlueListMLTransformsResponse
 */
- (void)listMLTransforms:(AWSGlueListMLTransformsRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueListMLTransformsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the names of all trigger resources in this AWS account, or the resources with the specified tag. This operation allows you to see which resources are available in your account, and their names.</p><p>This operation takes the optional <code>Tags</code> field, which you can use as a filter on the response so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only resources with the tag are retrieved.</p>
 
 @param request A container for the necessary parameters to execute the ListTriggers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueListTriggersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueListTriggersRequest
 @see AWSGlueListTriggersResponse
 */
- (AWSTask<AWSGlueListTriggersResponse *> *)listTriggers:(AWSGlueListTriggersRequest *)request;

/**
 <p>Retrieves the names of all trigger resources in this AWS account, or the resources with the specified tag. This operation allows you to see which resources are available in your account, and their names.</p><p>This operation takes the optional <code>Tags</code> field, which you can use as a filter on the response so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only resources with the tag are retrieved.</p>
 
 @param request A container for the necessary parameters to execute the ListTriggers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueListTriggersRequest
 @see AWSGlueListTriggersResponse
 */
- (void)listTriggers:(AWSGlueListTriggersRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueListTriggersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists names of workflows created in the account.</p>
 
 @param request A container for the necessary parameters to execute the ListWorkflows service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueListWorkflowsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueListWorkflowsRequest
 @see AWSGlueListWorkflowsResponse
 */
- (AWSTask<AWSGlueListWorkflowsResponse *> *)listWorkflows:(AWSGlueListWorkflowsRequest *)request;

/**
 <p>Lists names of workflows created in the account.</p>
 
 @param request A container for the necessary parameters to execute the ListWorkflows service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueListWorkflowsRequest
 @see AWSGlueListWorkflowsResponse
 */
- (void)listWorkflows:(AWSGlueListWorkflowsRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueListWorkflowsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the security configuration for a specified catalog. After the configuration has been set, the specified encryption is applied to every catalog write thereafter.</p>
 
 @param request A container for the necessary parameters to execute the PutDataCatalogEncryptionSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGluePutDataCatalogEncryptionSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInternalService`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGluePutDataCatalogEncryptionSettingsRequest
 @see AWSGluePutDataCatalogEncryptionSettingsResponse
 */
- (AWSTask<AWSGluePutDataCatalogEncryptionSettingsResponse *> *)putDataCatalogEncryptionSettings:(AWSGluePutDataCatalogEncryptionSettingsRequest *)request;

/**
 <p>Sets the security configuration for a specified catalog. After the configuration has been set, the specified encryption is applied to every catalog write thereafter.</p>
 
 @param request A container for the necessary parameters to execute the PutDataCatalogEncryptionSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInternalService`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGluePutDataCatalogEncryptionSettingsRequest
 @see AWSGluePutDataCatalogEncryptionSettingsResponse
 */
- (void)putDataCatalogEncryptionSettings:(AWSGluePutDataCatalogEncryptionSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSGluePutDataCatalogEncryptionSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the Data Catalog resource policy for access control.</p>
 
 @param request A container for the necessary parameters to execute the PutResourcePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGluePutResourcePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorConditionCheckFailure`.
 
 @see AWSGluePutResourcePolicyRequest
 @see AWSGluePutResourcePolicyResponse
 */
- (AWSTask<AWSGluePutResourcePolicyResponse *> *)putResourcePolicy:(AWSGluePutResourcePolicyRequest *)request;

/**
 <p>Sets the Data Catalog resource policy for access control.</p>
 
 @param request A container for the necessary parameters to execute the PutResourcePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorConditionCheckFailure`.
 
 @see AWSGluePutResourcePolicyRequest
 @see AWSGluePutResourcePolicyResponse
 */
- (void)putResourcePolicy:(AWSGluePutResourcePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSGluePutResourcePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Puts the specified workflow run properties for the given workflow run. If a property already exists for the specified run, then it overrides the value otherwise adds the property to existing properties.</p>
 
 @param request A container for the necessary parameters to execute the PutWorkflowRunProperties service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGluePutWorkflowRunPropertiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorAlreadyExists`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorConcurrentModification`.
 
 @see AWSGluePutWorkflowRunPropertiesRequest
 @see AWSGluePutWorkflowRunPropertiesResponse
 */
- (AWSTask<AWSGluePutWorkflowRunPropertiesResponse *> *)putWorkflowRunProperties:(AWSGluePutWorkflowRunPropertiesRequest *)request;

/**
 <p>Puts the specified workflow run properties for the given workflow run. If a property already exists for the specified run, then it overrides the value otherwise adds the property to existing properties.</p>
 
 @param request A container for the necessary parameters to execute the PutWorkflowRunProperties service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorAlreadyExists`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorConcurrentModification`.
 
 @see AWSGluePutWorkflowRunPropertiesRequest
 @see AWSGluePutWorkflowRunPropertiesResponse
 */
- (void)putWorkflowRunProperties:(AWSGluePutWorkflowRunPropertiesRequest *)request completionHandler:(void (^ _Nullable)(AWSGluePutWorkflowRunPropertiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Resets a bookmark entry.</p>
 
 @param request A container for the necessary parameters to execute the ResetJobBookmark service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueResetJobBookmarkResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueResetJobBookmarkRequest
 @see AWSGlueResetJobBookmarkResponse
 */
- (AWSTask<AWSGlueResetJobBookmarkResponse *> *)resetJobBookmark:(AWSGlueResetJobBookmarkRequest *)request;

/**
 <p>Resets a bookmark entry.</p>
 
 @param request A container for the necessary parameters to execute the ResetJobBookmark service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueResetJobBookmarkRequest
 @see AWSGlueResetJobBookmarkResponse
 */
- (void)resetJobBookmark:(AWSGlueResetJobBookmarkRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueResetJobBookmarkResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches a set of tables based on properties in the table metadata as well as on the parent database. You can search against text or filter conditions. </p><p>You can only get tables that you have access to based on the security policies defined in Lake Formation. You need at least a read-only access to the table for it to be returned. If you do not have access to all the columns in the table, these columns will not be searched against when returning the list of tables back to you. If you have access to the columns but not the data in the columns, those columns and the associated metadata for those columns will be included in the search. </p>
 
 @param request A container for the necessary parameters to execute the SearchTables service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueSearchTablesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInternalService`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueSearchTablesRequest
 @see AWSGlueSearchTablesResponse
 */
- (AWSTask<AWSGlueSearchTablesResponse *> *)searchTables:(AWSGlueSearchTablesRequest *)request;

/**
 <p>Searches a set of tables based on properties in the table metadata as well as on the parent database. You can search against text or filter conditions. </p><p>You can only get tables that you have access to based on the security policies defined in Lake Formation. You need at least a read-only access to the table for it to be returned. If you do not have access to all the columns in the table, these columns will not be searched against when returning the list of tables back to you. If you have access to the columns but not the data in the columns, those columns and the associated metadata for those columns will be included in the search. </p>
 
 @param request A container for the necessary parameters to execute the SearchTables service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInternalService`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueSearchTablesRequest
 @see AWSGlueSearchTablesResponse
 */
- (void)searchTables:(AWSGlueSearchTablesRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueSearchTablesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a crawl using the specified crawler, regardless of what is scheduled. If the crawler is already running, returns a <a href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-exceptions.html#aws-glue-api-exceptions-CrawlerRunningException">CrawlerRunningException</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartCrawler service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueStartCrawlerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorCrawlerRunning`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueStartCrawlerRequest
 @see AWSGlueStartCrawlerResponse
 */
- (AWSTask<AWSGlueStartCrawlerResponse *> *)startCrawler:(AWSGlueStartCrawlerRequest *)request;

/**
 <p>Starts a crawl using the specified crawler, regardless of what is scheduled. If the crawler is already running, returns a <a href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-exceptions.html#aws-glue-api-exceptions-CrawlerRunningException">CrawlerRunningException</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartCrawler service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorCrawlerRunning`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueStartCrawlerRequest
 @see AWSGlueStartCrawlerResponse
 */
- (void)startCrawler:(AWSGlueStartCrawlerRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueStartCrawlerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Changes the schedule state of the specified crawler to <code>SCHEDULED</code>, unless the crawler is already running or the schedule state is already <code>SCHEDULED</code>.</p>
 
 @param request A container for the necessary parameters to execute the StartCrawlerSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueStartCrawlerScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorSchedulerRunning`, `AWSGlueErrorSchedulerTransitioning`, `AWSGlueErrorNoSchedule`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueStartCrawlerScheduleRequest
 @see AWSGlueStartCrawlerScheduleResponse
 */
- (AWSTask<AWSGlueStartCrawlerScheduleResponse *> *)startCrawlerSchedule:(AWSGlueStartCrawlerScheduleRequest *)request;

/**
 <p>Changes the schedule state of the specified crawler to <code>SCHEDULED</code>, unless the crawler is already running or the schedule state is already <code>SCHEDULED</code>.</p>
 
 @param request A container for the necessary parameters to execute the StartCrawlerSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorSchedulerRunning`, `AWSGlueErrorSchedulerTransitioning`, `AWSGlueErrorNoSchedule`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueStartCrawlerScheduleRequest
 @see AWSGlueStartCrawlerScheduleResponse
 */
- (void)startCrawlerSchedule:(AWSGlueStartCrawlerScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueStartCrawlerScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Begins an asynchronous task to export all labeled data for a particular transform. This task is the only label-related API call that is not part of the typical active learning workflow. You typically use <code>StartExportLabelsTaskRun</code> when you want to work with all of your existing labels at the same time, such as when you want to remove or change labels that were previously submitted as truth. This API operation accepts the <code>TransformId</code> whose labels you want to export and an Amazon Simple Storage Service (Amazon S3) path to export the labels to. The operation returns a <code>TaskRunId</code>. You can check on the status of your task run by calling the <code>GetMLTaskRun</code> API.</p>
 
 @param request A container for the necessary parameters to execute the StartExportLabelsTaskRun service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueStartExportLabelsTaskRunResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`.
 
 @see AWSGlueStartExportLabelsTaskRunRequest
 @see AWSGlueStartExportLabelsTaskRunResponse
 */
- (AWSTask<AWSGlueStartExportLabelsTaskRunResponse *> *)startExportLabelsTaskRun:(AWSGlueStartExportLabelsTaskRunRequest *)request;

/**
 <p>Begins an asynchronous task to export all labeled data for a particular transform. This task is the only label-related API call that is not part of the typical active learning workflow. You typically use <code>StartExportLabelsTaskRun</code> when you want to work with all of your existing labels at the same time, such as when you want to remove or change labels that were previously submitted as truth. This API operation accepts the <code>TransformId</code> whose labels you want to export and an Amazon Simple Storage Service (Amazon S3) path to export the labels to. The operation returns a <code>TaskRunId</code>. You can check on the status of your task run by calling the <code>GetMLTaskRun</code> API.</p>
 
 @param request A container for the necessary parameters to execute the StartExportLabelsTaskRun service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`.
 
 @see AWSGlueStartExportLabelsTaskRunRequest
 @see AWSGlueStartExportLabelsTaskRunResponse
 */
- (void)startExportLabelsTaskRun:(AWSGlueStartExportLabelsTaskRunRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueStartExportLabelsTaskRunResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables you to provide additional labels (examples of truth) to be used to teach the machine learning transform and improve its quality. This API operation is generally used as part of the active learning workflow that starts with the <code>StartMLLabelingSetGenerationTaskRun</code> call and that ultimately results in improving the quality of your machine learning transform. </p><p>After the <code>StartMLLabelingSetGenerationTaskRun</code> finishes, AWS Glue machine learning will have generated a series of questions for humans to answer. (Answering these questions is often called 'labeling' in the machine learning workflows). In the case of the <code>FindMatches</code> transform, these questions are of the form, “What is the correct way to group these rows together into groups composed entirely of matching records?” After the labeling process is finished, users upload their answers/labels with a call to <code>StartImportLabelsTaskRun</code>. After <code>StartImportLabelsTaskRun</code> finishes, all future runs of the machine learning transform use the new and improved labels and perform a higher-quality transformation.</p><p>By default, <code>StartMLLabelingSetGenerationTaskRun</code> continually learns from and combines all labels that you upload unless you set <code>Replace</code> to true. If you set <code>Replace</code> to true, <code>StartImportLabelsTaskRun</code> deletes and forgets all previously uploaded labels and learns only from the exact set that you upload. Replacing labels can be helpful if you realize that you previously uploaded incorrect labels, and you believe that they are having a negative effect on your transform quality.</p><p>You can check on the status of your task run by calling the <code>GetMLTaskRun</code> operation. </p>
 
 @param request A container for the necessary parameters to execute the StartImportLabelsTaskRun service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueStartImportLabelsTaskRunResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorInternalService`.
 
 @see AWSGlueStartImportLabelsTaskRunRequest
 @see AWSGlueStartImportLabelsTaskRunResponse
 */
- (AWSTask<AWSGlueStartImportLabelsTaskRunResponse *> *)startImportLabelsTaskRun:(AWSGlueStartImportLabelsTaskRunRequest *)request;

/**
 <p>Enables you to provide additional labels (examples of truth) to be used to teach the machine learning transform and improve its quality. This API operation is generally used as part of the active learning workflow that starts with the <code>StartMLLabelingSetGenerationTaskRun</code> call and that ultimately results in improving the quality of your machine learning transform. </p><p>After the <code>StartMLLabelingSetGenerationTaskRun</code> finishes, AWS Glue machine learning will have generated a series of questions for humans to answer. (Answering these questions is often called 'labeling' in the machine learning workflows). In the case of the <code>FindMatches</code> transform, these questions are of the form, “What is the correct way to group these rows together into groups composed entirely of matching records?” After the labeling process is finished, users upload their answers/labels with a call to <code>StartImportLabelsTaskRun</code>. After <code>StartImportLabelsTaskRun</code> finishes, all future runs of the machine learning transform use the new and improved labels and perform a higher-quality transformation.</p><p>By default, <code>StartMLLabelingSetGenerationTaskRun</code> continually learns from and combines all labels that you upload unless you set <code>Replace</code> to true. If you set <code>Replace</code> to true, <code>StartImportLabelsTaskRun</code> deletes and forgets all previously uploaded labels and learns only from the exact set that you upload. Replacing labels can be helpful if you realize that you previously uploaded incorrect labels, and you believe that they are having a negative effect on your transform quality.</p><p>You can check on the status of your task run by calling the <code>GetMLTaskRun</code> operation. </p>
 
 @param request A container for the necessary parameters to execute the StartImportLabelsTaskRun service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorInternalService`.
 
 @see AWSGlueStartImportLabelsTaskRunRequest
 @see AWSGlueStartImportLabelsTaskRunResponse
 */
- (void)startImportLabelsTaskRun:(AWSGlueStartImportLabelsTaskRunRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueStartImportLabelsTaskRunResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a job run using a job definition.</p>
 
 @param request A container for the necessary parameters to execute the StartJobRun service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueStartJobRunResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorConcurrentRunsExceeded`.
 
 @see AWSGlueStartJobRunRequest
 @see AWSGlueStartJobRunResponse
 */
- (AWSTask<AWSGlueStartJobRunResponse *> *)startJobRun:(AWSGlueStartJobRunRequest *)request;

/**
 <p>Starts a job run using a job definition.</p>
 
 @param request A container for the necessary parameters to execute the StartJobRun service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorConcurrentRunsExceeded`.
 
 @see AWSGlueStartJobRunRequest
 @see AWSGlueStartJobRunResponse
 */
- (void)startJobRun:(AWSGlueStartJobRunRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueStartJobRunResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a task to estimate the quality of the transform. </p><p>When you provide label sets as examples of truth, AWS Glue machine learning uses some of those examples to learn from them. The rest of the labels are used as a test to estimate quality.</p><p>Returns a unique identifier for the run. You can call <code>GetMLTaskRun</code> to get more information about the stats of the <code>EvaluationTaskRun</code>.</p>
 
 @param request A container for the necessary parameters to execute the StartMLEvaluationTaskRun service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueStartMLEvaluationTaskRunResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`, `AWSGlueErrorConcurrentRunsExceeded`, `AWSGlueErrorMLTransformNotReady`.
 
 @see AWSGlueStartMLEvaluationTaskRunRequest
 @see AWSGlueStartMLEvaluationTaskRunResponse
 */
- (AWSTask<AWSGlueStartMLEvaluationTaskRunResponse *> *)startMLEvaluationTaskRun:(AWSGlueStartMLEvaluationTaskRunRequest *)request;

/**
 <p>Starts a task to estimate the quality of the transform. </p><p>When you provide label sets as examples of truth, AWS Glue machine learning uses some of those examples to learn from them. The rest of the labels are used as a test to estimate quality.</p><p>Returns a unique identifier for the run. You can call <code>GetMLTaskRun</code> to get more information about the stats of the <code>EvaluationTaskRun</code>.</p>
 
 @param request A container for the necessary parameters to execute the StartMLEvaluationTaskRun service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`, `AWSGlueErrorConcurrentRunsExceeded`, `AWSGlueErrorMLTransformNotReady`.
 
 @see AWSGlueStartMLEvaluationTaskRunRequest
 @see AWSGlueStartMLEvaluationTaskRunResponse
 */
- (void)startMLEvaluationTaskRun:(AWSGlueStartMLEvaluationTaskRunRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueStartMLEvaluationTaskRunResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts the active learning workflow for your machine learning transform to improve the transform's quality by generating label sets and adding labels.</p><p>When the <code>StartMLLabelingSetGenerationTaskRun</code> finishes, AWS Glue will have generated a "labeling set" or a set of questions for humans to answer.</p><p>In the case of the <code>FindMatches</code> transform, these questions are of the form, “What is the correct way to group these rows together into groups composed entirely of matching records?” </p><p>After the labeling process is finished, you can upload your labels with a call to <code>StartImportLabelsTaskRun</code>. After <code>StartImportLabelsTaskRun</code> finishes, all future runs of the machine learning transform will use the new and improved labels and perform a higher-quality transformation.</p>
 
 @param request A container for the necessary parameters to execute the StartMLLabelingSetGenerationTaskRun service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueStartMLLabelingSetGenerationTaskRunResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`, `AWSGlueErrorConcurrentRunsExceeded`.
 
 @see AWSGlueStartMLLabelingSetGenerationTaskRunRequest
 @see AWSGlueStartMLLabelingSetGenerationTaskRunResponse
 */
- (AWSTask<AWSGlueStartMLLabelingSetGenerationTaskRunResponse *> *)startMLLabelingSetGenerationTaskRun:(AWSGlueStartMLLabelingSetGenerationTaskRunRequest *)request;

/**
 <p>Starts the active learning workflow for your machine learning transform to improve the transform's quality by generating label sets and adding labels.</p><p>When the <code>StartMLLabelingSetGenerationTaskRun</code> finishes, AWS Glue will have generated a "labeling set" or a set of questions for humans to answer.</p><p>In the case of the <code>FindMatches</code> transform, these questions are of the form, “What is the correct way to group these rows together into groups composed entirely of matching records?” </p><p>After the labeling process is finished, you can upload your labels with a call to <code>StartImportLabelsTaskRun</code>. After <code>StartImportLabelsTaskRun</code> finishes, all future runs of the machine learning transform will use the new and improved labels and perform a higher-quality transformation.</p>
 
 @param request A container for the necessary parameters to execute the StartMLLabelingSetGenerationTaskRun service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`, `AWSGlueErrorConcurrentRunsExceeded`.
 
 @see AWSGlueStartMLLabelingSetGenerationTaskRunRequest
 @see AWSGlueStartMLLabelingSetGenerationTaskRunResponse
 */
- (void)startMLLabelingSetGenerationTaskRun:(AWSGlueStartMLLabelingSetGenerationTaskRunRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueStartMLLabelingSetGenerationTaskRunResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts an existing trigger. See <a href="https://docs.aws.amazon.com/glue/latest/dg/trigger-job.html">Triggering Jobs</a> for information about how different types of trigger are started.</p>
 
 @param request A container for the necessary parameters to execute the StartTrigger service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueStartTriggerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorConcurrentRunsExceeded`.
 
 @see AWSGlueStartTriggerRequest
 @see AWSGlueStartTriggerResponse
 */
- (AWSTask<AWSGlueStartTriggerResponse *> *)startTrigger:(AWSGlueStartTriggerRequest *)request;

/**
 <p>Starts an existing trigger. See <a href="https://docs.aws.amazon.com/glue/latest/dg/trigger-job.html">Triggering Jobs</a> for information about how different types of trigger are started.</p>
 
 @param request A container for the necessary parameters to execute the StartTrigger service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorConcurrentRunsExceeded`.
 
 @see AWSGlueStartTriggerRequest
 @see AWSGlueStartTriggerResponse
 */
- (void)startTrigger:(AWSGlueStartTriggerRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueStartTriggerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a new run of the specified workflow.</p>
 
 @param request A container for the necessary parameters to execute the StartWorkflowRun service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueStartWorkflowRunResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorConcurrentRunsExceeded`.
 
 @see AWSGlueStartWorkflowRunRequest
 @see AWSGlueStartWorkflowRunResponse
 */
- (AWSTask<AWSGlueStartWorkflowRunResponse *> *)startWorkflowRun:(AWSGlueStartWorkflowRunRequest *)request;

/**
 <p>Starts a new run of the specified workflow.</p>
 
 @param request A container for the necessary parameters to execute the StartWorkflowRun service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorConcurrentRunsExceeded`.
 
 @see AWSGlueStartWorkflowRunRequest
 @see AWSGlueStartWorkflowRunResponse
 */
- (void)startWorkflowRun:(AWSGlueStartWorkflowRunRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueStartWorkflowRunResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>If the specified crawler is running, stops the crawl.</p>
 
 @param request A container for the necessary parameters to execute the StopCrawler service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueStopCrawlerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorCrawlerNotRunning`, `AWSGlueErrorCrawlerStopping`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueStopCrawlerRequest
 @see AWSGlueStopCrawlerResponse
 */
- (AWSTask<AWSGlueStopCrawlerResponse *> *)stopCrawler:(AWSGlueStopCrawlerRequest *)request;

/**
 <p>If the specified crawler is running, stops the crawl.</p>
 
 @param request A container for the necessary parameters to execute the StopCrawler service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorCrawlerNotRunning`, `AWSGlueErrorCrawlerStopping`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueStopCrawlerRequest
 @see AWSGlueStopCrawlerResponse
 */
- (void)stopCrawler:(AWSGlueStopCrawlerRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueStopCrawlerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the schedule state of the specified crawler to <code>NOT_SCHEDULED</code>, but does not stop the crawler if it is already running.</p>
 
 @param request A container for the necessary parameters to execute the StopCrawlerSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueStopCrawlerScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorSchedulerNotRunning`, `AWSGlueErrorSchedulerTransitioning`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueStopCrawlerScheduleRequest
 @see AWSGlueStopCrawlerScheduleResponse
 */
- (AWSTask<AWSGlueStopCrawlerScheduleResponse *> *)stopCrawlerSchedule:(AWSGlueStopCrawlerScheduleRequest *)request;

/**
 <p>Sets the schedule state of the specified crawler to <code>NOT_SCHEDULED</code>, but does not stop the crawler if it is already running.</p>
 
 @param request A container for the necessary parameters to execute the StopCrawlerSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorSchedulerNotRunning`, `AWSGlueErrorSchedulerTransitioning`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueStopCrawlerScheduleRequest
 @see AWSGlueStopCrawlerScheduleResponse
 */
- (void)stopCrawlerSchedule:(AWSGlueStopCrawlerScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueStopCrawlerScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops a specified trigger.</p>
 
 @param request A container for the necessary parameters to execute the StopTrigger service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueStopTriggerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorConcurrentModification`.
 
 @see AWSGlueStopTriggerRequest
 @see AWSGlueStopTriggerResponse
 */
- (AWSTask<AWSGlueStopTriggerResponse *> *)stopTrigger:(AWSGlueStopTriggerRequest *)request;

/**
 <p>Stops a specified trigger.</p>
 
 @param request A container for the necessary parameters to execute the StopTrigger service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorConcurrentModification`.
 
 @see AWSGlueStopTriggerRequest
 @see AWSGlueStopTriggerResponse
 */
- (void)stopTrigger:(AWSGlueStopTriggerRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueStopTriggerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops the execution of the specified workflow run.</p>
 
 @param request A container for the necessary parameters to execute the StopWorkflowRun service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueStopWorkflowRunResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorIllegalWorkflowState`.
 
 @see AWSGlueStopWorkflowRunRequest
 @see AWSGlueStopWorkflowRunResponse
 */
- (AWSTask<AWSGlueStopWorkflowRunResponse *> *)stopWorkflowRun:(AWSGlueStopWorkflowRunRequest *)request;

/**
 <p>Stops the execution of the specified workflow run.</p>
 
 @param request A container for the necessary parameters to execute the StopWorkflowRun service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorIllegalWorkflowState`.
 
 @see AWSGlueStopWorkflowRunRequest
 @see AWSGlueStopWorkflowRunResponse
 */
- (void)stopWorkflowRun:(AWSGlueStopWorkflowRunRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueStopWorkflowRunResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds tags to a resource. A tag is a label you can assign to an AWS resource. In AWS Glue, you can tag only certain resources. For information about what resources you can tag, see <a href="https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">AWS Tags in AWS Glue</a>.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorEntityNotFound`.
 
 @see AWSGlueTagResourceRequest
 @see AWSGlueTagResourceResponse
 */
- (AWSTask<AWSGlueTagResourceResponse *> *)tagResource:(AWSGlueTagResourceRequest *)request;

/**
 <p>Adds tags to a resource. A tag is a label you can assign to an AWS resource. In AWS Glue, you can tag only certain resources. For information about what resources you can tag, see <a href="https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">AWS Tags in AWS Glue</a>.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorEntityNotFound`.
 
 @see AWSGlueTagResourceRequest
 @see AWSGlueTagResourceResponse
 */
- (void)tagResource:(AWSGlueTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorEntityNotFound`.
 
 @see AWSGlueUntagResourceRequest
 @see AWSGlueUntagResourceResponse
 */
- (AWSTask<AWSGlueUntagResourceResponse *> *)untagResource:(AWSGlueUntagResourceRequest *)request;

/**
 <p>Removes tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorEntityNotFound`.
 
 @see AWSGlueUntagResourceRequest
 @see AWSGlueUntagResourceResponse
 */
- (void)untagResource:(AWSGlueUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies an existing classifier (a <code>GrokClassifier</code>, an <code>XMLClassifier</code>, a <code>JsonClassifier</code>, or a <code>CsvClassifier</code>, depending on which field is present).</p>
 
 @param request A container for the necessary parameters to execute the UpdateClassifier service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueUpdateClassifierResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorVersionMismatch`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueUpdateClassifierRequest
 @see AWSGlueUpdateClassifierResponse
 */
- (AWSTask<AWSGlueUpdateClassifierResponse *> *)updateClassifier:(AWSGlueUpdateClassifierRequest *)request;

/**
 <p>Modifies an existing classifier (a <code>GrokClassifier</code>, an <code>XMLClassifier</code>, a <code>JsonClassifier</code>, or a <code>CsvClassifier</code>, depending on which field is present).</p>
 
 @param request A container for the necessary parameters to execute the UpdateClassifier service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorVersionMismatch`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueUpdateClassifierRequest
 @see AWSGlueUpdateClassifierResponse
 */
- (void)updateClassifier:(AWSGlueUpdateClassifierRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueUpdateClassifierResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates partition statistics of columns.</p>
 
 @param request A container for the necessary parameters to execute the UpdateColumnStatisticsForPartition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueUpdateColumnStatisticsForPartitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueUpdateColumnStatisticsForPartitionRequest
 @see AWSGlueUpdateColumnStatisticsForPartitionResponse
 */
- (AWSTask<AWSGlueUpdateColumnStatisticsForPartitionResponse *> *)updateColumnStatisticsForPartition:(AWSGlueUpdateColumnStatisticsForPartitionRequest *)request;

/**
 <p>Creates or updates partition statistics of columns.</p>
 
 @param request A container for the necessary parameters to execute the UpdateColumnStatisticsForPartition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueUpdateColumnStatisticsForPartitionRequest
 @see AWSGlueUpdateColumnStatisticsForPartitionResponse
 */
- (void)updateColumnStatisticsForPartition:(AWSGlueUpdateColumnStatisticsForPartitionRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueUpdateColumnStatisticsForPartitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates table statistics of columns.</p>
 
 @param request A container for the necessary parameters to execute the UpdateColumnStatisticsForTable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueUpdateColumnStatisticsForTableResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueUpdateColumnStatisticsForTableRequest
 @see AWSGlueUpdateColumnStatisticsForTableResponse
 */
- (AWSTask<AWSGlueUpdateColumnStatisticsForTableResponse *> *)updateColumnStatisticsForTable:(AWSGlueUpdateColumnStatisticsForTableRequest *)request;

/**
 <p>Creates or updates table statistics of columns.</p>
 
 @param request A container for the necessary parameters to execute the UpdateColumnStatisticsForTable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueUpdateColumnStatisticsForTableRequest
 @see AWSGlueUpdateColumnStatisticsForTableResponse
 */
- (void)updateColumnStatisticsForTable:(AWSGlueUpdateColumnStatisticsForTableRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueUpdateColumnStatisticsForTableResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a connection definition in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the UpdateConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueUpdateConnectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueUpdateConnectionRequest
 @see AWSGlueUpdateConnectionResponse
 */
- (AWSTask<AWSGlueUpdateConnectionResponse *> *)updateConnection:(AWSGlueUpdateConnectionRequest *)request;

/**
 <p>Updates a connection definition in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the UpdateConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueUpdateConnectionRequest
 @see AWSGlueUpdateConnectionResponse
 */
- (void)updateConnection:(AWSGlueUpdateConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueUpdateConnectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a crawler. If a crawler is running, you must stop it using <code>StopCrawler</code> before updating it.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCrawler service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueUpdateCrawlerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorVersionMismatch`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorCrawlerRunning`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueUpdateCrawlerRequest
 @see AWSGlueUpdateCrawlerResponse
 */
- (AWSTask<AWSGlueUpdateCrawlerResponse *> *)updateCrawler:(AWSGlueUpdateCrawlerRequest *)request;

/**
 <p>Updates a crawler. If a crawler is running, you must stop it using <code>StopCrawler</code> before updating it.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCrawler service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorVersionMismatch`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorCrawlerRunning`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueUpdateCrawlerRequest
 @see AWSGlueUpdateCrawlerResponse
 */
- (void)updateCrawler:(AWSGlueUpdateCrawlerRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueUpdateCrawlerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the schedule of a crawler using a <code>cron</code> expression. </p>
 
 @param request A container for the necessary parameters to execute the UpdateCrawlerSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueUpdateCrawlerScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorVersionMismatch`, `AWSGlueErrorSchedulerTransitioning`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueUpdateCrawlerScheduleRequest
 @see AWSGlueUpdateCrawlerScheduleResponse
 */
- (AWSTask<AWSGlueUpdateCrawlerScheduleResponse *> *)updateCrawlerSchedule:(AWSGlueUpdateCrawlerScheduleRequest *)request;

/**
 <p>Updates the schedule of a crawler using a <code>cron</code> expression. </p>
 
 @param request A container for the necessary parameters to execute the UpdateCrawlerSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorVersionMismatch`, `AWSGlueErrorSchedulerTransitioning`, `AWSGlueErrorOperationTimeout`.
 
 @see AWSGlueUpdateCrawlerScheduleRequest
 @see AWSGlueUpdateCrawlerScheduleResponse
 */
- (void)updateCrawlerSchedule:(AWSGlueUpdateCrawlerScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueUpdateCrawlerScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing database definition in a Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDatabase service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueUpdateDatabaseResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueUpdateDatabaseRequest
 @see AWSGlueUpdateDatabaseResponse
 */
- (AWSTask<AWSGlueUpdateDatabaseResponse *> *)updateDatabase:(AWSGlueUpdateDatabaseRequest *)request;

/**
 <p>Updates an existing database definition in a Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDatabase service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueUpdateDatabaseRequest
 @see AWSGlueUpdateDatabaseResponse
 */
- (void)updateDatabase:(AWSGlueUpdateDatabaseRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueUpdateDatabaseResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a specified development endpoint.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDevEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueUpdateDevEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorValidation`.
 
 @see AWSGlueUpdateDevEndpointRequest
 @see AWSGlueUpdateDevEndpointResponse
 */
- (AWSTask<AWSGlueUpdateDevEndpointResponse *> *)updateDevEndpoint:(AWSGlueUpdateDevEndpointRequest *)request;

/**
 <p>Updates a specified development endpoint.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDevEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorValidation`.
 
 @see AWSGlueUpdateDevEndpointRequest
 @see AWSGlueUpdateDevEndpointResponse
 */
- (void)updateDevEndpoint:(AWSGlueUpdateDevEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueUpdateDevEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing job definition.</p>
 
 @param request A container for the necessary parameters to execute the UpdateJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueUpdateJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorConcurrentModification`.
 
 @see AWSGlueUpdateJobRequest
 @see AWSGlueUpdateJobResponse
 */
- (AWSTask<AWSGlueUpdateJobResponse *> *)updateJob:(AWSGlueUpdateJobRequest *)request;

/**
 <p>Updates an existing job definition.</p>
 
 @param request A container for the necessary parameters to execute the UpdateJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorConcurrentModification`.
 
 @see AWSGlueUpdateJobRequest
 @see AWSGlueUpdateJobResponse
 */
- (void)updateJob:(AWSGlueUpdateJobRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueUpdateJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing machine learning transform. Call this operation to tune the algorithm parameters to achieve better results.</p><p>After calling this operation, you can call the <code>StartMLEvaluationTaskRun</code> operation to assess how well your new parameters achieved your goals (such as improving the quality of your machine learning transform, or making it more cost-effective).</p>
 
 @param request A container for the necessary parameters to execute the UpdateMLTransform service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueUpdateMLTransformResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`, `AWSGlueErrorAccessDenied`.
 
 @see AWSGlueUpdateMLTransformRequest
 @see AWSGlueUpdateMLTransformResponse
 */
- (AWSTask<AWSGlueUpdateMLTransformResponse *> *)updateMLTransform:(AWSGlueUpdateMLTransformRequest *)request;

/**
 <p>Updates an existing machine learning transform. Call this operation to tune the algorithm parameters to achieve better results.</p><p>After calling this operation, you can call the <code>StartMLEvaluationTaskRun</code> operation to assess how well your new parameters achieved your goals (such as improving the quality of your machine learning transform, or making it more cost-effective).</p>
 
 @param request A container for the necessary parameters to execute the UpdateMLTransform service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorInternalService`, `AWSGlueErrorAccessDenied`.
 
 @see AWSGlueUpdateMLTransformRequest
 @see AWSGlueUpdateMLTransformResponse
 */
- (void)updateMLTransform:(AWSGlueUpdateMLTransformRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueUpdateMLTransformResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a partition.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePartition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueUpdatePartitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueUpdatePartitionRequest
 @see AWSGlueUpdatePartitionResponse
 */
- (AWSTask<AWSGlueUpdatePartitionResponse *> *)updatePartition:(AWSGlueUpdatePartitionRequest *)request;

/**
 <p>Updates a partition.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePartition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueUpdatePartitionRequest
 @see AWSGlueUpdatePartitionResponse
 */
- (void)updatePartition:(AWSGlueUpdatePartitionRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueUpdatePartitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a metadata table in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueUpdateTableResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorConcurrentModification`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueUpdateTableRequest
 @see AWSGlueUpdateTableResponse
 */
- (AWSTask<AWSGlueUpdateTableResponse *> *)updateTable:(AWSGlueUpdateTableRequest *)request;

/**
 <p>Updates a metadata table in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorConcurrentModification`, `AWSGlueErrorResourceNumberLimitExceeded`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueUpdateTableRequest
 @see AWSGlueUpdateTableResponse
 */
- (void)updateTable:(AWSGlueUpdateTableRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueUpdateTableResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a trigger definition.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTrigger service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueUpdateTriggerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorConcurrentModification`.
 
 @see AWSGlueUpdateTriggerRequest
 @see AWSGlueUpdateTriggerResponse
 */
- (AWSTask<AWSGlueUpdateTriggerResponse *> *)updateTrigger:(AWSGlueUpdateTriggerRequest *)request;

/**
 <p>Updates a trigger definition.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTrigger service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorConcurrentModification`.
 
 @see AWSGlueUpdateTriggerRequest
 @see AWSGlueUpdateTriggerResponse
 */
- (void)updateTrigger:(AWSGlueUpdateTriggerRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueUpdateTriggerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing function definition in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserDefinedFunction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueUpdateUserDefinedFunctionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueUpdateUserDefinedFunctionRequest
 @see AWSGlueUpdateUserDefinedFunctionResponse
 */
- (AWSTask<AWSGlueUpdateUserDefinedFunctionResponse *> *)updateUserDefinedFunction:(AWSGlueUpdateUserDefinedFunctionRequest *)request;

/**
 <p>Updates an existing function definition in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserDefinedFunction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInvalidInput`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorGlueEncryption`.
 
 @see AWSGlueUpdateUserDefinedFunctionRequest
 @see AWSGlueUpdateUserDefinedFunctionResponse
 */
- (void)updateUserDefinedFunction:(AWSGlueUpdateUserDefinedFunctionRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueUpdateUserDefinedFunctionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing workflow.</p>
 
 @param request A container for the necessary parameters to execute the UpdateWorkflow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGlueUpdateWorkflowResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorConcurrentModification`.
 
 @see AWSGlueUpdateWorkflowRequest
 @see AWSGlueUpdateWorkflowResponse
 */
- (AWSTask<AWSGlueUpdateWorkflowResponse *> *)updateWorkflow:(AWSGlueUpdateWorkflowRequest *)request;

/**
 <p>Updates an existing workflow.</p>
 
 @param request A container for the necessary parameters to execute the UpdateWorkflow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGlueErrorDomain` domain and the following error code: `AWSGlueErrorInvalidInput`, `AWSGlueErrorEntityNotFound`, `AWSGlueErrorInternalService`, `AWSGlueErrorOperationTimeout`, `AWSGlueErrorConcurrentModification`.
 
 @see AWSGlueUpdateWorkflowRequest
 @see AWSGlueUpdateWorkflowResponse
 */
- (void)updateWorkflow:(AWSGlueUpdateWorkflowRequest *)request completionHandler:(void (^ _Nullable)(AWSGlueUpdateWorkflowResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
