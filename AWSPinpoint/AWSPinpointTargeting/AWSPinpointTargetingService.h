//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

//! SDK version for AWSPinpointTargeting
FOUNDATION_EXPORT NSString *const AWSPinpointTargetingSDKVersion;

/**
 Amazon Pinpoint
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
 Creates or updates an app.
 
 @param request A container for the necessary parameters to execute the CreateApp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingCreateAppResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingCreateAppRequest
 @see AWSPinpointTargetingCreateAppResponse
 */
- (AWSTask<AWSPinpointTargetingCreateAppResponse *> *)createApp:(AWSPinpointTargetingCreateAppRequest *)request;

/**
 Creates or updates an app.
 
 @param request A container for the necessary parameters to execute the CreateApp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingCreateAppRequest
 @see AWSPinpointTargetingCreateAppResponse
 */
- (void)createApp:(AWSPinpointTargetingCreateAppRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingCreateAppResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 Creates an export job.
 
 @param request A container for the necessary parameters to execute the CreateExportJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingCreateExportJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingCreateExportJobRequest
 @see AWSPinpointTargetingCreateExportJobResponse
 */
- (AWSTask<AWSPinpointTargetingCreateExportJobResponse *> *)createExportJob:(AWSPinpointTargetingCreateExportJobRequest *)request;

/**
 Creates an export job.
 
 @param request A container for the necessary parameters to execute the CreateExportJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingCreateExportJobRequest
 @see AWSPinpointTargetingCreateExportJobResponse
 */
- (void)createExportJob:(AWSPinpointTargetingCreateExportJobRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingCreateExportJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 Delete an ADM channel.
 
 @param request A container for the necessary parameters to execute the DeleteAdmChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteAdmChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteAdmChannelRequest
 @see AWSPinpointTargetingDeleteAdmChannelResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteAdmChannelResponse *> *)deleteAdmChannel:(AWSPinpointTargetingDeleteAdmChannelRequest *)request;

/**
 Delete an ADM channel.
 
 @param request A container for the necessary parameters to execute the DeleteAdmChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteAdmChannelRequest
 @see AWSPinpointTargetingDeleteAdmChannelResponse
 */
- (void)deleteAdmChannel:(AWSPinpointTargetingDeleteAdmChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteAdmChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 Delete an APNS sandbox channel.
 
 @param request A container for the necessary parameters to execute the DeleteApnsSandboxChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteApnsSandboxChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteApnsSandboxChannelRequest
 @see AWSPinpointTargetingDeleteApnsSandboxChannelResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteApnsSandboxChannelResponse *> *)deleteApnsSandboxChannel:(AWSPinpointTargetingDeleteApnsSandboxChannelRequest *)request;

/**
 Delete an APNS sandbox channel.
 
 @param request A container for the necessary parameters to execute the DeleteApnsSandboxChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteApnsSandboxChannelRequest
 @see AWSPinpointTargetingDeleteApnsSandboxChannelResponse
 */
- (void)deleteApnsSandboxChannel:(AWSPinpointTargetingDeleteApnsSandboxChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteApnsSandboxChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Delete an APNS VoIP channel
 
 @param request A container for the necessary parameters to execute the DeleteApnsVoipChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteApnsVoipChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteApnsVoipChannelRequest
 @see AWSPinpointTargetingDeleteApnsVoipChannelResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteApnsVoipChannelResponse *> *)deleteApnsVoipChannel:(AWSPinpointTargetingDeleteApnsVoipChannelRequest *)request;

/**
 Delete an APNS VoIP channel
 
 @param request A container for the necessary parameters to execute the DeleteApnsVoipChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteApnsVoipChannelRequest
 @see AWSPinpointTargetingDeleteApnsVoipChannelResponse
 */
- (void)deleteApnsVoipChannel:(AWSPinpointTargetingDeleteApnsVoipChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteApnsVoipChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Delete an APNS VoIP sandbox channel
 
 @param request A container for the necessary parameters to execute the DeleteApnsVoipSandboxChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteApnsVoipSandboxChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteApnsVoipSandboxChannelRequest
 @see AWSPinpointTargetingDeleteApnsVoipSandboxChannelResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteApnsVoipSandboxChannelResponse *> *)deleteApnsVoipSandboxChannel:(AWSPinpointTargetingDeleteApnsVoipSandboxChannelRequest *)request;

/**
 Delete an APNS VoIP sandbox channel
 
 @param request A container for the necessary parameters to execute the DeleteApnsVoipSandboxChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteApnsVoipSandboxChannelRequest
 @see AWSPinpointTargetingDeleteApnsVoipSandboxChannelResponse
 */
- (void)deleteApnsVoipSandboxChannel:(AWSPinpointTargetingDeleteApnsVoipSandboxChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteApnsVoipSandboxChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes an app.
 
 @param request A container for the necessary parameters to execute the DeleteApp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteAppResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteAppRequest
 @see AWSPinpointTargetingDeleteAppResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteAppResponse *> *)deleteApp:(AWSPinpointTargetingDeleteAppRequest *)request;

/**
 Deletes an app.
 
 @param request A container for the necessary parameters to execute the DeleteApp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteAppRequest
 @see AWSPinpointTargetingDeleteAppResponse
 */
- (void)deleteApp:(AWSPinpointTargetingDeleteAppRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteAppResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Delete a BAIDU GCM channel
 
 @param request A container for the necessary parameters to execute the DeleteBaiduChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteBaiduChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteBaiduChannelRequest
 @see AWSPinpointTargetingDeleteBaiduChannelResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteBaiduChannelResponse *> *)deleteBaiduChannel:(AWSPinpointTargetingDeleteBaiduChannelRequest *)request;

/**
 Delete a BAIDU GCM channel
 
 @param request A container for the necessary parameters to execute the DeleteBaiduChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteBaiduChannelRequest
 @see AWSPinpointTargetingDeleteBaiduChannelResponse
 */
- (void)deleteBaiduChannel:(AWSPinpointTargetingDeleteBaiduChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteBaiduChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 Delete an email channel.
 
 @param request A container for the necessary parameters to execute the DeleteEmailChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteEmailChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteEmailChannelRequest
 @see AWSPinpointTargetingDeleteEmailChannelResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteEmailChannelResponse *> *)deleteEmailChannel:(AWSPinpointTargetingDeleteEmailChannelRequest *)request;

/**
 Delete an email channel.
 
 @param request A container for the necessary parameters to execute the DeleteEmailChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteEmailChannelRequest
 @see AWSPinpointTargetingDeleteEmailChannelResponse
 */
- (void)deleteEmailChannel:(AWSPinpointTargetingDeleteEmailChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteEmailChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes an endpoint.
 
 @param request A container for the necessary parameters to execute the DeleteEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteEndpointRequest
 @see AWSPinpointTargetingDeleteEndpointResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteEndpointResponse *> *)deleteEndpoint:(AWSPinpointTargetingDeleteEndpointRequest *)request;

/**
 Deletes an endpoint.
 
 @param request A container for the necessary parameters to execute the DeleteEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteEndpointRequest
 @see AWSPinpointTargetingDeleteEndpointResponse
 */
- (void)deleteEndpoint:(AWSPinpointTargetingDeleteEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes the event stream for an app.
 
 @param request A container for the necessary parameters to execute the DeleteEventStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteEventStreamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteEventStreamRequest
 @see AWSPinpointTargetingDeleteEventStreamResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteEventStreamResponse *> *)deleteEventStream:(AWSPinpointTargetingDeleteEventStreamRequest *)request;

/**
 Deletes the event stream for an app.
 
 @param request A container for the necessary parameters to execute the DeleteEventStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteEventStreamRequest
 @see AWSPinpointTargetingDeleteEventStreamResponse
 */
- (void)deleteEventStream:(AWSPinpointTargetingDeleteEventStreamRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteEventStreamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 Delete an SMS channel.
 
 @param request A container for the necessary parameters to execute the DeleteSmsChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteSmsChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteSmsChannelRequest
 @see AWSPinpointTargetingDeleteSmsChannelResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteSmsChannelResponse *> *)deleteSmsChannel:(AWSPinpointTargetingDeleteSmsChannelRequest *)request;

/**
 Delete an SMS channel.
 
 @param request A container for the necessary parameters to execute the DeleteSmsChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteSmsChannelRequest
 @see AWSPinpointTargetingDeleteSmsChannelResponse
 */
- (void)deleteSmsChannel:(AWSPinpointTargetingDeleteSmsChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteSmsChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes endpoints that are associated with a User ID.
 
 @param request A container for the necessary parameters to execute the DeleteUserEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteUserEndpointsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteUserEndpointsRequest
 @see AWSPinpointTargetingDeleteUserEndpointsResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteUserEndpointsResponse *> *)deleteUserEndpoints:(AWSPinpointTargetingDeleteUserEndpointsRequest *)request;

/**
 Deletes endpoints that are associated with a User ID.
 
 @param request A container for the necessary parameters to execute the DeleteUserEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteUserEndpointsRequest
 @see AWSPinpointTargetingDeleteUserEndpointsResponse
 */
- (void)deleteUserEndpoints:(AWSPinpointTargetingDeleteUserEndpointsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteUserEndpointsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Delete an Voice channel
 
 @param request A container for the necessary parameters to execute the DeleteVoiceChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteVoiceChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteVoiceChannelRequest
 @see AWSPinpointTargetingDeleteVoiceChannelResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteVoiceChannelResponse *> *)deleteVoiceChannel:(AWSPinpointTargetingDeleteVoiceChannelRequest *)request;

/**
 Delete an Voice channel
 
 @param request A container for the necessary parameters to execute the DeleteVoiceChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteVoiceChannelRequest
 @see AWSPinpointTargetingDeleteVoiceChannelResponse
 */
- (void)deleteVoiceChannel:(AWSPinpointTargetingDeleteVoiceChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteVoiceChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Get an ADM channel.
 
 @param request A container for the necessary parameters to execute the GetAdmChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetAdmChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetAdmChannelRequest
 @see AWSPinpointTargetingGetAdmChannelResponse
 */
- (AWSTask<AWSPinpointTargetingGetAdmChannelResponse *> *)getAdmChannel:(AWSPinpointTargetingGetAdmChannelRequest *)request;

/**
 Get an ADM channel.
 
 @param request A container for the necessary parameters to execute the GetAdmChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetAdmChannelRequest
 @see AWSPinpointTargetingGetAdmChannelResponse
 */
- (void)getAdmChannel:(AWSPinpointTargetingGetAdmChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetAdmChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 Get an APNS sandbox channel.
 
 @param request A container for the necessary parameters to execute the GetApnsSandboxChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetApnsSandboxChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetApnsSandboxChannelRequest
 @see AWSPinpointTargetingGetApnsSandboxChannelResponse
 */
- (AWSTask<AWSPinpointTargetingGetApnsSandboxChannelResponse *> *)getApnsSandboxChannel:(AWSPinpointTargetingGetApnsSandboxChannelRequest *)request;

/**
 Get an APNS sandbox channel.
 
 @param request A container for the necessary parameters to execute the GetApnsSandboxChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetApnsSandboxChannelRequest
 @see AWSPinpointTargetingGetApnsSandboxChannelResponse
 */
- (void)getApnsSandboxChannel:(AWSPinpointTargetingGetApnsSandboxChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetApnsSandboxChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Get an APNS VoIP channel
 
 @param request A container for the necessary parameters to execute the GetApnsVoipChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetApnsVoipChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetApnsVoipChannelRequest
 @see AWSPinpointTargetingGetApnsVoipChannelResponse
 */
- (AWSTask<AWSPinpointTargetingGetApnsVoipChannelResponse *> *)getApnsVoipChannel:(AWSPinpointTargetingGetApnsVoipChannelRequest *)request;

/**
 Get an APNS VoIP channel
 
 @param request A container for the necessary parameters to execute the GetApnsVoipChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetApnsVoipChannelRequest
 @see AWSPinpointTargetingGetApnsVoipChannelResponse
 */
- (void)getApnsVoipChannel:(AWSPinpointTargetingGetApnsVoipChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetApnsVoipChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Get an APNS VoIPSandbox channel
 
 @param request A container for the necessary parameters to execute the GetApnsVoipSandboxChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetApnsVoipSandboxChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetApnsVoipSandboxChannelRequest
 @see AWSPinpointTargetingGetApnsVoipSandboxChannelResponse
 */
- (AWSTask<AWSPinpointTargetingGetApnsVoipSandboxChannelResponse *> *)getApnsVoipSandboxChannel:(AWSPinpointTargetingGetApnsVoipSandboxChannelRequest *)request;

/**
 Get an APNS VoIPSandbox channel
 
 @param request A container for the necessary parameters to execute the GetApnsVoipSandboxChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetApnsVoipSandboxChannelRequest
 @see AWSPinpointTargetingGetApnsVoipSandboxChannelResponse
 */
- (void)getApnsVoipSandboxChannel:(AWSPinpointTargetingGetApnsVoipSandboxChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetApnsVoipSandboxChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about an app.
 
 @param request A container for the necessary parameters to execute the GetApp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetAppResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetAppRequest
 @see AWSPinpointTargetingGetAppResponse
 */
- (AWSTask<AWSPinpointTargetingGetAppResponse *> *)getApp:(AWSPinpointTargetingGetAppRequest *)request;

/**
 Returns information about an app.
 
 @param request A container for the necessary parameters to execute the GetApp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetAppRequest
 @see AWSPinpointTargetingGetAppResponse
 */
- (void)getApp:(AWSPinpointTargetingGetAppRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetAppResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 Returns information about your apps.
 
 @param request A container for the necessary parameters to execute the GetApps service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetAppsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetAppsRequest
 @see AWSPinpointTargetingGetAppsResponse
 */
- (AWSTask<AWSPinpointTargetingGetAppsResponse *> *)getApps:(AWSPinpointTargetingGetAppsRequest *)request;

/**
 Returns information about your apps.
 
 @param request A container for the necessary parameters to execute the GetApps service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetAppsRequest
 @see AWSPinpointTargetingGetAppsResponse
 */
- (void)getApps:(AWSPinpointTargetingGetAppsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetAppsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Get a BAIDU GCM channel
 
 @param request A container for the necessary parameters to execute the GetBaiduChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetBaiduChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetBaiduChannelRequest
 @see AWSPinpointTargetingGetBaiduChannelResponse
 */
- (AWSTask<AWSPinpointTargetingGetBaiduChannelResponse *> *)getBaiduChannel:(AWSPinpointTargetingGetBaiduChannelRequest *)request;

/**
 Get a BAIDU GCM channel
 
 @param request A container for the necessary parameters to execute the GetBaiduChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetBaiduChannelRequest
 @see AWSPinpointTargetingGetBaiduChannelResponse
 */
- (void)getBaiduChannel:(AWSPinpointTargetingGetBaiduChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetBaiduChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 Returns information about a specific version of a campaign.
 
 @param request A container for the necessary parameters to execute the GetCampaignVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetCampaignVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetCampaignVersionRequest
 @see AWSPinpointTargetingGetCampaignVersionResponse
 */
- (AWSTask<AWSPinpointTargetingGetCampaignVersionResponse *> *)getCampaignVersion:(AWSPinpointTargetingGetCampaignVersionRequest *)request;

/**
 Returns information about a specific version of a campaign.
 
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
 Get all channels.
 
 @param request A container for the necessary parameters to execute the GetChannels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetChannelsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetChannelsRequest
 @see AWSPinpointTargetingGetChannelsResponse
 */
- (AWSTask<AWSPinpointTargetingGetChannelsResponse *> *)getChannels:(AWSPinpointTargetingGetChannelsRequest *)request;

/**
 Get all channels.
 
 @param request A container for the necessary parameters to execute the GetChannels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetChannelsRequest
 @see AWSPinpointTargetingGetChannelsResponse
 */
- (void)getChannels:(AWSPinpointTargetingGetChannelsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetChannelsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Get an email channel.
 
 @param request A container for the necessary parameters to execute the GetEmailChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetEmailChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetEmailChannelRequest
 @see AWSPinpointTargetingGetEmailChannelResponse
 */
- (AWSTask<AWSPinpointTargetingGetEmailChannelResponse *> *)getEmailChannel:(AWSPinpointTargetingGetEmailChannelRequest *)request;

/**
 Get an email channel.
 
 @param request A container for the necessary parameters to execute the GetEmailChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetEmailChannelRequest
 @see AWSPinpointTargetingGetEmailChannelResponse
 */
- (void)getEmailChannel:(AWSPinpointTargetingGetEmailChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetEmailChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 Returns the event stream for an app.
 
 @param request A container for the necessary parameters to execute the GetEventStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetEventStreamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetEventStreamRequest
 @see AWSPinpointTargetingGetEventStreamResponse
 */
- (AWSTask<AWSPinpointTargetingGetEventStreamResponse *> *)getEventStream:(AWSPinpointTargetingGetEventStreamRequest *)request;

/**
 Returns the event stream for an app.
 
 @param request A container for the necessary parameters to execute the GetEventStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetEventStreamRequest
 @see AWSPinpointTargetingGetEventStreamResponse
 */
- (void)getEventStream:(AWSPinpointTargetingGetEventStreamRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetEventStreamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about an export job.
 
 @param request A container for the necessary parameters to execute the GetExportJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetExportJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetExportJobRequest
 @see AWSPinpointTargetingGetExportJobResponse
 */
- (AWSTask<AWSPinpointTargetingGetExportJobResponse *> *)getExportJob:(AWSPinpointTargetingGetExportJobRequest *)request;

/**
 Returns information about an export job.
 
 @param request A container for the necessary parameters to execute the GetExportJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetExportJobRequest
 @see AWSPinpointTargetingGetExportJobResponse
 */
- (void)getExportJob:(AWSPinpointTargetingGetExportJobRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetExportJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about your export jobs.
 
 @param request A container for the necessary parameters to execute the GetExportJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetExportJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetExportJobsRequest
 @see AWSPinpointTargetingGetExportJobsResponse
 */
- (AWSTask<AWSPinpointTargetingGetExportJobsResponse *> *)getExportJobs:(AWSPinpointTargetingGetExportJobsRequest *)request;

/**
 Returns information about your export jobs.
 
 @param request A container for the necessary parameters to execute the GetExportJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetExportJobsRequest
 @see AWSPinpointTargetingGetExportJobsResponse
 */
- (void)getExportJobs:(AWSPinpointTargetingGetExportJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetExportJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 Returns a list of export jobs for a specific segment.
 
 @param request A container for the necessary parameters to execute the GetSegmentExportJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetSegmentExportJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSegmentExportJobsRequest
 @see AWSPinpointTargetingGetSegmentExportJobsResponse
 */
- (AWSTask<AWSPinpointTargetingGetSegmentExportJobsResponse *> *)getSegmentExportJobs:(AWSPinpointTargetingGetSegmentExportJobsRequest *)request;

/**
 Returns a list of export jobs for a specific segment.
 
 @param request A container for the necessary parameters to execute the GetSegmentExportJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSegmentExportJobsRequest
 @see AWSPinpointTargetingGetSegmentExportJobsResponse
 */
- (void)getSegmentExportJobs:(AWSPinpointTargetingGetSegmentExportJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetSegmentExportJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 Get an SMS channel.
 
 @param request A container for the necessary parameters to execute the GetSmsChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetSmsChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSmsChannelRequest
 @see AWSPinpointTargetingGetSmsChannelResponse
 */
- (AWSTask<AWSPinpointTargetingGetSmsChannelResponse *> *)getSmsChannel:(AWSPinpointTargetingGetSmsChannelRequest *)request;

/**
 Get an SMS channel.
 
 @param request A container for the necessary parameters to execute the GetSmsChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSmsChannelRequest
 @see AWSPinpointTargetingGetSmsChannelResponse
 */
- (void)getSmsChannel:(AWSPinpointTargetingGetSmsChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetSmsChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about the endpoints that are associated with a User ID.
 
 @param request A container for the necessary parameters to execute the GetUserEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetUserEndpointsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetUserEndpointsRequest
 @see AWSPinpointTargetingGetUserEndpointsResponse
 */
- (AWSTask<AWSPinpointTargetingGetUserEndpointsResponse *> *)getUserEndpoints:(AWSPinpointTargetingGetUserEndpointsRequest *)request;

/**
 Returns information about the endpoints that are associated with a User ID.
 
 @param request A container for the necessary parameters to execute the GetUserEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetUserEndpointsRequest
 @see AWSPinpointTargetingGetUserEndpointsResponse
 */
- (void)getUserEndpoints:(AWSPinpointTargetingGetUserEndpointsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetUserEndpointsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Get a Voice Channel
 
 @param request A container for the necessary parameters to execute the GetVoiceChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetVoiceChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetVoiceChannelRequest
 @see AWSPinpointTargetingGetVoiceChannelResponse
 */
- (AWSTask<AWSPinpointTargetingGetVoiceChannelResponse *> *)getVoiceChannel:(AWSPinpointTargetingGetVoiceChannelRequest *)request;

/**
 Get a Voice Channel
 
 @param request A container for the necessary parameters to execute the GetVoiceChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetVoiceChannelRequest
 @see AWSPinpointTargetingGetVoiceChannelResponse
 */
- (void)getVoiceChannel:(AWSPinpointTargetingGetVoiceChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetVoiceChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns information about the specified phone number.
 
 @param request A container for the necessary parameters to execute the PhoneNumberValidate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingPhoneNumberValidateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingPhoneNumberValidateRequest
 @see AWSPinpointTargetingPhoneNumberValidateResponse
 */
- (AWSTask<AWSPinpointTargetingPhoneNumberValidateResponse *> *)phoneNumberValidate:(AWSPinpointTargetingPhoneNumberValidateRequest *)request;

/**
 Returns information about the specified phone number.
 
 @param request A container for the necessary parameters to execute the PhoneNumberValidate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingPhoneNumberValidateRequest
 @see AWSPinpointTargetingPhoneNumberValidateResponse
 */
- (void)phoneNumberValidate:(AWSPinpointTargetingPhoneNumberValidateRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingPhoneNumberValidateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Use to create or update the event stream for an app.
 
 @param request A container for the necessary parameters to execute the PutEventStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingPutEventStreamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingPutEventStreamRequest
 @see AWSPinpointTargetingPutEventStreamResponse
 */
- (AWSTask<AWSPinpointTargetingPutEventStreamResponse *> *)putEventStream:(AWSPinpointTargetingPutEventStreamRequest *)request;

/**
 Use to create or update the event stream for an app.
 
 @param request A container for the necessary parameters to execute the PutEventStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingPutEventStreamRequest
 @see AWSPinpointTargetingPutEventStreamResponse
 */
- (void)putEventStream:(AWSPinpointTargetingPutEventStreamRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingPutEventStreamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Use to record events for endpoints. This method creates events and creates or updates the endpoints that those events are associated with.
 
 @param request A container for the necessary parameters to execute the PutEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingPutEventsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingPutEventsRequest
 @see AWSPinpointTargetingPutEventsResponse
 */
- (AWSTask<AWSPinpointTargetingPutEventsResponse *> *)putEvents:(AWSPinpointTargetingPutEventsRequest *)request;

/**
 Use to record events for endpoints. This method creates events and creates or updates the endpoints that those events are associated with.
 
 @param request A container for the necessary parameters to execute the PutEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingPutEventsRequest
 @see AWSPinpointTargetingPutEventsResponse
 */
- (void)putEvents:(AWSPinpointTargetingPutEventsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingPutEventsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Used to remove the attributes for an app
 
 @param request A container for the necessary parameters to execute the RemoveAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingRemoveAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingRemoveAttributesRequest
 @see AWSPinpointTargetingRemoveAttributesResponse
 */
- (AWSTask<AWSPinpointTargetingRemoveAttributesResponse *> *)removeAttributes:(AWSPinpointTargetingRemoveAttributesRequest *)request;

/**
 Used to remove the attributes for an app
 
 @param request A container for the necessary parameters to execute the RemoveAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingRemoveAttributesRequest
 @see AWSPinpointTargetingRemoveAttributesResponse
 */
- (void)removeAttributes:(AWSPinpointTargetingRemoveAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingRemoveAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Used to send a direct message.
 
 @param request A container for the necessary parameters to execute the SendMessages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingSendMessagesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingSendMessagesRequest
 @see AWSPinpointTargetingSendMessagesResponse
 */
- (AWSTask<AWSPinpointTargetingSendMessagesResponse *> *)sendMessages:(AWSPinpointTargetingSendMessagesRequest *)request;

/**
 Used to send a direct message.
 
 @param request A container for the necessary parameters to execute the SendMessages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingSendMessagesRequest
 @see AWSPinpointTargetingSendMessagesResponse
 */
- (void)sendMessages:(AWSPinpointTargetingSendMessagesRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingSendMessagesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Used to send a message to a list of users.
 
 @param request A container for the necessary parameters to execute the SendUsersMessages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingSendUsersMessagesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingSendUsersMessagesRequest
 @see AWSPinpointTargetingSendUsersMessagesResponse
 */
- (AWSTask<AWSPinpointTargetingSendUsersMessagesResponse *> *)sendUsersMessages:(AWSPinpointTargetingSendUsersMessagesRequest *)request;

/**
 Used to send a message to a list of users.
 
 @param request A container for the necessary parameters to execute the SendUsersMessages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingSendUsersMessagesRequest
 @see AWSPinpointTargetingSendUsersMessagesResponse
 */
- (void)sendUsersMessages:(AWSPinpointTargetingSendUsersMessagesRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingSendUsersMessagesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Update an ADM channel.
 
 @param request A container for the necessary parameters to execute the UpdateAdmChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateAdmChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateAdmChannelRequest
 @see AWSPinpointTargetingUpdateAdmChannelResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateAdmChannelResponse *> *)updateAdmChannel:(AWSPinpointTargetingUpdateAdmChannelRequest *)request;

/**
 Update an ADM channel.
 
 @param request A container for the necessary parameters to execute the UpdateAdmChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateAdmChannelRequest
 @see AWSPinpointTargetingUpdateAdmChannelResponse
 */
- (void)updateAdmChannel:(AWSPinpointTargetingUpdateAdmChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateAdmChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 Update an APNS sandbox channel.
 
 @param request A container for the necessary parameters to execute the UpdateApnsSandboxChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateApnsSandboxChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateApnsSandboxChannelRequest
 @see AWSPinpointTargetingUpdateApnsSandboxChannelResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateApnsSandboxChannelResponse *> *)updateApnsSandboxChannel:(AWSPinpointTargetingUpdateApnsSandboxChannelRequest *)request;

/**
 Update an APNS sandbox channel.
 
 @param request A container for the necessary parameters to execute the UpdateApnsSandboxChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateApnsSandboxChannelRequest
 @see AWSPinpointTargetingUpdateApnsSandboxChannelResponse
 */
- (void)updateApnsSandboxChannel:(AWSPinpointTargetingUpdateApnsSandboxChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateApnsSandboxChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Update an APNS VoIP channel
 
 @param request A container for the necessary parameters to execute the UpdateApnsVoipChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateApnsVoipChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateApnsVoipChannelRequest
 @see AWSPinpointTargetingUpdateApnsVoipChannelResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateApnsVoipChannelResponse *> *)updateApnsVoipChannel:(AWSPinpointTargetingUpdateApnsVoipChannelRequest *)request;

/**
 Update an APNS VoIP channel
 
 @param request A container for the necessary parameters to execute the UpdateApnsVoipChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateApnsVoipChannelRequest
 @see AWSPinpointTargetingUpdateApnsVoipChannelResponse
 */
- (void)updateApnsVoipChannel:(AWSPinpointTargetingUpdateApnsVoipChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateApnsVoipChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Update an APNS VoIP sandbox channel
 
 @param request A container for the necessary parameters to execute the UpdateApnsVoipSandboxChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateApnsVoipSandboxChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateApnsVoipSandboxChannelRequest
 @see AWSPinpointTargetingUpdateApnsVoipSandboxChannelResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateApnsVoipSandboxChannelResponse *> *)updateApnsVoipSandboxChannel:(AWSPinpointTargetingUpdateApnsVoipSandboxChannelRequest *)request;

/**
 Update an APNS VoIP sandbox channel
 
 @param request A container for the necessary parameters to execute the UpdateApnsVoipSandboxChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateApnsVoipSandboxChannelRequest
 @see AWSPinpointTargetingUpdateApnsVoipSandboxChannelResponse
 */
- (void)updateApnsVoipSandboxChannel:(AWSPinpointTargetingUpdateApnsVoipSandboxChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateApnsVoipSandboxChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 Update a BAIDU GCM channel
 
 @param request A container for the necessary parameters to execute the UpdateBaiduChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateBaiduChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateBaiduChannelRequest
 @see AWSPinpointTargetingUpdateBaiduChannelResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateBaiduChannelResponse *> *)updateBaiduChannel:(AWSPinpointTargetingUpdateBaiduChannelRequest *)request;

/**
 Update a BAIDU GCM channel
 
 @param request A container for the necessary parameters to execute the UpdateBaiduChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateBaiduChannelRequest
 @see AWSPinpointTargetingUpdateBaiduChannelResponse
 */
- (void)updateBaiduChannel:(AWSPinpointTargetingUpdateBaiduChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateBaiduChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 Update an email channel.
 
 @param request A container for the necessary parameters to execute the UpdateEmailChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateEmailChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateEmailChannelRequest
 @see AWSPinpointTargetingUpdateEmailChannelResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateEmailChannelResponse *> *)updateEmailChannel:(AWSPinpointTargetingUpdateEmailChannelRequest *)request;

/**
 Update an email channel.
 
 @param request A container for the necessary parameters to execute the UpdateEmailChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateEmailChannelRequest
 @see AWSPinpointTargetingUpdateEmailChannelResponse
 */
- (void)updateEmailChannel:(AWSPinpointTargetingUpdateEmailChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateEmailChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Creates or updates an endpoint.
 
 @param request A container for the necessary parameters to execute the UpdateEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateEndpointRequest
 @see AWSPinpointTargetingUpdateEndpointResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateEndpointResponse *> *)updateEndpoint:(AWSPinpointTargetingUpdateEndpointRequest *)request;

/**
 Creates or updates an endpoint.
 
 @param request A container for the necessary parameters to execute the UpdateEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateEndpointRequest
 @see AWSPinpointTargetingUpdateEndpointResponse
 */
- (void)updateEndpoint:(AWSPinpointTargetingUpdateEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Use to update a batch of endpoints.
 
 @param request A container for the necessary parameters to execute the UpdateEndpointsBatch service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateEndpointsBatchResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateEndpointsBatchRequest
 @see AWSPinpointTargetingUpdateEndpointsBatchResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateEndpointsBatchResponse *> *)updateEndpointsBatch:(AWSPinpointTargetingUpdateEndpointsBatchRequest *)request;

/**
 Use to update a batch of endpoints.
 
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
 Used to update a segment.
 
 @param request A container for the necessary parameters to execute the UpdateSegment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateSegmentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateSegmentRequest
 @see AWSPinpointTargetingUpdateSegmentResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateSegmentResponse *> *)updateSegment:(AWSPinpointTargetingUpdateSegmentRequest *)request;

/**
 Used to update a segment.
 
 @param request A container for the necessary parameters to execute the UpdateSegment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateSegmentRequest
 @see AWSPinpointTargetingUpdateSegmentResponse
 */
- (void)updateSegment:(AWSPinpointTargetingUpdateSegmentRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateSegmentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Update an SMS channel.
 
 @param request A container for the necessary parameters to execute the UpdateSmsChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateSmsChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateSmsChannelRequest
 @see AWSPinpointTargetingUpdateSmsChannelResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateSmsChannelResponse *> *)updateSmsChannel:(AWSPinpointTargetingUpdateSmsChannelRequest *)request;

/**
 Update an SMS channel.
 
 @param request A container for the necessary parameters to execute the UpdateSmsChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateSmsChannelRequest
 @see AWSPinpointTargetingUpdateSmsChannelResponse
 */
- (void)updateSmsChannel:(AWSPinpointTargetingUpdateSmsChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateSmsChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Update an Voice channel
 
 @param request A container for the necessary parameters to execute the UpdateVoiceChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateVoiceChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateVoiceChannelRequest
 @see AWSPinpointTargetingUpdateVoiceChannelResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateVoiceChannelResponse *> *)updateVoiceChannel:(AWSPinpointTargetingUpdateVoiceChannelRequest *)request;

/**
 Update an Voice channel
 
 @param request A container for the necessary parameters to execute the UpdateVoiceChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateVoiceChannelRequest
 @see AWSPinpointTargetingUpdateVoiceChannelResponse
 */
- (void)updateVoiceChannel:(AWSPinpointTargetingUpdateVoiceChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateVoiceChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
