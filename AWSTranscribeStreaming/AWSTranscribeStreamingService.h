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
#import "AWSTranscribeStreamingModel.h"
#import "AWSTranscribeStreamingResources.h"
#import "AWSTranscribeStreamingClientDelegate.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSTranscribeStreaming
FOUNDATION_EXPORT NSString *const AWSTranscribeStreamingSDKVersion;

/**
 <p>Operations and objects for transcribing streaming speech to text.</p>
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
 Prepares a websocket to receive streaming data according to the specifications contained in `request`, and opens the underlying web socket.
 
 Apps should set a delegate before calling this method so that they may be notified when the web socket is open and ready to begin receiving
 data.

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
