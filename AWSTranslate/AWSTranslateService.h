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
#import "AWSTranslateModel.h"
#import "AWSTranslateResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSTranslate
FOUNDATION_EXPORT NSString *const AWSTranslateSDKVersion;

/**
 <p>Provides translation between one source language and another of the same set of languages.</p>
 */
@interface AWSTranslate : AWSService

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

     let Translate = AWSTranslate.default()

 *Objective-C*

     AWSTranslate *Translate = [AWSTranslate defaultTranslate];

 @return The default service client.
 */
+ (instancetype)defaultTranslate;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSTranslate.register(with: configuration!, forKey: "USWest2Translate")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSTranslate registerTranslateWithConfiguration:configuration forKey:@"USWest2Translate"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Translate = AWSTranslate(forKey: "USWest2Translate")

 *Objective-C*

     AWSTranslate *Translate = [AWSTranslate TranslateForKey:@"USWest2Translate"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerTranslateWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerTranslateWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSTranslate.register(with: configuration!, forKey: "USWest2Translate")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSTranslate registerTranslateWithConfiguration:configuration forKey:@"USWest2Translate"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Translate = AWSTranslate(forKey: "USWest2Translate")

 *Objective-C*

     AWSTranslate *Translate = [AWSTranslate TranslateForKey:@"USWest2Translate"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)TranslateForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeTranslateForKey:(NSString *)key;

/**
 <p>A synchronous action that deletes a custom terminology.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTerminology service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateDeleteTerminologyRequest
 */
- (AWSTask *)deleteTerminology:(AWSTranslateDeleteTerminologyRequest *)request;

/**
 <p>A synchronous action that deletes a custom terminology.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTerminology service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateDeleteTerminologyRequest
 */
- (void)deleteTerminology:(AWSTranslateDeleteTerminologyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Gets the properties associated with an asycnhronous batch translation job including name, ID, status, source and target languages, input/output S3 buckets, and so on.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTextTranslationJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranslateDescribeTextTranslationJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateDescribeTextTranslationJobRequest
 @see AWSTranslateDescribeTextTranslationJobResponse
 */
- (AWSTask<AWSTranslateDescribeTextTranslationJobResponse *> *)describeTextTranslationJob:(AWSTranslateDescribeTextTranslationJobRequest *)request;

/**
 <p>Gets the properties associated with an asycnhronous batch translation job including name, ID, status, source and target languages, input/output S3 buckets, and so on.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTextTranslationJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateDescribeTextTranslationJobRequest
 @see AWSTranslateDescribeTextTranslationJobResponse
 */
- (void)describeTextTranslationJob:(AWSTranslateDescribeTextTranslationJobRequest *)request completionHandler:(void (^ _Nullable)(AWSTranslateDescribeTextTranslationJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a custom terminology.</p>
 
 @param request A container for the necessary parameters to execute the GetTerminology service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranslateGetTerminologyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateGetTerminologyRequest
 @see AWSTranslateGetTerminologyResponse
 */
- (AWSTask<AWSTranslateGetTerminologyResponse *> *)getTerminology:(AWSTranslateGetTerminologyRequest *)request;

/**
 <p>Retrieves a custom terminology.</p>
 
 @param request A container for the necessary parameters to execute the GetTerminology service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateGetTerminologyRequest
 @see AWSTranslateGetTerminologyResponse
 */
- (void)getTerminology:(AWSTranslateGetTerminologyRequest *)request completionHandler:(void (^ _Nullable)(AWSTranslateGetTerminologyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a custom terminology, depending on whether or not one already exists for the given terminology name. Importing a terminology with the same name as an existing one will merge the terminologies based on the chosen merge strategy. Currently, the only supported merge strategy is OVERWRITE, and so the imported terminology will overwrite an existing terminology of the same name.</p><p>If you import a terminology that overwrites an existing one, the new terminology take up to 10 minutes to fully propagate and be available for use in a translation due to cache policies with the DataPlane service that performs the translations.</p>
 
 @param request A container for the necessary parameters to execute the ImportTerminology service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranslateImportTerminologyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorLimitExceeded`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateImportTerminologyRequest
 @see AWSTranslateImportTerminologyResponse
 */
- (AWSTask<AWSTranslateImportTerminologyResponse *> *)importTerminology:(AWSTranslateImportTerminologyRequest *)request;

/**
 <p>Creates or updates a custom terminology, depending on whether or not one already exists for the given terminology name. Importing a terminology with the same name as an existing one will merge the terminologies based on the chosen merge strategy. Currently, the only supported merge strategy is OVERWRITE, and so the imported terminology will overwrite an existing terminology of the same name.</p><p>If you import a terminology that overwrites an existing one, the new terminology take up to 10 minutes to fully propagate and be available for use in a translation due to cache policies with the DataPlane service that performs the translations.</p>
 
 @param request A container for the necessary parameters to execute the ImportTerminology service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorLimitExceeded`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateImportTerminologyRequest
 @see AWSTranslateImportTerminologyResponse
 */
- (void)importTerminology:(AWSTranslateImportTerminologyRequest *)request completionHandler:(void (^ _Nullable)(AWSTranslateImportTerminologyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of custom terminologies associated with your account.</p>
 
 @param request A container for the necessary parameters to execute the ListTerminologies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranslateListTerminologiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateListTerminologiesRequest
 @see AWSTranslateListTerminologiesResponse
 */
- (AWSTask<AWSTranslateListTerminologiesResponse *> *)listTerminologies:(AWSTranslateListTerminologiesRequest *)request;

/**
 <p>Provides a list of custom terminologies associated with your account.</p>
 
 @param request A container for the necessary parameters to execute the ListTerminologies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateListTerminologiesRequest
 @see AWSTranslateListTerminologiesResponse
 */
- (void)listTerminologies:(AWSTranslateListTerminologiesRequest *)request completionHandler:(void (^ _Nullable)(AWSTranslateListTerminologiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of the batch translation jobs that you have submitted.</p>
 
 @param request A container for the necessary parameters to execute the ListTextTranslationJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranslateListTextTranslationJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidRequest`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorInvalidFilter`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateListTextTranslationJobsRequest
 @see AWSTranslateListTextTranslationJobsResponse
 */
- (AWSTask<AWSTranslateListTextTranslationJobsResponse *> *)listTextTranslationJobs:(AWSTranslateListTextTranslationJobsRequest *)request;

/**
 <p>Gets a list of the batch translation jobs that you have submitted.</p>
 
 @param request A container for the necessary parameters to execute the ListTextTranslationJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidRequest`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorInvalidFilter`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateListTextTranslationJobsRequest
 @see AWSTranslateListTextTranslationJobsResponse
 */
- (void)listTextTranslationJobs:(AWSTranslateListTextTranslationJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSTranslateListTextTranslationJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts an asynchronous batch translation job. Batch translation jobs can be used to translate large volumes of text across multiple documents at once. For more information, see <a>async</a>.</p><p>Batch translation jobs can be described with the <a>DescribeTextTranslationJob</a> operation, listed with the <a>ListTextTranslationJobs</a> operation, and stopped with the <a>StopTextTranslationJob</a> operation.</p><note><p>Amazon Translate does not support batch translation of multiple source languages at once.</p></note>
 
 @param request A container for the necessary parameters to execute the StartTextTranslationJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranslateStartTextTranslationJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorUnsupportedLanguagePair`, `AWSTranslateErrorInvalidRequest`, `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateStartTextTranslationJobRequest
 @see AWSTranslateStartTextTranslationJobResponse
 */
- (AWSTask<AWSTranslateStartTextTranslationJobResponse *> *)startTextTranslationJob:(AWSTranslateStartTextTranslationJobRequest *)request;

/**
 <p>Starts an asynchronous batch translation job. Batch translation jobs can be used to translate large volumes of text across multiple documents at once. For more information, see <a>async</a>.</p><p>Batch translation jobs can be described with the <a>DescribeTextTranslationJob</a> operation, listed with the <a>ListTextTranslationJobs</a> operation, and stopped with the <a>StopTextTranslationJob</a> operation.</p><note><p>Amazon Translate does not support batch translation of multiple source languages at once.</p></note>
 
 @param request A container for the necessary parameters to execute the StartTextTranslationJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorUnsupportedLanguagePair`, `AWSTranslateErrorInvalidRequest`, `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateStartTextTranslationJobRequest
 @see AWSTranslateStartTextTranslationJobResponse
 */
- (void)startTextTranslationJob:(AWSTranslateStartTextTranslationJobRequest *)request completionHandler:(void (^ _Nullable)(AWSTranslateStartTextTranslationJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops an asynchronous batch translation job that is in progress.</p><p>If the job's state is <code>IN_PROGRESS</code>, the job will be marked for termination and put into the <code>STOP_REQUESTED</code> state. If the job completes before it can be stopped, it is put into the <code>COMPLETED</code> state. Otherwise, the job is put into the <code>STOPPED</code> state.</p><p>Asynchronous batch translation jobs are started with the <a>StartTextTranslationJob</a> operation. You can use the <a>DescribeTextTranslationJob</a> or <a>ListTextTranslationJobs</a> operations to get a batch translation job's <code>JobId</code>.</p>
 
 @param request A container for the necessary parameters to execute the StopTextTranslationJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranslateStopTextTranslationJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateStopTextTranslationJobRequest
 @see AWSTranslateStopTextTranslationJobResponse
 */
- (AWSTask<AWSTranslateStopTextTranslationJobResponse *> *)stopTextTranslationJob:(AWSTranslateStopTextTranslationJobRequest *)request;

/**
 <p>Stops an asynchronous batch translation job that is in progress.</p><p>If the job's state is <code>IN_PROGRESS</code>, the job will be marked for termination and put into the <code>STOP_REQUESTED</code> state. If the job completes before it can be stopped, it is put into the <code>COMPLETED</code> state. Otherwise, the job is put into the <code>STOPPED</code> state.</p><p>Asynchronous batch translation jobs are started with the <a>StartTextTranslationJob</a> operation. You can use the <a>DescribeTextTranslationJob</a> or <a>ListTextTranslationJobs</a> operations to get a batch translation job's <code>JobId</code>.</p>
 
 @param request A container for the necessary parameters to execute the StopTextTranslationJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateStopTextTranslationJobRequest
 @see AWSTranslateStopTextTranslationJobResponse
 */
- (void)stopTextTranslationJob:(AWSTranslateStopTextTranslationJobRequest *)request completionHandler:(void (^ _Nullable)(AWSTranslateStopTextTranslationJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Translates input text from the source language to the target language. For a list of available languages and language codes, see <a>what-is-languages</a>.</p>
 
 @param request A container for the necessary parameters to execute the TranslateText service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranslateTranslateTextResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidRequest`, `AWSTranslateErrorTextSizeLimitExceeded`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorUnsupportedLanguagePair`, `AWSTranslateErrorDetectedLanguageLowConfidence`, `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorInternalServer`, `AWSTranslateErrorServiceUnavailable`.
 
 @see AWSTranslateTranslateTextRequest
 @see AWSTranslateTranslateTextResponse
 */
- (AWSTask<AWSTranslateTranslateTextResponse *> *)translateText:(AWSTranslateTranslateTextRequest *)request;

/**
 <p>Translates input text from the source language to the target language. For a list of available languages and language codes, see <a>what-is-languages</a>.</p>
 
 @param request A container for the necessary parameters to execute the TranslateText service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidRequest`, `AWSTranslateErrorTextSizeLimitExceeded`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorUnsupportedLanguagePair`, `AWSTranslateErrorDetectedLanguageLowConfidence`, `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorInternalServer`, `AWSTranslateErrorServiceUnavailable`.
 
 @see AWSTranslateTranslateTextRequest
 @see AWSTranslateTranslateTextResponse
 */
- (void)translateText:(AWSTranslateTranslateTextRequest *)request completionHandler:(void (^ _Nullable)(AWSTranslateTranslateTextResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
