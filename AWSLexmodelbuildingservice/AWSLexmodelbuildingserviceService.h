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
#import "AWSLexmodelbuildingserviceModel.h"
#import "AWSLexmodelbuildingserviceResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSLexmodelbuildingservice
FOUNDATION_EXPORT NSString *const AWSLexmodelbuildingserviceSDKVersion;

/**
 <fullname>Amazon Lex Build-Time Actions</fullname><p> Amazon Lex is an AWS service for building conversational voice and text interfaces. Use these actions to create, update, and delete conversational bots for new and existing client applications. </p>
 */
@interface AWSLexmodelbuildingservice : AWSService

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

     let Lexmodelbuildingservice = AWSLexmodelbuildingservice.default()

 *Objective-C*

     AWSLexmodelbuildingservice *Lexmodelbuildingservice = [AWSLexmodelbuildingservice defaultLexmodelbuildingservice];

 @return The default service client.
 */
+ (instancetype)defaultLexmodelbuildingservice;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSLexmodelbuildingservice.register(with: configuration!, forKey: "USWest2Lexmodelbuildingservice")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:@"USWest2Lexmodelbuildingservice"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Lexmodelbuildingservice = AWSLexmodelbuildingservice(forKey: "USWest2Lexmodelbuildingservice")

 *Objective-C*

     AWSLexmodelbuildingservice *Lexmodelbuildingservice = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:@"USWest2Lexmodelbuildingservice"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerLexmodelbuildingserviceWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerLexmodelbuildingserviceWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSLexmodelbuildingservice.register(with: configuration!, forKey: "USWest2Lexmodelbuildingservice")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:@"USWest2Lexmodelbuildingservice"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Lexmodelbuildingservice = AWSLexmodelbuildingservice(forKey: "USWest2Lexmodelbuildingservice")

 *Objective-C*

     AWSLexmodelbuildingservice *Lexmodelbuildingservice = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:@"USWest2Lexmodelbuildingservice"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)LexmodelbuildingserviceForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeLexmodelbuildingserviceForKey:(NSString *)key;

/**
 <p>Creates a new version of the bot based on the <code>$LATEST</code> version. If the <code>$LATEST</code> version of this resource hasn't changed since you created the last version, Amazon Lex doesn't create a new version. It returns the last created version.</p><note><p>You can update only the <code>$LATEST</code> version of the bot. You can't update the numbered versions that you create with the <code>CreateBotVersion</code> operation.</p></note><p> When you create the first version of a bot, Amazon Lex sets the version to 1. Subsequent versions increment by 1. For more information, see <a>versioning-intro</a>. </p><p> This operation requires permission for the <code>lex:CreateBotVersion</code> action. </p>
 
 @param request A container for the necessary parameters to execute the CreateBotVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceCreateBotVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorPreconditionFailed`.
 
 @see AWSLexmodelbuildingserviceCreateBotVersionRequest
 @see AWSLexmodelbuildingserviceCreateBotVersionResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceCreateBotVersionResponse *> *)createBotVersion:(AWSLexmodelbuildingserviceCreateBotVersionRequest *)request;

/**
 <p>Creates a new version of the bot based on the <code>$LATEST</code> version. If the <code>$LATEST</code> version of this resource hasn't changed since you created the last version, Amazon Lex doesn't create a new version. It returns the last created version.</p><note><p>You can update only the <code>$LATEST</code> version of the bot. You can't update the numbered versions that you create with the <code>CreateBotVersion</code> operation.</p></note><p> When you create the first version of a bot, Amazon Lex sets the version to 1. Subsequent versions increment by 1. For more information, see <a>versioning-intro</a>. </p><p> This operation requires permission for the <code>lex:CreateBotVersion</code> action. </p>
 
 @param request A container for the necessary parameters to execute the CreateBotVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorPreconditionFailed`.
 
 @see AWSLexmodelbuildingserviceCreateBotVersionRequest
 @see AWSLexmodelbuildingserviceCreateBotVersionResponse
 */
- (void)createBotVersion:(AWSLexmodelbuildingserviceCreateBotVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceCreateBotVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new version of an intent based on the <code>$LATEST</code> version of the intent. If the <code>$LATEST</code> version of this intent hasn't changed since you last updated it, Amazon Lex doesn't create a new version. It returns the last version you created.</p><note><p>You can update only the <code>$LATEST</code> version of the intent. You can't update the numbered versions that you create with the <code>CreateIntentVersion</code> operation.</p></note><p> When you create a version of an intent, Amazon Lex sets the version to 1. Subsequent versions increment by 1. For more information, see <a>versioning-intro</a>. </p><p>This operation requires permissions to perform the <code>lex:CreateIntentVersion</code> action. </p>
 
 @param request A container for the necessary parameters to execute the CreateIntentVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceCreateIntentVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorPreconditionFailed`.
 
 @see AWSLexmodelbuildingserviceCreateIntentVersionRequest
 @see AWSLexmodelbuildingserviceCreateIntentVersionResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceCreateIntentVersionResponse *> *)createIntentVersion:(AWSLexmodelbuildingserviceCreateIntentVersionRequest *)request;

/**
 <p>Creates a new version of an intent based on the <code>$LATEST</code> version of the intent. If the <code>$LATEST</code> version of this intent hasn't changed since you last updated it, Amazon Lex doesn't create a new version. It returns the last version you created.</p><note><p>You can update only the <code>$LATEST</code> version of the intent. You can't update the numbered versions that you create with the <code>CreateIntentVersion</code> operation.</p></note><p> When you create a version of an intent, Amazon Lex sets the version to 1. Subsequent versions increment by 1. For more information, see <a>versioning-intro</a>. </p><p>This operation requires permissions to perform the <code>lex:CreateIntentVersion</code> action. </p>
 
 @param request A container for the necessary parameters to execute the CreateIntentVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorPreconditionFailed`.
 
 @see AWSLexmodelbuildingserviceCreateIntentVersionRequest
 @see AWSLexmodelbuildingserviceCreateIntentVersionResponse
 */
- (void)createIntentVersion:(AWSLexmodelbuildingserviceCreateIntentVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceCreateIntentVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new version of a slot type based on the <code>$LATEST</code> version of the specified slot type. If the <code>$LATEST</code> version of this resource has not changed since the last version that you created, Amazon Lex doesn't create a new version. It returns the last version that you created. </p><note><p>You can update only the <code>$LATEST</code> version of a slot type. You can't update the numbered versions that you create with the <code>CreateSlotTypeVersion</code> operation.</p></note><p>When you create a version of a slot type, Amazon Lex sets the version to 1. Subsequent versions increment by 1. For more information, see <a>versioning-intro</a>. </p><p>This operation requires permissions for the <code>lex:CreateSlotTypeVersion</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CreateSlotTypeVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceCreateSlotTypeVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorPreconditionFailed`.
 
 @see AWSLexmodelbuildingserviceCreateSlotTypeVersionRequest
 @see AWSLexmodelbuildingserviceCreateSlotTypeVersionResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceCreateSlotTypeVersionResponse *> *)createSlotTypeVersion:(AWSLexmodelbuildingserviceCreateSlotTypeVersionRequest *)request;

/**
 <p>Creates a new version of a slot type based on the <code>$LATEST</code> version of the specified slot type. If the <code>$LATEST</code> version of this resource has not changed since the last version that you created, Amazon Lex doesn't create a new version. It returns the last version that you created. </p><note><p>You can update only the <code>$LATEST</code> version of a slot type. You can't update the numbered versions that you create with the <code>CreateSlotTypeVersion</code> operation.</p></note><p>When you create a version of a slot type, Amazon Lex sets the version to 1. Subsequent versions increment by 1. For more information, see <a>versioning-intro</a>. </p><p>This operation requires permissions for the <code>lex:CreateSlotTypeVersion</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CreateSlotTypeVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorPreconditionFailed`.
 
 @see AWSLexmodelbuildingserviceCreateSlotTypeVersionRequest
 @see AWSLexmodelbuildingserviceCreateSlotTypeVersionResponse
 */
- (void)createSlotTypeVersion:(AWSLexmodelbuildingserviceCreateSlotTypeVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceCreateSlotTypeVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes all versions of the bot, including the <code>$LATEST</code> version. To delete a specific version of the bot, use the <a>DeleteBotVersion</a> operation. The <code>DeleteBot</code> operation doesn't immediately remove the bot schema. Instead, it is marked for deletion and removed later.</p><p>Amazon Lex stores utterances indefinitely for improving the ability of your bot to respond to user inputs. These utterances are not removed when the bot is deleted. To remove the utterances, use the <a>DeleteUtterances</a> operation.</p><p>If a bot has an alias, you can't delete it. Instead, the <code>DeleteBot</code> operation returns a <code>ResourceInUseException</code> exception that includes a reference to the alias that refers to the bot. To remove the reference to the bot, delete the alias. If you get the same exception again, delete the referring alias until the <code>DeleteBot</code> operation is successful.</p><p>This operation requires permissions for the <code>lex:DeleteBot</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorResourceInUse`.
 
 @see AWSLexmodelbuildingserviceDeleteBotRequest
 */
- (AWSTask *)deleteBot:(AWSLexmodelbuildingserviceDeleteBotRequest *)request;

/**
 <p>Deletes all versions of the bot, including the <code>$LATEST</code> version. To delete a specific version of the bot, use the <a>DeleteBotVersion</a> operation. The <code>DeleteBot</code> operation doesn't immediately remove the bot schema. Instead, it is marked for deletion and removed later.</p><p>Amazon Lex stores utterances indefinitely for improving the ability of your bot to respond to user inputs. These utterances are not removed when the bot is deleted. To remove the utterances, use the <a>DeleteUtterances</a> operation.</p><p>If a bot has an alias, you can't delete it. Instead, the <code>DeleteBot</code> operation returns a <code>ResourceInUseException</code> exception that includes a reference to the alias that refers to the bot. To remove the reference to the bot, delete the alias. If you get the same exception again, delete the referring alias until the <code>DeleteBot</code> operation is successful.</p><p>This operation requires permissions for the <code>lex:DeleteBot</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorResourceInUse`.
 
 @see AWSLexmodelbuildingserviceDeleteBotRequest
 */
- (void)deleteBot:(AWSLexmodelbuildingserviceDeleteBotRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an alias for the specified bot. </p><p>You can't delete an alias that is used in the association between a bot and a messaging channel. If an alias is used in a channel association, the <code>DeleteBot</code> operation returns a <code>ResourceInUseException</code> exception that includes a reference to the channel association that refers to the bot. You can remove the reference to the alias by deleting the channel association. If you get the same exception again, delete the referring association until the <code>DeleteBotAlias</code> operation is successful.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBotAlias service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorResourceInUse`.
 
 @see AWSLexmodelbuildingserviceDeleteBotAliasRequest
 */
- (AWSTask *)deleteBotAlias:(AWSLexmodelbuildingserviceDeleteBotAliasRequest *)request;

/**
 <p>Deletes an alias for the specified bot. </p><p>You can't delete an alias that is used in the association between a bot and a messaging channel. If an alias is used in a channel association, the <code>DeleteBot</code> operation returns a <code>ResourceInUseException</code> exception that includes a reference to the channel association that refers to the bot. You can remove the reference to the alias by deleting the channel association. If you get the same exception again, delete the referring association until the <code>DeleteBotAlias</code> operation is successful.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBotAlias service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorResourceInUse`.
 
 @see AWSLexmodelbuildingserviceDeleteBotAliasRequest
 */
- (void)deleteBotAlias:(AWSLexmodelbuildingserviceDeleteBotAliasRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the association between an Amazon Lex bot and a messaging platform.</p><p>This operation requires permission for the <code>lex:DeleteBotChannelAssociation</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBotChannelAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceDeleteBotChannelAssociationRequest
 */
- (AWSTask *)deleteBotChannelAssociation:(AWSLexmodelbuildingserviceDeleteBotChannelAssociationRequest *)request;

/**
 <p>Deletes the association between an Amazon Lex bot and a messaging platform.</p><p>This operation requires permission for the <code>lex:DeleteBotChannelAssociation</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBotChannelAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceDeleteBotChannelAssociationRequest
 */
- (void)deleteBotChannelAssociation:(AWSLexmodelbuildingserviceDeleteBotChannelAssociationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specific version of a bot. To delete all versions of a bot, use the <a>DeleteBot</a> operation. </p><p>This operation requires permissions for the <code>lex:DeleteBotVersion</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBotVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorResourceInUse`.
 
 @see AWSLexmodelbuildingserviceDeleteBotVersionRequest
 */
- (AWSTask *)deleteBotVersion:(AWSLexmodelbuildingserviceDeleteBotVersionRequest *)request;

/**
 <p>Deletes a specific version of a bot. To delete all versions of a bot, use the <a>DeleteBot</a> operation. </p><p>This operation requires permissions for the <code>lex:DeleteBotVersion</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBotVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorResourceInUse`.
 
 @see AWSLexmodelbuildingserviceDeleteBotVersionRequest
 */
- (void)deleteBotVersion:(AWSLexmodelbuildingserviceDeleteBotVersionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes all versions of the intent, including the <code>$LATEST</code> version. To delete a specific version of the intent, use the <a>DeleteIntentVersion</a> operation.</p><p> You can delete a version of an intent only if it is not referenced. To delete an intent that is referred to in one or more bots (see <a>how-it-works</a>), you must remove those references first. </p><note><p> If you get the <code>ResourceInUseException</code> exception, it provides an example reference that shows where the intent is referenced. To remove the reference to the intent, either update the bot or delete it. If you get the same exception when you attempt to delete the intent again, repeat until the intent has no references and the call to <code>DeleteIntent</code> is successful. </p></note><p> This operation requires permission for the <code>lex:DeleteIntent</code> action. </p>
 
 @param request A container for the necessary parameters to execute the DeleteIntent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorResourceInUse`.
 
 @see AWSLexmodelbuildingserviceDeleteIntentRequest
 */
- (AWSTask *)deleteIntent:(AWSLexmodelbuildingserviceDeleteIntentRequest *)request;

/**
 <p>Deletes all versions of the intent, including the <code>$LATEST</code> version. To delete a specific version of the intent, use the <a>DeleteIntentVersion</a> operation.</p><p> You can delete a version of an intent only if it is not referenced. To delete an intent that is referred to in one or more bots (see <a>how-it-works</a>), you must remove those references first. </p><note><p> If you get the <code>ResourceInUseException</code> exception, it provides an example reference that shows where the intent is referenced. To remove the reference to the intent, either update the bot or delete it. If you get the same exception when you attempt to delete the intent again, repeat until the intent has no references and the call to <code>DeleteIntent</code> is successful. </p></note><p> This operation requires permission for the <code>lex:DeleteIntent</code> action. </p>
 
 @param request A container for the necessary parameters to execute the DeleteIntent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorResourceInUse`.
 
 @see AWSLexmodelbuildingserviceDeleteIntentRequest
 */
- (void)deleteIntent:(AWSLexmodelbuildingserviceDeleteIntentRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specific version of an intent. To delete all versions of a intent, use the <a>DeleteIntent</a> operation. </p><p>This operation requires permissions for the <code>lex:DeleteIntentVersion</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIntentVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorResourceInUse`.
 
 @see AWSLexmodelbuildingserviceDeleteIntentVersionRequest
 */
- (AWSTask *)deleteIntentVersion:(AWSLexmodelbuildingserviceDeleteIntentVersionRequest *)request;

/**
 <p>Deletes a specific version of an intent. To delete all versions of a intent, use the <a>DeleteIntent</a> operation. </p><p>This operation requires permissions for the <code>lex:DeleteIntentVersion</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIntentVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorResourceInUse`.
 
 @see AWSLexmodelbuildingserviceDeleteIntentVersionRequest
 */
- (void)deleteIntentVersion:(AWSLexmodelbuildingserviceDeleteIntentVersionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes all versions of the slot type, including the <code>$LATEST</code> version. To delete a specific version of the slot type, use the <a>DeleteSlotTypeVersion</a> operation.</p><p> You can delete a version of a slot type only if it is not referenced. To delete a slot type that is referred to in one or more intents, you must remove those references first. </p><note><p> If you get the <code>ResourceInUseException</code> exception, the exception provides an example reference that shows the intent where the slot type is referenced. To remove the reference to the slot type, either update the intent or delete it. If you get the same exception when you attempt to delete the slot type again, repeat until the slot type has no references and the <code>DeleteSlotType</code> call is successful. </p></note><p>This operation requires permission for the <code>lex:DeleteSlotType</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSlotType service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorResourceInUse`.
 
 @see AWSLexmodelbuildingserviceDeleteSlotTypeRequest
 */
- (AWSTask *)deleteSlotType:(AWSLexmodelbuildingserviceDeleteSlotTypeRequest *)request;

/**
 <p>Deletes all versions of the slot type, including the <code>$LATEST</code> version. To delete a specific version of the slot type, use the <a>DeleteSlotTypeVersion</a> operation.</p><p> You can delete a version of a slot type only if it is not referenced. To delete a slot type that is referred to in one or more intents, you must remove those references first. </p><note><p> If you get the <code>ResourceInUseException</code> exception, the exception provides an example reference that shows the intent where the slot type is referenced. To remove the reference to the slot type, either update the intent or delete it. If you get the same exception when you attempt to delete the slot type again, repeat until the slot type has no references and the <code>DeleteSlotType</code> call is successful. </p></note><p>This operation requires permission for the <code>lex:DeleteSlotType</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSlotType service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorResourceInUse`.
 
 @see AWSLexmodelbuildingserviceDeleteSlotTypeRequest
 */
- (void)deleteSlotType:(AWSLexmodelbuildingserviceDeleteSlotTypeRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specific version of a slot type. To delete all versions of a slot type, use the <a>DeleteSlotType</a> operation. </p><p>This operation requires permissions for the <code>lex:DeleteSlotTypeVersion</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSlotTypeVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorResourceInUse`.
 
 @see AWSLexmodelbuildingserviceDeleteSlotTypeVersionRequest
 */
- (AWSTask *)deleteSlotTypeVersion:(AWSLexmodelbuildingserviceDeleteSlotTypeVersionRequest *)request;

/**
 <p>Deletes a specific version of a slot type. To delete all versions of a slot type, use the <a>DeleteSlotType</a> operation. </p><p>This operation requires permissions for the <code>lex:DeleteSlotTypeVersion</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSlotTypeVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorResourceInUse`.
 
 @see AWSLexmodelbuildingserviceDeleteSlotTypeVersionRequest
 */
- (void)deleteSlotTypeVersion:(AWSLexmodelbuildingserviceDeleteSlotTypeVersionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes stored utterances.</p><p>Amazon Lex stores the utterances that users send to your bot. Utterances are stored for 15 days for use with the <a>GetUtterancesView</a> operation, and then stored indefinitely for use in improving the ability of your bot to respond to user input.</p><p>Use the <code>DeleteUtterances</code> operation to manually delete stored utterances for a specific user. When you use the <code>DeleteUtterances</code> operation, utterances stored for improving your bot's ability to respond to user input are deleted immediately. Utterances stored for use with the <code>GetUtterancesView</code> operation are deleted after 15 days.</p><p>This operation requires permissions for the <code>lex:DeleteUtterances</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUtterances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceDeleteUtterancesRequest
 */
- (AWSTask *)deleteUtterances:(AWSLexmodelbuildingserviceDeleteUtterancesRequest *)request;

/**
 <p>Deletes stored utterances.</p><p>Amazon Lex stores the utterances that users send to your bot. Utterances are stored for 15 days for use with the <a>GetUtterancesView</a> operation, and then stored indefinitely for use in improving the ability of your bot to respond to user input.</p><p>Use the <code>DeleteUtterances</code> operation to manually delete stored utterances for a specific user. When you use the <code>DeleteUtterances</code> operation, utterances stored for improving your bot's ability to respond to user input are deleted immediately. Utterances stored for use with the <code>GetUtterancesView</code> operation are deleted after 15 days.</p><p>This operation requires permissions for the <code>lex:DeleteUtterances</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUtterances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceDeleteUtterancesRequest
 */
- (void)deleteUtterances:(AWSLexmodelbuildingserviceDeleteUtterancesRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Returns metadata information for a specific bot. You must provide the bot name and the bot version or alias. </p><p> This operation requires permissions for the <code>lex:GetBot</code> action. </p>
 
 @param request A container for the necessary parameters to execute the GetBot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceGetBotResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetBotRequest
 @see AWSLexmodelbuildingserviceGetBotResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceGetBotResponse *> *)getBot:(AWSLexmodelbuildingserviceGetBotRequest *)request;

/**
 <p>Returns metadata information for a specific bot. You must provide the bot name and the bot version or alias. </p><p> This operation requires permissions for the <code>lex:GetBot</code> action. </p>
 
 @param request A container for the necessary parameters to execute the GetBot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetBotRequest
 @see AWSLexmodelbuildingserviceGetBotResponse
 */
- (void)getBot:(AWSLexmodelbuildingserviceGetBotRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceGetBotResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about an Amazon Lex bot alias. For more information about aliases, see <a>versioning-aliases</a>.</p><p>This operation requires permissions for the <code>lex:GetBotAlias</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetBotAlias service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceGetBotAliasResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetBotAliasRequest
 @see AWSLexmodelbuildingserviceGetBotAliasResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceGetBotAliasResponse *> *)getBotAlias:(AWSLexmodelbuildingserviceGetBotAliasRequest *)request;

/**
 <p>Returns information about an Amazon Lex bot alias. For more information about aliases, see <a>versioning-aliases</a>.</p><p>This operation requires permissions for the <code>lex:GetBotAlias</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetBotAlias service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetBotAliasRequest
 @see AWSLexmodelbuildingserviceGetBotAliasResponse
 */
- (void)getBotAlias:(AWSLexmodelbuildingserviceGetBotAliasRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceGetBotAliasResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of aliases for a specified Amazon Lex bot.</p><p>This operation requires permissions for the <code>lex:GetBotAliases</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetBotAliases service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceGetBotAliasesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetBotAliasesRequest
 @see AWSLexmodelbuildingserviceGetBotAliasesResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceGetBotAliasesResponse *> *)getBotAliases:(AWSLexmodelbuildingserviceGetBotAliasesRequest *)request;

/**
 <p>Returns a list of aliases for a specified Amazon Lex bot.</p><p>This operation requires permissions for the <code>lex:GetBotAliases</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetBotAliases service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetBotAliasesRequest
 @see AWSLexmodelbuildingserviceGetBotAliasesResponse
 */
- (void)getBotAliases:(AWSLexmodelbuildingserviceGetBotAliasesRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceGetBotAliasesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the association between an Amazon Lex bot and a messaging platform.</p><p>This operation requires permissions for the <code>lex:GetBotChannelAssociation</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetBotChannelAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceGetBotChannelAssociationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetBotChannelAssociationRequest
 @see AWSLexmodelbuildingserviceGetBotChannelAssociationResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceGetBotChannelAssociationResponse *> *)getBotChannelAssociation:(AWSLexmodelbuildingserviceGetBotChannelAssociationRequest *)request;

/**
 <p>Returns information about the association between an Amazon Lex bot and a messaging platform.</p><p>This operation requires permissions for the <code>lex:GetBotChannelAssociation</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetBotChannelAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetBotChannelAssociationRequest
 @see AWSLexmodelbuildingserviceGetBotChannelAssociationResponse
 */
- (void)getBotChannelAssociation:(AWSLexmodelbuildingserviceGetBotChannelAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceGetBotChannelAssociationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of all of the channels associated with the specified bot. </p><p>The <code>GetBotChannelAssociations</code> operation requires permissions for the <code>lex:GetBotChannelAssociations</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetBotChannelAssociations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceGetBotChannelAssociationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetBotChannelAssociationsRequest
 @see AWSLexmodelbuildingserviceGetBotChannelAssociationsResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceGetBotChannelAssociationsResponse *> *)getBotChannelAssociations:(AWSLexmodelbuildingserviceGetBotChannelAssociationsRequest *)request;

/**
 <p> Returns a list of all of the channels associated with the specified bot. </p><p>The <code>GetBotChannelAssociations</code> operation requires permissions for the <code>lex:GetBotChannelAssociations</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetBotChannelAssociations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetBotChannelAssociationsRequest
 @see AWSLexmodelbuildingserviceGetBotChannelAssociationsResponse
 */
- (void)getBotChannelAssociations:(AWSLexmodelbuildingserviceGetBotChannelAssociationsRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceGetBotChannelAssociationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about all of the versions of a bot.</p><p>The <code>GetBotVersions</code> operation returns a <code>BotMetadata</code> object for each version of a bot. For example, if a bot has three numbered versions, the <code>GetBotVersions</code> operation returns four <code>BotMetadata</code> objects in the response, one for each numbered version and one for the <code>$LATEST</code> version. </p><p>The <code>GetBotVersions</code> operation always returns at least one version, the <code>$LATEST</code> version.</p><p>This operation requires permissions for the <code>lex:GetBotVersions</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetBotVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceGetBotVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetBotVersionsRequest
 @see AWSLexmodelbuildingserviceGetBotVersionsResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceGetBotVersionsResponse *> *)getBotVersions:(AWSLexmodelbuildingserviceGetBotVersionsRequest *)request;

/**
 <p>Gets information about all of the versions of a bot.</p><p>The <code>GetBotVersions</code> operation returns a <code>BotMetadata</code> object for each version of a bot. For example, if a bot has three numbered versions, the <code>GetBotVersions</code> operation returns four <code>BotMetadata</code> objects in the response, one for each numbered version and one for the <code>$LATEST</code> version. </p><p>The <code>GetBotVersions</code> operation always returns at least one version, the <code>$LATEST</code> version.</p><p>This operation requires permissions for the <code>lex:GetBotVersions</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetBotVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetBotVersionsRequest
 @see AWSLexmodelbuildingserviceGetBotVersionsResponse
 */
- (void)getBotVersions:(AWSLexmodelbuildingserviceGetBotVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceGetBotVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns bot information as follows: </p><ul><li><p>If you provide the <code>nameContains</code> field, the response includes information for the <code>$LATEST</code> version of all bots whose name contains the specified string.</p></li><li><p>If you don't specify the <code>nameContains</code> field, the operation returns information about the <code>$LATEST</code> version of all of your bots.</p></li></ul><p>This operation requires permission for the <code>lex:GetBots</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetBots service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceGetBotsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetBotsRequest
 @see AWSLexmodelbuildingserviceGetBotsResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceGetBotsResponse *> *)getBots:(AWSLexmodelbuildingserviceGetBotsRequest *)request;

/**
 <p>Returns bot information as follows: </p><ul><li><p>If you provide the <code>nameContains</code> field, the response includes information for the <code>$LATEST</code> version of all bots whose name contains the specified string.</p></li><li><p>If you don't specify the <code>nameContains</code> field, the operation returns information about the <code>$LATEST</code> version of all of your bots.</p></li></ul><p>This operation requires permission for the <code>lex:GetBots</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetBots service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetBotsRequest
 @see AWSLexmodelbuildingserviceGetBotsResponse
 */
- (void)getBots:(AWSLexmodelbuildingserviceGetBotsRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceGetBotsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a built-in intent.</p><p>This operation requires permission for the <code>lex:GetBuiltinIntent</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetBuiltinIntent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceGetBuiltinIntentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetBuiltinIntentRequest
 @see AWSLexmodelbuildingserviceGetBuiltinIntentResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceGetBuiltinIntentResponse *> *)getBuiltinIntent:(AWSLexmodelbuildingserviceGetBuiltinIntentRequest *)request;

/**
 <p>Returns information about a built-in intent.</p><p>This operation requires permission for the <code>lex:GetBuiltinIntent</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetBuiltinIntent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetBuiltinIntentRequest
 @see AWSLexmodelbuildingserviceGetBuiltinIntentResponse
 */
- (void)getBuiltinIntent:(AWSLexmodelbuildingserviceGetBuiltinIntentRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceGetBuiltinIntentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of built-in intents that meet the specified criteria.</p><p>This operation requires permission for the <code>lex:GetBuiltinIntents</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetBuiltinIntents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceGetBuiltinIntentsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetBuiltinIntentsRequest
 @see AWSLexmodelbuildingserviceGetBuiltinIntentsResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceGetBuiltinIntentsResponse *> *)getBuiltinIntents:(AWSLexmodelbuildingserviceGetBuiltinIntentsRequest *)request;

/**
 <p>Gets a list of built-in intents that meet the specified criteria.</p><p>This operation requires permission for the <code>lex:GetBuiltinIntents</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetBuiltinIntents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetBuiltinIntentsRequest
 @see AWSLexmodelbuildingserviceGetBuiltinIntentsResponse
 */
- (void)getBuiltinIntents:(AWSLexmodelbuildingserviceGetBuiltinIntentsRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceGetBuiltinIntentsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of built-in slot types that meet the specified criteria.</p><p>For a list of built-in slot types, see <a href="https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/slot-type-reference">Slot Type Reference</a> in the <i>Alexa Skills Kit</i>.</p><p>This operation requires permission for the <code>lex:GetBuiltInSlotTypes</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetBuiltinSlotTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceGetBuiltinSlotTypesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetBuiltinSlotTypesRequest
 @see AWSLexmodelbuildingserviceGetBuiltinSlotTypesResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceGetBuiltinSlotTypesResponse *> *)getBuiltinSlotTypes:(AWSLexmodelbuildingserviceGetBuiltinSlotTypesRequest *)request;

/**
 <p>Gets a list of built-in slot types that meet the specified criteria.</p><p>For a list of built-in slot types, see <a href="https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/slot-type-reference">Slot Type Reference</a> in the <i>Alexa Skills Kit</i>.</p><p>This operation requires permission for the <code>lex:GetBuiltInSlotTypes</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetBuiltinSlotTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetBuiltinSlotTypesRequest
 @see AWSLexmodelbuildingserviceGetBuiltinSlotTypesResponse
 */
- (void)getBuiltinSlotTypes:(AWSLexmodelbuildingserviceGetBuiltinSlotTypesRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceGetBuiltinSlotTypesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Exports the contents of a Amazon Lex resource in a specified format. </p>
 
 @param request A container for the necessary parameters to execute the GetExport service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceGetExportResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetExportRequest
 @see AWSLexmodelbuildingserviceGetExportResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceGetExportResponse *> *)getExport:(AWSLexmodelbuildingserviceGetExportRequest *)request;

/**
 <p>Exports the contents of a Amazon Lex resource in a specified format. </p>
 
 @param request A container for the necessary parameters to execute the GetExport service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetExportRequest
 @see AWSLexmodelbuildingserviceGetExportResponse
 */
- (void)getExport:(AWSLexmodelbuildingserviceGetExportRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceGetExportResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about an import job started with the <code>StartImport</code> operation.</p>
 
 @param request A container for the necessary parameters to execute the GetImport service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceGetImportResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetImportRequest
 @see AWSLexmodelbuildingserviceGetImportResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceGetImportResponse *> *)getImport:(AWSLexmodelbuildingserviceGetImportRequest *)request;

/**
 <p>Gets information about an import job started with the <code>StartImport</code> operation.</p>
 
 @param request A container for the necessary parameters to execute the GetImport service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetImportRequest
 @see AWSLexmodelbuildingserviceGetImportResponse
 */
- (void)getImport:(AWSLexmodelbuildingserviceGetImportRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceGetImportResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns information about an intent. In addition to the intent name, you must specify the intent version. </p><p> This operation requires permissions to perform the <code>lex:GetIntent</code> action. </p>
 
 @param request A container for the necessary parameters to execute the GetIntent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceGetIntentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetIntentRequest
 @see AWSLexmodelbuildingserviceGetIntentResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceGetIntentResponse *> *)getIntent:(AWSLexmodelbuildingserviceGetIntentRequest *)request;

/**
 <p> Returns information about an intent. In addition to the intent name, you must specify the intent version. </p><p> This operation requires permissions to perform the <code>lex:GetIntent</code> action. </p>
 
 @param request A container for the necessary parameters to execute the GetIntent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetIntentRequest
 @see AWSLexmodelbuildingserviceGetIntentResponse
 */
- (void)getIntent:(AWSLexmodelbuildingserviceGetIntentRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceGetIntentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about all of the versions of an intent.</p><p>The <code>GetIntentVersions</code> operation returns an <code>IntentMetadata</code> object for each version of an intent. For example, if an intent has three numbered versions, the <code>GetIntentVersions</code> operation returns four <code>IntentMetadata</code> objects in the response, one for each numbered version and one for the <code>$LATEST</code> version. </p><p>The <code>GetIntentVersions</code> operation always returns at least one version, the <code>$LATEST</code> version.</p><p>This operation requires permissions for the <code>lex:GetIntentVersions</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetIntentVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceGetIntentVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetIntentVersionsRequest
 @see AWSLexmodelbuildingserviceGetIntentVersionsResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceGetIntentVersionsResponse *> *)getIntentVersions:(AWSLexmodelbuildingserviceGetIntentVersionsRequest *)request;

/**
 <p>Gets information about all of the versions of an intent.</p><p>The <code>GetIntentVersions</code> operation returns an <code>IntentMetadata</code> object for each version of an intent. For example, if an intent has three numbered versions, the <code>GetIntentVersions</code> operation returns four <code>IntentMetadata</code> objects in the response, one for each numbered version and one for the <code>$LATEST</code> version. </p><p>The <code>GetIntentVersions</code> operation always returns at least one version, the <code>$LATEST</code> version.</p><p>This operation requires permissions for the <code>lex:GetIntentVersions</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetIntentVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetIntentVersionsRequest
 @see AWSLexmodelbuildingserviceGetIntentVersionsResponse
 */
- (void)getIntentVersions:(AWSLexmodelbuildingserviceGetIntentVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceGetIntentVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns intent information as follows: </p><ul><li><p>If you specify the <code>nameContains</code> field, returns the <code>$LATEST</code> version of all intents that contain the specified string.</p></li><li><p> If you don't specify the <code>nameContains</code> field, returns information about the <code>$LATEST</code> version of all intents. </p></li></ul><p> The operation requires permission for the <code>lex:GetIntents</code> action. </p>
 
 @param request A container for the necessary parameters to execute the GetIntents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceGetIntentsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetIntentsRequest
 @see AWSLexmodelbuildingserviceGetIntentsResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceGetIntentsResponse *> *)getIntents:(AWSLexmodelbuildingserviceGetIntentsRequest *)request;

/**
 <p>Returns intent information as follows: </p><ul><li><p>If you specify the <code>nameContains</code> field, returns the <code>$LATEST</code> version of all intents that contain the specified string.</p></li><li><p> If you don't specify the <code>nameContains</code> field, returns information about the <code>$LATEST</code> version of all intents. </p></li></ul><p> The operation requires permission for the <code>lex:GetIntents</code> action. </p>
 
 @param request A container for the necessary parameters to execute the GetIntents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetIntentsRequest
 @see AWSLexmodelbuildingserviceGetIntentsResponse
 */
- (void)getIntents:(AWSLexmodelbuildingserviceGetIntentsRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceGetIntentsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a specific version of a slot type. In addition to specifying the slot type name, you must specify the slot type version.</p><p>This operation requires permissions for the <code>lex:GetSlotType</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetSlotType service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceGetSlotTypeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetSlotTypeRequest
 @see AWSLexmodelbuildingserviceGetSlotTypeResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceGetSlotTypeResponse *> *)getSlotType:(AWSLexmodelbuildingserviceGetSlotTypeRequest *)request;

/**
 <p>Returns information about a specific version of a slot type. In addition to specifying the slot type name, you must specify the slot type version.</p><p>This operation requires permissions for the <code>lex:GetSlotType</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetSlotType service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetSlotTypeRequest
 @see AWSLexmodelbuildingserviceGetSlotTypeResponse
 */
- (void)getSlotType:(AWSLexmodelbuildingserviceGetSlotTypeRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceGetSlotTypeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about all versions of a slot type.</p><p>The <code>GetSlotTypeVersions</code> operation returns a <code>SlotTypeMetadata</code> object for each version of a slot type. For example, if a slot type has three numbered versions, the <code>GetSlotTypeVersions</code> operation returns four <code>SlotTypeMetadata</code> objects in the response, one for each numbered version and one for the <code>$LATEST</code> version. </p><p>The <code>GetSlotTypeVersions</code> operation always returns at least one version, the <code>$LATEST</code> version.</p><p>This operation requires permissions for the <code>lex:GetSlotTypeVersions</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetSlotTypeVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceGetSlotTypeVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetSlotTypeVersionsRequest
 @see AWSLexmodelbuildingserviceGetSlotTypeVersionsResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceGetSlotTypeVersionsResponse *> *)getSlotTypeVersions:(AWSLexmodelbuildingserviceGetSlotTypeVersionsRequest *)request;

/**
 <p>Gets information about all versions of a slot type.</p><p>The <code>GetSlotTypeVersions</code> operation returns a <code>SlotTypeMetadata</code> object for each version of a slot type. For example, if a slot type has three numbered versions, the <code>GetSlotTypeVersions</code> operation returns four <code>SlotTypeMetadata</code> objects in the response, one for each numbered version and one for the <code>$LATEST</code> version. </p><p>The <code>GetSlotTypeVersions</code> operation always returns at least one version, the <code>$LATEST</code> version.</p><p>This operation requires permissions for the <code>lex:GetSlotTypeVersions</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetSlotTypeVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetSlotTypeVersionsRequest
 @see AWSLexmodelbuildingserviceGetSlotTypeVersionsResponse
 */
- (void)getSlotTypeVersions:(AWSLexmodelbuildingserviceGetSlotTypeVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceGetSlotTypeVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns slot type information as follows: </p><ul><li><p>If you specify the <code>nameContains</code> field, returns the <code>$LATEST</code> version of all slot types that contain the specified string.</p></li><li><p> If you don't specify the <code>nameContains</code> field, returns information about the <code>$LATEST</code> version of all slot types. </p></li></ul><p> The operation requires permission for the <code>lex:GetSlotTypes</code> action. </p>
 
 @param request A container for the necessary parameters to execute the GetSlotTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceGetSlotTypesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetSlotTypesRequest
 @see AWSLexmodelbuildingserviceGetSlotTypesResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceGetSlotTypesResponse *> *)getSlotTypes:(AWSLexmodelbuildingserviceGetSlotTypesRequest *)request;

/**
 <p>Returns slot type information as follows: </p><ul><li><p>If you specify the <code>nameContains</code> field, returns the <code>$LATEST</code> version of all slot types that contain the specified string.</p></li><li><p> If you don't specify the <code>nameContains</code> field, returns information about the <code>$LATEST</code> version of all slot types. </p></li></ul><p> The operation requires permission for the <code>lex:GetSlotTypes</code> action. </p>
 
 @param request A container for the necessary parameters to execute the GetSlotTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetSlotTypesRequest
 @see AWSLexmodelbuildingserviceGetSlotTypesResponse
 */
- (void)getSlotTypes:(AWSLexmodelbuildingserviceGetSlotTypesRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceGetSlotTypesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Use the <code>GetUtterancesView</code> operation to get information about the utterances that your users have made to your bot. You can use this list to tune the utterances that your bot responds to.</p><p>For example, say that you have created a bot to order flowers. After your users have used your bot for a while, use the <code>GetUtterancesView</code> operation to see the requests that they have made and whether they have been successful. You might find that the utterance "I want flowers" is not being recognized. You could add this utterance to the <code>OrderFlowers</code> intent so that your bot recognizes that utterance.</p><p>After you publish a new version of a bot, you can get information about the old version and the new so that you can compare the performance across the two versions. </p><p>Utterance statistics are generated once a day. Data is available for the last 15 days. You can request information for up to 5 versions of your bot in each request. Amazon Lex returns the most frequent utterances received by the bot in the last 15 days. The response contains information about a maximum of 100 utterances for each version.</p><p>If you set <code>childDirected</code> field to true when you created your bot, or if you opted out of participating in improving Amazon Lex, utterances are not available.</p><p>This operation requires permissions for the <code>lex:GetUtterancesView</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetUtterancesView service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceGetUtterancesViewResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetUtterancesViewRequest
 @see AWSLexmodelbuildingserviceGetUtterancesViewResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceGetUtterancesViewResponse *> *)getUtterancesView:(AWSLexmodelbuildingserviceGetUtterancesViewRequest *)request;

/**
 <p>Use the <code>GetUtterancesView</code> operation to get information about the utterances that your users have made to your bot. You can use this list to tune the utterances that your bot responds to.</p><p>For example, say that you have created a bot to order flowers. After your users have used your bot for a while, use the <code>GetUtterancesView</code> operation to see the requests that they have made and whether they have been successful. You might find that the utterance "I want flowers" is not being recognized. You could add this utterance to the <code>OrderFlowers</code> intent so that your bot recognizes that utterance.</p><p>After you publish a new version of a bot, you can get information about the old version and the new so that you can compare the performance across the two versions. </p><p>Utterance statistics are generated once a day. Data is available for the last 15 days. You can request information for up to 5 versions of your bot in each request. Amazon Lex returns the most frequent utterances received by the bot in the last 15 days. The response contains information about a maximum of 100 utterances for each version.</p><p>If you set <code>childDirected</code> field to true when you created your bot, or if you opted out of participating in improving Amazon Lex, utterances are not available.</p><p>This operation requires permissions for the <code>lex:GetUtterancesView</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetUtterancesView service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceGetUtterancesViewRequest
 @see AWSLexmodelbuildingserviceGetUtterancesViewResponse
 */
- (void)getUtterancesView:(AWSLexmodelbuildingserviceGetUtterancesViewRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceGetUtterancesViewResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of tags associated with the specified resource. Only bots, bot aliases, and bot channels can have tags associated with them.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorLimitExceeded`.
 
 @see AWSLexmodelbuildingserviceListTagsForResourceRequest
 @see AWSLexmodelbuildingserviceListTagsForResourceResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceListTagsForResourceResponse *> *)listTagsForResource:(AWSLexmodelbuildingserviceListTagsForResourceRequest *)request;

/**
 <p>Gets a list of tags associated with the specified resource. Only bots, bot aliases, and bot channels can have tags associated with them.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorLimitExceeded`.
 
 @see AWSLexmodelbuildingserviceListTagsForResourceRequest
 @see AWSLexmodelbuildingserviceListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSLexmodelbuildingserviceListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon Lex conversational bot or replaces an existing bot. When you create or update a bot you are only required to specify a name, a locale, and whether the bot is directed toward children under age 13. You can use this to add intents later, or to remove intents from an existing bot. When you create a bot with the minimum information, the bot is created or updated but Amazon Lex returns the <code/> response <code>FAILED</code>. You can build the bot after you add one or more intents. For more information about Amazon Lex bots, see <a>how-it-works</a>. </p><p>If you specify the name of an existing bot, the fields in the request replace the existing values in the <code>$LATEST</code> version of the bot. Amazon Lex removes any fields that you don't provide values for in the request, except for the <code>idleTTLInSeconds</code> and <code>privacySettings</code> fields, which are set to their default values. If you don't specify values for required fields, Amazon Lex throws an exception.</p><p>This operation requires permissions for the <code>lex:PutBot</code> action. For more information, see <a>security-iam</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutBot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingservicePutBotResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorPreconditionFailed`.
 
 @see AWSLexmodelbuildingservicePutBotRequest
 @see AWSLexmodelbuildingservicePutBotResponse
 */
- (AWSTask<AWSLexmodelbuildingservicePutBotResponse *> *)putBot:(AWSLexmodelbuildingservicePutBotRequest *)request;

/**
 <p>Creates an Amazon Lex conversational bot or replaces an existing bot. When you create or update a bot you are only required to specify a name, a locale, and whether the bot is directed toward children under age 13. You can use this to add intents later, or to remove intents from an existing bot. When you create a bot with the minimum information, the bot is created or updated but Amazon Lex returns the <code/> response <code>FAILED</code>. You can build the bot after you add one or more intents. For more information about Amazon Lex bots, see <a>how-it-works</a>. </p><p>If you specify the name of an existing bot, the fields in the request replace the existing values in the <code>$LATEST</code> version of the bot. Amazon Lex removes any fields that you don't provide values for in the request, except for the <code>idleTTLInSeconds</code> and <code>privacySettings</code> fields, which are set to their default values. If you don't specify values for required fields, Amazon Lex throws an exception.</p><p>This operation requires permissions for the <code>lex:PutBot</code> action. For more information, see <a>security-iam</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutBot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorPreconditionFailed`.
 
 @see AWSLexmodelbuildingservicePutBotRequest
 @see AWSLexmodelbuildingservicePutBotResponse
 */
- (void)putBot:(AWSLexmodelbuildingservicePutBotRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingservicePutBotResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an alias for the specified version of the bot or replaces an alias for the specified bot. To change the version of the bot that the alias points to, replace the alias. For more information about aliases, see <a>versioning-aliases</a>.</p><p>This operation requires permissions for the <code>lex:PutBotAlias</code> action. </p>
 
 @param request A container for the necessary parameters to execute the PutBotAlias service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingservicePutBotAliasResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorPreconditionFailed`.
 
 @see AWSLexmodelbuildingservicePutBotAliasRequest
 @see AWSLexmodelbuildingservicePutBotAliasResponse
 */
- (AWSTask<AWSLexmodelbuildingservicePutBotAliasResponse *> *)putBotAlias:(AWSLexmodelbuildingservicePutBotAliasRequest *)request;

/**
 <p>Creates an alias for the specified version of the bot or replaces an alias for the specified bot. To change the version of the bot that the alias points to, replace the alias. For more information about aliases, see <a>versioning-aliases</a>.</p><p>This operation requires permissions for the <code>lex:PutBotAlias</code> action. </p>
 
 @param request A container for the necessary parameters to execute the PutBotAlias service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorPreconditionFailed`.
 
 @see AWSLexmodelbuildingservicePutBotAliasRequest
 @see AWSLexmodelbuildingservicePutBotAliasResponse
 */
- (void)putBotAlias:(AWSLexmodelbuildingservicePutBotAliasRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingservicePutBotAliasResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an intent or replaces an existing intent.</p><p>To define the interaction between the user and your bot, you use one or more intents. For a pizza ordering bot, for example, you would create an <code>OrderPizza</code> intent. </p><p>To create an intent or replace an existing intent, you must provide the following:</p><ul><li><p>Intent name. For example, <code>OrderPizza</code>.</p></li><li><p>Sample utterances. For example, "Can I order a pizza, please." and "I want to order a pizza."</p></li><li><p>Information to be gathered. You specify slot types for the information that your bot will request from the user. You can specify standard slot types, such as a date or a time, or custom slot types such as the size and crust of a pizza.</p></li><li><p>How the intent will be fulfilled. You can provide a Lambda function or configure the intent to return the intent information to the client application. If you use a Lambda function, when all of the intent information is available, Amazon Lex invokes your Lambda function. If you configure your intent to return the intent information to the client application. </p></li></ul><p>You can specify other optional information in the request, such as:</p><ul><li><p>A confirmation prompt to ask the user to confirm an intent. For example, "Shall I order your pizza?"</p></li><li><p>A conclusion statement to send to the user after the intent has been fulfilled. For example, "I placed your pizza order."</p></li><li><p>A follow-up prompt that asks the user for additional activity. For example, asking "Do you want to order a drink with your pizza?"</p></li></ul><p>If you specify an existing intent name to update the intent, Amazon Lex replaces the values in the <code>$LATEST</code> version of the intent with the values in the request. Amazon Lex removes fields that you don't provide in the request. If you don't specify the required fields, Amazon Lex throws an exception. When you update the <code>$LATEST</code> version of an intent, the <code>status</code> field of any bot that uses the <code>$LATEST</code> version of the intent is set to <code>NOT_BUILT</code>.</p><p>For more information, see <a>how-it-works</a>.</p><p>This operation requires permissions for the <code>lex:PutIntent</code> action.</p>
 
 @param request A container for the necessary parameters to execute the PutIntent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingservicePutIntentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorPreconditionFailed`.
 
 @see AWSLexmodelbuildingservicePutIntentRequest
 @see AWSLexmodelbuildingservicePutIntentResponse
 */
- (AWSTask<AWSLexmodelbuildingservicePutIntentResponse *> *)putIntent:(AWSLexmodelbuildingservicePutIntentRequest *)request;

/**
 <p>Creates an intent or replaces an existing intent.</p><p>To define the interaction between the user and your bot, you use one or more intents. For a pizza ordering bot, for example, you would create an <code>OrderPizza</code> intent. </p><p>To create an intent or replace an existing intent, you must provide the following:</p><ul><li><p>Intent name. For example, <code>OrderPizza</code>.</p></li><li><p>Sample utterances. For example, "Can I order a pizza, please." and "I want to order a pizza."</p></li><li><p>Information to be gathered. You specify slot types for the information that your bot will request from the user. You can specify standard slot types, such as a date or a time, or custom slot types such as the size and crust of a pizza.</p></li><li><p>How the intent will be fulfilled. You can provide a Lambda function or configure the intent to return the intent information to the client application. If you use a Lambda function, when all of the intent information is available, Amazon Lex invokes your Lambda function. If you configure your intent to return the intent information to the client application. </p></li></ul><p>You can specify other optional information in the request, such as:</p><ul><li><p>A confirmation prompt to ask the user to confirm an intent. For example, "Shall I order your pizza?"</p></li><li><p>A conclusion statement to send to the user after the intent has been fulfilled. For example, "I placed your pizza order."</p></li><li><p>A follow-up prompt that asks the user for additional activity. For example, asking "Do you want to order a drink with your pizza?"</p></li></ul><p>If you specify an existing intent name to update the intent, Amazon Lex replaces the values in the <code>$LATEST</code> version of the intent with the values in the request. Amazon Lex removes fields that you don't provide in the request. If you don't specify the required fields, Amazon Lex throws an exception. When you update the <code>$LATEST</code> version of an intent, the <code>status</code> field of any bot that uses the <code>$LATEST</code> version of the intent is set to <code>NOT_BUILT</code>.</p><p>For more information, see <a>how-it-works</a>.</p><p>This operation requires permissions for the <code>lex:PutIntent</code> action.</p>
 
 @param request A container for the necessary parameters to execute the PutIntent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorPreconditionFailed`.
 
 @see AWSLexmodelbuildingservicePutIntentRequest
 @see AWSLexmodelbuildingservicePutIntentResponse
 */
- (void)putIntent:(AWSLexmodelbuildingservicePutIntentRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingservicePutIntentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a custom slot type or replaces an existing custom slot type.</p><p>To create a custom slot type, specify a name for the slot type and a set of enumeration values, which are the values that a slot of this type can assume. For more information, see <a>how-it-works</a>.</p><p>If you specify the name of an existing slot type, the fields in the request replace the existing values in the <code>$LATEST</code> version of the slot type. Amazon Lex removes the fields that you don't provide in the request. If you don't specify required fields, Amazon Lex throws an exception. When you update the <code>$LATEST</code> version of a slot type, if a bot uses the <code>$LATEST</code> version of an intent that contains the slot type, the bot's <code>status</code> field is set to <code>NOT_BUILT</code>.</p><p>This operation requires permissions for the <code>lex:PutSlotType</code> action.</p>
 
 @param request A container for the necessary parameters to execute the PutSlotType service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingservicePutSlotTypeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorPreconditionFailed`.
 
 @see AWSLexmodelbuildingservicePutSlotTypeRequest
 @see AWSLexmodelbuildingservicePutSlotTypeResponse
 */
- (AWSTask<AWSLexmodelbuildingservicePutSlotTypeResponse *> *)putSlotType:(AWSLexmodelbuildingservicePutSlotTypeRequest *)request;

/**
 <p>Creates a custom slot type or replaces an existing custom slot type.</p><p>To create a custom slot type, specify a name for the slot type and a set of enumeration values, which are the values that a slot of this type can assume. For more information, see <a>how-it-works</a>.</p><p>If you specify the name of an existing slot type, the fields in the request replace the existing values in the <code>$LATEST</code> version of the slot type. Amazon Lex removes the fields that you don't provide in the request. If you don't specify required fields, Amazon Lex throws an exception. When you update the <code>$LATEST</code> version of a slot type, if a bot uses the <code>$LATEST</code> version of an intent that contains the slot type, the bot's <code>status</code> field is set to <code>NOT_BUILT</code>.</p><p>This operation requires permissions for the <code>lex:PutSlotType</code> action.</p>
 
 @param request A container for the necessary parameters to execute the PutSlotType service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorPreconditionFailed`.
 
 @see AWSLexmodelbuildingservicePutSlotTypeRequest
 @see AWSLexmodelbuildingservicePutSlotTypeResponse
 */
- (void)putSlotType:(AWSLexmodelbuildingservicePutSlotTypeRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingservicePutSlotTypeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a job to import a resource to Amazon Lex.</p>
 
 @param request A container for the necessary parameters to execute the StartImport service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceStartImportResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceStartImportRequest
 @see AWSLexmodelbuildingserviceStartImportResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceStartImportResponse *> *)startImport:(AWSLexmodelbuildingserviceStartImportRequest *)request;

/**
 <p>Starts a job to import a resource to Amazon Lex.</p>
 
 @param request A container for the necessary parameters to execute the StartImport service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorLimitExceeded`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorBadRequest`.
 
 @see AWSLexmodelbuildingserviceStartImportRequest
 @see AWSLexmodelbuildingserviceStartImportResponse
 */
- (void)startImport:(AWSLexmodelbuildingserviceStartImportRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceStartImportResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds the specified tags to the specified resource. If a tag key already exists, the existing value is replaced with the new value.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorLimitExceeded`.
 
 @see AWSLexmodelbuildingserviceTagResourceRequest
 @see AWSLexmodelbuildingserviceTagResourceResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceTagResourceResponse *> *)tagResource:(AWSLexmodelbuildingserviceTagResourceRequest *)request;

/**
 <p>Adds the specified tags to the specified resource. If a tag key already exists, the existing value is replaced with the new value.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorLimitExceeded`.
 
 @see AWSLexmodelbuildingserviceTagResourceRequest
 @see AWSLexmodelbuildingserviceTagResourceResponse
 */
- (void)tagResource:(AWSLexmodelbuildingserviceTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes tags from a bot, bot alias or bot channel.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLexmodelbuildingserviceUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorLimitExceeded`.
 
 @see AWSLexmodelbuildingserviceUntagResourceRequest
 @see AWSLexmodelbuildingserviceUntagResourceResponse
 */
- (AWSTask<AWSLexmodelbuildingserviceUntagResourceResponse *> *)untagResource:(AWSLexmodelbuildingserviceUntagResourceRequest *)request;

/**
 <p>Removes tags from a bot, bot alias or bot channel.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLexmodelbuildingserviceErrorDomain` domain and the following error code: `AWSLexmodelbuildingserviceErrorNotFound`, `AWSLexmodelbuildingserviceErrorBadRequest`, `AWSLexmodelbuildingserviceErrorConflict`, `AWSLexmodelbuildingserviceErrorInternalFailure`, `AWSLexmodelbuildingserviceErrorLimitExceeded`.
 
 @see AWSLexmodelbuildingserviceUntagResourceRequest
 @see AWSLexmodelbuildingserviceUntagResourceResponse
 */
- (void)untagResource:(AWSLexmodelbuildingserviceUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSLexmodelbuildingserviceUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
