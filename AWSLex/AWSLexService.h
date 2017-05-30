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
#import "AWSLexModel.h"
#import "AWSLexResources.h"

NS_ASSUME_NONNULL_BEGIN

/**
 <p>Amazon Lex provides both build and runtime endpoints. Each endpoint provides a set of operations (API). Your conversational bot uses the runtime API to understand user utterances (user input text or voice). For example, suppose a user says "I want pizza", your bot sends this input to Amazon Lex using the runtime API. Amazon Lex recognizes that the user request is for the OrderPizza intent (one of the intents defined in the bot). Then Amazon Lex engages in user conversation on behalf of the bot to elicit required information (slot values, such as pizza size and crust type), and then performs fulfillment activity (that you configured when you created the bot). You use the build-time API to create and manage your Amazon Lex bot. For a list of build-time operations, see the build-time API, . </p>
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

     let Lex = AWSLex.default()

 *Objective-C*

     AWSLex *Lex = [AWSLex defaultLex];

 @return The default service client.
 */
+ (instancetype)defaultLex;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSLex.register(with: configuration!, forKey: "USWest2Lex")
 
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

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSLex.register(with: configuration!, forKey: "USWest2Lex")
 
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
 <p> Sends user input (text or speech) to Amazon Lex. Clients use this API to send requests to Amazon Lex at runtime. Amazon Lex interprets the user input using the machine learning model that it built for the bot. </p><p> In response, Amazon Lex returns the next message to convey to the user. Consider the following example messages: </p><ul><li><p> For a user input "I would like a pizza," Amazon Lex might return a response with a message eliciting slot data (for example, <code>PizzaSize</code>): "What size pizza would you like?". </p></li><li><p> After the user provides all of the pizza order information, Amazon Lex might return a response with a message to get user confirmation: "Order the pizza?". </p></li><li><p> After the user replies "Yes" to the confirmation prompt, Amazon Lex might return a conclusion statement: "Thank you, your cheese pizza has been ordered.". </p></li></ul><p> Not all Amazon Lex messages require a response from the user. For example, conclusion statements do not require a response. Some messages require only a yes or no response. In addition to the <code>message</code>, Amazon Lex provides additional context about the message in the response that you can use to enhance client behavior, such as displaying the appropriate client user interface. Consider the following examples: </p><ul><li><p> If the message is to elicit slot data, Amazon Lex returns the following context information: </p><ul><li><p><code>x-amz-lex-dialog-state</code> header set to <code>ElicitSlot</code></p></li><li><p><code>x-amz-lex-intent-name</code> header set to the intent name in the current context </p></li><li><p><code>x-amz-lex-slot-to-elicit</code> header set to the slot name for which the <code>message</code> is eliciting information </p></li><li><p><code>x-amz-lex-slots</code> header set to a map of slots configured for the intent with their current values </p></li></ul></li><li><p> If the message is a confirmation prompt, the <code>x-amz-lex-dialog-state</code> header is set to <code>Confirmation</code> and the <code>x-amz-lex-slot-to-elicit</code> header is omitted. </p></li><li><p> If the message is a clarification prompt configured for the intent, indicating that the user intent is not understood, the <code>x-amz-dialog-state</code> header is set to <code>ElicitIntent</code> and the <code>x-amz-slot-to-elicit</code> header is omitted. </p></li></ul><p> In addition, Amazon Lex also returns your application-specific <code>sessionAttributes</code>. For more information, see <a href="http://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html">Managing Conversation Context</a>. </p>
 
 @param request A container for the necessary parameters to execute the PostContent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexPostContentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexErrorDomain` domain and the following error code: `AWSLexErrorNotFound`, `AWSLexErrorBadRequest`, `AWSLexErrorLimitExceeded`, `AWSLexErrorInternalFailure`, `AWSLexErrorConflict`, `AWSLexErrorUnsupportedMediaType`, `AWSLexErrorNotAcceptable`, `AWSLexErrorRequestTimeout`, `AWSLexErrorDependencyFailed`, `AWSLexErrorBadGateway`, `AWSLexErrorLoopDetected`.
 
 @see AWSLexPostContentRequest
 @see AWSLexPostContentResponse
 */
- (AWSTask<AWSLexPostContentResponse *> *)postContent:(AWSLexPostContentRequest *)request;

/**
 <p> Sends user input (text or speech) to Amazon Lex. Clients use this API to send requests to Amazon Lex at runtime. Amazon Lex interprets the user input using the machine learning model that it built for the bot. </p><p> In response, Amazon Lex returns the next message to convey to the user. Consider the following example messages: </p><ul><li><p> For a user input "I would like a pizza," Amazon Lex might return a response with a message eliciting slot data (for example, <code>PizzaSize</code>): "What size pizza would you like?". </p></li><li><p> After the user provides all of the pizza order information, Amazon Lex might return a response with a message to get user confirmation: "Order the pizza?". </p></li><li><p> After the user replies "Yes" to the confirmation prompt, Amazon Lex might return a conclusion statement: "Thank you, your cheese pizza has been ordered.". </p></li></ul><p> Not all Amazon Lex messages require a response from the user. For example, conclusion statements do not require a response. Some messages require only a yes or no response. In addition to the <code>message</code>, Amazon Lex provides additional context about the message in the response that you can use to enhance client behavior, such as displaying the appropriate client user interface. Consider the following examples: </p><ul><li><p> If the message is to elicit slot data, Amazon Lex returns the following context information: </p><ul><li><p><code>x-amz-lex-dialog-state</code> header set to <code>ElicitSlot</code></p></li><li><p><code>x-amz-lex-intent-name</code> header set to the intent name in the current context </p></li><li><p><code>x-amz-lex-slot-to-elicit</code> header set to the slot name for which the <code>message</code> is eliciting information </p></li><li><p><code>x-amz-lex-slots</code> header set to a map of slots configured for the intent with their current values </p></li></ul></li><li><p> If the message is a confirmation prompt, the <code>x-amz-lex-dialog-state</code> header is set to <code>Confirmation</code> and the <code>x-amz-lex-slot-to-elicit</code> header is omitted. </p></li><li><p> If the message is a clarification prompt configured for the intent, indicating that the user intent is not understood, the <code>x-amz-dialog-state</code> header is set to <code>ElicitIntent</code> and the <code>x-amz-slot-to-elicit</code> header is omitted. </p></li></ul><p> In addition, Amazon Lex also returns your application-specific <code>sessionAttributes</code>. For more information, see <a href="http://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html">Managing Conversation Context</a>. </p>
 
 @param request A container for the necessary parameters to execute the PostContent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexErrorDomain` domain and the following error code: `AWSLexErrorNotFound`, `AWSLexErrorBadRequest`, `AWSLexErrorLimitExceeded`, `AWSLexErrorInternalFailure`, `AWSLexErrorConflict`, `AWSLexErrorUnsupportedMediaType`, `AWSLexErrorNotAcceptable`, `AWSLexErrorRequestTimeout`, `AWSLexErrorDependencyFailed`, `AWSLexErrorBadGateway`, `AWSLexErrorLoopDetected`.
 
 @see AWSLexPostContentRequest
 @see AWSLexPostContentResponse
 */
- (void)postContent:(AWSLexPostContentRequest *)request completionHandler:(void (^ _Nullable)(AWSLexPostContentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sends user input (text-only) to Amazon Lex. Client applications can use this API to send requests to Amazon Lex at runtime. Amazon Lex then interprets the user input using the machine learning model it built for the bot. </p><p> In response, Amazon Lex returns the next <code>message</code> to convey to the user an optional <code>responseCard</code> to display. Consider the following example messages: </p><ul><li><p> For a user input "I would like a pizza", Amazon Lex might return a response with a message eliciting slot data (for example, PizzaSize): "What size pizza would you like?" </p></li><li><p> After the user provides all of the pizza order information, Amazon Lex might return a response with a message to obtain user confirmation "Proceed with the pizza order?". </p></li><li><p> After the user replies to a confirmation prompt with a "yes", Amazon Lex might return a conclusion statement: "Thank you, your cheese pizza has been ordered.". </p></li></ul><p> Not all Amazon Lex messages require a user response. For example, a conclusion statement does not require a response. Some messages require only a "yes" or "no" user response. In addition to the <code>message</code>, Amazon Lex provides additional context about the message in the response that you might use to enhance client behavior, for example, to display the appropriate client user interface. These are the <code>slotToElicit</code>, <code>dialogState</code>, <code>intentName</code>, and <code>slots</code> fields in the response. Consider the following examples: </p><ul><li><p>If the message is to elicit slot data, Amazon Lex returns the following context information:</p><ul><li><p><code>dialogState</code> set to ElicitSlot </p></li><li><p><code>intentName</code> set to the intent name in the current context </p></li><li><p><code>slotToElicit</code> set to the slot name for which the <code>message</code> is eliciting information </p></li><li><p><code>slots</code> set to a map of slots, configured for the intent, with currently known values </p></li></ul></li><li><p> If the message is a confirmation prompt, the <code>dialogState</code> is set to ConfirmIntent and <code>SlotToElicit</code> is set to null. </p></li><li><p>If the message is a clarification prompt (configured for the intent) that indicates that user intent is not understood, the <code>dialogState</code> is set to ElicitIntent and <code>slotToElicit</code> is set to null. </p></li></ul><p> In addition, Amazon Lex also returns your application-specific <code>sessionAttributes</code>. For more information, see <a href="http://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html">Managing Conversation Context</a>. </p>
 
 @param request A container for the necessary parameters to execute the PostText service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexPostTextResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexErrorDomain` domain and the following error code: `AWSLexErrorNotFound`, `AWSLexErrorBadRequest`, `AWSLexErrorLimitExceeded`, `AWSLexErrorInternalFailure`, `AWSLexErrorConflict`, `AWSLexErrorDependencyFailed`, `AWSLexErrorBadGateway`, `AWSLexErrorLoopDetected`.
 
 @see AWSLexPostTextRequest
 @see AWSLexPostTextResponse
 */
- (AWSTask<AWSLexPostTextResponse *> *)postText:(AWSLexPostTextRequest *)request;

/**
 <p>Sends user input (text-only) to Amazon Lex. Client applications can use this API to send requests to Amazon Lex at runtime. Amazon Lex then interprets the user input using the machine learning model it built for the bot. </p><p> In response, Amazon Lex returns the next <code>message</code> to convey to the user an optional <code>responseCard</code> to display. Consider the following example messages: </p><ul><li><p> For a user input "I would like a pizza", Amazon Lex might return a response with a message eliciting slot data (for example, PizzaSize): "What size pizza would you like?" </p></li><li><p> After the user provides all of the pizza order information, Amazon Lex might return a response with a message to obtain user confirmation "Proceed with the pizza order?". </p></li><li><p> After the user replies to a confirmation prompt with a "yes", Amazon Lex might return a conclusion statement: "Thank you, your cheese pizza has been ordered.". </p></li></ul><p> Not all Amazon Lex messages require a user response. For example, a conclusion statement does not require a response. Some messages require only a "yes" or "no" user response. In addition to the <code>message</code>, Amazon Lex provides additional context about the message in the response that you might use to enhance client behavior, for example, to display the appropriate client user interface. These are the <code>slotToElicit</code>, <code>dialogState</code>, <code>intentName</code>, and <code>slots</code> fields in the response. Consider the following examples: </p><ul><li><p>If the message is to elicit slot data, Amazon Lex returns the following context information:</p><ul><li><p><code>dialogState</code> set to ElicitSlot </p></li><li><p><code>intentName</code> set to the intent name in the current context </p></li><li><p><code>slotToElicit</code> set to the slot name for which the <code>message</code> is eliciting information </p></li><li><p><code>slots</code> set to a map of slots, configured for the intent, with currently known values </p></li></ul></li><li><p> If the message is a confirmation prompt, the <code>dialogState</code> is set to ConfirmIntent and <code>SlotToElicit</code> is set to null. </p></li><li><p>If the message is a clarification prompt (configured for the intent) that indicates that user intent is not understood, the <code>dialogState</code> is set to ElicitIntent and <code>slotToElicit</code> is set to null. </p></li></ul><p> In addition, Amazon Lex also returns your application-specific <code>sessionAttributes</code>. For more information, see <a href="http://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html">Managing Conversation Context</a>. </p>
 
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
