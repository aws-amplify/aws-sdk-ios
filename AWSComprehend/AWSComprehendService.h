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
#import "AWSComprehendModel.h"
#import "AWSComprehendResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSComprehend
FOUNDATION_EXPORT NSString *const AWSComprehendSDKVersion;

/**
 <p>Amazon Comprehend is an AWS service for gaining insight into the content of documents. Use these actions to determine the topics contained in your documents, the topics they discuss, the predominant sentiment expressed in them, the predominant language used, and more.</p>
 */
@interface AWSComprehend : AWSService

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

     let Comprehend = AWSComprehend.default()

 *Objective-C*

     AWSComprehend *Comprehend = [AWSComprehend defaultComprehend];

 @return The default service client.
 */
+ (instancetype)defaultComprehend;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSComprehend.register(with: configuration!, forKey: "USWest2Comprehend")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSComprehend registerComprehendWithConfiguration:configuration forKey:@"USWest2Comprehend"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Comprehend = AWSComprehend(forKey: "USWest2Comprehend")

 *Objective-C*

     AWSComprehend *Comprehend = [AWSComprehend ComprehendForKey:@"USWest2Comprehend"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerComprehendWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerComprehendWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSComprehend.register(with: configuration!, forKey: "USWest2Comprehend")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSComprehend registerComprehendWithConfiguration:configuration forKey:@"USWest2Comprehend"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Comprehend = AWSComprehend(forKey: "USWest2Comprehend")

 *Objective-C*

     AWSComprehend *Comprehend = [AWSComprehend ComprehendForKey:@"USWest2Comprehend"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)ComprehendForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeComprehendForKey:(NSString *)key;

/**
 <p>Determines the dominant language of the input text for a batch of documents. For a list of languages that Amazon Comprehend can detect, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html">Amazon Comprehend Supported Languages</a>. </p>
 
 @param request A container for the necessary parameters to execute the BatchDetectDominantLanguage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendBatchDetectDominantLanguageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorBatchSizeLimitExceeded`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendBatchDetectDominantLanguageRequest
 @see AWSComprehendBatchDetectDominantLanguageResponse
 */
- (AWSTask<AWSComprehendBatchDetectDominantLanguageResponse *> *)batchDetectDominantLanguage:(AWSComprehendBatchDetectDominantLanguageRequest *)request;

/**
 <p>Determines the dominant language of the input text for a batch of documents. For a list of languages that Amazon Comprehend can detect, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html">Amazon Comprehend Supported Languages</a>. </p>
 
 @param request A container for the necessary parameters to execute the BatchDetectDominantLanguage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorBatchSizeLimitExceeded`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendBatchDetectDominantLanguageRequest
 @see AWSComprehendBatchDetectDominantLanguageResponse
 */
- (void)batchDetectDominantLanguage:(AWSComprehendBatchDetectDominantLanguageRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendBatchDetectDominantLanguageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Inspects the text of a batch of documents for named entities and returns information about them. For more information about named entities, see <a>how-entities</a></p>
 
 @param request A container for the necessary parameters to execute the BatchDetectEntities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendBatchDetectEntitiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorUnsupportedLanguage`, `AWSComprehendErrorBatchSizeLimitExceeded`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendBatchDetectEntitiesRequest
 @see AWSComprehendBatchDetectEntitiesResponse
 */
- (AWSTask<AWSComprehendBatchDetectEntitiesResponse *> *)batchDetectEntities:(AWSComprehendBatchDetectEntitiesRequest *)request;

/**
 <p>Inspects the text of a batch of documents for named entities and returns information about them. For more information about named entities, see <a>how-entities</a></p>
 
 @param request A container for the necessary parameters to execute the BatchDetectEntities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorUnsupportedLanguage`, `AWSComprehendErrorBatchSizeLimitExceeded`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendBatchDetectEntitiesRequest
 @see AWSComprehendBatchDetectEntitiesResponse
 */
- (void)batchDetectEntities:(AWSComprehendBatchDetectEntitiesRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendBatchDetectEntitiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detects the key noun phrases found in a batch of documents.</p>
 
 @param request A container for the necessary parameters to execute the BatchDetectKeyPhrases service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendBatchDetectKeyPhrasesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorUnsupportedLanguage`, `AWSComprehendErrorBatchSizeLimitExceeded`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendBatchDetectKeyPhrasesRequest
 @see AWSComprehendBatchDetectKeyPhrasesResponse
 */
- (AWSTask<AWSComprehendBatchDetectKeyPhrasesResponse *> *)batchDetectKeyPhrases:(AWSComprehendBatchDetectKeyPhrasesRequest *)request;

/**
 <p>Detects the key noun phrases found in a batch of documents.</p>
 
 @param request A container for the necessary parameters to execute the BatchDetectKeyPhrases service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorUnsupportedLanguage`, `AWSComprehendErrorBatchSizeLimitExceeded`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendBatchDetectKeyPhrasesRequest
 @see AWSComprehendBatchDetectKeyPhrasesResponse
 */
- (void)batchDetectKeyPhrases:(AWSComprehendBatchDetectKeyPhrasesRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendBatchDetectKeyPhrasesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Inspects a batch of documents and returns an inference of the prevailing sentiment, <code>POSITIVE</code>, <code>NEUTRAL</code>, <code>MIXED</code>, or <code>NEGATIVE</code>, in each one.</p>
 
 @param request A container for the necessary parameters to execute the BatchDetectSentiment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendBatchDetectSentimentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorUnsupportedLanguage`, `AWSComprehendErrorBatchSizeLimitExceeded`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendBatchDetectSentimentRequest
 @see AWSComprehendBatchDetectSentimentResponse
 */
- (AWSTask<AWSComprehendBatchDetectSentimentResponse *> *)batchDetectSentiment:(AWSComprehendBatchDetectSentimentRequest *)request;

/**
 <p>Inspects a batch of documents and returns an inference of the prevailing sentiment, <code>POSITIVE</code>, <code>NEUTRAL</code>, <code>MIXED</code>, or <code>NEGATIVE</code>, in each one.</p>
 
 @param request A container for the necessary parameters to execute the BatchDetectSentiment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorUnsupportedLanguage`, `AWSComprehendErrorBatchSizeLimitExceeded`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendBatchDetectSentimentRequest
 @see AWSComprehendBatchDetectSentimentResponse
 */
- (void)batchDetectSentiment:(AWSComprehendBatchDetectSentimentRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendBatchDetectSentimentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Inspects the text of a batch of documents for the syntax and part of speech of the words in the document and returns information about them. For more information, see <a>how-syntax</a>.</p>
 
 @param request A container for the necessary parameters to execute the BatchDetectSyntax service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendBatchDetectSyntaxResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorUnsupportedLanguage`, `AWSComprehendErrorBatchSizeLimitExceeded`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendBatchDetectSyntaxRequest
 @see AWSComprehendBatchDetectSyntaxResponse
 */
- (AWSTask<AWSComprehendBatchDetectSyntaxResponse *> *)batchDetectSyntax:(AWSComprehendBatchDetectSyntaxRequest *)request;

/**
 <p>Inspects the text of a batch of documents for the syntax and part of speech of the words in the document and returns information about them. For more information, see <a>how-syntax</a>.</p>
 
 @param request A container for the necessary parameters to execute the BatchDetectSyntax service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorUnsupportedLanguage`, `AWSComprehendErrorBatchSizeLimitExceeded`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendBatchDetectSyntaxRequest
 @see AWSComprehendBatchDetectSyntaxResponse
 */
- (void)batchDetectSyntax:(AWSComprehendBatchDetectSyntaxRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendBatchDetectSyntaxResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new document classification request to analyze a single document in real-time, using a previously created and trained custom model and an endpoint.</p>
 
 @param request A container for the necessary parameters to execute the ClassifyDocument service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendClassifyDocumentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorResourceUnavailable`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendClassifyDocumentRequest
 @see AWSComprehendClassifyDocumentResponse
 */
- (AWSTask<AWSComprehendClassifyDocumentResponse *> *)classifyDocument:(AWSComprehendClassifyDocumentRequest *)request;

/**
 <p>Creates a new document classification request to analyze a single document in real-time, using a previously created and trained custom model and an endpoint.</p>
 
 @param request A container for the necessary parameters to execute the ClassifyDocument service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorResourceUnavailable`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendClassifyDocumentRequest
 @see AWSComprehendClassifyDocumentResponse
 */
- (void)classifyDocument:(AWSComprehendClassifyDocumentRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendClassifyDocumentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new document classifier that you can use to categorize documents. To create a classifier you provide a set of training documents that labeled with the categories that you want to use. After the classifier is trained you can use it to categorize a set of labeled documents into the categories. For more information, see <a>how-document-classification</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDocumentClassifier service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendCreateDocumentClassifierResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorResourceInUse`, `AWSComprehendErrorTooManyTags`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorResourceLimitExceeded`, `AWSComprehendErrorUnsupportedLanguage`, `AWSComprehendErrorKmsKeyValidation`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendCreateDocumentClassifierRequest
 @see AWSComprehendCreateDocumentClassifierResponse
 */
- (AWSTask<AWSComprehendCreateDocumentClassifierResponse *> *)createDocumentClassifier:(AWSComprehendCreateDocumentClassifierRequest *)request;

/**
 <p>Creates a new document classifier that you can use to categorize documents. To create a classifier you provide a set of training documents that labeled with the categories that you want to use. After the classifier is trained you can use it to categorize a set of labeled documents into the categories. For more information, see <a>how-document-classification</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDocumentClassifier service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorResourceInUse`, `AWSComprehendErrorTooManyTags`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorResourceLimitExceeded`, `AWSComprehendErrorUnsupportedLanguage`, `AWSComprehendErrorKmsKeyValidation`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendCreateDocumentClassifierRequest
 @see AWSComprehendCreateDocumentClassifierResponse
 */
- (void)createDocumentClassifier:(AWSComprehendCreateDocumentClassifierRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendCreateDocumentClassifierResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a model-specific endpoint for synchronous inference for a previously trained custom model </p>
 
 @param request A container for the necessary parameters to execute the CreateEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendCreateEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorResourceInUse`, `AWSComprehendErrorResourceLimitExceeded`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorResourceUnavailable`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorTooManyTags`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendCreateEndpointRequest
 @see AWSComprehendCreateEndpointResponse
 */
- (AWSTask<AWSComprehendCreateEndpointResponse *> *)createEndpoint:(AWSComprehendCreateEndpointRequest *)request;

/**
 <p>Creates a model-specific endpoint for synchronous inference for a previously trained custom model </p>
 
 @param request A container for the necessary parameters to execute the CreateEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorResourceInUse`, `AWSComprehendErrorResourceLimitExceeded`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorResourceUnavailable`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorTooManyTags`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendCreateEndpointRequest
 @see AWSComprehendCreateEndpointResponse
 */
- (void)createEndpoint:(AWSComprehendCreateEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendCreateEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an entity recognizer using submitted files. After your <code>CreateEntityRecognizer</code> request is submitted, you can check job status using the API. </p>
 
 @param request A container for the necessary parameters to execute the CreateEntityRecognizer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendCreateEntityRecognizerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorResourceInUse`, `AWSComprehendErrorTooManyTags`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorResourceLimitExceeded`, `AWSComprehendErrorUnsupportedLanguage`, `AWSComprehendErrorKmsKeyValidation`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendCreateEntityRecognizerRequest
 @see AWSComprehendCreateEntityRecognizerResponse
 */
- (AWSTask<AWSComprehendCreateEntityRecognizerResponse *> *)createEntityRecognizer:(AWSComprehendCreateEntityRecognizerRequest *)request;

/**
 <p>Creates an entity recognizer using submitted files. After your <code>CreateEntityRecognizer</code> request is submitted, you can check job status using the API. </p>
 
 @param request A container for the necessary parameters to execute the CreateEntityRecognizer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorResourceInUse`, `AWSComprehendErrorTooManyTags`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorResourceLimitExceeded`, `AWSComprehendErrorUnsupportedLanguage`, `AWSComprehendErrorKmsKeyValidation`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendCreateEntityRecognizerRequest
 @see AWSComprehendCreateEntityRecognizerResponse
 */
- (void)createEntityRecognizer:(AWSComprehendCreateEntityRecognizerRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendCreateEntityRecognizerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a previously created document classifier</p><p>Only those classifiers that are in terminated states (IN_ERROR, TRAINED) will be deleted. If an active inference job is using the model, a <code>ResourceInUseException</code> will be returned.</p><p>This is an asynchronous action that puts the classifier into a DELETING state, and it is then removed by a background job. Once removed, the classifier disappears from your account and is no longer available for use. </p>
 
 @param request A container for the necessary parameters to execute the DeleteDocumentClassifier service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendDeleteDocumentClassifierResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorResourceUnavailable`, `AWSComprehendErrorResourceInUse`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDeleteDocumentClassifierRequest
 @see AWSComprehendDeleteDocumentClassifierResponse
 */
- (AWSTask<AWSComprehendDeleteDocumentClassifierResponse *> *)deleteDocumentClassifier:(AWSComprehendDeleteDocumentClassifierRequest *)request;

/**
 <p>Deletes a previously created document classifier</p><p>Only those classifiers that are in terminated states (IN_ERROR, TRAINED) will be deleted. If an active inference job is using the model, a <code>ResourceInUseException</code> will be returned.</p><p>This is an asynchronous action that puts the classifier into a DELETING state, and it is then removed by a background job. Once removed, the classifier disappears from your account and is no longer available for use. </p>
 
 @param request A container for the necessary parameters to execute the DeleteDocumentClassifier service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorResourceUnavailable`, `AWSComprehendErrorResourceInUse`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDeleteDocumentClassifierRequest
 @see AWSComprehendDeleteDocumentClassifierResponse
 */
- (void)deleteDocumentClassifier:(AWSComprehendDeleteDocumentClassifierRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendDeleteDocumentClassifierResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a model-specific endpoint for a previously-trained custom model. All endpoints must be deleted in order for the model to be deleted.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendDeleteEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorResourceInUse`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDeleteEndpointRequest
 @see AWSComprehendDeleteEndpointResponse
 */
- (AWSTask<AWSComprehendDeleteEndpointResponse *> *)deleteEndpoint:(AWSComprehendDeleteEndpointRequest *)request;

/**
 <p>Deletes a model-specific endpoint for a previously-trained custom model. All endpoints must be deleted in order for the model to be deleted.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorResourceInUse`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDeleteEndpointRequest
 @see AWSComprehendDeleteEndpointResponse
 */
- (void)deleteEndpoint:(AWSComprehendDeleteEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendDeleteEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an entity recognizer.</p><p>Only those recognizers that are in terminated states (IN_ERROR, TRAINED) will be deleted. If an active inference job is using the model, a <code>ResourceInUseException</code> will be returned.</p><p>This is an asynchronous action that puts the recognizer into a DELETING state, and it is then removed by a background job. Once removed, the recognizer disappears from your account and is no longer available for use. </p>
 
 @param request A container for the necessary parameters to execute the DeleteEntityRecognizer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendDeleteEntityRecognizerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorResourceUnavailable`, `AWSComprehendErrorResourceInUse`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDeleteEntityRecognizerRequest
 @see AWSComprehendDeleteEntityRecognizerResponse
 */
- (AWSTask<AWSComprehendDeleteEntityRecognizerResponse *> *)deleteEntityRecognizer:(AWSComprehendDeleteEntityRecognizerRequest *)request;

/**
 <p>Deletes an entity recognizer.</p><p>Only those recognizers that are in terminated states (IN_ERROR, TRAINED) will be deleted. If an active inference job is using the model, a <code>ResourceInUseException</code> will be returned.</p><p>This is an asynchronous action that puts the recognizer into a DELETING state, and it is then removed by a background job. Once removed, the recognizer disappears from your account and is no longer available for use. </p>
 
 @param request A container for the necessary parameters to execute the DeleteEntityRecognizer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorResourceUnavailable`, `AWSComprehendErrorResourceInUse`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDeleteEntityRecognizerRequest
 @see AWSComprehendDeleteEntityRecognizerResponse
 */
- (void)deleteEntityRecognizer:(AWSComprehendDeleteEntityRecognizerRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendDeleteEntityRecognizerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the properties associated with a document classification job. Use this operation to get the status of a classification job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDocumentClassificationJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendDescribeDocumentClassificationJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorJobNotFound`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDescribeDocumentClassificationJobRequest
 @see AWSComprehendDescribeDocumentClassificationJobResponse
 */
- (AWSTask<AWSComprehendDescribeDocumentClassificationJobResponse *> *)describeDocumentClassificationJob:(AWSComprehendDescribeDocumentClassificationJobRequest *)request;

/**
 <p>Gets the properties associated with a document classification job. Use this operation to get the status of a classification job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDocumentClassificationJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorJobNotFound`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDescribeDocumentClassificationJobRequest
 @see AWSComprehendDescribeDocumentClassificationJobResponse
 */
- (void)describeDocumentClassificationJob:(AWSComprehendDescribeDocumentClassificationJobRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendDescribeDocumentClassificationJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the properties associated with a document classifier.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDocumentClassifier service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendDescribeDocumentClassifierResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDescribeDocumentClassifierRequest
 @see AWSComprehendDescribeDocumentClassifierResponse
 */
- (AWSTask<AWSComprehendDescribeDocumentClassifierResponse *> *)describeDocumentClassifier:(AWSComprehendDescribeDocumentClassifierRequest *)request;

/**
 <p>Gets the properties associated with a document classifier.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDocumentClassifier service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDescribeDocumentClassifierRequest
 @see AWSComprehendDescribeDocumentClassifierResponse
 */
- (void)describeDocumentClassifier:(AWSComprehendDescribeDocumentClassifierRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendDescribeDocumentClassifierResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the properties associated with a dominant language detection job. Use this operation to get the status of a detection job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDominantLanguageDetectionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendDescribeDominantLanguageDetectionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorJobNotFound`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDescribeDominantLanguageDetectionJobRequest
 @see AWSComprehendDescribeDominantLanguageDetectionJobResponse
 */
- (AWSTask<AWSComprehendDescribeDominantLanguageDetectionJobResponse *> *)describeDominantLanguageDetectionJob:(AWSComprehendDescribeDominantLanguageDetectionJobRequest *)request;

/**
 <p>Gets the properties associated with a dominant language detection job. Use this operation to get the status of a detection job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDominantLanguageDetectionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorJobNotFound`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDescribeDominantLanguageDetectionJobRequest
 @see AWSComprehendDescribeDominantLanguageDetectionJobResponse
 */
- (void)describeDominantLanguageDetectionJob:(AWSComprehendDescribeDominantLanguageDetectionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendDescribeDominantLanguageDetectionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the properties associated with a specific endpoint. Use this operation to get the status of an endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendDescribeEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDescribeEndpointRequest
 @see AWSComprehendDescribeEndpointResponse
 */
- (AWSTask<AWSComprehendDescribeEndpointResponse *> *)describeEndpoint:(AWSComprehendDescribeEndpointRequest *)request;

/**
 <p>Gets the properties associated with a specific endpoint. Use this operation to get the status of an endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDescribeEndpointRequest
 @see AWSComprehendDescribeEndpointResponse
 */
- (void)describeEndpoint:(AWSComprehendDescribeEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendDescribeEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the properties associated with an entities detection job. Use this operation to get the status of a detection job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEntitiesDetectionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendDescribeEntitiesDetectionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorJobNotFound`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDescribeEntitiesDetectionJobRequest
 @see AWSComprehendDescribeEntitiesDetectionJobResponse
 */
- (AWSTask<AWSComprehendDescribeEntitiesDetectionJobResponse *> *)describeEntitiesDetectionJob:(AWSComprehendDescribeEntitiesDetectionJobRequest *)request;

/**
 <p>Gets the properties associated with an entities detection job. Use this operation to get the status of a detection job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEntitiesDetectionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorJobNotFound`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDescribeEntitiesDetectionJobRequest
 @see AWSComprehendDescribeEntitiesDetectionJobResponse
 */
- (void)describeEntitiesDetectionJob:(AWSComprehendDescribeEntitiesDetectionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendDescribeEntitiesDetectionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides details about an entity recognizer including status, S3 buckets containing training data, recognizer metadata, metrics, and so on.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEntityRecognizer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendDescribeEntityRecognizerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDescribeEntityRecognizerRequest
 @see AWSComprehendDescribeEntityRecognizerResponse
 */
- (AWSTask<AWSComprehendDescribeEntityRecognizerResponse *> *)describeEntityRecognizer:(AWSComprehendDescribeEntityRecognizerRequest *)request;

/**
 <p>Provides details about an entity recognizer including status, S3 buckets containing training data, recognizer metadata, metrics, and so on.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEntityRecognizer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDescribeEntityRecognizerRequest
 @see AWSComprehendDescribeEntityRecognizerResponse
 */
- (void)describeEntityRecognizer:(AWSComprehendDescribeEntityRecognizerRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendDescribeEntityRecognizerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the properties associated with a key phrases detection job. Use this operation to get the status of a detection job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeKeyPhrasesDetectionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendDescribeKeyPhrasesDetectionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorJobNotFound`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDescribeKeyPhrasesDetectionJobRequest
 @see AWSComprehendDescribeKeyPhrasesDetectionJobResponse
 */
- (AWSTask<AWSComprehendDescribeKeyPhrasesDetectionJobResponse *> *)describeKeyPhrasesDetectionJob:(AWSComprehendDescribeKeyPhrasesDetectionJobRequest *)request;

/**
 <p>Gets the properties associated with a key phrases detection job. Use this operation to get the status of a detection job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeKeyPhrasesDetectionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorJobNotFound`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDescribeKeyPhrasesDetectionJobRequest
 @see AWSComprehendDescribeKeyPhrasesDetectionJobResponse
 */
- (void)describeKeyPhrasesDetectionJob:(AWSComprehendDescribeKeyPhrasesDetectionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendDescribeKeyPhrasesDetectionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the properties associated with a sentiment detection job. Use this operation to get the status of a detection job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSentimentDetectionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendDescribeSentimentDetectionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorJobNotFound`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDescribeSentimentDetectionJobRequest
 @see AWSComprehendDescribeSentimentDetectionJobResponse
 */
- (AWSTask<AWSComprehendDescribeSentimentDetectionJobResponse *> *)describeSentimentDetectionJob:(AWSComprehendDescribeSentimentDetectionJobRequest *)request;

/**
 <p>Gets the properties associated with a sentiment detection job. Use this operation to get the status of a detection job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSentimentDetectionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorJobNotFound`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDescribeSentimentDetectionJobRequest
 @see AWSComprehendDescribeSentimentDetectionJobResponse
 */
- (void)describeSentimentDetectionJob:(AWSComprehendDescribeSentimentDetectionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendDescribeSentimentDetectionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the properties associated with a topic detection job. Use this operation to get the status of a detection job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTopicsDetectionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendDescribeTopicsDetectionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorJobNotFound`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDescribeTopicsDetectionJobRequest
 @see AWSComprehendDescribeTopicsDetectionJobResponse
 */
- (AWSTask<AWSComprehendDescribeTopicsDetectionJobResponse *> *)describeTopicsDetectionJob:(AWSComprehendDescribeTopicsDetectionJobRequest *)request;

/**
 <p>Gets the properties associated with a topic detection job. Use this operation to get the status of a detection job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTopicsDetectionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorJobNotFound`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDescribeTopicsDetectionJobRequest
 @see AWSComprehendDescribeTopicsDetectionJobResponse
 */
- (void)describeTopicsDetectionJob:(AWSComprehendDescribeTopicsDetectionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendDescribeTopicsDetectionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Determines the dominant language of the input text. For a list of languages that Amazon Comprehend can detect, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html">Amazon Comprehend Supported Languages</a>. </p>
 
 @param request A container for the necessary parameters to execute the DetectDominantLanguage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendDetectDominantLanguageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDetectDominantLanguageRequest
 @see AWSComprehendDetectDominantLanguageResponse
 */
- (AWSTask<AWSComprehendDetectDominantLanguageResponse *> *)detectDominantLanguage:(AWSComprehendDetectDominantLanguageRequest *)request;

/**
 <p>Determines the dominant language of the input text. For a list of languages that Amazon Comprehend can detect, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html">Amazon Comprehend Supported Languages</a>. </p>
 
 @param request A container for the necessary parameters to execute the DetectDominantLanguage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDetectDominantLanguageRequest
 @see AWSComprehendDetectDominantLanguageResponse
 */
- (void)detectDominantLanguage:(AWSComprehendDetectDominantLanguageRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendDetectDominantLanguageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Inspects text for named entities, and returns information about them. For more information, about named entities, see <a>how-entities</a>. </p>
 
 @param request A container for the necessary parameters to execute the DetectEntities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendDetectEntitiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorUnsupportedLanguage`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDetectEntitiesRequest
 @see AWSComprehendDetectEntitiesResponse
 */
- (AWSTask<AWSComprehendDetectEntitiesResponse *> *)detectEntities:(AWSComprehendDetectEntitiesRequest *)request;

/**
 <p>Inspects text for named entities, and returns information about them. For more information, about named entities, see <a>how-entities</a>. </p>
 
 @param request A container for the necessary parameters to execute the DetectEntities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorUnsupportedLanguage`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDetectEntitiesRequest
 @see AWSComprehendDetectEntitiesResponse
 */
- (void)detectEntities:(AWSComprehendDetectEntitiesRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendDetectEntitiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detects the key noun phrases found in the text. </p>
 
 @param request A container for the necessary parameters to execute the DetectKeyPhrases service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendDetectKeyPhrasesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorUnsupportedLanguage`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDetectKeyPhrasesRequest
 @see AWSComprehendDetectKeyPhrasesResponse
 */
- (AWSTask<AWSComprehendDetectKeyPhrasesResponse *> *)detectKeyPhrases:(AWSComprehendDetectKeyPhrasesRequest *)request;

/**
 <p>Detects the key noun phrases found in the text. </p>
 
 @param request A container for the necessary parameters to execute the DetectKeyPhrases service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorUnsupportedLanguage`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDetectKeyPhrasesRequest
 @see AWSComprehendDetectKeyPhrasesResponse
 */
- (void)detectKeyPhrases:(AWSComprehendDetectKeyPhrasesRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendDetectKeyPhrasesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Inspects text and returns an inference of the prevailing sentiment (<code>POSITIVE</code>, <code>NEUTRAL</code>, <code>MIXED</code>, or <code>NEGATIVE</code>). </p>
 
 @param request A container for the necessary parameters to execute the DetectSentiment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendDetectSentimentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorUnsupportedLanguage`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDetectSentimentRequest
 @see AWSComprehendDetectSentimentResponse
 */
- (AWSTask<AWSComprehendDetectSentimentResponse *> *)detectSentiment:(AWSComprehendDetectSentimentRequest *)request;

/**
 <p>Inspects text and returns an inference of the prevailing sentiment (<code>POSITIVE</code>, <code>NEUTRAL</code>, <code>MIXED</code>, or <code>NEGATIVE</code>). </p>
 
 @param request A container for the necessary parameters to execute the DetectSentiment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorUnsupportedLanguage`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDetectSentimentRequest
 @see AWSComprehendDetectSentimentResponse
 */
- (void)detectSentiment:(AWSComprehendDetectSentimentRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendDetectSentimentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Inspects text for syntax and the part of speech of words in the document. For more information, <a>how-syntax</a>.</p>
 
 @param request A container for the necessary parameters to execute the DetectSyntax service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendDetectSyntaxResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorUnsupportedLanguage`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDetectSyntaxRequest
 @see AWSComprehendDetectSyntaxResponse
 */
- (AWSTask<AWSComprehendDetectSyntaxResponse *> *)detectSyntax:(AWSComprehendDetectSyntaxRequest *)request;

/**
 <p>Inspects text for syntax and the part of speech of words in the document. For more information, <a>how-syntax</a>.</p>
 
 @param request A container for the necessary parameters to execute the DetectSyntax service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorUnsupportedLanguage`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDetectSyntaxRequest
 @see AWSComprehendDetectSyntaxResponse
 */
- (void)detectSyntax:(AWSComprehendDetectSyntaxRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendDetectSyntaxResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of the documentation classification jobs that you have submitted.</p>
 
 @param request A container for the necessary parameters to execute the ListDocumentClassificationJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendListDocumentClassificationJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInvalidFilter`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendListDocumentClassificationJobsRequest
 @see AWSComprehendListDocumentClassificationJobsResponse
 */
- (AWSTask<AWSComprehendListDocumentClassificationJobsResponse *> *)listDocumentClassificationJobs:(AWSComprehendListDocumentClassificationJobsRequest *)request;

/**
 <p>Gets a list of the documentation classification jobs that you have submitted.</p>
 
 @param request A container for the necessary parameters to execute the ListDocumentClassificationJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInvalidFilter`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendListDocumentClassificationJobsRequest
 @see AWSComprehendListDocumentClassificationJobsResponse
 */
- (void)listDocumentClassificationJobs:(AWSComprehendListDocumentClassificationJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendListDocumentClassificationJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of the document classifiers that you have created.</p>
 
 @param request A container for the necessary parameters to execute the ListDocumentClassifiers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendListDocumentClassifiersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInvalidFilter`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendListDocumentClassifiersRequest
 @see AWSComprehendListDocumentClassifiersResponse
 */
- (AWSTask<AWSComprehendListDocumentClassifiersResponse *> *)listDocumentClassifiers:(AWSComprehendListDocumentClassifiersRequest *)request;

/**
 <p>Gets a list of the document classifiers that you have created.</p>
 
 @param request A container for the necessary parameters to execute the ListDocumentClassifiers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInvalidFilter`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendListDocumentClassifiersRequest
 @see AWSComprehendListDocumentClassifiersResponse
 */
- (void)listDocumentClassifiers:(AWSComprehendListDocumentClassifiersRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendListDocumentClassifiersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of the dominant language detection jobs that you have submitted.</p>
 
 @param request A container for the necessary parameters to execute the ListDominantLanguageDetectionJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendListDominantLanguageDetectionJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInvalidFilter`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendListDominantLanguageDetectionJobsRequest
 @see AWSComprehendListDominantLanguageDetectionJobsResponse
 */
- (AWSTask<AWSComprehendListDominantLanguageDetectionJobsResponse *> *)listDominantLanguageDetectionJobs:(AWSComprehendListDominantLanguageDetectionJobsRequest *)request;

/**
 <p>Gets a list of the dominant language detection jobs that you have submitted.</p>
 
 @param request A container for the necessary parameters to execute the ListDominantLanguageDetectionJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInvalidFilter`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendListDominantLanguageDetectionJobsRequest
 @see AWSComprehendListDominantLanguageDetectionJobsResponse
 */
- (void)listDominantLanguageDetectionJobs:(AWSComprehendListDominantLanguageDetectionJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendListDominantLanguageDetectionJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of all existing endpoints that you've created.</p>
 
 @param request A container for the necessary parameters to execute the ListEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendListEndpointsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendListEndpointsRequest
 @see AWSComprehendListEndpointsResponse
 */
- (AWSTask<AWSComprehendListEndpointsResponse *> *)listEndpoints:(AWSComprehendListEndpointsRequest *)request;

/**
 <p>Gets a list of all existing endpoints that you've created.</p>
 
 @param request A container for the necessary parameters to execute the ListEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendListEndpointsRequest
 @see AWSComprehendListEndpointsResponse
 */
- (void)listEndpoints:(AWSComprehendListEndpointsRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendListEndpointsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of the entity detection jobs that you have submitted.</p>
 
 @param request A container for the necessary parameters to execute the ListEntitiesDetectionJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendListEntitiesDetectionJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInvalidFilter`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendListEntitiesDetectionJobsRequest
 @see AWSComprehendListEntitiesDetectionJobsResponse
 */
- (AWSTask<AWSComprehendListEntitiesDetectionJobsResponse *> *)listEntitiesDetectionJobs:(AWSComprehendListEntitiesDetectionJobsRequest *)request;

/**
 <p>Gets a list of the entity detection jobs that you have submitted.</p>
 
 @param request A container for the necessary parameters to execute the ListEntitiesDetectionJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInvalidFilter`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendListEntitiesDetectionJobsRequest
 @see AWSComprehendListEntitiesDetectionJobsResponse
 */
- (void)listEntitiesDetectionJobs:(AWSComprehendListEntitiesDetectionJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendListEntitiesDetectionJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of the properties of all entity recognizers that you created, including recognizers currently in training. Allows you to filter the list of recognizers based on criteria such as status and submission time. This call returns up to 500 entity recognizers in the list, with a default number of 100 recognizers in the list.</p><p>The results of this list are not in any particular order. Please get the list and sort locally if needed.</p>
 
 @param request A container for the necessary parameters to execute the ListEntityRecognizers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendListEntityRecognizersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInvalidFilter`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendListEntityRecognizersRequest
 @see AWSComprehendListEntityRecognizersResponse
 */
- (AWSTask<AWSComprehendListEntityRecognizersResponse *> *)listEntityRecognizers:(AWSComprehendListEntityRecognizersRequest *)request;

/**
 <p>Gets a list of the properties of all entity recognizers that you created, including recognizers currently in training. Allows you to filter the list of recognizers based on criteria such as status and submission time. This call returns up to 500 entity recognizers in the list, with a default number of 100 recognizers in the list.</p><p>The results of this list are not in any particular order. Please get the list and sort locally if needed.</p>
 
 @param request A container for the necessary parameters to execute the ListEntityRecognizers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInvalidFilter`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendListEntityRecognizersRequest
 @see AWSComprehendListEntityRecognizersResponse
 */
- (void)listEntityRecognizers:(AWSComprehendListEntityRecognizersRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendListEntityRecognizersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get a list of key phrase detection jobs that you have submitted.</p>
 
 @param request A container for the necessary parameters to execute the ListKeyPhrasesDetectionJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendListKeyPhrasesDetectionJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInvalidFilter`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendListKeyPhrasesDetectionJobsRequest
 @see AWSComprehendListKeyPhrasesDetectionJobsResponse
 */
- (AWSTask<AWSComprehendListKeyPhrasesDetectionJobsResponse *> *)listKeyPhrasesDetectionJobs:(AWSComprehendListKeyPhrasesDetectionJobsRequest *)request;

/**
 <p>Get a list of key phrase detection jobs that you have submitted.</p>
 
 @param request A container for the necessary parameters to execute the ListKeyPhrasesDetectionJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInvalidFilter`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendListKeyPhrasesDetectionJobsRequest
 @see AWSComprehendListKeyPhrasesDetectionJobsResponse
 */
- (void)listKeyPhrasesDetectionJobs:(AWSComprehendListKeyPhrasesDetectionJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendListKeyPhrasesDetectionJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of sentiment detection jobs that you have submitted.</p>
 
 @param request A container for the necessary parameters to execute the ListSentimentDetectionJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendListSentimentDetectionJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInvalidFilter`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendListSentimentDetectionJobsRequest
 @see AWSComprehendListSentimentDetectionJobsResponse
 */
- (AWSTask<AWSComprehendListSentimentDetectionJobsResponse *> *)listSentimentDetectionJobs:(AWSComprehendListSentimentDetectionJobsRequest *)request;

/**
 <p>Gets a list of sentiment detection jobs that you have submitted.</p>
 
 @param request A container for the necessary parameters to execute the ListSentimentDetectionJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInvalidFilter`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendListSentimentDetectionJobsRequest
 @see AWSComprehendListSentimentDetectionJobsResponse
 */
- (void)listSentimentDetectionJobs:(AWSComprehendListSentimentDetectionJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendListSentimentDetectionJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all tags associated with a given Amazon Comprehend resource. </p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendListTagsForResourceRequest
 @see AWSComprehendListTagsForResourceResponse
 */
- (AWSTask<AWSComprehendListTagsForResourceResponse *> *)listTagsForResource:(AWSComprehendListTagsForResourceRequest *)request;

/**
 <p>Lists all tags associated with a given Amazon Comprehend resource. </p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendListTagsForResourceRequest
 @see AWSComprehendListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSComprehendListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of the topic detection jobs that you have submitted.</p>
 
 @param request A container for the necessary parameters to execute the ListTopicsDetectionJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendListTopicsDetectionJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInvalidFilter`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendListTopicsDetectionJobsRequest
 @see AWSComprehendListTopicsDetectionJobsResponse
 */
- (AWSTask<AWSComprehendListTopicsDetectionJobsResponse *> *)listTopicsDetectionJobs:(AWSComprehendListTopicsDetectionJobsRequest *)request;

/**
 <p>Gets a list of the topic detection jobs that you have submitted.</p>
 
 @param request A container for the necessary parameters to execute the ListTopicsDetectionJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInvalidFilter`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendListTopicsDetectionJobsRequest
 @see AWSComprehendListTopicsDetectionJobsResponse
 */
- (void)listTopicsDetectionJobs:(AWSComprehendListTopicsDetectionJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendListTopicsDetectionJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts an asynchronous document classification job. Use the operation to track the progress of the job.</p>
 
 @param request A container for the necessary parameters to execute the StartDocumentClassificationJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendStartDocumentClassificationJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorResourceUnavailable`, `AWSComprehendErrorKmsKeyValidation`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStartDocumentClassificationJobRequest
 @see AWSComprehendStartDocumentClassificationJobResponse
 */
- (AWSTask<AWSComprehendStartDocumentClassificationJobResponse *> *)startDocumentClassificationJob:(AWSComprehendStartDocumentClassificationJobRequest *)request;

/**
 <p>Starts an asynchronous document classification job. Use the operation to track the progress of the job.</p>
 
 @param request A container for the necessary parameters to execute the StartDocumentClassificationJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorResourceUnavailable`, `AWSComprehendErrorKmsKeyValidation`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStartDocumentClassificationJobRequest
 @see AWSComprehendStartDocumentClassificationJobResponse
 */
- (void)startDocumentClassificationJob:(AWSComprehendStartDocumentClassificationJobRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendStartDocumentClassificationJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts an asynchronous dominant language detection job for a collection of documents. Use the operation to track the status of a job.</p>
 
 @param request A container for the necessary parameters to execute the StartDominantLanguageDetectionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendStartDominantLanguageDetectionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorKmsKeyValidation`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStartDominantLanguageDetectionJobRequest
 @see AWSComprehendStartDominantLanguageDetectionJobResponse
 */
- (AWSTask<AWSComprehendStartDominantLanguageDetectionJobResponse *> *)startDominantLanguageDetectionJob:(AWSComprehendStartDominantLanguageDetectionJobRequest *)request;

/**
 <p>Starts an asynchronous dominant language detection job for a collection of documents. Use the operation to track the status of a job.</p>
 
 @param request A container for the necessary parameters to execute the StartDominantLanguageDetectionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorKmsKeyValidation`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStartDominantLanguageDetectionJobRequest
 @see AWSComprehendStartDominantLanguageDetectionJobResponse
 */
- (void)startDominantLanguageDetectionJob:(AWSComprehendStartDominantLanguageDetectionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendStartDominantLanguageDetectionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts an asynchronous entity detection job for a collection of documents. Use the operation to track the status of a job.</p><p>This API can be used for either standard entity detection or custom entity recognition. In order to be used for custom entity recognition, the optional <code>EntityRecognizerArn</code> must be used in order to provide access to the recognizer being used to detect the custom entity.</p>
 
 @param request A container for the necessary parameters to execute the StartEntitiesDetectionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendStartEntitiesDetectionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorResourceUnavailable`, `AWSComprehendErrorKmsKeyValidation`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStartEntitiesDetectionJobRequest
 @see AWSComprehendStartEntitiesDetectionJobResponse
 */
- (AWSTask<AWSComprehendStartEntitiesDetectionJobResponse *> *)startEntitiesDetectionJob:(AWSComprehendStartEntitiesDetectionJobRequest *)request;

/**
 <p>Starts an asynchronous entity detection job for a collection of documents. Use the operation to track the status of a job.</p><p>This API can be used for either standard entity detection or custom entity recognition. In order to be used for custom entity recognition, the optional <code>EntityRecognizerArn</code> must be used in order to provide access to the recognizer being used to detect the custom entity.</p>
 
 @param request A container for the necessary parameters to execute the StartEntitiesDetectionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorResourceUnavailable`, `AWSComprehendErrorKmsKeyValidation`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStartEntitiesDetectionJobRequest
 @see AWSComprehendStartEntitiesDetectionJobResponse
 */
- (void)startEntitiesDetectionJob:(AWSComprehendStartEntitiesDetectionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendStartEntitiesDetectionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts an asynchronous key phrase detection job for a collection of documents. Use the operation to track the status of a job.</p>
 
 @param request A container for the necessary parameters to execute the StartKeyPhrasesDetectionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendStartKeyPhrasesDetectionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorKmsKeyValidation`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStartKeyPhrasesDetectionJobRequest
 @see AWSComprehendStartKeyPhrasesDetectionJobResponse
 */
- (AWSTask<AWSComprehendStartKeyPhrasesDetectionJobResponse *> *)startKeyPhrasesDetectionJob:(AWSComprehendStartKeyPhrasesDetectionJobRequest *)request;

/**
 <p>Starts an asynchronous key phrase detection job for a collection of documents. Use the operation to track the status of a job.</p>
 
 @param request A container for the necessary parameters to execute the StartKeyPhrasesDetectionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorKmsKeyValidation`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStartKeyPhrasesDetectionJobRequest
 @see AWSComprehendStartKeyPhrasesDetectionJobResponse
 */
- (void)startKeyPhrasesDetectionJob:(AWSComprehendStartKeyPhrasesDetectionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendStartKeyPhrasesDetectionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts an asynchronous sentiment detection job for a collection of documents. use the operation to track the status of a job.</p>
 
 @param request A container for the necessary parameters to execute the StartSentimentDetectionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendStartSentimentDetectionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorKmsKeyValidation`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStartSentimentDetectionJobRequest
 @see AWSComprehendStartSentimentDetectionJobResponse
 */
- (AWSTask<AWSComprehendStartSentimentDetectionJobResponse *> *)startSentimentDetectionJob:(AWSComprehendStartSentimentDetectionJobRequest *)request;

/**
 <p>Starts an asynchronous sentiment detection job for a collection of documents. use the operation to track the status of a job.</p>
 
 @param request A container for the necessary parameters to execute the StartSentimentDetectionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorKmsKeyValidation`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStartSentimentDetectionJobRequest
 @see AWSComprehendStartSentimentDetectionJobResponse
 */
- (void)startSentimentDetectionJob:(AWSComprehendStartSentimentDetectionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendStartSentimentDetectionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts an asynchronous topic detection job. Use the <code>DescribeTopicDetectionJob</code> operation to track the status of a job.</p>
 
 @param request A container for the necessary parameters to execute the StartTopicsDetectionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendStartTopicsDetectionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorKmsKeyValidation`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStartTopicsDetectionJobRequest
 @see AWSComprehendStartTopicsDetectionJobResponse
 */
- (AWSTask<AWSComprehendStartTopicsDetectionJobResponse *> *)startTopicsDetectionJob:(AWSComprehendStartTopicsDetectionJobRequest *)request;

/**
 <p>Starts an asynchronous topic detection job. Use the <code>DescribeTopicDetectionJob</code> operation to track the status of a job.</p>
 
 @param request A container for the necessary parameters to execute the StartTopicsDetectionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorKmsKeyValidation`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStartTopicsDetectionJobRequest
 @see AWSComprehendStartTopicsDetectionJobResponse
 */
- (void)startTopicsDetectionJob:(AWSComprehendStartTopicsDetectionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendStartTopicsDetectionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops a dominant language detection job in progress.</p><p>If the job state is <code>IN_PROGRESS</code> the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the job completes before it can be stopped, it is put into the <code>COMPLETED</code> state; otherwise the job is stopped and put into the <code>STOPPED</code> state.</p><p>If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state when you call the <code>StopDominantLanguageDetectionJob</code> operation, the operation returns a 400 Internal Request Exception. </p><p>When a job is stopped, any documents already processed are written to the output location.</p>
 
 @param request A container for the necessary parameters to execute the StopDominantLanguageDetectionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendStopDominantLanguageDetectionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorJobNotFound`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStopDominantLanguageDetectionJobRequest
 @see AWSComprehendStopDominantLanguageDetectionJobResponse
 */
- (AWSTask<AWSComprehendStopDominantLanguageDetectionJobResponse *> *)stopDominantLanguageDetectionJob:(AWSComprehendStopDominantLanguageDetectionJobRequest *)request;

/**
 <p>Stops a dominant language detection job in progress.</p><p>If the job state is <code>IN_PROGRESS</code> the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the job completes before it can be stopped, it is put into the <code>COMPLETED</code> state; otherwise the job is stopped and put into the <code>STOPPED</code> state.</p><p>If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state when you call the <code>StopDominantLanguageDetectionJob</code> operation, the operation returns a 400 Internal Request Exception. </p><p>When a job is stopped, any documents already processed are written to the output location.</p>
 
 @param request A container for the necessary parameters to execute the StopDominantLanguageDetectionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorJobNotFound`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStopDominantLanguageDetectionJobRequest
 @see AWSComprehendStopDominantLanguageDetectionJobResponse
 */
- (void)stopDominantLanguageDetectionJob:(AWSComprehendStopDominantLanguageDetectionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendStopDominantLanguageDetectionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops an entities detection job in progress.</p><p>If the job state is <code>IN_PROGRESS</code> the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the job completes before it can be stopped, it is put into the <code>COMPLETED</code> state; otherwise the job is stopped and put into the <code>STOPPED</code> state.</p><p>If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state when you call the <code>StopDominantLanguageDetectionJob</code> operation, the operation returns a 400 Internal Request Exception. </p><p>When a job is stopped, any documents already processed are written to the output location.</p>
 
 @param request A container for the necessary parameters to execute the StopEntitiesDetectionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendStopEntitiesDetectionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorJobNotFound`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStopEntitiesDetectionJobRequest
 @see AWSComprehendStopEntitiesDetectionJobResponse
 */
- (AWSTask<AWSComprehendStopEntitiesDetectionJobResponse *> *)stopEntitiesDetectionJob:(AWSComprehendStopEntitiesDetectionJobRequest *)request;

/**
 <p>Stops an entities detection job in progress.</p><p>If the job state is <code>IN_PROGRESS</code> the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the job completes before it can be stopped, it is put into the <code>COMPLETED</code> state; otherwise the job is stopped and put into the <code>STOPPED</code> state.</p><p>If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state when you call the <code>StopDominantLanguageDetectionJob</code> operation, the operation returns a 400 Internal Request Exception. </p><p>When a job is stopped, any documents already processed are written to the output location.</p>
 
 @param request A container for the necessary parameters to execute the StopEntitiesDetectionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorJobNotFound`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStopEntitiesDetectionJobRequest
 @see AWSComprehendStopEntitiesDetectionJobResponse
 */
- (void)stopEntitiesDetectionJob:(AWSComprehendStopEntitiesDetectionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendStopEntitiesDetectionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops a key phrases detection job in progress.</p><p>If the job state is <code>IN_PROGRESS</code> the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the job completes before it can be stopped, it is put into the <code>COMPLETED</code> state; otherwise the job is stopped and put into the <code>STOPPED</code> state.</p><p>If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state when you call the <code>StopDominantLanguageDetectionJob</code> operation, the operation returns a 400 Internal Request Exception. </p><p>When a job is stopped, any documents already processed are written to the output location.</p>
 
 @param request A container for the necessary parameters to execute the StopKeyPhrasesDetectionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendStopKeyPhrasesDetectionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorJobNotFound`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStopKeyPhrasesDetectionJobRequest
 @see AWSComprehendStopKeyPhrasesDetectionJobResponse
 */
- (AWSTask<AWSComprehendStopKeyPhrasesDetectionJobResponse *> *)stopKeyPhrasesDetectionJob:(AWSComprehendStopKeyPhrasesDetectionJobRequest *)request;

/**
 <p>Stops a key phrases detection job in progress.</p><p>If the job state is <code>IN_PROGRESS</code> the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the job completes before it can be stopped, it is put into the <code>COMPLETED</code> state; otherwise the job is stopped and put into the <code>STOPPED</code> state.</p><p>If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state when you call the <code>StopDominantLanguageDetectionJob</code> operation, the operation returns a 400 Internal Request Exception. </p><p>When a job is stopped, any documents already processed are written to the output location.</p>
 
 @param request A container for the necessary parameters to execute the StopKeyPhrasesDetectionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorJobNotFound`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStopKeyPhrasesDetectionJobRequest
 @see AWSComprehendStopKeyPhrasesDetectionJobResponse
 */
- (void)stopKeyPhrasesDetectionJob:(AWSComprehendStopKeyPhrasesDetectionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendStopKeyPhrasesDetectionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops a sentiment detection job in progress.</p><p>If the job state is <code>IN_PROGRESS</code> the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the job completes before it can be stopped, it is put into the <code>COMPLETED</code> state; otherwise the job is be stopped and put into the <code>STOPPED</code> state.</p><p>If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state when you call the <code>StopDominantLanguageDetectionJob</code> operation, the operation returns a 400 Internal Request Exception. </p><p>When a job is stopped, any documents already processed are written to the output location.</p>
 
 @param request A container for the necessary parameters to execute the StopSentimentDetectionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendStopSentimentDetectionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorJobNotFound`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStopSentimentDetectionJobRequest
 @see AWSComprehendStopSentimentDetectionJobResponse
 */
- (AWSTask<AWSComprehendStopSentimentDetectionJobResponse *> *)stopSentimentDetectionJob:(AWSComprehendStopSentimentDetectionJobRequest *)request;

/**
 <p>Stops a sentiment detection job in progress.</p><p>If the job state is <code>IN_PROGRESS</code> the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the job completes before it can be stopped, it is put into the <code>COMPLETED</code> state; otherwise the job is be stopped and put into the <code>STOPPED</code> state.</p><p>If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state when you call the <code>StopDominantLanguageDetectionJob</code> operation, the operation returns a 400 Internal Request Exception. </p><p>When a job is stopped, any documents already processed are written to the output location.</p>
 
 @param request A container for the necessary parameters to execute the StopSentimentDetectionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorJobNotFound`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStopSentimentDetectionJobRequest
 @see AWSComprehendStopSentimentDetectionJobResponse
 */
- (void)stopSentimentDetectionJob:(AWSComprehendStopSentimentDetectionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendStopSentimentDetectionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops a document classifier training job while in progress.</p><p>If the training job state is <code>TRAINING</code>, the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the training job completes before it can be stopped, it is put into the <code>TRAINED</code>; otherwise the training job is stopped and put into the <code>STOPPED</code> state and the service sends back an HTTP 200 response with an empty HTTP body. </p>
 
 @param request A container for the necessary parameters to execute the StopTrainingDocumentClassifier service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendStopTrainingDocumentClassifierResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStopTrainingDocumentClassifierRequest
 @see AWSComprehendStopTrainingDocumentClassifierResponse
 */
- (AWSTask<AWSComprehendStopTrainingDocumentClassifierResponse *> *)stopTrainingDocumentClassifier:(AWSComprehendStopTrainingDocumentClassifierRequest *)request;

/**
 <p>Stops a document classifier training job while in progress.</p><p>If the training job state is <code>TRAINING</code>, the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the training job completes before it can be stopped, it is put into the <code>TRAINED</code>; otherwise the training job is stopped and put into the <code>STOPPED</code> state and the service sends back an HTTP 200 response with an empty HTTP body. </p>
 
 @param request A container for the necessary parameters to execute the StopTrainingDocumentClassifier service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStopTrainingDocumentClassifierRequest
 @see AWSComprehendStopTrainingDocumentClassifierResponse
 */
- (void)stopTrainingDocumentClassifier:(AWSComprehendStopTrainingDocumentClassifierRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendStopTrainingDocumentClassifierResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops an entity recognizer training job while in progress.</p><p>If the training job state is <code>TRAINING</code>, the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the training job completes before it can be stopped, it is put into the <code>TRAINED</code>; otherwise the training job is stopped and putted into the <code>STOPPED</code> state and the service sends back an HTTP 200 response with an empty HTTP body.</p>
 
 @param request A container for the necessary parameters to execute the StopTrainingEntityRecognizer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendStopTrainingEntityRecognizerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStopTrainingEntityRecognizerRequest
 @see AWSComprehendStopTrainingEntityRecognizerResponse
 */
- (AWSTask<AWSComprehendStopTrainingEntityRecognizerResponse *> *)stopTrainingEntityRecognizer:(AWSComprehendStopTrainingEntityRecognizerRequest *)request;

/**
 <p>Stops an entity recognizer training job while in progress.</p><p>If the training job state is <code>TRAINING</code>, the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the training job completes before it can be stopped, it is put into the <code>TRAINED</code>; otherwise the training job is stopped and putted into the <code>STOPPED</code> state and the service sends back an HTTP 200 response with an empty HTTP body.</p>
 
 @param request A container for the necessary parameters to execute the StopTrainingEntityRecognizer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStopTrainingEntityRecognizerRequest
 @see AWSComprehendStopTrainingEntityRecognizerResponse
 */
- (void)stopTrainingEntityRecognizer:(AWSComprehendStopTrainingEntityRecognizerRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendStopTrainingEntityRecognizerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates a specific tag with an Amazon Comprehend resource. A tag is a key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a resource to indicate its use by the sales department. </p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorConcurrentModification`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorTooManyTags`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendTagResourceRequest
 @see AWSComprehendTagResourceResponse
 */
- (AWSTask<AWSComprehendTagResourceResponse *> *)tagResource:(AWSComprehendTagResourceRequest *)request;

/**
 <p>Associates a specific tag with an Amazon Comprehend resource. A tag is a key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a resource to indicate its use by the sales department. </p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorConcurrentModification`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorTooManyTags`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendTagResourceRequest
 @see AWSComprehendTagResourceResponse
 */
- (void)tagResource:(AWSComprehendTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a specific tag associated with an Amazon Comprehend resource. </p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorTooManyTagKeys`, `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorConcurrentModification`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendUntagResourceRequest
 @see AWSComprehendUntagResourceResponse
 */
- (AWSTask<AWSComprehendUntagResourceResponse *> *)untagResource:(AWSComprehendUntagResourceRequest *)request;

/**
 <p>Removes a specific tag associated with an Amazon Comprehend resource. </p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorTooManyTagKeys`, `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorConcurrentModification`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendUntagResourceRequest
 @see AWSComprehendUntagResourceResponse
 */
- (void)untagResource:(AWSComprehendUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates information about the specified endpoint.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendUpdateEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorResourceInUse`, `AWSComprehendErrorResourceLimitExceeded`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorResourceUnavailable`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendUpdateEndpointRequest
 @see AWSComprehendUpdateEndpointResponse
 */
- (AWSTask<AWSComprehendUpdateEndpointResponse *> *)updateEndpoint:(AWSComprehendUpdateEndpointRequest *)request;

/**
 <p>Updates information about the specified endpoint.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorResourceInUse`, `AWSComprehendErrorResourceLimitExceeded`, `AWSComprehendErrorResourceNotFound`, `AWSComprehendErrorResourceUnavailable`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendUpdateEndpointRequest
 @see AWSComprehendUpdateEndpointResponse
 */
- (void)updateEndpoint:(AWSComprehendUpdateEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendUpdateEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
