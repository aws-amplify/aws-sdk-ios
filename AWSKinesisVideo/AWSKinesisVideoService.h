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
#import "AWSKinesisVideoModel.h"
#import "AWSKinesisVideoResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSKinesisVideo
FOUNDATION_EXPORT NSString *const AWSKinesisVideoSDKVersion;

/**
 <p/>
 */
@interface AWSKinesisVideo : AWSService

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

     let KinesisVideo = AWSKinesisVideo.default()

 *Objective-C*

     AWSKinesisVideo *KinesisVideo = [AWSKinesisVideo defaultKinesisVideo];

 @return The default service client.
 */
+ (instancetype)defaultKinesisVideo;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSKinesisVideo.register(with: configuration!, forKey: "USWest2KinesisVideo")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:@"USWest2KinesisVideo"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let KinesisVideo = AWSKinesisVideo(forKey: "USWest2KinesisVideo")

 *Objective-C*

     AWSKinesisVideo *KinesisVideo = [AWSKinesisVideo KinesisVideoForKey:@"USWest2KinesisVideo"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerKinesisVideoWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerKinesisVideoWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSKinesisVideo.register(with: configuration!, forKey: "USWest2KinesisVideo")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:@"USWest2KinesisVideo"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let KinesisVideo = AWSKinesisVideo(forKey: "USWest2KinesisVideo")

 *Objective-C*

     AWSKinesisVideo *KinesisVideo = [AWSKinesisVideo KinesisVideoForKey:@"USWest2KinesisVideo"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)KinesisVideoForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeKinesisVideoForKey:(NSString *)key;

/**
 <p>Creates a signaling channel. </p><p><code>CreateSignalingChannel</code> is an asynchronous operation.</p>
 
 @param request A container for the necessary parameters to execute the CreateSignalingChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisVideoCreateSignalingChannelOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorAccountChannelLimitExceeded`, `AWSKinesisVideoErrorResourceInUse`, `AWSKinesisVideoErrorAccessDenied`, `AWSKinesisVideoErrorTagsPerResourceExceededLimit`.
 
 @see AWSKinesisVideoCreateSignalingChannelInput
 @see AWSKinesisVideoCreateSignalingChannelOutput
 */
- (AWSTask<AWSKinesisVideoCreateSignalingChannelOutput *> *)createSignalingChannel:(AWSKinesisVideoCreateSignalingChannelInput *)request;

/**
 <p>Creates a signaling channel. </p><p><code>CreateSignalingChannel</code> is an asynchronous operation.</p>
 
 @param request A container for the necessary parameters to execute the CreateSignalingChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorAccountChannelLimitExceeded`, `AWSKinesisVideoErrorResourceInUse`, `AWSKinesisVideoErrorAccessDenied`, `AWSKinesisVideoErrorTagsPerResourceExceededLimit`.
 
 @see AWSKinesisVideoCreateSignalingChannelInput
 @see AWSKinesisVideoCreateSignalingChannelOutput
 */
- (void)createSignalingChannel:(AWSKinesisVideoCreateSignalingChannelInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisVideoCreateSignalingChannelOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new Kinesis video stream. </p><p>When you create a new stream, Kinesis Video Streams assigns it a version number. When you change the stream's metadata, Kinesis Video Streams updates the version. </p><p><code>CreateStream</code> is an asynchronous operation.</p><p>For information about how the service works, see <a href="https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/how-it-works.html">How it Works</a>. </p><p>You must have permissions for the <code>KinesisVideo:CreateStream</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CreateStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisVideoCreateStreamOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorAccountStreamLimitExceeded`, `AWSKinesisVideoErrorDeviceStreamLimitExceeded`, `AWSKinesisVideoErrorResourceInUse`, `AWSKinesisVideoErrorInvalidDevice`, `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorTagsPerResourceExceededLimit`.
 
 @see AWSKinesisVideoCreateStreamInput
 @see AWSKinesisVideoCreateStreamOutput
 */
- (AWSTask<AWSKinesisVideoCreateStreamOutput *> *)createStream:(AWSKinesisVideoCreateStreamInput *)request;

/**
 <p>Creates a new Kinesis video stream. </p><p>When you create a new stream, Kinesis Video Streams assigns it a version number. When you change the stream's metadata, Kinesis Video Streams updates the version. </p><p><code>CreateStream</code> is an asynchronous operation.</p><p>For information about how the service works, see <a href="https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/how-it-works.html">How it Works</a>. </p><p>You must have permissions for the <code>KinesisVideo:CreateStream</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CreateStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorAccountStreamLimitExceeded`, `AWSKinesisVideoErrorDeviceStreamLimitExceeded`, `AWSKinesisVideoErrorResourceInUse`, `AWSKinesisVideoErrorInvalidDevice`, `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorTagsPerResourceExceededLimit`.
 
 @see AWSKinesisVideoCreateStreamInput
 @see AWSKinesisVideoCreateStreamOutput
 */
- (void)createStream:(AWSKinesisVideoCreateStreamInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisVideoCreateStreamOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified signaling channel. <code>DeleteSignalingChannel</code> is an asynchronous operation. If you don't specify the channel's current version, the most recent version is deleted.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSignalingChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisVideoDeleteSignalingChannelOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorAccessDenied`, `AWSKinesisVideoErrorVersionMismatch`.
 
 @see AWSKinesisVideoDeleteSignalingChannelInput
 @see AWSKinesisVideoDeleteSignalingChannelOutput
 */
- (AWSTask<AWSKinesisVideoDeleteSignalingChannelOutput *> *)deleteSignalingChannel:(AWSKinesisVideoDeleteSignalingChannelInput *)request;

/**
 <p>Deletes a specified signaling channel. <code>DeleteSignalingChannel</code> is an asynchronous operation. If you don't specify the channel's current version, the most recent version is deleted.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSignalingChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorAccessDenied`, `AWSKinesisVideoErrorVersionMismatch`.
 
 @see AWSKinesisVideoDeleteSignalingChannelInput
 @see AWSKinesisVideoDeleteSignalingChannelOutput
 */
- (void)deleteSignalingChannel:(AWSKinesisVideoDeleteSignalingChannelInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisVideoDeleteSignalingChannelOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a Kinesis video stream and the data contained in the stream. </p><p>This method marks the stream for deletion, and makes the data in the stream inaccessible immediately.</p><p></p><p> To ensure that you have the latest version of the stream before deleting it, you can specify the stream version. Kinesis Video Streams assigns a version to each stream. When you update a stream, Kinesis Video Streams assigns a new version number. To get the latest stream version, use the <code>DescribeStream</code> API. </p><p>This operation requires permission for the <code>KinesisVideo:DeleteStream</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisVideoDeleteStreamOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorNotAuthorized`, `AWSKinesisVideoErrorVersionMismatch`.
 
 @see AWSKinesisVideoDeleteStreamInput
 @see AWSKinesisVideoDeleteStreamOutput
 */
- (AWSTask<AWSKinesisVideoDeleteStreamOutput *> *)deleteStream:(AWSKinesisVideoDeleteStreamInput *)request;

/**
 <p>Deletes a Kinesis video stream and the data contained in the stream. </p><p>This method marks the stream for deletion, and makes the data in the stream inaccessible immediately.</p><p></p><p> To ensure that you have the latest version of the stream before deleting it, you can specify the stream version. Kinesis Video Streams assigns a version to each stream. When you update a stream, Kinesis Video Streams assigns a new version number. To get the latest stream version, use the <code>DescribeStream</code> API. </p><p>This operation requires permission for the <code>KinesisVideo:DeleteStream</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorNotAuthorized`, `AWSKinesisVideoErrorVersionMismatch`.
 
 @see AWSKinesisVideoDeleteStreamInput
 @see AWSKinesisVideoDeleteStreamOutput
 */
- (void)deleteStream:(AWSKinesisVideoDeleteStreamInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisVideoDeleteStreamOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the most current information about the signaling channel. You must specify either the name or the ARN of the channel that you want to describe.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSignalingChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisVideoDescribeSignalingChannelOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorAccessDenied`.
 
 @see AWSKinesisVideoDescribeSignalingChannelInput
 @see AWSKinesisVideoDescribeSignalingChannelOutput
 */
- (AWSTask<AWSKinesisVideoDescribeSignalingChannelOutput *> *)describeSignalingChannel:(AWSKinesisVideoDescribeSignalingChannelInput *)request;

/**
 <p>Returns the most current information about the signaling channel. You must specify either the name or the ARN of the channel that you want to describe.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSignalingChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorAccessDenied`.
 
 @see AWSKinesisVideoDescribeSignalingChannelInput
 @see AWSKinesisVideoDescribeSignalingChannelOutput
 */
- (void)describeSignalingChannel:(AWSKinesisVideoDescribeSignalingChannelInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisVideoDescribeSignalingChannelOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the most current information about the specified stream. You must specify either the <code>StreamName</code> or the <code>StreamARN</code>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisVideoDescribeStreamOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorNotAuthorized`.
 
 @see AWSKinesisVideoDescribeStreamInput
 @see AWSKinesisVideoDescribeStreamOutput
 */
- (AWSTask<AWSKinesisVideoDescribeStreamOutput *> *)describeStream:(AWSKinesisVideoDescribeStreamInput *)request;

/**
 <p>Returns the most current information about the specified stream. You must specify either the <code>StreamName</code> or the <code>StreamARN</code>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorNotAuthorized`.
 
 @see AWSKinesisVideoDescribeStreamInput
 @see AWSKinesisVideoDescribeStreamOutput
 */
- (void)describeStream:(AWSKinesisVideoDescribeStreamInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisVideoDescribeStreamOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets an endpoint for a specified stream for either reading or writing. Use this endpoint in your application to read from the specified stream (using the <code>GetMedia</code> or <code>GetMediaForFragmentList</code> operations) or write to it (using the <code>PutMedia</code> operation). </p><note><p>The returned endpoint does not have the API name appended. The client needs to add the API name to the returned endpoint.</p></note><p>In the request, specify the stream either by <code>StreamName</code> or <code>StreamARN</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetDataEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisVideoGetDataEndpointOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorNotAuthorized`.
 
 @see AWSKinesisVideoGetDataEndpointInput
 @see AWSKinesisVideoGetDataEndpointOutput
 */
- (AWSTask<AWSKinesisVideoGetDataEndpointOutput *> *)getDataEndpoint:(AWSKinesisVideoGetDataEndpointInput *)request;

/**
 <p>Gets an endpoint for a specified stream for either reading or writing. Use this endpoint in your application to read from the specified stream (using the <code>GetMedia</code> or <code>GetMediaForFragmentList</code> operations) or write to it (using the <code>PutMedia</code> operation). </p><note><p>The returned endpoint does not have the API name appended. The client needs to add the API name to the returned endpoint.</p></note><p>In the request, specify the stream either by <code>StreamName</code> or <code>StreamARN</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetDataEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorNotAuthorized`.
 
 @see AWSKinesisVideoGetDataEndpointInput
 @see AWSKinesisVideoGetDataEndpointOutput
 */
- (void)getDataEndpoint:(AWSKinesisVideoGetDataEndpointInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisVideoGetDataEndpointOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides an endpoint for the specified signaling channel to send and receive messages. This API uses the <code>SingleMasterChannelEndpointConfiguration</code> input parameter, which consists of the <code>Protocols</code> and <code>Role</code> properties.</p><p><code>Protocols</code> is used to determine the communication mechanism. For example, specifying <code>WSS</code> as the protocol, results in this API producing a secure websocket endpoint, and specifying <code>HTTPS</code> as the protocol, results in this API generating an HTTPS endpoint. </p><p><code>Role</code> determines the messaging permissions. A <code>MASTER</code> role results in this API generating an endpoint that a client can use to communicate with any of the viewers on the channel. A <code>VIEWER</code> role results in this API generating an endpoint that a client can use to communicate only with a <code>MASTER</code>. </p>
 
 @param request A container for the necessary parameters to execute the GetSignalingChannelEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisVideoGetSignalingChannelEndpointOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorResourceInUse`, `AWSKinesisVideoErrorAccessDenied`.
 
 @see AWSKinesisVideoGetSignalingChannelEndpointInput
 @see AWSKinesisVideoGetSignalingChannelEndpointOutput
 */
- (AWSTask<AWSKinesisVideoGetSignalingChannelEndpointOutput *> *)getSignalingChannelEndpoint:(AWSKinesisVideoGetSignalingChannelEndpointInput *)request;

/**
 <p>Provides an endpoint for the specified signaling channel to send and receive messages. This API uses the <code>SingleMasterChannelEndpointConfiguration</code> input parameter, which consists of the <code>Protocols</code> and <code>Role</code> properties.</p><p><code>Protocols</code> is used to determine the communication mechanism. For example, specifying <code>WSS</code> as the protocol, results in this API producing a secure websocket endpoint, and specifying <code>HTTPS</code> as the protocol, results in this API generating an HTTPS endpoint. </p><p><code>Role</code> determines the messaging permissions. A <code>MASTER</code> role results in this API generating an endpoint that a client can use to communicate with any of the viewers on the channel. A <code>VIEWER</code> role results in this API generating an endpoint that a client can use to communicate only with a <code>MASTER</code>. </p>
 
 @param request A container for the necessary parameters to execute the GetSignalingChannelEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorResourceInUse`, `AWSKinesisVideoErrorAccessDenied`.
 
 @see AWSKinesisVideoGetSignalingChannelEndpointInput
 @see AWSKinesisVideoGetSignalingChannelEndpointOutput
 */
- (void)getSignalingChannelEndpoint:(AWSKinesisVideoGetSignalingChannelEndpointInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisVideoGetSignalingChannelEndpointOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an array of <code>ChannelInfo</code> objects. Each object describes a signaling channel. To retrieve only those channels that satisfy a specific condition, you can specify a <code>ChannelNameCondition</code>.</p>
 
 @param request A container for the necessary parameters to execute the ListSignalingChannels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisVideoListSignalingChannelsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorAccessDenied`.
 
 @see AWSKinesisVideoListSignalingChannelsInput
 @see AWSKinesisVideoListSignalingChannelsOutput
 */
- (AWSTask<AWSKinesisVideoListSignalingChannelsOutput *> *)listSignalingChannels:(AWSKinesisVideoListSignalingChannelsInput *)request;

/**
 <p>Returns an array of <code>ChannelInfo</code> objects. Each object describes a signaling channel. To retrieve only those channels that satisfy a specific condition, you can specify a <code>ChannelNameCondition</code>.</p>
 
 @param request A container for the necessary parameters to execute the ListSignalingChannels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorAccessDenied`.
 
 @see AWSKinesisVideoListSignalingChannelsInput
 @see AWSKinesisVideoListSignalingChannelsOutput
 */
- (void)listSignalingChannels:(AWSKinesisVideoListSignalingChannelsInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisVideoListSignalingChannelsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an array of <code>StreamInfo</code> objects. Each object describes a stream. To retrieve only streams that satisfy a specific condition, you can specify a <code>StreamNameCondition</code>. </p>
 
 @param request A container for the necessary parameters to execute the ListStreams service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisVideoListStreamsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorInvalidArgument`.
 
 @see AWSKinesisVideoListStreamsInput
 @see AWSKinesisVideoListStreamsOutput
 */
- (AWSTask<AWSKinesisVideoListStreamsOutput *> *)listStreams:(AWSKinesisVideoListStreamsInput *)request;

/**
 <p>Returns an array of <code>StreamInfo</code> objects. Each object describes a stream. To retrieve only streams that satisfy a specific condition, you can specify a <code>StreamNameCondition</code>. </p>
 
 @param request A container for the necessary parameters to execute the ListStreams service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorInvalidArgument`.
 
 @see AWSKinesisVideoListStreamsInput
 @see AWSKinesisVideoListStreamsOutput
 */
- (void)listStreams:(AWSKinesisVideoListStreamsInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisVideoListStreamsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of tags associated with the specified signaling channel.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisVideoListTagsForResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorAccessDenied`.
 
 @see AWSKinesisVideoListTagsForResourceInput
 @see AWSKinesisVideoListTagsForResourceOutput
 */
- (AWSTask<AWSKinesisVideoListTagsForResourceOutput *> *)listTagsForResource:(AWSKinesisVideoListTagsForResourceInput *)request;

/**
 <p>Returns a list of tags associated with the specified signaling channel.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorAccessDenied`.
 
 @see AWSKinesisVideoListTagsForResourceInput
 @see AWSKinesisVideoListTagsForResourceOutput
 */
- (void)listTagsForResource:(AWSKinesisVideoListTagsForResourceInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisVideoListTagsForResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of tags associated with the specified stream.</p><p>In the request, you must specify either the <code>StreamName</code> or the <code>StreamARN</code>. </p>
 
 @param request A container for the necessary parameters to execute the ListTagsForStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisVideoListTagsForStreamOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorNotAuthorized`, `AWSKinesisVideoErrorInvalidResourceFormat`.
 
 @see AWSKinesisVideoListTagsForStreamInput
 @see AWSKinesisVideoListTagsForStreamOutput
 */
- (AWSTask<AWSKinesisVideoListTagsForStreamOutput *> *)listTagsForStream:(AWSKinesisVideoListTagsForStreamInput *)request;

/**
 <p>Returns a list of tags associated with the specified stream.</p><p>In the request, you must specify either the <code>StreamName</code> or the <code>StreamARN</code>. </p>
 
 @param request A container for the necessary parameters to execute the ListTagsForStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorNotAuthorized`, `AWSKinesisVideoErrorInvalidResourceFormat`.
 
 @see AWSKinesisVideoListTagsForStreamInput
 @see AWSKinesisVideoListTagsForStreamOutput
 */
- (void)listTagsForStream:(AWSKinesisVideoListTagsForStreamInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisVideoListTagsForStreamOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds one or more tags to a signaling channel. A <i>tag</i> is a key-value pair (the value is optional) that you can define and assign to AWS resources. If you specify a tag that already exists, the tag value is replaced with the value that you specify in the request. For more information, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisVideoTagResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorAccessDenied`, `AWSKinesisVideoErrorTagsPerResourceExceededLimit`.
 
 @see AWSKinesisVideoTagResourceInput
 @see AWSKinesisVideoTagResourceOutput
 */
- (AWSTask<AWSKinesisVideoTagResourceOutput *> *)tagResource:(AWSKinesisVideoTagResourceInput *)request;

/**
 <p>Adds one or more tags to a signaling channel. A <i>tag</i> is a key-value pair (the value is optional) that you can define and assign to AWS resources. If you specify a tag that already exists, the tag value is replaced with the value that you specify in the request. For more information, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorAccessDenied`, `AWSKinesisVideoErrorTagsPerResourceExceededLimit`.
 
 @see AWSKinesisVideoTagResourceInput
 @see AWSKinesisVideoTagResourceOutput
 */
- (void)tagResource:(AWSKinesisVideoTagResourceInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisVideoTagResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds one or more tags to a stream. A <i>tag</i> is a key-value pair (the value is optional) that you can define and assign to AWS resources. If you specify a tag that already exists, the tag value is replaced with the value that you specify in the request. For more information, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>. </p><p>You must provide either the <code>StreamName</code> or the <code>StreamARN</code>.</p><p>This operation requires permission for the <code>KinesisVideo:TagStream</code> action.</p><p>Kinesis video streams support up to 50 tags.</p>
 
 @param request A container for the necessary parameters to execute the TagStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisVideoTagStreamOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorNotAuthorized`, `AWSKinesisVideoErrorInvalidResourceFormat`, `AWSKinesisVideoErrorTagsPerResourceExceededLimit`.
 
 @see AWSKinesisVideoTagStreamInput
 @see AWSKinesisVideoTagStreamOutput
 */
- (AWSTask<AWSKinesisVideoTagStreamOutput *> *)tagStream:(AWSKinesisVideoTagStreamInput *)request;

/**
 <p>Adds one or more tags to a stream. A <i>tag</i> is a key-value pair (the value is optional) that you can define and assign to AWS resources. If you specify a tag that already exists, the tag value is replaced with the value that you specify in the request. For more information, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>. </p><p>You must provide either the <code>StreamName</code> or the <code>StreamARN</code>.</p><p>This operation requires permission for the <code>KinesisVideo:TagStream</code> action.</p><p>Kinesis video streams support up to 50 tags.</p>
 
 @param request A container for the necessary parameters to execute the TagStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorNotAuthorized`, `AWSKinesisVideoErrorInvalidResourceFormat`, `AWSKinesisVideoErrorTagsPerResourceExceededLimit`.
 
 @see AWSKinesisVideoTagStreamInput
 @see AWSKinesisVideoTagStreamOutput
 */
- (void)tagStream:(AWSKinesisVideoTagStreamInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisVideoTagStreamOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes one or more tags from a signaling channel. In the request, specify only a tag key or keys; don't specify the value. If you specify a tag key that does not exist, it's ignored.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisVideoUntagResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorAccessDenied`.
 
 @see AWSKinesisVideoUntagResourceInput
 @see AWSKinesisVideoUntagResourceOutput
 */
- (AWSTask<AWSKinesisVideoUntagResourceOutput *> *)untagResource:(AWSKinesisVideoUntagResourceInput *)request;

/**
 <p>Removes one or more tags from a signaling channel. In the request, specify only a tag key or keys; don't specify the value. If you specify a tag key that does not exist, it's ignored.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorAccessDenied`.
 
 @see AWSKinesisVideoUntagResourceInput
 @see AWSKinesisVideoUntagResourceOutput
 */
- (void)untagResource:(AWSKinesisVideoUntagResourceInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisVideoUntagResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes one or more tags from a stream. In the request, specify only a tag key or keys; don't specify the value. If you specify a tag key that does not exist, it's ignored.</p><p>In the request, you must provide the <code>StreamName</code> or <code>StreamARN</code>.</p>
 
 @param request A container for the necessary parameters to execute the UntagStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisVideoUntagStreamOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorNotAuthorized`, `AWSKinesisVideoErrorInvalidResourceFormat`.
 
 @see AWSKinesisVideoUntagStreamInput
 @see AWSKinesisVideoUntagStreamOutput
 */
- (AWSTask<AWSKinesisVideoUntagStreamOutput *> *)untagStream:(AWSKinesisVideoUntagStreamInput *)request;

/**
 <p>Removes one or more tags from a stream. In the request, specify only a tag key or keys; don't specify the value. If you specify a tag key that does not exist, it's ignored.</p><p>In the request, you must provide the <code>StreamName</code> or <code>StreamARN</code>.</p>
 
 @param request A container for the necessary parameters to execute the UntagStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorNotAuthorized`, `AWSKinesisVideoErrorInvalidResourceFormat`.
 
 @see AWSKinesisVideoUntagStreamInput
 @see AWSKinesisVideoUntagStreamOutput
 */
- (void)untagStream:(AWSKinesisVideoUntagStreamInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisVideoUntagStreamOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Increases or decreases the stream's data retention period by the value that you specify. To indicate whether you want to increase or decrease the data retention period, specify the <code>Operation</code> parameter in the request body. In the request, you must specify either the <code>StreamName</code> or the <code>StreamARN</code>. </p><note><p>The retention period that you specify replaces the current value.</p></note><p>This operation requires permission for the <code>KinesisVideo:UpdateDataRetention</code> action.</p><p>Changing the data retention period affects the data in the stream as follows:</p><ul><li><p>If the data retention period is increased, existing data is retained for the new retention period. For example, if the data retention period is increased from one hour to seven hours, all existing data is retained for seven hours.</p></li><li><p>If the data retention period is decreased, existing data is retained for the new retention period. For example, if the data retention period is decreased from seven hours to one hour, all existing data is retained for one hour, and any data older than one hour is deleted immediately.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the UpdateDataRetention service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisVideoUpdateDataRetentionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorResourceInUse`, `AWSKinesisVideoErrorNotAuthorized`, `AWSKinesisVideoErrorVersionMismatch`.
 
 @see AWSKinesisVideoUpdateDataRetentionInput
 @see AWSKinesisVideoUpdateDataRetentionOutput
 */
- (AWSTask<AWSKinesisVideoUpdateDataRetentionOutput *> *)updateDataRetention:(AWSKinesisVideoUpdateDataRetentionInput *)request;

/**
 <p> Increases or decreases the stream's data retention period by the value that you specify. To indicate whether you want to increase or decrease the data retention period, specify the <code>Operation</code> parameter in the request body. In the request, you must specify either the <code>StreamName</code> or the <code>StreamARN</code>. </p><note><p>The retention period that you specify replaces the current value.</p></note><p>This operation requires permission for the <code>KinesisVideo:UpdateDataRetention</code> action.</p><p>Changing the data retention period affects the data in the stream as follows:</p><ul><li><p>If the data retention period is increased, existing data is retained for the new retention period. For example, if the data retention period is increased from one hour to seven hours, all existing data is retained for seven hours.</p></li><li><p>If the data retention period is decreased, existing data is retained for the new retention period. For example, if the data retention period is decreased from seven hours to one hour, all existing data is retained for one hour, and any data older than one hour is deleted immediately.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the UpdateDataRetention service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorResourceInUse`, `AWSKinesisVideoErrorNotAuthorized`, `AWSKinesisVideoErrorVersionMismatch`.
 
 @see AWSKinesisVideoUpdateDataRetentionInput
 @see AWSKinesisVideoUpdateDataRetentionOutput
 */
- (void)updateDataRetention:(AWSKinesisVideoUpdateDataRetentionInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisVideoUpdateDataRetentionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the existing signaling channel. This is an asynchronous operation and takes time to complete. </p><p>If the <code>MessageTtlSeconds</code> value is updated (either increased or reduced), then it only applies to new messages sent via this channel after it's been updated. Existing messages are still expire as per the previous <code>MessageTtlSeconds</code> value.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSignalingChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisVideoUpdateSignalingChannelOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorResourceInUse`, `AWSKinesisVideoErrorAccessDenied`, `AWSKinesisVideoErrorVersionMismatch`.
 
 @see AWSKinesisVideoUpdateSignalingChannelInput
 @see AWSKinesisVideoUpdateSignalingChannelOutput
 */
- (AWSTask<AWSKinesisVideoUpdateSignalingChannelOutput *> *)updateSignalingChannel:(AWSKinesisVideoUpdateSignalingChannelInput *)request;

/**
 <p>Updates the existing signaling channel. This is an asynchronous operation and takes time to complete. </p><p>If the <code>MessageTtlSeconds</code> value is updated (either increased or reduced), then it only applies to new messages sent via this channel after it's been updated. Existing messages are still expire as per the previous <code>MessageTtlSeconds</code> value.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSignalingChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorResourceInUse`, `AWSKinesisVideoErrorAccessDenied`, `AWSKinesisVideoErrorVersionMismatch`.
 
 @see AWSKinesisVideoUpdateSignalingChannelInput
 @see AWSKinesisVideoUpdateSignalingChannelOutput
 */
- (void)updateSignalingChannel:(AWSKinesisVideoUpdateSignalingChannelInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisVideoUpdateSignalingChannelOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates stream metadata, such as the device name and media type.</p><p>You must provide the stream name or the Amazon Resource Name (ARN) of the stream.</p><p>To make sure that you have the latest version of the stream before updating it, you can specify the stream version. Kinesis Video Streams assigns a version to each stream. When you update a stream, Kinesis Video Streams assigns a new version number. To get the latest stream version, use the <code>DescribeStream</code> API. </p><p><code>UpdateStream</code> is an asynchronous operation, and takes time to complete.</p>
 
 @param request A container for the necessary parameters to execute the UpdateStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisVideoUpdateStreamOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorResourceInUse`, `AWSKinesisVideoErrorNotAuthorized`, `AWSKinesisVideoErrorVersionMismatch`.
 
 @see AWSKinesisVideoUpdateStreamInput
 @see AWSKinesisVideoUpdateStreamOutput
 */
- (AWSTask<AWSKinesisVideoUpdateStreamOutput *> *)updateStream:(AWSKinesisVideoUpdateStreamInput *)request;

/**
 <p>Updates stream metadata, such as the device name and media type.</p><p>You must provide the stream name or the Amazon Resource Name (ARN) of the stream.</p><p>To make sure that you have the latest version of the stream before updating it, you can specify the stream version. Kinesis Video Streams assigns a version to each stream. When you update a stream, Kinesis Video Streams assigns a new version number. To get the latest stream version, use the <code>DescribeStream</code> API. </p><p><code>UpdateStream</code> is an asynchronous operation, and takes time to complete.</p>
 
 @param request A container for the necessary parameters to execute the UpdateStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisVideoErrorDomain` domain and the following error code: `AWSKinesisVideoErrorClientLimitExceeded`, `AWSKinesisVideoErrorInvalidArgument`, `AWSKinesisVideoErrorResourceNotFound`, `AWSKinesisVideoErrorResourceInUse`, `AWSKinesisVideoErrorNotAuthorized`, `AWSKinesisVideoErrorVersionMismatch`.
 
 @see AWSKinesisVideoUpdateStreamInput
 @see AWSKinesisVideoUpdateStreamOutput
 */
- (void)updateStream:(AWSKinesisVideoUpdateStreamInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisVideoUpdateStreamOutput * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
