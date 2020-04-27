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
#import "AWSdataexchangeModel.h"
#import "AWSdataexchangeResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSdataexchange
FOUNDATION_EXPORT NSString *const AWSdataexchangeSDKVersion;

/**
 <p>AWS Data Exchange is a service that makes it easy for AWS customers to exchange data in the cloud. You can use the AWS Data Exchange APIs to create, update, manage, and access file-based data set in the AWS Cloud.</p><p>As a subscriber, you can view and access the data sets that you have an entitlement to through a subscription. You can use the APIS to download or copy your entitled data sets to Amazon S3 for use across a variety of AWS analytics and machine learning services.</p><p>As a provider, you can create and manage your data sets that you would like to publish to a product. Being able to package and provide your data sets into products requires a few steps to determine eligibility. For more information, visit the AWS Data Exchange User Guide.</p><p>A data set is a collection of data that can be changed or updated over time. Data sets can be updated using revisions, which represent a new version or incremental change to a data set.A revision contains one or more assets. An asset in AWS Data Exchange is a piece of data that can be stored as an Amazon S3 object. The asset can be a structured data file, an image file, or some other data file. Jobs are asynchronous import or export operations used to create or copy assets.</p>
 */
@interface AWSdataexchange : AWSService

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

     let dataexchange = AWSdataexchange.default()

 *Objective-C*

     AWSdataexchange *dataexchange = [AWSdataexchange defaultdataexchange];

 @return The default service client.
 */
+ (instancetype)defaultdataexchange;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSdataexchange.register(with: configuration!, forKey: "USWest2dataexchange")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSdataexchange registerdataexchangeWithConfiguration:configuration forKey:@"USWest2dataexchange"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let dataexchange = AWSdataexchange(forKey: "USWest2dataexchange")

 *Objective-C*

     AWSdataexchange *dataexchange = [AWSdataexchange dataexchangeForKey:@"USWest2dataexchange"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerdataexchangeWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerdataexchangeWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSdataexchange.register(with: configuration!, forKey: "USWest2dataexchange")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSdataexchange registerdataexchangeWithConfiguration:configuration forKey:@"USWest2dataexchange"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let dataexchange = AWSdataexchange(forKey: "USWest2dataexchange")

 *Objective-C*

     AWSdataexchange *dataexchange = [AWSdataexchange dataexchangeForKey:@"USWest2dataexchange"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)dataexchangeForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removedataexchangeForKey:(NSString *)key;

/**
 <p>This operation cancels a job. Jobs can be cancelled only when they are in the WAITING state.</p>
 
 @param request A container for the necessary parameters to execute the CancelJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`, `AWSdataexchangeErrorConflict`.
 
 @see AWSdataexchangeCancelJobRequest
 */
- (AWSTask *)cancelJob:(AWSdataexchangeCancelJobRequest *)request;

/**
 <p>This operation cancels a job. Jobs can be cancelled only when they are in the WAITING state.</p>
 
 @param request A container for the necessary parameters to execute the CancelJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`, `AWSdataexchangeErrorConflict`.
 
 @see AWSdataexchangeCancelJobRequest
 */
- (void)cancelJob:(AWSdataexchangeCancelJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This operation creates a data set.</p>
 
 @param request A container for the necessary parameters to execute the CreateDataSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdataexchangeCreateDataSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`, `AWSdataexchangeErrorServiceLimitExceeded`, `AWSdataexchangeErrorAccessDenied`.
 
 @see AWSdataexchangeCreateDataSetRequest
 @see AWSdataexchangeCreateDataSetResponse
 */
- (AWSTask<AWSdataexchangeCreateDataSetResponse *> *)createDataSet:(AWSdataexchangeCreateDataSetRequest *)request;

/**
 <p>This operation creates a data set.</p>
 
 @param request A container for the necessary parameters to execute the CreateDataSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`, `AWSdataexchangeErrorServiceLimitExceeded`, `AWSdataexchangeErrorAccessDenied`.
 
 @see AWSdataexchangeCreateDataSetRequest
 @see AWSdataexchangeCreateDataSetResponse
 */
- (void)createDataSet:(AWSdataexchangeCreateDataSetRequest *)request completionHandler:(void (^ _Nullable)(AWSdataexchangeCreateDataSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation creates a job.</p>
 
 @param request A container for the necessary parameters to execute the CreateJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdataexchangeCreateJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`, `AWSdataexchangeErrorAccessDenied`.
 
 @see AWSdataexchangeCreateJobRequest
 @see AWSdataexchangeCreateJobResponse
 */
- (AWSTask<AWSdataexchangeCreateJobResponse *> *)createJob:(AWSdataexchangeCreateJobRequest *)request;

/**
 <p>This operation creates a job.</p>
 
 @param request A container for the necessary parameters to execute the CreateJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`, `AWSdataexchangeErrorAccessDenied`.
 
 @see AWSdataexchangeCreateJobRequest
 @see AWSdataexchangeCreateJobResponse
 */
- (void)createJob:(AWSdataexchangeCreateJobRequest *)request completionHandler:(void (^ _Nullable)(AWSdataexchangeCreateJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation creates a revision for a data set.</p>
 
 @param request A container for the necessary parameters to execute the CreateRevision service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdataexchangeCreateRevisionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`, `AWSdataexchangeErrorAccessDenied`.
 
 @see AWSdataexchangeCreateRevisionRequest
 @see AWSdataexchangeCreateRevisionResponse
 */
- (AWSTask<AWSdataexchangeCreateRevisionResponse *> *)createRevision:(AWSdataexchangeCreateRevisionRequest *)request;

/**
 <p>This operation creates a revision for a data set.</p>
 
 @param request A container for the necessary parameters to execute the CreateRevision service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`, `AWSdataexchangeErrorAccessDenied`.
 
 @see AWSdataexchangeCreateRevisionRequest
 @see AWSdataexchangeCreateRevisionResponse
 */
- (void)createRevision:(AWSdataexchangeCreateRevisionRequest *)request completionHandler:(void (^ _Nullable)(AWSdataexchangeCreateRevisionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation deletes an asset.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAsset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`, `AWSdataexchangeErrorAccessDenied`, `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorConflict`.
 
 @see AWSdataexchangeDeleteAssetRequest
 */
- (AWSTask *)deleteAsset:(AWSdataexchangeDeleteAssetRequest *)request;

/**
 <p>This operation deletes an asset.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAsset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`, `AWSdataexchangeErrorAccessDenied`, `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorConflict`.
 
 @see AWSdataexchangeDeleteAssetRequest
 */
- (void)deleteAsset:(AWSdataexchangeDeleteAssetRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This operation deletes a data set.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDataSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`, `AWSdataexchangeErrorAccessDenied`, `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorConflict`.
 
 @see AWSdataexchangeDeleteDataSetRequest
 */
- (AWSTask *)deleteDataSet:(AWSdataexchangeDeleteDataSetRequest *)request;

/**
 <p>This operation deletes a data set.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDataSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`, `AWSdataexchangeErrorAccessDenied`, `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorConflict`.
 
 @see AWSdataexchangeDeleteDataSetRequest
 */
- (void)deleteDataSet:(AWSdataexchangeDeleteDataSetRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This operation deletes a revision.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRevision service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`, `AWSdataexchangeErrorAccessDenied`, `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorConflict`.
 
 @see AWSdataexchangeDeleteRevisionRequest
 */
- (AWSTask *)deleteRevision:(AWSdataexchangeDeleteRevisionRequest *)request;

/**
 <p>This operation deletes a revision.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRevision service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`, `AWSdataexchangeErrorAccessDenied`, `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorConflict`.
 
 @see AWSdataexchangeDeleteRevisionRequest
 */
- (void)deleteRevision:(AWSdataexchangeDeleteRevisionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This operation returns information about an asset.</p>
 
 @param request A container for the necessary parameters to execute the GetAsset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdataexchangeGetAssetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`.
 
 @see AWSdataexchangeGetAssetRequest
 @see AWSdataexchangeGetAssetResponse
 */
- (AWSTask<AWSdataexchangeGetAssetResponse *> *)getAsset:(AWSdataexchangeGetAssetRequest *)request;

/**
 <p>This operation returns information about an asset.</p>
 
 @param request A container for the necessary parameters to execute the GetAsset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`.
 
 @see AWSdataexchangeGetAssetRequest
 @see AWSdataexchangeGetAssetResponse
 */
- (void)getAsset:(AWSdataexchangeGetAssetRequest *)request completionHandler:(void (^ _Nullable)(AWSdataexchangeGetAssetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation returns information about a data set.</p>
 
 @param request A container for the necessary parameters to execute the GetDataSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdataexchangeGetDataSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`.
 
 @see AWSdataexchangeGetDataSetRequest
 @see AWSdataexchangeGetDataSetResponse
 */
- (AWSTask<AWSdataexchangeGetDataSetResponse *> *)getDataSet:(AWSdataexchangeGetDataSetRequest *)request;

/**
 <p>This operation returns information about a data set.</p>
 
 @param request A container for the necessary parameters to execute the GetDataSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`.
 
 @see AWSdataexchangeGetDataSetRequest
 @see AWSdataexchangeGetDataSetResponse
 */
- (void)getDataSet:(AWSdataexchangeGetDataSetRequest *)request completionHandler:(void (^ _Nullable)(AWSdataexchangeGetDataSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation returns information about a job.</p>
 
 @param request A container for the necessary parameters to execute the GetJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdataexchangeGetJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`.
 
 @see AWSdataexchangeGetJobRequest
 @see AWSdataexchangeGetJobResponse
 */
- (AWSTask<AWSdataexchangeGetJobResponse *> *)getJob:(AWSdataexchangeGetJobRequest *)request;

/**
 <p>This operation returns information about a job.</p>
 
 @param request A container for the necessary parameters to execute the GetJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`.
 
 @see AWSdataexchangeGetJobRequest
 @see AWSdataexchangeGetJobResponse
 */
- (void)getJob:(AWSdataexchangeGetJobRequest *)request completionHandler:(void (^ _Nullable)(AWSdataexchangeGetJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation returns information about a revision.</p>
 
 @param request A container for the necessary parameters to execute the GetRevision service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdataexchangeGetRevisionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`.
 
 @see AWSdataexchangeGetRevisionRequest
 @see AWSdataexchangeGetRevisionResponse
 */
- (AWSTask<AWSdataexchangeGetRevisionResponse *> *)getRevision:(AWSdataexchangeGetRevisionRequest *)request;

/**
 <p>This operation returns information about a revision.</p>
 
 @param request A container for the necessary parameters to execute the GetRevision service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`.
 
 @see AWSdataexchangeGetRevisionRequest
 @see AWSdataexchangeGetRevisionResponse
 */
- (void)getRevision:(AWSdataexchangeGetRevisionRequest *)request completionHandler:(void (^ _Nullable)(AWSdataexchangeGetRevisionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation lists a data set's revisions sorted by CreatedAt in descending order.</p>
 
 @param request A container for the necessary parameters to execute the ListDataSetRevisions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdataexchangeListDataSetRevisionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`.
 
 @see AWSdataexchangeListDataSetRevisionsRequest
 @see AWSdataexchangeListDataSetRevisionsResponse
 */
- (AWSTask<AWSdataexchangeListDataSetRevisionsResponse *> *)listDataSetRevisions:(AWSdataexchangeListDataSetRevisionsRequest *)request;

/**
 <p>This operation lists a data set's revisions sorted by CreatedAt in descending order.</p>
 
 @param request A container for the necessary parameters to execute the ListDataSetRevisions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`.
 
 @see AWSdataexchangeListDataSetRevisionsRequest
 @see AWSdataexchangeListDataSetRevisionsResponse
 */
- (void)listDataSetRevisions:(AWSdataexchangeListDataSetRevisionsRequest *)request completionHandler:(void (^ _Nullable)(AWSdataexchangeListDataSetRevisionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation lists your data sets. When listing by origin OWNED, results are sorted by CreatedAt in descending order. When listing by origin ENTITLED, there is no order and the maxResults parameter is ignored.</p>
 
 @param request A container for the necessary parameters to execute the ListDataSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdataexchangeListDataSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`.
 
 @see AWSdataexchangeListDataSetsRequest
 @see AWSdataexchangeListDataSetsResponse
 */
- (AWSTask<AWSdataexchangeListDataSetsResponse *> *)listDataSets:(AWSdataexchangeListDataSetsRequest *)request;

/**
 <p>This operation lists your data sets. When listing by origin OWNED, results are sorted by CreatedAt in descending order. When listing by origin ENTITLED, there is no order and the maxResults parameter is ignored.</p>
 
 @param request A container for the necessary parameters to execute the ListDataSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`.
 
 @see AWSdataexchangeListDataSetsRequest
 @see AWSdataexchangeListDataSetsResponse
 */
- (void)listDataSets:(AWSdataexchangeListDataSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSdataexchangeListDataSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation lists your jobs sorted by CreatedAt in descending order.</p>
 
 @param request A container for the necessary parameters to execute the ListJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdataexchangeListJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`.
 
 @see AWSdataexchangeListJobsRequest
 @see AWSdataexchangeListJobsResponse
 */
- (AWSTask<AWSdataexchangeListJobsResponse *> *)listJobs:(AWSdataexchangeListJobsRequest *)request;

/**
 <p>This operation lists your jobs sorted by CreatedAt in descending order.</p>
 
 @param request A container for the necessary parameters to execute the ListJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`.
 
 @see AWSdataexchangeListJobsRequest
 @see AWSdataexchangeListJobsResponse
 */
- (void)listJobs:(AWSdataexchangeListJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSdataexchangeListJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation lists a revision's assets sorted alphabetically in descending order.</p>
 
 @param request A container for the necessary parameters to execute the ListRevisionAssets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdataexchangeListRevisionAssetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`.
 
 @see AWSdataexchangeListRevisionAssetsRequest
 @see AWSdataexchangeListRevisionAssetsResponse
 */
- (AWSTask<AWSdataexchangeListRevisionAssetsResponse *> *)listRevisionAssets:(AWSdataexchangeListRevisionAssetsRequest *)request;

/**
 <p>This operation lists a revision's assets sorted alphabetically in descending order.</p>
 
 @param request A container for the necessary parameters to execute the ListRevisionAssets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`.
 
 @see AWSdataexchangeListRevisionAssetsRequest
 @see AWSdataexchangeListRevisionAssetsResponse
 */
- (void)listRevisionAssets:(AWSdataexchangeListRevisionAssetsRequest *)request completionHandler:(void (^ _Nullable)(AWSdataexchangeListRevisionAssetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation lists the tags on the resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdataexchangeListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: .
 
 @see AWSdataexchangeListTagsForResourceRequest
 @see AWSdataexchangeListTagsForResourceResponse
 */
- (AWSTask<AWSdataexchangeListTagsForResourceResponse *> *)listTagsForResource:(AWSdataexchangeListTagsForResourceRequest *)request;

/**
 <p>This operation lists the tags on the resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: .
 
 @see AWSdataexchangeListTagsForResourceRequest
 @see AWSdataexchangeListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSdataexchangeListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSdataexchangeListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation starts a job.</p>
 
 @param request A container for the necessary parameters to execute the StartJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdataexchangeStartJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`, `AWSdataexchangeErrorAccessDenied`, `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorConflict`.
 
 @see AWSdataexchangeStartJobRequest
 @see AWSdataexchangeStartJobResponse
 */
- (AWSTask<AWSdataexchangeStartJobResponse *> *)startJob:(AWSdataexchangeStartJobRequest *)request;

/**
 <p>This operation starts a job.</p>
 
 @param request A container for the necessary parameters to execute the StartJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`, `AWSdataexchangeErrorAccessDenied`, `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorConflict`.
 
 @see AWSdataexchangeStartJobRequest
 @see AWSdataexchangeStartJobResponse
 */
- (void)startJob:(AWSdataexchangeStartJobRequest *)request completionHandler:(void (^ _Nullable)(AWSdataexchangeStartJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation tags a resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: .
 
 @see AWSdataexchangeTagResourceRequest
 */
- (AWSTask *)tagResource:(AWSdataexchangeTagResourceRequest *)request;

/**
 <p>This operation tags a resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: .
 
 @see AWSdataexchangeTagResourceRequest
 */
- (void)tagResource:(AWSdataexchangeTagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This operation removes one or more tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: .
 
 @see AWSdataexchangeUntagResourceRequest
 */
- (AWSTask *)untagResource:(AWSdataexchangeUntagResourceRequest *)request;

/**
 <p>This operation removes one or more tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: .
 
 @see AWSdataexchangeUntagResourceRequest
 */
- (void)untagResource:(AWSdataexchangeUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This operation updates an asset.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAsset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdataexchangeUpdateAssetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`, `AWSdataexchangeErrorAccessDenied`, `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorConflict`.
 
 @see AWSdataexchangeUpdateAssetRequest
 @see AWSdataexchangeUpdateAssetResponse
 */
- (AWSTask<AWSdataexchangeUpdateAssetResponse *> *)updateAsset:(AWSdataexchangeUpdateAssetRequest *)request;

/**
 <p>This operation updates an asset.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAsset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`, `AWSdataexchangeErrorAccessDenied`, `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorConflict`.
 
 @see AWSdataexchangeUpdateAssetRequest
 @see AWSdataexchangeUpdateAssetResponse
 */
- (void)updateAsset:(AWSdataexchangeUpdateAssetRequest *)request completionHandler:(void (^ _Nullable)(AWSdataexchangeUpdateAssetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation updates a data set.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDataSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdataexchangeUpdateDataSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`, `AWSdataexchangeErrorAccessDenied`.
 
 @see AWSdataexchangeUpdateDataSetRequest
 @see AWSdataexchangeUpdateDataSetResponse
 */
- (AWSTask<AWSdataexchangeUpdateDataSetResponse *> *)updateDataSet:(AWSdataexchangeUpdateDataSetRequest *)request;

/**
 <p>This operation updates a data set.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDataSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`, `AWSdataexchangeErrorAccessDenied`.
 
 @see AWSdataexchangeUpdateDataSetRequest
 @see AWSdataexchangeUpdateDataSetResponse
 */
- (void)updateDataSet:(AWSdataexchangeUpdateDataSetRequest *)request completionHandler:(void (^ _Nullable)(AWSdataexchangeUpdateDataSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation updates a revision.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRevision service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdataexchangeUpdateRevisionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`, `AWSdataexchangeErrorAccessDenied`, `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorConflict`.
 
 @see AWSdataexchangeUpdateRevisionRequest
 @see AWSdataexchangeUpdateRevisionResponse
 */
- (AWSTask<AWSdataexchangeUpdateRevisionResponse *> *)updateRevision:(AWSdataexchangeUpdateRevisionRequest *)request;

/**
 <p>This operation updates a revision.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRevision service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdataexchangeErrorDomain` domain and the following error code: `AWSdataexchangeErrorValidation`, `AWSdataexchangeErrorInternalServer`, `AWSdataexchangeErrorAccessDenied`, `AWSdataexchangeErrorResourceNotFound`, `AWSdataexchangeErrorThrottling`, `AWSdataexchangeErrorConflict`.
 
 @see AWSdataexchangeUpdateRevisionRequest
 @see AWSdataexchangeUpdateRevisionResponse
 */
- (void)updateRevision:(AWSdataexchangeUpdateRevisionRequest *)request completionHandler:(void (^ _Nullable)(AWSdataexchangeUpdateRevisionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
