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
#import "AWSTranscribeStreamingModel.h"
#import "AWSTranscribeStreamingResources.h"
#import "AWSTranscribeStreamingClientDelegate.h"
#import "AWSTranscribeStreamingWebSocketProvider.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSTranscribeStreaming
FOUNDATION_EXPORT NSString *const AWSTranscribeStreamingSDKVersion;

/**
 Operations and objects for transcribing streaming speech to text.

 For backend setup and instructions on configuring policies, please see
 https://docs.aws.amazon.com/transcribe/latest/dg/streaming.html

 This SDK currently only supports streaming via WebSockets, which is described here
 https://docs.aws.amazon.com/transcribe/latest/dg/websocket.html

 **How to Use**

 See the `AWSTranscribeStreamingSwiftTests.testStreamingExample()` integration test for an example of the "happy path"
 usage of this SDK. The general steps for usage are:

 1. Configure the AWSServiceConfiguration, including setting a credentials provider for signing WebSocket requests

 2. Create a TranscribeStreaming client with `+[AWSTranscribeStreaming registerTranscribeStreamingWithConfiguration:forKey:]`, or use the default

 3. Create a `AWSTranscribeStreamingStartStreamTranscriptionRequest` and set its properties to allow transcription of your audio stream

 4. Set up an `AWSTranscribeStreamingClientDelegate` to receive callbacks for connection status changes and transcription events

 5. Call `AWSTranscribeStreaming.setDelegate(:callbackQueue:)` to register your delegate with the client. **NOTE** We do not recommend using the
    `main` queue as your callback queue, since doing so could impact your app's UI performance.

 6. Call `AWSTranscribeStreaming.startTranscriptionWSS()` with the configured request

 7. Wait for your delegate's `connectionStatusCallback` to be invoked with a status of `.connected`. At this point, the transcribe client is ready to
    receive audio data

 8. Chunk your audio data and send it to AWS Transcribe using the `AWSTranscribeStreaming.send()` method

 9. As you send data, your delegate will be receiving transcription events in the `receiveEventCallback`, which you can decode and use in your app.

 10. When you reach the end of your audio data, call `AWSTranscribeStreaming.sendEndFrame()` to signal the end of processing.
 <b>NOTE: We recommend waiting 2-3 seconds past the end of your last detected audio data before sending the end frame.</b>

 11. Wait for your final transcription events to be received, as indicated by a transcription event with the `isPartial` flag set to `0`.

 12. Call `AWSTranscribeStreaming.endTranscription()` to close the web socket and gracefully shut down the connection to the service.

 */
@interface AWSTranscribeStreaming : AWSService

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

     let TranscribeStreaming = AWSTranscribeStreaming.default()

 *Objective-C*

     AWSTranscribeStreaming *TranscribeStreaming = [AWSTranscribeStreaming defaultTranscribeStreaming];

 @return The default service client.
 */
+ (instancetype)defaultTranscribeStreaming;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSTranscribeStreaming.register(with: configuration!, forKey: "USWest2TranscribeStreaming")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSTranscribeStreaming registerTranscribeStreamingWithConfiguration:configuration forKey:@"USWest2TranscribeStreaming"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let TranscribeStreaming = AWSTranscribeStreaming(forKey: "USWest2TranscribeStreaming")

 *Objective-C*

     AWSTranscribeStreaming *TranscribeStreaming = [AWSTranscribeStreaming TranscribeStreamingForKey:@"USWest2TranscribeStreaming"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerTranscribeStreamingWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;


/**
Creates a service client with the given service configuration and registers it for the key.

For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

*Swift*

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
       let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
       let webSocketProvider = MyCustomNativeWebSocketProvider()
       AWSTranscribeStreaming.register(with: configuration!, forKey: "USWest2TranscribeStreaming", webSocketProvider: webSocketProvider)

       return true
   }

*Objective-C*

    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
        AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                        identityPoolId:@"YourIdentityPoolId"];
        AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                             credentialsProvider:credentialsProvider];
        MyCustomNativeWebSocketProvider *webSocketProvider =  [[MyCustomNativeWebSocketProvider alloc] init;

        [AWSTranscribeStreaming registerTranscribeStreamingWithConfiguration:configuration forKey:@"USWest2TranscribeStreaming" webSocketProvider:webSocketProvider];

        return YES;
    }

Then call the following to get the service client:

*Swift*

    let TranscribeStreaming = AWSTranscribeStreaming(forKey: "USWest2TranscribeStreaming")

*Objective-C*

    AWSTranscribeStreaming *TranscribeStreaming = [AWSTranscribeStreaming TranscribeStreamingForKey:@"USWest2TranscribeStreaming"];

@warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

@param configuration A service configuration object.
@param key  A string to identify the service client.
@param webSocketProvider the web socket provider you would like to use
*/

+ (void)registerTranscribeStreamingWithConfiguration:(AWSServiceConfiguration *)configuration
                                              forKey:(NSString *)key
                                   webSocketProvider:(id<AWSTranscribeStreamingWebSocketProvider>)webSocketProvider;

/**
 Retrieves the service client associated with the key. You need to call `+ registerTranscribeStreamingWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSTranscribeStreaming.register(with: configuration!, forKey: "USWest2TranscribeStreaming")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSTranscribeStreaming registerTranscribeStreamingWithConfiguration:configuration forKey:@"USWest2TranscribeStreaming"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let TranscribeStreaming = AWSTranscribeStreaming(forKey: "USWest2TranscribeStreaming")

 *Objective-C*

     AWSTranscribeStreaming *TranscribeStreaming = [AWSTranscribeStreaming TranscribeStreamingForKey:@"USWest2TranscribeStreaming"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)TranscribeStreamingForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeTranscribeStreamingForKey:(NSString *)key;

#pragma mark - TranscribeStreaming WSS support

/**
 Prepares a websocket to handle the transcription job described by `request`. This method prepares the websocket
 and initiates opening the socket, but the web socket will not be ready for handling audio data until the delegate
 receives a `AWSTranscribeStreamingClientConnectionStatusConnected` status on the
 `-[AWSTranscribeStreamingClientDelegate connectionStatusDidChange:withError:]` callback.

 Apps should set a delegate before calling this method so that they may be notified when the web socket is open and
 ready to begin receiving data.

 The process of opening a socket involves crafting a presigned URL according to the rules at
 https://docs.aws.amazon.com/transcribe/latest/dg/websocket.html. The presigned URL requires credentials, which
 eventually makes a call to the configured credentialsProvider. The credentials provider may make a network call to
 refresh the credentials, or fail with a message indicating the

 @param request the request containing the stream details
 */
- (void)startTranscriptionWSS:(AWSTranscribeStreamingStartStreamTranscriptionRequest *)request;

/**
 Ends the transcription session cleanly by closing the web socket. Failure to invoke this will likely result in a "BadRequest"
 exception after 15 seconds of inactivity.
 */
- (void)endTranscription;

/**
 Sends a chunk of data to AWSTranscribeStreaming. Internally, this method encodes the data and headers and sends it on the underlying
 web socket.

 @param data the data to send
 @param headers headers describing the chunk of data
 */
- (void)sendData:(NSData *)data headers:(NSDictionary *)headers;

/**
 Sends an "end" frame to the TranscribeService, and immediately closes the web socket. After sending the end frame, it is a fatal error to
 attempt to send any more data.
 */
- (void)sendEndFrame;

/**
 Sets the AWSTranscribeStreamingClient's delegate, which will receive connection state change messages and notifications of events.
 Callback methods will be invoked on the specified queue, regardless of the queue on which the web socket data is processed.

 @param delegate the delegate to assign. The delegate is weakly retained.
 @param callbackQueue the queue on which to invoke delegate callback methods. The queue is strongly retained.
 */
- (void)setDelegate:(id<AWSTranscribeStreamingClientDelegate>)delegate
      callbackQueue:(dispatch_queue_t)callbackQueue;

@end

NS_ASSUME_NONNULL_END
