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
#import "AWSConnectParticipantModel.h"
#import "AWSConnectParticipantResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSConnectParticipant
FOUNDATION_EXPORT NSString *const AWSConnectParticipantSDKVersion;

/**
 <p>Amazon Connect is a cloud-based contact center solution that makes it easy to set up and manage a customer contact center and provide reliable customer engagement at any scale.</p><p>Amazon Connect enables customer contacts through voice or chat.</p><p>The APIs described here are used by chat participants, such as agents and customers.</p>
 */
@interface AWSConnectParticipant : AWSService

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

     let ConnectParticipant = AWSConnectParticipant.default()

 *Objective-C*

     AWSConnectParticipant *ConnectParticipant = [AWSConnectParticipant defaultConnectParticipant];

 @return The default service client.
 */
+ (instancetype)defaultConnectParticipant;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSConnectParticipant.register(with: configuration!, forKey: "USWest2ConnectParticipant")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSConnectParticipant registerConnectParticipantWithConfiguration:configuration forKey:@"USWest2ConnectParticipant"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let ConnectParticipant = AWSConnectParticipant(forKey: "USWest2ConnectParticipant")

 *Objective-C*

     AWSConnectParticipant *ConnectParticipant = [AWSConnectParticipant ConnectParticipantForKey:@"USWest2ConnectParticipant"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerConnectParticipantWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerConnectParticipantWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSConnectParticipant.register(with: configuration!, forKey: "USWest2ConnectParticipant")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSConnectParticipant registerConnectParticipantWithConfiguration:configuration forKey:@"USWest2ConnectParticipant"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let ConnectParticipant = AWSConnectParticipant(forKey: "USWest2ConnectParticipant")

 *Objective-C*

     AWSConnectParticipant *ConnectParticipant = [AWSConnectParticipant ConnectParticipantForKey:@"USWest2ConnectParticipant"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)ConnectParticipantForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeConnectParticipantForKey:(NSString *)key;

/**
 <p>Creates the participant's connection. Note that ParticipantToken is used for invoking this API instead of ConnectionToken.</p><p>The participant token is valid for the lifetime of the participant – until the they are part of a contact.</p><p>The response URL for <code>WEBSOCKET</code> Type has a connect expiry timeout of 100s. Clients must manually connect to the returned websocket URL and subscribe to the desired topic. </p><p>For chat, you need to publish the following on the established websocket connection:</p><p><code>{"topic":"aws/subscribe","content":{"topics":["aws/chat"]}}</code></p><p>Upon websocket URL expiry, as specified in the response ConnectionExpiry parameter, clients need to call this API again to obtain a new websocket URL and perform the same steps as before.</p>
 
 @param request A container for the necessary parameters to execute the CreateParticipantConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectParticipantCreateParticipantConnectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`.
 
 @see AWSConnectParticipantCreateParticipantConnectionRequest
 @see AWSConnectParticipantCreateParticipantConnectionResponse
 */
- (AWSTask<AWSConnectParticipantCreateParticipantConnectionResponse *> *)createParticipantConnection:(AWSConnectParticipantCreateParticipantConnectionRequest *)request;

/**
 <p>Creates the participant's connection. Note that ParticipantToken is used for invoking this API instead of ConnectionToken.</p><p>The participant token is valid for the lifetime of the participant – until the they are part of a contact.</p><p>The response URL for <code>WEBSOCKET</code> Type has a connect expiry timeout of 100s. Clients must manually connect to the returned websocket URL and subscribe to the desired topic. </p><p>For chat, you need to publish the following on the established websocket connection:</p><p><code>{"topic":"aws/subscribe","content":{"topics":["aws/chat"]}}</code></p><p>Upon websocket URL expiry, as specified in the response ConnectionExpiry parameter, clients need to call this API again to obtain a new websocket URL and perform the same steps as before.</p>
 
 @param request A container for the necessary parameters to execute the CreateParticipantConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`.
 
 @see AWSConnectParticipantCreateParticipantConnectionRequest
 @see AWSConnectParticipantCreateParticipantConnectionResponse
 */
- (void)createParticipantConnection:(AWSConnectParticipantCreateParticipantConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectParticipantCreateParticipantConnectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disconnects a participant. Note that ConnectionToken is used for invoking this API instead of ParticipantToken.</p>
 
 @param request A container for the necessary parameters to execute the DisconnectParticipant service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectParticipantDisconnectParticipantResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`.
 
 @see AWSConnectParticipantDisconnectParticipantRequest
 @see AWSConnectParticipantDisconnectParticipantResponse
 */
- (AWSTask<AWSConnectParticipantDisconnectParticipantResponse *> *)disconnectParticipant:(AWSConnectParticipantDisconnectParticipantRequest *)request;

/**
 <p>Disconnects a participant. Note that ConnectionToken is used for invoking this API instead of ParticipantToken.</p>
 
 @param request A container for the necessary parameters to execute the DisconnectParticipant service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`.
 
 @see AWSConnectParticipantDisconnectParticipantRequest
 @see AWSConnectParticipantDisconnectParticipantResponse
 */
- (void)disconnectParticipant:(AWSConnectParticipantDisconnectParticipantRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectParticipantDisconnectParticipantResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a transcript of the session. Note that ConnectionToken is used for invoking this API instead of ParticipantToken.</p>
 
 @param request A container for the necessary parameters to execute the GetTranscript service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectParticipantGetTranscriptResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`.
 
 @see AWSConnectParticipantGetTranscriptRequest
 @see AWSConnectParticipantGetTranscriptResponse
 */
- (AWSTask<AWSConnectParticipantGetTranscriptResponse *> *)getTranscript:(AWSConnectParticipantGetTranscriptRequest *)request;

/**
 <p>Retrieves a transcript of the session. Note that ConnectionToken is used for invoking this API instead of ParticipantToken.</p>
 
 @param request A container for the necessary parameters to execute the GetTranscript service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`.
 
 @see AWSConnectParticipantGetTranscriptRequest
 @see AWSConnectParticipantGetTranscriptResponse
 */
- (void)getTranscript:(AWSConnectParticipantGetTranscriptRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectParticipantGetTranscriptResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sends an event. Note that ConnectionToken is used for invoking this API instead of ParticipantToken.</p>
 
 @param request A container for the necessary parameters to execute the SendEvent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectParticipantSendEventResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`.
 
 @see AWSConnectParticipantSendEventRequest
 @see AWSConnectParticipantSendEventResponse
 */
- (AWSTask<AWSConnectParticipantSendEventResponse *> *)sendEvent:(AWSConnectParticipantSendEventRequest *)request;

/**
 <p>Sends an event. Note that ConnectionToken is used for invoking this API instead of ParticipantToken.</p>
 
 @param request A container for the necessary parameters to execute the SendEvent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`.
 
 @see AWSConnectParticipantSendEventRequest
 @see AWSConnectParticipantSendEventResponse
 */
- (void)sendEvent:(AWSConnectParticipantSendEventRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectParticipantSendEventResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sends a message. Note that ConnectionToken is used for invoking this API instead of ParticipantToken.</p>
 
 @param request A container for the necessary parameters to execute the SendMessage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectParticipantSendMessageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`.
 
 @see AWSConnectParticipantSendMessageRequest
 @see AWSConnectParticipantSendMessageResponse
 */
- (AWSTask<AWSConnectParticipantSendMessageResponse *> *)sendMessage:(AWSConnectParticipantSendMessageRequest *)request;

/**
 <p>Sends a message. Note that ConnectionToken is used for invoking this API instead of ParticipantToken.</p>
 
 @param request A container for the necessary parameters to execute the SendMessage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`.
 
 @see AWSConnectParticipantSendMessageRequest
 @see AWSConnectParticipantSendMessageResponse
 */
- (void)sendMessage:(AWSConnectParticipantSendMessageRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectParticipantSendMessageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
