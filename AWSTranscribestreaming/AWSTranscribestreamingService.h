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
#import "AWSTranscribestreamingModel.h"
#import "AWSTranscribestreamingResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSTranscribestreaming
FOUNDATION_EXPORT NSString *const AWSTranscribestreamingSDKVersion;

/**
 <p>Operations and objects for transcribing streaming speech to text.</p>
 */
@interface AWSTranscribestreaming : AWSService

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

     let Transcribestreaming = AWSTranscribestreaming.default()

 *Objective-C*

     AWSTranscribestreaming *Transcribestreaming = [AWSTranscribestreaming defaultTranscribestreaming];

 @return The default service client.
 */
+ (instancetype)defaultTranscribestreaming;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSTranscribestreaming.register(with: configuration!, forKey: "USWest2Transcribestreaming")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSTranscribestreaming registerTranscribestreamingWithConfiguration:configuration forKey:@"USWest2Transcribestreaming"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Transcribestreaming = AWSTranscribestreaming(forKey: "USWest2Transcribestreaming")

 *Objective-C*

     AWSTranscribestreaming *Transcribestreaming = [AWSTranscribestreaming TranscribestreamingForKey:@"USWest2Transcribestreaming"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerTranscribestreamingWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerTranscribestreamingWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSTranscribestreaming.register(with: configuration!, forKey: "USWest2Transcribestreaming")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSTranscribestreaming registerTranscribestreamingWithConfiguration:configuration forKey:@"USWest2Transcribestreaming"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Transcribestreaming = AWSTranscribestreaming(forKey: "USWest2Transcribestreaming")

 *Objective-C*

     AWSTranscribestreaming *Transcribestreaming = [AWSTranscribestreaming TranscribestreamingForKey:@"USWest2Transcribestreaming"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)TranscribestreamingForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeTranscribestreamingForKey:(NSString *)key;

/**
 <p>Starts a bidirectional HTTP2 stream where audio is streamed to Amazon Transcribe and the transcription results are streamed to your application.</p><p>The following are encoded as HTTP2 headers:</p><ul><li><p>x-amzn-transcribe-language-code</p></li><li><p>x-amzn-transcribe-media-encoding</p></li><li><p>x-amzn-transcribe-sample-rate</p></li><li><p>x-amzn-transcribe-session-id</p></li></ul>
 
 @param request A container for the necessary parameters to execute the StartStreamTranscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribestreamingStartStreamTranscriptionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribestreamingErrorDomain` domain and the following error code: `AWSTranscribestreamingErrorBadRequest`, `AWSTranscribestreamingErrorLimitExceeded`, `AWSTranscribestreamingErrorInternalFailure`, `AWSTranscribestreamingErrorConflict`, `AWSTranscribestreamingErrorServiceUnavailable`.
 
 @see AWSTranscribestreamingStartStreamTranscriptionRequest
 @see AWSTranscribestreamingStartStreamTranscriptionResponse
 */
- (AWSTask<AWSTranscribestreamingStartStreamTranscriptionResponse *> *)startStreamTranscription:(AWSTranscribestreamingStartStreamTranscriptionRequest *)request;

/**
 <p>Starts a bidirectional HTTP2 stream where audio is streamed to Amazon Transcribe and the transcription results are streamed to your application.</p><p>The following are encoded as HTTP2 headers:</p><ul><li><p>x-amzn-transcribe-language-code</p></li><li><p>x-amzn-transcribe-media-encoding</p></li><li><p>x-amzn-transcribe-sample-rate</p></li><li><p>x-amzn-transcribe-session-id</p></li></ul>
 
 @param request A container for the necessary parameters to execute the StartStreamTranscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribestreamingErrorDomain` domain and the following error code: `AWSTranscribestreamingErrorBadRequest`, `AWSTranscribestreamingErrorLimitExceeded`, `AWSTranscribestreamingErrorInternalFailure`, `AWSTranscribestreamingErrorConflict`, `AWSTranscribestreamingErrorServiceUnavailable`.
 
 @see AWSTranscribestreamingStartStreamTranscriptionRequest
 @see AWSTranscribestreamingStartStreamTranscriptionResponse
 */
- (void)startStreamTranscription:(AWSTranscribestreamingStartStreamTranscriptionRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribestreamingStartStreamTranscriptionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
