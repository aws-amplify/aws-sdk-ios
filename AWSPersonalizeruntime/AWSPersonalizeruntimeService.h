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
#import "AWSPersonalizeruntimeModel.h"
#import "AWSPersonalizeruntimeResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSPersonalizeruntime
FOUNDATION_EXPORT NSString *const AWSPersonalizeruntimeSDKVersion;

/**
 <p/>
 */
@interface AWSPersonalizeruntime : AWSService

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

     let Personalizeruntime = AWSPersonalizeruntime.default()

 *Objective-C*

     AWSPersonalizeruntime *Personalizeruntime = [AWSPersonalizeruntime defaultPersonalizeruntime];

 @return The default service client.
 */
+ (instancetype)defaultPersonalizeruntime;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSPersonalizeruntime.register(with: configuration!, forKey: "USWest2Personalizeruntime")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSPersonalizeruntime registerPersonalizeruntimeWithConfiguration:configuration forKey:@"USWest2Personalizeruntime"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Personalizeruntime = AWSPersonalizeruntime(forKey: "USWest2Personalizeruntime")

 *Objective-C*

     AWSPersonalizeruntime *Personalizeruntime = [AWSPersonalizeruntime PersonalizeruntimeForKey:@"USWest2Personalizeruntime"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerPersonalizeruntimeWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerPersonalizeruntimeWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSPersonalizeruntime.register(with: configuration!, forKey: "USWest2Personalizeruntime")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSPersonalizeruntime registerPersonalizeruntimeWithConfiguration:configuration forKey:@"USWest2Personalizeruntime"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Personalizeruntime = AWSPersonalizeruntime(forKey: "USWest2Personalizeruntime")

 *Objective-C*

     AWSPersonalizeruntime *Personalizeruntime = [AWSPersonalizeruntime PersonalizeruntimeForKey:@"USWest2Personalizeruntime"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)PersonalizeruntimeForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removePersonalizeruntimeForKey:(NSString *)key;

/**
 <p>Re-ranks a list of recommended items for the given user. The first item in the list is deemed the most likely item to be of interest to the user.</p><note><p>The solution backing the campaign must have been created using a recipe of type PERSONALIZED_RANKING.</p></note>
 
 @param request A container for the necessary parameters to execute the GetPersonalizedRanking service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeruntimeGetPersonalizedRankingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeruntimeErrorDomain` domain and the following error code: `AWSPersonalizeruntimeErrorInvalidInput`, `AWSPersonalizeruntimeErrorResourceNotFound`.
 
 @see AWSPersonalizeruntimeGetPersonalizedRankingRequest
 @see AWSPersonalizeruntimeGetPersonalizedRankingResponse
 */
- (AWSTask<AWSPersonalizeruntimeGetPersonalizedRankingResponse *> *)getPersonalizedRanking:(AWSPersonalizeruntimeGetPersonalizedRankingRequest *)request;

/**
 <p>Re-ranks a list of recommended items for the given user. The first item in the list is deemed the most likely item to be of interest to the user.</p><note><p>The solution backing the campaign must have been created using a recipe of type PERSONALIZED_RANKING.</p></note>
 
 @param request A container for the necessary parameters to execute the GetPersonalizedRanking service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeruntimeErrorDomain` domain and the following error code: `AWSPersonalizeruntimeErrorInvalidInput`, `AWSPersonalizeruntimeErrorResourceNotFound`.
 
 @see AWSPersonalizeruntimeGetPersonalizedRankingRequest
 @see AWSPersonalizeruntimeGetPersonalizedRankingResponse
 */
- (void)getPersonalizedRanking:(AWSPersonalizeruntimeGetPersonalizedRankingRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeruntimeGetPersonalizedRankingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of recommended items. The required input depends on the recipe type used to create the solution backing the campaign, as follows:</p><ul><li><p>RELATED_ITEMS - <code>itemId</code> required, <code>userId</code> not used</p></li><li><p>USER_PERSONALIZATION - <code>itemId</code> optional, <code>userId</code> required</p></li></ul><note><p>Campaigns that are backed by a solution created using a recipe of type PERSONALIZED_RANKING use the API.</p></note>
 
 @param request A container for the necessary parameters to execute the GetRecommendations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeruntimeGetRecommendationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeruntimeErrorDomain` domain and the following error code: `AWSPersonalizeruntimeErrorInvalidInput`, `AWSPersonalizeruntimeErrorResourceNotFound`.
 
 @see AWSPersonalizeruntimeGetRecommendationsRequest
 @see AWSPersonalizeruntimeGetRecommendationsResponse
 */
- (AWSTask<AWSPersonalizeruntimeGetRecommendationsResponse *> *)getRecommendations:(AWSPersonalizeruntimeGetRecommendationsRequest *)request;

/**
 <p>Returns a list of recommended items. The required input depends on the recipe type used to create the solution backing the campaign, as follows:</p><ul><li><p>RELATED_ITEMS - <code>itemId</code> required, <code>userId</code> not used</p></li><li><p>USER_PERSONALIZATION - <code>itemId</code> optional, <code>userId</code> required</p></li></ul><note><p>Campaigns that are backed by a solution created using a recipe of type PERSONALIZED_RANKING use the API.</p></note>
 
 @param request A container for the necessary parameters to execute the GetRecommendations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeruntimeErrorDomain` domain and the following error code: `AWSPersonalizeruntimeErrorInvalidInput`, `AWSPersonalizeruntimeErrorResourceNotFound`.
 
 @see AWSPersonalizeruntimeGetRecommendationsRequest
 @see AWSPersonalizeruntimeGetRecommendationsResponse
 */
- (void)getRecommendations:(AWSPersonalizeruntimeGetRecommendationsRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeruntimeGetRecommendationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
