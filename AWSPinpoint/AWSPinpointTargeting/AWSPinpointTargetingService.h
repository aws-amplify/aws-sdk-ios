//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSPinpointTargetingModel.h"
#import "AWSPinpointTargetingResources.h"

NS_ASSUME_NONNULL_BEGIN

/**
 
 */
@interface AWSPinpointTargeting : AWSService

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

     let PinpointTargeting = AWSPinpointTargeting.default()

 *Objective-C*

     AWSPinpointTargeting *PinpointTargeting = [AWSPinpointTargeting defaultPinpointTargeting];

 @return The default service client.
 */
+ (instancetype)defaultPinpointTargeting;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSPinpointTargeting.register(with: configuration!, forKey: "USWest2PinpointTargeting")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:@"USWest2PinpointTargeting"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let PinpointTargeting = AWSPinpointTargeting(forKey: "USWest2PinpointTargeting")

 *Objective-C*

     AWSPinpointTargeting *PinpointTargeting = [AWSPinpointTargeting PinpointTargetingForKey:@"USWest2PinpointTargeting"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerPinpointTargetingWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerPinpointTargetingWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSPinpointTargeting.register(with: configuration!, forKey: "USWest2PinpointTargeting")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:@"USWest2PinpointTargeting"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let PinpointTargeting = AWSPinpointTargeting(forKey: "USWest2PinpointTargeting")

 *Objective-C*

     AWSPinpointTargeting *PinpointTargeting = [AWSPinpointTargeting PinpointTargetingForKey:@"USWest2PinpointTargeting"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)PinpointTargetingForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removePinpointTargetingForKey:(NSString *)key;

/**
 Creates or updates a campaign.
 
 @param request A container for the necessary parameters to execute the CreateCampaign service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingCreateCampaignResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingCreateCampaignRequest
 @see AWSPinpointTargetingCreateCampaignResponse
 */
- (AWSTask<AWSPinpointTargetingCreateCampaignResponse *> *)createCampaign:(AWSPinpointTargetingCreateCampaignRequest *)request;

/**
 Creates or updates a campaign.
 
 @param request A container for the necessary parameters to execute the CreateCampaign service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingCreateCampaignRequest
 @see AWSPinpointTargetingCreateCampaignResponse
 */
- (void)createCampaign:(AWSPinpointTargetingCreateCampaignRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingCreateCampaignResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Creates or updates an import job.
 
 @param request A container for the necessary parameters to execute the CreateImportJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingCreateImportJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingCreateImportJobRequest
 @see AWSPinpointTargetingCreateImportJobResponse
 */
- (AWSTask<AWSPinpointTargetingCreateImportJobResponse *> *)createImportJob:(AWSPinpointTargetingCreateImportJobRequest *)request;

/**
 Creates or updates an import job.
 
 @param request A container for the necessary parameters to execute the CreateImportJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingCreateImportJobRequest
 @see AWSPinpointTargetingCreateImportJobResponse
 */
- (void)createImportJob:(AWSPinpointTargetingCreateImportJobRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingCreateImportJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Used to create or update a segment.
 
 @param request A container for the necessary parameters to execute the CreateSegment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingCreateSegmentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingCreateSegmentRequest
 @see AWSPinpointTargetingCreateSegmentResponse
 */
- (AWSTask<AWSPinpointTargetingCreateSegmentResponse *> *)createSegment:(AWSPinpointTargetingCreateSegmentRequest *)request;

/**
 Used to create or update a segment.
 
 @param request A container for the necessary parameters to execute the CreateSegment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingCreateSegmentRequest
 @see AWSPinpointTargetingCreateSegmentResponse
 */
- (void)createSegment:(AWSPinpointTargetingCreateSegmentRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingCreateSegmentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes the APNs channel for an app.
 
 @param request A container for the necessary parameters to execute the DeleteApnsChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteApnsChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteApnsChannelRequest
 @see AWSPinpointTargetingDeleteApnsChannelResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteApnsChannelResponse *> *)deleteApnsChannel:(AWSPinpointTargetingDeleteApnsChannelRequest *)request;

/**
 Deletes the APNs channel for an app.
 
 @param request A container for the necessary parameters to execute the DeleteApnsChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteApnsChannelRequest
 @see AWSPinpointTargetingDeleteApnsChannelResponse
 */
- (void)deleteApnsChannel:(AWSPinpointTargetingDeleteApnsChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteApnsChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes a campaign.
 
 @param request A container for the necessary parameters to execute the DeleteCampaign service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteCampaignResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteCampaignRequest
 @see AWSPinpointTargetingDeleteCampaignResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteCampaignResponse *> *)deleteCampaign:(AWSPinpointTargetingDeleteCampaignRequest *)request;

/**
 Deletes a campaign.
 
 @param request A container for the necessary parameters to execute the DeleteCampaign service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteCampaignRequest
 @see AWSPinpointTargetingDeleteCampaignResponse
 */
- (void)deleteCampaign:(AWSPinpointTargetingDeleteCampaignRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteCampaignResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes the GCM channel for an app.
 
 @param request A container for the necessary parameters to execute the DeleteGcmChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteGcmChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteGcmChannelRequest
 @see AWSPinpointTargetingDeleteGcmChannelResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteGcmChannelResponse *> *)deleteGcmChannel:(AWSPinpointTargetingDeleteGcmChannelRequest *)request;

/**
 Deletes the GCM channel for an app.
 
 @param request A container for the necessary parameters to execute the DeleteGcmChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteGcmChannelRequest
 @see AWSPinpointTargetingDeleteGcmChannelResponse
 */
- (void)deleteGcmChannel:(AWSPinpointTargetingDeleteGcmChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteGcmChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes a segment.
 
 @param request A container for the necessary parameters to execute the DeleteSegment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteSegmentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteSegmentRequest
 @see AWSPinpointTargetingDeleteSegmentResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteSegmentResponse *> *)deleteSegment:(AWSPinpointTargetingDeleteSegmentRequest *)request;

/**
 Deletes a segment.
 
 @param request A container for the necessary parameters to execute the DeleteSegment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteSegmentRequest
 @see AWSPinpointTargetingDeleteSegmentResponse
 */
- (void)deleteSegment:(AWSPinpointTargetingDeleteSegmentRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteSegmentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about the APNs channel for an app.
 
 @param request A container for the necessary parameters to execute the GetApnsChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetApnsChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetApnsChannelRequest
 @see AWSPinpointTargetingGetApnsChannelResponse
 */
- (AWSTask<AWSPinpointTargetingGetApnsChannelResponse *> *)getApnsChannel:(AWSPinpointTargetingGetApnsChannelRequest *)request;

/**
 Returns information about the APNs channel for an app.
 
 @param request A container for the necessary parameters to execute the GetApnsChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetApnsChannelRequest
 @see AWSPinpointTargetingGetApnsChannelResponse
 */
- (void)getApnsChannel:(AWSPinpointTargetingGetApnsChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetApnsChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Used to request the settings for an app.
 
 @param request A container for the necessary parameters to execute the GetApplicationSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetApplicationSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetApplicationSettingsRequest
 @see AWSPinpointTargetingGetApplicationSettingsResponse
 */
- (AWSTask<AWSPinpointTargetingGetApplicationSettingsResponse *> *)getApplicationSettings:(AWSPinpointTargetingGetApplicationSettingsRequest *)request;

/**
 Used to request the settings for an app.
 
 @param request A container for the necessary parameters to execute the GetApplicationSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetApplicationSettingsRequest
 @see AWSPinpointTargetingGetApplicationSettingsResponse
 */
- (void)getApplicationSettings:(AWSPinpointTargetingGetApplicationSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetApplicationSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about a campaign.
 
 @param request A container for the necessary parameters to execute the GetCampaign service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetCampaignResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetCampaignRequest
 @see AWSPinpointTargetingGetCampaignResponse
 */
- (AWSTask<AWSPinpointTargetingGetCampaignResponse *> *)getCampaign:(AWSPinpointTargetingGetCampaignRequest *)request;

/**
 Returns information about a campaign.
 
 @param request A container for the necessary parameters to execute the GetCampaign service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetCampaignRequest
 @see AWSPinpointTargetingGetCampaignResponse
 */
- (void)getCampaign:(AWSPinpointTargetingGetCampaignRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetCampaignResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about the activity performed by a campaign.
 
 @param request A container for the necessary parameters to execute the GetCampaignActivities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetCampaignActivitiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetCampaignActivitiesRequest
 @see AWSPinpointTargetingGetCampaignActivitiesResponse
 */
- (AWSTask<AWSPinpointTargetingGetCampaignActivitiesResponse *> *)getCampaignActivities:(AWSPinpointTargetingGetCampaignActivitiesRequest *)request;

/**
 Returns information about the activity performed by a campaign.
 
 @param request A container for the necessary parameters to execute the GetCampaignActivities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetCampaignActivitiesRequest
 @see AWSPinpointTargetingGetCampaignActivitiesResponse
 */
- (void)getCampaignActivities:(AWSPinpointTargetingGetCampaignActivitiesRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetCampaignActivitiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about your campaign versions.
 
 @param request A container for the necessary parameters to execute the GetCampaignVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetCampaignVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetCampaignVersionRequest
 @see AWSPinpointTargetingGetCampaignVersionResponse
 */
- (AWSTask<AWSPinpointTargetingGetCampaignVersionResponse *> *)getCampaignVersion:(AWSPinpointTargetingGetCampaignVersionRequest *)request;

/**
 Returns information about your campaign versions.
 
 @param request A container for the necessary parameters to execute the GetCampaignVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetCampaignVersionRequest
 @see AWSPinpointTargetingGetCampaignVersionResponse
 */
- (void)getCampaignVersion:(AWSPinpointTargetingGetCampaignVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetCampaignVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about your campaign versions.
 
 @param request A container for the necessary parameters to execute the GetCampaignVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetCampaignVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetCampaignVersionsRequest
 @see AWSPinpointTargetingGetCampaignVersionsResponse
 */
- (AWSTask<AWSPinpointTargetingGetCampaignVersionsResponse *> *)getCampaignVersions:(AWSPinpointTargetingGetCampaignVersionsRequest *)request;

/**
 Returns information about your campaign versions.
 
 @param request A container for the necessary parameters to execute the GetCampaignVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetCampaignVersionsRequest
 @see AWSPinpointTargetingGetCampaignVersionsResponse
 */
- (void)getCampaignVersions:(AWSPinpointTargetingGetCampaignVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetCampaignVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about your campaigns.
 
 @param request A container for the necessary parameters to execute the GetCampaigns service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetCampaignsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetCampaignsRequest
 @see AWSPinpointTargetingGetCampaignsResponse
 */
- (AWSTask<AWSPinpointTargetingGetCampaignsResponse *> *)getCampaigns:(AWSPinpointTargetingGetCampaignsRequest *)request;

/**
 Returns information about your campaigns.
 
 @param request A container for the necessary parameters to execute the GetCampaigns service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetCampaignsRequest
 @see AWSPinpointTargetingGetCampaignsResponse
 */
- (void)getCampaigns:(AWSPinpointTargetingGetCampaignsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetCampaignsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about an endpoint.
 
 @param request A container for the necessary parameters to execute the GetEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetEndpointRequest
 @see AWSPinpointTargetingGetEndpointResponse
 */
- (AWSTask<AWSPinpointTargetingGetEndpointResponse *> *)getEndpoint:(AWSPinpointTargetingGetEndpointRequest *)request;

/**
 Returns information about an endpoint.
 
 @param request A container for the necessary parameters to execute the GetEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetEndpointRequest
 @see AWSPinpointTargetingGetEndpointResponse
 */
- (void)getEndpoint:(AWSPinpointTargetingGetEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about the GCM channel for an app.
 
 @param request A container for the necessary parameters to execute the GetGcmChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetGcmChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetGcmChannelRequest
 @see AWSPinpointTargetingGetGcmChannelResponse
 */
- (AWSTask<AWSPinpointTargetingGetGcmChannelResponse *> *)getGcmChannel:(AWSPinpointTargetingGetGcmChannelRequest *)request;

/**
 Returns information about the GCM channel for an app.
 
 @param request A container for the necessary parameters to execute the GetGcmChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetGcmChannelRequest
 @see AWSPinpointTargetingGetGcmChannelResponse
 */
- (void)getGcmChannel:(AWSPinpointTargetingGetGcmChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetGcmChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about an import job.
 
 @param request A container for the necessary parameters to execute the GetImportJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetImportJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetImportJobRequest
 @see AWSPinpointTargetingGetImportJobResponse
 */
- (AWSTask<AWSPinpointTargetingGetImportJobResponse *> *)getImportJob:(AWSPinpointTargetingGetImportJobRequest *)request;

/**
 Returns information about an import job.
 
 @param request A container for the necessary parameters to execute the GetImportJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetImportJobRequest
 @see AWSPinpointTargetingGetImportJobResponse
 */
- (void)getImportJob:(AWSPinpointTargetingGetImportJobRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetImportJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about your import jobs.
 
 @param request A container for the necessary parameters to execute the GetImportJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetImportJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetImportJobsRequest
 @see AWSPinpointTargetingGetImportJobsResponse
 */
- (AWSTask<AWSPinpointTargetingGetImportJobsResponse *> *)getImportJobs:(AWSPinpointTargetingGetImportJobsRequest *)request;

/**
 Returns information about your import jobs.
 
 @param request A container for the necessary parameters to execute the GetImportJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetImportJobsRequest
 @see AWSPinpointTargetingGetImportJobsResponse
 */
- (void)getImportJobs:(AWSPinpointTargetingGetImportJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetImportJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about a segment.
 
 @param request A container for the necessary parameters to execute the GetSegment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetSegmentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSegmentRequest
 @see AWSPinpointTargetingGetSegmentResponse
 */
- (AWSTask<AWSPinpointTargetingGetSegmentResponse *> *)getSegment:(AWSPinpointTargetingGetSegmentRequest *)request;

/**
 Returns information about a segment.
 
 @param request A container for the necessary parameters to execute the GetSegment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSegmentRequest
 @see AWSPinpointTargetingGetSegmentResponse
 */
- (void)getSegment:(AWSPinpointTargetingGetSegmentRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetSegmentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns a list of import jobs for a specific segment.
 
 @param request A container for the necessary parameters to execute the GetSegmentImportJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetSegmentImportJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSegmentImportJobsRequest
 @see AWSPinpointTargetingGetSegmentImportJobsResponse
 */
- (AWSTask<AWSPinpointTargetingGetSegmentImportJobsResponse *> *)getSegmentImportJobs:(AWSPinpointTargetingGetSegmentImportJobsRequest *)request;

/**
 Returns a list of import jobs for a specific segment.
 
 @param request A container for the necessary parameters to execute the GetSegmentImportJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSegmentImportJobsRequest
 @see AWSPinpointTargetingGetSegmentImportJobsResponse
 */
- (void)getSegmentImportJobs:(AWSPinpointTargetingGetSegmentImportJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetSegmentImportJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about a segment version.
 
 @param request A container for the necessary parameters to execute the GetSegmentVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetSegmentVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSegmentVersionRequest
 @see AWSPinpointTargetingGetSegmentVersionResponse
 */
- (AWSTask<AWSPinpointTargetingGetSegmentVersionResponse *> *)getSegmentVersion:(AWSPinpointTargetingGetSegmentVersionRequest *)request;

/**
 Returns information about a segment version.
 
 @param request A container for the necessary parameters to execute the GetSegmentVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSegmentVersionRequest
 @see AWSPinpointTargetingGetSegmentVersionResponse
 */
- (void)getSegmentVersion:(AWSPinpointTargetingGetSegmentVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetSegmentVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about your segment versions.
 
 @param request A container for the necessary parameters to execute the GetSegmentVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetSegmentVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSegmentVersionsRequest
 @see AWSPinpointTargetingGetSegmentVersionsResponse
 */
- (AWSTask<AWSPinpointTargetingGetSegmentVersionsResponse *> *)getSegmentVersions:(AWSPinpointTargetingGetSegmentVersionsRequest *)request;

/**
 Returns information about your segment versions.
 
 @param request A container for the necessary parameters to execute the GetSegmentVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSegmentVersionsRequest
 @see AWSPinpointTargetingGetSegmentVersionsResponse
 */
- (void)getSegmentVersions:(AWSPinpointTargetingGetSegmentVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetSegmentVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Used to get information about your segments.
 
 @param request A container for the necessary parameters to execute the GetSegments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetSegmentsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSegmentsRequest
 @see AWSPinpointTargetingGetSegmentsResponse
 */
- (AWSTask<AWSPinpointTargetingGetSegmentsResponse *> *)getSegments:(AWSPinpointTargetingGetSegmentsRequest *)request;

/**
 Used to get information about your segments.
 
 @param request A container for the necessary parameters to execute the GetSegments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSegmentsRequest
 @see AWSPinpointTargetingGetSegmentsResponse
 */
- (void)getSegments:(AWSPinpointTargetingGetSegmentsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetSegmentsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Use to update the APNs channel for an app.
 
 @param request A container for the necessary parameters to execute the UpdateApnsChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateApnsChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateApnsChannelRequest
 @see AWSPinpointTargetingUpdateApnsChannelResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateApnsChannelResponse *> *)updateApnsChannel:(AWSPinpointTargetingUpdateApnsChannelRequest *)request;

/**
 Use to update the APNs channel for an app.
 
 @param request A container for the necessary parameters to execute the UpdateApnsChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateApnsChannelRequest
 @see AWSPinpointTargetingUpdateApnsChannelResponse
 */
- (void)updateApnsChannel:(AWSPinpointTargetingUpdateApnsChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateApnsChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Used to update the settings for an app.
 
 @param request A container for the necessary parameters to execute the UpdateApplicationSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateApplicationSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateApplicationSettingsRequest
 @see AWSPinpointTargetingUpdateApplicationSettingsResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateApplicationSettingsResponse *> *)updateApplicationSettings:(AWSPinpointTargetingUpdateApplicationSettingsRequest *)request;

/**
 Used to update the settings for an app.
 
 @param request A container for the necessary parameters to execute the UpdateApplicationSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateApplicationSettingsRequest
 @see AWSPinpointTargetingUpdateApplicationSettingsResponse
 */
- (void)updateApplicationSettings:(AWSPinpointTargetingUpdateApplicationSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateApplicationSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Use to update a campaign.
 
 @param request A container for the necessary parameters to execute the UpdateCampaign service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateCampaignResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateCampaignRequest
 @see AWSPinpointTargetingUpdateCampaignResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateCampaignResponse *> *)updateCampaign:(AWSPinpointTargetingUpdateCampaignRequest *)request;

/**
 Use to update a campaign.
 
 @param request A container for the necessary parameters to execute the UpdateCampaign service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateCampaignRequest
 @see AWSPinpointTargetingUpdateCampaignResponse
 */
- (void)updateCampaign:(AWSPinpointTargetingUpdateCampaignRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateCampaignResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Use to update an endpoint.
 
 @param request A container for the necessary parameters to execute the UpdateEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateEndpointRequest
 @see AWSPinpointTargetingUpdateEndpointResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateEndpointResponse *> *)updateEndpoint:(AWSPinpointTargetingUpdateEndpointRequest *)request;

/**
 Use to update an endpoint.
 
 @param request A container for the necessary parameters to execute the UpdateEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateEndpointRequest
 @see AWSPinpointTargetingUpdateEndpointResponse
 */
- (void)updateEndpoint:(AWSPinpointTargetingUpdateEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Use to update your endpoints.
 
 @param request A container for the necessary parameters to execute the UpdateEndpointsBatch service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateEndpointsBatchResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateEndpointsBatchRequest
 @see AWSPinpointTargetingUpdateEndpointsBatchResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateEndpointsBatchResponse *> *)updateEndpointsBatch:(AWSPinpointTargetingUpdateEndpointsBatchRequest *)request;

/**
 Use to update your endpoints.
 
 @param request A container for the necessary parameters to execute the UpdateEndpointsBatch service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateEndpointsBatchRequest
 @see AWSPinpointTargetingUpdateEndpointsBatchResponse
 */
- (void)updateEndpointsBatch:(AWSPinpointTargetingUpdateEndpointsBatchRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateEndpointsBatchResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Use to update the GCM channel for an app.
 
 @param request A container for the necessary parameters to execute the UpdateGcmChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateGcmChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateGcmChannelRequest
 @see AWSPinpointTargetingUpdateGcmChannelResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateGcmChannelResponse *> *)updateGcmChannel:(AWSPinpointTargetingUpdateGcmChannelRequest *)request;

/**
 Use to update the GCM channel for an app.
 
 @param request A container for the necessary parameters to execute the UpdateGcmChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateGcmChannelRequest
 @see AWSPinpointTargetingUpdateGcmChannelResponse
 */
- (void)updateGcmChannel:(AWSPinpointTargetingUpdateGcmChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateGcmChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Use to update a segment.
 
 @param request A container for the necessary parameters to execute the UpdateSegment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateSegmentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateSegmentRequest
 @see AWSPinpointTargetingUpdateSegmentResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateSegmentResponse *> *)updateSegment:(AWSPinpointTargetingUpdateSegmentRequest *)request;

/**
 Use to update a segment.
 
 @param request A container for the necessary parameters to execute the UpdateSegment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateSegmentRequest
 @see AWSPinpointTargetingUpdateSegmentResponse
 */
- (void)updateSegment:(AWSPinpointTargetingUpdateSegmentRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateSegmentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
