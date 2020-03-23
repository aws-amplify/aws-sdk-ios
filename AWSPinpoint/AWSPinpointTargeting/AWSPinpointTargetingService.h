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
#import "AWSPinpointTargetingModel.h"
#import "AWSPinpointTargetingResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSPinpointTargeting
FOUNDATION_EXPORT NSString *const AWSPinpointTargetingSDKVersion;

/**
 <p>Doc Engage API - Amazon Pinpoint API</p>
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
  <p>Creates an application.</p>
 
 @param request A container for the necessary parameters to execute the CreateApp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingCreateAppResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingCreateAppRequest
 @see AWSPinpointTargetingCreateAppResponse
 */
- (AWSTask<AWSPinpointTargetingCreateAppResponse *> *)createApp:(AWSPinpointTargetingCreateAppRequest *)request;

/**
  <p>Creates an application.</p>
 
 @param request A container for the necessary parameters to execute the CreateApp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingCreateAppRequest
 @see AWSPinpointTargetingCreateAppResponse
 */
- (void)createApp:(AWSPinpointTargetingCreateAppRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingCreateAppResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new campaign for an application or updates the settings of an existing campaign for an application.</p>
 
 @param request A container for the necessary parameters to execute the CreateCampaign service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingCreateCampaignResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingCreateCampaignRequest
 @see AWSPinpointTargetingCreateCampaignResponse
 */
- (AWSTask<AWSPinpointTargetingCreateCampaignResponse *> *)createCampaign:(AWSPinpointTargetingCreateCampaignRequest *)request;

/**
 <p>Creates a new campaign for an application or updates the settings of an existing campaign for an application.</p>
 
 @param request A container for the necessary parameters to execute the CreateCampaign service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingCreateCampaignRequest
 @see AWSPinpointTargetingCreateCampaignResponse
 */
- (void)createCampaign:(AWSPinpointTargetingCreateCampaignRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingCreateCampaignResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a message template for messages that are sent through the email channel.</p>
 
 @param request A container for the necessary parameters to execute the CreateEmailTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingCreateEmailTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`, `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`.
 
 @see AWSPinpointTargetingCreateEmailTemplateRequest
 @see AWSPinpointTargetingCreateEmailTemplateResponse
 */
- (AWSTask<AWSPinpointTargetingCreateEmailTemplateResponse *> *)createEmailTemplate:(AWSPinpointTargetingCreateEmailTemplateRequest *)request;

/**
 <p>Creates a message template for messages that are sent through the email channel.</p>
 
 @param request A container for the necessary parameters to execute the CreateEmailTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`, `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`.
 
 @see AWSPinpointTargetingCreateEmailTemplateRequest
 @see AWSPinpointTargetingCreateEmailTemplateResponse
 */
- (void)createEmailTemplate:(AWSPinpointTargetingCreateEmailTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingCreateEmailTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an export job for an application.</p>
 
 @param request A container for the necessary parameters to execute the CreateExportJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingCreateExportJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingCreateExportJobRequest
 @see AWSPinpointTargetingCreateExportJobResponse
 */
- (AWSTask<AWSPinpointTargetingCreateExportJobResponse *> *)createExportJob:(AWSPinpointTargetingCreateExportJobRequest *)request;

/**
 <p>Creates an export job for an application.</p>
 
 @param request A container for the necessary parameters to execute the CreateExportJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingCreateExportJobRequest
 @see AWSPinpointTargetingCreateExportJobResponse
 */
- (void)createExportJob:(AWSPinpointTargetingCreateExportJobRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingCreateExportJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an import job for an application.</p>
 
 @param request A container for the necessary parameters to execute the CreateImportJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingCreateImportJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingCreateImportJobRequest
 @see AWSPinpointTargetingCreateImportJobResponse
 */
- (AWSTask<AWSPinpointTargetingCreateImportJobResponse *> *)createImportJob:(AWSPinpointTargetingCreateImportJobRequest *)request;

/**
 <p>Creates an import job for an application.</p>
 
 @param request A container for the necessary parameters to execute the CreateImportJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingCreateImportJobRequest
 @see AWSPinpointTargetingCreateImportJobResponse
 */
- (void)createImportJob:(AWSPinpointTargetingCreateImportJobRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingCreateImportJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a journey for an application.</p>
 
 @param request A container for the necessary parameters to execute the CreateJourney service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingCreateJourneyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingCreateJourneyRequest
 @see AWSPinpointTargetingCreateJourneyResponse
 */
- (AWSTask<AWSPinpointTargetingCreateJourneyResponse *> *)createJourney:(AWSPinpointTargetingCreateJourneyRequest *)request;

/**
 <p>Creates a journey for an application.</p>
 
 @param request A container for the necessary parameters to execute the CreateJourney service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingCreateJourneyRequest
 @see AWSPinpointTargetingCreateJourneyResponse
 */
- (void)createJourney:(AWSPinpointTargetingCreateJourneyRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingCreateJourneyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a message template for messages that are sent through a push notification channel.</p>
 
 @param request A container for the necessary parameters to execute the CreatePushTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingCreatePushTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`, `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`.
 
 @see AWSPinpointTargetingCreatePushTemplateRequest
 @see AWSPinpointTargetingCreatePushTemplateResponse
 */
- (AWSTask<AWSPinpointTargetingCreatePushTemplateResponse *> *)createPushTemplate:(AWSPinpointTargetingCreatePushTemplateRequest *)request;

/**
 <p>Creates a message template for messages that are sent through a push notification channel.</p>
 
 @param request A container for the necessary parameters to execute the CreatePushTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`, `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`.
 
 @see AWSPinpointTargetingCreatePushTemplateRequest
 @see AWSPinpointTargetingCreatePushTemplateResponse
 */
- (void)createPushTemplate:(AWSPinpointTargetingCreatePushTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingCreatePushTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon Pinpoint configuration for a recommender model.</p>
 
 @param request A container for the necessary parameters to execute the CreateRecommenderConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingCreateRecommenderConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingCreateRecommenderConfigurationRequest
 @see AWSPinpointTargetingCreateRecommenderConfigurationResponse
 */
- (AWSTask<AWSPinpointTargetingCreateRecommenderConfigurationResponse *> *)createRecommenderConfiguration:(AWSPinpointTargetingCreateRecommenderConfigurationRequest *)request;

/**
 <p>Creates an Amazon Pinpoint configuration for a recommender model.</p>
 
 @param request A container for the necessary parameters to execute the CreateRecommenderConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingCreateRecommenderConfigurationRequest
 @see AWSPinpointTargetingCreateRecommenderConfigurationResponse
 */
- (void)createRecommenderConfiguration:(AWSPinpointTargetingCreateRecommenderConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingCreateRecommenderConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new segment for an application or updates the configuration, dimension, and other settings for an existing segment that's associated with an application.</p>
 
 @param request A container for the necessary parameters to execute the CreateSegment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingCreateSegmentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingCreateSegmentRequest
 @see AWSPinpointTargetingCreateSegmentResponse
 */
- (AWSTask<AWSPinpointTargetingCreateSegmentResponse *> *)createSegment:(AWSPinpointTargetingCreateSegmentRequest *)request;

/**
 <p>Creates a new segment for an application or updates the configuration, dimension, and other settings for an existing segment that's associated with an application.</p>
 
 @param request A container for the necessary parameters to execute the CreateSegment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingCreateSegmentRequest
 @see AWSPinpointTargetingCreateSegmentResponse
 */
- (void)createSegment:(AWSPinpointTargetingCreateSegmentRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingCreateSegmentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a message template for messages that are sent through the SMS channel.</p>
 
 @param request A container for the necessary parameters to execute the CreateSmsTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingCreateSmsTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`, `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`.
 
 @see AWSPinpointTargetingCreateSmsTemplateRequest
 @see AWSPinpointTargetingCreateSmsTemplateResponse
 */
- (AWSTask<AWSPinpointTargetingCreateSmsTemplateResponse *> *)createSmsTemplate:(AWSPinpointTargetingCreateSmsTemplateRequest *)request;

/**
 <p>Creates a message template for messages that are sent through the SMS channel.</p>
 
 @param request A container for the necessary parameters to execute the CreateSmsTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`, `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`.
 
 @see AWSPinpointTargetingCreateSmsTemplateRequest
 @see AWSPinpointTargetingCreateSmsTemplateResponse
 */
- (void)createSmsTemplate:(AWSPinpointTargetingCreateSmsTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingCreateSmsTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a message template for messages that are sent through the voice channel.</p>
 
 @param request A container for the necessary parameters to execute the CreateVoiceTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingCreateVoiceTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`, `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`.
 
 @see AWSPinpointTargetingCreateVoiceTemplateRequest
 @see AWSPinpointTargetingCreateVoiceTemplateResponse
 */
- (AWSTask<AWSPinpointTargetingCreateVoiceTemplateResponse *> *)createVoiceTemplate:(AWSPinpointTargetingCreateVoiceTemplateRequest *)request;

/**
 <p>Creates a message template for messages that are sent through the voice channel.</p>
 
 @param request A container for the necessary parameters to execute the CreateVoiceTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`, `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`.
 
 @see AWSPinpointTargetingCreateVoiceTemplateRequest
 @see AWSPinpointTargetingCreateVoiceTemplateResponse
 */
- (void)createVoiceTemplate:(AWSPinpointTargetingCreateVoiceTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingCreateVoiceTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables the ADM channel for an application and deletes any existing settings for the channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAdmChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteAdmChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteAdmChannelRequest
 @see AWSPinpointTargetingDeleteAdmChannelResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteAdmChannelResponse *> *)deleteAdmChannel:(AWSPinpointTargetingDeleteAdmChannelRequest *)request;

/**
 <p>Disables the ADM channel for an application and deletes any existing settings for the channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAdmChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteAdmChannelRequest
 @see AWSPinpointTargetingDeleteAdmChannelResponse
 */
- (void)deleteAdmChannel:(AWSPinpointTargetingDeleteAdmChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteAdmChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables the APNs channel for an application and deletes any existing settings for the channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApnsChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteApnsChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteApnsChannelRequest
 @see AWSPinpointTargetingDeleteApnsChannelResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteApnsChannelResponse *> *)deleteApnsChannel:(AWSPinpointTargetingDeleteApnsChannelRequest *)request;

/**
 <p>Disables the APNs channel for an application and deletes any existing settings for the channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApnsChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteApnsChannelRequest
 @see AWSPinpointTargetingDeleteApnsChannelResponse
 */
- (void)deleteApnsChannel:(AWSPinpointTargetingDeleteApnsChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteApnsChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables the APNs sandbox channel for an application and deletes any existing settings for the channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApnsSandboxChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteApnsSandboxChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteApnsSandboxChannelRequest
 @see AWSPinpointTargetingDeleteApnsSandboxChannelResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteApnsSandboxChannelResponse *> *)deleteApnsSandboxChannel:(AWSPinpointTargetingDeleteApnsSandboxChannelRequest *)request;

/**
 <p>Disables the APNs sandbox channel for an application and deletes any existing settings for the channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApnsSandboxChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteApnsSandboxChannelRequest
 @see AWSPinpointTargetingDeleteApnsSandboxChannelResponse
 */
- (void)deleteApnsSandboxChannel:(AWSPinpointTargetingDeleteApnsSandboxChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteApnsSandboxChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables the APNs VoIP channel for an application and deletes any existing settings for the channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApnsVoipChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteApnsVoipChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteApnsVoipChannelRequest
 @see AWSPinpointTargetingDeleteApnsVoipChannelResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteApnsVoipChannelResponse *> *)deleteApnsVoipChannel:(AWSPinpointTargetingDeleteApnsVoipChannelRequest *)request;

/**
 <p>Disables the APNs VoIP channel for an application and deletes any existing settings for the channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApnsVoipChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteApnsVoipChannelRequest
 @see AWSPinpointTargetingDeleteApnsVoipChannelResponse
 */
- (void)deleteApnsVoipChannel:(AWSPinpointTargetingDeleteApnsVoipChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteApnsVoipChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables the APNs VoIP sandbox channel for an application and deletes any existing settings for the channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApnsVoipSandboxChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteApnsVoipSandboxChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteApnsVoipSandboxChannelRequest
 @see AWSPinpointTargetingDeleteApnsVoipSandboxChannelResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteApnsVoipSandboxChannelResponse *> *)deleteApnsVoipSandboxChannel:(AWSPinpointTargetingDeleteApnsVoipSandboxChannelRequest *)request;

/**
 <p>Disables the APNs VoIP sandbox channel for an application and deletes any existing settings for the channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApnsVoipSandboxChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteApnsVoipSandboxChannelRequest
 @see AWSPinpointTargetingDeleteApnsVoipSandboxChannelResponse
 */
- (void)deleteApnsVoipSandboxChannel:(AWSPinpointTargetingDeleteApnsVoipSandboxChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteApnsVoipSandboxChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an application.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteAppResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteAppRequest
 @see AWSPinpointTargetingDeleteAppResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteAppResponse *> *)deleteApp:(AWSPinpointTargetingDeleteAppRequest *)request;

/**
 <p>Deletes an application.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteAppRequest
 @see AWSPinpointTargetingDeleteAppResponse
 */
- (void)deleteApp:(AWSPinpointTargetingDeleteAppRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteAppResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables the Baidu channel for an application and deletes any existing settings for the channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBaiduChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteBaiduChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteBaiduChannelRequest
 @see AWSPinpointTargetingDeleteBaiduChannelResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteBaiduChannelResponse *> *)deleteBaiduChannel:(AWSPinpointTargetingDeleteBaiduChannelRequest *)request;

/**
 <p>Disables the Baidu channel for an application and deletes any existing settings for the channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBaiduChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteBaiduChannelRequest
 @see AWSPinpointTargetingDeleteBaiduChannelResponse
 */
- (void)deleteBaiduChannel:(AWSPinpointTargetingDeleteBaiduChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteBaiduChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a campaign from an application.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCampaign service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteCampaignResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteCampaignRequest
 @see AWSPinpointTargetingDeleteCampaignResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteCampaignResponse *> *)deleteCampaign:(AWSPinpointTargetingDeleteCampaignRequest *)request;

/**
 <p>Deletes a campaign from an application.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCampaign service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteCampaignRequest
 @see AWSPinpointTargetingDeleteCampaignResponse
 */
- (void)deleteCampaign:(AWSPinpointTargetingDeleteCampaignRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteCampaignResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables the email channel for an application and deletes any existing settings for the channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEmailChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteEmailChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteEmailChannelRequest
 @see AWSPinpointTargetingDeleteEmailChannelResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteEmailChannelResponse *> *)deleteEmailChannel:(AWSPinpointTargetingDeleteEmailChannelRequest *)request;

/**
 <p>Disables the email channel for an application and deletes any existing settings for the channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEmailChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteEmailChannelRequest
 @see AWSPinpointTargetingDeleteEmailChannelResponse
 */
- (void)deleteEmailChannel:(AWSPinpointTargetingDeleteEmailChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteEmailChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a message template for messages that were sent through the email channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEmailTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteEmailTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteEmailTemplateRequest
 @see AWSPinpointTargetingDeleteEmailTemplateResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteEmailTemplateResponse *> *)deleteEmailTemplate:(AWSPinpointTargetingDeleteEmailTemplateRequest *)request;

/**
 <p>Deletes a message template for messages that were sent through the email channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEmailTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteEmailTemplateRequest
 @see AWSPinpointTargetingDeleteEmailTemplateResponse
 */
- (void)deleteEmailTemplate:(AWSPinpointTargetingDeleteEmailTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteEmailTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an endpoint from an application.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteEndpointRequest
 @see AWSPinpointTargetingDeleteEndpointResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteEndpointResponse *> *)deleteEndpoint:(AWSPinpointTargetingDeleteEndpointRequest *)request;

/**
 <p>Deletes an endpoint from an application.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteEndpointRequest
 @see AWSPinpointTargetingDeleteEndpointResponse
 */
- (void)deleteEndpoint:(AWSPinpointTargetingDeleteEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the event stream for an application.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEventStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteEventStreamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteEventStreamRequest
 @see AWSPinpointTargetingDeleteEventStreamResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteEventStreamResponse *> *)deleteEventStream:(AWSPinpointTargetingDeleteEventStreamRequest *)request;

/**
 <p>Deletes the event stream for an application.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEventStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteEventStreamRequest
 @see AWSPinpointTargetingDeleteEventStreamResponse
 */
- (void)deleteEventStream:(AWSPinpointTargetingDeleteEventStreamRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteEventStreamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables the GCM channel for an application and deletes any existing settings for the channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteGcmChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteGcmChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteGcmChannelRequest
 @see AWSPinpointTargetingDeleteGcmChannelResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteGcmChannelResponse *> *)deleteGcmChannel:(AWSPinpointTargetingDeleteGcmChannelRequest *)request;

/**
 <p>Disables the GCM channel for an application and deletes any existing settings for the channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteGcmChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteGcmChannelRequest
 @see AWSPinpointTargetingDeleteGcmChannelResponse
 */
- (void)deleteGcmChannel:(AWSPinpointTargetingDeleteGcmChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteGcmChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a journey from an application.</p>
 
 @param request A container for the necessary parameters to execute the DeleteJourney service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteJourneyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteJourneyRequest
 @see AWSPinpointTargetingDeleteJourneyResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteJourneyResponse *> *)deleteJourney:(AWSPinpointTargetingDeleteJourneyRequest *)request;

/**
 <p>Deletes a journey from an application.</p>
 
 @param request A container for the necessary parameters to execute the DeleteJourney service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteJourneyRequest
 @see AWSPinpointTargetingDeleteJourneyResponse
 */
- (void)deleteJourney:(AWSPinpointTargetingDeleteJourneyRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteJourneyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a message template for messages that were sent through a push notification channel.</p>
 
 @param request A container for the necessary parameters to execute the DeletePushTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeletePushTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeletePushTemplateRequest
 @see AWSPinpointTargetingDeletePushTemplateResponse
 */
- (AWSTask<AWSPinpointTargetingDeletePushTemplateResponse *> *)deletePushTemplate:(AWSPinpointTargetingDeletePushTemplateRequest *)request;

/**
 <p>Deletes a message template for messages that were sent through a push notification channel.</p>
 
 @param request A container for the necessary parameters to execute the DeletePushTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeletePushTemplateRequest
 @see AWSPinpointTargetingDeletePushTemplateResponse
 */
- (void)deletePushTemplate:(AWSPinpointTargetingDeletePushTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeletePushTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an Amazon Pinpoint configuration for a recommender model.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRecommenderConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteRecommenderConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteRecommenderConfigurationRequest
 @see AWSPinpointTargetingDeleteRecommenderConfigurationResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteRecommenderConfigurationResponse *> *)deleteRecommenderConfiguration:(AWSPinpointTargetingDeleteRecommenderConfigurationRequest *)request;

/**
 <p>Deletes an Amazon Pinpoint configuration for a recommender model.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRecommenderConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteRecommenderConfigurationRequest
 @see AWSPinpointTargetingDeleteRecommenderConfigurationResponse
 */
- (void)deleteRecommenderConfiguration:(AWSPinpointTargetingDeleteRecommenderConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteRecommenderConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a segment from an application.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSegment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteSegmentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteSegmentRequest
 @see AWSPinpointTargetingDeleteSegmentResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteSegmentResponse *> *)deleteSegment:(AWSPinpointTargetingDeleteSegmentRequest *)request;

/**
 <p>Deletes a segment from an application.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSegment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteSegmentRequest
 @see AWSPinpointTargetingDeleteSegmentResponse
 */
- (void)deleteSegment:(AWSPinpointTargetingDeleteSegmentRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteSegmentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables the SMS channel for an application and deletes any existing settings for the channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSmsChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteSmsChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteSmsChannelRequest
 @see AWSPinpointTargetingDeleteSmsChannelResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteSmsChannelResponse *> *)deleteSmsChannel:(AWSPinpointTargetingDeleteSmsChannelRequest *)request;

/**
 <p>Disables the SMS channel for an application and deletes any existing settings for the channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSmsChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteSmsChannelRequest
 @see AWSPinpointTargetingDeleteSmsChannelResponse
 */
- (void)deleteSmsChannel:(AWSPinpointTargetingDeleteSmsChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteSmsChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a message template for messages that were sent through the SMS channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSmsTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteSmsTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteSmsTemplateRequest
 @see AWSPinpointTargetingDeleteSmsTemplateResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteSmsTemplateResponse *> *)deleteSmsTemplate:(AWSPinpointTargetingDeleteSmsTemplateRequest *)request;

/**
 <p>Deletes a message template for messages that were sent through the SMS channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSmsTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteSmsTemplateRequest
 @see AWSPinpointTargetingDeleteSmsTemplateResponse
 */
- (void)deleteSmsTemplate:(AWSPinpointTargetingDeleteSmsTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteSmsTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes all the endpoints that are associated with a specific user ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUserEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteUserEndpointsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteUserEndpointsRequest
 @see AWSPinpointTargetingDeleteUserEndpointsResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteUserEndpointsResponse *> *)deleteUserEndpoints:(AWSPinpointTargetingDeleteUserEndpointsRequest *)request;

/**
 <p>Deletes all the endpoints that are associated with a specific user ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUserEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteUserEndpointsRequest
 @see AWSPinpointTargetingDeleteUserEndpointsResponse
 */
- (void)deleteUserEndpoints:(AWSPinpointTargetingDeleteUserEndpointsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteUserEndpointsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables the voice channel for an application and deletes any existing settings for the channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVoiceChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteVoiceChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteVoiceChannelRequest
 @see AWSPinpointTargetingDeleteVoiceChannelResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteVoiceChannelResponse *> *)deleteVoiceChannel:(AWSPinpointTargetingDeleteVoiceChannelRequest *)request;

/**
 <p>Disables the voice channel for an application and deletes any existing settings for the channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVoiceChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteVoiceChannelRequest
 @see AWSPinpointTargetingDeleteVoiceChannelResponse
 */
- (void)deleteVoiceChannel:(AWSPinpointTargetingDeleteVoiceChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteVoiceChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a message template for messages that were sent through the voice channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVoiceTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingDeleteVoiceTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteVoiceTemplateRequest
 @see AWSPinpointTargetingDeleteVoiceTemplateResponse
 */
- (AWSTask<AWSPinpointTargetingDeleteVoiceTemplateResponse *> *)deleteVoiceTemplate:(AWSPinpointTargetingDeleteVoiceTemplateRequest *)request;

/**
 <p>Deletes a message template for messages that were sent through the voice channel.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVoiceTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingDeleteVoiceTemplateRequest
 @see AWSPinpointTargetingDeleteVoiceTemplateResponse
 */
- (void)deleteVoiceTemplate:(AWSPinpointTargetingDeleteVoiceTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingDeleteVoiceTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the status and settings of the ADM channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetAdmChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetAdmChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetAdmChannelRequest
 @see AWSPinpointTargetingGetAdmChannelResponse
 */
- (AWSTask<AWSPinpointTargetingGetAdmChannelResponse *> *)getAdmChannel:(AWSPinpointTargetingGetAdmChannelRequest *)request;

/**
 <p>Retrieves information about the status and settings of the ADM channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetAdmChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetAdmChannelRequest
 @see AWSPinpointTargetingGetAdmChannelResponse
 */
- (void)getAdmChannel:(AWSPinpointTargetingGetAdmChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetAdmChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the status and settings of the APNs channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetApnsChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetApnsChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetApnsChannelRequest
 @see AWSPinpointTargetingGetApnsChannelResponse
 */
- (AWSTask<AWSPinpointTargetingGetApnsChannelResponse *> *)getApnsChannel:(AWSPinpointTargetingGetApnsChannelRequest *)request;

/**
 <p>Retrieves information about the status and settings of the APNs channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetApnsChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetApnsChannelRequest
 @see AWSPinpointTargetingGetApnsChannelResponse
 */
- (void)getApnsChannel:(AWSPinpointTargetingGetApnsChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetApnsChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the status and settings of the APNs sandbox channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetApnsSandboxChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetApnsSandboxChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetApnsSandboxChannelRequest
 @see AWSPinpointTargetingGetApnsSandboxChannelResponse
 */
- (AWSTask<AWSPinpointTargetingGetApnsSandboxChannelResponse *> *)getApnsSandboxChannel:(AWSPinpointTargetingGetApnsSandboxChannelRequest *)request;

/**
 <p>Retrieves information about the status and settings of the APNs sandbox channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetApnsSandboxChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetApnsSandboxChannelRequest
 @see AWSPinpointTargetingGetApnsSandboxChannelResponse
 */
- (void)getApnsSandboxChannel:(AWSPinpointTargetingGetApnsSandboxChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetApnsSandboxChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the status and settings of the APNs VoIP channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetApnsVoipChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetApnsVoipChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetApnsVoipChannelRequest
 @see AWSPinpointTargetingGetApnsVoipChannelResponse
 */
- (AWSTask<AWSPinpointTargetingGetApnsVoipChannelResponse *> *)getApnsVoipChannel:(AWSPinpointTargetingGetApnsVoipChannelRequest *)request;

/**
 <p>Retrieves information about the status and settings of the APNs VoIP channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetApnsVoipChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetApnsVoipChannelRequest
 @see AWSPinpointTargetingGetApnsVoipChannelResponse
 */
- (void)getApnsVoipChannel:(AWSPinpointTargetingGetApnsVoipChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetApnsVoipChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the status and settings of the APNs VoIP sandbox channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetApnsVoipSandboxChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetApnsVoipSandboxChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetApnsVoipSandboxChannelRequest
 @see AWSPinpointTargetingGetApnsVoipSandboxChannelResponse
 */
- (AWSTask<AWSPinpointTargetingGetApnsVoipSandboxChannelResponse *> *)getApnsVoipSandboxChannel:(AWSPinpointTargetingGetApnsVoipSandboxChannelRequest *)request;

/**
 <p>Retrieves information about the status and settings of the APNs VoIP sandbox channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetApnsVoipSandboxChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetApnsVoipSandboxChannelRequest
 @see AWSPinpointTargetingGetApnsVoipSandboxChannelResponse
 */
- (void)getApnsVoipSandboxChannel:(AWSPinpointTargetingGetApnsVoipSandboxChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetApnsVoipSandboxChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about an application.</p>
 
 @param request A container for the necessary parameters to execute the GetApp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetAppResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetAppRequest
 @see AWSPinpointTargetingGetAppResponse
 */
- (AWSTask<AWSPinpointTargetingGetAppResponse *> *)getApp:(AWSPinpointTargetingGetAppRequest *)request;

/**
 <p>Retrieves information about an application.</p>
 
 @param request A container for the necessary parameters to execute the GetApp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetAppRequest
 @see AWSPinpointTargetingGetAppResponse
 */
- (void)getApp:(AWSPinpointTargetingGetAppRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetAppResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves (queries) pre-aggregated data for a standard metric that applies to an application.</p>
 
 @param request A container for the necessary parameters to execute the GetApplicationDateRangeKpi service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetApplicationDateRangeKpiResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetApplicationDateRangeKpiRequest
 @see AWSPinpointTargetingGetApplicationDateRangeKpiResponse
 */
- (AWSTask<AWSPinpointTargetingGetApplicationDateRangeKpiResponse *> *)getApplicationDateRangeKpi:(AWSPinpointTargetingGetApplicationDateRangeKpiRequest *)request;

/**
 <p>Retrieves (queries) pre-aggregated data for a standard metric that applies to an application.</p>
 
 @param request A container for the necessary parameters to execute the GetApplicationDateRangeKpi service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetApplicationDateRangeKpiRequest
 @see AWSPinpointTargetingGetApplicationDateRangeKpiResponse
 */
- (void)getApplicationDateRangeKpi:(AWSPinpointTargetingGetApplicationDateRangeKpiRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetApplicationDateRangeKpiResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the settings for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetApplicationSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetApplicationSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetApplicationSettingsRequest
 @see AWSPinpointTargetingGetApplicationSettingsResponse
 */
- (AWSTask<AWSPinpointTargetingGetApplicationSettingsResponse *> *)getApplicationSettings:(AWSPinpointTargetingGetApplicationSettingsRequest *)request;

/**
 <p>Retrieves information about the settings for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetApplicationSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetApplicationSettingsRequest
 @see AWSPinpointTargetingGetApplicationSettingsResponse
 */
- (void)getApplicationSettings:(AWSPinpointTargetingGetApplicationSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetApplicationSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about all the applications that are associated with your Amazon Pinpoint account.</p>
 
 @param request A container for the necessary parameters to execute the GetApps service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetAppsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetAppsRequest
 @see AWSPinpointTargetingGetAppsResponse
 */
- (AWSTask<AWSPinpointTargetingGetAppsResponse *> *)getApps:(AWSPinpointTargetingGetAppsRequest *)request;

/**
 <p>Retrieves information about all the applications that are associated with your Amazon Pinpoint account.</p>
 
 @param request A container for the necessary parameters to execute the GetApps service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetAppsRequest
 @see AWSPinpointTargetingGetAppsResponse
 */
- (void)getApps:(AWSPinpointTargetingGetAppsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetAppsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the status and settings of the Baidu channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetBaiduChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetBaiduChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetBaiduChannelRequest
 @see AWSPinpointTargetingGetBaiduChannelResponse
 */
- (AWSTask<AWSPinpointTargetingGetBaiduChannelResponse *> *)getBaiduChannel:(AWSPinpointTargetingGetBaiduChannelRequest *)request;

/**
 <p>Retrieves information about the status and settings of the Baidu channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetBaiduChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetBaiduChannelRequest
 @see AWSPinpointTargetingGetBaiduChannelResponse
 */
- (void)getBaiduChannel:(AWSPinpointTargetingGetBaiduChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetBaiduChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the status, configuration, and other settings for a campaign.</p>
 
 @param request A container for the necessary parameters to execute the GetCampaign service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetCampaignResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetCampaignRequest
 @see AWSPinpointTargetingGetCampaignResponse
 */
- (AWSTask<AWSPinpointTargetingGetCampaignResponse *> *)getCampaign:(AWSPinpointTargetingGetCampaignRequest *)request;

/**
 <p>Retrieves information about the status, configuration, and other settings for a campaign.</p>
 
 @param request A container for the necessary parameters to execute the GetCampaign service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetCampaignRequest
 @see AWSPinpointTargetingGetCampaignResponse
 */
- (void)getCampaign:(AWSPinpointTargetingGetCampaignRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetCampaignResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about all the activities for a campaign.</p>
 
 @param request A container for the necessary parameters to execute the GetCampaignActivities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetCampaignActivitiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetCampaignActivitiesRequest
 @see AWSPinpointTargetingGetCampaignActivitiesResponse
 */
- (AWSTask<AWSPinpointTargetingGetCampaignActivitiesResponse *> *)getCampaignActivities:(AWSPinpointTargetingGetCampaignActivitiesRequest *)request;

/**
 <p>Retrieves information about all the activities for a campaign.</p>
 
 @param request A container for the necessary parameters to execute the GetCampaignActivities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetCampaignActivitiesRequest
 @see AWSPinpointTargetingGetCampaignActivitiesResponse
 */
- (void)getCampaignActivities:(AWSPinpointTargetingGetCampaignActivitiesRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetCampaignActivitiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves (queries) pre-aggregated data for a standard metric that applies to a campaign.</p>
 
 @param request A container for the necessary parameters to execute the GetCampaignDateRangeKpi service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetCampaignDateRangeKpiResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetCampaignDateRangeKpiRequest
 @see AWSPinpointTargetingGetCampaignDateRangeKpiResponse
 */
- (AWSTask<AWSPinpointTargetingGetCampaignDateRangeKpiResponse *> *)getCampaignDateRangeKpi:(AWSPinpointTargetingGetCampaignDateRangeKpiRequest *)request;

/**
 <p>Retrieves (queries) pre-aggregated data for a standard metric that applies to a campaign.</p>
 
 @param request A container for the necessary parameters to execute the GetCampaignDateRangeKpi service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetCampaignDateRangeKpiRequest
 @see AWSPinpointTargetingGetCampaignDateRangeKpiResponse
 */
- (void)getCampaignDateRangeKpi:(AWSPinpointTargetingGetCampaignDateRangeKpiRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetCampaignDateRangeKpiResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the status, configuration, and other settings for a specific version of a campaign.</p>
 
 @param request A container for the necessary parameters to execute the GetCampaignVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetCampaignVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetCampaignVersionRequest
 @see AWSPinpointTargetingGetCampaignVersionResponse
 */
- (AWSTask<AWSPinpointTargetingGetCampaignVersionResponse *> *)getCampaignVersion:(AWSPinpointTargetingGetCampaignVersionRequest *)request;

/**
 <p>Retrieves information about the status, configuration, and other settings for a specific version of a campaign.</p>
 
 @param request A container for the necessary parameters to execute the GetCampaignVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetCampaignVersionRequest
 @see AWSPinpointTargetingGetCampaignVersionResponse
 */
- (void)getCampaignVersion:(AWSPinpointTargetingGetCampaignVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetCampaignVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the status, configuration, and other settings for all versions of a campaign.</p>
 
 @param request A container for the necessary parameters to execute the GetCampaignVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetCampaignVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetCampaignVersionsRequest
 @see AWSPinpointTargetingGetCampaignVersionsResponse
 */
- (AWSTask<AWSPinpointTargetingGetCampaignVersionsResponse *> *)getCampaignVersions:(AWSPinpointTargetingGetCampaignVersionsRequest *)request;

/**
 <p>Retrieves information about the status, configuration, and other settings for all versions of a campaign.</p>
 
 @param request A container for the necessary parameters to execute the GetCampaignVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetCampaignVersionsRequest
 @see AWSPinpointTargetingGetCampaignVersionsResponse
 */
- (void)getCampaignVersions:(AWSPinpointTargetingGetCampaignVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetCampaignVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the status, configuration, and other settings for all the campaigns that are associated with an application.</p>
 
 @param request A container for the necessary parameters to execute the GetCampaigns service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetCampaignsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetCampaignsRequest
 @see AWSPinpointTargetingGetCampaignsResponse
 */
- (AWSTask<AWSPinpointTargetingGetCampaignsResponse *> *)getCampaigns:(AWSPinpointTargetingGetCampaignsRequest *)request;

/**
 <p>Retrieves information about the status, configuration, and other settings for all the campaigns that are associated with an application.</p>
 
 @param request A container for the necessary parameters to execute the GetCampaigns service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetCampaignsRequest
 @see AWSPinpointTargetingGetCampaignsResponse
 */
- (void)getCampaigns:(AWSPinpointTargetingGetCampaignsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetCampaignsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the history and status of each channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetChannels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetChannelsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetChannelsRequest
 @see AWSPinpointTargetingGetChannelsResponse
 */
- (AWSTask<AWSPinpointTargetingGetChannelsResponse *> *)getChannels:(AWSPinpointTargetingGetChannelsRequest *)request;

/**
 <p>Retrieves information about the history and status of each channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetChannels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetChannelsRequest
 @see AWSPinpointTargetingGetChannelsResponse
 */
- (void)getChannels:(AWSPinpointTargetingGetChannelsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetChannelsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the status and settings of the email channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetEmailChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetEmailChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetEmailChannelRequest
 @see AWSPinpointTargetingGetEmailChannelResponse
 */
- (AWSTask<AWSPinpointTargetingGetEmailChannelResponse *> *)getEmailChannel:(AWSPinpointTargetingGetEmailChannelRequest *)request;

/**
 <p>Retrieves information about the status and settings of the email channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetEmailChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetEmailChannelRequest
 @see AWSPinpointTargetingGetEmailChannelResponse
 */
- (void)getEmailChannel:(AWSPinpointTargetingGetEmailChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetEmailChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the content and settings of a message template for messages that are sent through the email channel.</p>
 
 @param request A container for the necessary parameters to execute the GetEmailTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetEmailTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetEmailTemplateRequest
 @see AWSPinpointTargetingGetEmailTemplateResponse
 */
- (AWSTask<AWSPinpointTargetingGetEmailTemplateResponse *> *)getEmailTemplate:(AWSPinpointTargetingGetEmailTemplateRequest *)request;

/**
 <p>Retrieves the content and settings of a message template for messages that are sent through the email channel.</p>
 
 @param request A container for the necessary parameters to execute the GetEmailTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetEmailTemplateRequest
 @see AWSPinpointTargetingGetEmailTemplateResponse
 */
- (void)getEmailTemplate:(AWSPinpointTargetingGetEmailTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetEmailTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the settings and attributes of a specific endpoint for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetEndpointRequest
 @see AWSPinpointTargetingGetEndpointResponse
 */
- (AWSTask<AWSPinpointTargetingGetEndpointResponse *> *)getEndpoint:(AWSPinpointTargetingGetEndpointRequest *)request;

/**
 <p>Retrieves information about the settings and attributes of a specific endpoint for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetEndpointRequest
 @see AWSPinpointTargetingGetEndpointResponse
 */
- (void)getEndpoint:(AWSPinpointTargetingGetEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the event stream settings for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetEventStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetEventStreamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetEventStreamRequest
 @see AWSPinpointTargetingGetEventStreamResponse
 */
- (AWSTask<AWSPinpointTargetingGetEventStreamResponse *> *)getEventStream:(AWSPinpointTargetingGetEventStreamRequest *)request;

/**
 <p>Retrieves information about the event stream settings for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetEventStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetEventStreamRequest
 @see AWSPinpointTargetingGetEventStreamResponse
 */
- (void)getEventStream:(AWSPinpointTargetingGetEventStreamRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetEventStreamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the status and settings of a specific export job for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetExportJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetExportJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetExportJobRequest
 @see AWSPinpointTargetingGetExportJobResponse
 */
- (AWSTask<AWSPinpointTargetingGetExportJobResponse *> *)getExportJob:(AWSPinpointTargetingGetExportJobRequest *)request;

/**
 <p>Retrieves information about the status and settings of a specific export job for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetExportJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetExportJobRequest
 @see AWSPinpointTargetingGetExportJobResponse
 */
- (void)getExportJob:(AWSPinpointTargetingGetExportJobRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetExportJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the status and settings of all the export jobs for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetExportJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetExportJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetExportJobsRequest
 @see AWSPinpointTargetingGetExportJobsResponse
 */
- (AWSTask<AWSPinpointTargetingGetExportJobsResponse *> *)getExportJobs:(AWSPinpointTargetingGetExportJobsRequest *)request;

/**
 <p>Retrieves information about the status and settings of all the export jobs for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetExportJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetExportJobsRequest
 @see AWSPinpointTargetingGetExportJobsResponse
 */
- (void)getExportJobs:(AWSPinpointTargetingGetExportJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetExportJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the status and settings of the GCM channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetGcmChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetGcmChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetGcmChannelRequest
 @see AWSPinpointTargetingGetGcmChannelResponse
 */
- (AWSTask<AWSPinpointTargetingGetGcmChannelResponse *> *)getGcmChannel:(AWSPinpointTargetingGetGcmChannelRequest *)request;

/**
 <p>Retrieves information about the status and settings of the GCM channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetGcmChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetGcmChannelRequest
 @see AWSPinpointTargetingGetGcmChannelResponse
 */
- (void)getGcmChannel:(AWSPinpointTargetingGetGcmChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetGcmChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the status and settings of a specific import job for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetImportJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetImportJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetImportJobRequest
 @see AWSPinpointTargetingGetImportJobResponse
 */
- (AWSTask<AWSPinpointTargetingGetImportJobResponse *> *)getImportJob:(AWSPinpointTargetingGetImportJobRequest *)request;

/**
 <p>Retrieves information about the status and settings of a specific import job for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetImportJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetImportJobRequest
 @see AWSPinpointTargetingGetImportJobResponse
 */
- (void)getImportJob:(AWSPinpointTargetingGetImportJobRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetImportJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the status and settings of all the import jobs for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetImportJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetImportJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetImportJobsRequest
 @see AWSPinpointTargetingGetImportJobsResponse
 */
- (AWSTask<AWSPinpointTargetingGetImportJobsResponse *> *)getImportJobs:(AWSPinpointTargetingGetImportJobsRequest *)request;

/**
 <p>Retrieves information about the status and settings of all the import jobs for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetImportJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetImportJobsRequest
 @see AWSPinpointTargetingGetImportJobsResponse
 */
- (void)getImportJobs:(AWSPinpointTargetingGetImportJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetImportJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the status, configuration, and other settings for a journey.</p>
 
 @param request A container for the necessary parameters to execute the GetJourney service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetJourneyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetJourneyRequest
 @see AWSPinpointTargetingGetJourneyResponse
 */
- (AWSTask<AWSPinpointTargetingGetJourneyResponse *> *)getJourney:(AWSPinpointTargetingGetJourneyRequest *)request;

/**
 <p>Retrieves information about the status, configuration, and other settings for a journey.</p>
 
 @param request A container for the necessary parameters to execute the GetJourney service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetJourneyRequest
 @see AWSPinpointTargetingGetJourneyResponse
 */
- (void)getJourney:(AWSPinpointTargetingGetJourneyRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetJourneyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves (queries) pre-aggregated data for a standard engagement metric that applies to a journey.</p>
 
 @param request A container for the necessary parameters to execute the GetJourneyDateRangeKpi service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetJourneyDateRangeKpiResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetJourneyDateRangeKpiRequest
 @see AWSPinpointTargetingGetJourneyDateRangeKpiResponse
 */
- (AWSTask<AWSPinpointTargetingGetJourneyDateRangeKpiResponse *> *)getJourneyDateRangeKpi:(AWSPinpointTargetingGetJourneyDateRangeKpiRequest *)request;

/**
 <p>Retrieves (queries) pre-aggregated data for a standard engagement metric that applies to a journey.</p>
 
 @param request A container for the necessary parameters to execute the GetJourneyDateRangeKpi service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetJourneyDateRangeKpiRequest
 @see AWSPinpointTargetingGetJourneyDateRangeKpiResponse
 */
- (void)getJourneyDateRangeKpi:(AWSPinpointTargetingGetJourneyDateRangeKpiRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetJourneyDateRangeKpiResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves (queries) pre-aggregated data for a standard execution metric that applies to a journey activity.</p>
 
 @param request A container for the necessary parameters to execute the GetJourneyExecutionActivityMetrics service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetJourneyExecutionActivityMetricsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetJourneyExecutionActivityMetricsRequest
 @see AWSPinpointTargetingGetJourneyExecutionActivityMetricsResponse
 */
- (AWSTask<AWSPinpointTargetingGetJourneyExecutionActivityMetricsResponse *> *)getJourneyExecutionActivityMetrics:(AWSPinpointTargetingGetJourneyExecutionActivityMetricsRequest *)request;

/**
 <p>Retrieves (queries) pre-aggregated data for a standard execution metric that applies to a journey activity.</p>
 
 @param request A container for the necessary parameters to execute the GetJourneyExecutionActivityMetrics service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetJourneyExecutionActivityMetricsRequest
 @see AWSPinpointTargetingGetJourneyExecutionActivityMetricsResponse
 */
- (void)getJourneyExecutionActivityMetrics:(AWSPinpointTargetingGetJourneyExecutionActivityMetricsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetJourneyExecutionActivityMetricsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves (queries) pre-aggregated data for a standard execution metric that applies to a journey.</p>
 
 @param request A container for the necessary parameters to execute the GetJourneyExecutionMetrics service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetJourneyExecutionMetricsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetJourneyExecutionMetricsRequest
 @see AWSPinpointTargetingGetJourneyExecutionMetricsResponse
 */
- (AWSTask<AWSPinpointTargetingGetJourneyExecutionMetricsResponse *> *)getJourneyExecutionMetrics:(AWSPinpointTargetingGetJourneyExecutionMetricsRequest *)request;

/**
 <p>Retrieves (queries) pre-aggregated data for a standard execution metric that applies to a journey.</p>
 
 @param request A container for the necessary parameters to execute the GetJourneyExecutionMetrics service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetJourneyExecutionMetricsRequest
 @see AWSPinpointTargetingGetJourneyExecutionMetricsResponse
 */
- (void)getJourneyExecutionMetrics:(AWSPinpointTargetingGetJourneyExecutionMetricsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetJourneyExecutionMetricsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the content and settings of a message template for messages that are sent through a push notification channel.</p>
 
 @param request A container for the necessary parameters to execute the GetPushTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetPushTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetPushTemplateRequest
 @see AWSPinpointTargetingGetPushTemplateResponse
 */
- (AWSTask<AWSPinpointTargetingGetPushTemplateResponse *> *)getPushTemplate:(AWSPinpointTargetingGetPushTemplateRequest *)request;

/**
 <p>Retrieves the content and settings of a message template for messages that are sent through a push notification channel.</p>
 
 @param request A container for the necessary parameters to execute the GetPushTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetPushTemplateRequest
 @see AWSPinpointTargetingGetPushTemplateResponse
 */
- (void)getPushTemplate:(AWSPinpointTargetingGetPushTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetPushTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about an Amazon Pinpoint configuration for a recommender model.</p>
 
 @param request A container for the necessary parameters to execute the GetRecommenderConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetRecommenderConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetRecommenderConfigurationRequest
 @see AWSPinpointTargetingGetRecommenderConfigurationResponse
 */
- (AWSTask<AWSPinpointTargetingGetRecommenderConfigurationResponse *> *)getRecommenderConfiguration:(AWSPinpointTargetingGetRecommenderConfigurationRequest *)request;

/**
 <p>Retrieves information about an Amazon Pinpoint configuration for a recommender model.</p>
 
 @param request A container for the necessary parameters to execute the GetRecommenderConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetRecommenderConfigurationRequest
 @see AWSPinpointTargetingGetRecommenderConfigurationResponse
 */
- (void)getRecommenderConfiguration:(AWSPinpointTargetingGetRecommenderConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetRecommenderConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about all the recommender model configurations that are associated with your Amazon Pinpoint account.</p>
 
 @param request A container for the necessary parameters to execute the GetRecommenderConfigurations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetRecommenderConfigurationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetRecommenderConfigurationsRequest
 @see AWSPinpointTargetingGetRecommenderConfigurationsResponse
 */
- (AWSTask<AWSPinpointTargetingGetRecommenderConfigurationsResponse *> *)getRecommenderConfigurations:(AWSPinpointTargetingGetRecommenderConfigurationsRequest *)request;

/**
 <p>Retrieves information about all the recommender model configurations that are associated with your Amazon Pinpoint account.</p>
 
 @param request A container for the necessary parameters to execute the GetRecommenderConfigurations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetRecommenderConfigurationsRequest
 @see AWSPinpointTargetingGetRecommenderConfigurationsResponse
 */
- (void)getRecommenderConfigurations:(AWSPinpointTargetingGetRecommenderConfigurationsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetRecommenderConfigurationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the configuration, dimension, and other settings for a specific segment that's associated with an application.</p>
 
 @param request A container for the necessary parameters to execute the GetSegment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetSegmentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSegmentRequest
 @see AWSPinpointTargetingGetSegmentResponse
 */
- (AWSTask<AWSPinpointTargetingGetSegmentResponse *> *)getSegment:(AWSPinpointTargetingGetSegmentRequest *)request;

/**
 <p>Retrieves information about the configuration, dimension, and other settings for a specific segment that's associated with an application.</p>
 
 @param request A container for the necessary parameters to execute the GetSegment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSegmentRequest
 @see AWSPinpointTargetingGetSegmentResponse
 */
- (void)getSegment:(AWSPinpointTargetingGetSegmentRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetSegmentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the status and settings of the export jobs for a segment.</p>
 
 @param request A container for the necessary parameters to execute the GetSegmentExportJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetSegmentExportJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSegmentExportJobsRequest
 @see AWSPinpointTargetingGetSegmentExportJobsResponse
 */
- (AWSTask<AWSPinpointTargetingGetSegmentExportJobsResponse *> *)getSegmentExportJobs:(AWSPinpointTargetingGetSegmentExportJobsRequest *)request;

/**
 <p>Retrieves information about the status and settings of the export jobs for a segment.</p>
 
 @param request A container for the necessary parameters to execute the GetSegmentExportJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSegmentExportJobsRequest
 @see AWSPinpointTargetingGetSegmentExportJobsResponse
 */
- (void)getSegmentExportJobs:(AWSPinpointTargetingGetSegmentExportJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetSegmentExportJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the status and settings of the import jobs for a segment.</p>
 
 @param request A container for the necessary parameters to execute the GetSegmentImportJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetSegmentImportJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSegmentImportJobsRequest
 @see AWSPinpointTargetingGetSegmentImportJobsResponse
 */
- (AWSTask<AWSPinpointTargetingGetSegmentImportJobsResponse *> *)getSegmentImportJobs:(AWSPinpointTargetingGetSegmentImportJobsRequest *)request;

/**
 <p>Retrieves information about the status and settings of the import jobs for a segment.</p>
 
 @param request A container for the necessary parameters to execute the GetSegmentImportJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSegmentImportJobsRequest
 @see AWSPinpointTargetingGetSegmentImportJobsResponse
 */
- (void)getSegmentImportJobs:(AWSPinpointTargetingGetSegmentImportJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetSegmentImportJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the configuration, dimension, and other settings for a specific version of a segment that's associated with an application.</p>
 
 @param request A container for the necessary parameters to execute the GetSegmentVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetSegmentVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSegmentVersionRequest
 @see AWSPinpointTargetingGetSegmentVersionResponse
 */
- (AWSTask<AWSPinpointTargetingGetSegmentVersionResponse *> *)getSegmentVersion:(AWSPinpointTargetingGetSegmentVersionRequest *)request;

/**
 <p>Retrieves information about the configuration, dimension, and other settings for a specific version of a segment that's associated with an application.</p>
 
 @param request A container for the necessary parameters to execute the GetSegmentVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSegmentVersionRequest
 @see AWSPinpointTargetingGetSegmentVersionResponse
 */
- (void)getSegmentVersion:(AWSPinpointTargetingGetSegmentVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetSegmentVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the configuration, dimension, and other settings for all the versions of a specific segment that's associated with an application.</p>
 
 @param request A container for the necessary parameters to execute the GetSegmentVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetSegmentVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSegmentVersionsRequest
 @see AWSPinpointTargetingGetSegmentVersionsResponse
 */
- (AWSTask<AWSPinpointTargetingGetSegmentVersionsResponse *> *)getSegmentVersions:(AWSPinpointTargetingGetSegmentVersionsRequest *)request;

/**
 <p>Retrieves information about the configuration, dimension, and other settings for all the versions of a specific segment that's associated with an application.</p>
 
 @param request A container for the necessary parameters to execute the GetSegmentVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSegmentVersionsRequest
 @see AWSPinpointTargetingGetSegmentVersionsResponse
 */
- (void)getSegmentVersions:(AWSPinpointTargetingGetSegmentVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetSegmentVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the configuration, dimension, and other settings for all the segments that are associated with an application.</p>
 
 @param request A container for the necessary parameters to execute the GetSegments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetSegmentsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSegmentsRequest
 @see AWSPinpointTargetingGetSegmentsResponse
 */
- (AWSTask<AWSPinpointTargetingGetSegmentsResponse *> *)getSegments:(AWSPinpointTargetingGetSegmentsRequest *)request;

/**
 <p>Retrieves information about the configuration, dimension, and other settings for all the segments that are associated with an application.</p>
 
 @param request A container for the necessary parameters to execute the GetSegments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSegmentsRequest
 @see AWSPinpointTargetingGetSegmentsResponse
 */
- (void)getSegments:(AWSPinpointTargetingGetSegmentsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetSegmentsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the status and settings of the SMS channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetSmsChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetSmsChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSmsChannelRequest
 @see AWSPinpointTargetingGetSmsChannelResponse
 */
- (AWSTask<AWSPinpointTargetingGetSmsChannelResponse *> *)getSmsChannel:(AWSPinpointTargetingGetSmsChannelRequest *)request;

/**
 <p>Retrieves information about the status and settings of the SMS channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetSmsChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSmsChannelRequest
 @see AWSPinpointTargetingGetSmsChannelResponse
 */
- (void)getSmsChannel:(AWSPinpointTargetingGetSmsChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetSmsChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the content and settings of a message template for messages that are sent through the SMS channel.</p>
 
 @param request A container for the necessary parameters to execute the GetSmsTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetSmsTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSmsTemplateRequest
 @see AWSPinpointTargetingGetSmsTemplateResponse
 */
- (AWSTask<AWSPinpointTargetingGetSmsTemplateResponse *> *)getSmsTemplate:(AWSPinpointTargetingGetSmsTemplateRequest *)request;

/**
 <p>Retrieves the content and settings of a message template for messages that are sent through the SMS channel.</p>
 
 @param request A container for the necessary parameters to execute the GetSmsTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetSmsTemplateRequest
 @see AWSPinpointTargetingGetSmsTemplateResponse
 */
- (void)getSmsTemplate:(AWSPinpointTargetingGetSmsTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetSmsTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about all the endpoints that are associated with a specific user ID.</p>
 
 @param request A container for the necessary parameters to execute the GetUserEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetUserEndpointsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetUserEndpointsRequest
 @see AWSPinpointTargetingGetUserEndpointsResponse
 */
- (AWSTask<AWSPinpointTargetingGetUserEndpointsResponse *> *)getUserEndpoints:(AWSPinpointTargetingGetUserEndpointsRequest *)request;

/**
 <p>Retrieves information about all the endpoints that are associated with a specific user ID.</p>
 
 @param request A container for the necessary parameters to execute the GetUserEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetUserEndpointsRequest
 @see AWSPinpointTargetingGetUserEndpointsResponse
 */
- (void)getUserEndpoints:(AWSPinpointTargetingGetUserEndpointsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetUserEndpointsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the status and settings of the voice channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetVoiceChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetVoiceChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetVoiceChannelRequest
 @see AWSPinpointTargetingGetVoiceChannelResponse
 */
- (AWSTask<AWSPinpointTargetingGetVoiceChannelResponse *> *)getVoiceChannel:(AWSPinpointTargetingGetVoiceChannelRequest *)request;

/**
 <p>Retrieves information about the status and settings of the voice channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the GetVoiceChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetVoiceChannelRequest
 @see AWSPinpointTargetingGetVoiceChannelResponse
 */
- (void)getVoiceChannel:(AWSPinpointTargetingGetVoiceChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetVoiceChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the content and settings of a message template for messages that are sent through the voice channel.</p>
 
 @param request A container for the necessary parameters to execute the GetVoiceTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingGetVoiceTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetVoiceTemplateRequest
 @see AWSPinpointTargetingGetVoiceTemplateResponse
 */
- (AWSTask<AWSPinpointTargetingGetVoiceTemplateResponse *> *)getVoiceTemplate:(AWSPinpointTargetingGetVoiceTemplateRequest *)request;

/**
 <p>Retrieves the content and settings of a message template for messages that are sent through the voice channel.</p>
 
 @param request A container for the necessary parameters to execute the GetVoiceTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingGetVoiceTemplateRequest
 @see AWSPinpointTargetingGetVoiceTemplateResponse
 */
- (void)getVoiceTemplate:(AWSPinpointTargetingGetVoiceTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingGetVoiceTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the status, configuration, and other settings for all the journeys that are associated with an application.</p>
 
 @param request A container for the necessary parameters to execute the ListJourneys service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingListJourneysResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingListJourneysRequest
 @see AWSPinpointTargetingListJourneysResponse
 */
- (AWSTask<AWSPinpointTargetingListJourneysResponse *> *)listJourneys:(AWSPinpointTargetingListJourneysRequest *)request;

/**
 <p>Retrieves information about the status, configuration, and other settings for all the journeys that are associated with an application.</p>
 
 @param request A container for the necessary parameters to execute the ListJourneys service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingListJourneysRequest
 @see AWSPinpointTargetingListJourneysResponse
 */
- (void)listJourneys:(AWSPinpointTargetingListJourneysRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingListJourneysResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves all the tags (keys and values) that are associated with an application, campaign, message template, or segment.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: .
 
 @see AWSPinpointTargetingListTagsForResourceRequest
 @see AWSPinpointTargetingListTagsForResourceResponse
 */
- (AWSTask<AWSPinpointTargetingListTagsForResourceResponse *> *)listTagsForResource:(AWSPinpointTargetingListTagsForResourceRequest *)request;

/**
 <p>Retrieves all the tags (keys and values) that are associated with an application, campaign, message template, or segment.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: .
 
 @see AWSPinpointTargetingListTagsForResourceRequest
 @see AWSPinpointTargetingListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSPinpointTargetingListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about all the versions of a specific message template.</p>
 
 @param request A container for the necessary parameters to execute the ListTemplateVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingListTemplateVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingListTemplateVersionsRequest
 @see AWSPinpointTargetingListTemplateVersionsResponse
 */
- (AWSTask<AWSPinpointTargetingListTemplateVersionsResponse *> *)listTemplateVersions:(AWSPinpointTargetingListTemplateVersionsRequest *)request;

/**
 <p>Retrieves information about all the versions of a specific message template.</p>
 
 @param request A container for the necessary parameters to execute the ListTemplateVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingListTemplateVersionsRequest
 @see AWSPinpointTargetingListTemplateVersionsResponse
 */
- (void)listTemplateVersions:(AWSPinpointTargetingListTemplateVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingListTemplateVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about all the message templates that are associated with your Amazon Pinpoint account.</p>
 
 @param request A container for the necessary parameters to execute the ListTemplates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingListTemplatesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`, `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`.
 
 @see AWSPinpointTargetingListTemplatesRequest
 @see AWSPinpointTargetingListTemplatesResponse
 */
- (AWSTask<AWSPinpointTargetingListTemplatesResponse *> *)listTemplates:(AWSPinpointTargetingListTemplatesRequest *)request;

/**
 <p>Retrieves information about all the message templates that are associated with your Amazon Pinpoint account.</p>
 
 @param request A container for the necessary parameters to execute the ListTemplates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`, `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorForbidden`.
 
 @see AWSPinpointTargetingListTemplatesRequest
 @see AWSPinpointTargetingListTemplatesResponse
 */
- (void)listTemplates:(AWSPinpointTargetingListTemplatesRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingListTemplatesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a phone number.</p>
 
 @param request A container for the necessary parameters to execute the PhoneNumberValidate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingPhoneNumberValidateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingPhoneNumberValidateRequest
 @see AWSPinpointTargetingPhoneNumberValidateResponse
 */
- (AWSTask<AWSPinpointTargetingPhoneNumberValidateResponse *> *)phoneNumberValidate:(AWSPinpointTargetingPhoneNumberValidateRequest *)request;

/**
 <p>Retrieves information about a phone number.</p>
 
 @param request A container for the necessary parameters to execute the PhoneNumberValidate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingPhoneNumberValidateRequest
 @see AWSPinpointTargetingPhoneNumberValidateResponse
 */
- (void)phoneNumberValidate:(AWSPinpointTargetingPhoneNumberValidateRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingPhoneNumberValidateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new event stream for an application or updates the settings of an existing event stream for an application.</p>
 
 @param request A container for the necessary parameters to execute the PutEventStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingPutEventStreamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingPutEventStreamRequest
 @see AWSPinpointTargetingPutEventStreamResponse
 */
- (AWSTask<AWSPinpointTargetingPutEventStreamResponse *> *)putEventStream:(AWSPinpointTargetingPutEventStreamRequest *)request;

/**
 <p>Creates a new event stream for an application or updates the settings of an existing event stream for an application.</p>
 
 @param request A container for the necessary parameters to execute the PutEventStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingPutEventStreamRequest
 @see AWSPinpointTargetingPutEventStreamResponse
 */
- (void)putEventStream:(AWSPinpointTargetingPutEventStreamRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingPutEventStreamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new event to record for endpoints, or creates or updates endpoint data that existing events are associated with.</p>
 
 @param request A container for the necessary parameters to execute the PutEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingPutEventsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingPutEventsRequest
 @see AWSPinpointTargetingPutEventsResponse
 */
- (AWSTask<AWSPinpointTargetingPutEventsResponse *> *)putEvents:(AWSPinpointTargetingPutEventsRequest *)request;

/**
 <p>Creates a new event to record for endpoints, or creates or updates endpoint data that existing events are associated with.</p>
 
 @param request A container for the necessary parameters to execute the PutEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingPutEventsRequest
 @see AWSPinpointTargetingPutEventsResponse
 */
- (void)putEvents:(AWSPinpointTargetingPutEventsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingPutEventsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes one or more attributes, of the same attribute type, from all the endpoints that are associated with an application.</p>
 
 @param request A container for the necessary parameters to execute the RemoveAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingRemoveAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingRemoveAttributesRequest
 @see AWSPinpointTargetingRemoveAttributesResponse
 */
- (AWSTask<AWSPinpointTargetingRemoveAttributesResponse *> *)removeAttributes:(AWSPinpointTargetingRemoveAttributesRequest *)request;

/**
 <p>Removes one or more attributes, of the same attribute type, from all the endpoints that are associated with an application.</p>
 
 @param request A container for the necessary parameters to execute the RemoveAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingRemoveAttributesRequest
 @see AWSPinpointTargetingRemoveAttributesResponse
 */
- (void)removeAttributes:(AWSPinpointTargetingRemoveAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingRemoveAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates and sends a direct message.</p>
 
 @param request A container for the necessary parameters to execute the SendMessages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingSendMessagesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingSendMessagesRequest
 @see AWSPinpointTargetingSendMessagesResponse
 */
- (AWSTask<AWSPinpointTargetingSendMessagesResponse *> *)sendMessages:(AWSPinpointTargetingSendMessagesRequest *)request;

/**
 <p>Creates and sends a direct message.</p>
 
 @param request A container for the necessary parameters to execute the SendMessages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingSendMessagesRequest
 @see AWSPinpointTargetingSendMessagesResponse
 */
- (void)sendMessages:(AWSPinpointTargetingSendMessagesRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingSendMessagesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates and sends a message to a list of users.</p>
 
 @param request A container for the necessary parameters to execute the SendUsersMessages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingSendUsersMessagesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingSendUsersMessagesRequest
 @see AWSPinpointTargetingSendUsersMessagesResponse
 */
- (AWSTask<AWSPinpointTargetingSendUsersMessagesResponse *> *)sendUsersMessages:(AWSPinpointTargetingSendUsersMessagesRequest *)request;

/**
 <p>Creates and sends a message to a list of users.</p>
 
 @param request A container for the necessary parameters to execute the SendUsersMessages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingSendUsersMessagesRequest
 @see AWSPinpointTargetingSendUsersMessagesResponse
 */
- (void)sendUsersMessages:(AWSPinpointTargetingSendUsersMessagesRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingSendUsersMessagesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds one or more tags (keys and values) to an application, campaign, message template, or segment.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: .
 
 @see AWSPinpointTargetingTagResourceRequest
 */
- (AWSTask *)tagResource:(AWSPinpointTargetingTagResourceRequest *)request;

/**
 <p>Adds one or more tags (keys and values) to an application, campaign, message template, or segment.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: .
 
 @see AWSPinpointTargetingTagResourceRequest
 */
- (void)tagResource:(AWSPinpointTargetingTagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes one or more tags (keys and values) from an application, campaign, message template, or segment.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: .
 
 @see AWSPinpointTargetingUntagResourceRequest
 */
- (AWSTask *)untagResource:(AWSPinpointTargetingUntagResourceRequest *)request;

/**
 <p>Removes one or more tags (keys and values) from an application, campaign, message template, or segment.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: .
 
 @see AWSPinpointTargetingUntagResourceRequest
 */
- (void)untagResource:(AWSPinpointTargetingUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Enables the ADM channel for an application or updates the status and settings of the ADM channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAdmChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateAdmChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateAdmChannelRequest
 @see AWSPinpointTargetingUpdateAdmChannelResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateAdmChannelResponse *> *)updateAdmChannel:(AWSPinpointTargetingUpdateAdmChannelRequest *)request;

/**
 <p>Enables the ADM channel for an application or updates the status and settings of the ADM channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAdmChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateAdmChannelRequest
 @see AWSPinpointTargetingUpdateAdmChannelResponse
 */
- (void)updateAdmChannel:(AWSPinpointTargetingUpdateAdmChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateAdmChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables the APNs channel for an application or updates the status and settings of the APNs channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApnsChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateApnsChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateApnsChannelRequest
 @see AWSPinpointTargetingUpdateApnsChannelResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateApnsChannelResponse *> *)updateApnsChannel:(AWSPinpointTargetingUpdateApnsChannelRequest *)request;

/**
 <p>Enables the APNs channel for an application or updates the status and settings of the APNs channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApnsChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateApnsChannelRequest
 @see AWSPinpointTargetingUpdateApnsChannelResponse
 */
- (void)updateApnsChannel:(AWSPinpointTargetingUpdateApnsChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateApnsChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables the APNs sandbox channel for an application or updates the status and settings of the APNs sandbox channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApnsSandboxChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateApnsSandboxChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateApnsSandboxChannelRequest
 @see AWSPinpointTargetingUpdateApnsSandboxChannelResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateApnsSandboxChannelResponse *> *)updateApnsSandboxChannel:(AWSPinpointTargetingUpdateApnsSandboxChannelRequest *)request;

/**
 <p>Enables the APNs sandbox channel for an application or updates the status and settings of the APNs sandbox channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApnsSandboxChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateApnsSandboxChannelRequest
 @see AWSPinpointTargetingUpdateApnsSandboxChannelResponse
 */
- (void)updateApnsSandboxChannel:(AWSPinpointTargetingUpdateApnsSandboxChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateApnsSandboxChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables the APNs VoIP channel for an application or updates the status and settings of the APNs VoIP channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApnsVoipChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateApnsVoipChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateApnsVoipChannelRequest
 @see AWSPinpointTargetingUpdateApnsVoipChannelResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateApnsVoipChannelResponse *> *)updateApnsVoipChannel:(AWSPinpointTargetingUpdateApnsVoipChannelRequest *)request;

/**
 <p>Enables the APNs VoIP channel for an application or updates the status and settings of the APNs VoIP channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApnsVoipChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateApnsVoipChannelRequest
 @see AWSPinpointTargetingUpdateApnsVoipChannelResponse
 */
- (void)updateApnsVoipChannel:(AWSPinpointTargetingUpdateApnsVoipChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateApnsVoipChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables the APNs VoIP sandbox channel for an application or updates the status and settings of the APNs VoIP sandbox channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApnsVoipSandboxChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateApnsVoipSandboxChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateApnsVoipSandboxChannelRequest
 @see AWSPinpointTargetingUpdateApnsVoipSandboxChannelResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateApnsVoipSandboxChannelResponse *> *)updateApnsVoipSandboxChannel:(AWSPinpointTargetingUpdateApnsVoipSandboxChannelRequest *)request;

/**
 <p>Enables the APNs VoIP sandbox channel for an application or updates the status and settings of the APNs VoIP sandbox channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApnsVoipSandboxChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateApnsVoipSandboxChannelRequest
 @see AWSPinpointTargetingUpdateApnsVoipSandboxChannelResponse
 */
- (void)updateApnsVoipSandboxChannel:(AWSPinpointTargetingUpdateApnsVoipSandboxChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateApnsVoipSandboxChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the settings for an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApplicationSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateApplicationSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateApplicationSettingsRequest
 @see AWSPinpointTargetingUpdateApplicationSettingsResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateApplicationSettingsResponse *> *)updateApplicationSettings:(AWSPinpointTargetingUpdateApplicationSettingsRequest *)request;

/**
 <p>Updates the settings for an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApplicationSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateApplicationSettingsRequest
 @see AWSPinpointTargetingUpdateApplicationSettingsResponse
 */
- (void)updateApplicationSettings:(AWSPinpointTargetingUpdateApplicationSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateApplicationSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables the Baidu channel for an application or updates the status and settings of the Baidu channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateBaiduChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateBaiduChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateBaiduChannelRequest
 @see AWSPinpointTargetingUpdateBaiduChannelResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateBaiduChannelResponse *> *)updateBaiduChannel:(AWSPinpointTargetingUpdateBaiduChannelRequest *)request;

/**
 <p>Enables the Baidu channel for an application or updates the status and settings of the Baidu channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateBaiduChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateBaiduChannelRequest
 @see AWSPinpointTargetingUpdateBaiduChannelResponse
 */
- (void)updateBaiduChannel:(AWSPinpointTargetingUpdateBaiduChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateBaiduChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the configuration and other settings for a campaign.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCampaign service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateCampaignResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateCampaignRequest
 @see AWSPinpointTargetingUpdateCampaignResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateCampaignResponse *> *)updateCampaign:(AWSPinpointTargetingUpdateCampaignRequest *)request;

/**
 <p>Updates the configuration and other settings for a campaign.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCampaign service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateCampaignRequest
 @see AWSPinpointTargetingUpdateCampaignResponse
 */
- (void)updateCampaign:(AWSPinpointTargetingUpdateCampaignRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateCampaignResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables the email channel for an application or updates the status and settings of the email channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEmailChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateEmailChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateEmailChannelRequest
 @see AWSPinpointTargetingUpdateEmailChannelResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateEmailChannelResponse *> *)updateEmailChannel:(AWSPinpointTargetingUpdateEmailChannelRequest *)request;

/**
 <p>Enables the email channel for an application or updates the status and settings of the email channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEmailChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateEmailChannelRequest
 @see AWSPinpointTargetingUpdateEmailChannelResponse
 */
- (void)updateEmailChannel:(AWSPinpointTargetingUpdateEmailChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateEmailChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing message template for messages that are sent through the email channel.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEmailTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateEmailTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateEmailTemplateRequest
 @see AWSPinpointTargetingUpdateEmailTemplateResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateEmailTemplateResponse *> *)updateEmailTemplate:(AWSPinpointTargetingUpdateEmailTemplateRequest *)request;

/**
 <p>Updates an existing message template for messages that are sent through the email channel.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEmailTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateEmailTemplateRequest
 @see AWSPinpointTargetingUpdateEmailTemplateResponse
 */
- (void)updateEmailTemplate:(AWSPinpointTargetingUpdateEmailTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateEmailTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new endpoint for an application or updates the settings and attributes of an existing endpoint for an application. You can also use this operation to define custom attributes (Attributes, Metrics, and UserAttributes properties) for an endpoint.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateEndpointRequest
 @see AWSPinpointTargetingUpdateEndpointResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateEndpointResponse *> *)updateEndpoint:(AWSPinpointTargetingUpdateEndpointRequest *)request;

/**
 <p>Creates a new endpoint for an application or updates the settings and attributes of an existing endpoint for an application. You can also use this operation to define custom attributes (Attributes, Metrics, and UserAttributes properties) for an endpoint.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateEndpointRequest
 @see AWSPinpointTargetingUpdateEndpointResponse
 */
- (void)updateEndpoint:(AWSPinpointTargetingUpdateEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
  <p>Creates a new batch of endpoints for an application or updates the settings and attributes of a batch of existing endpoints for an application. You can also use this operation to define custom attributes (Attributes, Metrics, and UserAttributes properties) for a batch of endpoints.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEndpointsBatch service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateEndpointsBatchResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateEndpointsBatchRequest
 @see AWSPinpointTargetingUpdateEndpointsBatchResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateEndpointsBatchResponse *> *)updateEndpointsBatch:(AWSPinpointTargetingUpdateEndpointsBatchRequest *)request;

/**
  <p>Creates a new batch of endpoints for an application or updates the settings and attributes of a batch of existing endpoints for an application. You can also use this operation to define custom attributes (Attributes, Metrics, and UserAttributes properties) for a batch of endpoints.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEndpointsBatch service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateEndpointsBatchRequest
 @see AWSPinpointTargetingUpdateEndpointsBatchResponse
 */
- (void)updateEndpointsBatch:(AWSPinpointTargetingUpdateEndpointsBatchRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateEndpointsBatchResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables the GCM channel for an application or updates the status and settings of the GCM channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateGcmChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateGcmChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateGcmChannelRequest
 @see AWSPinpointTargetingUpdateGcmChannelResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateGcmChannelResponse *> *)updateGcmChannel:(AWSPinpointTargetingUpdateGcmChannelRequest *)request;

/**
 <p>Enables the GCM channel for an application or updates the status and settings of the GCM channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateGcmChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateGcmChannelRequest
 @see AWSPinpointTargetingUpdateGcmChannelResponse
 */
- (void)updateGcmChannel:(AWSPinpointTargetingUpdateGcmChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateGcmChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the configuration and other settings for a journey.</p>
 
 @param request A container for the necessary parameters to execute the UpdateJourney service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateJourneyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateJourneyRequest
 @see AWSPinpointTargetingUpdateJourneyResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateJourneyResponse *> *)updateJourney:(AWSPinpointTargetingUpdateJourneyRequest *)request;

/**
 <p>Updates the configuration and other settings for a journey.</p>
 
 @param request A container for the necessary parameters to execute the UpdateJourney service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateJourneyRequest
 @see AWSPinpointTargetingUpdateJourneyResponse
 */
- (void)updateJourney:(AWSPinpointTargetingUpdateJourneyRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateJourneyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels (stops) an active journey.</p>
 
 @param request A container for the necessary parameters to execute the UpdateJourneyState service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateJourneyStateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateJourneyStateRequest
 @see AWSPinpointTargetingUpdateJourneyStateResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateJourneyStateResponse *> *)updateJourneyState:(AWSPinpointTargetingUpdateJourneyStateRequest *)request;

/**
 <p>Cancels (stops) an active journey.</p>
 
 @param request A container for the necessary parameters to execute the UpdateJourneyState service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateJourneyStateRequest
 @see AWSPinpointTargetingUpdateJourneyStateResponse
 */
- (void)updateJourneyState:(AWSPinpointTargetingUpdateJourneyStateRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateJourneyStateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing message template for messages that are sent through a push notification channel.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePushTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdatePushTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdatePushTemplateRequest
 @see AWSPinpointTargetingUpdatePushTemplateResponse
 */
- (AWSTask<AWSPinpointTargetingUpdatePushTemplateResponse *> *)updatePushTemplate:(AWSPinpointTargetingUpdatePushTemplateRequest *)request;

/**
 <p>Updates an existing message template for messages that are sent through a push notification channel.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePushTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdatePushTemplateRequest
 @see AWSPinpointTargetingUpdatePushTemplateResponse
 */
- (void)updatePushTemplate:(AWSPinpointTargetingUpdatePushTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdatePushTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an Amazon Pinpoint configuration for a recommender model.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRecommenderConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateRecommenderConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateRecommenderConfigurationRequest
 @see AWSPinpointTargetingUpdateRecommenderConfigurationResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateRecommenderConfigurationResponse *> *)updateRecommenderConfiguration:(AWSPinpointTargetingUpdateRecommenderConfigurationRequest *)request;

/**
 <p>Updates an Amazon Pinpoint configuration for a recommender model.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRecommenderConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateRecommenderConfigurationRequest
 @see AWSPinpointTargetingUpdateRecommenderConfigurationResponse
 */
- (void)updateRecommenderConfiguration:(AWSPinpointTargetingUpdateRecommenderConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateRecommenderConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new segment for an application or updates the configuration, dimension, and other settings for an existing segment that's associated with an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSegment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateSegmentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateSegmentRequest
 @see AWSPinpointTargetingUpdateSegmentResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateSegmentResponse *> *)updateSegment:(AWSPinpointTargetingUpdateSegmentRequest *)request;

/**
 <p>Creates a new segment for an application or updates the configuration, dimension, and other settings for an existing segment that's associated with an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSegment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateSegmentRequest
 @see AWSPinpointTargetingUpdateSegmentResponse
 */
- (void)updateSegment:(AWSPinpointTargetingUpdateSegmentRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateSegmentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables the SMS channel for an application or updates the status and settings of the SMS channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSmsChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateSmsChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateSmsChannelRequest
 @see AWSPinpointTargetingUpdateSmsChannelResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateSmsChannelResponse *> *)updateSmsChannel:(AWSPinpointTargetingUpdateSmsChannelRequest *)request;

/**
 <p>Enables the SMS channel for an application or updates the status and settings of the SMS channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSmsChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateSmsChannelRequest
 @see AWSPinpointTargetingUpdateSmsChannelResponse
 */
- (void)updateSmsChannel:(AWSPinpointTargetingUpdateSmsChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateSmsChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing message template for messages that are sent through the SMS channel.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSmsTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateSmsTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateSmsTemplateRequest
 @see AWSPinpointTargetingUpdateSmsTemplateResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateSmsTemplateResponse *> *)updateSmsTemplate:(AWSPinpointTargetingUpdateSmsTemplateRequest *)request;

/**
 <p>Updates an existing message template for messages that are sent through the SMS channel.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSmsTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateSmsTemplateRequest
 @see AWSPinpointTargetingUpdateSmsTemplateResponse
 */
- (void)updateSmsTemplate:(AWSPinpointTargetingUpdateSmsTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateSmsTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Changes the status of a specific version of a message template to <i>active</i>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTemplateActiveVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateTemplateActiveVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateTemplateActiveVersionRequest
 @see AWSPinpointTargetingUpdateTemplateActiveVersionResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateTemplateActiveVersionResponse *> *)updateTemplateActiveVersion:(AWSPinpointTargetingUpdateTemplateActiveVersionRequest *)request;

/**
 <p>Changes the status of a specific version of a message template to <i>active</i>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTemplateActiveVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateTemplateActiveVersionRequest
 @see AWSPinpointTargetingUpdateTemplateActiveVersionResponse
 */
- (void)updateTemplateActiveVersion:(AWSPinpointTargetingUpdateTemplateActiveVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateTemplateActiveVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables the voice channel for an application or updates the status and settings of the voice channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVoiceChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateVoiceChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateVoiceChannelRequest
 @see AWSPinpointTargetingUpdateVoiceChannelResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateVoiceChannelResponse *> *)updateVoiceChannel:(AWSPinpointTargetingUpdateVoiceChannelRequest *)request;

/**
 <p>Enables the voice channel for an application or updates the status and settings of the voice channel for an application.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVoiceChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateVoiceChannelRequest
 @see AWSPinpointTargetingUpdateVoiceChannelResponse
 */
- (void)updateVoiceChannel:(AWSPinpointTargetingUpdateVoiceChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateVoiceChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing message template for messages that are sent through the voice channel.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVoiceTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPinpointTargetingUpdateVoiceTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateVoiceTemplateRequest
 @see AWSPinpointTargetingUpdateVoiceTemplateResponse
 */
- (AWSTask<AWSPinpointTargetingUpdateVoiceTemplateResponse *> *)updateVoiceTemplate:(AWSPinpointTargetingUpdateVoiceTemplateRequest *)request;

/**
 <p>Updates an existing message template for messages that are sent through the voice channel.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVoiceTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPinpointTargetingErrorDomain` domain and the following error code: `AWSPinpointTargetingErrorBadRequest`, `AWSPinpointTargetingErrorInternalServerError`, `AWSPinpointTargetingErrorPayloadTooLarge`, `AWSPinpointTargetingErrorForbidden`, `AWSPinpointTargetingErrorNotFound`, `AWSPinpointTargetingErrorMethodNotAllowed`, `AWSPinpointTargetingErrorTooManyRequests`.
 
 @see AWSPinpointTargetingUpdateVoiceTemplateRequest
 @see AWSPinpointTargetingUpdateVoiceTemplateResponse
 */
- (void)updateVoiceTemplate:(AWSPinpointTargetingUpdateVoiceTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSPinpointTargetingUpdateVoiceTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
