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
#import "AWSapi.mediatailorModel.h"
#import "AWSapi.mediatailorResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSapi.mediatailor
FOUNDATION_EXPORT NSString *const AWSapi.mediatailorSDKVersion;

/**
 <p>Use the AWS Elemental MediaTailor SDK to configure scalable ad insertion for your live and VOD content. With AWS Elemental MediaTailor, you can serve targeted ads to viewers while maintaining broadcast quality in over-the-top (OTT) video applications. For information about using the service, including detailed information about the settings covered in this guide, see the AWS Elemental MediaTailor User Guide.<p>Through the SDK, you manage AWS Elemental MediaTailor configurations the same as you do through the console. For example, you specify ad insertion behavior and mapping information for the origin server and the ad decision server (ADS).</p>
 */
@interface AWSapi.mediatailor : AWSService

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

     let api.mediatailor = AWSapi.mediatailor.default()

 *Objective-C*

     AWSapi.mediatailor *api.mediatailor = [AWSapi.mediatailor defaultapi.mediatailor];

 @return The default service client.
 */
+ (instancetype)defaultapi.mediatailor;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSapi.mediatailor.register(with: configuration!, forKey: "USWest2api.mediatailor")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSapi.mediatailor registerapi.mediatailorWithConfiguration:configuration forKey:@"USWest2api.mediatailor"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let api.mediatailor = AWSapi.mediatailor(forKey: "USWest2api.mediatailor")

 *Objective-C*

     AWSapi.mediatailor *api.mediatailor = [AWSapi.mediatailor api.mediatailorForKey:@"USWest2api.mediatailor"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerapi.mediatailorWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerapi.mediatailorWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSapi.mediatailor.register(with: configuration!, forKey: "USWest2api.mediatailor")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSapi.mediatailor registerapi.mediatailorWithConfiguration:configuration forKey:@"USWest2api.mediatailor"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let api.mediatailor = AWSapi.mediatailor(forKey: "USWest2api.mediatailor")

 *Objective-C*

     AWSapi.mediatailor *api.mediatailor = [AWSapi.mediatailor api.mediatailorForKey:@"USWest2api.mediatailor"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)api.mediatailorForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeapi.mediatailorForKey:(NSString *)key;

/**
 <p>Deletes the playback configuration for the specified name. </p>
 
 @param request A container for the necessary parameters to execute the DeletePlaybackConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.mediatailorDeletePlaybackConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.mediatailorErrorDomain` domain and the following error code: .
 
 @see AWSapi.mediatailorDeletePlaybackConfigurationRequest
 @see AWSapi.mediatailorDeletePlaybackConfigurationResponse
 */
- (AWSTask<AWSapi.mediatailorDeletePlaybackConfigurationResponse *> *)deletePlaybackConfiguration:(AWSapi.mediatailorDeletePlaybackConfigurationRequest *)request;

/**
 <p>Deletes the playback configuration for the specified name. </p>
 
 @param request A container for the necessary parameters to execute the DeletePlaybackConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.mediatailorErrorDomain` domain and the following error code: .
 
 @see AWSapi.mediatailorDeletePlaybackConfigurationRequest
 @see AWSapi.mediatailorDeletePlaybackConfigurationResponse
 */
- (void)deletePlaybackConfiguration:(AWSapi.mediatailorDeletePlaybackConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.mediatailorDeletePlaybackConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the playback configuration for the specified name. </p>
 
 @param request A container for the necessary parameters to execute the GetPlaybackConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.mediatailorGetPlaybackConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.mediatailorErrorDomain` domain and the following error code: .
 
 @see AWSapi.mediatailorGetPlaybackConfigurationRequest
 @see AWSapi.mediatailorGetPlaybackConfigurationResponse
 */
- (AWSTask<AWSapi.mediatailorGetPlaybackConfigurationResponse *> *)getPlaybackConfiguration:(AWSapi.mediatailorGetPlaybackConfigurationRequest *)request;

/**
 <p>Returns the playback configuration for the specified name. </p>
 
 @param request A container for the necessary parameters to execute the GetPlaybackConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.mediatailorErrorDomain` domain and the following error code: .
 
 @see AWSapi.mediatailorGetPlaybackConfigurationRequest
 @see AWSapi.mediatailorGetPlaybackConfigurationResponse
 */
- (void)getPlaybackConfiguration:(AWSapi.mediatailorGetPlaybackConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.mediatailorGetPlaybackConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the playback configurations defined in AWS Elemental MediaTailor. You can specify a maximum number of configurations to return at a time. The default maximum is 50. Results are returned in pagefuls. If MediaTailor has more configurations than the specified maximum, it provides parameters in the response that you can use to retrieve the next pageful. </p>
 
 @param request A container for the necessary parameters to execute the ListPlaybackConfigurations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.mediatailorListPlaybackConfigurationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.mediatailorErrorDomain` domain and the following error code: .
 
 @see AWSapi.mediatailorListPlaybackConfigurationsRequest
 @see AWSapi.mediatailorListPlaybackConfigurationsResponse
 */
- (AWSTask<AWSapi.mediatailorListPlaybackConfigurationsResponse *> *)listPlaybackConfigurations:(AWSapi.mediatailorListPlaybackConfigurationsRequest *)request;

/**
 <p>Returns a list of the playback configurations defined in AWS Elemental MediaTailor. You can specify a maximum number of configurations to return at a time. The default maximum is 50. Results are returned in pagefuls. If MediaTailor has more configurations than the specified maximum, it provides parameters in the response that you can use to retrieve the next pageful. </p>
 
 @param request A container for the necessary parameters to execute the ListPlaybackConfigurations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.mediatailorErrorDomain` domain and the following error code: .
 
 @see AWSapi.mediatailorListPlaybackConfigurationsRequest
 @see AWSapi.mediatailorListPlaybackConfigurationsResponse
 */
- (void)listPlaybackConfigurations:(AWSapi.mediatailorListPlaybackConfigurationsRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.mediatailorListPlaybackConfigurationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the tags assigned to the specified playback configuration resource. </p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.mediatailorListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.mediatailorErrorDomain` domain and the following error code: `AWSapi.mediatailorErrorBadRequest`.
 
 @see AWSapi.mediatailorListTagsForResourceRequest
 @see AWSapi.mediatailorListTagsForResourceResponse
 */
- (AWSTask<AWSapi.mediatailorListTagsForResourceResponse *> *)listTagsForResource:(AWSapi.mediatailorListTagsForResourceRequest *)request;

/**
 <p>Returns a list of the tags assigned to the specified playback configuration resource. </p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.mediatailorErrorDomain` domain and the following error code: `AWSapi.mediatailorErrorBadRequest`.
 
 @see AWSapi.mediatailorListTagsForResourceRequest
 @see AWSapi.mediatailorListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSapi.mediatailorListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.mediatailorListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds a new playback configuration to AWS Elemental MediaTailor. </p>
 
 @param request A container for the necessary parameters to execute the PutPlaybackConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.mediatailorPutPlaybackConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.mediatailorErrorDomain` domain and the following error code: .
 
 @see AWSapi.mediatailorPutPlaybackConfigurationRequest
 @see AWSapi.mediatailorPutPlaybackConfigurationResponse
 */
- (AWSTask<AWSapi.mediatailorPutPlaybackConfigurationResponse *> *)putPlaybackConfiguration:(AWSapi.mediatailorPutPlaybackConfigurationRequest *)request;

/**
 <p>Adds a new playback configuration to AWS Elemental MediaTailor. </p>
 
 @param request A container for the necessary parameters to execute the PutPlaybackConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.mediatailorErrorDomain` domain and the following error code: .
 
 @see AWSapi.mediatailorPutPlaybackConfigurationRequest
 @see AWSapi.mediatailorPutPlaybackConfigurationResponse
 */
- (void)putPlaybackConfiguration:(AWSapi.mediatailorPutPlaybackConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.mediatailorPutPlaybackConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds tags to the specified playback configuration resource. You can specify one or more tags to add. </p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.mediatailorErrorDomain` domain and the following error code: `AWSapi.mediatailorErrorBadRequest`.
 
 @see AWSapi.mediatailorTagResourceRequest
 */
- (AWSTask *)tagResource:(AWSapi.mediatailorTagResourceRequest *)request;

/**
 <p>Adds tags to the specified playback configuration resource. You can specify one or more tags to add. </p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.mediatailorErrorDomain` domain and the following error code: `AWSapi.mediatailorErrorBadRequest`.
 
 @see AWSapi.mediatailorTagResourceRequest
 */
- (void)tagResource:(AWSapi.mediatailorTagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes tags from the specified playback configuration resource. You can specify one or more tags to remove. </p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.mediatailorErrorDomain` domain and the following error code: `AWSapi.mediatailorErrorBadRequest`.
 
 @see AWSapi.mediatailorUntagResourceRequest
 */
- (AWSTask *)untagResource:(AWSapi.mediatailorUntagResourceRequest *)request;

/**
 <p>Removes tags from the specified playback configuration resource. You can specify one or more tags to remove. </p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.mediatailorErrorDomain` domain and the following error code: `AWSapi.mediatailorErrorBadRequest`.
 
 @see AWSapi.mediatailorUntagResourceRequest
 */
- (void)untagResource:(AWSapi.mediatailorUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
