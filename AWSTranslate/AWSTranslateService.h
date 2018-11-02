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
#import "AWSTranslateModel.h"
#import "AWSTranslateResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSTranslate
FOUNDATION_EXPORT NSString *const AWSTranslateSDKVersion;

/**
 <p>Provides translation between English and one of six languages, or between one of the six languages and English.</p>
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
 <p>Translates input text from the source language to the target language. You can translate between English (en) and one of the following languages, or between one of the following languages and English.</p><ul><li><p>Arabic (ar)</p></li><li><p>Chinese (Simplified) (zh)</p></li><li><p>French (fr)</p></li><li><p>German (de)</p></li><li><p>Portuguese (pt)</p></li><li><p>Spanish (es)</p></li></ul><p>To have Amazon Translate determine the source language of your text, you can specify <code>auto</code> in the <code>SourceLanguageCode</code> field. If you specify <code>auto</code>, Amazon Translate will call Amazon Comprehend to determine the source language.</p>
 
 @param request A container for the necessary parameters to execute the TranslateText service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTranslateTranslateTextResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidRequest`, `AWSTranslateErrorTextSizeLimitExceeded`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorUnsupportedLanguagePair`, `AWSTranslateErrorDetectedLanguageLowConfidence`, `AWSTranslateErrorInternalServer`, `AWSTranslateErrorServiceUnavailable`.
 
 @see AWSTranslateTranslateTextRequest
 @see AWSTranslateTranslateTextResponse
 */
- (AWSTask<AWSTranslateTranslateTextResponse *> *)translateText:(AWSTranslateTranslateTextRequest *)request;

/**
 <p>Translates input text from the source language to the target language. You can translate between English (en) and one of the following languages, or between one of the following languages and English.</p><ul><li><p>Arabic (ar)</p></li><li><p>Chinese (Simplified) (zh)</p></li><li><p>French (fr)</p></li><li><p>German (de)</p></li><li><p>Portuguese (pt)</p></li><li><p>Spanish (es)</p></li></ul><p>To have Amazon Translate determine the source language of your text, you can specify <code>auto</code> in the <code>SourceLanguageCode</code> field. If you specify <code>auto</code>, Amazon Translate will call Amazon Comprehend to determine the source language.</p>
 
 @param request A container for the necessary parameters to execute the TranslateText service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTranslateErrorDomain` domain and the following error code: `AWSTranslateErrorInvalidRequest`, `AWSTranslateErrorTextSizeLimitExceeded`, `AWSTranslateErrorTooManyRequests`, `AWSTranslateErrorUnsupportedLanguagePair`, `AWSTranslateErrorDetectedLanguageLowConfidence`, `AWSTranslateErrorInternalServer`, `AWSTranslateErrorServiceUnavailable`.
 
 @see AWSTranslateTranslateTextRequest
 @see AWSTranslateTranslateTextResponse
 */
- (void)translateText:(AWSTranslateTranslateTextRequest *)request completionHandler:(void (^ _Nullable)(AWSTranslateTranslateTextResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
