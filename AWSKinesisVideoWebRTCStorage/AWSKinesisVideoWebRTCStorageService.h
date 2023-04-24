//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSKinesisVideoWebRTCStorageModel.h"
#import "AWSKinesisVideoWebRTCStorageResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSKinesisVideoWebRTCStorage
FOUNDATION_EXPORT NSString *const AWSKinesisVideoWebRTCStorageSDKVersion;

/**
 <p></p>
 */
@interface AWSKinesisVideoWebRTCStorage : AWSService

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

     let KinesisVideoWebRTCStorage = AWSKinesisVideoWebRTCStorage.default()

 *Objective-C*

     AWSKinesisVideoWebRTCStorage *KinesisVideoWebRTCStorage = [AWSKinesisVideoWebRTCStorage defaultKinesisVideoWebRTCStorage];

 @return The default service client.
 */
+ (instancetype)defaultKinesisVideoWebRTCStorage;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSKinesisVideoWebRTCStorage.register(with: configuration!, forKey: "USWest2KinesisVideoWebRTCStorage")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSKinesisVideoWebRTCStorage registerKinesisVideoWebRTCStorageWithConfiguration:configuration forKey:@"USWest2KinesisVideoWebRTCStorage"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let KinesisVideoWebRTCStorage = AWSKinesisVideoWebRTCStorage(forKey: "USWest2KinesisVideoWebRTCStorage")

 *Objective-C*

     AWSKinesisVideoWebRTCStorage *KinesisVideoWebRTCStorage = [AWSKinesisVideoWebRTCStorage KinesisVideoWebRTCStorageForKey:@"USWest2KinesisVideoWebRTCStorage"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerKinesisVideoWebRTCStorageWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerKinesisVideoWebRTCStorageWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSKinesisVideoWebRTCStorage.register(with: configuration!, forKey: "USWest2KinesisVideoWebRTCStorage")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSKinesisVideoWebRTCStorage registerKinesisVideoWebRTCStorageWithConfiguration:configuration forKey:@"USWest2KinesisVideoWebRTCStorage"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let KinesisVideoWebRTCStorage = AWSKinesisVideoWebRTCStorage(forKey: "USWest2KinesisVideoWebRTCStorage")

 *Objective-C*

     AWSKinesisVideoWebRTCStorage *KinesisVideoWebRTCStorage = [AWSKinesisVideoWebRTCStorage KinesisVideoWebRTCStorageForKey:@"USWest2KinesisVideoWebRTCStorage"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)KinesisVideoWebRTCStorageForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeKinesisVideoWebRTCStorageForKey:(NSString *)key;

/**
 <p> Join the ongoing one way-video and/or multi-way audio WebRTC session as a video producing device for an input channel. If there’s no existing session for the channel, a new streaming session needs to be created, and the Amazon Resource Name (ARN) of the signaling channel must be provided. </p><p>Currently for the <code>SINGLE_MASTER</code> type, a video producing device is able to ingest both audio and video media into a stream, while viewers can only ingest audio. Both a video producing device and viewers can join the session first, and wait for other participants.</p><p>While participants are having peer to peer conversations through webRTC, the ingested media session will be stored into the Kinesis Video Stream. Multiple viewers are able to playback real-time media.</p><p>Customers can also use existing Kinesis Video Streams features like <code>HLS</code> or <code>DASH</code> playback, Image generation, and more with ingested WebRTC media.</p><note><p>Assume that only one video producing device client can be associated with a session for the channel. If more than one client joins the session of a specific channel as a video producing device, the most recent client request takes precedence. </p></note>
 
 @param request A container for the necessary parameters to execute the JoinStorageSession service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisVideoWebRTCStorageErrorDomain` domain and the following error code: `AWSKinesisVideoWebRTCStorageErrorClientLimitExceeded`, `AWSKinesisVideoWebRTCStorageErrorInvalidArgument`, `AWSKinesisVideoWebRTCStorageErrorAccessDenied`, `AWSKinesisVideoWebRTCStorageErrorResourceNotFound`.
 
 @see AWSKinesisVideoWebRTCStorageJoinStorageSessionInput
 */
- (AWSTask *)joinStorageSession:(AWSKinesisVideoWebRTCStorageJoinStorageSessionInput *)request;

/**
 <p> Join the ongoing one way-video and/or multi-way audio WebRTC session as a video producing device for an input channel. If there’s no existing session for the channel, a new streaming session needs to be created, and the Amazon Resource Name (ARN) of the signaling channel must be provided. </p><p>Currently for the <code>SINGLE_MASTER</code> type, a video producing device is able to ingest both audio and video media into a stream, while viewers can only ingest audio. Both a video producing device and viewers can join the session first, and wait for other participants.</p><p>While participants are having peer to peer conversations through webRTC, the ingested media session will be stored into the Kinesis Video Stream. Multiple viewers are able to playback real-time media.</p><p>Customers can also use existing Kinesis Video Streams features like <code>HLS</code> or <code>DASH</code> playback, Image generation, and more with ingested WebRTC media.</p><note><p>Assume that only one video producing device client can be associated with a session for the channel. If more than one client joins the session of a specific channel as a video producing device, the most recent client request takes precedence. </p></note>
 
 @param request A container for the necessary parameters to execute the JoinStorageSession service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisVideoWebRTCStorageErrorDomain` domain and the following error code: `AWSKinesisVideoWebRTCStorageErrorClientLimitExceeded`, `AWSKinesisVideoWebRTCStorageErrorInvalidArgument`, `AWSKinesisVideoWebRTCStorageErrorAccessDenied`, `AWSKinesisVideoWebRTCStorageErrorResourceNotFound`.
 
 @see AWSKinesisVideoWebRTCStorageJoinStorageSessionInput
 */
- (void)joinStorageSession:(AWSKinesisVideoWebRTCStorageJoinStorageSessionInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p> Join the ongoing one way-video and/or multi-way audio WebRTC session as a viewer for an input channel. If there’s no existing session for the channel, create a new streaming session and provide the Amazon Resource Name (ARN) of the signaling channel (<code>channelArn</code>) and client id (<code>clientId</code>). </p><p>Currently for <code>SINGLE_MASTER</code> type, a video producing device is able to ingest both audio and video media into a stream, while viewers can only ingest audio. Both a video producing device and viewers can join a session first and wait for other participants. While participants are having peer to peer conversations through webRTC, the ingested media session will be stored into the Kinesis Video Stream. Multiple viewers are able to playback real-time media. </p><p>Customers can also use existing Kinesis Video Streams features like <code>HLS</code> or <code>DASH</code> playback, Image generation, and more with ingested WebRTC media. If there’s an existing session with the same <code>clientId</code> that's found in the join session request, the new request takes precedence.</p>
 
 @param request A container for the necessary parameters to execute the JoinStorageSessionAsViewer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisVideoWebRTCStorageErrorDomain` domain and the following error code: `AWSKinesisVideoWebRTCStorageErrorClientLimitExceeded`, `AWSKinesisVideoWebRTCStorageErrorInvalidArgument`, `AWSKinesisVideoWebRTCStorageErrorAccessDenied`, `AWSKinesisVideoWebRTCStorageErrorResourceNotFound`.
 
 @see AWSKinesisVideoWebRTCStorageJoinStorageSessionAsViewerInput
 */
- (AWSTask *)joinStorageSessionAsViewer:(AWSKinesisVideoWebRTCStorageJoinStorageSessionAsViewerInput *)request;

/**
 <p> Join the ongoing one way-video and/or multi-way audio WebRTC session as a viewer for an input channel. If there’s no existing session for the channel, create a new streaming session and provide the Amazon Resource Name (ARN) of the signaling channel (<code>channelArn</code>) and client id (<code>clientId</code>). </p><p>Currently for <code>SINGLE_MASTER</code> type, a video producing device is able to ingest both audio and video media into a stream, while viewers can only ingest audio. Both a video producing device and viewers can join a session first and wait for other participants. While participants are having peer to peer conversations through webRTC, the ingested media session will be stored into the Kinesis Video Stream. Multiple viewers are able to playback real-time media. </p><p>Customers can also use existing Kinesis Video Streams features like <code>HLS</code> or <code>DASH</code> playback, Image generation, and more with ingested WebRTC media. If there’s an existing session with the same <code>clientId</code> that's found in the join session request, the new request takes precedence.</p>
 
 @param request A container for the necessary parameters to execute the JoinStorageSessionAsViewer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisVideoWebRTCStorageErrorDomain` domain and the following error code: `AWSKinesisVideoWebRTCStorageErrorClientLimitExceeded`, `AWSKinesisVideoWebRTCStorageErrorInvalidArgument`, `AWSKinesisVideoWebRTCStorageErrorAccessDenied`, `AWSKinesisVideoWebRTCStorageErrorResourceNotFound`.
 
 @see AWSKinesisVideoWebRTCStorageJoinStorageSessionAsViewerInput
 */
- (void)joinStorageSessionAsViewer:(AWSKinesisVideoWebRTCStorageJoinStorageSessionAsViewerInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
