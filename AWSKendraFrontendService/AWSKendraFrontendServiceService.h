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
#import "AWSKendraFrontendServiceModel.h"
#import "AWSKendraFrontendServiceResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSKendraFrontendService
FOUNDATION_EXPORT NSString *const AWSKendraFrontendServiceSDKVersion;

/**
 <p>Amazon Kendra is a service for indexing large document sets.</p>
 */
@interface AWSKendraFrontendService : AWSService

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

     let KendraFrontendService = AWSKendraFrontendService.default()

 *Objective-C*

     AWSKendraFrontendService *KendraFrontendService = [AWSKendraFrontendService defaultKendraFrontendService];

 @return The default service client.
 */
+ (instancetype)defaultKendraFrontendService;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSKendraFrontendService.register(with: configuration!, forKey: "USWest2KendraFrontendService")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:@"USWest2KendraFrontendService"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let KendraFrontendService = AWSKendraFrontendService(forKey: "USWest2KendraFrontendService")

 *Objective-C*

     AWSKendraFrontendService *KendraFrontendService = [AWSKendraFrontendService KendraFrontendServiceForKey:@"USWest2KendraFrontendService"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerKendraFrontendServiceWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerKendraFrontendServiceWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSKendraFrontendService.register(with: configuration!, forKey: "USWest2KendraFrontendService")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:@"USWest2KendraFrontendService"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let KendraFrontendService = AWSKendraFrontendService(forKey: "USWest2KendraFrontendService")

 *Objective-C*

     AWSKendraFrontendService *KendraFrontendService = [AWSKendraFrontendService KendraFrontendServiceForKey:@"USWest2KendraFrontendService"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)KendraFrontendServiceForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeKendraFrontendServiceForKey:(NSString *)key;

/**
 <p>Removes one or more documents from an index. The documents must have been added with the <a>BatchPutDocument</a> operation.</p><p>The documents are deleted asynchronously. You can see the progress of the deletion by using AWS CloudWatch. Any error messages releated to the processing of the batch are sent to you CloudWatch log.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeleteDocument service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKendraFrontendServiceBatchDeleteDocumentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceBatchDeleteDocumentRequest
 @see AWSKendraFrontendServiceBatchDeleteDocumentResponse
 */
- (AWSTask<AWSKendraFrontendServiceBatchDeleteDocumentResponse *> *)batchDeleteDocument:(AWSKendraFrontendServiceBatchDeleteDocumentRequest *)request;

/**
 <p>Removes one or more documents from an index. The documents must have been added with the <a>BatchPutDocument</a> operation.</p><p>The documents are deleted asynchronously. You can see the progress of the deletion by using AWS CloudWatch. Any error messages releated to the processing of the batch are sent to you CloudWatch log.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeleteDocument service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceBatchDeleteDocumentRequest
 @see AWSKendraFrontendServiceBatchDeleteDocumentResponse
 */
- (void)batchDeleteDocument:(AWSKendraFrontendServiceBatchDeleteDocumentRequest *)request completionHandler:(void (^ _Nullable)(AWSKendraFrontendServiceBatchDeleteDocumentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds one or more documents to an index.</p><p>The <code>BatchPutDocument</code> operation enables you to ingest inline documents or a set of documents stored in an Amazon S3 bucket. Use this operation to ingest your text and unstructured text into an index, add custom attributes to the documents, and to attach an access control list to the documents added to the index.</p><p>The documents are indexed asynchronously. You can see the progress of the batch using AWS CloudWatch. Any error messages related to processing the batch are sent to your AWS CloudWatch log.</p>
 
 @param request A container for the necessary parameters to execute the BatchPutDocument service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKendraFrontendServiceBatchPutDocumentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorServiceQuotaExceeded`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceBatchPutDocumentRequest
 @see AWSKendraFrontendServiceBatchPutDocumentResponse
 */
- (AWSTask<AWSKendraFrontendServiceBatchPutDocumentResponse *> *)batchPutDocument:(AWSKendraFrontendServiceBatchPutDocumentRequest *)request;

/**
 <p>Adds one or more documents to an index.</p><p>The <code>BatchPutDocument</code> operation enables you to ingest inline documents or a set of documents stored in an Amazon S3 bucket. Use this operation to ingest your text and unstructured text into an index, add custom attributes to the documents, and to attach an access control list to the documents added to the index.</p><p>The documents are indexed asynchronously. You can see the progress of the batch using AWS CloudWatch. Any error messages related to processing the batch are sent to your AWS CloudWatch log.</p>
 
 @param request A container for the necessary parameters to execute the BatchPutDocument service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorServiceQuotaExceeded`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceBatchPutDocumentRequest
 @see AWSKendraFrontendServiceBatchPutDocumentResponse
 */
- (void)batchPutDocument:(AWSKendraFrontendServiceBatchPutDocumentRequest *)request completionHandler:(void (^ _Nullable)(AWSKendraFrontendServiceBatchPutDocumentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a data source that you use to with an Amazon Kendra index. </p><p>You specify a name, connector type and description for your data source. You can choose between an S3 connector, a SharePoint Online connector, and a database connector.</p><p>You also specify configuration information such as document metadata (author, source URI, and so on) and user context information.</p><p><code>CreateDataSource</code> is a synchronous operation. The operation returns 200 if the data source was successfully created. Otherwise, an exception is raised.</p>
 
 @param request A container for the necessary parameters to execute the CreateDataSource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKendraFrontendServiceCreateDataSourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorResourceAlreadyExist`, `AWSKendraFrontendServiceErrorServiceQuotaExceeded`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceCreateDataSourceRequest
 @see AWSKendraFrontendServiceCreateDataSourceResponse
 */
- (AWSTask<AWSKendraFrontendServiceCreateDataSourceResponse *> *)createDataSource:(AWSKendraFrontendServiceCreateDataSourceRequest *)request;

/**
 <p>Creates a data source that you use to with an Amazon Kendra index. </p><p>You specify a name, connector type and description for your data source. You can choose between an S3 connector, a SharePoint Online connector, and a database connector.</p><p>You also specify configuration information such as document metadata (author, source URI, and so on) and user context information.</p><p><code>CreateDataSource</code> is a synchronous operation. The operation returns 200 if the data source was successfully created. Otherwise, an exception is raised.</p>
 
 @param request A container for the necessary parameters to execute the CreateDataSource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorResourceAlreadyExist`, `AWSKendraFrontendServiceErrorServiceQuotaExceeded`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceCreateDataSourceRequest
 @see AWSKendraFrontendServiceCreateDataSourceResponse
 */
- (void)createDataSource:(AWSKendraFrontendServiceCreateDataSourceRequest *)request completionHandler:(void (^ _Nullable)(AWSKendraFrontendServiceCreateDataSourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an new set of frequently asked question (FAQ) questions and answers.</p>
 
 @param request A container for the necessary parameters to execute the CreateFaq service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKendraFrontendServiceCreateFaqResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorServiceQuotaExceeded`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceCreateFaqRequest
 @see AWSKendraFrontendServiceCreateFaqResponse
 */
- (AWSTask<AWSKendraFrontendServiceCreateFaqResponse *> *)createFaq:(AWSKendraFrontendServiceCreateFaqRequest *)request;

/**
 <p>Creates an new set of frequently asked question (FAQ) questions and answers.</p>
 
 @param request A container for the necessary parameters to execute the CreateFaq service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorServiceQuotaExceeded`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceCreateFaqRequest
 @see AWSKendraFrontendServiceCreateFaqResponse
 */
- (void)createFaq:(AWSKendraFrontendServiceCreateFaqRequest *)request completionHandler:(void (^ _Nullable)(AWSKendraFrontendServiceCreateFaqResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new Amazon Kendra index. Index creation is an asynchronous operation. To determine if index creation has completed, check the <code>Status</code> field returned from a call to . The <code>Status</code> field is set to <code>ACTIVE</code> when the index is ready to use.</p><p>Once the index is active you can index your documents using the operation or using one of the supported data sources. </p>
 
 @param request A container for the necessary parameters to execute the CreateIndex service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKendraFrontendServiceCreateIndexResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceAlreadyExist`, `AWSKendraFrontendServiceErrorServiceQuotaExceeded`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceCreateIndexRequest
 @see AWSKendraFrontendServiceCreateIndexResponse
 */
- (AWSTask<AWSKendraFrontendServiceCreateIndexResponse *> *)createIndex:(AWSKendraFrontendServiceCreateIndexRequest *)request;

/**
 <p>Creates a new Amazon Kendra index. Index creation is an asynchronous operation. To determine if index creation has completed, check the <code>Status</code> field returned from a call to . The <code>Status</code> field is set to <code>ACTIVE</code> when the index is ready to use.</p><p>Once the index is active you can index your documents using the operation or using one of the supported data sources. </p>
 
 @param request A container for the necessary parameters to execute the CreateIndex service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceAlreadyExist`, `AWSKendraFrontendServiceErrorServiceQuotaExceeded`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceCreateIndexRequest
 @see AWSKendraFrontendServiceCreateIndexResponse
 */
- (void)createIndex:(AWSKendraFrontendServiceCreateIndexRequest *)request completionHandler:(void (^ _Nullable)(AWSKendraFrontendServiceCreateIndexResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an Amazon Kendra data source. An exception is not thrown if the data source is already being deleted. While the data source is being deleted, the <code>Status</code> field returned by a call to the operation is set to <code>DELETING</code>. For more information, see <a href="https://docs.aws.amazon.com/kendra/latest/dg/delete-data-source.html">Deleting Data Sources</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDataSource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceDeleteDataSourceRequest
 */
- (AWSTask *)deleteDataSource:(AWSKendraFrontendServiceDeleteDataSourceRequest *)request;

/**
 <p>Deletes an Amazon Kendra data source. An exception is not thrown if the data source is already being deleted. While the data source is being deleted, the <code>Status</code> field returned by a call to the operation is set to <code>DELETING</code>. For more information, see <a href="https://docs.aws.amazon.com/kendra/latest/dg/delete-data-source.html">Deleting Data Sources</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDataSource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceDeleteDataSourceRequest
 */
- (void)deleteDataSource:(AWSKendraFrontendServiceDeleteDataSourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes an FAQ from an index.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFaq service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceDeleteFaqRequest
 */
- (AWSTask *)deleteFaq:(AWSKendraFrontendServiceDeleteFaqRequest *)request;

/**
 <p>Removes an FAQ from an index.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFaq service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceDeleteFaqRequest
 */
- (void)deleteFaq:(AWSKendraFrontendServiceDeleteFaqRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an existing Amazon Kendra index. An exception is not thrown if the index is already being deleted. While the index is being deleted, the <code>Status</code> field returned by a call to the <a>DescribeIndex</a> operation is set to <code>DELETING</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIndex service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceDeleteIndexRequest
 */
- (AWSTask *)deleteIndex:(AWSKendraFrontendServiceDeleteIndexRequest *)request;

/**
 <p>Deletes an existing Amazon Kendra index. An exception is not thrown if the index is already being deleted. While the index is being deleted, the <code>Status</code> field returned by a call to the <a>DescribeIndex</a> operation is set to <code>DELETING</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIndex service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceDeleteIndexRequest
 */
- (void)deleteIndex:(AWSKendraFrontendServiceDeleteIndexRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about a Amazon Kendra data source.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDataSource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKendraFrontendServiceDescribeDataSourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceDescribeDataSourceRequest
 @see AWSKendraFrontendServiceDescribeDataSourceResponse
 */
- (AWSTask<AWSKendraFrontendServiceDescribeDataSourceResponse *> *)describeDataSource:(AWSKendraFrontendServiceDescribeDataSourceRequest *)request;

/**
 <p>Gets information about a Amazon Kendra data source.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDataSource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceDescribeDataSourceRequest
 @see AWSKendraFrontendServiceDescribeDataSourceResponse
 */
- (void)describeDataSource:(AWSKendraFrontendServiceDescribeDataSourceRequest *)request completionHandler:(void (^ _Nullable)(AWSKendraFrontendServiceDescribeDataSourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about an FAQ list.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFaq service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKendraFrontendServiceDescribeFaqResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceDescribeFaqRequest
 @see AWSKendraFrontendServiceDescribeFaqResponse
 */
- (AWSTask<AWSKendraFrontendServiceDescribeFaqResponse *> *)describeFaq:(AWSKendraFrontendServiceDescribeFaqRequest *)request;

/**
 <p>Gets information about an FAQ list.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFaq service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceDescribeFaqRequest
 @see AWSKendraFrontendServiceDescribeFaqResponse
 */
- (void)describeFaq:(AWSKendraFrontendServiceDescribeFaqRequest *)request completionHandler:(void (^ _Nullable)(AWSKendraFrontendServiceDescribeFaqResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes an existing Amazon Kendra index</p>
 
 @param request A container for the necessary parameters to execute the DescribeIndex service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKendraFrontendServiceDescribeIndexResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceDescribeIndexRequest
 @see AWSKendraFrontendServiceDescribeIndexResponse
 */
- (AWSTask<AWSKendraFrontendServiceDescribeIndexResponse *> *)describeIndex:(AWSKendraFrontendServiceDescribeIndexRequest *)request;

/**
 <p>Describes an existing Amazon Kendra index</p>
 
 @param request A container for the necessary parameters to execute the DescribeIndex service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceDescribeIndexRequest
 @see AWSKendraFrontendServiceDescribeIndexResponse
 */
- (void)describeIndex:(AWSKendraFrontendServiceDescribeIndexRequest *)request completionHandler:(void (^ _Nullable)(AWSKendraFrontendServiceDescribeIndexResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets statistics about synchronizing Amazon Kendra with a data source.</p>
 
 @param request A container for the necessary parameters to execute the ListDataSourceSyncJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKendraFrontendServiceListDataSourceSyncJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceListDataSourceSyncJobsRequest
 @see AWSKendraFrontendServiceListDataSourceSyncJobsResponse
 */
- (AWSTask<AWSKendraFrontendServiceListDataSourceSyncJobsResponse *> *)listDataSourceSyncJobs:(AWSKendraFrontendServiceListDataSourceSyncJobsRequest *)request;

/**
 <p>Gets statistics about synchronizing Amazon Kendra with a data source.</p>
 
 @param request A container for the necessary parameters to execute the ListDataSourceSyncJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceListDataSourceSyncJobsRequest
 @see AWSKendraFrontendServiceListDataSourceSyncJobsResponse
 */
- (void)listDataSourceSyncJobs:(AWSKendraFrontendServiceListDataSourceSyncJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSKendraFrontendServiceListDataSourceSyncJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the data sources that you have created.</p>
 
 @param request A container for the necessary parameters to execute the ListDataSources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKendraFrontendServiceListDataSourcesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceListDataSourcesRequest
 @see AWSKendraFrontendServiceListDataSourcesResponse
 */
- (AWSTask<AWSKendraFrontendServiceListDataSourcesResponse *> *)listDataSources:(AWSKendraFrontendServiceListDataSourcesRequest *)request;

/**
 <p>Lists the data sources that you have created.</p>
 
 @param request A container for the necessary parameters to execute the ListDataSources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceListDataSourcesRequest
 @see AWSKendraFrontendServiceListDataSourcesResponse
 */
- (void)listDataSources:(AWSKendraFrontendServiceListDataSourcesRequest *)request completionHandler:(void (^ _Nullable)(AWSKendraFrontendServiceListDataSourcesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of FAQ lists associated with an index.</p>
 
 @param request A container for the necessary parameters to execute the ListFaqs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKendraFrontendServiceListFaqsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceListFaqsRequest
 @see AWSKendraFrontendServiceListFaqsResponse
 */
- (AWSTask<AWSKendraFrontendServiceListFaqsResponse *> *)listFaqs:(AWSKendraFrontendServiceListFaqsRequest *)request;

/**
 <p>Gets a list of FAQ lists associated with an index.</p>
 
 @param request A container for the necessary parameters to execute the ListFaqs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceListFaqsRequest
 @see AWSKendraFrontendServiceListFaqsResponse
 */
- (void)listFaqs:(AWSKendraFrontendServiceListFaqsRequest *)request completionHandler:(void (^ _Nullable)(AWSKendraFrontendServiceListFaqsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the Amazon Kendra indexes that you have created.</p>
 
 @param request A container for the necessary parameters to execute the ListIndices service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKendraFrontendServiceListIndicesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceListIndicesRequest
 @see AWSKendraFrontendServiceListIndicesResponse
 */
- (AWSTask<AWSKendraFrontendServiceListIndicesResponse *> *)listIndices:(AWSKendraFrontendServiceListIndicesRequest *)request;

/**
 <p>Lists the Amazon Kendra indexes that you have created.</p>
 
 @param request A container for the necessary parameters to execute the ListIndices service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceListIndicesRequest
 @see AWSKendraFrontendServiceListIndicesResponse
 */
- (void)listIndices:(AWSKendraFrontendServiceListIndicesRequest *)request completionHandler:(void (^ _Nullable)(AWSKendraFrontendServiceListIndicesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of tags associated with a specified resource. Indexes, FAQs, and data sources can have tags associated with them.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKendraFrontendServiceListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceUnavailable`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceListTagsForResourceRequest
 @see AWSKendraFrontendServiceListTagsForResourceResponse
 */
- (AWSTask<AWSKendraFrontendServiceListTagsForResourceResponse *> *)listTagsForResource:(AWSKendraFrontendServiceListTagsForResourceRequest *)request;

/**
 <p>Gets a list of tags associated with a specified resource. Indexes, FAQs, and data sources can have tags associated with them.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceUnavailable`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceListTagsForResourceRequest
 @see AWSKendraFrontendServiceListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSKendraFrontendServiceListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSKendraFrontendServiceListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches an active index. Use this API to search your documents using query. The <code>Query</code> operation enables to do faceted search and to filter results based on document attributes.</p><p>It also enables you to provide user context that Amazon Kendra uses to enforce document access control in the search results. </p><p>Amazon Kendra searches your index for text content and question and answer (FAQ) content. By default the response contains three types of results.</p><ul><li><p>Relevant passages</p></li><li><p>Matching FAQs</p></li><li><p>Relevant documents</p></li></ul><p>You can specify that the query return only one type of result using the <code>QueryResultTypeConfig</code> parameter.</p>
 
 @param request A container for the necessary parameters to execute the Query service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKendraFrontendServiceQueryResult`. On failed execution, `task.error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorServiceQuotaExceeded`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceQueryRequest
 @see AWSKendraFrontendServiceQueryResult
 */
- (AWSTask<AWSKendraFrontendServiceQueryResult *> *)query:(AWSKendraFrontendServiceQueryRequest *)request;

/**
 <p>Searches an active index. Use this API to search your documents using query. The <code>Query</code> operation enables to do faceted search and to filter results based on document attributes.</p><p>It also enables you to provide user context that Amazon Kendra uses to enforce document access control in the search results. </p><p>Amazon Kendra searches your index for text content and question and answer (FAQ) content. By default the response contains three types of results.</p><ul><li><p>Relevant passages</p></li><li><p>Matching FAQs</p></li><li><p>Relevant documents</p></li></ul><p>You can specify that the query return only one type of result using the <code>QueryResultTypeConfig</code> parameter.</p>
 
 @param request A container for the necessary parameters to execute the Query service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorServiceQuotaExceeded`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceQueryRequest
 @see AWSKendraFrontendServiceQueryResult
 */
- (void)query:(AWSKendraFrontendServiceQueryRequest *)request completionHandler:(void (^ _Nullable)(AWSKendraFrontendServiceQueryResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a synchronization job for a data source. If a synchronization job is already in progress, Amazon Kendra returns a <code>ResourceInUseException</code> exception.</p>
 
 @param request A container for the necessary parameters to execute the StartDataSourceSyncJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKendraFrontendServiceStartDataSourceSyncJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorResourceInUse`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceStartDataSourceSyncJobRequest
 @see AWSKendraFrontendServiceStartDataSourceSyncJobResponse
 */
- (AWSTask<AWSKendraFrontendServiceStartDataSourceSyncJobResponse *> *)startDataSourceSyncJob:(AWSKendraFrontendServiceStartDataSourceSyncJobRequest *)request;

/**
 <p>Starts a synchronization job for a data source. If a synchronization job is already in progress, Amazon Kendra returns a <code>ResourceInUseException</code> exception.</p>
 
 @param request A container for the necessary parameters to execute the StartDataSourceSyncJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorResourceInUse`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceStartDataSourceSyncJobRequest
 @see AWSKendraFrontendServiceStartDataSourceSyncJobResponse
 */
- (void)startDataSourceSyncJob:(AWSKendraFrontendServiceStartDataSourceSyncJobRequest *)request completionHandler:(void (^ _Nullable)(AWSKendraFrontendServiceStartDataSourceSyncJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops a running synchronization job. You can't stop a scheduled synchronization job.</p>
 
 @param request A container for the necessary parameters to execute the StopDataSourceSyncJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceStopDataSourceSyncJobRequest
 */
- (AWSTask *)stopDataSourceSyncJob:(AWSKendraFrontendServiceStopDataSourceSyncJobRequest *)request;

/**
 <p>Stops a running synchronization job. You can't stop a scheduled synchronization job.</p>
 
 @param request A container for the necessary parameters to execute the StopDataSourceSyncJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceStopDataSourceSyncJobRequest
 */
- (void)stopDataSourceSyncJob:(AWSKendraFrontendServiceStopDataSourceSyncJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Enables you to provide feedback to Amazon Kendra to improve the performance of the service. </p>
 
 @param request A container for the necessary parameters to execute the SubmitFeedback service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceUnavailable`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceSubmitFeedbackRequest
 */
- (AWSTask *)submitFeedback:(AWSKendraFrontendServiceSubmitFeedbackRequest *)request;

/**
 <p>Enables you to provide feedback to Amazon Kendra to improve the performance of the service. </p>
 
 @param request A container for the necessary parameters to execute the SubmitFeedback service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceUnavailable`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceSubmitFeedbackRequest
 */
- (void)submitFeedback:(AWSKendraFrontendServiceSubmitFeedbackRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Adds the specified tag to the specified index, FAQ, or data source resource. If the tag already exists, the existing value is replaced with the new value.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKendraFrontendServiceTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceUnavailable`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceTagResourceRequest
 @see AWSKendraFrontendServiceTagResourceResponse
 */
- (AWSTask<AWSKendraFrontendServiceTagResourceResponse *> *)tagResource:(AWSKendraFrontendServiceTagResourceRequest *)request;

/**
 <p>Adds the specified tag to the specified index, FAQ, or data source resource. If the tag already exists, the existing value is replaced with the new value.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceUnavailable`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceTagResourceRequest
 @see AWSKendraFrontendServiceTagResourceResponse
 */
- (void)tagResource:(AWSKendraFrontendServiceTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSKendraFrontendServiceTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a tag from an index, FAQ, or a data source.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKendraFrontendServiceUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceUnavailable`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceUntagResourceRequest
 @see AWSKendraFrontendServiceUntagResourceResponse
 */
- (AWSTask<AWSKendraFrontendServiceUntagResourceResponse *> *)untagResource:(AWSKendraFrontendServiceUntagResourceRequest *)request;

/**
 <p>Removes a tag from an index, FAQ, or a data source.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorResourceUnavailable`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceUntagResourceRequest
 @see AWSKendraFrontendServiceUntagResourceResponse
 */
- (void)untagResource:(AWSKendraFrontendServiceUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSKendraFrontendServiceUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing Amazon Kendra data source.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDataSource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceUpdateDataSourceRequest
 */
- (AWSTask *)updateDataSource:(AWSKendraFrontendServiceUpdateDataSourceRequest *)request;

/**
 <p>Updates an existing Amazon Kendra data source.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDataSource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceUpdateDataSourceRequest
 */
- (void)updateDataSource:(AWSKendraFrontendServiceUpdateDataSourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing Amazon Kendra index.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIndex service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorServiceQuotaExceeded`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceUpdateIndexRequest
 */
- (AWSTask *)updateIndex:(AWSKendraFrontendServiceUpdateIndexRequest *)request;

/**
 <p>Updates an existing Amazon Kendra index.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIndex service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKendraFrontendServiceErrorDomain` domain and the following error code: `AWSKendraFrontendServiceErrorValidation`, `AWSKendraFrontendServiceErrorConflict`, `AWSKendraFrontendServiceErrorResourceNotFound`, `AWSKendraFrontendServiceErrorThrottling`, `AWSKendraFrontendServiceErrorAccessDenied`, `AWSKendraFrontendServiceErrorServiceQuotaExceeded`, `AWSKendraFrontendServiceErrorInternalServer`.
 
 @see AWSKendraFrontendServiceUpdateIndexRequest
 */
- (void)updateIndex:(AWSKendraFrontendServiceUpdateIndexRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
