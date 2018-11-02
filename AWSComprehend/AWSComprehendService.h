//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
 <p>Determines the dominant language of the input text for a batch of documents. For a list of languages that Amazon Comprehend can detect, see <a href="http://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html">Amazon Comprehend Supported Languages</a>. </p>
 
 @param request A container for the necessary parameters to execute the BatchDetectDominantLanguage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendBatchDetectDominantLanguageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorBatchSizeLimitExceeded`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendBatchDetectDominantLanguageRequest
 @see AWSComprehendBatchDetectDominantLanguageResponse
 */
- (AWSTask<AWSComprehendBatchDetectDominantLanguageResponse *> *)batchDetectDominantLanguage:(AWSComprehendBatchDetectDominantLanguageRequest *)request;

/**
 <p>Determines the dominant language of the input text for a batch of documents. For a list of languages that Amazon Comprehend can detect, see <a href="http://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html">Amazon Comprehend Supported Languages</a>. </p>
 
 @param request A container for the necessary parameters to execute the BatchDetectDominantLanguage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorBatchSizeLimitExceeded`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendBatchDetectDominantLanguageRequest
 @see AWSComprehendBatchDetectDominantLanguageResponse
 */
- (void)batchDetectDominantLanguage:(AWSComprehendBatchDetectDominantLanguageRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendBatchDetectDominantLanguageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Inspects the text of a batch of documents and returns information about them. For more information about entities, see <a>how-entities</a></p>
 
 @param request A container for the necessary parameters to execute the BatchDetectEntities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendBatchDetectEntitiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorUnsupportedLanguage`, `AWSComprehendErrorBatchSizeLimitExceeded`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendBatchDetectEntitiesRequest
 @see AWSComprehendBatchDetectEntitiesResponse
 */
- (AWSTask<AWSComprehendBatchDetectEntitiesResponse *> *)batchDetectEntities:(AWSComprehendBatchDetectEntitiesRequest *)request;

/**
 <p>Inspects the text of a batch of documents and returns information about them. For more information about entities, see <a>how-entities</a></p>
 
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
 <p>Determines the dominant language of the input text. For a list of languages that Amazon Comprehend can detect, see <a href="http://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html">Amazon Comprehend Supported Languages</a>. </p>
 
 @param request A container for the necessary parameters to execute the DetectDominantLanguage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendDetectDominantLanguageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDetectDominantLanguageRequest
 @see AWSComprehendDetectDominantLanguageResponse
 */
- (AWSTask<AWSComprehendDetectDominantLanguageResponse *> *)detectDominantLanguage:(AWSComprehendDetectDominantLanguageRequest *)request;

/**
 <p>Determines the dominant language of the input text. For a list of languages that Amazon Comprehend can detect, see <a href="http://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html">Amazon Comprehend Supported Languages</a>. </p>
 
 @param request A container for the necessary parameters to execute the DetectDominantLanguage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDetectDominantLanguageRequest
 @see AWSComprehendDetectDominantLanguageResponse
 */
- (void)detectDominantLanguage:(AWSComprehendDetectDominantLanguageRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendDetectDominantLanguageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Inspects text for entities, and returns information about them. For more information, about entities, see <a>how-entities</a>. </p>
 
 @param request A container for the necessary parameters to execute the DetectEntities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendDetectEntitiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTextSizeLimitExceeded`, `AWSComprehendErrorUnsupportedLanguage`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendDetectEntitiesRequest
 @see AWSComprehendDetectEntitiesResponse
 */
- (AWSTask<AWSComprehendDetectEntitiesResponse *> *)detectEntities:(AWSComprehendDetectEntitiesRequest *)request;

/**
 <p>Inspects text for entities, and returns information about them. For more information, about entities, see <a>how-entities</a>. </p>
 
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
 <p>Starts an asynchronous topic detection job. Use the <code>DescribeTopicDetectionJob</code> operation to track the status of a job.</p>
 
 @param request A container for the necessary parameters to execute the StartTopicsDetectionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComprehendStartTopicsDetectionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStartTopicsDetectionJobRequest
 @see AWSComprehendStartTopicsDetectionJobResponse
 */
- (AWSTask<AWSComprehendStartTopicsDetectionJobResponse *> *)startTopicsDetectionJob:(AWSComprehendStartTopicsDetectionJobRequest *)request;

/**
 <p>Starts an asynchronous topic detection job. Use the <code>DescribeTopicDetectionJob</code> operation to track the status of a job.</p>
 
 @param request A container for the necessary parameters to execute the StartTopicsDetectionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComprehendErrorDomain` domain and the following error code: `AWSComprehendErrorInvalidRequest`, `AWSComprehendErrorTooManyRequests`, `AWSComprehendErrorInternalServer`.
 
 @see AWSComprehendStartTopicsDetectionJobRequest
 @see AWSComprehendStartTopicsDetectionJobResponse
 */
- (void)startTopicsDetectionJob:(AWSComprehendStartTopicsDetectionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSComprehendStartTopicsDetectionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
