//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSLexModel.h"
#import "AWSLexResources.h"

NS_ASSUME_NONNULL_BEGIN

/**
 <p>Amazon Lex provides both build and run time endpoints. Each endpoint provides a set of operations (API). Your application uses the runtime API to understand user utterances (user input text or voice). For example, suppose user says "I want pizza", your application sends this input to Amazon Lex using the runtime API. Amazon Lex recognizes user request is for "OrderPizza" intent (one of the intents defined in the application). The service then engages in user conversation on behalf of the application to to elicit required information (slot values, such as pizza size and crust type), and then performs fultillment activity (that you configured at the time of creating the application). You use the build-time API to create and manage your Amazon Lex applications. For a list of build-time operations, see . </p>
 */
@interface AWSLex : AWSService

/**
 The service configuration used to instantiate this service client.
 
 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 */
@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

/**
 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`
 
 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
         AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration

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

     let Lex = AWSLex.defaultLex()

 *Objective-C*

     AWSLex *Lex = [AWSLex defaultLex];

 @return The default service client.
 */
+ (instancetype)defaultLex;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSLex.registerLexWithConfiguration(configuration, forKey: "USWest2Lex")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSLex registerLexWithConfiguration:configuration forKey:@"USWest2Lex"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Lex = AWSLex(forKey: "USWest2Lex")

 *Objective-C*

     AWSLex *Lex = [AWSLex LexForKey:@"USWest2Lex"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerLexWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerLexWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSLex.registerLexWithConfiguration(configuration, forKey: "USWest2Lex")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSLex registerLexWithConfiguration:configuration forKey:@"USWest2Lex"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Lex = AWSLex(forKey: "USWest2Lex")

 *Objective-C*

     AWSLex *Lex = [AWSLex LexForKey:@"USWest2Lex"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)LexForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeLexForKey:(NSString *)key;

/**
 <p>Sends user input (speech or text), at runtime, to Amazon Lex. Lex uses the machine learning model (built for the specific application), to interpret user speech. </p><note><p> When building Lex text bots, you can use the <code>PostText</code> API, which supports response cards. When building Lex bots that communicate by speech alone or by speech and text both, you use the this API. </p></note><p> In response, Lex returns the next <code>message</code> to convey to the user and the message type (<code>dialogState</code>). Based on the user interaction context, Lex knows the message to return and the message type indicates whether to expect a user response for that message. For example, consider the following response messages: </p><ul><li><p>"What pizza toppings would you like?" - For this message, the <code>dialogState</code> would be <code>ElicitSlot</code> (that is, user response is expected). </p></li><li><p>"Your order has been placed." - For this message, Lex returns one of the following dialog states depending on how the fulfillment is configured for the intent (see <code>fulfillmentActivity</code> in ). </p><ul><li><p><code>FulFilled</code> - If the intent <code>fulfillmentActivity</code> is configured with a Lambda function to fulfill the intent. </p></li><li><p><code>ReadyForFulfilment</code> - If the intent's <code>fulfillmentActivity</code> is configured to simply return the intent data back to the client application. </p></li></ul></li></ul>
 
 @param request A container for the necessary parameters to execute the PostContent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexPostContentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexErrorDomain` domain and the following error code: `AWSLexErrorNotFound`, `AWSLexErrorBadRequest`, `AWSLexErrorLimitExceeded`, `AWSLexErrorInternalFailure`, `AWSLexErrorConflict`, `AWSLexErrorUnsupportedMediaType`, `AWSLexErrorNotAcceptable`, `AWSLexErrorRequestTimeout`, `AWSLexErrorDependencyFailed`, `AWSLexErrorBadGateway`, `AWSLexErrorLoopDetected`.
 
 @see AWSLexPostContentRequest
 @see AWSLexPostContentResponse
 */
- (AWSTask<AWSLexPostContentResponse *> *)postContent:(AWSLexPostContentRequest *)request;

/**
 <p>Sends user input (speech or text), at runtime, to Amazon Lex. Lex uses the machine learning model (built for the specific application), to interpret user speech. </p><note><p> When building Lex text bots, you can use the <code>PostText</code> API, which supports response cards. When building Lex bots that communicate by speech alone or by speech and text both, you use the this API. </p></note><p> In response, Lex returns the next <code>message</code> to convey to the user and the message type (<code>dialogState</code>). Based on the user interaction context, Lex knows the message to return and the message type indicates whether to expect a user response for that message. For example, consider the following response messages: </p><ul><li><p>"What pizza toppings would you like?" - For this message, the <code>dialogState</code> would be <code>ElicitSlot</code> (that is, user response is expected). </p></li><li><p>"Your order has been placed." - For this message, Lex returns one of the following dialog states depending on how the fulfillment is configured for the intent (see <code>fulfillmentActivity</code> in ). </p><ul><li><p><code>FulFilled</code> - If the intent <code>fulfillmentActivity</code> is configured with a Lambda function to fulfill the intent. </p></li><li><p><code>ReadyForFulfilment</code> - If the intent's <code>fulfillmentActivity</code> is configured to simply return the intent data back to the client application. </p></li></ul></li></ul>
 
 @param request A container for the necessary parameters to execute the PostContent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexErrorDomain` domain and the following error code: `AWSLexErrorNotFound`, `AWSLexErrorBadRequest`, `AWSLexErrorLimitExceeded`, `AWSLexErrorInternalFailure`, `AWSLexErrorConflict`, `AWSLexErrorUnsupportedMediaType`, `AWSLexErrorNotAcceptable`, `AWSLexErrorRequestTimeout`, `AWSLexErrorDependencyFailed`, `AWSLexErrorBadGateway`, `AWSLexErrorLoopDetected`.
 
 @see AWSLexPostContentRequest
 @see AWSLexPostContentResponse
 */
- (void)postContent:(AWSLexPostContentRequest *)request completionHandler:(void (^ _Nullable)(AWSLexPostContentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sends user input text, at runtime, to Amazon Lex. Lex uses the machine learning model that the service built for the application to interpret user input. </p><p> In response, Lex returns the next message to convey to the user (based on the context of the user interaction) and whether to expect user response for the message (<code>dialogState</code>). For example, consider the following response messages: </p><ul><li><p>"What pizza toppings would you like?" - In this case, the <code>dialogState</code> would be <code>ElicitSlot</code> (that is, user response is expected). </p></li><li><p>"Your order has been placed." - In this case, Lex returns one of the following <code>dialogState</code> depending on how the intent fulfillment is configured (see <code>fulfillmentActivity</code> in ). </p><ul><li><p><code>FulFilled</code> - If the intent fulfillment is configured through a Lambda function. </p></li><li><p><code>ReadyForFulfilment</code> if the intent's <code>fulfillmentActivity</code> is to simply return the intent data back to the client application. </p></li></ul></li></ul>
 
 @param request A container for the necessary parameters to execute the PostText service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexPostTextResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexErrorDomain` domain and the following error code: `AWSLexErrorNotFound`, `AWSLexErrorBadRequest`, `AWSLexErrorLimitExceeded`, `AWSLexErrorInternalFailure`, `AWSLexErrorConflict`, `AWSLexErrorDependencyFailed`, `AWSLexErrorBadGateway`, `AWSLexErrorLoopDetected`.
 
 @see AWSLexPostTextRequest
 @see AWSLexPostTextResponse
 */
- (AWSTask<AWSLexPostTextResponse *> *)postText:(AWSLexPostTextRequest *)request;

/**
 <p>Sends user input text, at runtime, to Amazon Lex. Lex uses the machine learning model that the service built for the application to interpret user input. </p><p> In response, Lex returns the next message to convey to the user (based on the context of the user interaction) and whether to expect user response for the message (<code>dialogState</code>). For example, consider the following response messages: </p><ul><li><p>"What pizza toppings would you like?" - In this case, the <code>dialogState</code> would be <code>ElicitSlot</code> (that is, user response is expected). </p></li><li><p>"Your order has been placed." - In this case, Lex returns one of the following <code>dialogState</code> depending on how the intent fulfillment is configured (see <code>fulfillmentActivity</code> in ). </p><ul><li><p><code>FulFilled</code> - If the intent fulfillment is configured through a Lambda function. </p></li><li><p><code>ReadyForFulfilment</code> if the intent's <code>fulfillmentActivity</code> is to simply return the intent data back to the client application. </p></li></ul></li></ul>
 
 @param request A container for the necessary parameters to execute the PostText service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexErrorDomain` domain and the following error code: `AWSLexErrorNotFound`, `AWSLexErrorBadRequest`, `AWSLexErrorLimitExceeded`, `AWSLexErrorInternalFailure`, `AWSLexErrorConflict`, `AWSLexErrorDependencyFailed`, `AWSLexErrorBadGateway`, `AWSLexErrorLoopDetected`.
 
 @see AWSLexPostTextRequest
 @see AWSLexPostTextResponse
 */
- (void)postText:(AWSLexPostTextRequest *)request completionHandler:(void (^ _Nullable)(AWSLexPostTextResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
