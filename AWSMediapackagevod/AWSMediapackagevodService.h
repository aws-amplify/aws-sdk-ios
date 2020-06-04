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
#import "AWSMediapackagevodModel.h"
#import "AWSMediapackagevodResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSMediapackagevod
FOUNDATION_EXPORT NSString *const AWSMediapackagevodSDKVersion;

/**
 AWS Elemental MediaPackage VOD
 */
@interface AWSMediapackagevod : AWSService

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

     let Mediapackagevod = AWSMediapackagevod.default()

 *Objective-C*

     AWSMediapackagevod *Mediapackagevod = [AWSMediapackagevod defaultMediapackagevod];

 @return The default service client.
 */
+ (instancetype)defaultMediapackagevod;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSMediapackagevod.register(with: configuration!, forKey: "USWest2Mediapackagevod")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:@"USWest2Mediapackagevod"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Mediapackagevod = AWSMediapackagevod(forKey: "USWest2Mediapackagevod")

 *Objective-C*

     AWSMediapackagevod *Mediapackagevod = [AWSMediapackagevod MediapackagevodForKey:@"USWest2Mediapackagevod"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerMediapackagevodWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerMediapackagevodWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSMediapackagevod.register(with: configuration!, forKey: "USWest2Mediapackagevod")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:@"USWest2Mediapackagevod"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Mediapackagevod = AWSMediapackagevod(forKey: "USWest2Mediapackagevod")

 *Objective-C*

     AWSMediapackagevod *Mediapackagevod = [AWSMediapackagevod MediapackagevodForKey:@"USWest2Mediapackagevod"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)MediapackagevodForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeMediapackagevodForKey:(NSString *)key;

/**
 Creates a new MediaPackage VOD Asset resource.
 
 @param request A container for the necessary parameters to execute the CreateAsset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediapackagevodCreateAssetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodCreateAssetRequest
 @see AWSMediapackagevodCreateAssetResponse
 */
- (AWSTask<AWSMediapackagevodCreateAssetResponse *> *)createAsset:(AWSMediapackagevodCreateAssetRequest *)request;

/**
 Creates a new MediaPackage VOD Asset resource.
 
 @param request A container for the necessary parameters to execute the CreateAsset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodCreateAssetRequest
 @see AWSMediapackagevodCreateAssetResponse
 */
- (void)createAsset:(AWSMediapackagevodCreateAssetRequest *)request completionHandler:(void (^ _Nullable)(AWSMediapackagevodCreateAssetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Creates a new MediaPackage VOD PackagingConfiguration resource.
 
 @param request A container for the necessary parameters to execute the CreatePackagingConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediapackagevodCreatePackagingConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodCreatePackagingConfigurationRequest
 @see AWSMediapackagevodCreatePackagingConfigurationResponse
 */
- (AWSTask<AWSMediapackagevodCreatePackagingConfigurationResponse *> *)createPackagingConfiguration:(AWSMediapackagevodCreatePackagingConfigurationRequest *)request;

/**
 Creates a new MediaPackage VOD PackagingConfiguration resource.
 
 @param request A container for the necessary parameters to execute the CreatePackagingConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodCreatePackagingConfigurationRequest
 @see AWSMediapackagevodCreatePackagingConfigurationResponse
 */
- (void)createPackagingConfiguration:(AWSMediapackagevodCreatePackagingConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSMediapackagevodCreatePackagingConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Creates a new MediaPackage VOD PackagingGroup resource.
 
 @param request A container for the necessary parameters to execute the CreatePackagingGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediapackagevodCreatePackagingGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodCreatePackagingGroupRequest
 @see AWSMediapackagevodCreatePackagingGroupResponse
 */
- (AWSTask<AWSMediapackagevodCreatePackagingGroupResponse *> *)createPackagingGroup:(AWSMediapackagevodCreatePackagingGroupRequest *)request;

/**
 Creates a new MediaPackage VOD PackagingGroup resource.
 
 @param request A container for the necessary parameters to execute the CreatePackagingGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodCreatePackagingGroupRequest
 @see AWSMediapackagevodCreatePackagingGroupResponse
 */
- (void)createPackagingGroup:(AWSMediapackagevodCreatePackagingGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSMediapackagevodCreatePackagingGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes an existing MediaPackage VOD Asset resource.
 
 @param request A container for the necessary parameters to execute the DeleteAsset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediapackagevodDeleteAssetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodDeleteAssetRequest
 @see AWSMediapackagevodDeleteAssetResponse
 */
- (AWSTask<AWSMediapackagevodDeleteAssetResponse *> *)deleteAsset:(AWSMediapackagevodDeleteAssetRequest *)request;

/**
 Deletes an existing MediaPackage VOD Asset resource.
 
 @param request A container for the necessary parameters to execute the DeleteAsset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodDeleteAssetRequest
 @see AWSMediapackagevodDeleteAssetResponse
 */
- (void)deleteAsset:(AWSMediapackagevodDeleteAssetRequest *)request completionHandler:(void (^ _Nullable)(AWSMediapackagevodDeleteAssetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes a MediaPackage VOD PackagingConfiguration resource.
 
 @param request A container for the necessary parameters to execute the DeletePackagingConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediapackagevodDeletePackagingConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodDeletePackagingConfigurationRequest
 @see AWSMediapackagevodDeletePackagingConfigurationResponse
 */
- (AWSTask<AWSMediapackagevodDeletePackagingConfigurationResponse *> *)deletePackagingConfiguration:(AWSMediapackagevodDeletePackagingConfigurationRequest *)request;

/**
 Deletes a MediaPackage VOD PackagingConfiguration resource.
 
 @param request A container for the necessary parameters to execute the DeletePackagingConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodDeletePackagingConfigurationRequest
 @see AWSMediapackagevodDeletePackagingConfigurationResponse
 */
- (void)deletePackagingConfiguration:(AWSMediapackagevodDeletePackagingConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSMediapackagevodDeletePackagingConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes a MediaPackage VOD PackagingGroup resource.
 
 @param request A container for the necessary parameters to execute the DeletePackagingGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediapackagevodDeletePackagingGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodDeletePackagingGroupRequest
 @see AWSMediapackagevodDeletePackagingGroupResponse
 */
- (AWSTask<AWSMediapackagevodDeletePackagingGroupResponse *> *)deletePackagingGroup:(AWSMediapackagevodDeletePackagingGroupRequest *)request;

/**
 Deletes a MediaPackage VOD PackagingGroup resource.
 
 @param request A container for the necessary parameters to execute the DeletePackagingGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodDeletePackagingGroupRequest
 @see AWSMediapackagevodDeletePackagingGroupResponse
 */
- (void)deletePackagingGroup:(AWSMediapackagevodDeletePackagingGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSMediapackagevodDeletePackagingGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns a description of a MediaPackage VOD Asset resource.
 
 @param request A container for the necessary parameters to execute the DescribeAsset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediapackagevodDescribeAssetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodDescribeAssetRequest
 @see AWSMediapackagevodDescribeAssetResponse
 */
- (AWSTask<AWSMediapackagevodDescribeAssetResponse *> *)describeAsset:(AWSMediapackagevodDescribeAssetRequest *)request;

/**
 Returns a description of a MediaPackage VOD Asset resource.
 
 @param request A container for the necessary parameters to execute the DescribeAsset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodDescribeAssetRequest
 @see AWSMediapackagevodDescribeAssetResponse
 */
- (void)describeAsset:(AWSMediapackagevodDescribeAssetRequest *)request completionHandler:(void (^ _Nullable)(AWSMediapackagevodDescribeAssetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns a description of a MediaPackage VOD PackagingConfiguration resource.
 
 @param request A container for the necessary parameters to execute the DescribePackagingConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediapackagevodDescribePackagingConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodDescribePackagingConfigurationRequest
 @see AWSMediapackagevodDescribePackagingConfigurationResponse
 */
- (AWSTask<AWSMediapackagevodDescribePackagingConfigurationResponse *> *)describePackagingConfiguration:(AWSMediapackagevodDescribePackagingConfigurationRequest *)request;

/**
 Returns a description of a MediaPackage VOD PackagingConfiguration resource.
 
 @param request A container for the necessary parameters to execute the DescribePackagingConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodDescribePackagingConfigurationRequest
 @see AWSMediapackagevodDescribePackagingConfigurationResponse
 */
- (void)describePackagingConfiguration:(AWSMediapackagevodDescribePackagingConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSMediapackagevodDescribePackagingConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns a description of a MediaPackage VOD PackagingGroup resource.
 
 @param request A container for the necessary parameters to execute the DescribePackagingGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediapackagevodDescribePackagingGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodDescribePackagingGroupRequest
 @see AWSMediapackagevodDescribePackagingGroupResponse
 */
- (AWSTask<AWSMediapackagevodDescribePackagingGroupResponse *> *)describePackagingGroup:(AWSMediapackagevodDescribePackagingGroupRequest *)request;

/**
 Returns a description of a MediaPackage VOD PackagingGroup resource.
 
 @param request A container for the necessary parameters to execute the DescribePackagingGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodDescribePackagingGroupRequest
 @see AWSMediapackagevodDescribePackagingGroupResponse
 */
- (void)describePackagingGroup:(AWSMediapackagevodDescribePackagingGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSMediapackagevodDescribePackagingGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns a collection of MediaPackage VOD Asset resources.
 
 @param request A container for the necessary parameters to execute the ListAssets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediapackagevodListAssetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodListAssetsRequest
 @see AWSMediapackagevodListAssetsResponse
 */
- (AWSTask<AWSMediapackagevodListAssetsResponse *> *)listAssets:(AWSMediapackagevodListAssetsRequest *)request;

/**
 Returns a collection of MediaPackage VOD Asset resources.
 
 @param request A container for the necessary parameters to execute the ListAssets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodListAssetsRequest
 @see AWSMediapackagevodListAssetsResponse
 */
- (void)listAssets:(AWSMediapackagevodListAssetsRequest *)request completionHandler:(void (^ _Nullable)(AWSMediapackagevodListAssetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns a collection of MediaPackage VOD PackagingConfiguration resources.
 
 @param request A container for the necessary parameters to execute the ListPackagingConfigurations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediapackagevodListPackagingConfigurationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodListPackagingConfigurationsRequest
 @see AWSMediapackagevodListPackagingConfigurationsResponse
 */
- (AWSTask<AWSMediapackagevodListPackagingConfigurationsResponse *> *)listPackagingConfigurations:(AWSMediapackagevodListPackagingConfigurationsRequest *)request;

/**
 Returns a collection of MediaPackage VOD PackagingConfiguration resources.
 
 @param request A container for the necessary parameters to execute the ListPackagingConfigurations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodListPackagingConfigurationsRequest
 @see AWSMediapackagevodListPackagingConfigurationsResponse
 */
- (void)listPackagingConfigurations:(AWSMediapackagevodListPackagingConfigurationsRequest *)request completionHandler:(void (^ _Nullable)(AWSMediapackagevodListPackagingConfigurationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns a collection of MediaPackage VOD PackagingGroup resources.
 
 @param request A container for the necessary parameters to execute the ListPackagingGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediapackagevodListPackagingGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodListPackagingGroupsRequest
 @see AWSMediapackagevodListPackagingGroupsResponse
 */
- (AWSTask<AWSMediapackagevodListPackagingGroupsResponse *> *)listPackagingGroups:(AWSMediapackagevodListPackagingGroupsRequest *)request;

/**
 Returns a collection of MediaPackage VOD PackagingGroup resources.
 
 @param request A container for the necessary parameters to execute the ListPackagingGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodListPackagingGroupsRequest
 @see AWSMediapackagevodListPackagingGroupsResponse
 */
- (void)listPackagingGroups:(AWSMediapackagevodListPackagingGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSMediapackagevodListPackagingGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns a list of the tags assigned to the specified resource.
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediapackagevodListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: .
 
 @see AWSMediapackagevodListTagsForResourceRequest
 @see AWSMediapackagevodListTagsForResourceResponse
 */
- (AWSTask<AWSMediapackagevodListTagsForResourceResponse *> *)listTagsForResource:(AWSMediapackagevodListTagsForResourceRequest *)request;

/**
 Returns a list of the tags assigned to the specified resource.
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: .
 
 @see AWSMediapackagevodListTagsForResourceRequest
 @see AWSMediapackagevodListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSMediapackagevodListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSMediapackagevodListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Adds tags to the specified resource. You can specify one or more tags to add.
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: .
 
 @see AWSMediapackagevodTagResourceRequest
 */
- (AWSTask *)tagResource:(AWSMediapackagevodTagResourceRequest *)request;

/**
 Adds tags to the specified resource. You can specify one or more tags to add.
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: .
 
 @see AWSMediapackagevodTagResourceRequest
 */
- (void)tagResource:(AWSMediapackagevodTagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Removes tags from the specified resource. You can specify one or more tags to remove.
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: .
 
 @see AWSMediapackagevodUntagResourceRequest
 */
- (AWSTask *)untagResource:(AWSMediapackagevodUntagResourceRequest *)request;

/**
 Removes tags from the specified resource. You can specify one or more tags to remove.
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: .
 
 @see AWSMediapackagevodUntagResourceRequest
 */
- (void)untagResource:(AWSMediapackagevodUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Updates a specific packaging group. You can't change the id attribute or any other system-generated attributes.
 
 @param request A container for the necessary parameters to execute the UpdatePackagingGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediapackagevodUpdatePackagingGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodUpdatePackagingGroupRequest
 @see AWSMediapackagevodUpdatePackagingGroupResponse
 */
- (AWSTask<AWSMediapackagevodUpdatePackagingGroupResponse *> *)updatePackagingGroup:(AWSMediapackagevodUpdatePackagingGroupRequest *)request;

/**
 Updates a specific packaging group. You can't change the id attribute or any other system-generated attributes.
 
 @param request A container for the necessary parameters to execute the UpdatePackagingGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediapackagevodErrorDomain` domain and the following error code: `AWSMediapackagevodErrorUnprocessableEntity`, `AWSMediapackagevodErrorInternalServerError`, `AWSMediapackagevodErrorForbidden`, `AWSMediapackagevodErrorNotFound`, `AWSMediapackagevodErrorServiceUnavailable`, `AWSMediapackagevodErrorTooManyRequests`.
 
 @see AWSMediapackagevodUpdatePackagingGroupRequest
 @see AWSMediapackagevodUpdatePackagingGroupResponse
 */
- (void)updatePackagingGroup:(AWSMediapackagevodUpdatePackagingGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSMediapackagevodUpdatePackagingGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
