//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
 <p>Operations and objects for transcribing speech to text.</p>
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
 <p>Creates an analytics category. Amazon Transcribe applies the conditions specified by your analytics categories to your call analytics jobs. For each analytics category, you specify one or more rules. For example, you can specify a rule that the customer sentiment was neutral or negative within that category. If you start a call analytics job, Amazon Transcribe applies the category to the analytics job that you've specified.</p>
 
 @param request A container for the necessary parameters to execute the CreateCallAnalyticsCategory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeCreateCallAnalyticsCategoryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeCreateCallAnalyticsCategoryRequest
 @see AWSTranscribeCreateCallAnalyticsCategoryResponse
 */
- (AWSTask<AWSTranscribeCreateCallAnalyticsCategoryResponse *> *)createCallAnalyticsCategory:(AWSTranscribeCreateCallAnalyticsCategoryRequest *)request;

/**
 <p>Creates an analytics category. Amazon Transcribe applies the conditions specified by your analytics categories to your call analytics jobs. For each analytics category, you specify one or more rules. For example, you can specify a rule that the customer sentiment was neutral or negative within that category. If you start a call analytics job, Amazon Transcribe applies the category to the analytics job that you've specified.</p>
 
 @param request A container for the necessary parameters to execute the CreateCallAnalyticsCategory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeCreateCallAnalyticsCategoryRequest
 @see AWSTranscribeCreateCallAnalyticsCategoryResponse
 */
- (void)createCallAnalyticsCategory:(AWSTranscribeCreateCallAnalyticsCategoryRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeCreateCallAnalyticsCategoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new custom language model. Use Amazon S3 prefixes to provide the location of your input files. The time it takes to create your model depends on the size of your training data.</p>
 
 @param request A container for the necessary parameters to execute the CreateLanguageModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeCreateLanguageModelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeCreateLanguageModelRequest
 @see AWSTranscribeCreateLanguageModelResponse
 */
- (AWSTask<AWSTranscribeCreateLanguageModelResponse *> *)createLanguageModel:(AWSTranscribeCreateLanguageModelRequest *)request;

/**
 <p>Creates a new custom language model. Use Amazon S3 prefixes to provide the location of your input files. The time it takes to create your model depends on the size of your training data.</p>
 
 @param request A container for the necessary parameters to execute the CreateLanguageModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeCreateLanguageModelRequest
 @see AWSTranscribeCreateLanguageModelResponse
 */
- (void)createLanguageModel:(AWSTranscribeCreateLanguageModelRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeCreateLanguageModelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new custom vocabulary that you can use to modify how Amazon Transcribe Medical transcribes your audio file.</p>
 
 @param request A container for the necessary parameters to execute the CreateMedicalVocabulary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeCreateMedicalVocabularyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeCreateMedicalVocabularyRequest
 @see AWSTranscribeCreateMedicalVocabularyResponse
 */
- (AWSTask<AWSTranscribeCreateMedicalVocabularyResponse *> *)createMedicalVocabulary:(AWSTranscribeCreateMedicalVocabularyRequest *)request;

/**
 <p>Creates a new custom vocabulary that you can use to modify how Amazon Transcribe Medical transcribes your audio file.</p>
 
 @param request A container for the necessary parameters to execute the CreateMedicalVocabulary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeCreateMedicalVocabularyRequest
 @see AWSTranscribeCreateMedicalVocabularyResponse
 */
- (void)createMedicalVocabulary:(AWSTranscribeCreateMedicalVocabularyRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeCreateMedicalVocabularyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new custom vocabulary that you can use to change the way Amazon Transcribe handles transcription of an audio file.</p>
 
 @param request A container for the necessary parameters to execute the CreateVocabulary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeCreateVocabularyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeCreateVocabularyRequest
 @see AWSTranscribeCreateVocabularyResponse
 */
- (AWSTask<AWSTranscribeCreateVocabularyResponse *> *)createVocabulary:(AWSTranscribeCreateVocabularyRequest *)request;

/**
 <p>Creates a new custom vocabulary that you can use to change the way Amazon Transcribe handles transcription of an audio file.</p>
 
 @param request A container for the necessary parameters to execute the CreateVocabulary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeCreateVocabularyRequest
 @see AWSTranscribeCreateVocabularyResponse
 */
- (void)createVocabulary:(AWSTranscribeCreateVocabularyRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeCreateVocabularyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new vocabulary filter that you can use to filter words, such as profane words, from the output of a transcription job.</p>
 
 @param request A container for the necessary parameters to execute the CreateVocabularyFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeCreateVocabularyFilterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeCreateVocabularyFilterRequest
 @see AWSTranscribeCreateVocabularyFilterResponse
 */
- (AWSTask<AWSTranscribeCreateVocabularyFilterResponse *> *)createVocabularyFilter:(AWSTranscribeCreateVocabularyFilterRequest *)request;

/**
 <p>Creates a new vocabulary filter that you can use to filter words, such as profane words, from the output of a transcription job.</p>
 
 @param request A container for the necessary parameters to execute the CreateVocabularyFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeCreateVocabularyFilterRequest
 @see AWSTranscribeCreateVocabularyFilterResponse
 */
- (void)createVocabularyFilter:(AWSTranscribeCreateVocabularyFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeCreateVocabularyFilterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a call analytics category using its name.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCallAnalyticsCategory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeDeleteCallAnalyticsCategoryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteCallAnalyticsCategoryRequest
 @see AWSTranscribeDeleteCallAnalyticsCategoryResponse
 */
- (AWSTask<AWSTranscribeDeleteCallAnalyticsCategoryResponse *> *)deleteCallAnalyticsCategory:(AWSTranscribeDeleteCallAnalyticsCategoryRequest *)request;

/**
 <p>Deletes a call analytics category using its name.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCallAnalyticsCategory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteCallAnalyticsCategoryRequest
 @see AWSTranscribeDeleteCallAnalyticsCategoryResponse
 */
- (void)deleteCallAnalyticsCategory:(AWSTranscribeDeleteCallAnalyticsCategoryRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeDeleteCallAnalyticsCategoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a call analytics job using its name.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCallAnalyticsJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeDeleteCallAnalyticsJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteCallAnalyticsJobRequest
 @see AWSTranscribeDeleteCallAnalyticsJobResponse
 */
- (AWSTask<AWSTranscribeDeleteCallAnalyticsJobResponse *> *)deleteCallAnalyticsJob:(AWSTranscribeDeleteCallAnalyticsJobRequest *)request;

/**
 <p>Deletes a call analytics job using its name.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCallAnalyticsJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteCallAnalyticsJobRequest
 @see AWSTranscribeDeleteCallAnalyticsJobResponse
 */
- (void)deleteCallAnalyticsJob:(AWSTranscribeDeleteCallAnalyticsJobRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeDeleteCallAnalyticsJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a custom language model using its name.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLanguageModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteLanguageModelRequest
 */
- (AWSTask *)deleteLanguageModel:(AWSTranscribeDeleteLanguageModelRequest *)request;

/**
 <p>Deletes a custom language model using its name.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLanguageModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteLanguageModelRequest
 */
- (void)deleteLanguageModel:(AWSTranscribeDeleteLanguageModelRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a transcription job generated by Amazon Transcribe Medical and any related information.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMedicalTranscriptionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteMedicalTranscriptionJobRequest
 */
- (AWSTask *)deleteMedicalTranscriptionJob:(AWSTranscribeDeleteMedicalTranscriptionJobRequest *)request;

/**
 <p>Deletes a transcription job generated by Amazon Transcribe Medical and any related information.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMedicalTranscriptionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteMedicalTranscriptionJobRequest
 */
- (void)deleteMedicalTranscriptionJob:(AWSTranscribeDeleteMedicalTranscriptionJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a vocabulary from Amazon Transcribe Medical.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMedicalVocabulary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteMedicalVocabularyRequest
 */
- (AWSTask *)deleteMedicalVocabulary:(AWSTranscribeDeleteMedicalVocabularyRequest *)request;

/**
 <p>Deletes a vocabulary from Amazon Transcribe Medical.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMedicalVocabulary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteMedicalVocabularyRequest
 */
- (void)deleteMedicalVocabulary:(AWSTranscribeDeleteMedicalVocabularyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a previously submitted transcription job along with any other generated results such as the transcription, models, and so on.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTranscriptionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteTranscriptionJobRequest
 */
- (AWSTask *)deleteTranscriptionJob:(AWSTranscribeDeleteTranscriptionJobRequest *)request;

/**
 <p>Deletes a previously submitted transcription job along with any other generated results such as the transcription, models, and so on.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTranscriptionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteTranscriptionJobRequest
 */
- (void)deleteTranscriptionJob:(AWSTranscribeDeleteTranscriptionJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a vocabulary from Amazon Transcribe. </p>
 
 @param request A container for the necessary parameters to execute the DeleteVocabulary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteVocabularyRequest
 */
- (AWSTask *)deleteVocabulary:(AWSTranscribeDeleteVocabularyRequest *)request;

/**
 <p>Deletes a vocabulary from Amazon Transcribe. </p>
 
 @param request A container for the necessary parameters to execute the DeleteVocabulary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteVocabularyRequest
 */
- (void)deleteVocabulary:(AWSTranscribeDeleteVocabularyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes a vocabulary filter.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVocabularyFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteVocabularyFilterRequest
 */
- (AWSTask *)deleteVocabularyFilter:(AWSTranscribeDeleteVocabularyFilterRequest *)request;

/**
 <p>Removes a vocabulary filter.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVocabularyFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeDeleteVocabularyFilterRequest
 */
- (void)deleteVocabularyFilter:(AWSTranscribeDeleteVocabularyFilterRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about a single custom language model. Use this information to see details about the language model in your Amazon Web Services account. You can also see whether the base language model used to create your custom language model has been updated. If Amazon Transcribe has updated the base model, you can create a new custom language model using the updated base model. If the language model wasn't created, you can use this operation to understand why Amazon Transcribe couldn't create it. </p>
 
 @param request A container for the necessary parameters to execute the DescribeLanguageModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeDescribeLanguageModelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`.
 
 @see AWSTranscribeDescribeLanguageModelRequest
 @see AWSTranscribeDescribeLanguageModelResponse
 */
- (AWSTask<AWSTranscribeDescribeLanguageModelResponse *> *)describeLanguageModel:(AWSTranscribeDescribeLanguageModelRequest *)request;

/**
 <p>Gets information about a single custom language model. Use this information to see details about the language model in your Amazon Web Services account. You can also see whether the base language model used to create your custom language model has been updated. If Amazon Transcribe has updated the base model, you can create a new custom language model using the updated base model. If the language model wasn't created, you can use this operation to understand why Amazon Transcribe couldn't create it. </p>
 
 @param request A container for the necessary parameters to execute the DescribeLanguageModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`.
 
 @see AWSTranscribeDescribeLanguageModelRequest
 @see AWSTranscribeDescribeLanguageModelResponse
 */
- (void)describeLanguageModel:(AWSTranscribeDescribeLanguageModelRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeDescribeLanguageModelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a call analytics category.</p>
 
 @param request A container for the necessary parameters to execute the GetCallAnalyticsCategory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeGetCallAnalyticsCategoryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorBadRequest`.
 
 @see AWSTranscribeGetCallAnalyticsCategoryRequest
 @see AWSTranscribeGetCallAnalyticsCategoryResponse
 */
- (AWSTask<AWSTranscribeGetCallAnalyticsCategoryResponse *> *)getCallAnalyticsCategory:(AWSTranscribeGetCallAnalyticsCategoryRequest *)request;

/**
 <p>Retrieves information about a call analytics category.</p>
 
 @param request A container for the necessary parameters to execute the GetCallAnalyticsCategory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorBadRequest`.
 
 @see AWSTranscribeGetCallAnalyticsCategoryRequest
 @see AWSTranscribeGetCallAnalyticsCategoryResponse
 */
- (void)getCallAnalyticsCategory:(AWSTranscribeGetCallAnalyticsCategoryRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeGetCallAnalyticsCategoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a call analytics job. To see the status of the job, check the <code>CallAnalyticsJobStatus</code> field. If the status is <code>COMPLETED</code>, the job is finished and you can find the results at the location specified in the <code>TranscriptFileUri</code> field. If you enable personally identifiable information (PII) redaction, the redacted transcript appears in the <code>RedactedTranscriptFileUri</code> field.</p>
 
 @param request A container for the necessary parameters to execute the GetCallAnalyticsJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeGetCallAnalyticsJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`.
 
 @see AWSTranscribeGetCallAnalyticsJobRequest
 @see AWSTranscribeGetCallAnalyticsJobResponse
 */
- (AWSTask<AWSTranscribeGetCallAnalyticsJobResponse *> *)getCallAnalyticsJob:(AWSTranscribeGetCallAnalyticsJobRequest *)request;

/**
 <p>Returns information about a call analytics job. To see the status of the job, check the <code>CallAnalyticsJobStatus</code> field. If the status is <code>COMPLETED</code>, the job is finished and you can find the results at the location specified in the <code>TranscriptFileUri</code> field. If you enable personally identifiable information (PII) redaction, the redacted transcript appears in the <code>RedactedTranscriptFileUri</code> field.</p>
 
 @param request A container for the necessary parameters to execute the GetCallAnalyticsJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`.
 
 @see AWSTranscribeGetCallAnalyticsJobRequest
 @see AWSTranscribeGetCallAnalyticsJobResponse
 */
- (void)getCallAnalyticsJob:(AWSTranscribeGetCallAnalyticsJobRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeGetCallAnalyticsJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a transcription job from Amazon Transcribe Medical. To see the status of the job, check the <code>TranscriptionJobStatus</code> field. If the status is <code>COMPLETED</code>, the job is finished. You find the results of the completed job in the <code>TranscriptFileUri</code> field.</p>
 
 @param request A container for the necessary parameters to execute the GetMedicalTranscriptionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeGetMedicalTranscriptionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`.
 
 @see AWSTranscribeGetMedicalTranscriptionJobRequest
 @see AWSTranscribeGetMedicalTranscriptionJobResponse
 */
- (AWSTask<AWSTranscribeGetMedicalTranscriptionJobResponse *> *)getMedicalTranscriptionJob:(AWSTranscribeGetMedicalTranscriptionJobRequest *)request;

/**
 <p>Returns information about a transcription job from Amazon Transcribe Medical. To see the status of the job, check the <code>TranscriptionJobStatus</code> field. If the status is <code>COMPLETED</code>, the job is finished. You find the results of the completed job in the <code>TranscriptFileUri</code> field.</p>
 
 @param request A container for the necessary parameters to execute the GetMedicalTranscriptionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`.
 
 @see AWSTranscribeGetMedicalTranscriptionJobRequest
 @see AWSTranscribeGetMedicalTranscriptionJobResponse
 */
- (void)getMedicalTranscriptionJob:(AWSTranscribeGetMedicalTranscriptionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeGetMedicalTranscriptionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a medical vocabulary.</p>
 
 @param request A container for the necessary parameters to execute the GetMedicalVocabulary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeGetMedicalVocabularyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorBadRequest`.
 
 @see AWSTranscribeGetMedicalVocabularyRequest
 @see AWSTranscribeGetMedicalVocabularyResponse
 */
- (AWSTask<AWSTranscribeGetMedicalVocabularyResponse *> *)getMedicalVocabulary:(AWSTranscribeGetMedicalVocabularyRequest *)request;

/**
 <p>Retrieves information about a medical vocabulary.</p>
 
 @param request A container for the necessary parameters to execute the GetMedicalVocabulary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorBadRequest`.
 
 @see AWSTranscribeGetMedicalVocabularyRequest
 @see AWSTranscribeGetMedicalVocabularyResponse
 */
- (void)getMedicalVocabulary:(AWSTranscribeGetMedicalVocabularyRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeGetMedicalVocabularyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a transcription job. To see the status of the job, check the <code>TranscriptionJobStatus</code> field. If the status is <code>COMPLETED</code>, the job is finished and you can find the results at the location specified in the <code>TranscriptFileUri</code> field. If you enable content redaction, the redacted transcript appears in <code>RedactedTranscriptFileUri</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetTranscriptionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeGetTranscriptionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`.
 
 @see AWSTranscribeGetTranscriptionJobRequest
 @see AWSTranscribeGetTranscriptionJobResponse
 */
- (AWSTask<AWSTranscribeGetTranscriptionJobResponse *> *)getTranscriptionJob:(AWSTranscribeGetTranscriptionJobRequest *)request;

/**
 <p>Returns information about a transcription job. To see the status of the job, check the <code>TranscriptionJobStatus</code> field. If the status is <code>COMPLETED</code>, the job is finished and you can find the results at the location specified in the <code>TranscriptFileUri</code> field. If you enable content redaction, the redacted transcript appears in <code>RedactedTranscriptFileUri</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetTranscriptionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`.
 
 @see AWSTranscribeGetTranscriptionJobRequest
 @see AWSTranscribeGetTranscriptionJobResponse
 */
- (void)getTranscriptionJob:(AWSTranscribeGetTranscriptionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeGetTranscriptionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about a vocabulary. </p>
 
 @param request A container for the necessary parameters to execute the GetVocabulary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeGetVocabularyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorBadRequest`.
 
 @see AWSTranscribeGetVocabularyRequest
 @see AWSTranscribeGetVocabularyResponse
 */
- (AWSTask<AWSTranscribeGetVocabularyResponse *> *)getVocabulary:(AWSTranscribeGetVocabularyRequest *)request;

/**
 <p>Gets information about a vocabulary. </p>
 
 @param request A container for the necessary parameters to execute the GetVocabulary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorBadRequest`.
 
 @see AWSTranscribeGetVocabularyRequest
 @see AWSTranscribeGetVocabularyResponse
 */
- (void)getVocabulary:(AWSTranscribeGetVocabularyRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeGetVocabularyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a vocabulary filter.</p>
 
 @param request A container for the necessary parameters to execute the GetVocabularyFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeGetVocabularyFilterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorBadRequest`.
 
 @see AWSTranscribeGetVocabularyFilterRequest
 @see AWSTranscribeGetVocabularyFilterResponse
 */
- (AWSTask<AWSTranscribeGetVocabularyFilterResponse *> *)getVocabularyFilter:(AWSTranscribeGetVocabularyFilterRequest *)request;

/**
 <p>Returns information about a vocabulary filter.</p>
 
 @param request A container for the necessary parameters to execute the GetVocabularyFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorBadRequest`.
 
 @see AWSTranscribeGetVocabularyFilterRequest
 @see AWSTranscribeGetVocabularyFilterResponse
 */
- (void)getVocabularyFilter:(AWSTranscribeGetVocabularyFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeGetVocabularyFilterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides more information about the call analytics categories that you've created. You can use the information in this list to find a specific category. You can then use the operation to get more information about it.</p>
 
 @param request A container for the necessary parameters to execute the ListCallAnalyticsCategories service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeListCallAnalyticsCategoriesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListCallAnalyticsCategoriesRequest
 @see AWSTranscribeListCallAnalyticsCategoriesResponse
 */
- (AWSTask<AWSTranscribeListCallAnalyticsCategoriesResponse *> *)listCallAnalyticsCategories:(AWSTranscribeListCallAnalyticsCategoriesRequest *)request;

/**
 <p>Provides more information about the call analytics categories that you've created. You can use the information in this list to find a specific category. You can then use the operation to get more information about it.</p>
 
 @param request A container for the necessary parameters to execute the ListCallAnalyticsCategories service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListCallAnalyticsCategoriesRequest
 @see AWSTranscribeListCallAnalyticsCategoriesResponse
 */
- (void)listCallAnalyticsCategories:(AWSTranscribeListCallAnalyticsCategoriesRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeListCallAnalyticsCategoriesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List call analytics jobs with a specified status or substring that matches their names.</p>
 
 @param request A container for the necessary parameters to execute the ListCallAnalyticsJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeListCallAnalyticsJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListCallAnalyticsJobsRequest
 @see AWSTranscribeListCallAnalyticsJobsResponse
 */
- (AWSTask<AWSTranscribeListCallAnalyticsJobsResponse *> *)listCallAnalyticsJobs:(AWSTranscribeListCallAnalyticsJobsRequest *)request;

/**
 <p>List call analytics jobs with a specified status or substring that matches their names.</p>
 
 @param request A container for the necessary parameters to execute the ListCallAnalyticsJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListCallAnalyticsJobsRequest
 @see AWSTranscribeListCallAnalyticsJobsResponse
 */
- (void)listCallAnalyticsJobs:(AWSTranscribeListCallAnalyticsJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeListCallAnalyticsJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides more information about the custom language models you've created. You can use the information in this list to find a specific custom language model. You can then use the operation to get more information about it.</p>
 
 @param request A container for the necessary parameters to execute the ListLanguageModels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeListLanguageModelsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListLanguageModelsRequest
 @see AWSTranscribeListLanguageModelsResponse
 */
- (AWSTask<AWSTranscribeListLanguageModelsResponse *> *)listLanguageModels:(AWSTranscribeListLanguageModelsRequest *)request;

/**
 <p>Provides more information about the custom language models you've created. You can use the information in this list to find a specific custom language model. You can then use the operation to get more information about it.</p>
 
 @param request A container for the necessary parameters to execute the ListLanguageModels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListLanguageModelsRequest
 @see AWSTranscribeListLanguageModelsResponse
 */
- (void)listLanguageModels:(AWSTranscribeListLanguageModelsRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeListLanguageModelsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists medical transcription jobs with a specified status or substring that matches their names.</p>
 
 @param request A container for the necessary parameters to execute the ListMedicalTranscriptionJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeListMedicalTranscriptionJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListMedicalTranscriptionJobsRequest
 @see AWSTranscribeListMedicalTranscriptionJobsResponse
 */
- (AWSTask<AWSTranscribeListMedicalTranscriptionJobsResponse *> *)listMedicalTranscriptionJobs:(AWSTranscribeListMedicalTranscriptionJobsRequest *)request;

/**
 <p>Lists medical transcription jobs with a specified status or substring that matches their names.</p>
 
 @param request A container for the necessary parameters to execute the ListMedicalTranscriptionJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListMedicalTranscriptionJobsRequest
 @see AWSTranscribeListMedicalTranscriptionJobsResponse
 */
- (void)listMedicalTranscriptionJobs:(AWSTranscribeListMedicalTranscriptionJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeListMedicalTranscriptionJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of vocabularies that match the specified criteria. If you don't enter a value in any of the request parameters, returns the entire list of vocabularies.</p>
 
 @param request A container for the necessary parameters to execute the ListMedicalVocabularies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeListMedicalVocabulariesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListMedicalVocabulariesRequest
 @see AWSTranscribeListMedicalVocabulariesResponse
 */
- (AWSTask<AWSTranscribeListMedicalVocabulariesResponse *> *)listMedicalVocabularies:(AWSTranscribeListMedicalVocabulariesRequest *)request;

/**
 <p>Returns a list of vocabularies that match the specified criteria. If you don't enter a value in any of the request parameters, returns the entire list of vocabularies.</p>
 
 @param request A container for the necessary parameters to execute the ListMedicalVocabularies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListMedicalVocabulariesRequest
 @see AWSTranscribeListMedicalVocabulariesResponse
 */
- (void)listMedicalVocabularies:(AWSTranscribeListMedicalVocabulariesRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeListMedicalVocabulariesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all tags associated with a given transcription job, vocabulary, or resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListTagsForResourceRequest
 @see AWSTranscribeListTagsForResourceResponse
 */
- (AWSTask<AWSTranscribeListTagsForResourceResponse *> *)listTagsForResource:(AWSTranscribeListTagsForResourceRequest *)request;

/**
 <p>Lists all tags associated with a given transcription job, vocabulary, or resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListTagsForResourceRequest
 @see AWSTranscribeListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSTranscribeListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists transcription jobs with the specified status.</p>
 
 @param request A container for the necessary parameters to execute the ListTranscriptionJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeListTranscriptionJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListTranscriptionJobsRequest
 @see AWSTranscribeListTranscriptionJobsResponse
 */
- (AWSTask<AWSTranscribeListTranscriptionJobsResponse *> *)listTranscriptionJobs:(AWSTranscribeListTranscriptionJobsRequest *)request;

/**
 <p>Lists transcription jobs with the specified status.</p>
 
 @param request A container for the necessary parameters to execute the ListTranscriptionJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListTranscriptionJobsRequest
 @see AWSTranscribeListTranscriptionJobsResponse
 */
- (void)listTranscriptionJobs:(AWSTranscribeListTranscriptionJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeListTranscriptionJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of vocabularies that match the specified criteria. If no criteria are specified, returns the entire list of vocabularies.</p>
 
 @param request A container for the necessary parameters to execute the ListVocabularies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeListVocabulariesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListVocabulariesRequest
 @see AWSTranscribeListVocabulariesResponse
 */
- (AWSTask<AWSTranscribeListVocabulariesResponse *> *)listVocabularies:(AWSTranscribeListVocabulariesRequest *)request;

/**
 <p>Returns a list of vocabularies that match the specified criteria. If no criteria are specified, returns the entire list of vocabularies.</p>
 
 @param request A container for the necessary parameters to execute the ListVocabularies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListVocabulariesRequest
 @see AWSTranscribeListVocabulariesResponse
 */
- (void)listVocabularies:(AWSTranscribeListVocabulariesRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeListVocabulariesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about vocabulary filters.</p>
 
 @param request A container for the necessary parameters to execute the ListVocabularyFilters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeListVocabularyFiltersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListVocabularyFiltersRequest
 @see AWSTranscribeListVocabularyFiltersResponse
 */
- (AWSTask<AWSTranscribeListVocabularyFiltersResponse *> *)listVocabularyFilters:(AWSTranscribeListVocabularyFiltersRequest *)request;

/**
 <p>Gets information about vocabulary filters.</p>
 
 @param request A container for the necessary parameters to execute the ListVocabularyFilters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeListVocabularyFiltersRequest
 @see AWSTranscribeListVocabularyFiltersResponse
 */
- (void)listVocabularyFilters:(AWSTranscribeListVocabularyFiltersRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeListVocabularyFiltersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts an asynchronous analytics job that not only transcribes the audio recording of a caller and agent, but also returns additional insights. These insights include how quickly or loudly the caller or agent was speaking. To retrieve additional insights with your analytics jobs, create categories. A category is a way to classify analytics jobs based on attributes, such as a customer's sentiment or a particular phrase being used during the call. For more information, see the operation. </p>
 
 @param request A container for the necessary parameters to execute the StartCallAnalyticsJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeStartCallAnalyticsJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeStartCallAnalyticsJobRequest
 @see AWSTranscribeStartCallAnalyticsJobResponse
 */
- (AWSTask<AWSTranscribeStartCallAnalyticsJobResponse *> *)startCallAnalyticsJob:(AWSTranscribeStartCallAnalyticsJobRequest *)request;

/**
 <p>Starts an asynchronous analytics job that not only transcribes the audio recording of a caller and agent, but also returns additional insights. These insights include how quickly or loudly the caller or agent was speaking. To retrieve additional insights with your analytics jobs, create categories. A category is a way to classify analytics jobs based on attributes, such as a customer's sentiment or a particular phrase being used during the call. For more information, see the operation. </p>
 
 @param request A container for the necessary parameters to execute the StartCallAnalyticsJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeStartCallAnalyticsJobRequest
 @see AWSTranscribeStartCallAnalyticsJobResponse
 */
- (void)startCallAnalyticsJob:(AWSTranscribeStartCallAnalyticsJobRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeStartCallAnalyticsJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a batch job to transcribe medical speech to text.</p>
 
 @param request A container for the necessary parameters to execute the StartMedicalTranscriptionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeStartMedicalTranscriptionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeStartMedicalTranscriptionJobRequest
 @see AWSTranscribeStartMedicalTranscriptionJobResponse
 */
- (AWSTask<AWSTranscribeStartMedicalTranscriptionJobResponse *> *)startMedicalTranscriptionJob:(AWSTranscribeStartMedicalTranscriptionJobRequest *)request;

/**
 <p>Starts a batch job to transcribe medical speech to text.</p>
 
 @param request A container for the necessary parameters to execute the StartMedicalTranscriptionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeStartMedicalTranscriptionJobRequest
 @see AWSTranscribeStartMedicalTranscriptionJobResponse
 */
- (void)startMedicalTranscriptionJob:(AWSTranscribeStartMedicalTranscriptionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeStartMedicalTranscriptionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts an asynchronous job to transcribe speech to text.</p>
 
 @param request A container for the necessary parameters to execute the StartTranscriptionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeStartTranscriptionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeStartTranscriptionJobRequest
 @see AWSTranscribeStartTranscriptionJobResponse
 */
- (AWSTask<AWSTranscribeStartTranscriptionJobResponse *> *)startTranscriptionJob:(AWSTranscribeStartTranscriptionJobRequest *)request;

/**
 <p>Starts an asynchronous job to transcribe speech to text.</p>
 
 @param request A container for the necessary parameters to execute the StartTranscriptionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeStartTranscriptionJobRequest
 @see AWSTranscribeStartTranscriptionJobResponse
 */
- (void)startTranscriptionJob:(AWSTranscribeStartTranscriptionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeStartTranscriptionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Tags an Amazon Transcribe resource with the given list of tags.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorConflict`, `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeTagResourceRequest
 @see AWSTranscribeTagResourceResponse
 */
- (AWSTask<AWSTranscribeTagResourceResponse *> *)tagResource:(AWSTranscribeTagResourceRequest *)request;

/**
 <p>Tags an Amazon Transcribe resource with the given list of tags.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorConflict`, `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeTagResourceRequest
 @see AWSTranscribeTagResourceResponse
 */
- (void)tagResource:(AWSTranscribeTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes specified tags from a specified Amazon Transcribe resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorConflict`, `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeUntagResourceRequest
 @see AWSTranscribeUntagResourceResponse
 */
- (AWSTask<AWSTranscribeUntagResourceResponse *> *)untagResource:(AWSTranscribeUntagResourceRequest *)request;

/**
 <p>Removes specified tags from a specified Amazon Transcribe resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorConflict`, `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorInternalFailure`.
 
 @see AWSTranscribeUntagResourceRequest
 @see AWSTranscribeUntagResourceResponse
 */
- (void)untagResource:(AWSTranscribeUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the call analytics category with new values. The <code>UpdateCallAnalyticsCategory</code> operation overwrites all of the existing information with the values that you provide in the request. </p>
 
 @param request A container for the necessary parameters to execute the UpdateCallAnalyticsCategory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeUpdateCallAnalyticsCategoryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeUpdateCallAnalyticsCategoryRequest
 @see AWSTranscribeUpdateCallAnalyticsCategoryResponse
 */
- (AWSTask<AWSTranscribeUpdateCallAnalyticsCategoryResponse *> *)updateCallAnalyticsCategory:(AWSTranscribeUpdateCallAnalyticsCategoryRequest *)request;

/**
 <p>Updates the call analytics category with new values. The <code>UpdateCallAnalyticsCategory</code> operation overwrites all of the existing information with the values that you provide in the request. </p>
 
 @param request A container for the necessary parameters to execute the UpdateCallAnalyticsCategory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeUpdateCallAnalyticsCategoryRequest
 @see AWSTranscribeUpdateCallAnalyticsCategoryResponse
 */
- (void)updateCallAnalyticsCategory:(AWSTranscribeUpdateCallAnalyticsCategoryRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeUpdateCallAnalyticsCategoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a vocabulary with new values that you provide in a different text file from the one you used to create the vocabulary. The <code>UpdateMedicalVocabulary</code> operation overwrites all of the existing information with the values that you provide in the request.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMedicalVocabulary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeUpdateMedicalVocabularyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeUpdateMedicalVocabularyRequest
 @see AWSTranscribeUpdateMedicalVocabularyResponse
 */
- (AWSTask<AWSTranscribeUpdateMedicalVocabularyResponse *> *)updateMedicalVocabulary:(AWSTranscribeUpdateMedicalVocabularyRequest *)request;

/**
 <p>Updates a vocabulary with new values that you provide in a different text file from the one you used to create the vocabulary. The <code>UpdateMedicalVocabulary</code> operation overwrites all of the existing information with the values that you provide in the request.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMedicalVocabulary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeUpdateMedicalVocabularyRequest
 @see AWSTranscribeUpdateMedicalVocabularyResponse
 */
- (void)updateMedicalVocabulary:(AWSTranscribeUpdateMedicalVocabularyRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeUpdateMedicalVocabularyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing vocabulary with new values. The <code>UpdateVocabulary</code> operation overwrites all of the existing information with the values that you provide in the request. </p>
 
 @param request A container for the necessary parameters to execute the UpdateVocabulary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeUpdateVocabularyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeUpdateVocabularyRequest
 @see AWSTranscribeUpdateVocabularyResponse
 */
- (AWSTask<AWSTranscribeUpdateVocabularyResponse *> *)updateVocabulary:(AWSTranscribeUpdateVocabularyRequest *)request;

/**
 <p>Updates an existing vocabulary with new values. The <code>UpdateVocabulary</code> operation overwrites all of the existing information with the values that you provide in the request. </p>
 
 @param request A container for the necessary parameters to execute the UpdateVocabulary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`, `AWSTranscribeErrorConflict`.
 
 @see AWSTranscribeUpdateVocabularyRequest
 @see AWSTranscribeUpdateVocabularyResponse
 */
- (void)updateVocabulary:(AWSTranscribeUpdateVocabularyRequest *)request completionHandler:(void (^ _Nullable)(AWSTranscribeUpdateVocabularyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a vocabulary filter with a new list of filtered words.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVocabularyFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranscribeUpdateVocabularyFilterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranscribeErrorDomain` domain and the following error code: `AWSTranscribeErrorBadRequest`, `AWSTranscribeErrorLimitExceeded`, `AWSTranscribeErrorInternalFailure`, `AWSTranscribeErrorNotFound`.
 
 @see AWSTranscribeUpdateVocabularyFilterRequest
 @see AWSTranscribeUpdateVocabularyFilterResponse
 */
- (AWSTask<AWSTranscribeUpdateVocabularyFilterResponse *> *)updateVocabularyFilter:(AWSTranscribeUpdateVocabularyFilterRequest *)request;

/**
 <p>Updates a vocabulary filter with a new list of filtered words.</p>
 
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
