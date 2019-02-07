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
 <p>Translates input text from the source language to the target language. It is not necessary to use English (en) as either the source or the target language but not all language combinations are supported by Amazon Translate. For more information, see <a href="http://docs.aws.amazon.com/translate/latest/dg/pairs.html">Supported Language Pairs</a>.</p><ul><li><p>Arabic (ar)</p></li><li><p>Chinese (Simplified) (zh)</p></li><li><p>Chinese (Traditional) (zh-TW)</p></li><li><p>Czech (cs)</p></li><li><p>Danish (da)</p></li><li><p>Dutch (nl)</p></li><li><p>English (en)</p></li><li><p>Finnish (fi)</p></li><li><p>French (fr)</p></li><li><p>German (de)</p></li><li><p>Hebrew (he)</p></li><li><p>Indonesian (id)</p></li><li><p>Italian (it)</p></li><li><p>Japanese (ja)</p></li><li><p>Korean (ko)</p></li><li><p>Polish (pl)</p></li><li><p>Portuguese (pt)</p></li><li><p>Russian (ru)</p></li><li><p>Spanish (es)</p></li><li><p>Swedish (sv)</p></li><li><p>Turkish (tr)</p></li></ul><p>To have Amazon Translate determine the source language of your text, you can specify <code>auto</code> in the <code>SourceLanguageCode</code> field. If you specify <code>auto</code>, Amazon Translate will call Amazon Comprehend to determine the source language.</p>
 
 @param request A container for the necessary parameters to execute the TranslateText service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranslateTranslateTextResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidRequest`, `AWSTranslateErrorTextSizeLimitExceeded`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorUnsupportedLanguagePair`, `AWSTranslateErrorDetectedLanguageLowConfidence`, `AWSTranslateErrorResourceNotFound`, `AWSTranslateErrorInternalServer`, `AWSTranslateErrorServiceUnavailable`.
 
 @see AWSTranslateTranslateTextRequest
 @see AWSTranslateTranslateTextResponse
 */
- (AWSTask<AWSTranslateTranslateTextResponse *> *)translateText:(AWSTranslateTranslateTextRequest *)request;

/**
 <p>Translates input text from the source language to the target language. It is not necessary to use English (en) as either the source or the target language but not all language combinations are supported by Amazon Translate. For more information, see <a href="http://docs.aws.amazon.com/translate/latest/dg/pairs.html">Supported Language Pairs</a>.</p><ul><li><p>Arabic (ar)</p></li><li><p>Chinese (Simplified) (zh)</p></li><li><p>Chinese (Traditional) (zh-TW)</p></li><li><p>Czech (cs)</p></li><li><p>Danish (da)</p></li><li><p>Dutch (nl)</p></li><li><p>English (en)</p></li><li><p>Finnish (fi)</p></li><li><p>French (fr)</p></li><li><p>German (de)</p></li><li><p>Hebrew (he)</p></li><li><p>Indonesian (id)</p></li><li><p>Italian (it)</p></li><li><p>Japanese (ja)</p></li><li><p>Korean (ko)</p></li><li><p>Polish (pl)</p></li><li><p>Portuguese (pt)</p></li><li><p>Russian (ru)</p></li><li><p>Spanish (es)</p></li><li><p>Swedish (sv)</p></li><li><p>Turkish (tr)</p></li></ul><p>To have Amazon Translate determine the source language of your text, you can specify <code>auto</code> in the <code>SourceLanguageCode</code> field. If you specify <code>auto</code>, Amazon Translate will call Amazon Comprehend to determine the source language.</p>
 
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
