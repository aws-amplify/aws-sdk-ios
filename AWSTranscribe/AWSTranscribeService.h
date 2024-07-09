//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSTranscribeModel.h"
#import "AWSTranscribeResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSTranscribe
FOUNDATION_EXPORT NSString *const AWSTranscribeSDKVersion;

/**
 <p>Amazon Transcribe offers three main types of batch transcription: <b>Standard</b>, <b>Medical</b>, and <b>Call Analytics</b>.</p><ul><li><p><b>Standard transcriptions</b> are the most common option. Refer to for details.</p></li><li><p><b>Medical transcriptions</b> are tailored to medical professionals and incorporate medical terms. A common use case for this service is transcribing doctor-patient dialogue into after-visit notes. Refer to for details.</p></li><li><p><b>Call Analytics transcriptions</b> are designed for use with call center audio on two different channels; if you're looking for insight into customer service calls, use this option. Refer to for details.</p></li></ul>
 */
@interface AWSTranscribe : AWSService

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

     let Transcribe = AWSTranscribe.default()

 *Objective-C*

     AWSTranscribe *Transcribe = [AWSTranscribe defaultTranscribe];

 @return The default service client.
 */
+ (instancetype)defaultTranscribe;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSTranscribe.register(with: configuration!, forKey: "USWest2Transcribe")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:@"USWest2Transcribe"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Transcribe = AWSTranscribe(forKey: "USWest2Transcribe")

 *Objective-C*

     AWSTranscribe *Transcribe = [AWSTranscribe TranscribeForKey:@"USWest2Transcribe"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerTranscribeWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerTranscribeWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSTranscribe.register(with: configuration!, forKey: "USWest2Transcribe")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:@"USWest2Transcribe"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Transcribe = AWSTranscribe(forKey: "USWest2Transcribe")

 *Objective-C*

     AWSTranscribe *Transcribe = [AWSTranscribe TranscribeForKey:@"USWest2Transcribe"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)TranscribeForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeTranscribeForKey:(NSString *)key;

/**
 <p>Creates a new Call Analytics category.</p><p>All categories are automatically applied to your Call Analytics transcriptions. Note that in order to apply categories to your transcriptions, you must create them before submitting your transcription request, as categories cannot be applied retroactively.</p><p>When creating a new category, you can use the <code>InputType</code> parameter to label the category as a <code>POST_CALL</code> or a <code>REAL_TIME</code> category. <code>POST_CALL</code> categories can only be applied to post-call transcriptions and <code>REAL_TIME</code> categories can only be applied to real-time transcriptions. If you do not include <code>InputType</code>, your category is created as a <code>POST_CALL</code> category by default.</p><p>Call Analytics categories are composed of rules. For each category, you must create between 1 and 20 rules. Rules can include these parameters: , , , and .</p><p>To update an existing category, see .</p><p>To learn more about Call Analytics categories, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html">Creating categories for post-call transcriptions</a> and <a href="https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html">Creating categories for real-time transcriptions</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateCallAnalyticsCategory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeCreateCallAnalyticsCategoryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeCreateCallAnalyticsCategoryRequest
 @see AWSTranscribeCreateCallAnalyticsCategoryResponse
 */
- (AWSTask<AWSTranscribeCreateCallAnalyticsCategoryResponse *> *)createCallAnalyticsCategory:(AWSTranscribeCreateCallAnalyticsCategoryRequest *)request;

/**
 <p>Creates a new Call Analytics category.</p><p>All categories are automatically applied to your Call Analytics transcriptions. Note that in order to apply categories to your transcriptions, you must create them before submitting your transcription request, as categories cannot be applied retroactively.</p><p>When creating a new category, you can use the <code>InputType</code> parameter to label the category as a <code>POST_CALL</code> or a <code>REAL_TIME</code> category. <code>POST_CALL</code> categories can only be applied to post-call transcriptions and <code>REAL_TIME</code> categories can only be applied to real-time transcriptions. If you do not include <code>InputType</code>, your category is created as a <code>POST_CALL</code> category by default.</p><p>Call Analytics categories are composed of rules. For each category, you must create between 1 and 20 rules. Rules can include these parameters: , , , and .</p><p>To update an existing category, see .</p><p>To learn more about Call Analytics categories, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html">Creating categories for post-call transcriptions</a> and <a href="https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html">Creating categories for real-time transcriptions</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateCallAnalyticsCategory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeCreateCallAnalyticsCategoryRequest
 @see AWSTranscribeCreateCallAnalyticsCategoryResponse
 */
- (void)createCallAnalyticsCategory:(AWSTranscribeCreateCallAnalyticsCategoryRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeCreateCallAnalyticsCategoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new custom language model.</p><p>When creating a new custom language model, you must specify:</p><ul><li><p>If you want a Wideband (audio sample rates over 16,000 Hz) or Narrowband (audio sample rates under 16,000 Hz) base model</p></li><li><p>The location of your training and tuning files (this must be an Amazon S3 URI)</p></li><li><p>The language of your model</p></li><li><p>A unique name for your model</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateLanguageModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeCreateLanguageModelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeCreateLanguageModelRequest
 @see AWSTranscribeCreateLanguageModelResponse
 */
- (AWSTask<AWSTranscribeCreateLanguageModelResponse *> *)createLanguageModel:(AWSTranscribeCreateLanguageModelRequest *)request;

/**
 <p>Creates a new custom language model.</p><p>When creating a new custom language model, you must specify:</p><ul><li><p>If you want a Wideband (audio sample rates over 16,000 Hz) or Narrowband (audio sample rates under 16,000 Hz) base model</p></li><li><p>The location of your training and tuning files (this must be an Amazon S3 URI)</p></li><li><p>The language of your model</p></li><li><p>A unique name for your model</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateLanguageModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeCreateLanguageModelRequest
 @see AWSTranscribeCreateLanguageModelResponse
 */
- (void)createLanguageModel:(AWSTranscribeCreateLanguageModelRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeCreateLanguageModelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new custom medical vocabulary.</p><p>Before creating a new custom medical vocabulary, you must first upload a text file that contains your vocabulary table into an Amazon S3 bucket. Note that this differs from , where you can include a list of terms within your request using the <code>Phrases</code> flag; <code>CreateMedicalVocabulary</code> does not support the <code>Phrases</code> flag and only accepts vocabularies in table format.</p><p>Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary request fails. Refer to <a href="https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html">Character Sets for Custom Vocabularies</a> to get the character set for your language.</p><p>For more information, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html">Custom vocabularies</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateMedicalVocabulary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeCreateMedicalVocabularyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeCreateMedicalVocabularyRequest
 @see AWSTranscribeCreateMedicalVocabularyResponse
 */
- (AWSTask<AWSTranscribeCreateMedicalVocabularyResponse *> *)createMedicalVocabulary:(AWSTranscribeCreateMedicalVocabularyRequest *)request;

/**
 <p>Creates a new custom medical vocabulary.</p><p>Before creating a new custom medical vocabulary, you must first upload a text file that contains your vocabulary table into an Amazon S3 bucket. Note that this differs from , where you can include a list of terms within your request using the <code>Phrases</code> flag; <code>CreateMedicalVocabulary</code> does not support the <code>Phrases</code> flag and only accepts vocabularies in table format.</p><p>Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary request fails. Refer to <a href="https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html">Character Sets for Custom Vocabularies</a> to get the character set for your language.</p><p>For more information, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html">Custom vocabularies</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateMedicalVocabulary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeCreateMedicalVocabularyRequest
 @see AWSTranscribeCreateMedicalVocabularyResponse
 */
- (void)createMedicalVocabulary:(AWSTranscribeCreateMedicalVocabularyRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeCreateMedicalVocabularyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new custom vocabulary.</p><p>When creating a new custom vocabulary, you can either upload a text file that contains your new entries, phrases, and terms into an Amazon S3 bucket and include the URI in your request. Or you can include a list of terms directly in your request using the <code>Phrases</code> flag.</p><p>Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary request fails. Refer to <a href="https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html">Character Sets for Custom Vocabularies</a> to get the character set for your language.</p><p>For more information, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html">Custom vocabularies</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVocabulary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeCreateVocabularyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeCreateVocabularyRequest
 @see AWSTranscribeCreateVocabularyResponse
 */
- (AWSTask<AWSTranscribeCreateVocabularyResponse *> *)createVocabulary:(AWSTranscribeCreateVocabularyRequest *)request;

/**
 <p>Creates a new custom vocabulary.</p><p>When creating a new custom vocabulary, you can either upload a text file that contains your new entries, phrases, and terms into an Amazon S3 bucket and include the URI in your request. Or you can include a list of terms directly in your request using the <code>Phrases</code> flag.</p><p>Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary request fails. Refer to <a href="https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html">Character Sets for Custom Vocabularies</a> to get the character set for your language.</p><p>For more information, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html">Custom vocabularies</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVocabulary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeCreateVocabularyRequest
 @see AWSTranscribeCreateVocabularyResponse
 */
- (void)createVocabulary:(AWSTranscribeCreateVocabularyRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeCreateVocabularyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new custom vocabulary filter.</p><p>You can use custom vocabulary filters to mask, delete, or flag specific words from your transcript. Custom vocabulary filters are commonly used to mask profanity in transcripts.</p><p>Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary filter request fails. Refer to <a href="https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html">Character Sets for Custom Vocabularies</a> to get the character set for your language.</p><p>For more information, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/vocabulary-filtering.html">Vocabulary filtering</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVocabularyFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeCreateVocabularyFilterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeCreateVocabularyFilterRequest
 @see AWSTranscribeCreateVocabularyFilterResponse
 */
- (AWSTask<AWSTranscribeCreateVocabularyFilterResponse *> *)createVocabularyFilter:(AWSTranscribeCreateVocabularyFilterRequest *)request;

/**
 <p>Creates a new custom vocabulary filter.</p><p>You can use custom vocabulary filters to mask, delete, or flag specific words from your transcript. Custom vocabulary filters are commonly used to mask profanity in transcripts.</p><p>Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary filter request fails. Refer to <a href="https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html">Character Sets for Custom Vocabularies</a> to get the character set for your language.</p><p>For more information, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/vocabulary-filtering.html">Vocabulary filtering</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVocabularyFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeCreateVocabularyFilterRequest
 @see AWSTranscribeCreateVocabularyFilterResponse
 */
- (void)createVocabularyFilter:(AWSTranscribeCreateVocabularyFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeCreateVocabularyFilterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a Call Analytics category. To use this operation, specify the name of the category you want to delete using <code>CategoryName</code>. Category names are case sensitive.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCallAnalyticsCategory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeDeleteCallAnalyticsCategoryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteCallAnalyticsCategoryRequest
 @see AWSTranscribeDeleteCallAnalyticsCategoryResponse
 */
- (AWSTask<AWSTranscribeDeleteCallAnalyticsCategoryResponse *> *)deleteCallAnalyticsCategory:(AWSTranscribeDeleteCallAnalyticsCategoryRequest *)request;

/**
 <p>Deletes a Call Analytics category. To use this operation, specify the name of the category you want to delete using <code>CategoryName</code>. Category names are case sensitive.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCallAnalyticsCategory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteCallAnalyticsCategoryRequest
 @see AWSTranscribeDeleteCallAnalyticsCategoryResponse
 */
- (void)deleteCallAnalyticsCategory:(AWSTranscribeDeleteCallAnalyticsCategoryRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeDeleteCallAnalyticsCategoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a Call Analytics job. To use this operation, specify the name of the job you want to delete using <code>CallAnalyticsJobName</code>. Job names are case sensitive.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCallAnalyticsJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeDeleteCallAnalyticsJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteCallAnalyticsJobRequest
 @see AWSTranscribeDeleteCallAnalyticsJobResponse
 */
- (AWSTask<AWSTranscribeDeleteCallAnalyticsJobResponse *> *)deleteCallAnalyticsJob:(AWSTranscribeDeleteCallAnalyticsJobRequest *)request;

/**
 <p>Deletes a Call Analytics job. To use this operation, specify the name of the job you want to delete using <code>CallAnalyticsJobName</code>. Job names are case sensitive.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCallAnalyticsJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteCallAnalyticsJobRequest
 @see AWSTranscribeDeleteCallAnalyticsJobResponse
 */
- (void)deleteCallAnalyticsJob:(AWSTranscribeDeleteCallAnalyticsJobRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeDeleteCallAnalyticsJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a custom language model. To use this operation, specify the name of the language model you want to delete using <code>ModelName</code>. custom language model names are case sensitive.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLanguageModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteLanguageModelRequest
 */
- (AWSTask *)deleteLanguageModel:(AWSTranscribeDeleteLanguageModelRequest *)request;

/**
 <p>Deletes a custom language model. To use this operation, specify the name of the language model you want to delete using <code>ModelName</code>. custom language model names are case sensitive.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLanguageModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteLanguageModelRequest
 */
- (void)deleteLanguageModel:(AWSTranscribeDeleteLanguageModelRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a Medical Scribe job. To use this operation, specify the name of the job you want to delete using <code>MedicalScribeJobName</code>. Job names are case sensitive.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMedicalScribeJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteMedicalScribeJobRequest
 */
- (AWSTask *)deleteMedicalScribeJob:(AWSTranscribeDeleteMedicalScribeJobRequest *)request;

/**
 <p>Deletes a Medical Scribe job. To use this operation, specify the name of the job you want to delete using <code>MedicalScribeJobName</code>. Job names are case sensitive.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMedicalScribeJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteMedicalScribeJobRequest
 */
- (void)deleteMedicalScribeJob:(AWSTranscribeDeleteMedicalScribeJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a medical transcription job. To use this operation, specify the name of the job you want to delete using <code>MedicalTranscriptionJobName</code>. Job names are case sensitive.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMedicalTranscriptionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteMedicalTranscriptionJobRequest
 */
- (AWSTask *)deleteMedicalTranscriptionJob:(AWSTranscribeDeleteMedicalTranscriptionJobRequest *)request;

/**
 <p>Deletes a medical transcription job. To use this operation, specify the name of the job you want to delete using <code>MedicalTranscriptionJobName</code>. Job names are case sensitive.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMedicalTranscriptionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteMedicalTranscriptionJobRequest
 */
- (void)deleteMedicalTranscriptionJob:(AWSTranscribeDeleteMedicalTranscriptionJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a custom medical vocabulary. To use this operation, specify the name of the custom vocabulary you want to delete using <code>VocabularyName</code>. Custom vocabulary names are case sensitive.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMedicalVocabulary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteMedicalVocabularyRequest
 */
- (AWSTask *)deleteMedicalVocabulary:(AWSTranscribeDeleteMedicalVocabularyRequest *)request;

/**
 <p>Deletes a custom medical vocabulary. To use this operation, specify the name of the custom vocabulary you want to delete using <code>VocabularyName</code>. Custom vocabulary names are case sensitive.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMedicalVocabulary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteMedicalVocabularyRequest
 */
- (void)deleteMedicalVocabulary:(AWSTranscribeDeleteMedicalVocabularyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a transcription job. To use this operation, specify the name of the job you want to delete using <code>TranscriptionJobName</code>. Job names are case sensitive.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTranscriptionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteTranscriptionJobRequest
 */
- (AWSTask *)deleteTranscriptionJob:(AWSTranscribeDeleteTranscriptionJobRequest *)request;

/**
 <p>Deletes a transcription job. To use this operation, specify the name of the job you want to delete using <code>TranscriptionJobName</code>. Job names are case sensitive.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTranscriptionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteTranscriptionJobRequest
 */
- (void)deleteTranscriptionJob:(AWSTranscribeDeleteTranscriptionJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a custom vocabulary. To use this operation, specify the name of the custom vocabulary you want to delete using <code>VocabularyName</code>. Custom vocabulary names are case sensitive.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVocabulary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteVocabularyRequest
 */
- (AWSTask *)deleteVocabulary:(AWSTranscribeDeleteVocabularyRequest *)request;

/**
 <p>Deletes a custom vocabulary. To use this operation, specify the name of the custom vocabulary you want to delete using <code>VocabularyName</code>. Custom vocabulary names are case sensitive.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVocabulary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteVocabularyRequest
 */
- (void)deleteVocabulary:(AWSTranscribeDeleteVocabularyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a custom vocabulary filter. To use this operation, specify the name of the custom vocabulary filter you want to delete using <code>VocabularyFilterName</code>. Custom vocabulary filter names are case sensitive.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVocabularyFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteVocabularyFilterRequest
 */
- (AWSTask *)deleteVocabularyFilter:(AWSTranscribeDeleteVocabularyFilterRequest *)request;

/**
 <p>Deletes a custom vocabulary filter. To use this operation, specify the name of the custom vocabulary filter you want to delete using <code>VocabularyFilterName</code>. Custom vocabulary filter names are case sensitive.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVocabularyFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteVocabularyFilterRequest
 */
- (void)deleteVocabularyFilter:(AWSTranscribeDeleteVocabularyFilterRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about the specified custom language model.</p><p>This operation also shows if the base language model that you used to create your custom language model has been updated. If Amazon Transcribe has updated the base model, you can create a new custom language model using the updated base model.</p><p>If you tried to create a new custom language model and the request wasn't successful, you can use <code>DescribeLanguageModel</code> to help identify the reason for this failure.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLanguageModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeDescribeLanguageModelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`.
 
 @see AWSTranscribeDescribeLanguageModelRequest
 @see AWSTranscribeDescribeLanguageModelResponse
 */
- (AWSTask<AWSTranscribeDescribeLanguageModelResponse *> *)describeLanguageModel:(AWSTranscribeDescribeLanguageModelRequest *)request;

/**
 <p>Provides information about the specified custom language model.</p><p>This operation also shows if the base language model that you used to create your custom language model has been updated. If Amazon Transcribe has updated the base model, you can create a new custom language model using the updated base model.</p><p>If you tried to create a new custom language model and the request wasn't successful, you can use <code>DescribeLanguageModel</code> to help identify the reason for this failure.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLanguageModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`.
 
 @see AWSTranscribeDescribeLanguageModelRequest
 @see AWSTranscribeDescribeLanguageModelResponse
 */
- (void)describeLanguageModel:(AWSTranscribeDescribeLanguageModelRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeDescribeLanguageModelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about the specified Call Analytics category.</p><p>To get a list of your Call Analytics categories, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the GetCallAnalyticsCategory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeGetCallAnalyticsCategoryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorBadRequest`.
 
 @see AWSTranscribeGetCallAnalyticsCategoryRequest
 @see AWSTranscribeGetCallAnalyticsCategoryResponse
 */
- (AWSTask<AWSTranscribeGetCallAnalyticsCategoryResponse *> *)getCallAnalyticsCategory:(AWSTranscribeGetCallAnalyticsCategoryRequest *)request;

/**
 <p>Provides information about the specified Call Analytics category.</p><p>To get a list of your Call Analytics categories, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the GetCallAnalyticsCategory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorBadRequest`.
 
 @see AWSTranscribeGetCallAnalyticsCategoryRequest
 @see AWSTranscribeGetCallAnalyticsCategoryResponse
 */
- (void)getCallAnalyticsCategory:(AWSTranscribeGetCallAnalyticsCategoryRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeGetCallAnalyticsCategoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about the specified Call Analytics job.</p><p>To view the job's status, refer to <code>CallAnalyticsJobStatus</code>. If the status is <code>COMPLETED</code>, the job is finished. You can find your completed transcript at the URI specified in <code>TranscriptFileUri</code>. If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your transcription job failed.</p><p>If you enabled personally identifiable information (PII) redaction, the redacted transcript appears at the location specified in <code>RedactedTranscriptFileUri</code>.</p><p>If you chose to redact the audio in your media file, you can find your redacted media file at the location specified in <code>RedactedMediaFileUri</code>.</p><p>To get a list of your Call Analytics jobs, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the GetCallAnalyticsJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeGetCallAnalyticsJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`.
 
 @see AWSTranscribeGetCallAnalyticsJobRequest
 @see AWSTranscribeGetCallAnalyticsJobResponse
 */
- (AWSTask<AWSTranscribeGetCallAnalyticsJobResponse *> *)getCallAnalyticsJob:(AWSTranscribeGetCallAnalyticsJobRequest *)request;

/**
 <p>Provides information about the specified Call Analytics job.</p><p>To view the job's status, refer to <code>CallAnalyticsJobStatus</code>. If the status is <code>COMPLETED</code>, the job is finished. You can find your completed transcript at the URI specified in <code>TranscriptFileUri</code>. If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your transcription job failed.</p><p>If you enabled personally identifiable information (PII) redaction, the redacted transcript appears at the location specified in <code>RedactedTranscriptFileUri</code>.</p><p>If you chose to redact the audio in your media file, you can find your redacted media file at the location specified in <code>RedactedMediaFileUri</code>.</p><p>To get a list of your Call Analytics jobs, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the GetCallAnalyticsJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`.
 
 @see AWSTranscribeGetCallAnalyticsJobRequest
 @see AWSTranscribeGetCallAnalyticsJobResponse
 */
- (void)getCallAnalyticsJob:(AWSTranscribeGetCallAnalyticsJobRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeGetCallAnalyticsJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about the specified Medical Scribe job.</p><p>To view the status of the specified medical transcription job, check the <code>MedicalScribeJobStatus</code> field. If the status is <code>COMPLETED</code>, the job is finished. You can find the results at the location specified in <code>MedicalScribeOutput</code>. If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your Medical Scribe job failed.</p><p>To get a list of your Medical Scribe jobs, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the GetMedicalScribeJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeGetMedicalScribeJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`.
 
 @see AWSTranscribeGetMedicalScribeJobRequest
 @see AWSTranscribeGetMedicalScribeJobResponse
 */
- (AWSTask<AWSTranscribeGetMedicalScribeJobResponse *> *)getMedicalScribeJob:(AWSTranscribeGetMedicalScribeJobRequest *)request;

/**
 <p>Provides information about the specified Medical Scribe job.</p><p>To view the status of the specified medical transcription job, check the <code>MedicalScribeJobStatus</code> field. If the status is <code>COMPLETED</code>, the job is finished. You can find the results at the location specified in <code>MedicalScribeOutput</code>. If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your Medical Scribe job failed.</p><p>To get a list of your Medical Scribe jobs, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the GetMedicalScribeJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`.
 
 @see AWSTranscribeGetMedicalScribeJobRequest
 @see AWSTranscribeGetMedicalScribeJobResponse
 */
- (void)getMedicalScribeJob:(AWSTranscribeGetMedicalScribeJobRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeGetMedicalScribeJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about the specified medical transcription job.</p><p>To view the status of the specified medical transcription job, check the <code>TranscriptionJobStatus</code> field. If the status is <code>COMPLETED</code>, the job is finished. You can find the results at the location specified in <code>TranscriptFileUri</code>. If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your transcription job failed.</p><p>To get a list of your medical transcription jobs, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the GetMedicalTranscriptionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeGetMedicalTranscriptionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`.
 
 @see AWSTranscribeGetMedicalTranscriptionJobRequest
 @see AWSTranscribeGetMedicalTranscriptionJobResponse
 */
- (AWSTask<AWSTranscribeGetMedicalTranscriptionJobResponse *> *)getMedicalTranscriptionJob:(AWSTranscribeGetMedicalTranscriptionJobRequest *)request;

/**
 <p>Provides information about the specified medical transcription job.</p><p>To view the status of the specified medical transcription job, check the <code>TranscriptionJobStatus</code> field. If the status is <code>COMPLETED</code>, the job is finished. You can find the results at the location specified in <code>TranscriptFileUri</code>. If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your transcription job failed.</p><p>To get a list of your medical transcription jobs, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the GetMedicalTranscriptionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`.
 
 @see AWSTranscribeGetMedicalTranscriptionJobRequest
 @see AWSTranscribeGetMedicalTranscriptionJobResponse
 */
- (void)getMedicalTranscriptionJob:(AWSTranscribeGetMedicalTranscriptionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeGetMedicalTranscriptionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about the specified custom medical vocabulary.</p><p>To view the status of the specified custom medical vocabulary, check the <code>VocabularyState</code> field. If the status is <code>READY</code>, your custom vocabulary is available to use. If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your vocabulary failed.</p><p>To get a list of your custom medical vocabularies, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the GetMedicalVocabulary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeGetMedicalVocabularyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorBadRequest`.
 
 @see AWSTranscribeGetMedicalVocabularyRequest
 @see AWSTranscribeGetMedicalVocabularyResponse
 */
- (AWSTask<AWSTranscribeGetMedicalVocabularyResponse *> *)getMedicalVocabulary:(AWSTranscribeGetMedicalVocabularyRequest *)request;

/**
 <p>Provides information about the specified custom medical vocabulary.</p><p>To view the status of the specified custom medical vocabulary, check the <code>VocabularyState</code> field. If the status is <code>READY</code>, your custom vocabulary is available to use. If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your vocabulary failed.</p><p>To get a list of your custom medical vocabularies, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the GetMedicalVocabulary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorBadRequest`.
 
 @see AWSTranscribeGetMedicalVocabularyRequest
 @see AWSTranscribeGetMedicalVocabularyResponse
 */
- (void)getMedicalVocabulary:(AWSTranscribeGetMedicalVocabularyRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeGetMedicalVocabularyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about the specified transcription job.</p><p>To view the status of the specified transcription job, check the <code>TranscriptionJobStatus</code> field. If the status is <code>COMPLETED</code>, the job is finished. You can find the results at the location specified in <code>TranscriptFileUri</code>. If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your transcription job failed.</p><p>If you enabled content redaction, the redacted transcript can be found at the location specified in <code>RedactedTranscriptFileUri</code>.</p><p>To get a list of your transcription jobs, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the GetTranscriptionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeGetTranscriptionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`.
 
 @see AWSTranscribeGetTranscriptionJobRequest
 @see AWSTranscribeGetTranscriptionJobResponse
 */
- (AWSTask<AWSTranscribeGetTranscriptionJobResponse *> *)getTranscriptionJob:(AWSTranscribeGetTranscriptionJobRequest *)request;

/**
 <p>Provides information about the specified transcription job.</p><p>To view the status of the specified transcription job, check the <code>TranscriptionJobStatus</code> field. If the status is <code>COMPLETED</code>, the job is finished. You can find the results at the location specified in <code>TranscriptFileUri</code>. If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your transcription job failed.</p><p>If you enabled content redaction, the redacted transcript can be found at the location specified in <code>RedactedTranscriptFileUri</code>.</p><p>To get a list of your transcription jobs, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the GetTranscriptionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`.
 
 @see AWSTranscribeGetTranscriptionJobRequest
 @see AWSTranscribeGetTranscriptionJobResponse
 */
- (void)getTranscriptionJob:(AWSTranscribeGetTranscriptionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeGetTranscriptionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about the specified custom vocabulary.</p><p>To view the status of the specified custom vocabulary, check the <code>VocabularyState</code> field. If the status is <code>READY</code>, your custom vocabulary is available to use. If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your custom vocabulary failed.</p><p>To get a list of your custom vocabularies, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the GetVocabulary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeGetVocabularyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorBadRequest`.
 
 @see AWSTranscribeGetVocabularyRequest
 @see AWSTranscribeGetVocabularyResponse
 */
- (AWSTask<AWSTranscribeGetVocabularyResponse *> *)getVocabulary:(AWSTranscribeGetVocabularyRequest *)request;

/**
 <p>Provides information about the specified custom vocabulary.</p><p>To view the status of the specified custom vocabulary, check the <code>VocabularyState</code> field. If the status is <code>READY</code>, your custom vocabulary is available to use. If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your custom vocabulary failed.</p><p>To get a list of your custom vocabularies, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the GetVocabulary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorBadRequest`.
 
 @see AWSTranscribeGetVocabularyRequest
 @see AWSTranscribeGetVocabularyResponse
 */
- (void)getVocabulary:(AWSTranscribeGetVocabularyRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeGetVocabularyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about the specified custom vocabulary filter.</p><p>To get a list of your custom vocabulary filters, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the GetVocabularyFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeGetVocabularyFilterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorBadRequest`.
 
 @see AWSTranscribeGetVocabularyFilterRequest
 @see AWSTranscribeGetVocabularyFilterResponse
 */
- (AWSTask<AWSTranscribeGetVocabularyFilterResponse *> *)getVocabularyFilter:(AWSTranscribeGetVocabularyFilterRequest *)request;

/**
 <p>Provides information about the specified custom vocabulary filter.</p><p>To get a list of your custom vocabulary filters, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the GetVocabularyFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorBadRequest`.
 
 @see AWSTranscribeGetVocabularyFilterRequest
 @see AWSTranscribeGetVocabularyFilterResponse
 */
- (void)getVocabularyFilter:(AWSTranscribeGetVocabularyFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeGetVocabularyFilterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of Call Analytics categories, including all rules that make up each category.</p><p>To get detailed information about a specific Call Analytics category, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the ListCallAnalyticsCategories service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeListCallAnalyticsCategoriesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListCallAnalyticsCategoriesRequest
 @see AWSTranscribeListCallAnalyticsCategoriesResponse
 */
- (AWSTask<AWSTranscribeListCallAnalyticsCategoriesResponse *> *)listCallAnalyticsCategories:(AWSTranscribeListCallAnalyticsCategoriesRequest *)request;

/**
 <p>Provides a list of Call Analytics categories, including all rules that make up each category.</p><p>To get detailed information about a specific Call Analytics category, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the ListCallAnalyticsCategories service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListCallAnalyticsCategoriesRequest
 @see AWSTranscribeListCallAnalyticsCategoriesResponse
 */
- (void)listCallAnalyticsCategories:(AWSTranscribeListCallAnalyticsCategoriesRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeListCallAnalyticsCategoriesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of Call Analytics jobs that match the specified criteria. If no criteria are specified, all Call Analytics jobs are returned.</p><p>To get detailed information about a specific Call Analytics job, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the ListCallAnalyticsJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeListCallAnalyticsJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListCallAnalyticsJobsRequest
 @see AWSTranscribeListCallAnalyticsJobsResponse
 */
- (AWSTask<AWSTranscribeListCallAnalyticsJobsResponse *> *)listCallAnalyticsJobs:(AWSTranscribeListCallAnalyticsJobsRequest *)request;

/**
 <p>Provides a list of Call Analytics jobs that match the specified criteria. If no criteria are specified, all Call Analytics jobs are returned.</p><p>To get detailed information about a specific Call Analytics job, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the ListCallAnalyticsJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListCallAnalyticsJobsRequest
 @see AWSTranscribeListCallAnalyticsJobsResponse
 */
- (void)listCallAnalyticsJobs:(AWSTranscribeListCallAnalyticsJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeListCallAnalyticsJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of custom language models that match the specified criteria. If no criteria are specified, all custom language models are returned.</p><p>To get detailed information about a specific custom language model, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the ListLanguageModels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeListLanguageModelsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListLanguageModelsRequest
 @see AWSTranscribeListLanguageModelsResponse
 */
- (AWSTask<AWSTranscribeListLanguageModelsResponse *> *)listLanguageModels:(AWSTranscribeListLanguageModelsRequest *)request;

/**
 <p>Provides a list of custom language models that match the specified criteria. If no criteria are specified, all custom language models are returned.</p><p>To get detailed information about a specific custom language model, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the ListLanguageModels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListLanguageModelsRequest
 @see AWSTranscribeListLanguageModelsResponse
 */
- (void)listLanguageModels:(AWSTranscribeListLanguageModelsRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeListLanguageModelsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of Medical Scribe jobs that match the specified criteria. If no criteria are specified, all Medical Scribe jobs are returned.</p><p>To get detailed information about a specific Medical Scribe job, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the ListMedicalScribeJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeListMedicalScribeJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListMedicalScribeJobsRequest
 @see AWSTranscribeListMedicalScribeJobsResponse
 */
- (AWSTask<AWSTranscribeListMedicalScribeJobsResponse *> *)listMedicalScribeJobs:(AWSTranscribeListMedicalScribeJobsRequest *)request;

/**
 <p>Provides a list of Medical Scribe jobs that match the specified criteria. If no criteria are specified, all Medical Scribe jobs are returned.</p><p>To get detailed information about a specific Medical Scribe job, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the ListMedicalScribeJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListMedicalScribeJobsRequest
 @see AWSTranscribeListMedicalScribeJobsResponse
 */
- (void)listMedicalScribeJobs:(AWSTranscribeListMedicalScribeJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeListMedicalScribeJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of medical transcription jobs that match the specified criteria. If no criteria are specified, all medical transcription jobs are returned.</p><p>To get detailed information about a specific medical transcription job, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the ListMedicalTranscriptionJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeListMedicalTranscriptionJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListMedicalTranscriptionJobsRequest
 @see AWSTranscribeListMedicalTranscriptionJobsResponse
 */
- (AWSTask<AWSTranscribeListMedicalTranscriptionJobsResponse *> *)listMedicalTranscriptionJobs:(AWSTranscribeListMedicalTranscriptionJobsRequest *)request;

/**
 <p>Provides a list of medical transcription jobs that match the specified criteria. If no criteria are specified, all medical transcription jobs are returned.</p><p>To get detailed information about a specific medical transcription job, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the ListMedicalTranscriptionJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListMedicalTranscriptionJobsRequest
 @see AWSTranscribeListMedicalTranscriptionJobsResponse
 */
- (void)listMedicalTranscriptionJobs:(AWSTranscribeListMedicalTranscriptionJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeListMedicalTranscriptionJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of custom medical vocabularies that match the specified criteria. If no criteria are specified, all custom medical vocabularies are returned.</p><p>To get detailed information about a specific custom medical vocabulary, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the ListMedicalVocabularies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeListMedicalVocabulariesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListMedicalVocabulariesRequest
 @see AWSTranscribeListMedicalVocabulariesResponse
 */
- (AWSTask<AWSTranscribeListMedicalVocabulariesResponse *> *)listMedicalVocabularies:(AWSTranscribeListMedicalVocabulariesRequest *)request;

/**
 <p>Provides a list of custom medical vocabularies that match the specified criteria. If no criteria are specified, all custom medical vocabularies are returned.</p><p>To get detailed information about a specific custom medical vocabulary, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the ListMedicalVocabularies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListMedicalVocabulariesRequest
 @see AWSTranscribeListMedicalVocabulariesResponse
 */
- (void)listMedicalVocabularies:(AWSTranscribeListMedicalVocabulariesRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeListMedicalVocabulariesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all tags associated with the specified transcription job, vocabulary, model, or resource.</p><p>To learn more about using tags with Amazon Transcribe, refer to <a href="https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html">Tagging resources</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListTagsForResourceRequest
 @see AWSTranscribeListTagsForResourceResponse
 */
- (AWSTask<AWSTranscribeListTagsForResourceResponse *> *)listTagsForResource:(AWSTranscribeListTagsForResourceRequest *)request;

/**
 <p>Lists all tags associated with the specified transcription job, vocabulary, model, or resource.</p><p>To learn more about using tags with Amazon Transcribe, refer to <a href="https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html">Tagging resources</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListTagsForResourceRequest
 @see AWSTranscribeListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSTranscribeListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of transcription jobs that match the specified criteria. If no criteria are specified, all transcription jobs are returned.</p><p>To get detailed information about a specific transcription job, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the ListTranscriptionJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeListTranscriptionJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListTranscriptionJobsRequest
 @see AWSTranscribeListTranscriptionJobsResponse
 */
- (AWSTask<AWSTranscribeListTranscriptionJobsResponse *> *)listTranscriptionJobs:(AWSTranscribeListTranscriptionJobsRequest *)request;

/**
 <p>Provides a list of transcription jobs that match the specified criteria. If no criteria are specified, all transcription jobs are returned.</p><p>To get detailed information about a specific transcription job, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the ListTranscriptionJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListTranscriptionJobsRequest
 @see AWSTranscribeListTranscriptionJobsResponse
 */
- (void)listTranscriptionJobs:(AWSTranscribeListTranscriptionJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeListTranscriptionJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of custom vocabularies that match the specified criteria. If no criteria are specified, all custom vocabularies are returned.</p><p>To get detailed information about a specific custom vocabulary, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the ListVocabularies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeListVocabulariesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListVocabulariesRequest
 @see AWSTranscribeListVocabulariesResponse
 */
- (AWSTask<AWSTranscribeListVocabulariesResponse *> *)listVocabularies:(AWSTranscribeListVocabulariesRequest *)request;

/**
 <p>Provides a list of custom vocabularies that match the specified criteria. If no criteria are specified, all custom vocabularies are returned.</p><p>To get detailed information about a specific custom vocabulary, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the ListVocabularies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListVocabulariesRequest
 @see AWSTranscribeListVocabulariesResponse
 */
- (void)listVocabularies:(AWSTranscribeListVocabulariesRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeListVocabulariesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of custom vocabulary filters that match the specified criteria. If no criteria are specified, all custom vocabularies are returned.</p><p>To get detailed information about a specific custom vocabulary filter, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the ListVocabularyFilters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeListVocabularyFiltersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListVocabularyFiltersRequest
 @see AWSTranscribeListVocabularyFiltersResponse
 */
- (AWSTask<AWSTranscribeListVocabularyFiltersResponse *> *)listVocabularyFilters:(AWSTranscribeListVocabularyFiltersRequest *)request;

/**
 <p>Provides a list of custom vocabulary filters that match the specified criteria. If no criteria are specified, all custom vocabularies are returned.</p><p>To get detailed information about a specific custom vocabulary filter, use the operation.</p>
 
 @param request A container for the necessary parameters to execute the ListVocabularyFilters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListVocabularyFiltersRequest
 @see AWSTranscribeListVocabularyFiltersResponse
 */
- (void)listVocabularyFilters:(AWSTranscribeListVocabularyFiltersRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeListVocabularyFiltersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Transcribes the audio from a customer service call and applies any additional Request Parameters you choose to include in your request.</p><p>In addition to many standard transcription features, Call Analytics provides you with call characteristics, call summarization, speaker sentiment, and optional redaction of your text transcript and your audio file. You can also apply custom categories to flag specified conditions. To learn more about these features and insights, refer to <a href="https://docs.aws.amazon.com/transcribe/latest/dg/call-analytics.html">Analyzing call center audio with Call Analytics</a>.</p><p>If you want to apply categories to your Call Analytics job, you must create them before submitting your job request. Categories cannot be retroactively applied to a job. To create a new category, use the operation. To learn more about Call Analytics categories, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html">Creating categories for post-call transcriptions</a> and <a href="https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html">Creating categories for real-time transcriptions</a>.</p><p>To make a <code>StartCallAnalyticsJob</code> request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the <code>Media</code> parameter.</p><p>Note that job queuing is enabled by default for Call Analytics jobs.</p><p>You must include the following parameters in your <code>StartCallAnalyticsJob</code> request:</p><ul><li><p><code>region</code>: The Amazon Web Services Region where you are making your request. For a list of Amazon Web Services Regions supported with Amazon Transcribe, refer to <a href="https://docs.aws.amazon.com/general/latest/gr/transcribe.html">Amazon Transcribe endpoints and quotas</a>.</p></li><li><p><code>CallAnalyticsJobName</code>: A custom name that you create for your transcription job that's unique within your Amazon Web Services account.</p></li><li><p><code>DataAccessRoleArn</code>: The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket that contains your input files.</p></li><li><p><code>Media</code> (<code>MediaFileUri</code> or <code>RedactedMediaFileUri</code>): The Amazon S3 location of your media file.</p></li></ul><note><p>With Call Analytics, you can redact the audio contained in your media file by including <code>RedactedMediaFileUri</code>, instead of <code>MediaFileUri</code>, to specify the location of your input audio. If you choose to redact your audio, you can find your redacted media at the location specified in the <code>RedactedMediaFileUri</code> field of your response.</p></note>
 
 @param request A container for the necessary parameters to execute the StartCallAnalyticsJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeStartCallAnalyticsJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeStartCallAnalyticsJobRequest
 @see AWSTranscribeStartCallAnalyticsJobResponse
 */
- (AWSTask<AWSTranscribeStartCallAnalyticsJobResponse *> *)startCallAnalyticsJob:(AWSTranscribeStartCallAnalyticsJobRequest *)request;

/**
 <p>Transcribes the audio from a customer service call and applies any additional Request Parameters you choose to include in your request.</p><p>In addition to many standard transcription features, Call Analytics provides you with call characteristics, call summarization, speaker sentiment, and optional redaction of your text transcript and your audio file. You can also apply custom categories to flag specified conditions. To learn more about these features and insights, refer to <a href="https://docs.aws.amazon.com/transcribe/latest/dg/call-analytics.html">Analyzing call center audio with Call Analytics</a>.</p><p>If you want to apply categories to your Call Analytics job, you must create them before submitting your job request. Categories cannot be retroactively applied to a job. To create a new category, use the operation. To learn more about Call Analytics categories, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html">Creating categories for post-call transcriptions</a> and <a href="https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html">Creating categories for real-time transcriptions</a>.</p><p>To make a <code>StartCallAnalyticsJob</code> request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the <code>Media</code> parameter.</p><p>Note that job queuing is enabled by default for Call Analytics jobs.</p><p>You must include the following parameters in your <code>StartCallAnalyticsJob</code> request:</p><ul><li><p><code>region</code>: The Amazon Web Services Region where you are making your request. For a list of Amazon Web Services Regions supported with Amazon Transcribe, refer to <a href="https://docs.aws.amazon.com/general/latest/gr/transcribe.html">Amazon Transcribe endpoints and quotas</a>.</p></li><li><p><code>CallAnalyticsJobName</code>: A custom name that you create for your transcription job that's unique within your Amazon Web Services account.</p></li><li><p><code>DataAccessRoleArn</code>: The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket that contains your input files.</p></li><li><p><code>Media</code> (<code>MediaFileUri</code> or <code>RedactedMediaFileUri</code>): The Amazon S3 location of your media file.</p></li></ul><note><p>With Call Analytics, you can redact the audio contained in your media file by including <code>RedactedMediaFileUri</code>, instead of <code>MediaFileUri</code>, to specify the location of your input audio. If you choose to redact your audio, you can find your redacted media at the location specified in the <code>RedactedMediaFileUri</code> field of your response.</p></note>
 
 @param request A container for the necessary parameters to execute the StartCallAnalyticsJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeStartCallAnalyticsJobRequest
 @see AWSTranscribeStartCallAnalyticsJobResponse
 */
- (void)startCallAnalyticsJob:(AWSTranscribeStartCallAnalyticsJobRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeStartCallAnalyticsJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Transcribes patient-clinician conversations and generates clinical notes. </p><p>Amazon Web Services HealthScribe automatically provides rich conversation transcripts, identifies speaker roles, classifies dialogues, extracts medical terms, and generates preliminary clinical notes. To learn more about these features, refer to <a href="https://docs.aws.amazon.com/transcribe/latest/dg/health-scribe.html">Amazon Web Services HealthScribe</a>.</p><p>To make a <code>StartMedicalScribeJob</code> request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the <code>Media</code> parameter.</p><p>You must include the following parameters in your <code>StartMedicalTranscriptionJob</code> request:</p><ul><li><p><code>DataAccessRoleArn</code>: The ARN of an IAM role with the these minimum permissions: read permission on input file Amazon S3 bucket specified in <code>Media</code>, write permission on the Amazon S3 bucket specified in <code>OutputBucketName</code>, and full permissions on the KMS key specified in <code>OutputEncryptionKMSKeyId</code> (if set). The role should also allow <code>transcribe.amazonaws.com</code> to assume it. </p></li><li><p><code>Media</code> (<code>MediaFileUri</code>): The Amazon S3 location of your media file.</p></li><li><p><code>MedicalScribeJobName</code>: A custom name you create for your MedicalScribe job that is unique within your Amazon Web Services account.</p></li><li><p><code>OutputBucketName</code>: The Amazon S3 bucket where you want your output files stored.</p></li><li><p><code>Settings</code>: A <code>MedicalScribeSettings</code> obect that must set exactly one of <code>ShowSpeakerLabels</code> or <code>ChannelIdentification</code> to true. If <code>ShowSpeakerLabels</code> is true, <code>MaxSpeakerLabels</code> must also be set. </p></li><li><p><code>ChannelDefinitions</code>: A <code>MedicalScribeChannelDefinitions</code> array should be set if and only if the <code>ChannelIdentification</code> value of <code>Settings</code> is set to true. </p></li></ul>
 
 @param request A container for the necessary parameters to execute the StartMedicalScribeJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeStartMedicalScribeJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeStartMedicalScribeJobRequest
 @see AWSTranscribeStartMedicalScribeJobResponse
 */
- (AWSTask<AWSTranscribeStartMedicalScribeJobResponse *> *)startMedicalScribeJob:(AWSTranscribeStartMedicalScribeJobRequest *)request;

/**
 <p>Transcribes patient-clinician conversations and generates clinical notes. </p><p>Amazon Web Services HealthScribe automatically provides rich conversation transcripts, identifies speaker roles, classifies dialogues, extracts medical terms, and generates preliminary clinical notes. To learn more about these features, refer to <a href="https://docs.aws.amazon.com/transcribe/latest/dg/health-scribe.html">Amazon Web Services HealthScribe</a>.</p><p>To make a <code>StartMedicalScribeJob</code> request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the <code>Media</code> parameter.</p><p>You must include the following parameters in your <code>StartMedicalTranscriptionJob</code> request:</p><ul><li><p><code>DataAccessRoleArn</code>: The ARN of an IAM role with the these minimum permissions: read permission on input file Amazon S3 bucket specified in <code>Media</code>, write permission on the Amazon S3 bucket specified in <code>OutputBucketName</code>, and full permissions on the KMS key specified in <code>OutputEncryptionKMSKeyId</code> (if set). The role should also allow <code>transcribe.amazonaws.com</code> to assume it. </p></li><li><p><code>Media</code> (<code>MediaFileUri</code>): The Amazon S3 location of your media file.</p></li><li><p><code>MedicalScribeJobName</code>: A custom name you create for your MedicalScribe job that is unique within your Amazon Web Services account.</p></li><li><p><code>OutputBucketName</code>: The Amazon S3 bucket where you want your output files stored.</p></li><li><p><code>Settings</code>: A <code>MedicalScribeSettings</code> obect that must set exactly one of <code>ShowSpeakerLabels</code> or <code>ChannelIdentification</code> to true. If <code>ShowSpeakerLabels</code> is true, <code>MaxSpeakerLabels</code> must also be set. </p></li><li><p><code>ChannelDefinitions</code>: A <code>MedicalScribeChannelDefinitions</code> array should be set if and only if the <code>ChannelIdentification</code> value of <code>Settings</code> is set to true. </p></li></ul>
 
 @param request A container for the necessary parameters to execute the StartMedicalScribeJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeStartMedicalScribeJobRequest
 @see AWSTranscribeStartMedicalScribeJobResponse
 */
- (void)startMedicalScribeJob:(AWSTranscribeStartMedicalScribeJobRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeStartMedicalScribeJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Transcribes the audio from a medical dictation or conversation and applies any additional Request Parameters you choose to include in your request.</p><p>In addition to many standard transcription features, Amazon Transcribe Medical provides you with a robust medical vocabulary and, optionally, content identification, which adds flags to personal health information (PHI). To learn more about these features, refer to <a href="https://docs.aws.amazon.com/transcribe/latest/dg/how-it-works-med.html">How Amazon Transcribe Medical works</a>.</p><p>To make a <code>StartMedicalTranscriptionJob</code> request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the <code>Media</code> parameter.</p><p>You must include the following parameters in your <code>StartMedicalTranscriptionJob</code> request:</p><ul><li><p><code>region</code>: The Amazon Web Services Region where you are making your request. For a list of Amazon Web Services Regions supported with Amazon Transcribe, refer to <a href="https://docs.aws.amazon.com/general/latest/gr/transcribe.html">Amazon Transcribe endpoints and quotas</a>.</p></li><li><p><code>MedicalTranscriptionJobName</code>: A custom name you create for your transcription job that is unique within your Amazon Web Services account.</p></li><li><p><code>Media</code> (<code>MediaFileUri</code>): The Amazon S3 location of your media file.</p></li><li><p><code>LanguageCode</code>: This must be <code>en-US</code>.</p></li><li><p><code>OutputBucketName</code>: The Amazon S3 bucket where you want your transcript stored. If you want your output stored in a sub-folder of this bucket, you must also include <code>OutputKey</code>.</p></li><li><p><code>Specialty</code>: This must be <code>PRIMARYCARE</code>.</p></li><li><p><code>Type</code>: Choose whether your audio is a conversation or a dictation.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the StartMedicalTranscriptionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeStartMedicalTranscriptionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeStartMedicalTranscriptionJobRequest
 @see AWSTranscribeStartMedicalTranscriptionJobResponse
 */
- (AWSTask<AWSTranscribeStartMedicalTranscriptionJobResponse *> *)startMedicalTranscriptionJob:(AWSTranscribeStartMedicalTranscriptionJobRequest *)request;

/**
 <p>Transcribes the audio from a medical dictation or conversation and applies any additional Request Parameters you choose to include in your request.</p><p>In addition to many standard transcription features, Amazon Transcribe Medical provides you with a robust medical vocabulary and, optionally, content identification, which adds flags to personal health information (PHI). To learn more about these features, refer to <a href="https://docs.aws.amazon.com/transcribe/latest/dg/how-it-works-med.html">How Amazon Transcribe Medical works</a>.</p><p>To make a <code>StartMedicalTranscriptionJob</code> request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the <code>Media</code> parameter.</p><p>You must include the following parameters in your <code>StartMedicalTranscriptionJob</code> request:</p><ul><li><p><code>region</code>: The Amazon Web Services Region where you are making your request. For a list of Amazon Web Services Regions supported with Amazon Transcribe, refer to <a href="https://docs.aws.amazon.com/general/latest/gr/transcribe.html">Amazon Transcribe endpoints and quotas</a>.</p></li><li><p><code>MedicalTranscriptionJobName</code>: A custom name you create for your transcription job that is unique within your Amazon Web Services account.</p></li><li><p><code>Media</code> (<code>MediaFileUri</code>): The Amazon S3 location of your media file.</p></li><li><p><code>LanguageCode</code>: This must be <code>en-US</code>.</p></li><li><p><code>OutputBucketName</code>: The Amazon S3 bucket where you want your transcript stored. If you want your output stored in a sub-folder of this bucket, you must also include <code>OutputKey</code>.</p></li><li><p><code>Specialty</code>: This must be <code>PRIMARYCARE</code>.</p></li><li><p><code>Type</code>: Choose whether your audio is a conversation or a dictation.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the StartMedicalTranscriptionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeStartMedicalTranscriptionJobRequest
 @see AWSTranscribeStartMedicalTranscriptionJobResponse
 */
- (void)startMedicalTranscriptionJob:(AWSTranscribeStartMedicalTranscriptionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeStartMedicalTranscriptionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Transcribes the audio from a media file and applies any additional Request Parameters you choose to include in your request.</p><p>To make a <code>StartTranscriptionJob</code> request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the <code>Media</code> parameter.</p><p>You must include the following parameters in your <code>StartTranscriptionJob</code> request:</p><ul><li><p><code>region</code>: The Amazon Web Services Region where you are making your request. For a list of Amazon Web Services Regions supported with Amazon Transcribe, refer to <a href="https://docs.aws.amazon.com/general/latest/gr/transcribe.html">Amazon Transcribe endpoints and quotas</a>.</p></li><li><p><code>TranscriptionJobName</code>: A custom name you create for your transcription job that is unique within your Amazon Web Services account.</p></li><li><p><code>Media</code> (<code>MediaFileUri</code>): The Amazon S3 location of your media file.</p></li><li><p>One of <code>LanguageCode</code>, <code>IdentifyLanguage</code>, or <code>IdentifyMultipleLanguages</code>: If you know the language of your media file, specify it using the <code>LanguageCode</code> parameter; you can find all valid language codes in the <a href="https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html">Supported languages</a> table. If you do not know the languages spoken in your media, use either <code>IdentifyLanguage</code> or <code>IdentifyMultipleLanguages</code> and let Amazon Transcribe identify the languages for you.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the StartTranscriptionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeStartTranscriptionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeStartTranscriptionJobRequest
 @see AWSTranscribeStartTranscriptionJobResponse
 */
- (AWSTask<AWSTranscribeStartTranscriptionJobResponse *> *)startTranscriptionJob:(AWSTranscribeStartTranscriptionJobRequest *)request;

/**
 <p>Transcribes the audio from a media file and applies any additional Request Parameters you choose to include in your request.</p><p>To make a <code>StartTranscriptionJob</code> request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the <code>Media</code> parameter.</p><p>You must include the following parameters in your <code>StartTranscriptionJob</code> request:</p><ul><li><p><code>region</code>: The Amazon Web Services Region where you are making your request. For a list of Amazon Web Services Regions supported with Amazon Transcribe, refer to <a href="https://docs.aws.amazon.com/general/latest/gr/transcribe.html">Amazon Transcribe endpoints and quotas</a>.</p></li><li><p><code>TranscriptionJobName</code>: A custom name you create for your transcription job that is unique within your Amazon Web Services account.</p></li><li><p><code>Media</code> (<code>MediaFileUri</code>): The Amazon S3 location of your media file.</p></li><li><p>One of <code>LanguageCode</code>, <code>IdentifyLanguage</code>, or <code>IdentifyMultipleLanguages</code>: If you know the language of your media file, specify it using the <code>LanguageCode</code> parameter; you can find all valid language codes in the <a href="https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html">Supported languages</a> table. If you do not know the languages spoken in your media, use either <code>IdentifyLanguage</code> or <code>IdentifyMultipleLanguages</code> and let Amazon Transcribe identify the languages for you.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the StartTranscriptionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeStartTranscriptionJobRequest
 @see AWSTranscribeStartTranscriptionJobResponse
 */
- (void)startTranscriptionJob:(AWSTranscribeStartTranscriptionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeStartTranscriptionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds one or more custom tags, each in the form of a key:value pair, to the specified resource.</p><p>To learn more about using tags with Amazon Transcribe, refer to <a href="https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html">Tagging resources</a>.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorConflict`, `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeTagResourceRequest
 @see AWSTranscribeTagResourceResponse
 */
- (AWSTask<AWSTranscribeTagResourceResponse *> *)tagResource:(AWSTranscribeTagResourceRequest *)request;

/**
 <p>Adds one or more custom tags, each in the form of a key:value pair, to the specified resource.</p><p>To learn more about using tags with Amazon Transcribe, refer to <a href="https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html">Tagging resources</a>.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorConflict`, `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeTagResourceRequest
 @see AWSTranscribeTagResourceResponse
 */
- (void)tagResource:(AWSTranscribeTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified tags from the specified Amazon Transcribe resource.</p><p>If you include <code>UntagResource</code> in your request, you must also include <code>ResourceArn</code> and <code>TagKeys</code>.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorConflict`, `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeUntagResourceRequest
 @see AWSTranscribeUntagResourceResponse
 */
- (AWSTask<AWSTranscribeUntagResourceResponse *> *)untagResource:(AWSTranscribeUntagResourceRequest *)request;

/**
 <p>Removes the specified tags from the specified Amazon Transcribe resource.</p><p>If you include <code>UntagResource</code> in your request, you must also include <code>ResourceArn</code> and <code>TagKeys</code>.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorConflict`, `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeUntagResourceRequest
 @see AWSTranscribeUntagResourceResponse
 */
- (void)untagResource:(AWSTranscribeUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified Call Analytics category with new rules. Note that the <code>UpdateCallAnalyticsCategory</code> operation overwrites all existing rules contained in the specified category. You cannot append additional rules onto an existing category.</p><p>To create a new category, see .</p>
 
 @param request A container for the necessary parameters to execute the UpdateCallAnalyticsCategory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeUpdateCallAnalyticsCategoryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeUpdateCallAnalyticsCategoryRequest
 @see AWSTranscribeUpdateCallAnalyticsCategoryResponse
 */
- (AWSTask<AWSTranscribeUpdateCallAnalyticsCategoryResponse *> *)updateCallAnalyticsCategory:(AWSTranscribeUpdateCallAnalyticsCategoryRequest *)request;

/**
 <p>Updates the specified Call Analytics category with new rules. Note that the <code>UpdateCallAnalyticsCategory</code> operation overwrites all existing rules contained in the specified category. You cannot append additional rules onto an existing category.</p><p>To create a new category, see .</p>
 
 @param request A container for the necessary parameters to execute the UpdateCallAnalyticsCategory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeUpdateCallAnalyticsCategoryRequest
 @see AWSTranscribeUpdateCallAnalyticsCategoryResponse
 */
- (void)updateCallAnalyticsCategory:(AWSTranscribeUpdateCallAnalyticsCategoryRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeUpdateCallAnalyticsCategoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing custom medical vocabulary with new values. This operation overwrites all existing information with your new values; you cannot append new terms onto an existing custom vocabulary.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMedicalVocabulary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeUpdateMedicalVocabularyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeUpdateMedicalVocabularyRequest
 @see AWSTranscribeUpdateMedicalVocabularyResponse
 */
- (AWSTask<AWSTranscribeUpdateMedicalVocabularyResponse *> *)updateMedicalVocabulary:(AWSTranscribeUpdateMedicalVocabularyRequest *)request;

/**
 <p>Updates an existing custom medical vocabulary with new values. This operation overwrites all existing information with your new values; you cannot append new terms onto an existing custom vocabulary.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMedicalVocabulary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeUpdateMedicalVocabularyRequest
 @see AWSTranscribeUpdateMedicalVocabularyResponse
 */
- (void)updateMedicalVocabulary:(AWSTranscribeUpdateMedicalVocabularyRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeUpdateMedicalVocabularyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing custom vocabulary with new values. This operation overwrites all existing information with your new values; you cannot append new terms onto an existing custom vocabulary.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVocabulary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeUpdateVocabularyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeUpdateVocabularyRequest
 @see AWSTranscribeUpdateVocabularyResponse
 */
- (AWSTask<AWSTranscribeUpdateVocabularyResponse *> *)updateVocabulary:(AWSTranscribeUpdateVocabularyRequest *)request;

/**
 <p>Updates an existing custom vocabulary with new values. This operation overwrites all existing information with your new values; you cannot append new terms onto an existing custom vocabulary.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVocabulary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeUpdateVocabularyRequest
 @see AWSTranscribeUpdateVocabularyResponse
 */
- (void)updateVocabulary:(AWSTranscribeUpdateVocabularyRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeUpdateVocabularyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing custom vocabulary filter with a new list of words. The new list you provide overwrites all previous entries; you cannot append new terms onto an existing custom vocabulary filter.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVocabularyFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeUpdateVocabularyFilterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`.
 
 @see AWSTranscribeUpdateVocabularyFilterRequest
 @see AWSTranscribeUpdateVocabularyFilterResponse
 */
- (AWSTask<AWSTranscribeUpdateVocabularyFilterResponse *> *)updateVocabularyFilter:(AWSTranscribeUpdateVocabularyFilterRequest *)request;

/**
 <p>Updates an existing custom vocabulary filter with a new list of words. The new list you provide overwrites all previous entries; you cannot append new terms onto an existing custom vocabulary filter.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVocabularyFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`.
 
 @see AWSTranscribeUpdateVocabularyFilterRequest
 @see AWSTranscribeUpdateVocabularyFilterResponse
 */
- (void)updateVocabularyFilter:(AWSTranscribeUpdateVocabularyFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeUpdateVocabularyFilterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
