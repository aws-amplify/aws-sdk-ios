//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSPollyModel.h"
#import "AWSPollyResources.h"

NS_ASSUME_NONNULL_BEGIN

/**
 <p>Amazon Polly is a web service that makes it easy to synthesize speech from text.</p><p>The Amazon Polly service provides API operations for synthesizing high-quality speech from plain text and Speech Synthesis Markup Language (SSML), along with managing pronunciations lexicons that enable you to get the best results for your application domain.</p>
 */
@interface AWSPolly : AWSService

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

     let Polly = AWSPolly.default()

 *Objective-C*

     AWSPolly *Polly = [AWSPolly defaultPolly];

 @return The default service client.
 */
+ (instancetype)defaultPolly;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSPolly.register(with: configuration!, forKey: "USWest2Polly")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSPolly registerPollyWithConfiguration:configuration forKey:@"USWest2Polly"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Polly = AWSPolly(forKey: "USWest2Polly")

 *Objective-C*

     AWSPolly *Polly = [AWSPolly PollyForKey:@"USWest2Polly"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerPollyWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerPollyWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSPolly.register(with: configuration!, forKey: "USWest2Polly")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSPolly registerPollyWithConfiguration:configuration forKey:@"USWest2Polly"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Polly = AWSPolly(forKey: "USWest2Polly")

 *Objective-C*

     AWSPolly *Polly = [AWSPolly PollyForKey:@"USWest2Polly"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)PollyForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removePollyForKey:(NSString *)key;

/**
 <p>Deletes the specified pronunciation lexicon stored in an AWS Region. A lexicon which has been deleted is not available for speech synthesis, nor is it possible to retrieve it using either the <code>GetLexicon</code> or <code>ListLexicon</code> APIs.</p><p>For more information, see <a href="http://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html">Managing Lexicons</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLexicon service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPollyDeleteLexiconOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSPollyErrorDomain` domain and the following error code: `AWSPollyErrorLexiconNotFound`, `AWSPollyErrorServiceFailure`.
 
 @see AWSPollyDeleteLexiconInput
 @see AWSPollyDeleteLexiconOutput
 */
- (AWSTask<AWSPollyDeleteLexiconOutput *> *)deleteLexicon:(AWSPollyDeleteLexiconInput *)request;

/**
 <p>Deletes the specified pronunciation lexicon stored in an AWS Region. A lexicon which has been deleted is not available for speech synthesis, nor is it possible to retrieve it using either the <code>GetLexicon</code> or <code>ListLexicon</code> APIs.</p><p>For more information, see <a href="http://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html">Managing Lexicons</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLexicon service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPollyErrorDomain` domain and the following error code: `AWSPollyErrorLexiconNotFound`, `AWSPollyErrorServiceFailure`.
 
 @see AWSPollyDeleteLexiconInput
 @see AWSPollyDeleteLexiconOutput
 */
- (void)deleteLexicon:(AWSPollyDeleteLexiconInput *)request completionHandler:(void (^ _Nullable)(AWSPollyDeleteLexiconOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the list of voices that are available for use when requesting speech synthesis. Each voice speaks a specified language, is either male or female, and is identified by an ID, which is the ASCII version of the voice name. </p><p>When synthesizing speech ( <code>SynthesizeSpeech</code> ), you provide the voice ID for the voice you want from the list of voices returned by <code>DescribeVoices</code>.</p><p>For example, you want your news reader application to read news in a specific language, but giving a user the option to choose the voice. Using the <code>DescribeVoices</code> operation you can provide the user with a list of available voices to select from.</p><p> You can optionally specify a language code to filter the available voices. For example, if you specify <code>en-US</code>, the operation returns a list of all available US English voices. </p><p>This operation requires permissions to perform the <code>polly:DescribeVoices</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVoices service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPollyDescribeVoicesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSPollyErrorDomain` domain and the following error code: `AWSPollyErrorInvalidNextToken`, `AWSPollyErrorServiceFailure`.
 
 @see AWSPollyDescribeVoicesInput
 @see AWSPollyDescribeVoicesOutput
 */
- (AWSTask<AWSPollyDescribeVoicesOutput *> *)describeVoices:(AWSPollyDescribeVoicesInput *)request;

/**
 <p>Returns the list of voices that are available for use when requesting speech synthesis. Each voice speaks a specified language, is either male or female, and is identified by an ID, which is the ASCII version of the voice name. </p><p>When synthesizing speech ( <code>SynthesizeSpeech</code> ), you provide the voice ID for the voice you want from the list of voices returned by <code>DescribeVoices</code>.</p><p>For example, you want your news reader application to read news in a specific language, but giving a user the option to choose the voice. Using the <code>DescribeVoices</code> operation you can provide the user with a list of available voices to select from.</p><p> You can optionally specify a language code to filter the available voices. For example, if you specify <code>en-US</code>, the operation returns a list of all available US English voices. </p><p>This operation requires permissions to perform the <code>polly:DescribeVoices</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVoices service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPollyErrorDomain` domain and the following error code: `AWSPollyErrorInvalidNextToken`, `AWSPollyErrorServiceFailure`.
 
 @see AWSPollyDescribeVoicesInput
 @see AWSPollyDescribeVoicesOutput
 */
- (void)describeVoices:(AWSPollyDescribeVoicesInput *)request completionHandler:(void (^ _Nullable)(AWSPollyDescribeVoicesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the content of the specified pronunciation lexicon stored in an AWS Region. For more information, see <a href="http://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html">Managing Lexicons</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetLexicon service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPollyGetLexiconOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSPollyErrorDomain` domain and the following error code: `AWSPollyErrorLexiconNotFound`, `AWSPollyErrorServiceFailure`.
 
 @see AWSPollyGetLexiconInput
 @see AWSPollyGetLexiconOutput
 */
- (AWSTask<AWSPollyGetLexiconOutput *> *)getLexicon:(AWSPollyGetLexiconInput *)request;

/**
 <p>Returns the content of the specified pronunciation lexicon stored in an AWS Region. For more information, see <a href="http://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html">Managing Lexicons</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetLexicon service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPollyErrorDomain` domain and the following error code: `AWSPollyErrorLexiconNotFound`, `AWSPollyErrorServiceFailure`.
 
 @see AWSPollyGetLexiconInput
 @see AWSPollyGetLexiconOutput
 */
- (void)getLexicon:(AWSPollyGetLexiconInput *)request completionHandler:(void (^ _Nullable)(AWSPollyGetLexiconOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of pronunciation lexicons stored in an AWS Region. For more information, see <a href="http://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html">Managing Lexicons</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListLexicons service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPollyListLexiconsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSPollyErrorDomain` domain and the following error code: `AWSPollyErrorInvalidNextToken`, `AWSPollyErrorServiceFailure`.
 
 @see AWSPollyListLexiconsInput
 @see AWSPollyListLexiconsOutput
 */
- (AWSTask<AWSPollyListLexiconsOutput *> *)listLexicons:(AWSPollyListLexiconsInput *)request;

/**
 <p>Returns a list of pronunciation lexicons stored in an AWS Region. For more information, see <a href="http://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html">Managing Lexicons</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListLexicons service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPollyErrorDomain` domain and the following error code: `AWSPollyErrorInvalidNextToken`, `AWSPollyErrorServiceFailure`.
 
 @see AWSPollyListLexiconsInput
 @see AWSPollyListLexiconsOutput
 */
- (void)listLexicons:(AWSPollyListLexiconsInput *)request completionHandler:(void (^ _Nullable)(AWSPollyListLexiconsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stores a pronunciation lexicon in an AWS Region. If a lexicon with the same name already exists in the region, it is overwritten by the new lexicon. Lexicon operations have eventual consistency, therefore, it might take some time before the lexicon is available to the SynthesizeSpeech operation.</p><p>For more information, see <a href="http://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html">Managing Lexicons</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutLexicon service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPollyPutLexiconOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSPollyErrorDomain` domain and the following error code: `AWSPollyErrorInvalidLexicon`, `AWSPollyErrorUnsupportedPlsAlphabet`, `AWSPollyErrorUnsupportedPlsLanguage`, `AWSPollyErrorLexiconSizeExceeded`, `AWSPollyErrorMaxLexemeLengthExceeded`, `AWSPollyErrorMaxLexiconsNumberExceeded`, `AWSPollyErrorServiceFailure`.
 
 @see AWSPollyPutLexiconInput
 @see AWSPollyPutLexiconOutput
 */
- (AWSTask<AWSPollyPutLexiconOutput *> *)putLexicon:(AWSPollyPutLexiconInput *)request;

/**
 <p>Stores a pronunciation lexicon in an AWS Region. If a lexicon with the same name already exists in the region, it is overwritten by the new lexicon. Lexicon operations have eventual consistency, therefore, it might take some time before the lexicon is available to the SynthesizeSpeech operation.</p><p>For more information, see <a href="http://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html">Managing Lexicons</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutLexicon service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPollyErrorDomain` domain and the following error code: `AWSPollyErrorInvalidLexicon`, `AWSPollyErrorUnsupportedPlsAlphabet`, `AWSPollyErrorUnsupportedPlsLanguage`, `AWSPollyErrorLexiconSizeExceeded`, `AWSPollyErrorMaxLexemeLengthExceeded`, `AWSPollyErrorMaxLexiconsNumberExceeded`, `AWSPollyErrorServiceFailure`.
 
 @see AWSPollyPutLexiconInput
 @see AWSPollyPutLexiconOutput
 */
- (void)putLexicon:(AWSPollyPutLexiconInput *)request completionHandler:(void (^ _Nullable)(AWSPollyPutLexiconOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Synthesizes UTF-8 input, plain text or SSML, to a stream of bytes. SSML input must be valid, well-formed SSML. Some alphabets might not be available with all the voices (for example, Cyrillic might not be read at all by English voices) unless phoneme mapping is used. For more information, see <a href="http://docs.aws.amazon.com/polly/latest/dg/how-text-to-speech-works.html">How it Works</a>.</p>
 
 @param request A container for the necessary parameters to execute the SynthesizeSpeech service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPollySynthesizeSpeechOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSPollyErrorDomain` domain and the following error code: `AWSPollyErrorTextLengthExceeded`, `AWSPollyErrorInvalidSampleRate`, `AWSPollyErrorInvalidSsml`, `AWSPollyErrorLexiconNotFound`, `AWSPollyErrorServiceFailure`, `AWSPollyErrorMarksNotSupportedForFormat`, `AWSPollyErrorSsmlMarksNotSupportedForTextType`.
 
 @see AWSPollySynthesizeSpeechInput
 @see AWSPollySynthesizeSpeechOutput
 */
- (AWSTask<AWSPollySynthesizeSpeechOutput *> *)synthesizeSpeech:(AWSPollySynthesizeSpeechInput *)request;

/**
 <p>Synthesizes UTF-8 input, plain text or SSML, to a stream of bytes. SSML input must be valid, well-formed SSML. Some alphabets might not be available with all the voices (for example, Cyrillic might not be read at all by English voices) unless phoneme mapping is used. For more information, see <a href="http://docs.aws.amazon.com/polly/latest/dg/how-text-to-speech-works.html">How it Works</a>.</p>
 
 @param request A container for the necessary parameters to execute the SynthesizeSpeech service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPollyErrorDomain` domain and the following error code: `AWSPollyErrorTextLengthExceeded`, `AWSPollyErrorInvalidSampleRate`, `AWSPollyErrorInvalidSsml`, `AWSPollyErrorLexiconNotFound`, `AWSPollyErrorServiceFailure`, `AWSPollyErrorMarksNotSupportedForFormat`, `AWSPollyErrorSsmlMarksNotSupportedForTextType`.
 
 @see AWSPollySynthesizeSpeechInput
 @see AWSPollySynthesizeSpeechOutput
 */
- (void)synthesizeSpeech:(AWSPollySynthesizeSpeechInput *)request completionHandler:(void (^ _Nullable)(AWSPollySynthesizeSpeechOutput * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
