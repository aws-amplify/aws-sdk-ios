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
#import "AWSmediapackage-vodModel.h"
#import "AWSmediapackage-vodResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSmediapackage-vod
FOUNDATION_EXPORT NSString *const AWSmediapackage-vodSDKVersion;

/**
 AWS Elemental MediaPackage VOD
 */
@interface AWSmediapackage-vod : AWSService

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

     let mediapackage-vod = AWSmediapackage-vod.default()

 *Objective-C*

     AWSmediapackage-vod *mediapackage-vod = [AWSmediapackage-vod defaultmediapackage-vod];

 @return The default service client.
 */
+ (instancetype)defaultmediapackage-vod;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSmediapackage-vod.register(with: configuration!, forKey: "USWest2mediapackage-vod")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:@"USWest2mediapackage-vod"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let mediapackage-vod = AWSmediapackage-vod(forKey: "USWest2mediapackage-vod")

 *Objective-C*

     AWSmediapackage-vod *mediapackage-vod = [AWSmediapackage-vod mediapackage-vodForKey:@"USWest2mediapackage-vod"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registermediapackage-vodWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registermediapackage-vodWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSmediapackage-vod.register(with: configuration!, forKey: "USWest2mediapackage-vod")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:@"USWest2mediapackage-vod"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let mediapackage-vod = AWSmediapackage-vod(forKey: "USWest2mediapackage-vod")

 *Objective-C*

     AWSmediapackage-vod *mediapackage-vod = [AWSmediapackage-vod mediapackage-vodForKey:@"USWest2mediapackage-vod"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)mediapackage-vodForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removemediapackage-vodForKey:(NSString *)key;

/**
 Creates a new MediaPackage VOD Asset resource.
 
 @param request A container for the necessary parameters to execute the CreateAsset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediapackage-vodCreateAssetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: `AWSmediapackage-vodErrorUnprocessableEntity`, `AWSmediapackage-vodErrorInternalServerError`, `AWSmediapackage-vodErrorForbidden`, `AWSmediapackage-vodErrorNotFound`, `AWSmediapackage-vodErrorServiceUnavailable`, `AWSmediapackage-vodErrorTooManyRequests`.
 
 @see AWSmediapackage-vodCreateAssetRequest
 @see AWSmediapackage-vodCreateAssetResponse
 */
- (AWSTask<AWSmediapackage-vodCreateAssetResponse *> *)createAsset:(AWSmediapackage-vodCreateAssetRequest *)request;

/**
 Creates a new MediaPackage VOD Asset resource.
 
 @param request A container for the necessary parameters to execute the CreateAsset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: `AWSmediapackage-vodErrorUnprocessableEntity`, `AWSmediapackage-vodErrorInternalServerError`, `AWSmediapackage-vodErrorForbidden`, `AWSmediapackage-vodErrorNotFound`, `AWSmediapackage-vodErrorServiceUnavailable`, `AWSmediapackage-vodErrorTooManyRequests`.
 
 @see AWSmediapackage-vodCreateAssetRequest
 @see AWSmediapackage-vodCreateAssetResponse
 */
- (void)createAsset:(AWSmediapackage-vodCreateAssetRequest *)request completionHandler:(void (^ _Nullable)(AWSmediapackage-vodCreateAssetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Creates a new MediaPackage VOD PackagingConfiguration resource.
 
 @param request A container for the necessary parameters to execute the CreatePackagingConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediapackage-vodCreatePackagingConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: `AWSmediapackage-vodErrorUnprocessableEntity`, `AWSmediapackage-vodErrorInternalServerError`, `AWSmediapackage-vodErrorForbidden`, `AWSmediapackage-vodErrorNotFound`, `AWSmediapackage-vodErrorServiceUnavailable`, `AWSmediapackage-vodErrorTooManyRequests`.
 
 @see AWSmediapackage-vodCreatePackagingConfigurationRequest
 @see AWSmediapackage-vodCreatePackagingConfigurationResponse
 */
- (AWSTask<AWSmediapackage-vodCreatePackagingConfigurationResponse *> *)createPackagingConfiguration:(AWSmediapackage-vodCreatePackagingConfigurationRequest *)request;

/**
 Creates a new MediaPackage VOD PackagingConfiguration resource.
 
 @param request A container for the necessary parameters to execute the CreatePackagingConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: `AWSmediapackage-vodErrorUnprocessableEntity`, `AWSmediapackage-vodErrorInternalServerError`, `AWSmediapackage-vodErrorForbidden`, `AWSmediapackage-vodErrorNotFound`, `AWSmediapackage-vodErrorServiceUnavailable`, `AWSmediapackage-vodErrorTooManyRequests`.
 
 @see AWSmediapackage-vodCreatePackagingConfigurationRequest
 @see AWSmediapackage-vodCreatePackagingConfigurationResponse
 */
- (void)createPackagingConfiguration:(AWSmediapackage-vodCreatePackagingConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSmediapackage-vodCreatePackagingConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Creates a new MediaPackage VOD PackagingGroup resource.
 
 @param request A container for the necessary parameters to execute the CreatePackagingGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediapackage-vodCreatePackagingGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: `AWSmediapackage-vodErrorUnprocessableEntity`, `AWSmediapackage-vodErrorInternalServerError`, `AWSmediapackage-vodErrorForbidden`, `AWSmediapackage-vodErrorNotFound`, `AWSmediapackage-vodErrorServiceUnavailable`, `AWSmediapackage-vodErrorTooManyRequests`.
 
 @see AWSmediapackage-vodCreatePackagingGroupRequest
 @see AWSmediapackage-vodCreatePackagingGroupResponse
 */
- (AWSTask<AWSmediapackage-vodCreatePackagingGroupResponse *> *)createPackagingGroup:(AWSmediapackage-vodCreatePackagingGroupRequest *)request;

/**
 Creates a new MediaPackage VOD PackagingGroup resource.
 
 @param request A container for the necessary parameters to execute the CreatePackagingGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: `AWSmediapackage-vodErrorUnprocessableEntity`, `AWSmediapackage-vodErrorInternalServerError`, `AWSmediapackage-vodErrorForbidden`, `AWSmediapackage-vodErrorNotFound`, `AWSmediapackage-vodErrorServiceUnavailable`, `AWSmediapackage-vodErrorTooManyRequests`.
 
 @see AWSmediapackage-vodCreatePackagingGroupRequest
 @see AWSmediapackage-vodCreatePackagingGroupResponse
 */
- (void)createPackagingGroup:(AWSmediapackage-vodCreatePackagingGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSmediapackage-vodCreatePackagingGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes an existing MediaPackage VOD Asset resource.
 
 @param request A container for the necessary parameters to execute the DeleteAsset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediapackage-vodDeleteAssetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: `AWSmediapackage-vodErrorUnprocessableEntity`, `AWSmediapackage-vodErrorInternalServerError`, `AWSmediapackage-vodErrorForbidden`, `AWSmediapackage-vodErrorNotFound`, `AWSmediapackage-vodErrorServiceUnavailable`, `AWSmediapackage-vodErrorTooManyRequests`.
 
 @see AWSmediapackage-vodDeleteAssetRequest
 @see AWSmediapackage-vodDeleteAssetResponse
 */
- (AWSTask<AWSmediapackage-vodDeleteAssetResponse *> *)deleteAsset:(AWSmediapackage-vodDeleteAssetRequest *)request;

/**
 Deletes an existing MediaPackage VOD Asset resource.
 
 @param request A container for the necessary parameters to execute the DeleteAsset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: `AWSmediapackage-vodErrorUnprocessableEntity`, `AWSmediapackage-vodErrorInternalServerError`, `AWSmediapackage-vodErrorForbidden`, `AWSmediapackage-vodErrorNotFound`, `AWSmediapackage-vodErrorServiceUnavailable`, `AWSmediapackage-vodErrorTooManyRequests`.
 
 @see AWSmediapackage-vodDeleteAssetRequest
 @see AWSmediapackage-vodDeleteAssetResponse
 */
- (void)deleteAsset:(AWSmediapackage-vodDeleteAssetRequest *)request completionHandler:(void (^ _Nullable)(AWSmediapackage-vodDeleteAssetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes a MediaPackage VOD PackagingConfiguration resource.
 
 @param request A container for the necessary parameters to execute the DeletePackagingConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediapackage-vodDeletePackagingConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: `AWSmediapackage-vodErrorUnprocessableEntity`, `AWSmediapackage-vodErrorInternalServerError`, `AWSmediapackage-vodErrorForbidden`, `AWSmediapackage-vodErrorNotFound`, `AWSmediapackage-vodErrorServiceUnavailable`, `AWSmediapackage-vodErrorTooManyRequests`.
 
 @see AWSmediapackage-vodDeletePackagingConfigurationRequest
 @see AWSmediapackage-vodDeletePackagingConfigurationResponse
 */
- (AWSTask<AWSmediapackage-vodDeletePackagingConfigurationResponse *> *)deletePackagingConfiguration:(AWSmediapackage-vodDeletePackagingConfigurationRequest *)request;

/**
 Deletes a MediaPackage VOD PackagingConfiguration resource.
 
 @param request A container for the necessary parameters to execute the DeletePackagingConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: `AWSmediapackage-vodErrorUnprocessableEntity`, `AWSmediapackage-vodErrorInternalServerError`, `AWSmediapackage-vodErrorForbidden`, `AWSmediapackage-vodErrorNotFound`, `AWSmediapackage-vodErrorServiceUnavailable`, `AWSmediapackage-vodErrorTooManyRequests`.
 
 @see AWSmediapackage-vodDeletePackagingConfigurationRequest
 @see AWSmediapackage-vodDeletePackagingConfigurationResponse
 */
- (void)deletePackagingConfiguration:(AWSmediapackage-vodDeletePackagingConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSmediapackage-vodDeletePackagingConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes a MediaPackage VOD PackagingGroup resource.
 
 @param request A container for the necessary parameters to execute the DeletePackagingGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediapackage-vodDeletePackagingGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: `AWSmediapackage-vodErrorUnprocessableEntity`, `AWSmediapackage-vodErrorInternalServerError`, `AWSmediapackage-vodErrorForbidden`, `AWSmediapackage-vodErrorNotFound`, `AWSmediapackage-vodErrorServiceUnavailable`, `AWSmediapackage-vodErrorTooManyRequests`.
 
 @see AWSmediapackage-vodDeletePackagingGroupRequest
 @see AWSmediapackage-vodDeletePackagingGroupResponse
 */
- (AWSTask<AWSmediapackage-vodDeletePackagingGroupResponse *> *)deletePackagingGroup:(AWSmediapackage-vodDeletePackagingGroupRequest *)request;

/**
 Deletes a MediaPackage VOD PackagingGroup resource.
 
 @param request A container for the necessary parameters to execute the DeletePackagingGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: `AWSmediapackage-vodErrorUnprocessableEntity`, `AWSmediapackage-vodErrorInternalServerError`, `AWSmediapackage-vodErrorForbidden`, `AWSmediapackage-vodErrorNotFound`, `AWSmediapackage-vodErrorServiceUnavailable`, `AWSmediapackage-vodErrorTooManyRequests`.
 
 @see AWSmediapackage-vodDeletePackagingGroupRequest
 @see AWSmediapackage-vodDeletePackagingGroupResponse
 */
- (void)deletePackagingGroup:(AWSmediapackage-vodDeletePackagingGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSmediapackage-vodDeletePackagingGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns a description of a MediaPackage VOD Asset resource.
 
 @param request A container for the necessary parameters to execute the DescribeAsset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediapackage-vodDescribeAssetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: `AWSmediapackage-vodErrorUnprocessableEntity`, `AWSmediapackage-vodErrorInternalServerError`, `AWSmediapackage-vodErrorForbidden`, `AWSmediapackage-vodErrorNotFound`, `AWSmediapackage-vodErrorServiceUnavailable`, `AWSmediapackage-vodErrorTooManyRequests`.
 
 @see AWSmediapackage-vodDescribeAssetRequest
 @see AWSmediapackage-vodDescribeAssetResponse
 */
- (AWSTask<AWSmediapackage-vodDescribeAssetResponse *> *)describeAsset:(AWSmediapackage-vodDescribeAssetRequest *)request;

/**
 Returns a description of a MediaPackage VOD Asset resource.
 
 @param request A container for the necessary parameters to execute the DescribeAsset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: `AWSmediapackage-vodErrorUnprocessableEntity`, `AWSmediapackage-vodErrorInternalServerError`, `AWSmediapackage-vodErrorForbidden`, `AWSmediapackage-vodErrorNotFound`, `AWSmediapackage-vodErrorServiceUnavailable`, `AWSmediapackage-vodErrorTooManyRequests`.
 
 @see AWSmediapackage-vodDescribeAssetRequest
 @see AWSmediapackage-vodDescribeAssetResponse
 */
- (void)describeAsset:(AWSmediapackage-vodDescribeAssetRequest *)request completionHandler:(void (^ _Nullable)(AWSmediapackage-vodDescribeAssetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns a description of a MediaPackage VOD PackagingConfiguration resource.
 
 @param request A container for the necessary parameters to execute the DescribePackagingConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediapackage-vodDescribePackagingConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: `AWSmediapackage-vodErrorUnprocessableEntity`, `AWSmediapackage-vodErrorInternalServerError`, `AWSmediapackage-vodErrorForbidden`, `AWSmediapackage-vodErrorNotFound`, `AWSmediapackage-vodErrorServiceUnavailable`, `AWSmediapackage-vodErrorTooManyRequests`.
 
 @see AWSmediapackage-vodDescribePackagingConfigurationRequest
 @see AWSmediapackage-vodDescribePackagingConfigurationResponse
 */
- (AWSTask<AWSmediapackage-vodDescribePackagingConfigurationResponse *> *)describePackagingConfiguration:(AWSmediapackage-vodDescribePackagingConfigurationRequest *)request;

/**
 Returns a description of a MediaPackage VOD PackagingConfiguration resource.
 
 @param request A container for the necessary parameters to execute the DescribePackagingConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: `AWSmediapackage-vodErrorUnprocessableEntity`, `AWSmediapackage-vodErrorInternalServerError`, `AWSmediapackage-vodErrorForbidden`, `AWSmediapackage-vodErrorNotFound`, `AWSmediapackage-vodErrorServiceUnavailable`, `AWSmediapackage-vodErrorTooManyRequests`.
 
 @see AWSmediapackage-vodDescribePackagingConfigurationRequest
 @see AWSmediapackage-vodDescribePackagingConfigurationResponse
 */
- (void)describePackagingConfiguration:(AWSmediapackage-vodDescribePackagingConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSmediapackage-vodDescribePackagingConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns a description of a MediaPackage VOD PackagingGroup resource.
 
 @param request A container for the necessary parameters to execute the DescribePackagingGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediapackage-vodDescribePackagingGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: `AWSmediapackage-vodErrorUnprocessableEntity`, `AWSmediapackage-vodErrorInternalServerError`, `AWSmediapackage-vodErrorForbidden`, `AWSmediapackage-vodErrorNotFound`, `AWSmediapackage-vodErrorServiceUnavailable`, `AWSmediapackage-vodErrorTooManyRequests`.
 
 @see AWSmediapackage-vodDescribePackagingGroupRequest
 @see AWSmediapackage-vodDescribePackagingGroupResponse
 */
- (AWSTask<AWSmediapackage-vodDescribePackagingGroupResponse *> *)describePackagingGroup:(AWSmediapackage-vodDescribePackagingGroupRequest *)request;

/**
 Returns a description of a MediaPackage VOD PackagingGroup resource.
 
 @param request A container for the necessary parameters to execute the DescribePackagingGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: `AWSmediapackage-vodErrorUnprocessableEntity`, `AWSmediapackage-vodErrorInternalServerError`, `AWSmediapackage-vodErrorForbidden`, `AWSmediapackage-vodErrorNotFound`, `AWSmediapackage-vodErrorServiceUnavailable`, `AWSmediapackage-vodErrorTooManyRequests`.
 
 @see AWSmediapackage-vodDescribePackagingGroupRequest
 @see AWSmediapackage-vodDescribePackagingGroupResponse
 */
- (void)describePackagingGroup:(AWSmediapackage-vodDescribePackagingGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSmediapackage-vodDescribePackagingGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns a collection of MediaPackage VOD Asset resources.
 
 @param request A container for the necessary parameters to execute the ListAssets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediapackage-vodListAssetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: `AWSmediapackage-vodErrorUnprocessableEntity`, `AWSmediapackage-vodErrorInternalServerError`, `AWSmediapackage-vodErrorForbidden`, `AWSmediapackage-vodErrorNotFound`, `AWSmediapackage-vodErrorServiceUnavailable`, `AWSmediapackage-vodErrorTooManyRequests`.
 
 @see AWSmediapackage-vodListAssetsRequest
 @see AWSmediapackage-vodListAssetsResponse
 */
- (AWSTask<AWSmediapackage-vodListAssetsResponse *> *)listAssets:(AWSmediapackage-vodListAssetsRequest *)request;

/**
 Returns a collection of MediaPackage VOD Asset resources.
 
 @param request A container for the necessary parameters to execute the ListAssets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: `AWSmediapackage-vodErrorUnprocessableEntity`, `AWSmediapackage-vodErrorInternalServerError`, `AWSmediapackage-vodErrorForbidden`, `AWSmediapackage-vodErrorNotFound`, `AWSmediapackage-vodErrorServiceUnavailable`, `AWSmediapackage-vodErrorTooManyRequests`.
 
 @see AWSmediapackage-vodListAssetsRequest
 @see AWSmediapackage-vodListAssetsResponse
 */
- (void)listAssets:(AWSmediapackage-vodListAssetsRequest *)request completionHandler:(void (^ _Nullable)(AWSmediapackage-vodListAssetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns a collection of MediaPackage VOD PackagingConfiguration resources.
 
 @param request A container for the necessary parameters to execute the ListPackagingConfigurations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediapackage-vodListPackagingConfigurationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: `AWSmediapackage-vodErrorUnprocessableEntity`, `AWSmediapackage-vodErrorInternalServerError`, `AWSmediapackage-vodErrorForbidden`, `AWSmediapackage-vodErrorNotFound`, `AWSmediapackage-vodErrorServiceUnavailable`, `AWSmediapackage-vodErrorTooManyRequests`.
 
 @see AWSmediapackage-vodListPackagingConfigurationsRequest
 @see AWSmediapackage-vodListPackagingConfigurationsResponse
 */
- (AWSTask<AWSmediapackage-vodListPackagingConfigurationsResponse *> *)listPackagingConfigurations:(AWSmediapackage-vodListPackagingConfigurationsRequest *)request;

/**
 Returns a collection of MediaPackage VOD PackagingConfiguration resources.
 
 @param request A container for the necessary parameters to execute the ListPackagingConfigurations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: `AWSmediapackage-vodErrorUnprocessableEntity`, `AWSmediapackage-vodErrorInternalServerError`, `AWSmediapackage-vodErrorForbidden`, `AWSmediapackage-vodErrorNotFound`, `AWSmediapackage-vodErrorServiceUnavailable`, `AWSmediapackage-vodErrorTooManyRequests`.
 
 @see AWSmediapackage-vodListPackagingConfigurationsRequest
 @see AWSmediapackage-vodListPackagingConfigurationsResponse
 */
- (void)listPackagingConfigurations:(AWSmediapackage-vodListPackagingConfigurationsRequest *)request completionHandler:(void (^ _Nullable)(AWSmediapackage-vodListPackagingConfigurationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns a collection of MediaPackage VOD PackagingGroup resources.
 
 @param request A container for the necessary parameters to execute the ListPackagingGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediapackage-vodListPackagingGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: `AWSmediapackage-vodErrorUnprocessableEntity`, `AWSmediapackage-vodErrorInternalServerError`, `AWSmediapackage-vodErrorForbidden`, `AWSmediapackage-vodErrorNotFound`, `AWSmediapackage-vodErrorServiceUnavailable`, `AWSmediapackage-vodErrorTooManyRequests`.
 
 @see AWSmediapackage-vodListPackagingGroupsRequest
 @see AWSmediapackage-vodListPackagingGroupsResponse
 */
- (AWSTask<AWSmediapackage-vodListPackagingGroupsResponse *> *)listPackagingGroups:(AWSmediapackage-vodListPackagingGroupsRequest *)request;

/**
 Returns a collection of MediaPackage VOD PackagingGroup resources.
 
 @param request A container for the necessary parameters to execute the ListPackagingGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: `AWSmediapackage-vodErrorUnprocessableEntity`, `AWSmediapackage-vodErrorInternalServerError`, `AWSmediapackage-vodErrorForbidden`, `AWSmediapackage-vodErrorNotFound`, `AWSmediapackage-vodErrorServiceUnavailable`, `AWSmediapackage-vodErrorTooManyRequests`.
 
 @see AWSmediapackage-vodListPackagingGroupsRequest
 @see AWSmediapackage-vodListPackagingGroupsResponse
 */
- (void)listPackagingGroups:(AWSmediapackage-vodListPackagingGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSmediapackage-vodListPackagingGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 List tags for a given MediaPackage VOD resource
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediapackage-vodListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: .
 
 @see AWSmediapackage-vodListTagsForResourceRequest
 @see AWSmediapackage-vodListTagsForResourceResponse
 */
- (AWSTask<AWSmediapackage-vodListTagsForResourceResponse *> *)listTagsForResource:(AWSmediapackage-vodListTagsForResourceRequest *)request;

/**
 List tags for a given MediaPackage VOD resource
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: .
 
 @see AWSmediapackage-vodListTagsForResourceRequest
 @see AWSmediapackage-vodListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSmediapackage-vodListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSmediapackage-vodListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Set tags for a given MediaPackage VOD resource
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: .
 
 @see AWSmediapackage-vodTagResourceRequest
 */
- (AWSTask *)tagResource:(AWSmediapackage-vodTagResourceRequest *)request;

/**
 Set tags for a given MediaPackage VOD resource
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: .
 
 @see AWSmediapackage-vodTagResourceRequest
 */
- (void)tagResource:(AWSmediapackage-vodTagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Delete tags for a given MediaPackage VOD resource
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: .
 
 @see AWSmediapackage-vodUntagResourceRequest
 */
- (AWSTask *)untagResource:(AWSmediapackage-vodUntagResourceRequest *)request;

/**
 Delete tags for a given MediaPackage VOD resource
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediapackage-vodErrorDomain` domain and the following error code: .
 
 @see AWSmediapackage-vodUntagResourceRequest
 */
- (void)untagResource:(AWSmediapackage-vodUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
