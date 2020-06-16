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
#import "AWSDataexchangeModel.h"
#import "AWSDataexchangeResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSDataexchange
FOUNDATION_EXPORT NSString *const AWSDataexchangeSDKVersion;

/**
 <p>AWS Data Exchange is a service that makes it easy for AWS customers to exchange data in the cloud. You can use the AWS Data Exchange APIs to create, update, manage, and access file-based data set in the AWS Cloud.</p><p>As a subscriber, you can view and access the data sets that you have an entitlement to through a subscription. You can use the APIS to download or copy your entitled data sets to Amazon S3 for use across a variety of AWS analytics and machine learning services.</p><p>As a provider, you can create and manage your data sets that you would like to publish to a product. Being able to package and provide your data sets into products requires a few steps to determine eligibility. For more information, visit the AWS Data Exchange User Guide.</p><p>A data set is a collection of data that can be changed or updated over time. Data sets can be updated using revisions, which represent a new version or incremental change to a data set.A revision contains one or more assets. An asset in AWS Data Exchange is a piece of data that can be stored as an Amazon S3 object. The asset can be a structured data file, an image file, or some other data file. Jobs are asynchronous import or export operations used to create or copy assets.</p>
 */
@interface AWSDataexchange : AWSService

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

     let Dataexchange = AWSDataexchange.default()

 *Objective-C*

     AWSDataexchange *Dataexchange = [AWSDataexchange defaultDataexchange];

 @return The default service client.
 */
+ (instancetype)defaultDataexchange;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSDataexchange.register(with: configuration!, forKey: "USWest2Dataexchange")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSDataexchange registerDataexchangeWithConfiguration:configuration forKey:@"USWest2Dataexchange"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Dataexchange = AWSDataexchange(forKey: "USWest2Dataexchange")

 *Objective-C*

     AWSDataexchange *Dataexchange = [AWSDataexchange DataexchangeForKey:@"USWest2Dataexchange"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerDataexchangeWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerDataexchangeWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSDataexchange.register(with: configuration!, forKey: "USWest2Dataexchange")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSDataexchange registerDataexchangeWithConfiguration:configuration forKey:@"USWest2Dataexchange"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Dataexchange = AWSDataexchange(forKey: "USWest2Dataexchange")

 *Objective-C*

     AWSDataexchange *Dataexchange = [AWSDataexchange DataexchangeForKey:@"USWest2Dataexchange"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)DataexchangeForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeDataexchangeForKey:(NSString *)key;

/**
 <p>This operation cancels a job. Jobs can be cancelled only when they are in the WAITING state.</p>
 
 @param request A container for the necessary parameters to execute the CancelJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`, `AWSDataexchangeErrorConflict`.
 
 @see AWSDataexchangeCancelJobRequest
 */
- (AWSTask *)cancelJob:(AWSDataexchangeCancelJobRequest *)request;

/**
 <p>This operation cancels a job. Jobs can be cancelled only when they are in the WAITING state.</p>
 
 @param request A container for the necessary parameters to execute the CancelJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`, `AWSDataexchangeErrorConflict`.
 
 @see AWSDataexchangeCancelJobRequest
 */
- (void)cancelJob:(AWSDataexchangeCancelJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This operation creates a data set.</p>
 
 @param request A container for the necessary parameters to execute the CreateDataSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDataexchangeCreateDataSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`, `AWSDataexchangeErrorServiceLimitExceeded`, `AWSDataexchangeErrorAccessDenied`.
 
 @see AWSDataexchangeCreateDataSetRequest
 @see AWSDataexchangeCreateDataSetResponse
 */
- (AWSTask<AWSDataexchangeCreateDataSetResponse *> *)createDataSet:(AWSDataexchangeCreateDataSetRequest *)request;

/**
 <p>This operation creates a data set.</p>
 
 @param request A container for the necessary parameters to execute the CreateDataSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`, `AWSDataexchangeErrorServiceLimitExceeded`, `AWSDataexchangeErrorAccessDenied`.
 
 @see AWSDataexchangeCreateDataSetRequest
 @see AWSDataexchangeCreateDataSetResponse
 */
- (void)createDataSet:(AWSDataexchangeCreateDataSetRequest *)request completionHandler:(void (^ _Nullable)(AWSDataexchangeCreateDataSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation creates a job.</p>
 
 @param request A container for the necessary parameters to execute the CreateJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDataexchangeCreateJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`, `AWSDataexchangeErrorAccessDenied`.
 
 @see AWSDataexchangeCreateJobRequest
 @see AWSDataexchangeCreateJobResponse
 */
- (AWSTask<AWSDataexchangeCreateJobResponse *> *)createJob:(AWSDataexchangeCreateJobRequest *)request;

/**
 <p>This operation creates a job.</p>
 
 @param request A container for the necessary parameters to execute the CreateJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`, `AWSDataexchangeErrorAccessDenied`.
 
 @see AWSDataexchangeCreateJobRequest
 @see AWSDataexchangeCreateJobResponse
 */
- (void)createJob:(AWSDataexchangeCreateJobRequest *)request completionHandler:(void (^ _Nullable)(AWSDataexchangeCreateJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation creates a revision for a data set.</p>
 
 @param request A container for the necessary parameters to execute the CreateRevision service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDataexchangeCreateRevisionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`, `AWSDataexchangeErrorAccessDenied`.
 
 @see AWSDataexchangeCreateRevisionRequest
 @see AWSDataexchangeCreateRevisionResponse
 */
- (AWSTask<AWSDataexchangeCreateRevisionResponse *> *)createRevision:(AWSDataexchangeCreateRevisionRequest *)request;

/**
 <p>This operation creates a revision for a data set.</p>
 
 @param request A container for the necessary parameters to execute the CreateRevision service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`, `AWSDataexchangeErrorAccessDenied`.
 
 @see AWSDataexchangeCreateRevisionRequest
 @see AWSDataexchangeCreateRevisionResponse
 */
- (void)createRevision:(AWSDataexchangeCreateRevisionRequest *)request completionHandler:(void (^ _Nullable)(AWSDataexchangeCreateRevisionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation deletes an asset.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAsset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`, `AWSDataexchangeErrorAccessDenied`, `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorConflict`.
 
 @see AWSDataexchangeDeleteAssetRequest
 */
- (AWSTask *)deleteAsset:(AWSDataexchangeDeleteAssetRequest *)request;

/**
 <p>This operation deletes an asset.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAsset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`, `AWSDataexchangeErrorAccessDenied`, `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorConflict`.
 
 @see AWSDataexchangeDeleteAssetRequest
 */
- (void)deleteAsset:(AWSDataexchangeDeleteAssetRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This operation deletes a data set.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDataSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`, `AWSDataexchangeErrorAccessDenied`, `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorConflict`.
 
 @see AWSDataexchangeDeleteDataSetRequest
 */
- (AWSTask *)deleteDataSet:(AWSDataexchangeDeleteDataSetRequest *)request;

/**
 <p>This operation deletes a data set.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDataSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`, `AWSDataexchangeErrorAccessDenied`, `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorConflict`.
 
 @see AWSDataexchangeDeleteDataSetRequest
 */
- (void)deleteDataSet:(AWSDataexchangeDeleteDataSetRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This operation deletes a revision.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRevision service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`, `AWSDataexchangeErrorAccessDenied`, `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorConflict`.
 
 @see AWSDataexchangeDeleteRevisionRequest
 */
- (AWSTask *)deleteRevision:(AWSDataexchangeDeleteRevisionRequest *)request;

/**
 <p>This operation deletes a revision.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRevision service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`, `AWSDataexchangeErrorAccessDenied`, `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorConflict`.
 
 @see AWSDataexchangeDeleteRevisionRequest
 */
- (void)deleteRevision:(AWSDataexchangeDeleteRevisionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This operation returns information about an asset.</p>
 
 @param request A container for the necessary parameters to execute the GetAsset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDataexchangeGetAssetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`.
 
 @see AWSDataexchangeGetAssetRequest
 @see AWSDataexchangeGetAssetResponse
 */
- (AWSTask<AWSDataexchangeGetAssetResponse *> *)getAsset:(AWSDataexchangeGetAssetRequest *)request;

/**
 <p>This operation returns information about an asset.</p>
 
 @param request A container for the necessary parameters to execute the GetAsset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`.
 
 @see AWSDataexchangeGetAssetRequest
 @see AWSDataexchangeGetAssetResponse
 */
- (void)getAsset:(AWSDataexchangeGetAssetRequest *)request completionHandler:(void (^ _Nullable)(AWSDataexchangeGetAssetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation returns information about a data set.</p>
 
 @param request A container for the necessary parameters to execute the GetDataSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDataexchangeGetDataSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`.
 
 @see AWSDataexchangeGetDataSetRequest
 @see AWSDataexchangeGetDataSetResponse
 */
- (AWSTask<AWSDataexchangeGetDataSetResponse *> *)getDataSet:(AWSDataexchangeGetDataSetRequest *)request;

/**
 <p>This operation returns information about a data set.</p>
 
 @param request A container for the necessary parameters to execute the GetDataSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`.
 
 @see AWSDataexchangeGetDataSetRequest
 @see AWSDataexchangeGetDataSetResponse
 */
- (void)getDataSet:(AWSDataexchangeGetDataSetRequest *)request completionHandler:(void (^ _Nullable)(AWSDataexchangeGetDataSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation returns information about a job.</p>
 
 @param request A container for the necessary parameters to execute the GetJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDataexchangeGetJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`.
 
 @see AWSDataexchangeGetJobRequest
 @see AWSDataexchangeGetJobResponse
 */
- (AWSTask<AWSDataexchangeGetJobResponse *> *)getJob:(AWSDataexchangeGetJobRequest *)request;

/**
 <p>This operation returns information about a job.</p>
 
 @param request A container for the necessary parameters to execute the GetJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`.
 
 @see AWSDataexchangeGetJobRequest
 @see AWSDataexchangeGetJobResponse
 */
- (void)getJob:(AWSDataexchangeGetJobRequest *)request completionHandler:(void (^ _Nullable)(AWSDataexchangeGetJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation returns information about a revision.</p>
 
 @param request A container for the necessary parameters to execute the GetRevision service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDataexchangeGetRevisionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`.
 
 @see AWSDataexchangeGetRevisionRequest
 @see AWSDataexchangeGetRevisionResponse
 */
- (AWSTask<AWSDataexchangeGetRevisionResponse *> *)getRevision:(AWSDataexchangeGetRevisionRequest *)request;

/**
 <p>This operation returns information about a revision.</p>
 
 @param request A container for the necessary parameters to execute the GetRevision service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`.
 
 @see AWSDataexchangeGetRevisionRequest
 @see AWSDataexchangeGetRevisionResponse
 */
- (void)getRevision:(AWSDataexchangeGetRevisionRequest *)request completionHandler:(void (^ _Nullable)(AWSDataexchangeGetRevisionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation lists a data set's revisions sorted by CreatedAt in descending order.</p>
 
 @param request A container for the necessary parameters to execute the ListDataSetRevisions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDataexchangeListDataSetRevisionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`.
 
 @see AWSDataexchangeListDataSetRevisionsRequest
 @see AWSDataexchangeListDataSetRevisionsResponse
 */
- (AWSTask<AWSDataexchangeListDataSetRevisionsResponse *> *)listDataSetRevisions:(AWSDataexchangeListDataSetRevisionsRequest *)request;

/**
 <p>This operation lists a data set's revisions sorted by CreatedAt in descending order.</p>
 
 @param request A container for the necessary parameters to execute the ListDataSetRevisions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`.
 
 @see AWSDataexchangeListDataSetRevisionsRequest
 @see AWSDataexchangeListDataSetRevisionsResponse
 */
- (void)listDataSetRevisions:(AWSDataexchangeListDataSetRevisionsRequest *)request completionHandler:(void (^ _Nullable)(AWSDataexchangeListDataSetRevisionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation lists your data sets. When listing by origin OWNED, results are sorted by CreatedAt in descending order. When listing by origin ENTITLED, there is no order and the maxResults parameter is ignored.</p>
 
 @param request A container for the necessary parameters to execute the ListDataSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDataexchangeListDataSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`.
 
 @see AWSDataexchangeListDataSetsRequest
 @see AWSDataexchangeListDataSetsResponse
 */
- (AWSTask<AWSDataexchangeListDataSetsResponse *> *)listDataSets:(AWSDataexchangeListDataSetsRequest *)request;

/**
 <p>This operation lists your data sets. When listing by origin OWNED, results are sorted by CreatedAt in descending order. When listing by origin ENTITLED, there is no order and the maxResults parameter is ignored.</p>
 
 @param request A container for the necessary parameters to execute the ListDataSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`.
 
 @see AWSDataexchangeListDataSetsRequest
 @see AWSDataexchangeListDataSetsResponse
 */
- (void)listDataSets:(AWSDataexchangeListDataSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSDataexchangeListDataSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation lists your jobs sorted by CreatedAt in descending order.</p>
 
 @param request A container for the necessary parameters to execute the ListJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDataexchangeListJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`.
 
 @see AWSDataexchangeListJobsRequest
 @see AWSDataexchangeListJobsResponse
 */
- (AWSTask<AWSDataexchangeListJobsResponse *> *)listJobs:(AWSDataexchangeListJobsRequest *)request;

/**
 <p>This operation lists your jobs sorted by CreatedAt in descending order.</p>
 
 @param request A container for the necessary parameters to execute the ListJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`.
 
 @see AWSDataexchangeListJobsRequest
 @see AWSDataexchangeListJobsResponse
 */
- (void)listJobs:(AWSDataexchangeListJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSDataexchangeListJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation lists a revision's assets sorted alphabetically in descending order.</p>
 
 @param request A container for the necessary parameters to execute the ListRevisionAssets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDataexchangeListRevisionAssetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`.
 
 @see AWSDataexchangeListRevisionAssetsRequest
 @see AWSDataexchangeListRevisionAssetsResponse
 */
- (AWSTask<AWSDataexchangeListRevisionAssetsResponse *> *)listRevisionAssets:(AWSDataexchangeListRevisionAssetsRequest *)request;

/**
 <p>This operation lists a revision's assets sorted alphabetically in descending order.</p>
 
 @param request A container for the necessary parameters to execute the ListRevisionAssets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`.
 
 @see AWSDataexchangeListRevisionAssetsRequest
 @see AWSDataexchangeListRevisionAssetsResponse
 */
- (void)listRevisionAssets:(AWSDataexchangeListRevisionAssetsRequest *)request completionHandler:(void (^ _Nullable)(AWSDataexchangeListRevisionAssetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation lists the tags on the resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDataexchangeListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: .
 
 @see AWSDataexchangeListTagsForResourceRequest
 @see AWSDataexchangeListTagsForResourceResponse
 */
- (AWSTask<AWSDataexchangeListTagsForResourceResponse *> *)listTagsForResource:(AWSDataexchangeListTagsForResourceRequest *)request;

/**
 <p>This operation lists the tags on the resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: .
 
 @see AWSDataexchangeListTagsForResourceRequest
 @see AWSDataexchangeListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSDataexchangeListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSDataexchangeListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation starts a job.</p>
 
 @param request A container for the necessary parameters to execute the StartJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDataexchangeStartJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`, `AWSDataexchangeErrorAccessDenied`, `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorConflict`.
 
 @see AWSDataexchangeStartJobRequest
 @see AWSDataexchangeStartJobResponse
 */
- (AWSTask<AWSDataexchangeStartJobResponse *> *)startJob:(AWSDataexchangeStartJobRequest *)request;

/**
 <p>This operation starts a job.</p>
 
 @param request A container for the necessary parameters to execute the StartJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`, `AWSDataexchangeErrorAccessDenied`, `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorConflict`.
 
 @see AWSDataexchangeStartJobRequest
 @see AWSDataexchangeStartJobResponse
 */
- (void)startJob:(AWSDataexchangeStartJobRequest *)request completionHandler:(void (^ _Nullable)(AWSDataexchangeStartJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation tags a resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: .
 
 @see AWSDataexchangeTagResourceRequest
 */
- (AWSTask *)tagResource:(AWSDataexchangeTagResourceRequest *)request;

/**
 <p>This operation tags a resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: .
 
 @see AWSDataexchangeTagResourceRequest
 */
- (void)tagResource:(AWSDataexchangeTagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This operation removes one or more tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: .
 
 @see AWSDataexchangeUntagResourceRequest
 */
- (AWSTask *)untagResource:(AWSDataexchangeUntagResourceRequest *)request;

/**
 <p>This operation removes one or more tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: .
 
 @see AWSDataexchangeUntagResourceRequest
 */
- (void)untagResource:(AWSDataexchangeUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This operation updates an asset.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAsset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDataexchangeUpdateAssetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`, `AWSDataexchangeErrorAccessDenied`, `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorConflict`.
 
 @see AWSDataexchangeUpdateAssetRequest
 @see AWSDataexchangeUpdateAssetResponse
 */
- (AWSTask<AWSDataexchangeUpdateAssetResponse *> *)updateAsset:(AWSDataexchangeUpdateAssetRequest *)request;

/**
 <p>This operation updates an asset.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAsset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`, `AWSDataexchangeErrorAccessDenied`, `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorConflict`.
 
 @see AWSDataexchangeUpdateAssetRequest
 @see AWSDataexchangeUpdateAssetResponse
 */
- (void)updateAsset:(AWSDataexchangeUpdateAssetRequest *)request completionHandler:(void (^ _Nullable)(AWSDataexchangeUpdateAssetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation updates a data set.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDataSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDataexchangeUpdateDataSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`, `AWSDataexchangeErrorAccessDenied`.
 
 @see AWSDataexchangeUpdateDataSetRequest
 @see AWSDataexchangeUpdateDataSetResponse
 */
- (AWSTask<AWSDataexchangeUpdateDataSetResponse *> *)updateDataSet:(AWSDataexchangeUpdateDataSetRequest *)request;

/**
 <p>This operation updates a data set.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDataSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`, `AWSDataexchangeErrorAccessDenied`.
 
 @see AWSDataexchangeUpdateDataSetRequest
 @see AWSDataexchangeUpdateDataSetResponse
 */
- (void)updateDataSet:(AWSDataexchangeUpdateDataSetRequest *)request completionHandler:(void (^ _Nullable)(AWSDataexchangeUpdateDataSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation updates a revision.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRevision service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDataexchangeUpdateRevisionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`, `AWSDataexchangeErrorAccessDenied`, `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorConflict`.
 
 @see AWSDataexchangeUpdateRevisionRequest
 @see AWSDataexchangeUpdateRevisionResponse
 */
- (AWSTask<AWSDataexchangeUpdateRevisionResponse *> *)updateRevision:(AWSDataexchangeUpdateRevisionRequest *)request;

/**
 <p>This operation updates a revision.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRevision service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDataexchangeErrorDomain` domain and the following error code: `AWSDataexchangeErrorValidation`, `AWSDataexchangeErrorInternalServer`, `AWSDataexchangeErrorAccessDenied`, `AWSDataexchangeErrorResourceNotFound`, `AWSDataexchangeErrorThrottling`, `AWSDataexchangeErrorConflict`.
 
 @see AWSDataexchangeUpdateRevisionRequest
 @see AWSDataexchangeUpdateRevisionResponse
 */
- (void)updateRevision:(AWSDataexchangeUpdateRevisionRequest *)request completionHandler:(void (^ _Nullable)(AWSDataexchangeUpdateRevisionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
