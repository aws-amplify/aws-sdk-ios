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
#import "AWSMedialiveModel.h"
#import "AWSMedialiveResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSMedialive
FOUNDATION_EXPORT NSString *const AWSMedialiveSDKVersion;

/**
 API for AWS Elemental MediaLive
 */
@interface AWSMedialive : AWSService

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

     let Medialive = AWSMedialive.default()

 *Objective-C*

     AWSMedialive *Medialive = [AWSMedialive defaultMedialive];

 @return The default service client.
 */
+ (instancetype)defaultMedialive;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSMedialive.register(with: configuration!, forKey: "USWest2Medialive")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSMedialive registerMedialiveWithConfiguration:configuration forKey:@"USWest2Medialive"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Medialive = AWSMedialive(forKey: "USWest2Medialive")

 *Objective-C*

     AWSMedialive *Medialive = [AWSMedialive MedialiveForKey:@"USWest2Medialive"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerMedialiveWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerMedialiveWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSMedialive.register(with: configuration!, forKey: "USWest2Medialive")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSMedialive registerMedialiveWithConfiguration:configuration forKey:@"USWest2Medialive"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Medialive = AWSMedialive(forKey: "USWest2Medialive")

 *Objective-C*

     AWSMedialive *Medialive = [AWSMedialive MedialiveForKey:@"USWest2Medialive"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)MedialiveForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeMedialiveForKey:(NSString *)key;

/**
 Update a channel schedule
 
 @param request A container for the necessary parameters to execute the BatchUpdateSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveBatchUpdateScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorUnprocessableEntity`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveBatchUpdateScheduleRequest
 @see AWSMedialiveBatchUpdateScheduleResponse
 */
- (AWSTask<AWSMedialiveBatchUpdateScheduleResponse *> *)batchUpdateSchedule:(AWSMedialiveBatchUpdateScheduleRequest *)request;

/**
 Update a channel schedule
 
 @param request A container for the necessary parameters to execute the BatchUpdateSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorUnprocessableEntity`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveBatchUpdateScheduleRequest
 @see AWSMedialiveBatchUpdateScheduleResponse
 */
- (void)batchUpdateSchedule:(AWSMedialiveBatchUpdateScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveBatchUpdateScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Creates a new channel
 
 @param request A container for the necessary parameters to execute the CreateChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveCreateChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorUnprocessableEntity`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveCreateChannelRequest
 @see AWSMedialiveCreateChannelResponse
 */
- (AWSTask<AWSMedialiveCreateChannelResponse *> *)createChannel:(AWSMedialiveCreateChannelRequest *)request;

/**
 Creates a new channel
 
 @param request A container for the necessary parameters to execute the CreateChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorUnprocessableEntity`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveCreateChannelRequest
 @see AWSMedialiveCreateChannelResponse
 */
- (void)createChannel:(AWSMedialiveCreateChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveCreateChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Create an input
 
 @param request A container for the necessary parameters to execute the CreateInput service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveCreateInputResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveCreateInputRequest
 @see AWSMedialiveCreateInputResponse
 */
- (AWSTask<AWSMedialiveCreateInputResponse *> *)createInput:(AWSMedialiveCreateInputRequest *)request;

/**
 Create an input
 
 @param request A container for the necessary parameters to execute the CreateInput service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveCreateInputRequest
 @see AWSMedialiveCreateInputResponse
 */
- (void)createInput:(AWSMedialiveCreateInputRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveCreateInputResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Creates a Input Security Group
 
 @param request A container for the necessary parameters to execute the CreateInputSecurityGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveCreateInputSecurityGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveCreateInputSecurityGroupRequest
 @see AWSMedialiveCreateInputSecurityGroupResponse
 */
- (AWSTask<AWSMedialiveCreateInputSecurityGroupResponse *> *)createInputSecurityGroup:(AWSMedialiveCreateInputSecurityGroupRequest *)request;

/**
 Creates a Input Security Group
 
 @param request A container for the necessary parameters to execute the CreateInputSecurityGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveCreateInputSecurityGroupRequest
 @see AWSMedialiveCreateInputSecurityGroupResponse
 */
- (void)createInputSecurityGroup:(AWSMedialiveCreateInputSecurityGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveCreateInputSecurityGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Create a new multiplex.
 
 @param request A container for the necessary parameters to execute the CreateMultiplex service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveCreateMultiplexResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorUnprocessableEntity`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveCreateMultiplexRequest
 @see AWSMedialiveCreateMultiplexResponse
 */
- (AWSTask<AWSMedialiveCreateMultiplexResponse *> *)createMultiplex:(AWSMedialiveCreateMultiplexRequest *)request;

/**
 Create a new multiplex.
 
 @param request A container for the necessary parameters to execute the CreateMultiplex service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorUnprocessableEntity`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveCreateMultiplexRequest
 @see AWSMedialiveCreateMultiplexResponse
 */
- (void)createMultiplex:(AWSMedialiveCreateMultiplexRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveCreateMultiplexResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Create a new program in the multiplex.
 
 @param request A container for the necessary parameters to execute the CreateMultiplexProgram service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveCreateMultiplexProgramResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorUnprocessableEntity`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveCreateMultiplexProgramRequest
 @see AWSMedialiveCreateMultiplexProgramResponse
 */
- (AWSTask<AWSMedialiveCreateMultiplexProgramResponse *> *)createMultiplexProgram:(AWSMedialiveCreateMultiplexProgramRequest *)request;

/**
 Create a new program in the multiplex.
 
 @param request A container for the necessary parameters to execute the CreateMultiplexProgram service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorUnprocessableEntity`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveCreateMultiplexProgramRequest
 @see AWSMedialiveCreateMultiplexProgramResponse
 */
- (void)createMultiplexProgram:(AWSMedialiveCreateMultiplexProgramRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveCreateMultiplexProgramResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Create tags for a resource
 
 @param request A container for the necessary parameters to execute the CreateTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`.
 
 @see AWSMedialiveCreateTagsRequest
 */
- (AWSTask *)createTags:(AWSMedialiveCreateTagsRequest *)request;

/**
 Create tags for a resource
 
 @param request A container for the necessary parameters to execute the CreateTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`.
 
 @see AWSMedialiveCreateTagsRequest
 */
- (void)createTags:(AWSMedialiveCreateTagsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Starts deletion of channel. The associated outputs are also deleted.
 
 @param request A container for the necessary parameters to execute the DeleteChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveDeleteChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveDeleteChannelRequest
 @see AWSMedialiveDeleteChannelResponse
 */
- (AWSTask<AWSMedialiveDeleteChannelResponse *> *)deleteChannel:(AWSMedialiveDeleteChannelRequest *)request;

/**
 Starts deletion of channel. The associated outputs are also deleted.
 
 @param request A container for the necessary parameters to execute the DeleteChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveDeleteChannelRequest
 @see AWSMedialiveDeleteChannelResponse
 */
- (void)deleteChannel:(AWSMedialiveDeleteChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveDeleteChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes the input end point
 
 @param request A container for the necessary parameters to execute the DeleteInput service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveDeleteInputResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveDeleteInputRequest
 @see AWSMedialiveDeleteInputResponse
 */
- (AWSTask<AWSMedialiveDeleteInputResponse *> *)deleteInput:(AWSMedialiveDeleteInputRequest *)request;

/**
 Deletes the input end point
 
 @param request A container for the necessary parameters to execute the DeleteInput service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveDeleteInputRequest
 @see AWSMedialiveDeleteInputResponse
 */
- (void)deleteInput:(AWSMedialiveDeleteInputRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveDeleteInputResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes an Input Security Group
 
 @param request A container for the necessary parameters to execute the DeleteInputSecurityGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveDeleteInputSecurityGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveDeleteInputSecurityGroupRequest
 @see AWSMedialiveDeleteInputSecurityGroupResponse
 */
- (AWSTask<AWSMedialiveDeleteInputSecurityGroupResponse *> *)deleteInputSecurityGroup:(AWSMedialiveDeleteInputSecurityGroupRequest *)request;

/**
 Deletes an Input Security Group
 
 @param request A container for the necessary parameters to execute the DeleteInputSecurityGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveDeleteInputSecurityGroupRequest
 @see AWSMedialiveDeleteInputSecurityGroupResponse
 */
- (void)deleteInputSecurityGroup:(AWSMedialiveDeleteInputSecurityGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveDeleteInputSecurityGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Delete a multiplex. The multiplex must be idle.
 
 @param request A container for the necessary parameters to execute the DeleteMultiplex service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveDeleteMultiplexResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveDeleteMultiplexRequest
 @see AWSMedialiveDeleteMultiplexResponse
 */
- (AWSTask<AWSMedialiveDeleteMultiplexResponse *> *)deleteMultiplex:(AWSMedialiveDeleteMultiplexRequest *)request;

/**
 Delete a multiplex. The multiplex must be idle.
 
 @param request A container for the necessary parameters to execute the DeleteMultiplex service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveDeleteMultiplexRequest
 @see AWSMedialiveDeleteMultiplexResponse
 */
- (void)deleteMultiplex:(AWSMedialiveDeleteMultiplexRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveDeleteMultiplexResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Delete a program from a multiplex.
 
 @param request A container for the necessary parameters to execute the DeleteMultiplexProgram service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveDeleteMultiplexProgramResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveDeleteMultiplexProgramRequest
 @see AWSMedialiveDeleteMultiplexProgramResponse
 */
- (AWSTask<AWSMedialiveDeleteMultiplexProgramResponse *> *)deleteMultiplexProgram:(AWSMedialiveDeleteMultiplexProgramRequest *)request;

/**
 Delete a program from a multiplex.
 
 @param request A container for the necessary parameters to execute the DeleteMultiplexProgram service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveDeleteMultiplexProgramRequest
 @see AWSMedialiveDeleteMultiplexProgramResponse
 */
- (void)deleteMultiplexProgram:(AWSMedialiveDeleteMultiplexProgramRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveDeleteMultiplexProgramResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Delete an expired reservation.
 
 @param request A container for the necessary parameters to execute the DeleteReservation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveDeleteReservationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveDeleteReservationRequest
 @see AWSMedialiveDeleteReservationResponse
 */
- (AWSTask<AWSMedialiveDeleteReservationResponse *> *)deleteReservation:(AWSMedialiveDeleteReservationRequest *)request;

/**
 Delete an expired reservation.
 
 @param request A container for the necessary parameters to execute the DeleteReservation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveDeleteReservationRequest
 @see AWSMedialiveDeleteReservationResponse
 */
- (void)deleteReservation:(AWSMedialiveDeleteReservationRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveDeleteReservationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Delete all schedule actions on a channel.
 
 @param request A container for the necessary parameters to execute the DeleteSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveDeleteScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveDeleteScheduleRequest
 @see AWSMedialiveDeleteScheduleResponse
 */
- (AWSTask<AWSMedialiveDeleteScheduleResponse *> *)deleteSchedule:(AWSMedialiveDeleteScheduleRequest *)request;

/**
 Delete all schedule actions on a channel.
 
 @param request A container for the necessary parameters to execute the DeleteSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveDeleteScheduleRequest
 @see AWSMedialiveDeleteScheduleResponse
 */
- (void)deleteSchedule:(AWSMedialiveDeleteScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveDeleteScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Removes tags for a resource
 
 @param request A container for the necessary parameters to execute the DeleteTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`.
 
 @see AWSMedialiveDeleteTagsRequest
 */
- (AWSTask *)deleteTags:(AWSMedialiveDeleteTagsRequest *)request;

/**
 Removes tags for a resource
 
 @param request A container for the necessary parameters to execute the DeleteTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`.
 
 @see AWSMedialiveDeleteTagsRequest
 */
- (void)deleteTags:(AWSMedialiveDeleteTagsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Gets details about a channel
 
 @param request A container for the necessary parameters to execute the DescribeChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveDescribeChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveDescribeChannelRequest
 @see AWSMedialiveDescribeChannelResponse
 */
- (AWSTask<AWSMedialiveDescribeChannelResponse *> *)describeChannel:(AWSMedialiveDescribeChannelRequest *)request;

/**
 Gets details about a channel
 
 @param request A container for the necessary parameters to execute the DescribeChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveDescribeChannelRequest
 @see AWSMedialiveDescribeChannelResponse
 */
- (void)describeChannel:(AWSMedialiveDescribeChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveDescribeChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Produces details about an input
 
 @param request A container for the necessary parameters to execute the DescribeInput service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveDescribeInputResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveDescribeInputRequest
 @see AWSMedialiveDescribeInputResponse
 */
- (AWSTask<AWSMedialiveDescribeInputResponse *> *)describeInput:(AWSMedialiveDescribeInputRequest *)request;

/**
 Produces details about an input
 
 @param request A container for the necessary parameters to execute the DescribeInput service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveDescribeInputRequest
 @see AWSMedialiveDescribeInputResponse
 */
- (void)describeInput:(AWSMedialiveDescribeInputRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveDescribeInputResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Gets the details for the input device
 
 @param request A container for the necessary parameters to execute the DescribeInputDevice service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveDescribeInputDeviceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveDescribeInputDeviceRequest
 @see AWSMedialiveDescribeInputDeviceResponse
 */
- (AWSTask<AWSMedialiveDescribeInputDeviceResponse *> *)describeInputDevice:(AWSMedialiveDescribeInputDeviceRequest *)request;

/**
 Gets the details for the input device
 
 @param request A container for the necessary parameters to execute the DescribeInputDevice service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveDescribeInputDeviceRequest
 @see AWSMedialiveDescribeInputDeviceResponse
 */
- (void)describeInputDevice:(AWSMedialiveDescribeInputDeviceRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveDescribeInputDeviceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Produces a summary of an Input Security Group
 
 @param request A container for the necessary parameters to execute the DescribeInputSecurityGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveDescribeInputSecurityGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveDescribeInputSecurityGroupRequest
 @see AWSMedialiveDescribeInputSecurityGroupResponse
 */
- (AWSTask<AWSMedialiveDescribeInputSecurityGroupResponse *> *)describeInputSecurityGroup:(AWSMedialiveDescribeInputSecurityGroupRequest *)request;

/**
 Produces a summary of an Input Security Group
 
 @param request A container for the necessary parameters to execute the DescribeInputSecurityGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveDescribeInputSecurityGroupRequest
 @see AWSMedialiveDescribeInputSecurityGroupResponse
 */
- (void)describeInputSecurityGroup:(AWSMedialiveDescribeInputSecurityGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveDescribeInputSecurityGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Gets details about a multiplex.
 
 @param request A container for the necessary parameters to execute the DescribeMultiplex service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveDescribeMultiplexResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveDescribeMultiplexRequest
 @see AWSMedialiveDescribeMultiplexResponse
 */
- (AWSTask<AWSMedialiveDescribeMultiplexResponse *> *)describeMultiplex:(AWSMedialiveDescribeMultiplexRequest *)request;

/**
 Gets details about a multiplex.
 
 @param request A container for the necessary parameters to execute the DescribeMultiplex service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveDescribeMultiplexRequest
 @see AWSMedialiveDescribeMultiplexResponse
 */
- (void)describeMultiplex:(AWSMedialiveDescribeMultiplexRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveDescribeMultiplexResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Get the details for a program in a multiplex.
 
 @param request A container for the necessary parameters to execute the DescribeMultiplexProgram service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveDescribeMultiplexProgramResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveDescribeMultiplexProgramRequest
 @see AWSMedialiveDescribeMultiplexProgramResponse
 */
- (AWSTask<AWSMedialiveDescribeMultiplexProgramResponse *> *)describeMultiplexProgram:(AWSMedialiveDescribeMultiplexProgramRequest *)request;

/**
 Get the details for a program in a multiplex.
 
 @param request A container for the necessary parameters to execute the DescribeMultiplexProgram service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveDescribeMultiplexProgramRequest
 @see AWSMedialiveDescribeMultiplexProgramResponse
 */
- (void)describeMultiplexProgram:(AWSMedialiveDescribeMultiplexProgramRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveDescribeMultiplexProgramResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Get details for an offering.
 
 @param request A container for the necessary parameters to execute the DescribeOffering service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveDescribeOfferingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveDescribeOfferingRequest
 @see AWSMedialiveDescribeOfferingResponse
 */
- (AWSTask<AWSMedialiveDescribeOfferingResponse *> *)describeOffering:(AWSMedialiveDescribeOfferingRequest *)request;

/**
 Get details for an offering.
 
 @param request A container for the necessary parameters to execute the DescribeOffering service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveDescribeOfferingRequest
 @see AWSMedialiveDescribeOfferingResponse
 */
- (void)describeOffering:(AWSMedialiveDescribeOfferingRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveDescribeOfferingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Get details for a reservation.
 
 @param request A container for the necessary parameters to execute the DescribeReservation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveDescribeReservationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveDescribeReservationRequest
 @see AWSMedialiveDescribeReservationResponse
 */
- (AWSTask<AWSMedialiveDescribeReservationResponse *> *)describeReservation:(AWSMedialiveDescribeReservationRequest *)request;

/**
 Get details for a reservation.
 
 @param request A container for the necessary parameters to execute the DescribeReservation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveDescribeReservationRequest
 @see AWSMedialiveDescribeReservationResponse
 */
- (void)describeReservation:(AWSMedialiveDescribeReservationRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveDescribeReservationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Get a channel schedule
 
 @param request A container for the necessary parameters to execute the DescribeSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveDescribeScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveDescribeScheduleRequest
 @see AWSMedialiveDescribeScheduleResponse
 */
- (AWSTask<AWSMedialiveDescribeScheduleResponse *> *)describeSchedule:(AWSMedialiveDescribeScheduleRequest *)request;

/**
 Get a channel schedule
 
 @param request A container for the necessary parameters to execute the DescribeSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveDescribeScheduleRequest
 @see AWSMedialiveDescribeScheduleResponse
 */
- (void)describeSchedule:(AWSMedialiveDescribeScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveDescribeScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Produces list of channels that have been created
 
 @param request A container for the necessary parameters to execute the ListChannels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveListChannelsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveListChannelsRequest
 @see AWSMedialiveListChannelsResponse
 */
- (AWSTask<AWSMedialiveListChannelsResponse *> *)listChannels:(AWSMedialiveListChannelsRequest *)request;

/**
 Produces list of channels that have been created
 
 @param request A container for the necessary parameters to execute the ListChannels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveListChannelsRequest
 @see AWSMedialiveListChannelsResponse
 */
- (void)listChannels:(AWSMedialiveListChannelsRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveListChannelsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 List input devices
 
 @param request A container for the necessary parameters to execute the ListInputDevices service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveListInputDevicesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveListInputDevicesRequest
 @see AWSMedialiveListInputDevicesResponse
 */
- (AWSTask<AWSMedialiveListInputDevicesResponse *> *)listInputDevices:(AWSMedialiveListInputDevicesRequest *)request;

/**
 List input devices
 
 @param request A container for the necessary parameters to execute the ListInputDevices service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveListInputDevicesRequest
 @see AWSMedialiveListInputDevicesResponse
 */
- (void)listInputDevices:(AWSMedialiveListInputDevicesRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveListInputDevicesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Produces a list of Input Security Groups for an account
 
 @param request A container for the necessary parameters to execute the ListInputSecurityGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveListInputSecurityGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveListInputSecurityGroupsRequest
 @see AWSMedialiveListInputSecurityGroupsResponse
 */
- (AWSTask<AWSMedialiveListInputSecurityGroupsResponse *> *)listInputSecurityGroups:(AWSMedialiveListInputSecurityGroupsRequest *)request;

/**
 Produces a list of Input Security Groups for an account
 
 @param request A container for the necessary parameters to execute the ListInputSecurityGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveListInputSecurityGroupsRequest
 @see AWSMedialiveListInputSecurityGroupsResponse
 */
- (void)listInputSecurityGroups:(AWSMedialiveListInputSecurityGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveListInputSecurityGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Produces list of inputs that have been created
 
 @param request A container for the necessary parameters to execute the ListInputs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveListInputsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveListInputsRequest
 @see AWSMedialiveListInputsResponse
 */
- (AWSTask<AWSMedialiveListInputsResponse *> *)listInputs:(AWSMedialiveListInputsRequest *)request;

/**
 Produces list of inputs that have been created
 
 @param request A container for the necessary parameters to execute the ListInputs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveListInputsRequest
 @see AWSMedialiveListInputsResponse
 */
- (void)listInputs:(AWSMedialiveListInputsRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveListInputsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 List the programs that currently exist for a specific multiplex.
 
 @param request A container for the necessary parameters to execute the ListMultiplexPrograms service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveListMultiplexProgramsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveListMultiplexProgramsRequest
 @see AWSMedialiveListMultiplexProgramsResponse
 */
- (AWSTask<AWSMedialiveListMultiplexProgramsResponse *> *)listMultiplexPrograms:(AWSMedialiveListMultiplexProgramsRequest *)request;

/**
 List the programs that currently exist for a specific multiplex.
 
 @param request A container for the necessary parameters to execute the ListMultiplexPrograms service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveListMultiplexProgramsRequest
 @see AWSMedialiveListMultiplexProgramsResponse
 */
- (void)listMultiplexPrograms:(AWSMedialiveListMultiplexProgramsRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveListMultiplexProgramsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Retrieve a list of the existing multiplexes.
 
 @param request A container for the necessary parameters to execute the ListMultiplexes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveListMultiplexesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveListMultiplexesRequest
 @see AWSMedialiveListMultiplexesResponse
 */
- (AWSTask<AWSMedialiveListMultiplexesResponse *> *)listMultiplexes:(AWSMedialiveListMultiplexesRequest *)request;

/**
 Retrieve a list of the existing multiplexes.
 
 @param request A container for the necessary parameters to execute the ListMultiplexes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveListMultiplexesRequest
 @see AWSMedialiveListMultiplexesResponse
 */
- (void)listMultiplexes:(AWSMedialiveListMultiplexesRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveListMultiplexesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 List offerings available for purchase.
 
 @param request A container for the necessary parameters to execute the ListOfferings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveListOfferingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveListOfferingsRequest
 @see AWSMedialiveListOfferingsResponse
 */
- (AWSTask<AWSMedialiveListOfferingsResponse *> *)listOfferings:(AWSMedialiveListOfferingsRequest *)request;

/**
 List offerings available for purchase.
 
 @param request A container for the necessary parameters to execute the ListOfferings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveListOfferingsRequest
 @see AWSMedialiveListOfferingsResponse
 */
- (void)listOfferings:(AWSMedialiveListOfferingsRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveListOfferingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 List purchased reservations.
 
 @param request A container for the necessary parameters to execute the ListReservations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveListReservationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveListReservationsRequest
 @see AWSMedialiveListReservationsResponse
 */
- (AWSTask<AWSMedialiveListReservationsResponse *> *)listReservations:(AWSMedialiveListReservationsRequest *)request;

/**
 List purchased reservations.
 
 @param request A container for the necessary parameters to execute the ListReservations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveListReservationsRequest
 @see AWSMedialiveListReservationsResponse
 */
- (void)listReservations:(AWSMedialiveListReservationsRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveListReservationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Produces list of tags that have been created for a resource
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`.
 
 @see AWSMedialiveListTagsForResourceRequest
 @see AWSMedialiveListTagsForResourceResponse
 */
- (AWSTask<AWSMedialiveListTagsForResourceResponse *> *)listTagsForResource:(AWSMedialiveListTagsForResourceRequest *)request;

/**
 Produces list of tags that have been created for a resource
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`.
 
 @see AWSMedialiveListTagsForResourceRequest
 @see AWSMedialiveListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSMedialiveListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Purchase an offering and create a reservation.
 
 @param request A container for the necessary parameters to execute the PurchaseOffering service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialivePurchaseOfferingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialivePurchaseOfferingRequest
 @see AWSMedialivePurchaseOfferingResponse
 */
- (AWSTask<AWSMedialivePurchaseOfferingResponse *> *)purchaseOffering:(AWSMedialivePurchaseOfferingRequest *)request;

/**
 Purchase an offering and create a reservation.
 
 @param request A container for the necessary parameters to execute the PurchaseOffering service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialivePurchaseOfferingRequest
 @see AWSMedialivePurchaseOfferingResponse
 */
- (void)purchaseOffering:(AWSMedialivePurchaseOfferingRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialivePurchaseOfferingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Starts an existing channel
 
 @param request A container for the necessary parameters to execute the StartChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveStartChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveStartChannelRequest
 @see AWSMedialiveStartChannelResponse
 */
- (AWSTask<AWSMedialiveStartChannelResponse *> *)startChannel:(AWSMedialiveStartChannelRequest *)request;

/**
 Starts an existing channel
 
 @param request A container for the necessary parameters to execute the StartChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveStartChannelRequest
 @see AWSMedialiveStartChannelResponse
 */
- (void)startChannel:(AWSMedialiveStartChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveStartChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Start (run) the multiplex. Starting the multiplex does not start the channels. You must explicitly start each channel.
 
 @param request A container for the necessary parameters to execute the StartMultiplex service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveStartMultiplexResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveStartMultiplexRequest
 @see AWSMedialiveStartMultiplexResponse
 */
- (AWSTask<AWSMedialiveStartMultiplexResponse *> *)startMultiplex:(AWSMedialiveStartMultiplexRequest *)request;

/**
 Start (run) the multiplex. Starting the multiplex does not start the channels. You must explicitly start each channel.
 
 @param request A container for the necessary parameters to execute the StartMultiplex service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveStartMultiplexRequest
 @see AWSMedialiveStartMultiplexResponse
 */
- (void)startMultiplex:(AWSMedialiveStartMultiplexRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveStartMultiplexResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Stops a running channel
 
 @param request A container for the necessary parameters to execute the StopChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveStopChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveStopChannelRequest
 @see AWSMedialiveStopChannelResponse
 */
- (AWSTask<AWSMedialiveStopChannelResponse *> *)stopChannel:(AWSMedialiveStopChannelRequest *)request;

/**
 Stops a running channel
 
 @param request A container for the necessary parameters to execute the StopChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveStopChannelRequest
 @see AWSMedialiveStopChannelResponse
 */
- (void)stopChannel:(AWSMedialiveStopChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveStopChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Stops a running multiplex. If the multiplex isn't running, this action has no effect.
 
 @param request A container for the necessary parameters to execute the StopMultiplex service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveStopMultiplexResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveStopMultiplexRequest
 @see AWSMedialiveStopMultiplexResponse
 */
- (AWSTask<AWSMedialiveStopMultiplexResponse *> *)stopMultiplex:(AWSMedialiveStopMultiplexRequest *)request;

/**
 Stops a running multiplex. If the multiplex isn't running, this action has no effect.
 
 @param request A container for the necessary parameters to execute the StopMultiplex service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveStopMultiplexRequest
 @see AWSMedialiveStopMultiplexResponse
 */
- (void)stopMultiplex:(AWSMedialiveStopMultiplexRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveStopMultiplexResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Updates a channel.
 
 @param request A container for the necessary parameters to execute the UpdateChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveUpdateChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorUnprocessableEntity`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveUpdateChannelRequest
 @see AWSMedialiveUpdateChannelResponse
 */
- (AWSTask<AWSMedialiveUpdateChannelResponse *> *)updateChannel:(AWSMedialiveUpdateChannelRequest *)request;

/**
 Updates a channel.
 
 @param request A container for the necessary parameters to execute the UpdateChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorUnprocessableEntity`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveUpdateChannelRequest
 @see AWSMedialiveUpdateChannelResponse
 */
- (void)updateChannel:(AWSMedialiveUpdateChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveUpdateChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Changes the class of the channel.
 
 @param request A container for the necessary parameters to execute the UpdateChannelClass service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveUpdateChannelClassResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorUnprocessableEntity`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveUpdateChannelClassRequest
 @see AWSMedialiveUpdateChannelClassResponse
 */
- (AWSTask<AWSMedialiveUpdateChannelClassResponse *> *)updateChannelClass:(AWSMedialiveUpdateChannelClassRequest *)request;

/**
 Changes the class of the channel.
 
 @param request A container for the necessary parameters to execute the UpdateChannelClass service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorUnprocessableEntity`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveUpdateChannelClassRequest
 @see AWSMedialiveUpdateChannelClassResponse
 */
- (void)updateChannelClass:(AWSMedialiveUpdateChannelClassRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveUpdateChannelClassResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Updates an input.
 
 @param request A container for the necessary parameters to execute the UpdateInput service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveUpdateInputResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveUpdateInputRequest
 @see AWSMedialiveUpdateInputResponse
 */
- (AWSTask<AWSMedialiveUpdateInputResponse *> *)updateInput:(AWSMedialiveUpdateInputRequest *)request;

/**
 Updates an input.
 
 @param request A container for the necessary parameters to execute the UpdateInput service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveUpdateInputRequest
 @see AWSMedialiveUpdateInputResponse
 */
- (void)updateInput:(AWSMedialiveUpdateInputRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveUpdateInputResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Updates the parameters for the input device.
 
 @param request A container for the necessary parameters to execute the UpdateInputDevice service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveUpdateInputDeviceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorUnprocessableEntity`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveUpdateInputDeviceRequest
 @see AWSMedialiveUpdateInputDeviceResponse
 */
- (AWSTask<AWSMedialiveUpdateInputDeviceResponse *> *)updateInputDevice:(AWSMedialiveUpdateInputDeviceRequest *)request;

/**
 Updates the parameters for the input device.
 
 @param request A container for the necessary parameters to execute the UpdateInputDevice service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorUnprocessableEntity`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`.
 
 @see AWSMedialiveUpdateInputDeviceRequest
 @see AWSMedialiveUpdateInputDeviceResponse
 */
- (void)updateInputDevice:(AWSMedialiveUpdateInputDeviceRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveUpdateInputDeviceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Update an Input Security Group's Whilelists.
 
 @param request A container for the necessary parameters to execute the UpdateInputSecurityGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveUpdateInputSecurityGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveUpdateInputSecurityGroupRequest
 @see AWSMedialiveUpdateInputSecurityGroupResponse
 */
- (AWSTask<AWSMedialiveUpdateInputSecurityGroupResponse *> *)updateInputSecurityGroup:(AWSMedialiveUpdateInputSecurityGroupRequest *)request;

/**
 Update an Input Security Group's Whilelists.
 
 @param request A container for the necessary parameters to execute the UpdateInputSecurityGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveUpdateInputSecurityGroupRequest
 @see AWSMedialiveUpdateInputSecurityGroupResponse
 */
- (void)updateInputSecurityGroup:(AWSMedialiveUpdateInputSecurityGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveUpdateInputSecurityGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Updates a multiplex.
 
 @param request A container for the necessary parameters to execute the UpdateMultiplex service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveUpdateMultiplexResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorUnprocessableEntity`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveUpdateMultiplexRequest
 @see AWSMedialiveUpdateMultiplexResponse
 */
- (AWSTask<AWSMedialiveUpdateMultiplexResponse *> *)updateMultiplex:(AWSMedialiveUpdateMultiplexRequest *)request;

/**
 Updates a multiplex.
 
 @param request A container for the necessary parameters to execute the UpdateMultiplex service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorUnprocessableEntity`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveUpdateMultiplexRequest
 @see AWSMedialiveUpdateMultiplexResponse
 */
- (void)updateMultiplex:(AWSMedialiveUpdateMultiplexRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveUpdateMultiplexResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Update a program in a multiplex.
 
 @param request A container for the necessary parameters to execute the UpdateMultiplexProgram service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveUpdateMultiplexProgramResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorUnprocessableEntity`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveUpdateMultiplexProgramRequest
 @see AWSMedialiveUpdateMultiplexProgramResponse
 */
- (AWSTask<AWSMedialiveUpdateMultiplexProgramResponse *> *)updateMultiplexProgram:(AWSMedialiveUpdateMultiplexProgramRequest *)request;

/**
 Update a program in a multiplex.
 
 @param request A container for the necessary parameters to execute the UpdateMultiplexProgram service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorUnprocessableEntity`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveUpdateMultiplexProgramRequest
 @see AWSMedialiveUpdateMultiplexProgramResponse
 */
- (void)updateMultiplexProgram:(AWSMedialiveUpdateMultiplexProgramRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveUpdateMultiplexProgramResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Update reservation.
 
 @param request A container for the necessary parameters to execute the UpdateReservation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMedialiveUpdateReservationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveUpdateReservationRequest
 @see AWSMedialiveUpdateReservationResponse
 */
- (AWSTask<AWSMedialiveUpdateReservationResponse *> *)updateReservation:(AWSMedialiveUpdateReservationRequest *)request;

/**
 Update reservation.
 
 @param request A container for the necessary parameters to execute the UpdateReservation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMedialiveErrorDomain` domain and the following error code: `AWSMedialiveErrorBadRequest`, `AWSMedialiveErrorInternalServerError`, `AWSMedialiveErrorForbidden`, `AWSMedialiveErrorBadGateway`, `AWSMedialiveErrorNotFound`, `AWSMedialiveErrorGatewayTimeout`, `AWSMedialiveErrorTooManyRequests`, `AWSMedialiveErrorConflict`.
 
 @see AWSMedialiveUpdateReservationRequest
 @see AWSMedialiveUpdateReservationResponse
 */
- (void)updateReservation:(AWSMedialiveUpdateReservationRequest *)request completionHandler:(void (^ _Nullable)(AWSMedialiveUpdateReservationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
