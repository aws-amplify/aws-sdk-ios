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
#import "AWSglueModel.h"
#import "AWSglueResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSglue
FOUNDATION_EXPORT NSString *const AWSglueSDKVersion;

/**
 <fullname>AWS Glue</fullname><p>Defines the public endpoint for the AWS Glue service.</p>
 */
@interface AWSglue : AWSService

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

     let glue = AWSglue.default()

 *Objective-C*

     AWSglue *glue = [AWSglue defaultglue];

 @return The default service client.
 */
+ (instancetype)defaultglue;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSglue.register(with: configuration!, forKey: "USWest2glue")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSglue registerglueWithConfiguration:configuration forKey:@"USWest2glue"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let glue = AWSglue(forKey: "USWest2glue")

 *Objective-C*

     AWSglue *glue = [AWSglue glueForKey:@"USWest2glue"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerglueWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerglueWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSglue.register(with: configuration!, forKey: "USWest2glue")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSglue registerglueWithConfiguration:configuration forKey:@"USWest2glue"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let glue = AWSglue(forKey: "USWest2glue")

 *Objective-C*

     AWSglue *glue = [AWSglue glueForKey:@"USWest2glue"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)glueForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeglueForKey:(NSString *)key;

/**
 <p>Creates one or more partitions in a batch operation.</p>
 
 @param request A container for the necessary parameters to execute the BatchCreatePartition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueBatchCreatePartitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorAlreadyExists`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorInternalService`, `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueBatchCreatePartitionRequest
 @see AWSglueBatchCreatePartitionResponse
 */
- (AWSTask<AWSglueBatchCreatePartitionResponse *> *)batchCreatePartition:(AWSglueBatchCreatePartitionRequest *)request;

/**
 <p>Creates one or more partitions in a batch operation.</p>
 
 @param request A container for the necessary parameters to execute the BatchCreatePartition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorAlreadyExists`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorInternalService`, `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueBatchCreatePartitionRequest
 @see AWSglueBatchCreatePartitionResponse
 */
- (void)batchCreatePartition:(AWSglueBatchCreatePartitionRequest *)request completionHandler:(void (^ _Nullable)(AWSglueBatchCreatePartitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a list of connection definitions from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeleteConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueBatchDeleteConnectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueBatchDeleteConnectionRequest
 @see AWSglueBatchDeleteConnectionResponse
 */
- (AWSTask<AWSglueBatchDeleteConnectionResponse *> *)batchDeleteConnection:(AWSglueBatchDeleteConnectionRequest *)request;

/**
 <p>Deletes a list of connection definitions from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeleteConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueBatchDeleteConnectionRequest
 @see AWSglueBatchDeleteConnectionResponse
 */
- (void)batchDeleteConnection:(AWSglueBatchDeleteConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSglueBatchDeleteConnectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes one or more partitions in a batch operation.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeletePartition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueBatchDeletePartitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueBatchDeletePartitionRequest
 @see AWSglueBatchDeletePartitionResponse
 */
- (AWSTask<AWSglueBatchDeletePartitionResponse *> *)batchDeletePartition:(AWSglueBatchDeletePartitionRequest *)request;

/**
 <p>Deletes one or more partitions in a batch operation.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeletePartition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueBatchDeletePartitionRequest
 @see AWSglueBatchDeletePartitionResponse
 */
- (void)batchDeletePartition:(AWSglueBatchDeletePartitionRequest *)request completionHandler:(void (^ _Nullable)(AWSglueBatchDeletePartitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes multiple tables at once.</p><note><p>After completing this operation, you no longer have access to the table versions and partitions that belong to the deleted table. AWS Glue deletes these "orphaned" resources asynchronously in a timely manner, at the discretion of the service.</p><p>To ensure the immediate deletion of all related resources, before calling <code>BatchDeleteTable</code>, use <code>DeleteTableVersion</code> or <code>BatchDeleteTableVersion</code>, and <code>DeletePartition</code> or <code>BatchDeletePartition</code>, to delete any resources that belong to the table.</p></note>
 
 @param request A container for the necessary parameters to execute the BatchDeleteTable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueBatchDeleteTableResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueBatchDeleteTableRequest
 @see AWSglueBatchDeleteTableResponse
 */
- (AWSTask<AWSglueBatchDeleteTableResponse *> *)batchDeleteTable:(AWSglueBatchDeleteTableRequest *)request;

/**
 <p>Deletes multiple tables at once.</p><note><p>After completing this operation, you no longer have access to the table versions and partitions that belong to the deleted table. AWS Glue deletes these "orphaned" resources asynchronously in a timely manner, at the discretion of the service.</p><p>To ensure the immediate deletion of all related resources, before calling <code>BatchDeleteTable</code>, use <code>DeleteTableVersion</code> or <code>BatchDeleteTableVersion</code>, and <code>DeletePartition</code> or <code>BatchDeletePartition</code>, to delete any resources that belong to the table.</p></note>
 
 @param request A container for the necessary parameters to execute the BatchDeleteTable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueBatchDeleteTableRequest
 @see AWSglueBatchDeleteTableResponse
 */
- (void)batchDeleteTable:(AWSglueBatchDeleteTableRequest *)request completionHandler:(void (^ _Nullable)(AWSglueBatchDeleteTableResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified batch of versions of a table.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeleteTableVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueBatchDeleteTableVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueBatchDeleteTableVersionRequest
 @see AWSglueBatchDeleteTableVersionResponse
 */
- (AWSTask<AWSglueBatchDeleteTableVersionResponse *> *)batchDeleteTableVersion:(AWSglueBatchDeleteTableVersionRequest *)request;

/**
 <p>Deletes a specified batch of versions of a table.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeleteTableVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueBatchDeleteTableVersionRequest
 @see AWSglueBatchDeleteTableVersionResponse
 */
- (void)batchDeleteTableVersion:(AWSglueBatchDeleteTableVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSglueBatchDeleteTableVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of resource metadata for a given list of crawler names. After calling the <code>ListCrawlers</code> operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetCrawlers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueBatchGetCrawlersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueBatchGetCrawlersRequest
 @see AWSglueBatchGetCrawlersResponse
 */
- (AWSTask<AWSglueBatchGetCrawlersResponse *> *)batchGetCrawlers:(AWSglueBatchGetCrawlersRequest *)request;

/**
 <p>Returns a list of resource metadata for a given list of crawler names. After calling the <code>ListCrawlers</code> operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetCrawlers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueBatchGetCrawlersRequest
 @see AWSglueBatchGetCrawlersResponse
 */
- (void)batchGetCrawlers:(AWSglueBatchGetCrawlersRequest *)request completionHandler:(void (^ _Nullable)(AWSglueBatchGetCrawlersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of resource metadata for a given list of development endpoint names. After calling the <code>ListDevEndpoints</code> operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetDevEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueBatchGetDevEndpointsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorAccessDenied`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`.
 
 @see AWSglueBatchGetDevEndpointsRequest
 @see AWSglueBatchGetDevEndpointsResponse
 */
- (AWSTask<AWSglueBatchGetDevEndpointsResponse *> *)batchGetDevEndpoints:(AWSglueBatchGetDevEndpointsRequest *)request;

/**
 <p>Returns a list of resource metadata for a given list of development endpoint names. After calling the <code>ListDevEndpoints</code> operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetDevEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorAccessDenied`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`.
 
 @see AWSglueBatchGetDevEndpointsRequest
 @see AWSglueBatchGetDevEndpointsResponse
 */
- (void)batchGetDevEndpoints:(AWSglueBatchGetDevEndpointsRequest *)request completionHandler:(void (^ _Nullable)(AWSglueBatchGetDevEndpointsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of resource metadata for a given list of job names. After calling the <code>ListJobs</code> operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags. </p>
 
 @param request A container for the necessary parameters to execute the BatchGetJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueBatchGetJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`.
 
 @see AWSglueBatchGetJobsRequest
 @see AWSglueBatchGetJobsResponse
 */
- (AWSTask<AWSglueBatchGetJobsResponse *> *)batchGetJobs:(AWSglueBatchGetJobsRequest *)request;

/**
 <p>Returns a list of resource metadata for a given list of job names. After calling the <code>ListJobs</code> operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags. </p>
 
 @param request A container for the necessary parameters to execute the BatchGetJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`.
 
 @see AWSglueBatchGetJobsRequest
 @see AWSglueBatchGetJobsResponse
 */
- (void)batchGetJobs:(AWSglueBatchGetJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSglueBatchGetJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves partitions in a batch request.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetPartition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueBatchGetPartitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueBatchGetPartitionRequest
 @see AWSglueBatchGetPartitionResponse
 */
- (AWSTask<AWSglueBatchGetPartitionResponse *> *)batchGetPartition:(AWSglueBatchGetPartitionRequest *)request;

/**
 <p>Retrieves partitions in a batch request.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetPartition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueBatchGetPartitionRequest
 @see AWSglueBatchGetPartitionResponse
 */
- (void)batchGetPartition:(AWSglueBatchGetPartitionRequest *)request completionHandler:(void (^ _Nullable)(AWSglueBatchGetPartitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of resource metadata for a given list of trigger names. After calling the <code>ListTriggers</code> operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetTriggers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueBatchGetTriggersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`.
 
 @see AWSglueBatchGetTriggersRequest
 @see AWSglueBatchGetTriggersResponse
 */
- (AWSTask<AWSglueBatchGetTriggersResponse *> *)batchGetTriggers:(AWSglueBatchGetTriggersRequest *)request;

/**
 <p>Returns a list of resource metadata for a given list of trigger names. After calling the <code>ListTriggers</code> operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetTriggers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`.
 
 @see AWSglueBatchGetTriggersRequest
 @see AWSglueBatchGetTriggersResponse
 */
- (void)batchGetTriggers:(AWSglueBatchGetTriggersRequest *)request completionHandler:(void (^ _Nullable)(AWSglueBatchGetTriggersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of resource metadata for a given list of workflow names. After calling the <code>ListWorkflows</code> operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetWorkflows service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueBatchGetWorkflowsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`.
 
 @see AWSglueBatchGetWorkflowsRequest
 @see AWSglueBatchGetWorkflowsResponse
 */
- (AWSTask<AWSglueBatchGetWorkflowsResponse *> *)batchGetWorkflows:(AWSglueBatchGetWorkflowsRequest *)request;

/**
 <p>Returns a list of resource metadata for a given list of workflow names. After calling the <code>ListWorkflows</code> operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetWorkflows service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`.
 
 @see AWSglueBatchGetWorkflowsRequest
 @see AWSglueBatchGetWorkflowsResponse
 */
- (void)batchGetWorkflows:(AWSglueBatchGetWorkflowsRequest *)request completionHandler:(void (^ _Nullable)(AWSglueBatchGetWorkflowsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops one or more job runs for a specified job definition.</p>
 
 @param request A container for the necessary parameters to execute the BatchStopJobRun service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueBatchStopJobRunResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueBatchStopJobRunRequest
 @see AWSglueBatchStopJobRunResponse
 */
- (AWSTask<AWSglueBatchStopJobRunResponse *> *)batchStopJobRun:(AWSglueBatchStopJobRunRequest *)request;

/**
 <p>Stops one or more job runs for a specified job definition.</p>
 
 @param request A container for the necessary parameters to execute the BatchStopJobRun service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueBatchStopJobRunRequest
 @see AWSglueBatchStopJobRunResponse
 */
- (void)batchStopJobRun:(AWSglueBatchStopJobRunRequest *)request completionHandler:(void (^ _Nullable)(AWSglueBatchStopJobRunResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels (stops) a task run. Machine learning task runs are asynchronous tasks that AWS Glue runs on your behalf as part of various machine learning workflows. You can cancel a machine learning task run at any time by calling <code>CancelMLTaskRun</code> with a task run's parent transform's <code>TransformID</code> and the task run's <code>TaskRunId</code>. </p>
 
 @param request A container for the necessary parameters to execute the CancelMLTaskRun service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueCancelMLTaskRunResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`.
 
 @see AWSglueCancelMLTaskRunRequest
 @see AWSglueCancelMLTaskRunResponse
 */
- (AWSTask<AWSglueCancelMLTaskRunResponse *> *)cancelMLTaskRun:(AWSglueCancelMLTaskRunRequest *)request;

/**
 <p>Cancels (stops) a task run. Machine learning task runs are asynchronous tasks that AWS Glue runs on your behalf as part of various machine learning workflows. You can cancel a machine learning task run at any time by calling <code>CancelMLTaskRun</code> with a task run's parent transform's <code>TransformID</code> and the task run's <code>TaskRunId</code>. </p>
 
 @param request A container for the necessary parameters to execute the CancelMLTaskRun service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`.
 
 @see AWSglueCancelMLTaskRunRequest
 @see AWSglueCancelMLTaskRunResponse
 */
- (void)cancelMLTaskRun:(AWSglueCancelMLTaskRunRequest *)request completionHandler:(void (^ _Nullable)(AWSglueCancelMLTaskRunResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a classifier in the user's account. This can be a <code>GrokClassifier</code>, an <code>XMLClassifier</code>, a <code>JsonClassifier</code>, or a <code>CsvClassifier</code>, depending on which field of the request is present.</p>
 
 @param request A container for the necessary parameters to execute the CreateClassifier service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueCreateClassifierResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorAlreadyExists`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueCreateClassifierRequest
 @see AWSglueCreateClassifierResponse
 */
- (AWSTask<AWSglueCreateClassifierResponse *> *)createClassifier:(AWSglueCreateClassifierRequest *)request;

/**
 <p>Creates a classifier in the user's account. This can be a <code>GrokClassifier</code>, an <code>XMLClassifier</code>, a <code>JsonClassifier</code>, or a <code>CsvClassifier</code>, depending on which field of the request is present.</p>
 
 @param request A container for the necessary parameters to execute the CreateClassifier service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorAlreadyExists`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueCreateClassifierRequest
 @see AWSglueCreateClassifierResponse
 */
- (void)createClassifier:(AWSglueCreateClassifierRequest *)request completionHandler:(void (^ _Nullable)(AWSglueCreateClassifierResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a connection definition in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the CreateConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueCreateConnectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorAlreadyExists`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueCreateConnectionRequest
 @see AWSglueCreateConnectionResponse
 */
- (AWSTask<AWSglueCreateConnectionResponse *> *)createConnection:(AWSglueCreateConnectionRequest *)request;

/**
 <p>Creates a connection definition in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the CreateConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorAlreadyExists`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueCreateConnectionRequest
 @see AWSglueCreateConnectionResponse
 */
- (void)createConnection:(AWSglueCreateConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSglueCreateConnectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new crawler with specified targets, role, configuration, and optional schedule. At least one crawl target must be specified, in the <code>s3Targets</code> field, the <code>jdbcTargets</code> field, or the <code>DynamoDBTargets</code> field.</p>
 
 @param request A container for the necessary parameters to execute the CreateCrawler service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueCreateCrawlerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorAlreadyExists`, `AWSglueErrorOperationTimeout`, `AWSglueErrorResourceNumberLimitExceeded`.
 
 @see AWSglueCreateCrawlerRequest
 @see AWSglueCreateCrawlerResponse
 */
- (AWSTask<AWSglueCreateCrawlerResponse *> *)createCrawler:(AWSglueCreateCrawlerRequest *)request;

/**
 <p>Creates a new crawler with specified targets, role, configuration, and optional schedule. At least one crawl target must be specified, in the <code>s3Targets</code> field, the <code>jdbcTargets</code> field, or the <code>DynamoDBTargets</code> field.</p>
 
 @param request A container for the necessary parameters to execute the CreateCrawler service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorAlreadyExists`, `AWSglueErrorOperationTimeout`, `AWSglueErrorResourceNumberLimitExceeded`.
 
 @see AWSglueCreateCrawlerRequest
 @see AWSglueCreateCrawlerResponse
 */
- (void)createCrawler:(AWSglueCreateCrawlerRequest *)request completionHandler:(void (^ _Nullable)(AWSglueCreateCrawlerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new database in a Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the CreateDatabase service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueCreateDatabaseResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorAlreadyExists`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueCreateDatabaseRequest
 @see AWSglueCreateDatabaseResponse
 */
- (AWSTask<AWSglueCreateDatabaseResponse *> *)createDatabase:(AWSglueCreateDatabaseRequest *)request;

/**
 <p>Creates a new database in a Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the CreateDatabase service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorAlreadyExists`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueCreateDatabaseRequest
 @see AWSglueCreateDatabaseResponse
 */
- (void)createDatabase:(AWSglueCreateDatabaseRequest *)request completionHandler:(void (^ _Nullable)(AWSglueCreateDatabaseResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new development endpoint.</p>
 
 @param request A container for the necessary parameters to execute the CreateDevEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueCreateDevEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorAccessDenied`, `AWSglueErrorAlreadyExists`, `AWSglueErrorIdempotentParameterMismatch`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`, `AWSglueErrorValidation`, `AWSglueErrorResourceNumberLimitExceeded`.
 
 @see AWSglueCreateDevEndpointRequest
 @see AWSglueCreateDevEndpointResponse
 */
- (AWSTask<AWSglueCreateDevEndpointResponse *> *)createDevEndpoint:(AWSglueCreateDevEndpointRequest *)request;

/**
 <p>Creates a new development endpoint.</p>
 
 @param request A container for the necessary parameters to execute the CreateDevEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorAccessDenied`, `AWSglueErrorAlreadyExists`, `AWSglueErrorIdempotentParameterMismatch`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`, `AWSglueErrorValidation`, `AWSglueErrorResourceNumberLimitExceeded`.
 
 @see AWSglueCreateDevEndpointRequest
 @see AWSglueCreateDevEndpointResponse
 */
- (void)createDevEndpoint:(AWSglueCreateDevEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSglueCreateDevEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new job definition.</p>
 
 @param request A container for the necessary parameters to execute the CreateJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueCreateJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorIdempotentParameterMismatch`, `AWSglueErrorAlreadyExists`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorConcurrentModification`.
 
 @see AWSglueCreateJobRequest
 @see AWSglueCreateJobResponse
 */
- (AWSTask<AWSglueCreateJobResponse *> *)createJob:(AWSglueCreateJobRequest *)request;

/**
 <p>Creates a new job definition.</p>
 
 @param request A container for the necessary parameters to execute the CreateJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorIdempotentParameterMismatch`, `AWSglueErrorAlreadyExists`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorConcurrentModification`.
 
 @see AWSglueCreateJobRequest
 @see AWSglueCreateJobResponse
 */
- (void)createJob:(AWSglueCreateJobRequest *)request completionHandler:(void (^ _Nullable)(AWSglueCreateJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an AWS Glue machine learning transform. This operation creates the transform and all the necessary parameters to train it.</p><p>Call this operation as the first step in the process of using a machine learning transform (such as the <code>FindMatches</code> transform) for deduplicating data. You can provide an optional <code>Description</code>, in addition to the parameters that you want to use for your algorithm.</p><p>You must also specify certain parameters for the tasks that AWS Glue runs on your behalf as part of learning from your data and creating a high-quality machine learning transform. These parameters include <code>Role</code>, and optionally, <code>AllocatedCapacity</code>, <code>Timeout</code>, and <code>MaxRetries</code>. For more information, see <a href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-jobs-job.html">Jobs</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateMLTransform service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueCreateMLTransformResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorAlreadyExists`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`, `AWSglueErrorAccessDenied`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorIdempotentParameterMismatch`.
 
 @see AWSglueCreateMLTransformRequest
 @see AWSglueCreateMLTransformResponse
 */
- (AWSTask<AWSglueCreateMLTransformResponse *> *)createMLTransform:(AWSglueCreateMLTransformRequest *)request;

/**
 <p>Creates an AWS Glue machine learning transform. This operation creates the transform and all the necessary parameters to train it.</p><p>Call this operation as the first step in the process of using a machine learning transform (such as the <code>FindMatches</code> transform) for deduplicating data. You can provide an optional <code>Description</code>, in addition to the parameters that you want to use for your algorithm.</p><p>You must also specify certain parameters for the tasks that AWS Glue runs on your behalf as part of learning from your data and creating a high-quality machine learning transform. These parameters include <code>Role</code>, and optionally, <code>AllocatedCapacity</code>, <code>Timeout</code>, and <code>MaxRetries</code>. For more information, see <a href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-jobs-job.html">Jobs</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateMLTransform service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorAlreadyExists`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`, `AWSglueErrorAccessDenied`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorIdempotentParameterMismatch`.
 
 @see AWSglueCreateMLTransformRequest
 @see AWSglueCreateMLTransformResponse
 */
- (void)createMLTransform:(AWSglueCreateMLTransformRequest *)request completionHandler:(void (^ _Nullable)(AWSglueCreateMLTransformResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new partition.</p>
 
 @param request A container for the necessary parameters to execute the CreatePartition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueCreatePartitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorAlreadyExists`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorInternalService`, `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueCreatePartitionRequest
 @see AWSglueCreatePartitionResponse
 */
- (AWSTask<AWSglueCreatePartitionResponse *> *)createPartition:(AWSglueCreatePartitionRequest *)request;

/**
 <p>Creates a new partition.</p>
 
 @param request A container for the necessary parameters to execute the CreatePartition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorAlreadyExists`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorInternalService`, `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueCreatePartitionRequest
 @see AWSglueCreatePartitionResponse
 */
- (void)createPartition:(AWSglueCreatePartitionRequest *)request completionHandler:(void (^ _Nullable)(AWSglueCreatePartitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Transforms a directed acyclic graph (DAG) into code.</p>
 
 @param request A container for the necessary parameters to execute the CreateScript service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueCreateScriptResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueCreateScriptRequest
 @see AWSglueCreateScriptResponse
 */
- (AWSTask<AWSglueCreateScriptResponse *> *)createScript:(AWSglueCreateScriptRequest *)request;

/**
 <p>Transforms a directed acyclic graph (DAG) into code.</p>
 
 @param request A container for the necessary parameters to execute the CreateScript service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueCreateScriptRequest
 @see AWSglueCreateScriptResponse
 */
- (void)createScript:(AWSglueCreateScriptRequest *)request completionHandler:(void (^ _Nullable)(AWSglueCreateScriptResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new security configuration. A security configuration is a set of security properties that can be used by AWS Glue. You can use a security configuration to encrypt data at rest. For information about using security configurations in AWS Glue, see <a href="https://docs.aws.amazon.com/glue/latest/dg/encryption-security-configuration.html">Encrypting Data Written by Crawlers, Jobs, and Development Endpoints</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSecurityConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueCreateSecurityConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorAlreadyExists`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorResourceNumberLimitExceeded`.
 
 @see AWSglueCreateSecurityConfigurationRequest
 @see AWSglueCreateSecurityConfigurationResponse
 */
- (AWSTask<AWSglueCreateSecurityConfigurationResponse *> *)createSecurityConfiguration:(AWSglueCreateSecurityConfigurationRequest *)request;

/**
 <p>Creates a new security configuration. A security configuration is a set of security properties that can be used by AWS Glue. You can use a security configuration to encrypt data at rest. For information about using security configurations in AWS Glue, see <a href="https://docs.aws.amazon.com/glue/latest/dg/encryption-security-configuration.html">Encrypting Data Written by Crawlers, Jobs, and Development Endpoints</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSecurityConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorAlreadyExists`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorResourceNumberLimitExceeded`.
 
 @see AWSglueCreateSecurityConfigurationRequest
 @see AWSglueCreateSecurityConfigurationResponse
 */
- (void)createSecurityConfiguration:(AWSglueCreateSecurityConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSglueCreateSecurityConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new table definition in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the CreateTable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueCreateTableResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorAlreadyExists`, `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueCreateTableRequest
 @see AWSglueCreateTableResponse
 */
- (AWSTask<AWSglueCreateTableResponse *> *)createTable:(AWSglueCreateTableRequest *)request;

/**
 <p>Creates a new table definition in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the CreateTable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorAlreadyExists`, `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueCreateTableRequest
 @see AWSglueCreateTableResponse
 */
- (void)createTable:(AWSglueCreateTableRequest *)request completionHandler:(void (^ _Nullable)(AWSglueCreateTableResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new trigger.</p>
 
 @param request A container for the necessary parameters to execute the CreateTrigger service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueCreateTriggerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorAlreadyExists`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorIdempotentParameterMismatch`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorConcurrentModification`.
 
 @see AWSglueCreateTriggerRequest
 @see AWSglueCreateTriggerResponse
 */
- (AWSTask<AWSglueCreateTriggerResponse *> *)createTrigger:(AWSglueCreateTriggerRequest *)request;

/**
 <p>Creates a new trigger.</p>
 
 @param request A container for the necessary parameters to execute the CreateTrigger service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorAlreadyExists`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorIdempotentParameterMismatch`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorConcurrentModification`.
 
 @see AWSglueCreateTriggerRequest
 @see AWSglueCreateTriggerResponse
 */
- (void)createTrigger:(AWSglueCreateTriggerRequest *)request completionHandler:(void (^ _Nullable)(AWSglueCreateTriggerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new function definition in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the CreateUserDefinedFunction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueCreateUserDefinedFunctionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorAlreadyExists`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueCreateUserDefinedFunctionRequest
 @see AWSglueCreateUserDefinedFunctionResponse
 */
- (AWSTask<AWSglueCreateUserDefinedFunctionResponse *> *)createUserDefinedFunction:(AWSglueCreateUserDefinedFunctionRequest *)request;

/**
 <p>Creates a new function definition in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the CreateUserDefinedFunction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorAlreadyExists`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueCreateUserDefinedFunctionRequest
 @see AWSglueCreateUserDefinedFunctionResponse
 */
- (void)createUserDefinedFunction:(AWSglueCreateUserDefinedFunctionRequest *)request completionHandler:(void (^ _Nullable)(AWSglueCreateUserDefinedFunctionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new workflow.</p>
 
 @param request A container for the necessary parameters to execute the CreateWorkflow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueCreateWorkflowResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorAlreadyExists`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorConcurrentModification`.
 
 @see AWSglueCreateWorkflowRequest
 @see AWSglueCreateWorkflowResponse
 */
- (AWSTask<AWSglueCreateWorkflowResponse *> *)createWorkflow:(AWSglueCreateWorkflowRequest *)request;

/**
 <p>Creates a new workflow.</p>
 
 @param request A container for the necessary parameters to execute the CreateWorkflow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorAlreadyExists`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorConcurrentModification`.
 
 @see AWSglueCreateWorkflowRequest
 @see AWSglueCreateWorkflowResponse
 */
- (void)createWorkflow:(AWSglueCreateWorkflowRequest *)request completionHandler:(void (^ _Nullable)(AWSglueCreateWorkflowResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a classifier from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the DeleteClassifier service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueDeleteClassifierResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueDeleteClassifierRequest
 @see AWSglueDeleteClassifierResponse
 */
- (AWSTask<AWSglueDeleteClassifierResponse *> *)deleteClassifier:(AWSglueDeleteClassifierRequest *)request;

/**
 <p>Removes a classifier from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the DeleteClassifier service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueDeleteClassifierRequest
 @see AWSglueDeleteClassifierResponse
 */
- (void)deleteClassifier:(AWSglueDeleteClassifierRequest *)request completionHandler:(void (^ _Nullable)(AWSglueDeleteClassifierResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a connection from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueDeleteConnectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueDeleteConnectionRequest
 @see AWSglueDeleteConnectionResponse
 */
- (AWSTask<AWSglueDeleteConnectionResponse *> *)deleteConnection:(AWSglueDeleteConnectionRequest *)request;

/**
 <p>Deletes a connection from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueDeleteConnectionRequest
 @see AWSglueDeleteConnectionResponse
 */
- (void)deleteConnection:(AWSglueDeleteConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSglueDeleteConnectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a specified crawler from the AWS Glue Data Catalog, unless the crawler state is <code>RUNNING</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCrawler service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueDeleteCrawlerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorCrawlerRunning`, `AWSglueErrorSchedulerTransitioning`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueDeleteCrawlerRequest
 @see AWSglueDeleteCrawlerResponse
 */
- (AWSTask<AWSglueDeleteCrawlerResponse *> *)deleteCrawler:(AWSglueDeleteCrawlerRequest *)request;

/**
 <p>Removes a specified crawler from the AWS Glue Data Catalog, unless the crawler state is <code>RUNNING</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCrawler service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorCrawlerRunning`, `AWSglueErrorSchedulerTransitioning`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueDeleteCrawlerRequest
 @see AWSglueDeleteCrawlerResponse
 */
- (void)deleteCrawler:(AWSglueDeleteCrawlerRequest *)request completionHandler:(void (^ _Nullable)(AWSglueDeleteCrawlerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a specified database from a Data Catalog.</p><note><p>After completing this operation, you no longer have access to the tables (and all table versions and partitions that might belong to the tables) and the user-defined functions in the deleted database. AWS Glue deletes these "orphaned" resources asynchronously in a timely manner, at the discretion of the service.</p><p>To ensure the immediate deletion of all related resources, before calling <code>DeleteDatabase</code>, use <code>DeleteTableVersion</code> or <code>BatchDeleteTableVersion</code>, <code>DeletePartition</code> or <code>BatchDeletePartition</code>, <code>DeleteUserDefinedFunction</code>, and <code>DeleteTable</code> or <code>BatchDeleteTable</code>, to delete any resources that belong to the database.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDatabase service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueDeleteDatabaseResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueDeleteDatabaseRequest
 @see AWSglueDeleteDatabaseResponse
 */
- (AWSTask<AWSglueDeleteDatabaseResponse *> *)deleteDatabase:(AWSglueDeleteDatabaseRequest *)request;

/**
 <p>Removes a specified database from a Data Catalog.</p><note><p>After completing this operation, you no longer have access to the tables (and all table versions and partitions that might belong to the tables) and the user-defined functions in the deleted database. AWS Glue deletes these "orphaned" resources asynchronously in a timely manner, at the discretion of the service.</p><p>To ensure the immediate deletion of all related resources, before calling <code>DeleteDatabase</code>, use <code>DeleteTableVersion</code> or <code>BatchDeleteTableVersion</code>, <code>DeletePartition</code> or <code>BatchDeletePartition</code>, <code>DeleteUserDefinedFunction</code>, and <code>DeleteTable</code> or <code>BatchDeleteTable</code>, to delete any resources that belong to the database.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDatabase service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueDeleteDatabaseRequest
 @see AWSglueDeleteDatabaseResponse
 */
- (void)deleteDatabase:(AWSglueDeleteDatabaseRequest *)request completionHandler:(void (^ _Nullable)(AWSglueDeleteDatabaseResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified development endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDevEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueDeleteDevEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`.
 
 @see AWSglueDeleteDevEndpointRequest
 @see AWSglueDeleteDevEndpointResponse
 */
- (AWSTask<AWSglueDeleteDevEndpointResponse *> *)deleteDevEndpoint:(AWSglueDeleteDevEndpointRequest *)request;

/**
 <p>Deletes a specified development endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDevEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`.
 
 @see AWSglueDeleteDevEndpointRequest
 @see AWSglueDeleteDevEndpointResponse
 */
- (void)deleteDevEndpoint:(AWSglueDeleteDevEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSglueDeleteDevEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified job definition. If the job definition is not found, no exception is thrown.</p>
 
 @param request A container for the necessary parameters to execute the DeleteJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueDeleteJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueDeleteJobRequest
 @see AWSglueDeleteJobResponse
 */
- (AWSTask<AWSglueDeleteJobResponse *> *)deleteJob:(AWSglueDeleteJobRequest *)request;

/**
 <p>Deletes a specified job definition. If the job definition is not found, no exception is thrown.</p>
 
 @param request A container for the necessary parameters to execute the DeleteJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueDeleteJobRequest
 @see AWSglueDeleteJobResponse
 */
- (void)deleteJob:(AWSglueDeleteJobRequest *)request completionHandler:(void (^ _Nullable)(AWSglueDeleteJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an AWS Glue machine learning transform. Machine learning transforms are a special type of transform that use machine learning to learn the details of the transformation to be performed by learning from examples provided by humans. These transformations are then saved by AWS Glue. If you no longer need a transform, you can delete it by calling <code>DeleteMLTransforms</code>. However, any AWS Glue jobs that still reference the deleted transform will no longer succeed.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMLTransform service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueDeleteMLTransformResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`.
 
 @see AWSglueDeleteMLTransformRequest
 @see AWSglueDeleteMLTransformResponse
 */
- (AWSTask<AWSglueDeleteMLTransformResponse *> *)deleteMLTransform:(AWSglueDeleteMLTransformRequest *)request;

/**
 <p>Deletes an AWS Glue machine learning transform. Machine learning transforms are a special type of transform that use machine learning to learn the details of the transformation to be performed by learning from examples provided by humans. These transformations are then saved by AWS Glue. If you no longer need a transform, you can delete it by calling <code>DeleteMLTransforms</code>. However, any AWS Glue jobs that still reference the deleted transform will no longer succeed.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMLTransform service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`.
 
 @see AWSglueDeleteMLTransformRequest
 @see AWSglueDeleteMLTransformResponse
 */
- (void)deleteMLTransform:(AWSglueDeleteMLTransformRequest *)request completionHandler:(void (^ _Nullable)(AWSglueDeleteMLTransformResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified partition.</p>
 
 @param request A container for the necessary parameters to execute the DeletePartition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueDeletePartitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueDeletePartitionRequest
 @see AWSglueDeletePartitionResponse
 */
- (AWSTask<AWSglueDeletePartitionResponse *> *)deletePartition:(AWSglueDeletePartitionRequest *)request;

/**
 <p>Deletes a specified partition.</p>
 
 @param request A container for the necessary parameters to execute the DeletePartition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueDeletePartitionRequest
 @see AWSglueDeletePartitionResponse
 */
- (void)deletePartition:(AWSglueDeletePartitionRequest *)request completionHandler:(void (^ _Nullable)(AWSglueDeletePartitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified policy.</p>
 
 @param request A container for the necessary parameters to execute the DeleteResourcePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueDeleteResourcePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`, `AWSglueErrorConditionCheckFailure`.
 
 @see AWSglueDeleteResourcePolicyRequest
 @see AWSglueDeleteResourcePolicyResponse
 */
- (AWSTask<AWSglueDeleteResourcePolicyResponse *> *)deleteResourcePolicy:(AWSglueDeleteResourcePolicyRequest *)request;

/**
 <p>Deletes a specified policy.</p>
 
 @param request A container for the necessary parameters to execute the DeleteResourcePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`, `AWSglueErrorConditionCheckFailure`.
 
 @see AWSglueDeleteResourcePolicyRequest
 @see AWSglueDeleteResourcePolicyResponse
 */
- (void)deleteResourcePolicy:(AWSglueDeleteResourcePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSglueDeleteResourcePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified security configuration.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSecurityConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueDeleteSecurityConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueDeleteSecurityConfigurationRequest
 @see AWSglueDeleteSecurityConfigurationResponse
 */
- (AWSTask<AWSglueDeleteSecurityConfigurationResponse *> *)deleteSecurityConfiguration:(AWSglueDeleteSecurityConfigurationRequest *)request;

/**
 <p>Deletes a specified security configuration.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSecurityConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueDeleteSecurityConfigurationRequest
 @see AWSglueDeleteSecurityConfigurationResponse
 */
- (void)deleteSecurityConfiguration:(AWSglueDeleteSecurityConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSglueDeleteSecurityConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a table definition from the Data Catalog.</p><note><p>After completing this operation, you no longer have access to the table versions and partitions that belong to the deleted table. AWS Glue deletes these "orphaned" resources asynchronously in a timely manner, at the discretion of the service.</p><p>To ensure the immediate deletion of all related resources, before calling <code>DeleteTable</code>, use <code>DeleteTableVersion</code> or <code>BatchDeleteTableVersion</code>, and <code>DeletePartition</code> or <code>BatchDeletePartition</code>, to delete any resources that belong to the table.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteTable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueDeleteTableResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueDeleteTableRequest
 @see AWSglueDeleteTableResponse
 */
- (AWSTask<AWSglueDeleteTableResponse *> *)deleteTable:(AWSglueDeleteTableRequest *)request;

/**
 <p>Removes a table definition from the Data Catalog.</p><note><p>After completing this operation, you no longer have access to the table versions and partitions that belong to the deleted table. AWS Glue deletes these "orphaned" resources asynchronously in a timely manner, at the discretion of the service.</p><p>To ensure the immediate deletion of all related resources, before calling <code>DeleteTable</code>, use <code>DeleteTableVersion</code> or <code>BatchDeleteTableVersion</code>, and <code>DeletePartition</code> or <code>BatchDeletePartition</code>, to delete any resources that belong to the table.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteTable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueDeleteTableRequest
 @see AWSglueDeleteTableResponse
 */
- (void)deleteTable:(AWSglueDeleteTableRequest *)request completionHandler:(void (^ _Nullable)(AWSglueDeleteTableResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified version of a table.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTableVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueDeleteTableVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueDeleteTableVersionRequest
 @see AWSglueDeleteTableVersionResponse
 */
- (AWSTask<AWSglueDeleteTableVersionResponse *> *)deleteTableVersion:(AWSglueDeleteTableVersionRequest *)request;

/**
 <p>Deletes a specified version of a table.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTableVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueDeleteTableVersionRequest
 @see AWSglueDeleteTableVersionResponse
 */
- (void)deleteTableVersion:(AWSglueDeleteTableVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSglueDeleteTableVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified trigger. If the trigger is not found, no exception is thrown.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrigger service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueDeleteTriggerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorConcurrentModification`.
 
 @see AWSglueDeleteTriggerRequest
 @see AWSglueDeleteTriggerResponse
 */
- (AWSTask<AWSglueDeleteTriggerResponse *> *)deleteTrigger:(AWSglueDeleteTriggerRequest *)request;

/**
 <p>Deletes a specified trigger. If the trigger is not found, no exception is thrown.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrigger service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorConcurrentModification`.
 
 @see AWSglueDeleteTriggerRequest
 @see AWSglueDeleteTriggerResponse
 */
- (void)deleteTrigger:(AWSglueDeleteTriggerRequest *)request completionHandler:(void (^ _Nullable)(AWSglueDeleteTriggerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an existing function definition from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUserDefinedFunction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueDeleteUserDefinedFunctionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueDeleteUserDefinedFunctionRequest
 @see AWSglueDeleteUserDefinedFunctionResponse
 */
- (AWSTask<AWSglueDeleteUserDefinedFunctionResponse *> *)deleteUserDefinedFunction:(AWSglueDeleteUserDefinedFunctionRequest *)request;

/**
 <p>Deletes an existing function definition from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUserDefinedFunction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueDeleteUserDefinedFunctionRequest
 @see AWSglueDeleteUserDefinedFunctionResponse
 */
- (void)deleteUserDefinedFunction:(AWSglueDeleteUserDefinedFunctionRequest *)request completionHandler:(void (^ _Nullable)(AWSglueDeleteUserDefinedFunctionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a workflow.</p>
 
 @param request A container for the necessary parameters to execute the DeleteWorkflow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueDeleteWorkflowResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorConcurrentModification`.
 
 @see AWSglueDeleteWorkflowRequest
 @see AWSglueDeleteWorkflowResponse
 */
- (AWSTask<AWSglueDeleteWorkflowResponse *> *)deleteWorkflow:(AWSglueDeleteWorkflowRequest *)request;

/**
 <p>Deletes a workflow.</p>
 
 @param request A container for the necessary parameters to execute the DeleteWorkflow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorConcurrentModification`.
 
 @see AWSglueDeleteWorkflowRequest
 @see AWSglueDeleteWorkflowResponse
 */
- (void)deleteWorkflow:(AWSglueDeleteWorkflowRequest *)request completionHandler:(void (^ _Nullable)(AWSglueDeleteWorkflowResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the status of a migration operation.</p>
 
 @param request A container for the necessary parameters to execute the GetCatalogImportStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetCatalogImportStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetCatalogImportStatusRequest
 @see AWSglueGetCatalogImportStatusResponse
 */
- (AWSTask<AWSglueGetCatalogImportStatusResponse *> *)getCatalogImportStatus:(AWSglueGetCatalogImportStatusRequest *)request;

/**
 <p>Retrieves the status of a migration operation.</p>
 
 @param request A container for the necessary parameters to execute the GetCatalogImportStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetCatalogImportStatusRequest
 @see AWSglueGetCatalogImportStatusResponse
 */
- (void)getCatalogImportStatus:(AWSglueGetCatalogImportStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetCatalogImportStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve a classifier by name.</p>
 
 @param request A container for the necessary parameters to execute the GetClassifier service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetClassifierResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetClassifierRequest
 @see AWSglueGetClassifierResponse
 */
- (AWSTask<AWSglueGetClassifierResponse *> *)getClassifier:(AWSglueGetClassifierRequest *)request;

/**
 <p>Retrieve a classifier by name.</p>
 
 @param request A container for the necessary parameters to execute the GetClassifier service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetClassifierRequest
 @see AWSglueGetClassifierResponse
 */
- (void)getClassifier:(AWSglueGetClassifierRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetClassifierResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all classifier objects in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetClassifiers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetClassifiersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetClassifiersRequest
 @see AWSglueGetClassifiersResponse
 */
- (AWSTask<AWSglueGetClassifiersResponse *> *)getClassifiers:(AWSglueGetClassifiersRequest *)request;

/**
 <p>Lists all classifier objects in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetClassifiers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetClassifiersRequest
 @see AWSglueGetClassifiersResponse
 */
- (void)getClassifiers:(AWSglueGetClassifiersRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetClassifiersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a connection definition from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetConnectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueGetConnectionRequest
 @see AWSglueGetConnectionResponse
 */
- (AWSTask<AWSglueGetConnectionResponse *> *)getConnection:(AWSglueGetConnectionRequest *)request;

/**
 <p>Retrieves a connection definition from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueGetConnectionRequest
 @see AWSglueGetConnectionResponse
 */
- (void)getConnection:(AWSglueGetConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetConnectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of connection definitions from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetConnections service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetConnectionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueGetConnectionsRequest
 @see AWSglueGetConnectionsResponse
 */
- (AWSTask<AWSglueGetConnectionsResponse *> *)getConnections:(AWSglueGetConnectionsRequest *)request;

/**
 <p>Retrieves a list of connection definitions from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetConnections service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueGetConnectionsRequest
 @see AWSglueGetConnectionsResponse
 */
- (void)getConnections:(AWSglueGetConnectionsRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetConnectionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves metadata for a specified crawler.</p>
 
 @param request A container for the necessary parameters to execute the GetCrawler service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetCrawlerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetCrawlerRequest
 @see AWSglueGetCrawlerResponse
 */
- (AWSTask<AWSglueGetCrawlerResponse *> *)getCrawler:(AWSglueGetCrawlerRequest *)request;

/**
 <p>Retrieves metadata for a specified crawler.</p>
 
 @param request A container for the necessary parameters to execute the GetCrawler service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetCrawlerRequest
 @see AWSglueGetCrawlerResponse
 */
- (void)getCrawler:(AWSglueGetCrawlerRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetCrawlerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves metrics about specified crawlers.</p>
 
 @param request A container for the necessary parameters to execute the GetCrawlerMetrics service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetCrawlerMetricsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetCrawlerMetricsRequest
 @see AWSglueGetCrawlerMetricsResponse
 */
- (AWSTask<AWSglueGetCrawlerMetricsResponse *> *)getCrawlerMetrics:(AWSglueGetCrawlerMetricsRequest *)request;

/**
 <p>Retrieves metrics about specified crawlers.</p>
 
 @param request A container for the necessary parameters to execute the GetCrawlerMetrics service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetCrawlerMetricsRequest
 @see AWSglueGetCrawlerMetricsResponse
 */
- (void)getCrawlerMetrics:(AWSglueGetCrawlerMetricsRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetCrawlerMetricsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves metadata for all crawlers defined in the customer account.</p>
 
 @param request A container for the necessary parameters to execute the GetCrawlers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetCrawlersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetCrawlersRequest
 @see AWSglueGetCrawlersResponse
 */
- (AWSTask<AWSglueGetCrawlersResponse *> *)getCrawlers:(AWSglueGetCrawlersRequest *)request;

/**
 <p>Retrieves metadata for all crawlers defined in the customer account.</p>
 
 @param request A container for the necessary parameters to execute the GetCrawlers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetCrawlersRequest
 @see AWSglueGetCrawlersResponse
 */
- (void)getCrawlers:(AWSglueGetCrawlersRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetCrawlersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the security configuration for a specified catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetDataCatalogEncryptionSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetDataCatalogEncryptionSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInternalService`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetDataCatalogEncryptionSettingsRequest
 @see AWSglueGetDataCatalogEncryptionSettingsResponse
 */
- (AWSTask<AWSglueGetDataCatalogEncryptionSettingsResponse *> *)getDataCatalogEncryptionSettings:(AWSglueGetDataCatalogEncryptionSettingsRequest *)request;

/**
 <p>Retrieves the security configuration for a specified catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetDataCatalogEncryptionSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInternalService`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetDataCatalogEncryptionSettingsRequest
 @see AWSglueGetDataCatalogEncryptionSettingsResponse
 */
- (void)getDataCatalogEncryptionSettings:(AWSglueGetDataCatalogEncryptionSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetDataCatalogEncryptionSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the definition of a specified database.</p>
 
 @param request A container for the necessary parameters to execute the GetDatabase service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetDatabaseResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueGetDatabaseRequest
 @see AWSglueGetDatabaseResponse
 */
- (AWSTask<AWSglueGetDatabaseResponse *> *)getDatabase:(AWSglueGetDatabaseRequest *)request;

/**
 <p>Retrieves the definition of a specified database.</p>
 
 @param request A container for the necessary parameters to execute the GetDatabase service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueGetDatabaseRequest
 @see AWSglueGetDatabaseResponse
 */
- (void)getDatabase:(AWSglueGetDatabaseRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetDatabaseResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves all databases defined in a given Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetDatabases service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetDatabasesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueGetDatabasesRequest
 @see AWSglueGetDatabasesResponse
 */
- (AWSTask<AWSglueGetDatabasesResponse *> *)getDatabases:(AWSglueGetDatabasesRequest *)request;

/**
 <p>Retrieves all databases defined in a given Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetDatabases service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueGetDatabasesRequest
 @see AWSglueGetDatabasesResponse
 */
- (void)getDatabases:(AWSglueGetDatabasesRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetDatabasesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Transforms a Python script into a directed acyclic graph (DAG). </p>
 
 @param request A container for the necessary parameters to execute the GetDataflowGraph service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetDataflowGraphResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetDataflowGraphRequest
 @see AWSglueGetDataflowGraphResponse
 */
- (AWSTask<AWSglueGetDataflowGraphResponse *> *)getDataflowGraph:(AWSglueGetDataflowGraphRequest *)request;

/**
 <p>Transforms a Python script into a directed acyclic graph (DAG). </p>
 
 @param request A container for the necessary parameters to execute the GetDataflowGraph service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetDataflowGraphRequest
 @see AWSglueGetDataflowGraphResponse
 */
- (void)getDataflowGraph:(AWSglueGetDataflowGraphRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetDataflowGraphResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a specified development endpoint.</p><note><p>When you create a development endpoint in a virtual private cloud (VPC), AWS Glue returns only a private IP address, and the public IP address field is not populated. When you create a non-VPC development endpoint, AWS Glue returns only a public IP address.</p></note>
 
 @param request A container for the necessary parameters to execute the GetDevEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetDevEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`.
 
 @see AWSglueGetDevEndpointRequest
 @see AWSglueGetDevEndpointResponse
 */
- (AWSTask<AWSglueGetDevEndpointResponse *> *)getDevEndpoint:(AWSglueGetDevEndpointRequest *)request;

/**
 <p>Retrieves information about a specified development endpoint.</p><note><p>When you create a development endpoint in a virtual private cloud (VPC), AWS Glue returns only a private IP address, and the public IP address field is not populated. When you create a non-VPC development endpoint, AWS Glue returns only a public IP address.</p></note>
 
 @param request A container for the necessary parameters to execute the GetDevEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`.
 
 @see AWSglueGetDevEndpointRequest
 @see AWSglueGetDevEndpointResponse
 */
- (void)getDevEndpoint:(AWSglueGetDevEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetDevEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves all the development endpoints in this AWS account.</p><note><p>When you create a development endpoint in a virtual private cloud (VPC), AWS Glue returns only a private IP address and the public IP address field is not populated. When you create a non-VPC development endpoint, AWS Glue returns only a public IP address.</p></note>
 
 @param request A container for the necessary parameters to execute the GetDevEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetDevEndpointsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`.
 
 @see AWSglueGetDevEndpointsRequest
 @see AWSglueGetDevEndpointsResponse
 */
- (AWSTask<AWSglueGetDevEndpointsResponse *> *)getDevEndpoints:(AWSglueGetDevEndpointsRequest *)request;

/**
 <p>Retrieves all the development endpoints in this AWS account.</p><note><p>When you create a development endpoint in a virtual private cloud (VPC), AWS Glue returns only a private IP address and the public IP address field is not populated. When you create a non-VPC development endpoint, AWS Glue returns only a public IP address.</p></note>
 
 @param request A container for the necessary parameters to execute the GetDevEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`.
 
 @see AWSglueGetDevEndpointsRequest
 @see AWSglueGetDevEndpointsResponse
 */
- (void)getDevEndpoints:(AWSglueGetDevEndpointsRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetDevEndpointsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves an existing job definition.</p>
 
 @param request A container for the necessary parameters to execute the GetJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetJobRequest
 @see AWSglueGetJobResponse
 */
- (AWSTask<AWSglueGetJobResponse *> *)getJob:(AWSglueGetJobRequest *)request;

/**
 <p>Retrieves an existing job definition.</p>
 
 @param request A container for the necessary parameters to execute the GetJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetJobRequest
 @see AWSglueGetJobResponse
 */
- (void)getJob:(AWSglueGetJobRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information on a job bookmark entry.</p>
 
 @param request A container for the necessary parameters to execute the GetJobBookmark service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetJobBookmarkResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorValidation`.
 
 @see AWSglueGetJobBookmarkRequest
 @see AWSglueGetJobBookmarkResponse
 */
- (AWSTask<AWSglueGetJobBookmarkResponse *> *)getJobBookmark:(AWSglueGetJobBookmarkRequest *)request;

/**
 <p>Returns information on a job bookmark entry.</p>
 
 @param request A container for the necessary parameters to execute the GetJobBookmark service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorValidation`.
 
 @see AWSglueGetJobBookmarkRequest
 @see AWSglueGetJobBookmarkResponse
 */
- (void)getJobBookmark:(AWSglueGetJobBookmarkRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetJobBookmarkResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the metadata for a given job run.</p>
 
 @param request A container for the necessary parameters to execute the GetJobRun service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetJobRunResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetJobRunRequest
 @see AWSglueGetJobRunResponse
 */
- (AWSTask<AWSglueGetJobRunResponse *> *)getJobRun:(AWSglueGetJobRunRequest *)request;

/**
 <p>Retrieves the metadata for a given job run.</p>
 
 @param request A container for the necessary parameters to execute the GetJobRun service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetJobRunRequest
 @see AWSglueGetJobRunResponse
 */
- (void)getJobRun:(AWSglueGetJobRunRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetJobRunResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves metadata for all runs of a given job definition.</p>
 
 @param request A container for the necessary parameters to execute the GetJobRuns service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetJobRunsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetJobRunsRequest
 @see AWSglueGetJobRunsResponse
 */
- (AWSTask<AWSglueGetJobRunsResponse *> *)getJobRuns:(AWSglueGetJobRunsRequest *)request;

/**
 <p>Retrieves metadata for all runs of a given job definition.</p>
 
 @param request A container for the necessary parameters to execute the GetJobRuns service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetJobRunsRequest
 @see AWSglueGetJobRunsResponse
 */
- (void)getJobRuns:(AWSglueGetJobRunsRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetJobRunsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves all current job definitions.</p>
 
 @param request A container for the necessary parameters to execute the GetJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetJobsRequest
 @see AWSglueGetJobsResponse
 */
- (AWSTask<AWSglueGetJobsResponse *> *)getJobs:(AWSglueGetJobsRequest *)request;

/**
 <p>Retrieves all current job definitions.</p>
 
 @param request A container for the necessary parameters to execute the GetJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetJobsRequest
 @see AWSglueGetJobsResponse
 */
- (void)getJobs:(AWSglueGetJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets details for a specific task run on a machine learning transform. Machine learning task runs are asynchronous tasks that AWS Glue runs on your behalf as part of various machine learning workflows. You can check the stats of any task run by calling <code>GetMLTaskRun</code> with the <code>TaskRunID</code> and its parent transform's <code>TransformID</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetMLTaskRun service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetMLTaskRunResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`.
 
 @see AWSglueGetMLTaskRunRequest
 @see AWSglueGetMLTaskRunResponse
 */
- (AWSTask<AWSglueGetMLTaskRunResponse *> *)getMLTaskRun:(AWSglueGetMLTaskRunRequest *)request;

/**
 <p>Gets details for a specific task run on a machine learning transform. Machine learning task runs are asynchronous tasks that AWS Glue runs on your behalf as part of various machine learning workflows. You can check the stats of any task run by calling <code>GetMLTaskRun</code> with the <code>TaskRunID</code> and its parent transform's <code>TransformID</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetMLTaskRun service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`.
 
 @see AWSglueGetMLTaskRunRequest
 @see AWSglueGetMLTaskRunResponse
 */
- (void)getMLTaskRun:(AWSglueGetMLTaskRunRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetMLTaskRunResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of runs for a machine learning transform. Machine learning task runs are asynchronous tasks that AWS Glue runs on your behalf as part of various machine learning workflows. You can get a sortable, filterable list of machine learning task runs by calling <code>GetMLTaskRuns</code> with their parent transform's <code>TransformID</code> and other optional parameters as documented in this section.</p><p>This operation returns a list of historic runs and must be paginated.</p>
 
 @param request A container for the necessary parameters to execute the GetMLTaskRuns service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetMLTaskRunsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`.
 
 @see AWSglueGetMLTaskRunsRequest
 @see AWSglueGetMLTaskRunsResponse
 */
- (AWSTask<AWSglueGetMLTaskRunsResponse *> *)getMLTaskRuns:(AWSglueGetMLTaskRunsRequest *)request;

/**
 <p>Gets a list of runs for a machine learning transform. Machine learning task runs are asynchronous tasks that AWS Glue runs on your behalf as part of various machine learning workflows. You can get a sortable, filterable list of machine learning task runs by calling <code>GetMLTaskRuns</code> with their parent transform's <code>TransformID</code> and other optional parameters as documented in this section.</p><p>This operation returns a list of historic runs and must be paginated.</p>
 
 @param request A container for the necessary parameters to execute the GetMLTaskRuns service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`.
 
 @see AWSglueGetMLTaskRunsRequest
 @see AWSglueGetMLTaskRunsResponse
 */
- (void)getMLTaskRuns:(AWSglueGetMLTaskRunsRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetMLTaskRunsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets an AWS Glue machine learning transform artifact and all its corresponding metadata. Machine learning transforms are a special type of transform that use machine learning to learn the details of the transformation to be performed by learning from examples provided by humans. These transformations are then saved by AWS Glue. You can retrieve their metadata by calling <code>GetMLTransform</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetMLTransform service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetMLTransformResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`.
 
 @see AWSglueGetMLTransformRequest
 @see AWSglueGetMLTransformResponse
 */
- (AWSTask<AWSglueGetMLTransformResponse *> *)getMLTransform:(AWSglueGetMLTransformRequest *)request;

/**
 <p>Gets an AWS Glue machine learning transform artifact and all its corresponding metadata. Machine learning transforms are a special type of transform that use machine learning to learn the details of the transformation to be performed by learning from examples provided by humans. These transformations are then saved by AWS Glue. You can retrieve their metadata by calling <code>GetMLTransform</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetMLTransform service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`.
 
 @see AWSglueGetMLTransformRequest
 @see AWSglueGetMLTransformResponse
 */
- (void)getMLTransform:(AWSglueGetMLTransformRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetMLTransformResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a sortable, filterable list of existing AWS Glue machine learning transforms. Machine learning transforms are a special type of transform that use machine learning to learn the details of the transformation to be performed by learning from examples provided by humans. These transformations are then saved by AWS Glue, and you can retrieve their metadata by calling <code>GetMLTransforms</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetMLTransforms service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetMLTransformsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`.
 
 @see AWSglueGetMLTransformsRequest
 @see AWSglueGetMLTransformsResponse
 */
- (AWSTask<AWSglueGetMLTransformsResponse *> *)getMLTransforms:(AWSglueGetMLTransformsRequest *)request;

/**
 <p>Gets a sortable, filterable list of existing AWS Glue machine learning transforms. Machine learning transforms are a special type of transform that use machine learning to learn the details of the transformation to be performed by learning from examples provided by humans. These transformations are then saved by AWS Glue, and you can retrieve their metadata by calling <code>GetMLTransforms</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetMLTransforms service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`.
 
 @see AWSglueGetMLTransformsRequest
 @see AWSglueGetMLTransformsResponse
 */
- (void)getMLTransforms:(AWSglueGetMLTransformsRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetMLTransformsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates mappings.</p>
 
 @param request A container for the necessary parameters to execute the GetMapping service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetMappingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorEntityNotFound`.
 
 @see AWSglueGetMappingRequest
 @see AWSglueGetMappingResponse
 */
- (AWSTask<AWSglueGetMappingResponse *> *)getMapping:(AWSglueGetMappingRequest *)request;

/**
 <p>Creates mappings.</p>
 
 @param request A container for the necessary parameters to execute the GetMapping service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorEntityNotFound`.
 
 @see AWSglueGetMappingRequest
 @see AWSglueGetMappingResponse
 */
- (void)getMapping:(AWSglueGetMappingRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetMappingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a specified partition.</p>
 
 @param request A container for the necessary parameters to execute the GetPartition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetPartitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueGetPartitionRequest
 @see AWSglueGetPartitionResponse
 */
- (AWSTask<AWSglueGetPartitionResponse *> *)getPartition:(AWSglueGetPartitionRequest *)request;

/**
 <p>Retrieves information about a specified partition.</p>
 
 @param request A container for the necessary parameters to execute the GetPartition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueGetPartitionRequest
 @see AWSglueGetPartitionResponse
 */
- (void)getPartition:(AWSglueGetPartitionRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetPartitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the partitions in a table.</p>
 
 @param request A container for the necessary parameters to execute the GetPartitions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetPartitionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueGetPartitionsRequest
 @see AWSglueGetPartitionsResponse
 */
- (AWSTask<AWSglueGetPartitionsResponse *> *)getPartitions:(AWSglueGetPartitionsRequest *)request;

/**
 <p>Retrieves information about the partitions in a table.</p>
 
 @param request A container for the necessary parameters to execute the GetPartitions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueGetPartitionsRequest
 @see AWSglueGetPartitionsResponse
 */
- (void)getPartitions:(AWSglueGetPartitionsRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetPartitionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets code to perform a specified mapping.</p>
 
 @param request A container for the necessary parameters to execute the GetPlan service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetPlanResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetPlanRequest
 @see AWSglueGetPlanResponse
 */
- (AWSTask<AWSglueGetPlanResponse *> *)getPlan:(AWSglueGetPlanRequest *)request;

/**
 <p>Gets code to perform a specified mapping.</p>
 
 @param request A container for the necessary parameters to execute the GetPlan service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetPlanRequest
 @see AWSglueGetPlanResponse
 */
- (void)getPlan:(AWSglueGetPlanRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetPlanResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a specified resource policy.</p>
 
 @param request A container for the necessary parameters to execute the GetResourcePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetResourcePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`.
 
 @see AWSglueGetResourcePolicyRequest
 @see AWSglueGetResourcePolicyResponse
 */
- (AWSTask<AWSglueGetResourcePolicyResponse *> *)getResourcePolicy:(AWSglueGetResourcePolicyRequest *)request;

/**
 <p>Retrieves a specified resource policy.</p>
 
 @param request A container for the necessary parameters to execute the GetResourcePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`.
 
 @see AWSglueGetResourcePolicyRequest
 @see AWSglueGetResourcePolicyResponse
 */
- (void)getResourcePolicy:(AWSglueGetResourcePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetResourcePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a specified security configuration.</p>
 
 @param request A container for the necessary parameters to execute the GetSecurityConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetSecurityConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetSecurityConfigurationRequest
 @see AWSglueGetSecurityConfigurationResponse
 */
- (AWSTask<AWSglueGetSecurityConfigurationResponse *> *)getSecurityConfiguration:(AWSglueGetSecurityConfigurationRequest *)request;

/**
 <p>Retrieves a specified security configuration.</p>
 
 @param request A container for the necessary parameters to execute the GetSecurityConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetSecurityConfigurationRequest
 @see AWSglueGetSecurityConfigurationResponse
 */
- (void)getSecurityConfiguration:(AWSglueGetSecurityConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetSecurityConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of all security configurations.</p>
 
 @param request A container for the necessary parameters to execute the GetSecurityConfigurations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetSecurityConfigurationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetSecurityConfigurationsRequest
 @see AWSglueGetSecurityConfigurationsResponse
 */
- (AWSTask<AWSglueGetSecurityConfigurationsResponse *> *)getSecurityConfigurations:(AWSglueGetSecurityConfigurationsRequest *)request;

/**
 <p>Retrieves a list of all security configurations.</p>
 
 @param request A container for the necessary parameters to execute the GetSecurityConfigurations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetSecurityConfigurationsRequest
 @see AWSglueGetSecurityConfigurationsResponse
 */
- (void)getSecurityConfigurations:(AWSglueGetSecurityConfigurationsRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetSecurityConfigurationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the <code>Table</code> definition in a Data Catalog for a specified table.</p>
 
 @param request A container for the necessary parameters to execute the GetTable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetTableResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueGetTableRequest
 @see AWSglueGetTableResponse
 */
- (AWSTask<AWSglueGetTableResponse *> *)getTable:(AWSglueGetTableRequest *)request;

/**
 <p>Retrieves the <code>Table</code> definition in a Data Catalog for a specified table.</p>
 
 @param request A container for the necessary parameters to execute the GetTable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueGetTableRequest
 @see AWSglueGetTableResponse
 */
- (void)getTable:(AWSglueGetTableRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetTableResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a specified version of a table.</p>
 
 @param request A container for the necessary parameters to execute the GetTableVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetTableVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueGetTableVersionRequest
 @see AWSglueGetTableVersionResponse
 */
- (AWSTask<AWSglueGetTableVersionResponse *> *)getTableVersion:(AWSglueGetTableVersionRequest *)request;

/**
 <p>Retrieves a specified version of a table.</p>
 
 @param request A container for the necessary parameters to execute the GetTableVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueGetTableVersionRequest
 @see AWSglueGetTableVersionResponse
 */
- (void)getTableVersion:(AWSglueGetTableVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetTableVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of strings that identify available versions of a specified table.</p>
 
 @param request A container for the necessary parameters to execute the GetTableVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetTableVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueGetTableVersionsRequest
 @see AWSglueGetTableVersionsResponse
 */
- (AWSTask<AWSglueGetTableVersionsResponse *> *)getTableVersions:(AWSglueGetTableVersionsRequest *)request;

/**
 <p>Retrieves a list of strings that identify available versions of a specified table.</p>
 
 @param request A container for the necessary parameters to execute the GetTableVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueGetTableVersionsRequest
 @see AWSglueGetTableVersionsResponse
 */
- (void)getTableVersions:(AWSglueGetTableVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetTableVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the definitions of some or all of the tables in a given <code>Database</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetTables service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetTablesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueGetTablesRequest
 @see AWSglueGetTablesResponse
 */
- (AWSTask<AWSglueGetTablesResponse *> *)getTables:(AWSglueGetTablesRequest *)request;

/**
 <p>Retrieves the definitions of some or all of the tables in a given <code>Database</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetTables service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueGetTablesRequest
 @see AWSglueGetTablesResponse
 */
- (void)getTables:(AWSglueGetTablesRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetTablesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of tags associated with a resource.</p>
 
 @param request A container for the necessary parameters to execute the GetTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetTagsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorEntityNotFound`.
 
 @see AWSglueGetTagsRequest
 @see AWSglueGetTagsResponse
 */
- (AWSTask<AWSglueGetTagsResponse *> *)getTags:(AWSglueGetTagsRequest *)request;

/**
 <p>Retrieves a list of tags associated with a resource.</p>
 
 @param request A container for the necessary parameters to execute the GetTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorEntityNotFound`.
 
 @see AWSglueGetTagsRequest
 @see AWSglueGetTagsResponse
 */
- (void)getTags:(AWSglueGetTagsRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetTagsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the definition of a trigger.</p>
 
 @param request A container for the necessary parameters to execute the GetTrigger service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetTriggerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetTriggerRequest
 @see AWSglueGetTriggerResponse
 */
- (AWSTask<AWSglueGetTriggerResponse *> *)getTrigger:(AWSglueGetTriggerRequest *)request;

/**
 <p>Retrieves the definition of a trigger.</p>
 
 @param request A container for the necessary parameters to execute the GetTrigger service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetTriggerRequest
 @see AWSglueGetTriggerResponse
 */
- (void)getTrigger:(AWSglueGetTriggerRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetTriggerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets all the triggers associated with a job.</p>
 
 @param request A container for the necessary parameters to execute the GetTriggers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetTriggersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetTriggersRequest
 @see AWSglueGetTriggersResponse
 */
- (AWSTask<AWSglueGetTriggersResponse *> *)getTriggers:(AWSglueGetTriggersRequest *)request;

/**
 <p>Gets all the triggers associated with a job.</p>
 
 @param request A container for the necessary parameters to execute the GetTriggers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetTriggersRequest
 @see AWSglueGetTriggersResponse
 */
- (void)getTriggers:(AWSglueGetTriggersRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetTriggersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a specified function definition from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetUserDefinedFunction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetUserDefinedFunctionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueGetUserDefinedFunctionRequest
 @see AWSglueGetUserDefinedFunctionResponse
 */
- (AWSTask<AWSglueGetUserDefinedFunctionResponse *> *)getUserDefinedFunction:(AWSglueGetUserDefinedFunctionRequest *)request;

/**
 <p>Retrieves a specified function definition from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetUserDefinedFunction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueGetUserDefinedFunctionRequest
 @see AWSglueGetUserDefinedFunctionResponse
 */
- (void)getUserDefinedFunction:(AWSglueGetUserDefinedFunctionRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetUserDefinedFunctionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves multiple function definitions from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetUserDefinedFunctions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetUserDefinedFunctionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueGetUserDefinedFunctionsRequest
 @see AWSglueGetUserDefinedFunctionsResponse
 */
- (AWSTask<AWSglueGetUserDefinedFunctionsResponse *> *)getUserDefinedFunctions:(AWSglueGetUserDefinedFunctionsRequest *)request;

/**
 <p>Retrieves multiple function definitions from the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetUserDefinedFunctions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueGetUserDefinedFunctionsRequest
 @see AWSglueGetUserDefinedFunctionsResponse
 */
- (void)getUserDefinedFunctions:(AWSglueGetUserDefinedFunctionsRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetUserDefinedFunctionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves resource metadata for a workflow.</p>
 
 @param request A container for the necessary parameters to execute the GetWorkflow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetWorkflowResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetWorkflowRequest
 @see AWSglueGetWorkflowResponse
 */
- (AWSTask<AWSglueGetWorkflowResponse *> *)getWorkflow:(AWSglueGetWorkflowRequest *)request;

/**
 <p>Retrieves resource metadata for a workflow.</p>
 
 @param request A container for the necessary parameters to execute the GetWorkflow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetWorkflowRequest
 @see AWSglueGetWorkflowResponse
 */
- (void)getWorkflow:(AWSglueGetWorkflowRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetWorkflowResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the metadata for a given workflow run. </p>
 
 @param request A container for the necessary parameters to execute the GetWorkflowRun service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetWorkflowRunResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetWorkflowRunRequest
 @see AWSglueGetWorkflowRunResponse
 */
- (AWSTask<AWSglueGetWorkflowRunResponse *> *)getWorkflowRun:(AWSglueGetWorkflowRunRequest *)request;

/**
 <p>Retrieves the metadata for a given workflow run. </p>
 
 @param request A container for the necessary parameters to execute the GetWorkflowRun service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetWorkflowRunRequest
 @see AWSglueGetWorkflowRunResponse
 */
- (void)getWorkflowRun:(AWSglueGetWorkflowRunRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetWorkflowRunResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the workflow run properties which were set during the run.</p>
 
 @param request A container for the necessary parameters to execute the GetWorkflowRunProperties service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetWorkflowRunPropertiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetWorkflowRunPropertiesRequest
 @see AWSglueGetWorkflowRunPropertiesResponse
 */
- (AWSTask<AWSglueGetWorkflowRunPropertiesResponse *> *)getWorkflowRunProperties:(AWSglueGetWorkflowRunPropertiesRequest *)request;

/**
 <p>Retrieves the workflow run properties which were set during the run.</p>
 
 @param request A container for the necessary parameters to execute the GetWorkflowRunProperties service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetWorkflowRunPropertiesRequest
 @see AWSglueGetWorkflowRunPropertiesResponse
 */
- (void)getWorkflowRunProperties:(AWSglueGetWorkflowRunPropertiesRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetWorkflowRunPropertiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves metadata for all runs of a given workflow.</p>
 
 @param request A container for the necessary parameters to execute the GetWorkflowRuns service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueGetWorkflowRunsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetWorkflowRunsRequest
 @see AWSglueGetWorkflowRunsResponse
 */
- (AWSTask<AWSglueGetWorkflowRunsResponse *> *)getWorkflowRuns:(AWSglueGetWorkflowRunsRequest *)request;

/**
 <p>Retrieves metadata for all runs of a given workflow.</p>
 
 @param request A container for the necessary parameters to execute the GetWorkflowRuns service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueGetWorkflowRunsRequest
 @see AWSglueGetWorkflowRunsResponse
 */
- (void)getWorkflowRuns:(AWSglueGetWorkflowRunsRequest *)request completionHandler:(void (^ _Nullable)(AWSglueGetWorkflowRunsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Imports an existing Amazon Athena Data Catalog to AWS Glue</p>
 
 @param request A container for the necessary parameters to execute the ImportCatalogToGlue service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueImportCatalogToGlueResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueImportCatalogToGlueRequest
 @see AWSglueImportCatalogToGlueResponse
 */
- (AWSTask<AWSglueImportCatalogToGlueResponse *> *)importCatalogToGlue:(AWSglueImportCatalogToGlueRequest *)request;

/**
 <p>Imports an existing Amazon Athena Data Catalog to AWS Glue</p>
 
 @param request A container for the necessary parameters to execute the ImportCatalogToGlue service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueImportCatalogToGlueRequest
 @see AWSglueImportCatalogToGlueResponse
 */
- (void)importCatalogToGlue:(AWSglueImportCatalogToGlueRequest *)request completionHandler:(void (^ _Nullable)(AWSglueImportCatalogToGlueResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the names of all crawler resources in this AWS account, or the resources with the specified tag. This operation allows you to see which resources are available in your account, and their names.</p><p>This operation takes the optional <code>Tags</code> field, which you can use as a filter on the response so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only resources with the tag are retrieved.</p>
 
 @param request A container for the necessary parameters to execute the ListCrawlers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueListCrawlersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorOperationTimeout`.
 
 @see AWSglueListCrawlersRequest
 @see AWSglueListCrawlersResponse
 */
- (AWSTask<AWSglueListCrawlersResponse *> *)listCrawlers:(AWSglueListCrawlersRequest *)request;

/**
 <p>Retrieves the names of all crawler resources in this AWS account, or the resources with the specified tag. This operation allows you to see which resources are available in your account, and their names.</p><p>This operation takes the optional <code>Tags</code> field, which you can use as a filter on the response so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only resources with the tag are retrieved.</p>
 
 @param request A container for the necessary parameters to execute the ListCrawlers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorOperationTimeout`.
 
 @see AWSglueListCrawlersRequest
 @see AWSglueListCrawlersResponse
 */
- (void)listCrawlers:(AWSglueListCrawlersRequest *)request completionHandler:(void (^ _Nullable)(AWSglueListCrawlersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the names of all <code>DevEndpoint</code> resources in this AWS account, or the resources with the specified tag. This operation allows you to see which resources are available in your account, and their names.</p><p>This operation takes the optional <code>Tags</code> field, which you can use as a filter on the response so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only resources with the tag are retrieved.</p>
 
 @param request A container for the necessary parameters to execute the ListDevEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueListDevEndpointsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueListDevEndpointsRequest
 @see AWSglueListDevEndpointsResponse
 */
- (AWSTask<AWSglueListDevEndpointsResponse *> *)listDevEndpoints:(AWSglueListDevEndpointsRequest *)request;

/**
 <p>Retrieves the names of all <code>DevEndpoint</code> resources in this AWS account, or the resources with the specified tag. This operation allows you to see which resources are available in your account, and their names.</p><p>This operation takes the optional <code>Tags</code> field, which you can use as a filter on the response so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only resources with the tag are retrieved.</p>
 
 @param request A container for the necessary parameters to execute the ListDevEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueListDevEndpointsRequest
 @see AWSglueListDevEndpointsResponse
 */
- (void)listDevEndpoints:(AWSglueListDevEndpointsRequest *)request completionHandler:(void (^ _Nullable)(AWSglueListDevEndpointsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the names of all job resources in this AWS account, or the resources with the specified tag. This operation allows you to see which resources are available in your account, and their names.</p><p>This operation takes the optional <code>Tags</code> field, which you can use as a filter on the response so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only resources with the tag are retrieved.</p>
 
 @param request A container for the necessary parameters to execute the ListJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueListJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueListJobsRequest
 @see AWSglueListJobsResponse
 */
- (AWSTask<AWSglueListJobsResponse *> *)listJobs:(AWSglueListJobsRequest *)request;

/**
 <p>Retrieves the names of all job resources in this AWS account, or the resources with the specified tag. This operation allows you to see which resources are available in your account, and their names.</p><p>This operation takes the optional <code>Tags</code> field, which you can use as a filter on the response so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only resources with the tag are retrieved.</p>
 
 @param request A container for the necessary parameters to execute the ListJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueListJobsRequest
 @see AWSglueListJobsResponse
 */
- (void)listJobs:(AWSglueListJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSglueListJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Retrieves a sortable, filterable list of existing AWS Glue machine learning transforms in this AWS account, or the resources with the specified tag. This operation takes the optional <code>Tags</code> field, which you can use as a filter of the responses so that tagged resources can be retrieved as a group. If you choose to use tag filtering, only resources with the tags are retrieved. </p>
 
 @param request A container for the necessary parameters to execute the ListMLTransforms service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueListMLTransformsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`.
 
 @see AWSglueListMLTransformsRequest
 @see AWSglueListMLTransformsResponse
 */
- (AWSTask<AWSglueListMLTransformsResponse *> *)listMLTransforms:(AWSglueListMLTransformsRequest *)request;

/**
 <p> Retrieves a sortable, filterable list of existing AWS Glue machine learning transforms in this AWS account, or the resources with the specified tag. This operation takes the optional <code>Tags</code> field, which you can use as a filter of the responses so that tagged resources can be retrieved as a group. If you choose to use tag filtering, only resources with the tags are retrieved. </p>
 
 @param request A container for the necessary parameters to execute the ListMLTransforms service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`.
 
 @see AWSglueListMLTransformsRequest
 @see AWSglueListMLTransformsResponse
 */
- (void)listMLTransforms:(AWSglueListMLTransformsRequest *)request completionHandler:(void (^ _Nullable)(AWSglueListMLTransformsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the names of all trigger resources in this AWS account, or the resources with the specified tag. This operation allows you to see which resources are available in your account, and their names.</p><p>This operation takes the optional <code>Tags</code> field, which you can use as a filter on the response so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only resources with the tag are retrieved.</p>
 
 @param request A container for the necessary parameters to execute the ListTriggers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueListTriggersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueListTriggersRequest
 @see AWSglueListTriggersResponse
 */
- (AWSTask<AWSglueListTriggersResponse *> *)listTriggers:(AWSglueListTriggersRequest *)request;

/**
 <p>Retrieves the names of all trigger resources in this AWS account, or the resources with the specified tag. This operation allows you to see which resources are available in your account, and their names.</p><p>This operation takes the optional <code>Tags</code> field, which you can use as a filter on the response so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only resources with the tag are retrieved.</p>
 
 @param request A container for the necessary parameters to execute the ListTriggers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueListTriggersRequest
 @see AWSglueListTriggersResponse
 */
- (void)listTriggers:(AWSglueListTriggersRequest *)request completionHandler:(void (^ _Nullable)(AWSglueListTriggersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists names of workflows created in the account.</p>
 
 @param request A container for the necessary parameters to execute the ListWorkflows service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueListWorkflowsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueListWorkflowsRequest
 @see AWSglueListWorkflowsResponse
 */
- (AWSTask<AWSglueListWorkflowsResponse *> *)listWorkflows:(AWSglueListWorkflowsRequest *)request;

/**
 <p>Lists names of workflows created in the account.</p>
 
 @param request A container for the necessary parameters to execute the ListWorkflows service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueListWorkflowsRequest
 @see AWSglueListWorkflowsResponse
 */
- (void)listWorkflows:(AWSglueListWorkflowsRequest *)request completionHandler:(void (^ _Nullable)(AWSglueListWorkflowsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the security configuration for a specified catalog. After the configuration has been set, the specified encryption is applied to every catalog write thereafter.</p>
 
 @param request A container for the necessary parameters to execute the PutDataCatalogEncryptionSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSgluePutDataCatalogEncryptionSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInternalService`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`.
 
 @see AWSgluePutDataCatalogEncryptionSettingsRequest
 @see AWSgluePutDataCatalogEncryptionSettingsResponse
 */
- (AWSTask<AWSgluePutDataCatalogEncryptionSettingsResponse *> *)putDataCatalogEncryptionSettings:(AWSgluePutDataCatalogEncryptionSettingsRequest *)request;

/**
 <p>Sets the security configuration for a specified catalog. After the configuration has been set, the specified encryption is applied to every catalog write thereafter.</p>
 
 @param request A container for the necessary parameters to execute the PutDataCatalogEncryptionSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInternalService`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`.
 
 @see AWSgluePutDataCatalogEncryptionSettingsRequest
 @see AWSgluePutDataCatalogEncryptionSettingsResponse
 */
- (void)putDataCatalogEncryptionSettings:(AWSgluePutDataCatalogEncryptionSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSgluePutDataCatalogEncryptionSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the Data Catalog resource policy for access control.</p>
 
 @param request A container for the necessary parameters to execute the PutResourcePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSgluePutResourcePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`, `AWSglueErrorConditionCheckFailure`.
 
 @see AWSgluePutResourcePolicyRequest
 @see AWSgluePutResourcePolicyResponse
 */
- (AWSTask<AWSgluePutResourcePolicyResponse *> *)putResourcePolicy:(AWSgluePutResourcePolicyRequest *)request;

/**
 <p>Sets the Data Catalog resource policy for access control.</p>
 
 @param request A container for the necessary parameters to execute the PutResourcePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`, `AWSglueErrorConditionCheckFailure`.
 
 @see AWSgluePutResourcePolicyRequest
 @see AWSgluePutResourcePolicyResponse
 */
- (void)putResourcePolicy:(AWSgluePutResourcePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSgluePutResourcePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Puts the specified workflow run properties for the given workflow run. If a property already exists for the specified run, then it overrides the value otherwise adds the property to existing properties.</p>
 
 @param request A container for the necessary parameters to execute the PutWorkflowRunProperties service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSgluePutWorkflowRunPropertiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorAlreadyExists`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorConcurrentModification`.
 
 @see AWSgluePutWorkflowRunPropertiesRequest
 @see AWSgluePutWorkflowRunPropertiesResponse
 */
- (AWSTask<AWSgluePutWorkflowRunPropertiesResponse *> *)putWorkflowRunProperties:(AWSgluePutWorkflowRunPropertiesRequest *)request;

/**
 <p>Puts the specified workflow run properties for the given workflow run. If a property already exists for the specified run, then it overrides the value otherwise adds the property to existing properties.</p>
 
 @param request A container for the necessary parameters to execute the PutWorkflowRunProperties service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorAlreadyExists`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorConcurrentModification`.
 
 @see AWSgluePutWorkflowRunPropertiesRequest
 @see AWSgluePutWorkflowRunPropertiesResponse
 */
- (void)putWorkflowRunProperties:(AWSgluePutWorkflowRunPropertiesRequest *)request completionHandler:(void (^ _Nullable)(AWSgluePutWorkflowRunPropertiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Resets a bookmark entry.</p>
 
 @param request A container for the necessary parameters to execute the ResetJobBookmark service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueResetJobBookmarkResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueResetJobBookmarkRequest
 @see AWSglueResetJobBookmarkResponse
 */
- (AWSTask<AWSglueResetJobBookmarkResponse *> *)resetJobBookmark:(AWSglueResetJobBookmarkRequest *)request;

/**
 <p>Resets a bookmark entry.</p>
 
 @param request A container for the necessary parameters to execute the ResetJobBookmark service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueResetJobBookmarkRequest
 @see AWSglueResetJobBookmarkResponse
 */
- (void)resetJobBookmark:(AWSglueResetJobBookmarkRequest *)request completionHandler:(void (^ _Nullable)(AWSglueResetJobBookmarkResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches a set of tables based on properties in the table metadata as well as on the parent database. You can search against text or filter conditions. </p><p>You can only get tables that you have access to based on the security policies defined in Lake Formation. You need at least a read-only access to the table for it to be returned. If you do not have access to all the columns in the table, these columns will not be searched against when returning the list of tables back to you. If you have access to the columns but not the data in the columns, those columns and the associated metadata for those columns will be included in the search. </p>
 
 @param request A container for the necessary parameters to execute the SearchTables service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueSearchTablesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInternalService`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueSearchTablesRequest
 @see AWSglueSearchTablesResponse
 */
- (AWSTask<AWSglueSearchTablesResponse *> *)searchTables:(AWSglueSearchTablesRequest *)request;

/**
 <p>Searches a set of tables based on properties in the table metadata as well as on the parent database. You can search against text or filter conditions. </p><p>You can only get tables that you have access to based on the security policies defined in Lake Formation. You need at least a read-only access to the table for it to be returned. If you do not have access to all the columns in the table, these columns will not be searched against when returning the list of tables back to you. If you have access to the columns but not the data in the columns, those columns and the associated metadata for those columns will be included in the search. </p>
 
 @param request A container for the necessary parameters to execute the SearchTables service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInternalService`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueSearchTablesRequest
 @see AWSglueSearchTablesResponse
 */
- (void)searchTables:(AWSglueSearchTablesRequest *)request completionHandler:(void (^ _Nullable)(AWSglueSearchTablesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a crawl using the specified crawler, regardless of what is scheduled. If the crawler is already running, returns a <a href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-exceptions.html#aws-glue-api-exceptions-CrawlerRunningException">CrawlerRunningException</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartCrawler service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueStartCrawlerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorCrawlerRunning`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueStartCrawlerRequest
 @see AWSglueStartCrawlerResponse
 */
- (AWSTask<AWSglueStartCrawlerResponse *> *)startCrawler:(AWSglueStartCrawlerRequest *)request;

/**
 <p>Starts a crawl using the specified crawler, regardless of what is scheduled. If the crawler is already running, returns a <a href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-exceptions.html#aws-glue-api-exceptions-CrawlerRunningException">CrawlerRunningException</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartCrawler service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorCrawlerRunning`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueStartCrawlerRequest
 @see AWSglueStartCrawlerResponse
 */
- (void)startCrawler:(AWSglueStartCrawlerRequest *)request completionHandler:(void (^ _Nullable)(AWSglueStartCrawlerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Changes the schedule state of the specified crawler to <code>SCHEDULED</code>, unless the crawler is already running or the schedule state is already <code>SCHEDULED</code>.</p>
 
 @param request A container for the necessary parameters to execute the StartCrawlerSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueStartCrawlerScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorSchedulerRunning`, `AWSglueErrorSchedulerTransitioning`, `AWSglueErrorNoSchedule`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueStartCrawlerScheduleRequest
 @see AWSglueStartCrawlerScheduleResponse
 */
- (AWSTask<AWSglueStartCrawlerScheduleResponse *> *)startCrawlerSchedule:(AWSglueStartCrawlerScheduleRequest *)request;

/**
 <p>Changes the schedule state of the specified crawler to <code>SCHEDULED</code>, unless the crawler is already running or the schedule state is already <code>SCHEDULED</code>.</p>
 
 @param request A container for the necessary parameters to execute the StartCrawlerSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorSchedulerRunning`, `AWSglueErrorSchedulerTransitioning`, `AWSglueErrorNoSchedule`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueStartCrawlerScheduleRequest
 @see AWSglueStartCrawlerScheduleResponse
 */
- (void)startCrawlerSchedule:(AWSglueStartCrawlerScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSglueStartCrawlerScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Begins an asynchronous task to export all labeled data for a particular transform. This task is the only label-related API call that is not part of the typical active learning workflow. You typically use <code>StartExportLabelsTaskRun</code> when you want to work with all of your existing labels at the same time, such as when you want to remove or change labels that were previously submitted as truth. This API operation accepts the <code>TransformId</code> whose labels you want to export and an Amazon Simple Storage Service (Amazon S3) path to export the labels to. The operation returns a <code>TaskRunId</code>. You can check on the status of your task run by calling the <code>GetMLTaskRun</code> API.</p>
 
 @param request A container for the necessary parameters to execute the StartExportLabelsTaskRun service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueStartExportLabelsTaskRunResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`.
 
 @see AWSglueStartExportLabelsTaskRunRequest
 @see AWSglueStartExportLabelsTaskRunResponse
 */
- (AWSTask<AWSglueStartExportLabelsTaskRunResponse *> *)startExportLabelsTaskRun:(AWSglueStartExportLabelsTaskRunRequest *)request;

/**
 <p>Begins an asynchronous task to export all labeled data for a particular transform. This task is the only label-related API call that is not part of the typical active learning workflow. You typically use <code>StartExportLabelsTaskRun</code> when you want to work with all of your existing labels at the same time, such as when you want to remove or change labels that were previously submitted as truth. This API operation accepts the <code>TransformId</code> whose labels you want to export and an Amazon Simple Storage Service (Amazon S3) path to export the labels to. The operation returns a <code>TaskRunId</code>. You can check on the status of your task run by calling the <code>GetMLTaskRun</code> API.</p>
 
 @param request A container for the necessary parameters to execute the StartExportLabelsTaskRun service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`.
 
 @see AWSglueStartExportLabelsTaskRunRequest
 @see AWSglueStartExportLabelsTaskRunResponse
 */
- (void)startExportLabelsTaskRun:(AWSglueStartExportLabelsTaskRunRequest *)request completionHandler:(void (^ _Nullable)(AWSglueStartExportLabelsTaskRunResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables you to provide additional labels (examples of truth) to be used to teach the machine learning transform and improve its quality. This API operation is generally used as part of the active learning workflow that starts with the <code>StartMLLabelingSetGenerationTaskRun</code> call and that ultimately results in improving the quality of your machine learning transform. </p><p>After the <code>StartMLLabelingSetGenerationTaskRun</code> finishes, AWS Glue machine learning will have generated a series of questions for humans to answer. (Answering these questions is often called 'labeling' in the machine learning workflows). In the case of the <code>FindMatches</code> transform, these questions are of the form, “What is the correct way to group these rows together into groups composed entirely of matching records?” After the labeling process is finished, users upload their answers/labels with a call to <code>StartImportLabelsTaskRun</code>. After <code>StartImportLabelsTaskRun</code> finishes, all future runs of the machine learning transform use the new and improved labels and perform a higher-quality transformation.</p><p>By default, <code>StartMLLabelingSetGenerationTaskRun</code> continually learns from and combines all labels that you upload unless you set <code>Replace</code> to true. If you set <code>Replace</code> to true, <code>StartImportLabelsTaskRun</code> deletes and forgets all previously uploaded labels and learns only from the exact set that you upload. Replacing labels can be helpful if you realize that you previously uploaded incorrect labels, and you believe that they are having a negative effect on your transform quality.</p><p>You can check on the status of your task run by calling the <code>GetMLTaskRun</code> operation. </p>
 
 @param request A container for the necessary parameters to execute the StartImportLabelsTaskRun service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueStartImportLabelsTaskRunResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorInternalService`.
 
 @see AWSglueStartImportLabelsTaskRunRequest
 @see AWSglueStartImportLabelsTaskRunResponse
 */
- (AWSTask<AWSglueStartImportLabelsTaskRunResponse *> *)startImportLabelsTaskRun:(AWSglueStartImportLabelsTaskRunRequest *)request;

/**
 <p>Enables you to provide additional labels (examples of truth) to be used to teach the machine learning transform and improve its quality. This API operation is generally used as part of the active learning workflow that starts with the <code>StartMLLabelingSetGenerationTaskRun</code> call and that ultimately results in improving the quality of your machine learning transform. </p><p>After the <code>StartMLLabelingSetGenerationTaskRun</code> finishes, AWS Glue machine learning will have generated a series of questions for humans to answer. (Answering these questions is often called 'labeling' in the machine learning workflows). In the case of the <code>FindMatches</code> transform, these questions are of the form, “What is the correct way to group these rows together into groups composed entirely of matching records?” After the labeling process is finished, users upload their answers/labels with a call to <code>StartImportLabelsTaskRun</code>. After <code>StartImportLabelsTaskRun</code> finishes, all future runs of the machine learning transform use the new and improved labels and perform a higher-quality transformation.</p><p>By default, <code>StartMLLabelingSetGenerationTaskRun</code> continually learns from and combines all labels that you upload unless you set <code>Replace</code> to true. If you set <code>Replace</code> to true, <code>StartImportLabelsTaskRun</code> deletes and forgets all previously uploaded labels and learns only from the exact set that you upload. Replacing labels can be helpful if you realize that you previously uploaded incorrect labels, and you believe that they are having a negative effect on your transform quality.</p><p>You can check on the status of your task run by calling the <code>GetMLTaskRun</code> operation. </p>
 
 @param request A container for the necessary parameters to execute the StartImportLabelsTaskRun service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorInternalService`.
 
 @see AWSglueStartImportLabelsTaskRunRequest
 @see AWSglueStartImportLabelsTaskRunResponse
 */
- (void)startImportLabelsTaskRun:(AWSglueStartImportLabelsTaskRunRequest *)request completionHandler:(void (^ _Nullable)(AWSglueStartImportLabelsTaskRunResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a job run using a job definition.</p>
 
 @param request A container for the necessary parameters to execute the StartJobRun service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueStartJobRunResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorConcurrentRunsExceeded`.
 
 @see AWSglueStartJobRunRequest
 @see AWSglueStartJobRunResponse
 */
- (AWSTask<AWSglueStartJobRunResponse *> *)startJobRun:(AWSglueStartJobRunRequest *)request;

/**
 <p>Starts a job run using a job definition.</p>
 
 @param request A container for the necessary parameters to execute the StartJobRun service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorConcurrentRunsExceeded`.
 
 @see AWSglueStartJobRunRequest
 @see AWSglueStartJobRunResponse
 */
- (void)startJobRun:(AWSglueStartJobRunRequest *)request completionHandler:(void (^ _Nullable)(AWSglueStartJobRunResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a task to estimate the quality of the transform. </p><p>When you provide label sets as examples of truth, AWS Glue machine learning uses some of those examples to learn from them. The rest of the labels are used as a test to estimate quality.</p><p>Returns a unique identifier for the run. You can call <code>GetMLTaskRun</code> to get more information about the stats of the <code>EvaluationTaskRun</code>.</p>
 
 @param request A container for the necessary parameters to execute the StartMLEvaluationTaskRun service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueStartMLEvaluationTaskRunResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`, `AWSglueErrorConcurrentRunsExceeded`, `AWSglueErrorMLTransformNotReady`.
 
 @see AWSglueStartMLEvaluationTaskRunRequest
 @see AWSglueStartMLEvaluationTaskRunResponse
 */
- (AWSTask<AWSglueStartMLEvaluationTaskRunResponse *> *)startMLEvaluationTaskRun:(AWSglueStartMLEvaluationTaskRunRequest *)request;

/**
 <p>Starts a task to estimate the quality of the transform. </p><p>When you provide label sets as examples of truth, AWS Glue machine learning uses some of those examples to learn from them. The rest of the labels are used as a test to estimate quality.</p><p>Returns a unique identifier for the run. You can call <code>GetMLTaskRun</code> to get more information about the stats of the <code>EvaluationTaskRun</code>.</p>
 
 @param request A container for the necessary parameters to execute the StartMLEvaluationTaskRun service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`, `AWSglueErrorConcurrentRunsExceeded`, `AWSglueErrorMLTransformNotReady`.
 
 @see AWSglueStartMLEvaluationTaskRunRequest
 @see AWSglueStartMLEvaluationTaskRunResponse
 */
- (void)startMLEvaluationTaskRun:(AWSglueStartMLEvaluationTaskRunRequest *)request completionHandler:(void (^ _Nullable)(AWSglueStartMLEvaluationTaskRunResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts the active learning workflow for your machine learning transform to improve the transform's quality by generating label sets and adding labels.</p><p>When the <code>StartMLLabelingSetGenerationTaskRun</code> finishes, AWS Glue will have generated a "labeling set" or a set of questions for humans to answer.</p><p>In the case of the <code>FindMatches</code> transform, these questions are of the form, “What is the correct way to group these rows together into groups composed entirely of matching records?” </p><p>After the labeling process is finished, you can upload your labels with a call to <code>StartImportLabelsTaskRun</code>. After <code>StartImportLabelsTaskRun</code> finishes, all future runs of the machine learning transform will use the new and improved labels and perform a higher-quality transformation.</p>
 
 @param request A container for the necessary parameters to execute the StartMLLabelingSetGenerationTaskRun service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueStartMLLabelingSetGenerationTaskRunResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`, `AWSglueErrorConcurrentRunsExceeded`.
 
 @see AWSglueStartMLLabelingSetGenerationTaskRunRequest
 @see AWSglueStartMLLabelingSetGenerationTaskRunResponse
 */
- (AWSTask<AWSglueStartMLLabelingSetGenerationTaskRunResponse *> *)startMLLabelingSetGenerationTaskRun:(AWSglueStartMLLabelingSetGenerationTaskRunRequest *)request;

/**
 <p>Starts the active learning workflow for your machine learning transform to improve the transform's quality by generating label sets and adding labels.</p><p>When the <code>StartMLLabelingSetGenerationTaskRun</code> finishes, AWS Glue will have generated a "labeling set" or a set of questions for humans to answer.</p><p>In the case of the <code>FindMatches</code> transform, these questions are of the form, “What is the correct way to group these rows together into groups composed entirely of matching records?” </p><p>After the labeling process is finished, you can upload your labels with a call to <code>StartImportLabelsTaskRun</code>. After <code>StartImportLabelsTaskRun</code> finishes, all future runs of the machine learning transform will use the new and improved labels and perform a higher-quality transformation.</p>
 
 @param request A container for the necessary parameters to execute the StartMLLabelingSetGenerationTaskRun service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`, `AWSglueErrorConcurrentRunsExceeded`.
 
 @see AWSglueStartMLLabelingSetGenerationTaskRunRequest
 @see AWSglueStartMLLabelingSetGenerationTaskRunResponse
 */
- (void)startMLLabelingSetGenerationTaskRun:(AWSglueStartMLLabelingSetGenerationTaskRunRequest *)request completionHandler:(void (^ _Nullable)(AWSglueStartMLLabelingSetGenerationTaskRunResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts an existing trigger. See <a href="https://docs.aws.amazon.com/glue/latest/dg/trigger-job.html">Triggering Jobs</a> for information about how different types of trigger are started.</p>
 
 @param request A container for the necessary parameters to execute the StartTrigger service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueStartTriggerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorConcurrentRunsExceeded`.
 
 @see AWSglueStartTriggerRequest
 @see AWSglueStartTriggerResponse
 */
- (AWSTask<AWSglueStartTriggerResponse *> *)startTrigger:(AWSglueStartTriggerRequest *)request;

/**
 <p>Starts an existing trigger. See <a href="https://docs.aws.amazon.com/glue/latest/dg/trigger-job.html">Triggering Jobs</a> for information about how different types of trigger are started.</p>
 
 @param request A container for the necessary parameters to execute the StartTrigger service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorConcurrentRunsExceeded`.
 
 @see AWSglueStartTriggerRequest
 @see AWSglueStartTriggerResponse
 */
- (void)startTrigger:(AWSglueStartTriggerRequest *)request completionHandler:(void (^ _Nullable)(AWSglueStartTriggerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a new run of the specified workflow.</p>
 
 @param request A container for the necessary parameters to execute the StartWorkflowRun service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueStartWorkflowRunResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorConcurrentRunsExceeded`.
 
 @see AWSglueStartWorkflowRunRequest
 @see AWSglueStartWorkflowRunResponse
 */
- (AWSTask<AWSglueStartWorkflowRunResponse *> *)startWorkflowRun:(AWSglueStartWorkflowRunRequest *)request;

/**
 <p>Starts a new run of the specified workflow.</p>
 
 @param request A container for the necessary parameters to execute the StartWorkflowRun service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorConcurrentRunsExceeded`.
 
 @see AWSglueStartWorkflowRunRequest
 @see AWSglueStartWorkflowRunResponse
 */
- (void)startWorkflowRun:(AWSglueStartWorkflowRunRequest *)request completionHandler:(void (^ _Nullable)(AWSglueStartWorkflowRunResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>If the specified crawler is running, stops the crawl.</p>
 
 @param request A container for the necessary parameters to execute the StopCrawler service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueStopCrawlerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorCrawlerNotRunning`, `AWSglueErrorCrawlerStopping`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueStopCrawlerRequest
 @see AWSglueStopCrawlerResponse
 */
- (AWSTask<AWSglueStopCrawlerResponse *> *)stopCrawler:(AWSglueStopCrawlerRequest *)request;

/**
 <p>If the specified crawler is running, stops the crawl.</p>
 
 @param request A container for the necessary parameters to execute the StopCrawler service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorCrawlerNotRunning`, `AWSglueErrorCrawlerStopping`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueStopCrawlerRequest
 @see AWSglueStopCrawlerResponse
 */
- (void)stopCrawler:(AWSglueStopCrawlerRequest *)request completionHandler:(void (^ _Nullable)(AWSglueStopCrawlerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the schedule state of the specified crawler to <code>NOT_SCHEDULED</code>, but does not stop the crawler if it is already running.</p>
 
 @param request A container for the necessary parameters to execute the StopCrawlerSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueStopCrawlerScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorSchedulerNotRunning`, `AWSglueErrorSchedulerTransitioning`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueStopCrawlerScheduleRequest
 @see AWSglueStopCrawlerScheduleResponse
 */
- (AWSTask<AWSglueStopCrawlerScheduleResponse *> *)stopCrawlerSchedule:(AWSglueStopCrawlerScheduleRequest *)request;

/**
 <p>Sets the schedule state of the specified crawler to <code>NOT_SCHEDULED</code>, but does not stop the crawler if it is already running.</p>
 
 @param request A container for the necessary parameters to execute the StopCrawlerSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorSchedulerNotRunning`, `AWSglueErrorSchedulerTransitioning`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueStopCrawlerScheduleRequest
 @see AWSglueStopCrawlerScheduleResponse
 */
- (void)stopCrawlerSchedule:(AWSglueStopCrawlerScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSglueStopCrawlerScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops a specified trigger.</p>
 
 @param request A container for the necessary parameters to execute the StopTrigger service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueStopTriggerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`, `AWSglueErrorConcurrentModification`.
 
 @see AWSglueStopTriggerRequest
 @see AWSglueStopTriggerResponse
 */
- (AWSTask<AWSglueStopTriggerResponse *> *)stopTrigger:(AWSglueStopTriggerRequest *)request;

/**
 <p>Stops a specified trigger.</p>
 
 @param request A container for the necessary parameters to execute the StopTrigger service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`, `AWSglueErrorConcurrentModification`.
 
 @see AWSglueStopTriggerRequest
 @see AWSglueStopTriggerResponse
 */
- (void)stopTrigger:(AWSglueStopTriggerRequest *)request completionHandler:(void (^ _Nullable)(AWSglueStopTriggerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds tags to a resource. A tag is a label you can assign to an AWS resource. In AWS Glue, you can tag only certain resources. For information about what resources you can tag, see <a href="https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">AWS Tags in AWS Glue</a>.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorEntityNotFound`.
 
 @see AWSglueTagResourceRequest
 @see AWSglueTagResourceResponse
 */
- (AWSTask<AWSglueTagResourceResponse *> *)tagResource:(AWSglueTagResourceRequest *)request;

/**
 <p>Adds tags to a resource. A tag is a label you can assign to an AWS resource. In AWS Glue, you can tag only certain resources. For information about what resources you can tag, see <a href="https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">AWS Tags in AWS Glue</a>.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorEntityNotFound`.
 
 @see AWSglueTagResourceRequest
 @see AWSglueTagResourceResponse
 */
- (void)tagResource:(AWSglueTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSglueTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorEntityNotFound`.
 
 @see AWSglueUntagResourceRequest
 @see AWSglueUntagResourceResponse
 */
- (AWSTask<AWSglueUntagResourceResponse *> *)untagResource:(AWSglueUntagResourceRequest *)request;

/**
 <p>Removes tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorEntityNotFound`.
 
 @see AWSglueUntagResourceRequest
 @see AWSglueUntagResourceResponse
 */
- (void)untagResource:(AWSglueUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSglueUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies an existing classifier (a <code>GrokClassifier</code>, an <code>XMLClassifier</code>, a <code>JsonClassifier</code>, or a <code>CsvClassifier</code>, depending on which field is present).</p>
 
 @param request A container for the necessary parameters to execute the UpdateClassifier service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueUpdateClassifierResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorVersionMismatch`, `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueUpdateClassifierRequest
 @see AWSglueUpdateClassifierResponse
 */
- (AWSTask<AWSglueUpdateClassifierResponse *> *)updateClassifier:(AWSglueUpdateClassifierRequest *)request;

/**
 <p>Modifies an existing classifier (a <code>GrokClassifier</code>, an <code>XMLClassifier</code>, a <code>JsonClassifier</code>, or a <code>CsvClassifier</code>, depending on which field is present).</p>
 
 @param request A container for the necessary parameters to execute the UpdateClassifier service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorVersionMismatch`, `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueUpdateClassifierRequest
 @see AWSglueUpdateClassifierResponse
 */
- (void)updateClassifier:(AWSglueUpdateClassifierRequest *)request completionHandler:(void (^ _Nullable)(AWSglueUpdateClassifierResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a connection definition in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the UpdateConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueUpdateConnectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueUpdateConnectionRequest
 @see AWSglueUpdateConnectionResponse
 */
- (AWSTask<AWSglueUpdateConnectionResponse *> *)updateConnection:(AWSglueUpdateConnectionRequest *)request;

/**
 <p>Updates a connection definition in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the UpdateConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueUpdateConnectionRequest
 @see AWSglueUpdateConnectionResponse
 */
- (void)updateConnection:(AWSglueUpdateConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSglueUpdateConnectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a crawler. If a crawler is running, you must stop it using <code>StopCrawler</code> before updating it.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCrawler service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueUpdateCrawlerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorVersionMismatch`, `AWSglueErrorEntityNotFound`, `AWSglueErrorCrawlerRunning`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueUpdateCrawlerRequest
 @see AWSglueUpdateCrawlerResponse
 */
- (AWSTask<AWSglueUpdateCrawlerResponse *> *)updateCrawler:(AWSglueUpdateCrawlerRequest *)request;

/**
 <p>Updates a crawler. If a crawler is running, you must stop it using <code>StopCrawler</code> before updating it.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCrawler service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorVersionMismatch`, `AWSglueErrorEntityNotFound`, `AWSglueErrorCrawlerRunning`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueUpdateCrawlerRequest
 @see AWSglueUpdateCrawlerResponse
 */
- (void)updateCrawler:(AWSglueUpdateCrawlerRequest *)request completionHandler:(void (^ _Nullable)(AWSglueUpdateCrawlerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the schedule of a crawler using a <code>cron</code> expression. </p>
 
 @param request A container for the necessary parameters to execute the UpdateCrawlerSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueUpdateCrawlerScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorVersionMismatch`, `AWSglueErrorSchedulerTransitioning`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueUpdateCrawlerScheduleRequest
 @see AWSglueUpdateCrawlerScheduleResponse
 */
- (AWSTask<AWSglueUpdateCrawlerScheduleResponse *> *)updateCrawlerSchedule:(AWSglueUpdateCrawlerScheduleRequest *)request;

/**
 <p>Updates the schedule of a crawler using a <code>cron</code> expression. </p>
 
 @param request A container for the necessary parameters to execute the UpdateCrawlerSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorVersionMismatch`, `AWSglueErrorSchedulerTransitioning`, `AWSglueErrorOperationTimeout`.
 
 @see AWSglueUpdateCrawlerScheduleRequest
 @see AWSglueUpdateCrawlerScheduleResponse
 */
- (void)updateCrawlerSchedule:(AWSglueUpdateCrawlerScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSglueUpdateCrawlerScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing database definition in a Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDatabase service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueUpdateDatabaseResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueUpdateDatabaseRequest
 @see AWSglueUpdateDatabaseResponse
 */
- (AWSTask<AWSglueUpdateDatabaseResponse *> *)updateDatabase:(AWSglueUpdateDatabaseRequest *)request;

/**
 <p>Updates an existing database definition in a Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDatabase service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueUpdateDatabaseRequest
 @see AWSglueUpdateDatabaseResponse
 */
- (void)updateDatabase:(AWSglueUpdateDatabaseRequest *)request completionHandler:(void (^ _Nullable)(AWSglueUpdateDatabaseResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a specified development endpoint.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDevEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueUpdateDevEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`, `AWSglueErrorValidation`.
 
 @see AWSglueUpdateDevEndpointRequest
 @see AWSglueUpdateDevEndpointResponse
 */
- (AWSTask<AWSglueUpdateDevEndpointResponse *> *)updateDevEndpoint:(AWSglueUpdateDevEndpointRequest *)request;

/**
 <p>Updates a specified development endpoint.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDevEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInvalidInput`, `AWSglueErrorValidation`.
 
 @see AWSglueUpdateDevEndpointRequest
 @see AWSglueUpdateDevEndpointResponse
 */
- (void)updateDevEndpoint:(AWSglueUpdateDevEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSglueUpdateDevEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing job definition.</p>
 
 @param request A container for the necessary parameters to execute the UpdateJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueUpdateJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorConcurrentModification`.
 
 @see AWSglueUpdateJobRequest
 @see AWSglueUpdateJobResponse
 */
- (AWSTask<AWSglueUpdateJobResponse *> *)updateJob:(AWSglueUpdateJobRequest *)request;

/**
 <p>Updates an existing job definition.</p>
 
 @param request A container for the necessary parameters to execute the UpdateJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorConcurrentModification`.
 
 @see AWSglueUpdateJobRequest
 @see AWSglueUpdateJobResponse
 */
- (void)updateJob:(AWSglueUpdateJobRequest *)request completionHandler:(void (^ _Nullable)(AWSglueUpdateJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing machine learning transform. Call this operation to tune the algorithm parameters to achieve better results.</p><p>After calling this operation, you can call the <code>StartMLEvaluationTaskRun</code> operation to assess how well your new parameters achieved your goals (such as improving the quality of your machine learning transform, or making it more cost-effective).</p>
 
 @param request A container for the necessary parameters to execute the UpdateMLTransform service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueUpdateMLTransformResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`, `AWSglueErrorAccessDenied`.
 
 @see AWSglueUpdateMLTransformRequest
 @see AWSglueUpdateMLTransformResponse
 */
- (AWSTask<AWSglueUpdateMLTransformResponse *> *)updateMLTransform:(AWSglueUpdateMLTransformRequest *)request;

/**
 <p>Updates an existing machine learning transform. Call this operation to tune the algorithm parameters to achieve better results.</p><p>After calling this operation, you can call the <code>StartMLEvaluationTaskRun</code> operation to assess how well your new parameters achieved your goals (such as improving the quality of your machine learning transform, or making it more cost-effective).</p>
 
 @param request A container for the necessary parameters to execute the UpdateMLTransform service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorOperationTimeout`, `AWSglueErrorInternalService`, `AWSglueErrorAccessDenied`.
 
 @see AWSglueUpdateMLTransformRequest
 @see AWSglueUpdateMLTransformResponse
 */
- (void)updateMLTransform:(AWSglueUpdateMLTransformRequest *)request completionHandler:(void (^ _Nullable)(AWSglueUpdateMLTransformResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a partition.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePartition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueUpdatePartitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueUpdatePartitionRequest
 @see AWSglueUpdatePartitionResponse
 */
- (AWSTask<AWSglueUpdatePartitionResponse *> *)updatePartition:(AWSglueUpdatePartitionRequest *)request;

/**
 <p>Updates a partition.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePartition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueUpdatePartitionRequest
 @see AWSglueUpdatePartitionResponse
 */
- (void)updatePartition:(AWSglueUpdatePartitionRequest *)request completionHandler:(void (^ _Nullable)(AWSglueUpdatePartitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a metadata table in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueUpdateTableResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorConcurrentModification`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueUpdateTableRequest
 @see AWSglueUpdateTableResponse
 */
- (AWSTask<AWSglueUpdateTableResponse *> *)updateTable:(AWSglueUpdateTableRequest *)request;

/**
 <p>Updates a metadata table in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorConcurrentModification`, `AWSglueErrorResourceNumberLimitExceeded`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueUpdateTableRequest
 @see AWSglueUpdateTableResponse
 */
- (void)updateTable:(AWSglueUpdateTableRequest *)request completionHandler:(void (^ _Nullable)(AWSglueUpdateTableResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a trigger definition.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTrigger service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueUpdateTriggerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`, `AWSglueErrorConcurrentModification`.
 
 @see AWSglueUpdateTriggerRequest
 @see AWSglueUpdateTriggerResponse
 */
- (AWSTask<AWSglueUpdateTriggerResponse *> *)updateTrigger:(AWSglueUpdateTriggerRequest *)request;

/**
 <p>Updates a trigger definition.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTrigger service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorEntityNotFound`, `AWSglueErrorOperationTimeout`, `AWSglueErrorConcurrentModification`.
 
 @see AWSglueUpdateTriggerRequest
 @see AWSglueUpdateTriggerResponse
 */
- (void)updateTrigger:(AWSglueUpdateTriggerRequest *)request completionHandler:(void (^ _Nullable)(AWSglueUpdateTriggerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing function definition in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserDefinedFunction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueUpdateUserDefinedFunctionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueUpdateUserDefinedFunctionRequest
 @see AWSglueUpdateUserDefinedFunctionResponse
 */
- (AWSTask<AWSglueUpdateUserDefinedFunctionResponse *> *)updateUserDefinedFunction:(AWSglueUpdateUserDefinedFunctionRequest *)request;

/**
 <p>Updates an existing function definition in the Data Catalog.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserDefinedFunction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorEntityNotFound`, `AWSglueErrorInvalidInput`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorGlueEncryption`.
 
 @see AWSglueUpdateUserDefinedFunctionRequest
 @see AWSglueUpdateUserDefinedFunctionResponse
 */
- (void)updateUserDefinedFunction:(AWSglueUpdateUserDefinedFunctionRequest *)request completionHandler:(void (^ _Nullable)(AWSglueUpdateUserDefinedFunctionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing workflow.</p>
 
 @param request A container for the necessary parameters to execute the UpdateWorkflow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSglueUpdateWorkflowResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorConcurrentModification`.
 
 @see AWSglueUpdateWorkflowRequest
 @see AWSglueUpdateWorkflowResponse
 */
- (AWSTask<AWSglueUpdateWorkflowResponse *> *)updateWorkflow:(AWSglueUpdateWorkflowRequest *)request;

/**
 <p>Updates an existing workflow.</p>
 
 @param request A container for the necessary parameters to execute the UpdateWorkflow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSglueErrorDomain` domain and the following error code: `AWSglueErrorInvalidInput`, `AWSglueErrorEntityNotFound`, `AWSglueErrorInternalService`, `AWSglueErrorOperationTimeout`, `AWSglueErrorConcurrentModification`.
 
 @see AWSglueUpdateWorkflowRequest
 @see AWSglueUpdateWorkflowResponse
 */
- (void)updateWorkflow:(AWSglueUpdateWorkflowRequest *)request completionHandler:(void (^ _Nullable)(AWSglueUpdateWorkflowResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
