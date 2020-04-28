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
#import "AWSmedialiveModel.h"
#import "AWSmedialiveResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSmedialive
FOUNDATION_EXPORT NSString *const AWSmedialiveSDKVersion;

/**
 API for AWS Elemental MediaLive
 */
@interface AWSmedialive : AWSService

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

     let medialive = AWSmedialive.default()

 *Objective-C*

     AWSmedialive *medialive = [AWSmedialive defaultmedialive];

 @return The default service client.
 */
+ (instancetype)defaultmedialive;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSmedialive.register(with: configuration!, forKey: "USWest2medialive")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSmedialive registermedialiveWithConfiguration:configuration forKey:@"USWest2medialive"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let medialive = AWSmedialive(forKey: "USWest2medialive")

 *Objective-C*

     AWSmedialive *medialive = [AWSmedialive medialiveForKey:@"USWest2medialive"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registermedialiveWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registermedialiveWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSmedialive.register(with: configuration!, forKey: "USWest2medialive")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSmedialive registermedialiveWithConfiguration:configuration forKey:@"USWest2medialive"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let medialive = AWSmedialive(forKey: "USWest2medialive")

 *Objective-C*

     AWSmedialive *medialive = [AWSmedialive medialiveForKey:@"USWest2medialive"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)medialiveForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removemedialiveForKey:(NSString *)key;

/**
 Update a channel schedule
 
 @param request A container for the necessary parameters to execute the BatchUpdateSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveBatchUpdateScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorUnprocessableEntity`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveBatchUpdateScheduleRequest
 @see AWSmedialiveBatchUpdateScheduleResponse
 */
- (AWSTask<AWSmedialiveBatchUpdateScheduleResponse *> *)batchUpdateSchedule:(AWSmedialiveBatchUpdateScheduleRequest *)request;

/**
 Update a channel schedule
 
 @param request A container for the necessary parameters to execute the BatchUpdateSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorUnprocessableEntity`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveBatchUpdateScheduleRequest
 @see AWSmedialiveBatchUpdateScheduleResponse
 */
- (void)batchUpdateSchedule:(AWSmedialiveBatchUpdateScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveBatchUpdateScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Creates a new channel
 
 @param request A container for the necessary parameters to execute the CreateChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveCreateChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorUnprocessableEntity`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveCreateChannelRequest
 @see AWSmedialiveCreateChannelResponse
 */
- (AWSTask<AWSmedialiveCreateChannelResponse *> *)createChannel:(AWSmedialiveCreateChannelRequest *)request;

/**
 Creates a new channel
 
 @param request A container for the necessary parameters to execute the CreateChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorUnprocessableEntity`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveCreateChannelRequest
 @see AWSmedialiveCreateChannelResponse
 */
- (void)createChannel:(AWSmedialiveCreateChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveCreateChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Create an input
 
 @param request A container for the necessary parameters to execute the CreateInput service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveCreateInputResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveCreateInputRequest
 @see AWSmedialiveCreateInputResponse
 */
- (AWSTask<AWSmedialiveCreateInputResponse *> *)createInput:(AWSmedialiveCreateInputRequest *)request;

/**
 Create an input
 
 @param request A container for the necessary parameters to execute the CreateInput service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveCreateInputRequest
 @see AWSmedialiveCreateInputResponse
 */
- (void)createInput:(AWSmedialiveCreateInputRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveCreateInputResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Creates a Input Security Group
 
 @param request A container for the necessary parameters to execute the CreateInputSecurityGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveCreateInputSecurityGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveCreateInputSecurityGroupRequest
 @see AWSmedialiveCreateInputSecurityGroupResponse
 */
- (AWSTask<AWSmedialiveCreateInputSecurityGroupResponse *> *)createInputSecurityGroup:(AWSmedialiveCreateInputSecurityGroupRequest *)request;

/**
 Creates a Input Security Group
 
 @param request A container for the necessary parameters to execute the CreateInputSecurityGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveCreateInputSecurityGroupRequest
 @see AWSmedialiveCreateInputSecurityGroupResponse
 */
- (void)createInputSecurityGroup:(AWSmedialiveCreateInputSecurityGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveCreateInputSecurityGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Create a new multiplex.
 
 @param request A container for the necessary parameters to execute the CreateMultiplex service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveCreateMultiplexResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorUnprocessableEntity`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveCreateMultiplexRequest
 @see AWSmedialiveCreateMultiplexResponse
 */
- (AWSTask<AWSmedialiveCreateMultiplexResponse *> *)createMultiplex:(AWSmedialiveCreateMultiplexRequest *)request;

/**
 Create a new multiplex.
 
 @param request A container for the necessary parameters to execute the CreateMultiplex service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorUnprocessableEntity`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveCreateMultiplexRequest
 @see AWSmedialiveCreateMultiplexResponse
 */
- (void)createMultiplex:(AWSmedialiveCreateMultiplexRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveCreateMultiplexResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Create a new program in the multiplex.
 
 @param request A container for the necessary parameters to execute the CreateMultiplexProgram service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveCreateMultiplexProgramResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorUnprocessableEntity`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveCreateMultiplexProgramRequest
 @see AWSmedialiveCreateMultiplexProgramResponse
 */
- (AWSTask<AWSmedialiveCreateMultiplexProgramResponse *> *)createMultiplexProgram:(AWSmedialiveCreateMultiplexProgramRequest *)request;

/**
 Create a new program in the multiplex.
 
 @param request A container for the necessary parameters to execute the CreateMultiplexProgram service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorUnprocessableEntity`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveCreateMultiplexProgramRequest
 @see AWSmedialiveCreateMultiplexProgramResponse
 */
- (void)createMultiplexProgram:(AWSmedialiveCreateMultiplexProgramRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveCreateMultiplexProgramResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Create tags for a resource
 
 @param request A container for the necessary parameters to execute the CreateTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`.
 
 @see AWSmedialiveCreateTagsRequest
 */
- (AWSTask *)createTags:(AWSmedialiveCreateTagsRequest *)request;

/**
 Create tags for a resource
 
 @param request A container for the necessary parameters to execute the CreateTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`.
 
 @see AWSmedialiveCreateTagsRequest
 */
- (void)createTags:(AWSmedialiveCreateTagsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Starts deletion of channel. The associated outputs are also deleted.
 
 @param request A container for the necessary parameters to execute the DeleteChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveDeleteChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveDeleteChannelRequest
 @see AWSmedialiveDeleteChannelResponse
 */
- (AWSTask<AWSmedialiveDeleteChannelResponse *> *)deleteChannel:(AWSmedialiveDeleteChannelRequest *)request;

/**
 Starts deletion of channel. The associated outputs are also deleted.
 
 @param request A container for the necessary parameters to execute the DeleteChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveDeleteChannelRequest
 @see AWSmedialiveDeleteChannelResponse
 */
- (void)deleteChannel:(AWSmedialiveDeleteChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveDeleteChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes the input end point
 
 @param request A container for the necessary parameters to execute the DeleteInput service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveDeleteInputResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveDeleteInputRequest
 @see AWSmedialiveDeleteInputResponse
 */
- (AWSTask<AWSmedialiveDeleteInputResponse *> *)deleteInput:(AWSmedialiveDeleteInputRequest *)request;

/**
 Deletes the input end point
 
 @param request A container for the necessary parameters to execute the DeleteInput service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveDeleteInputRequest
 @see AWSmedialiveDeleteInputResponse
 */
- (void)deleteInput:(AWSmedialiveDeleteInputRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveDeleteInputResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes an Input Security Group
 
 @param request A container for the necessary parameters to execute the DeleteInputSecurityGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveDeleteInputSecurityGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveDeleteInputSecurityGroupRequest
 @see AWSmedialiveDeleteInputSecurityGroupResponse
 */
- (AWSTask<AWSmedialiveDeleteInputSecurityGroupResponse *> *)deleteInputSecurityGroup:(AWSmedialiveDeleteInputSecurityGroupRequest *)request;

/**
 Deletes an Input Security Group
 
 @param request A container for the necessary parameters to execute the DeleteInputSecurityGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveDeleteInputSecurityGroupRequest
 @see AWSmedialiveDeleteInputSecurityGroupResponse
 */
- (void)deleteInputSecurityGroup:(AWSmedialiveDeleteInputSecurityGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveDeleteInputSecurityGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Delete a multiplex. The multiplex must be idle.
 
 @param request A container for the necessary parameters to execute the DeleteMultiplex service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveDeleteMultiplexResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveDeleteMultiplexRequest
 @see AWSmedialiveDeleteMultiplexResponse
 */
- (AWSTask<AWSmedialiveDeleteMultiplexResponse *> *)deleteMultiplex:(AWSmedialiveDeleteMultiplexRequest *)request;

/**
 Delete a multiplex. The multiplex must be idle.
 
 @param request A container for the necessary parameters to execute the DeleteMultiplex service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveDeleteMultiplexRequest
 @see AWSmedialiveDeleteMultiplexResponse
 */
- (void)deleteMultiplex:(AWSmedialiveDeleteMultiplexRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveDeleteMultiplexResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Delete a program from a multiplex.
 
 @param request A container for the necessary parameters to execute the DeleteMultiplexProgram service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveDeleteMultiplexProgramResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveDeleteMultiplexProgramRequest
 @see AWSmedialiveDeleteMultiplexProgramResponse
 */
- (AWSTask<AWSmedialiveDeleteMultiplexProgramResponse *> *)deleteMultiplexProgram:(AWSmedialiveDeleteMultiplexProgramRequest *)request;

/**
 Delete a program from a multiplex.
 
 @param request A container for the necessary parameters to execute the DeleteMultiplexProgram service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveDeleteMultiplexProgramRequest
 @see AWSmedialiveDeleteMultiplexProgramResponse
 */
- (void)deleteMultiplexProgram:(AWSmedialiveDeleteMultiplexProgramRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveDeleteMultiplexProgramResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Delete an expired reservation.
 
 @param request A container for the necessary parameters to execute the DeleteReservation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveDeleteReservationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveDeleteReservationRequest
 @see AWSmedialiveDeleteReservationResponse
 */
- (AWSTask<AWSmedialiveDeleteReservationResponse *> *)deleteReservation:(AWSmedialiveDeleteReservationRequest *)request;

/**
 Delete an expired reservation.
 
 @param request A container for the necessary parameters to execute the DeleteReservation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveDeleteReservationRequest
 @see AWSmedialiveDeleteReservationResponse
 */
- (void)deleteReservation:(AWSmedialiveDeleteReservationRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveDeleteReservationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Delete all schedule actions on a channel.
 
 @param request A container for the necessary parameters to execute the DeleteSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveDeleteScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveDeleteScheduleRequest
 @see AWSmedialiveDeleteScheduleResponse
 */
- (AWSTask<AWSmedialiveDeleteScheduleResponse *> *)deleteSchedule:(AWSmedialiveDeleteScheduleRequest *)request;

/**
 Delete all schedule actions on a channel.
 
 @param request A container for the necessary parameters to execute the DeleteSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveDeleteScheduleRequest
 @see AWSmedialiveDeleteScheduleResponse
 */
- (void)deleteSchedule:(AWSmedialiveDeleteScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveDeleteScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Removes tags for a resource
 
 @param request A container for the necessary parameters to execute the DeleteTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`.
 
 @see AWSmedialiveDeleteTagsRequest
 */
- (AWSTask *)deleteTags:(AWSmedialiveDeleteTagsRequest *)request;

/**
 Removes tags for a resource
 
 @param request A container for the necessary parameters to execute the DeleteTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`.
 
 @see AWSmedialiveDeleteTagsRequest
 */
- (void)deleteTags:(AWSmedialiveDeleteTagsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Gets details about a channel
 
 @param request A container for the necessary parameters to execute the DescribeChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveDescribeChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveDescribeChannelRequest
 @see AWSmedialiveDescribeChannelResponse
 */
- (AWSTask<AWSmedialiveDescribeChannelResponse *> *)describeChannel:(AWSmedialiveDescribeChannelRequest *)request;

/**
 Gets details about a channel
 
 @param request A container for the necessary parameters to execute the DescribeChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveDescribeChannelRequest
 @see AWSmedialiveDescribeChannelResponse
 */
- (void)describeChannel:(AWSmedialiveDescribeChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveDescribeChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Produces details about an input
 
 @param request A container for the necessary parameters to execute the DescribeInput service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveDescribeInputResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveDescribeInputRequest
 @see AWSmedialiveDescribeInputResponse
 */
- (AWSTask<AWSmedialiveDescribeInputResponse *> *)describeInput:(AWSmedialiveDescribeInputRequest *)request;

/**
 Produces details about an input
 
 @param request A container for the necessary parameters to execute the DescribeInput service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveDescribeInputRequest
 @see AWSmedialiveDescribeInputResponse
 */
- (void)describeInput:(AWSmedialiveDescribeInputRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveDescribeInputResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Produces a summary of an Input Security Group
 
 @param request A container for the necessary parameters to execute the DescribeInputSecurityGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveDescribeInputSecurityGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveDescribeInputSecurityGroupRequest
 @see AWSmedialiveDescribeInputSecurityGroupResponse
 */
- (AWSTask<AWSmedialiveDescribeInputSecurityGroupResponse *> *)describeInputSecurityGroup:(AWSmedialiveDescribeInputSecurityGroupRequest *)request;

/**
 Produces a summary of an Input Security Group
 
 @param request A container for the necessary parameters to execute the DescribeInputSecurityGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveDescribeInputSecurityGroupRequest
 @see AWSmedialiveDescribeInputSecurityGroupResponse
 */
- (void)describeInputSecurityGroup:(AWSmedialiveDescribeInputSecurityGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveDescribeInputSecurityGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Gets details about a multiplex.
 
 @param request A container for the necessary parameters to execute the DescribeMultiplex service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveDescribeMultiplexResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveDescribeMultiplexRequest
 @see AWSmedialiveDescribeMultiplexResponse
 */
- (AWSTask<AWSmedialiveDescribeMultiplexResponse *> *)describeMultiplex:(AWSmedialiveDescribeMultiplexRequest *)request;

/**
 Gets details about a multiplex.
 
 @param request A container for the necessary parameters to execute the DescribeMultiplex service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveDescribeMultiplexRequest
 @see AWSmedialiveDescribeMultiplexResponse
 */
- (void)describeMultiplex:(AWSmedialiveDescribeMultiplexRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveDescribeMultiplexResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Get the details for a program in a multiplex.
 
 @param request A container for the necessary parameters to execute the DescribeMultiplexProgram service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveDescribeMultiplexProgramResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveDescribeMultiplexProgramRequest
 @see AWSmedialiveDescribeMultiplexProgramResponse
 */
- (AWSTask<AWSmedialiveDescribeMultiplexProgramResponse *> *)describeMultiplexProgram:(AWSmedialiveDescribeMultiplexProgramRequest *)request;

/**
 Get the details for a program in a multiplex.
 
 @param request A container for the necessary parameters to execute the DescribeMultiplexProgram service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveDescribeMultiplexProgramRequest
 @see AWSmedialiveDescribeMultiplexProgramResponse
 */
- (void)describeMultiplexProgram:(AWSmedialiveDescribeMultiplexProgramRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveDescribeMultiplexProgramResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Get details for an offering.
 
 @param request A container for the necessary parameters to execute the DescribeOffering service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveDescribeOfferingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveDescribeOfferingRequest
 @see AWSmedialiveDescribeOfferingResponse
 */
- (AWSTask<AWSmedialiveDescribeOfferingResponse *> *)describeOffering:(AWSmedialiveDescribeOfferingRequest *)request;

/**
 Get details for an offering.
 
 @param request A container for the necessary parameters to execute the DescribeOffering service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveDescribeOfferingRequest
 @see AWSmedialiveDescribeOfferingResponse
 */
- (void)describeOffering:(AWSmedialiveDescribeOfferingRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveDescribeOfferingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Get details for a reservation.
 
 @param request A container for the necessary parameters to execute the DescribeReservation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveDescribeReservationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveDescribeReservationRequest
 @see AWSmedialiveDescribeReservationResponse
 */
- (AWSTask<AWSmedialiveDescribeReservationResponse *> *)describeReservation:(AWSmedialiveDescribeReservationRequest *)request;

/**
 Get details for a reservation.
 
 @param request A container for the necessary parameters to execute the DescribeReservation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveDescribeReservationRequest
 @see AWSmedialiveDescribeReservationResponse
 */
- (void)describeReservation:(AWSmedialiveDescribeReservationRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveDescribeReservationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Get a channel schedule
 
 @param request A container for the necessary parameters to execute the DescribeSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveDescribeScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveDescribeScheduleRequest
 @see AWSmedialiveDescribeScheduleResponse
 */
- (AWSTask<AWSmedialiveDescribeScheduleResponse *> *)describeSchedule:(AWSmedialiveDescribeScheduleRequest *)request;

/**
 Get a channel schedule
 
 @param request A container for the necessary parameters to execute the DescribeSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveDescribeScheduleRequest
 @see AWSmedialiveDescribeScheduleResponse
 */
- (void)describeSchedule:(AWSmedialiveDescribeScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveDescribeScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Produces list of channels that have been created
 
 @param request A container for the necessary parameters to execute the ListChannels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveListChannelsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveListChannelsRequest
 @see AWSmedialiveListChannelsResponse
 */
- (AWSTask<AWSmedialiveListChannelsResponse *> *)listChannels:(AWSmedialiveListChannelsRequest *)request;

/**
 Produces list of channels that have been created
 
 @param request A container for the necessary parameters to execute the ListChannels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveListChannelsRequest
 @see AWSmedialiveListChannelsResponse
 */
- (void)listChannels:(AWSmedialiveListChannelsRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveListChannelsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Produces a list of Input Security Groups for an account
 
 @param request A container for the necessary parameters to execute the ListInputSecurityGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveListInputSecurityGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveListInputSecurityGroupsRequest
 @see AWSmedialiveListInputSecurityGroupsResponse
 */
- (AWSTask<AWSmedialiveListInputSecurityGroupsResponse *> *)listInputSecurityGroups:(AWSmedialiveListInputSecurityGroupsRequest *)request;

/**
 Produces a list of Input Security Groups for an account
 
 @param request A container for the necessary parameters to execute the ListInputSecurityGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveListInputSecurityGroupsRequest
 @see AWSmedialiveListInputSecurityGroupsResponse
 */
- (void)listInputSecurityGroups:(AWSmedialiveListInputSecurityGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveListInputSecurityGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Produces list of inputs that have been created
 
 @param request A container for the necessary parameters to execute the ListInputs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveListInputsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveListInputsRequest
 @see AWSmedialiveListInputsResponse
 */
- (AWSTask<AWSmedialiveListInputsResponse *> *)listInputs:(AWSmedialiveListInputsRequest *)request;

/**
 Produces list of inputs that have been created
 
 @param request A container for the necessary parameters to execute the ListInputs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveListInputsRequest
 @see AWSmedialiveListInputsResponse
 */
- (void)listInputs:(AWSmedialiveListInputsRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveListInputsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 List the programs that currently exist for a specific multiplex.
 
 @param request A container for the necessary parameters to execute the ListMultiplexPrograms service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveListMultiplexProgramsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveListMultiplexProgramsRequest
 @see AWSmedialiveListMultiplexProgramsResponse
 */
- (AWSTask<AWSmedialiveListMultiplexProgramsResponse *> *)listMultiplexPrograms:(AWSmedialiveListMultiplexProgramsRequest *)request;

/**
 List the programs that currently exist for a specific multiplex.
 
 @param request A container for the necessary parameters to execute the ListMultiplexPrograms service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveListMultiplexProgramsRequest
 @see AWSmedialiveListMultiplexProgramsResponse
 */
- (void)listMultiplexPrograms:(AWSmedialiveListMultiplexProgramsRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveListMultiplexProgramsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Retrieve a list of the existing multiplexes.
 
 @param request A container for the necessary parameters to execute the ListMultiplexes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveListMultiplexesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveListMultiplexesRequest
 @see AWSmedialiveListMultiplexesResponse
 */
- (AWSTask<AWSmedialiveListMultiplexesResponse *> *)listMultiplexes:(AWSmedialiveListMultiplexesRequest *)request;

/**
 Retrieve a list of the existing multiplexes.
 
 @param request A container for the necessary parameters to execute the ListMultiplexes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveListMultiplexesRequest
 @see AWSmedialiveListMultiplexesResponse
 */
- (void)listMultiplexes:(AWSmedialiveListMultiplexesRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveListMultiplexesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 List offerings available for purchase.
 
 @param request A container for the necessary parameters to execute the ListOfferings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveListOfferingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveListOfferingsRequest
 @see AWSmedialiveListOfferingsResponse
 */
- (AWSTask<AWSmedialiveListOfferingsResponse *> *)listOfferings:(AWSmedialiveListOfferingsRequest *)request;

/**
 List offerings available for purchase.
 
 @param request A container for the necessary parameters to execute the ListOfferings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveListOfferingsRequest
 @see AWSmedialiveListOfferingsResponse
 */
- (void)listOfferings:(AWSmedialiveListOfferingsRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveListOfferingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 List purchased reservations.
 
 @param request A container for the necessary parameters to execute the ListReservations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveListReservationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveListReservationsRequest
 @see AWSmedialiveListReservationsResponse
 */
- (AWSTask<AWSmedialiveListReservationsResponse *> *)listReservations:(AWSmedialiveListReservationsRequest *)request;

/**
 List purchased reservations.
 
 @param request A container for the necessary parameters to execute the ListReservations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`.
 
 @see AWSmedialiveListReservationsRequest
 @see AWSmedialiveListReservationsResponse
 */
- (void)listReservations:(AWSmedialiveListReservationsRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveListReservationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Produces list of tags that have been created for a resource
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`.
 
 @see AWSmedialiveListTagsForResourceRequest
 @see AWSmedialiveListTagsForResourceResponse
 */
- (AWSTask<AWSmedialiveListTagsForResourceResponse *> *)listTagsForResource:(AWSmedialiveListTagsForResourceRequest *)request;

/**
 Produces list of tags that have been created for a resource
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`.
 
 @see AWSmedialiveListTagsForResourceRequest
 @see AWSmedialiveListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSmedialiveListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Purchase an offering and create a reservation.
 
 @param request A container for the necessary parameters to execute the PurchaseOffering service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialivePurchaseOfferingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialivePurchaseOfferingRequest
 @see AWSmedialivePurchaseOfferingResponse
 */
- (AWSTask<AWSmedialivePurchaseOfferingResponse *> *)purchaseOffering:(AWSmedialivePurchaseOfferingRequest *)request;

/**
 Purchase an offering and create a reservation.
 
 @param request A container for the necessary parameters to execute the PurchaseOffering service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialivePurchaseOfferingRequest
 @see AWSmedialivePurchaseOfferingResponse
 */
- (void)purchaseOffering:(AWSmedialivePurchaseOfferingRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialivePurchaseOfferingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Starts an existing channel
 
 @param request A container for the necessary parameters to execute the StartChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveStartChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveStartChannelRequest
 @see AWSmedialiveStartChannelResponse
 */
- (AWSTask<AWSmedialiveStartChannelResponse *> *)startChannel:(AWSmedialiveStartChannelRequest *)request;

/**
 Starts an existing channel
 
 @param request A container for the necessary parameters to execute the StartChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveStartChannelRequest
 @see AWSmedialiveStartChannelResponse
 */
- (void)startChannel:(AWSmedialiveStartChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveStartChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Start (run) the multiplex. Starting the multiplex does not start the channels. You must explicitly start each channel.
 
 @param request A container for the necessary parameters to execute the StartMultiplex service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveStartMultiplexResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveStartMultiplexRequest
 @see AWSmedialiveStartMultiplexResponse
 */
- (AWSTask<AWSmedialiveStartMultiplexResponse *> *)startMultiplex:(AWSmedialiveStartMultiplexRequest *)request;

/**
 Start (run) the multiplex. Starting the multiplex does not start the channels. You must explicitly start each channel.
 
 @param request A container for the necessary parameters to execute the StartMultiplex service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveStartMultiplexRequest
 @see AWSmedialiveStartMultiplexResponse
 */
- (void)startMultiplex:(AWSmedialiveStartMultiplexRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveStartMultiplexResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Stops a running channel
 
 @param request A container for the necessary parameters to execute the StopChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveStopChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveStopChannelRequest
 @see AWSmedialiveStopChannelResponse
 */
- (AWSTask<AWSmedialiveStopChannelResponse *> *)stopChannel:(AWSmedialiveStopChannelRequest *)request;

/**
 Stops a running channel
 
 @param request A container for the necessary parameters to execute the StopChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveStopChannelRequest
 @see AWSmedialiveStopChannelResponse
 */
- (void)stopChannel:(AWSmedialiveStopChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveStopChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Stops a running multiplex. If the multiplex isn't running, this action has no effect.
 
 @param request A container for the necessary parameters to execute the StopMultiplex service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveStopMultiplexResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveStopMultiplexRequest
 @see AWSmedialiveStopMultiplexResponse
 */
- (AWSTask<AWSmedialiveStopMultiplexResponse *> *)stopMultiplex:(AWSmedialiveStopMultiplexRequest *)request;

/**
 Stops a running multiplex. If the multiplex isn't running, this action has no effect.
 
 @param request A container for the necessary parameters to execute the StopMultiplex service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveStopMultiplexRequest
 @see AWSmedialiveStopMultiplexResponse
 */
- (void)stopMultiplex:(AWSmedialiveStopMultiplexRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveStopMultiplexResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Updates a channel.
 
 @param request A container for the necessary parameters to execute the UpdateChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveUpdateChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorUnprocessableEntity`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveUpdateChannelRequest
 @see AWSmedialiveUpdateChannelResponse
 */
- (AWSTask<AWSmedialiveUpdateChannelResponse *> *)updateChannel:(AWSmedialiveUpdateChannelRequest *)request;

/**
 Updates a channel.
 
 @param request A container for the necessary parameters to execute the UpdateChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorUnprocessableEntity`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveUpdateChannelRequest
 @see AWSmedialiveUpdateChannelResponse
 */
- (void)updateChannel:(AWSmedialiveUpdateChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveUpdateChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Changes the class of the channel.
 
 @param request A container for the necessary parameters to execute the UpdateChannelClass service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveUpdateChannelClassResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorUnprocessableEntity`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveUpdateChannelClassRequest
 @see AWSmedialiveUpdateChannelClassResponse
 */
- (AWSTask<AWSmedialiveUpdateChannelClassResponse *> *)updateChannelClass:(AWSmedialiveUpdateChannelClassRequest *)request;

/**
 Changes the class of the channel.
 
 @param request A container for the necessary parameters to execute the UpdateChannelClass service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorUnprocessableEntity`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveUpdateChannelClassRequest
 @see AWSmedialiveUpdateChannelClassResponse
 */
- (void)updateChannelClass:(AWSmedialiveUpdateChannelClassRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveUpdateChannelClassResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Updates an input.
 
 @param request A container for the necessary parameters to execute the UpdateInput service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveUpdateInputResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveUpdateInputRequest
 @see AWSmedialiveUpdateInputResponse
 */
- (AWSTask<AWSmedialiveUpdateInputResponse *> *)updateInput:(AWSmedialiveUpdateInputRequest *)request;

/**
 Updates an input.
 
 @param request A container for the necessary parameters to execute the UpdateInput service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveUpdateInputRequest
 @see AWSmedialiveUpdateInputResponse
 */
- (void)updateInput:(AWSmedialiveUpdateInputRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveUpdateInputResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Update an Input Security Group's Whilelists.
 
 @param request A container for the necessary parameters to execute the UpdateInputSecurityGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveUpdateInputSecurityGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveUpdateInputSecurityGroupRequest
 @see AWSmedialiveUpdateInputSecurityGroupResponse
 */
- (AWSTask<AWSmedialiveUpdateInputSecurityGroupResponse *> *)updateInputSecurityGroup:(AWSmedialiveUpdateInputSecurityGroupRequest *)request;

/**
 Update an Input Security Group's Whilelists.
 
 @param request A container for the necessary parameters to execute the UpdateInputSecurityGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveUpdateInputSecurityGroupRequest
 @see AWSmedialiveUpdateInputSecurityGroupResponse
 */
- (void)updateInputSecurityGroup:(AWSmedialiveUpdateInputSecurityGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveUpdateInputSecurityGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Updates a multiplex.
 
 @param request A container for the necessary parameters to execute the UpdateMultiplex service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveUpdateMultiplexResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorUnprocessableEntity`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveUpdateMultiplexRequest
 @see AWSmedialiveUpdateMultiplexResponse
 */
- (AWSTask<AWSmedialiveUpdateMultiplexResponse *> *)updateMultiplex:(AWSmedialiveUpdateMultiplexRequest *)request;

/**
 Updates a multiplex.
 
 @param request A container for the necessary parameters to execute the UpdateMultiplex service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorUnprocessableEntity`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveUpdateMultiplexRequest
 @see AWSmedialiveUpdateMultiplexResponse
 */
- (void)updateMultiplex:(AWSmedialiveUpdateMultiplexRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveUpdateMultiplexResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Update a program in a multiplex.
 
 @param request A container for the necessary parameters to execute the UpdateMultiplexProgram service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveUpdateMultiplexProgramResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorUnprocessableEntity`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveUpdateMultiplexProgramRequest
 @see AWSmedialiveUpdateMultiplexProgramResponse
 */
- (AWSTask<AWSmedialiveUpdateMultiplexProgramResponse *> *)updateMultiplexProgram:(AWSmedialiveUpdateMultiplexProgramRequest *)request;

/**
 Update a program in a multiplex.
 
 @param request A container for the necessary parameters to execute the UpdateMultiplexProgram service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorUnprocessableEntity`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveUpdateMultiplexProgramRequest
 @see AWSmedialiveUpdateMultiplexProgramResponse
 */
- (void)updateMultiplexProgram:(AWSmedialiveUpdateMultiplexProgramRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveUpdateMultiplexProgramResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Update reservation.
 
 @param request A container for the necessary parameters to execute the UpdateReservation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmedialiveUpdateReservationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveUpdateReservationRequest
 @see AWSmedialiveUpdateReservationResponse
 */
- (AWSTask<AWSmedialiveUpdateReservationResponse *> *)updateReservation:(AWSmedialiveUpdateReservationRequest *)request;

/**
 Update reservation.
 
 @param request A container for the necessary parameters to execute the UpdateReservation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmedialiveErrorDomain` domain and the following error code: `AWSmedialiveErrorBadRequest`, `AWSmedialiveErrorInternalServerError`, `AWSmedialiveErrorForbidden`, `AWSmedialiveErrorBadGateway`, `AWSmedialiveErrorNotFound`, `AWSmedialiveErrorGatewayTimeout`, `AWSmedialiveErrorTooManyRequests`, `AWSmedialiveErrorConflict`.
 
 @see AWSmedialiveUpdateReservationRequest
 @see AWSmedialiveUpdateReservationResponse
 */
- (void)updateReservation:(AWSmedialiveUpdateReservationRequest *)request completionHandler:(void (^ _Nullable)(AWSmedialiveUpdateReservationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
