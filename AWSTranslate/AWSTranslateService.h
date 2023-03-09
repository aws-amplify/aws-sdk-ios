//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
 <p>Provides translation of the input content from the source language to the target language.</p>
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
 <p>Creates a parallel data resource in Amazon Translate by importing an input file from Amazon S3. Parallel data files contain examples that show how you want segments of text to be translated. By adding parallel data, you can influence the style, tone, and word choice in your translation output.</p>
 
 @param request A container for the necessary parameters to execute the CreateParallelData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranslateCreateParallelDataResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorInvalidRequest`, `AWSTranslateErrorLimitExceeded`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorTooManyTags`, `AWSTranslateErrorConflict`, `AWSTranslateErrorConcurrentModification`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateCreateParallelDataRequest
 @see AWSTranslateCreateParallelDataResponse
 */
- (AWSTask<AWSTranslateCreateParallelDataResponse *> *)createParallelData:(AWSTranslateCreateParallelDataRequest *)request;

/**
 <p>Creates a parallel data resource in Amazon Translate by importing an input file from Amazon S3. Parallel data files contain examples that show how you want segments of text to be translated. By adding parallel data, you can influence the style, tone, and word choice in your translation output.</p>
 
 @param request A container for the necessary parameters to execute the CreateParallelData service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorInvalidRequest`, `AWSTranslateErrorLimitExceeded`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorTooManyTags`, `AWSTranslateErrorConflict`, `AWSTranslateErrorConcurrentModification`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateCreateParallelDataRequest
 @see AWSTranslateCreateParallelDataResponse
 */
- (void)createParallelData:(AWSTranslateCreateParallelDataRequest *)request completionHandler:(void (^ _Nullable)(AWSTranslateCreateParallelDataResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a parallel data resource in Amazon Translate.</p>
 
 @param request A container for the necessary parameters to execute the DeleteParallelData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranslateDeleteParallelDataResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorConcurrentModification`, `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateDeleteParallelDataRequest
 @see AWSTranslateDeleteParallelDataResponse
 */
- (AWSTask<AWSTranslateDeleteParallelDataResponse *> *)deleteParallelData:(AWSTranslateDeleteParallelDataRequest *)request;

/**
 <p>Deletes a parallel data resource in Amazon Translate.</p>
 
 @param request A container for the necessary parameters to execute the DeleteParallelData service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorConcurrentModification`, `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateDeleteParallelDataRequest
 @see AWSTranslateDeleteParallelDataResponse
 */
- (void)deleteParallelData:(AWSTranslateDeleteParallelDataRequest *)request completionHandler:(void (^ _Nullable)(AWSTranslateDeleteParallelDataResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>A synchronous action that deletes a custom terminology.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTerminology service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateDeleteTerminologyRequest
 */
- (AWSTask *)deleteTerminology:(AWSTranslateDeleteTerminologyRequest *)request;

/**
 <p>A synchronous action that deletes a custom terminology.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTerminology service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateDeleteTerminologyRequest
 */
- (void)deleteTerminology:(AWSTranslateDeleteTerminologyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Gets the properties associated with an asynchronous batch translation job including name, ID, status, source and target languages, input/output S3 buckets, and so on.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTextTranslationJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranslateDescribeTextTranslationJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateDescribeTextTranslationJobRequest
 @see AWSTranslateDescribeTextTranslationJobResponse
 */
- (AWSTask<AWSTranslateDescribeTextTranslationJobResponse *> *)describeTextTranslationJob:(AWSTranslateDescribeTextTranslationJobRequest *)request;

/**
 <p>Gets the properties associated with an asynchronous batch translation job including name, ID, status, source and target languages, input/output S3 buckets, and so on.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTextTranslationJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateDescribeTextTranslationJobRequest
 @see AWSTranslateDescribeTextTranslationJobResponse
 */
- (void)describeTextTranslationJob:(AWSTranslateDescribeTextTranslationJobRequest *)request completionHandler:(void (^ _Nullable)(AWSTranslateDescribeTextTranslationJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about a parallel data resource.</p>
 
 @param request A container for the necessary parameters to execute the GetParallelData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranslateGetParallelDataResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateGetParallelDataRequest
 @see AWSTranslateGetParallelDataResponse
 */
- (AWSTask<AWSTranslateGetParallelDataResponse *> *)getParallelData:(AWSTranslateGetParallelDataRequest *)request;

/**
 <p>Provides information about a parallel data resource.</p>
 
 @param request A container for the necessary parameters to execute the GetParallelData service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateGetParallelDataRequest
 @see AWSTranslateGetParallelDataResponse
 */
- (void)getParallelData:(AWSTranslateGetParallelDataRequest *)request completionHandler:(void (^ _Nullable)(AWSTranslateGetParallelDataResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Creates or updates a custom terminology, depending on whether one already exists for the given terminology name. Importing a terminology with the same name as an existing one will merge the terminologies based on the chosen merge strategy. The only supported merge strategy is OVERWRITE, where the imported terminology overwrites the existing terminology of the same name.</p><p>If you import a terminology that overwrites an existing one, the new terminology takes up to 10 minutes to fully propagate. After that, translations have access to the new terminology.</p>
 
 @param request A container for the necessary parameters to execute the ImportTerminology service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranslateImportTerminologyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorLimitExceeded`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorTooManyTags`, `AWSTranslateErrorConcurrentModification`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateImportTerminologyRequest
 @see AWSTranslateImportTerminologyResponse
 */
- (AWSTask<AWSTranslateImportTerminologyResponse *> *)importTerminology:(AWSTranslateImportTerminologyRequest *)request;

/**
 <p>Creates or updates a custom terminology, depending on whether one already exists for the given terminology name. Importing a terminology with the same name as an existing one will merge the terminologies based on the chosen merge strategy. The only supported merge strategy is OVERWRITE, where the imported terminology overwrites the existing terminology of the same name.</p><p>If you import a terminology that overwrites an existing one, the new terminology takes up to 10 minutes to fully propagate. After that, translations have access to the new terminology.</p>
 
 @param request A container for the necessary parameters to execute the ImportTerminology service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorLimitExceeded`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorTooManyTags`, `AWSTranslateErrorConcurrentModification`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateImportTerminologyRequest
 @see AWSTranslateImportTerminologyResponse
 */
- (void)importTerminology:(AWSTranslateImportTerminologyRequest *)request completionHandler:(void (^ _Nullable)(AWSTranslateImportTerminologyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of languages (RFC-5646 codes and names) that Amazon Translate supports.</p>
 
 @param request A container for the necessary parameters to execute the ListLanguages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranslateListLanguagesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorUnsupportedDisplayLanguageCode`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateListLanguagesRequest
 @see AWSTranslateListLanguagesResponse
 */
- (AWSTask<AWSTranslateListLanguagesResponse *> *)listLanguages:(AWSTranslateListLanguagesRequest *)request;

/**
 <p>Provides a list of languages (RFC-5646 codes and names) that Amazon Translate supports.</p>
 
 @param request A container for the necessary parameters to execute the ListLanguages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorUnsupportedDisplayLanguageCode`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateListLanguagesRequest
 @see AWSTranslateListLanguagesResponse
 */
- (void)listLanguages:(AWSTranslateListLanguagesRequest *)request completionHandler:(void (^ _Nullable)(AWSTranslateListLanguagesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of your parallel data resources in Amazon Translate.</p>
 
 @param request A container for the necessary parameters to execute the ListParallelData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranslateListParallelDataResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateListParallelDataRequest
 @see AWSTranslateListParallelDataResponse
 */
- (AWSTask<AWSTranslateListParallelDataResponse *> *)listParallelData:(AWSTranslateListParallelDataRequest *)request;

/**
 <p>Provides a list of your parallel data resources in Amazon Translate.</p>
 
 @param request A container for the necessary parameters to execute the ListParallelData service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateListParallelDataRequest
 @see AWSTranslateListParallelDataResponse
 */
- (void)listParallelData:(AWSTranslateListParallelDataRequest *)request completionHandler:(void (^ _Nullable)(AWSTranslateListParallelDataResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all tags associated with a given Amazon Translate resource. For more information, see <a href="https://docs.aws.amazon.com/translate/latest/dg/tagging.html"> Tagging your resources</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranslateListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateListTagsForResourceRequest
 @see AWSTranslateListTagsForResourceResponse
 */
- (AWSTask<AWSTranslateListTagsForResourceResponse *> *)listTagsForResource:(AWSTranslateListTagsForResourceRequest *)request;

/**
 <p>Lists all tags associated with a given Amazon Translate resource. For more information, see <a href="https://docs.aws.amazon.com/translate/latest/dg/tagging.html"> Tagging your resources</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateListTagsForResourceRequest
 @see AWSTranslateListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSTranslateListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSTranslateListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Starts an asynchronous batch translation job. Use batch translation jobs to translate large volumes of text across multiple documents at once. For batch translation, you can input documents with different source languages (specify <code>auto</code> as the source language). You can specify one or more target languages. Batch translation translates each input document into each of the target languages. For more information, see <a href="https://docs.aws.amazon.com/translate/latest/dg/async.html">Asynchronous batch processing</a>.</p><p>Batch translation jobs can be described with the <a>DescribeTextTranslationJob</a> operation, listed with the <a>ListTextTranslationJobs</a> operation, and stopped with the <a>StopTextTranslationJob</a> operation.</p>
 
 @param request A container for the necessary parameters to execute the StartTextTranslationJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranslateStartTextTranslationJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorUnsupportedLanguagePair`, `AWSTranslateErrorInvalidRequest`, `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateStartTextTranslationJobRequest
 @see AWSTranslateStartTextTranslationJobResponse
 */
- (AWSTask<AWSTranslateStartTextTranslationJobResponse *> *)startTextTranslationJob:(AWSTranslateStartTextTranslationJobRequest *)request;

/**
 <p>Starts an asynchronous batch translation job. Use batch translation jobs to translate large volumes of text across multiple documents at once. For batch translation, you can input documents with different source languages (specify <code>auto</code> as the source language). You can specify one or more target languages. Batch translation translates each input document into each of the target languages. For more information, see <a href="https://docs.aws.amazon.com/translate/latest/dg/async.html">Asynchronous batch processing</a>.</p><p>Batch translation jobs can be described with the <a>DescribeTextTranslationJob</a> operation, listed with the <a>ListTextTranslationJobs</a> operation, and stopped with the <a>StopTextTranslationJob</a> operation.</p>
 
 @param request A container for the necessary parameters to execute the StartTextTranslationJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorUnsupportedLanguagePair`, `AWSTranslateErrorInvalidRequest`, `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorInternalServer`.
 
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
 <p>Associates a specific tag with a resource. A tag is a key-value pair that adds as a metadata to a resource. For more information, see <a href="https://docs.aws.amazon.com/translate/latest/dg/tagging.html"> Tagging your resources</a>.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranslateTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorConcurrentModification`, `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorTooManyTags`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateTagResourceRequest
 @see AWSTranslateTagResourceResponse
 */
- (AWSTask<AWSTranslateTagResourceResponse *> *)tagResource:(AWSTranslateTagResourceRequest *)request;

/**
 <p>Associates a specific tag with a resource. A tag is a key-value pair that adds as a metadata to a resource. For more information, see <a href="https://docs.aws.amazon.com/translate/latest/dg/tagging.html"> Tagging your resources</a>.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorConcurrentModification`, `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorTooManyTags`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateTagResourceRequest
 @see AWSTranslateTagResourceResponse
 */
- (void)tagResource:(AWSTranslateTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSTranslateTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Translates input text from the source language to the target language. For a list of available languages and language codes, see <a href="https://docs.aws.amazon.com/translate/latest/dg/what-is-languages.html">Supported languages</a>.</p>
 
 @param request A container for the necessary parameters to execute the TranslateText service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranslateTranslateTextResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidRequest`, `AWSTranslateErrorTextSizeLimitExceeded`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorUnsupportedLanguagePair`, `AWSTranslateErrorDetectedLanguageLowConfidence`, `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorInternalServer`, `AWSTranslateErrorServiceUnavailable`.
 
 @see AWSTranslateTranslateTextRequest
 @see AWSTranslateTranslateTextResponse
 */
- (AWSTask<AWSTranslateTranslateTextResponse *> *)translateText:(AWSTranslateTranslateTextRequest *)request;

/**
 <p>Translates input text from the source language to the target language. For a list of available languages and language codes, see <a href="https://docs.aws.amazon.com/translate/latest/dg/what-is-languages.html">Supported languages</a>.</p>
 
 @param request A container for the necessary parameters to execute the TranslateText service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidRequest`, `AWSTranslateErrorTextSizeLimitExceeded`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorUnsupportedLanguagePair`, `AWSTranslateErrorDetectedLanguageLowConfidence`, `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorInternalServer`, `AWSTranslateErrorServiceUnavailable`.
 
 @see AWSTranslateTranslateTextRequest
 @see AWSTranslateTranslateTextResponse
 */
- (void)translateText:(AWSTranslateTranslateTextRequest *)request completionHandler:(void (^ _Nullable)(AWSTranslateTranslateTextResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a specific tag associated with an Amazon Translate resource. For more information, see <a href="https://docs.aws.amazon.com/translate/latest/dg/tagging.html"> Tagging your resources</a>.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranslateUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorConcurrentModification`, `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateUntagResourceRequest
 @see AWSTranslateUntagResourceResponse
 */
- (AWSTask<AWSTranslateUntagResourceResponse *> *)untagResource:(AWSTranslateUntagResourceRequest *)request;

/**
 <p>Removes a specific tag associated with an Amazon Translate resource. For more information, see <a href="https://docs.aws.amazon.com/translate/latest/dg/tagging.html"> Tagging your resources</a>.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorConcurrentModification`, `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateUntagResourceRequest
 @see AWSTranslateUntagResourceResponse
 */
- (void)untagResource:(AWSTranslateUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSTranslateUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a previously created parallel data resource by importing a new input file from Amazon S3.</p>
 
 @param request A container for the necessary parameters to execute the UpdateParallelData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranslateUpdateParallelDataResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorConcurrentModification`, `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorInvalidRequest`, `AWSTranslateErrorLimitExceeded`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorConflict`, `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateUpdateParallelDataRequest
 @see AWSTranslateUpdateParallelDataResponse
 */
- (AWSTask<AWSTranslateUpdateParallelDataResponse *> *)updateParallelData:(AWSTranslateUpdateParallelDataRequest *)request;

/**
 <p>Updates a previously created parallel data resource by importing a new input file from Amazon S3.</p>
 
 @param request A container for the necessary parameters to execute the UpdateParallelData service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorConcurrentModification`, `AWSTranslateErrorInvalidParameterValue`, `AWSTranslateErrorInvalidRequest`, `AWSTranslateErrorLimitExceeded`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorConflict`, `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorInternalServer`.
 
 @see AWSTranslateUpdateParallelDataRequest
 @see AWSTranslateUpdateParallelDataResponse
 */
- (void)updateParallelData:(AWSTranslateUpdateParallelDataRequest *)request completionHandler:(void (^ _Nullable)(AWSTranslateUpdateParallelDataResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
