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
#import "AWSConnectModel.h"
#import "AWSConnectResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSConnect
FOUNDATION_EXPORT NSString *const AWSConnectSDKVersion;

/**
 <p>Amazon Connect is a cloud-based contact center solution that you use to set up and manage a customer contact center and provide reliable customer engagement at any scale.</p><p>Amazon Connect provides metrics and real-time reporting that enable you to optimize contact routing. You can also resolve customer issues more efficiently by getting customers in touch with the appropriate agents.</p><p>There are limits to the number of Amazon Connect resources that you can create. There are also limits to the number of requests that you can make per second. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">Amazon Connect Service Quotas</a> in the <i>Amazon Connect Administrator Guide</i>.</p><p>You can connect programmatically to an Amazon Web Services service by using an endpoint. For a list of Amazon Connect endpoints, see <a href="https://docs.aws.amazon.com/general/latest/gr/connect_region.html">Amazon Connect Endpoints</a>.</p><note><p>Working with flows? Check out the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect Flow language</a>.</p></note>
 */
@interface AWSConnect : AWSService

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

     let Connect = AWSConnect.default()

 *Objective-C*

     AWSConnect *Connect = [AWSConnect defaultConnect];

 @return The default service client.
 */
+ (instancetype)defaultConnect;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSConnect.register(with: configuration!, forKey: "USWest2Connect")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSConnect registerConnectWithConfiguration:configuration forKey:@"USWest2Connect"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Connect = AWSConnect(forKey: "USWest2Connect")

 *Objective-C*

     AWSConnect *Connect = [AWSConnect ConnectForKey:@"USWest2Connect"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerConnectWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerConnectWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSConnect.register(with: configuration!, forKey: "USWest2Connect")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSConnect registerConnectWithConfiguration:configuration forKey:@"USWest2Connect"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Connect = AWSConnect(forKey: "USWest2Connect")

 *Objective-C*

     AWSConnect *Connect = [AWSConnect ConnectForKey:@"USWest2Connect"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)ConnectForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeConnectForKey:(NSString *)key;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Associates an approved origin to an Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the AssociateApprovedOrigin service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectAssociateApprovedOriginRequest
 */
- (AWSTask *)associateApprovedOrigin:(AWSConnectAssociateApprovedOriginRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Associates an approved origin to an Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the AssociateApprovedOrigin service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectAssociateApprovedOriginRequest
 */
- (void)associateApprovedOrigin:(AWSConnectAssociateApprovedOriginRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Allows the specified Amazon Connect instance to access the specified Amazon Lex or Amazon Lex V2 bot.</p>
 
 @param request A container for the necessary parameters to execute the AssociateBot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectAssociateBotRequest
 */
- (AWSTask *)associateBot:(AWSConnectAssociateBotRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Allows the specified Amazon Connect instance to access the specified Amazon Lex or Amazon Lex V2 bot.</p>
 
 @param request A container for the necessary parameters to execute the AssociateBot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectAssociateBotRequest
 */
- (void)associateBot:(AWSConnectAssociateBotRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Associates an existing vocabulary as the default. Contact Lens for Amazon Connect uses the vocabulary in post-call and real-time analysis sessions for the given language.</p>
 
 @param request A container for the necessary parameters to execute the AssociateDefaultVocabulary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectAssociateDefaultVocabularyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectAssociateDefaultVocabularyRequest
 @see AWSConnectAssociateDefaultVocabularyResponse
 */
- (AWSTask<AWSConnectAssociateDefaultVocabularyResponse *> *)associateDefaultVocabulary:(AWSConnectAssociateDefaultVocabularyRequest *)request;

/**
 <p>Associates an existing vocabulary as the default. Contact Lens for Amazon Connect uses the vocabulary in post-call and real-time analysis sessions for the given language.</p>
 
 @param request A container for the necessary parameters to execute the AssociateDefaultVocabulary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectAssociateDefaultVocabularyRequest
 @see AWSConnectAssociateDefaultVocabularyResponse
 */
- (void)associateDefaultVocabulary:(AWSConnectAssociateDefaultVocabularyRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectAssociateDefaultVocabularyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Associates a storage resource type for the first time. You can only associate one type of storage configuration in a single call. This means, for example, that you can't define an instance with multiple S3 buckets for storing chat transcripts.</p><p>This API does not create a resource that doesn't exist. It only associates it to the instance. Ensure that the resource being specified in the storage configuration, like an S3 bucket, exists when being used for association.</p>
 
 @param request A container for the necessary parameters to execute the AssociateInstanceStorageConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectAssociateInstanceStorageConfigResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectAssociateInstanceStorageConfigRequest
 @see AWSConnectAssociateInstanceStorageConfigResponse
 */
- (AWSTask<AWSConnectAssociateInstanceStorageConfigResponse *> *)associateInstanceStorageConfig:(AWSConnectAssociateInstanceStorageConfigRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Associates a storage resource type for the first time. You can only associate one type of storage configuration in a single call. This means, for example, that you can't define an instance with multiple S3 buckets for storing chat transcripts.</p><p>This API does not create a resource that doesn't exist. It only associates it to the instance. Ensure that the resource being specified in the storage configuration, like an S3 bucket, exists when being used for association.</p>
 
 @param request A container for the necessary parameters to execute the AssociateInstanceStorageConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectAssociateInstanceStorageConfigRequest
 @see AWSConnectAssociateInstanceStorageConfigResponse
 */
- (void)associateInstanceStorageConfig:(AWSConnectAssociateInstanceStorageConfigRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectAssociateInstanceStorageConfigResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Allows the specified Amazon Connect instance to access the specified Lambda function.</p>
 
 @param request A container for the necessary parameters to execute the AssociateLambdaFunction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectAssociateLambdaFunctionRequest
 */
- (AWSTask *)associateLambdaFunction:(AWSConnectAssociateLambdaFunctionRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Allows the specified Amazon Connect instance to access the specified Lambda function.</p>
 
 @param request A container for the necessary parameters to execute the AssociateLambdaFunction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectAssociateLambdaFunctionRequest
 */
- (void)associateLambdaFunction:(AWSConnectAssociateLambdaFunctionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Allows the specified Amazon Connect instance to access the specified Amazon Lex bot.</p>
 
 @param request A container for the necessary parameters to execute the AssociateLexBot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectAssociateLexBotRequest
 */
- (AWSTask *)associateLexBot:(AWSConnectAssociateLexBotRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Allows the specified Amazon Connect instance to access the specified Amazon Lex bot.</p>
 
 @param request A container for the necessary parameters to execute the AssociateLexBot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectAssociateLexBotRequest
 */
- (void)associateLexBot:(AWSConnectAssociateLexBotRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Associates a flow with a phone number claimed to your Amazon Connect instance.</p><important><p>If the number is claimed to a traffic distribution group, and you are calling this API using an instance in the Amazon Web Services Region where the traffic distribution group was created, you can use either a full phone number ARN or UUID value for the <code>PhoneNumberId</code> URI request parameter. However, if the number is claimed to a traffic distribution group and you are calling this API using an instance in the alternate Amazon Web Services Region associated with the traffic distribution group, you must provide a full phone number ARN. If a UUID is provided in this scenario, you will receive a <code>ResourceNotFoundException</code>.</p></important>
 
 @param request A container for the necessary parameters to execute the AssociatePhoneNumberContactFlow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectAssociatePhoneNumberContactFlowRequest
 */
- (AWSTask *)associatePhoneNumberContactFlow:(AWSConnectAssociatePhoneNumberContactFlowRequest *)request;

/**
 <p>Associates a flow with a phone number claimed to your Amazon Connect instance.</p><important><p>If the number is claimed to a traffic distribution group, and you are calling this API using an instance in the Amazon Web Services Region where the traffic distribution group was created, you can use either a full phone number ARN or UUID value for the <code>PhoneNumberId</code> URI request parameter. However, if the number is claimed to a traffic distribution group and you are calling this API using an instance in the alternate Amazon Web Services Region associated with the traffic distribution group, you must provide a full phone number ARN. If a UUID is provided in this scenario, you will receive a <code>ResourceNotFoundException</code>.</p></important>
 
 @param request A container for the necessary parameters to execute the AssociatePhoneNumberContactFlow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectAssociatePhoneNumberContactFlowRequest
 */
- (void)associatePhoneNumberContactFlow:(AWSConnectAssociatePhoneNumberContactFlowRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Associates a set of quick connects with a queue.</p>
 
 @param request A container for the necessary parameters to execute the AssociateQueueQuickConnects service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectAssociateQueueQuickConnectsRequest
 */
- (AWSTask *)associateQueueQuickConnects:(AWSConnectAssociateQueueQuickConnectsRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Associates a set of quick connects with a queue.</p>
 
 @param request A container for the necessary parameters to execute the AssociateQueueQuickConnects service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectAssociateQueueQuickConnectsRequest
 */
- (void)associateQueueQuickConnects:(AWSConnectAssociateQueueQuickConnectsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Associates a set of queues with a routing profile.</p>
 
 @param request A container for the necessary parameters to execute the AssociateRoutingProfileQueues service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectAssociateRoutingProfileQueuesRequest
 */
- (AWSTask *)associateRoutingProfileQueues:(AWSConnectAssociateRoutingProfileQueuesRequest *)request;

/**
 <p>Associates a set of queues with a routing profile.</p>
 
 @param request A container for the necessary parameters to execute the AssociateRoutingProfileQueues service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectAssociateRoutingProfileQueuesRequest
 */
- (void)associateRoutingProfileQueues:(AWSConnectAssociateRoutingProfileQueuesRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Associates a security key to the instance.</p>
 
 @param request A container for the necessary parameters to execute the AssociateSecurityKey service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectAssociateSecurityKeyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectAssociateSecurityKeyRequest
 @see AWSConnectAssociateSecurityKeyResponse
 */
- (AWSTask<AWSConnectAssociateSecurityKeyResponse *> *)associateSecurityKey:(AWSConnectAssociateSecurityKeyRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Associates a security key to the instance.</p>
 
 @param request A container for the necessary parameters to execute the AssociateSecurityKey service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectAssociateSecurityKeyRequest
 @see AWSConnectAssociateSecurityKeyResponse
 */
- (void)associateSecurityKey:(AWSConnectAssociateSecurityKeyRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectAssociateSecurityKeyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Claims an available phone number to your Amazon Connect instance or traffic distribution group. You can call this API only in the same Amazon Web Services Region where the Amazon Connect instance or traffic distribution group was created.</p><important><p>You can call the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DescribePhoneNumber.html">DescribePhoneNumber</a> API to verify the status of a previous <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ClaimPhoneNumber.html">ClaimPhoneNumber</a> operation.</p></important>
 
 @param request A container for the necessary parameters to execute the ClaimPhoneNumber service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectClaimPhoneNumberResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorIdempotency`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectClaimPhoneNumberRequest
 @see AWSConnectClaimPhoneNumberResponse
 */
- (AWSTask<AWSConnectClaimPhoneNumberResponse *> *)claimPhoneNumber:(AWSConnectClaimPhoneNumberRequest *)request;

/**
 <p>Claims an available phone number to your Amazon Connect instance or traffic distribution group. You can call this API only in the same Amazon Web Services Region where the Amazon Connect instance or traffic distribution group was created.</p><important><p>You can call the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DescribePhoneNumber.html">DescribePhoneNumber</a> API to verify the status of a previous <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ClaimPhoneNumber.html">ClaimPhoneNumber</a> operation.</p></important>
 
 @param request A container for the necessary parameters to execute the ClaimPhoneNumber service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorIdempotency`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectClaimPhoneNumberRequest
 @see AWSConnectClaimPhoneNumberResponse
 */
- (void)claimPhoneNumber:(AWSConnectClaimPhoneNumberRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectClaimPhoneNumberResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Creates an agent status for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the CreateAgentStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateAgentStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateAgentStatusRequest
 @see AWSConnectCreateAgentStatusResponse
 */
- (AWSTask<AWSConnectCreateAgentStatusResponse *> *)createAgentStatus:(AWSConnectCreateAgentStatusRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Creates an agent status for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the CreateAgentStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateAgentStatusRequest
 @see AWSConnectCreateAgentStatusResponse
 */
- (void)createAgentStatus:(AWSConnectCreateAgentStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreateAgentStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a flow for the specified Amazon Connect instance.</p><p>You can also create and update flows using the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect Flow language</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateContactFlow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateContactFlowResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidContactFlow`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateContactFlowRequest
 @see AWSConnectCreateContactFlowResponse
 */
- (AWSTask<AWSConnectCreateContactFlowResponse *> *)createContactFlow:(AWSConnectCreateContactFlowRequest *)request;

/**
 <p>Creates a flow for the specified Amazon Connect instance.</p><p>You can also create and update flows using the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect Flow language</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateContactFlow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidContactFlow`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateContactFlowRequest
 @see AWSConnectCreateContactFlowResponse
 */
- (void)createContactFlow:(AWSConnectCreateContactFlowRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreateContactFlowResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a flow module for the specified Amazon Connect instance. </p>
 
 @param request A container for the necessary parameters to execute the CreateContactFlowModule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateContactFlowModuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidContactFlowModule`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorIdempotency`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateContactFlowModuleRequest
 @see AWSConnectCreateContactFlowModuleResponse
 */
- (AWSTask<AWSConnectCreateContactFlowModuleResponse *> *)createContactFlowModule:(AWSConnectCreateContactFlowModuleRequest *)request;

/**
 <p>Creates a flow module for the specified Amazon Connect instance. </p>
 
 @param request A container for the necessary parameters to execute the CreateContactFlowModule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidContactFlowModule`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorIdempotency`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateContactFlowModuleRequest
 @see AWSConnectCreateContactFlowModuleResponse
 */
- (void)createContactFlowModule:(AWSConnectCreateContactFlowModuleRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreateContactFlowModuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Creates hours of operation. </p>
 
 @param request A container for the necessary parameters to execute the CreateHoursOfOperation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateHoursOfOperationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorDuplicateResource`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateHoursOfOperationRequest
 @see AWSConnectCreateHoursOfOperationResponse
 */
- (AWSTask<AWSConnectCreateHoursOfOperationResponse *> *)createHoursOfOperation:(AWSConnectCreateHoursOfOperationRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Creates hours of operation. </p>
 
 @param request A container for the necessary parameters to execute the CreateHoursOfOperation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorDuplicateResource`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateHoursOfOperationRequest
 @see AWSConnectCreateHoursOfOperationResponse
 */
- (void)createHoursOfOperation:(AWSConnectCreateHoursOfOperationRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreateHoursOfOperationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Initiates an Amazon Connect instance with all the supported channels enabled. It does not attach any storage, such as Amazon Simple Storage Service (Amazon S3) or Amazon Kinesis. It also does not allow for any configurations on features, such as Contact Lens for Amazon Connect. </p><p>Amazon Connect enforces a limit on the total number of instances that you can create or delete in 30 days. If you exceed this limit, you will get an error message indicating there has been an excessive number of attempts at creating or deleting instances. You must wait 30 days before you can restart creating and deleting instances in your account.</p>
 
 @param request A container for the necessary parameters to execute the CreateInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateInstanceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateInstanceRequest
 @see AWSConnectCreateInstanceResponse
 */
- (AWSTask<AWSConnectCreateInstanceResponse *> *)createInstance:(AWSConnectCreateInstanceRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Initiates an Amazon Connect instance with all the supported channels enabled. It does not attach any storage, such as Amazon Simple Storage Service (Amazon S3) or Amazon Kinesis. It also does not allow for any configurations on features, such as Contact Lens for Amazon Connect. </p><p>Amazon Connect enforces a limit on the total number of instances that you can create or delete in 30 days. If you exceed this limit, you will get an error message indicating there has been an excessive number of attempts at creating or deleting instances. You must wait 30 days before you can restart creating and deleting instances in your account.</p>
 
 @param request A container for the necessary parameters to execute the CreateInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateInstanceRequest
 @see AWSConnectCreateInstanceResponse
 */
- (void)createInstance:(AWSConnectCreateInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreateInstanceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon Web Services resource association with an Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the CreateIntegrationAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateIntegrationAssociationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectCreateIntegrationAssociationRequest
 @see AWSConnectCreateIntegrationAssociationResponse
 */
- (AWSTask<AWSConnectCreateIntegrationAssociationResponse *> *)createIntegrationAssociation:(AWSConnectCreateIntegrationAssociationRequest *)request;

/**
 <p>Creates an Amazon Web Services resource association with an Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the CreateIntegrationAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectCreateIntegrationAssociationRequest
 @see AWSConnectCreateIntegrationAssociationResponse
 */
- (void)createIntegrationAssociation:(AWSConnectCreateIntegrationAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreateIntegrationAssociationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Creates a new queue for the specified Amazon Connect instance.</p><important><p>If the number being used in the input is claimed to a traffic distribution group, and you are calling this API using an instance in the Amazon Web Services Region where the traffic distribution group was created, you can use either a full phone number ARN or UUID value for the <code>OutboundCallerIdNumberId</code> value of the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_OutboundCallerConfig">OutboundCallerConfig</a> request body parameter. However, if the number is claimed to a traffic distribution group and you are calling this API using an instance in the alternate Amazon Web Services Region associated with the traffic distribution group, you must provide a full phone number ARN. If a UUID is provided in this scenario, you will receive a <code>ResourceNotFoundException</code>.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateQueue service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateQueueResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateQueueRequest
 @see AWSConnectCreateQueueResponse
 */
- (AWSTask<AWSConnectCreateQueueResponse *> *)createQueue:(AWSConnectCreateQueueRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Creates a new queue for the specified Amazon Connect instance.</p><important><p>If the number being used in the input is claimed to a traffic distribution group, and you are calling this API using an instance in the Amazon Web Services Region where the traffic distribution group was created, you can use either a full phone number ARN or UUID value for the <code>OutboundCallerIdNumberId</code> value of the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_OutboundCallerConfig">OutboundCallerConfig</a> request body parameter. However, if the number is claimed to a traffic distribution group and you are calling this API using an instance in the alternate Amazon Web Services Region associated with the traffic distribution group, you must provide a full phone number ARN. If a UUID is provided in this scenario, you will receive a <code>ResourceNotFoundException</code>.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateQueue service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateQueueRequest
 @see AWSConnectCreateQueueResponse
 */
- (void)createQueue:(AWSConnectCreateQueueRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreateQueueResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a quick connect for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the CreateQuickConnect service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateQuickConnectResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateQuickConnectRequest
 @see AWSConnectCreateQuickConnectResponse
 */
- (AWSTask<AWSConnectCreateQuickConnectResponse *> *)createQuickConnect:(AWSConnectCreateQuickConnectRequest *)request;

/**
 <p>Creates a quick connect for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the CreateQuickConnect service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateQuickConnectRequest
 @see AWSConnectCreateQuickConnectResponse
 */
- (void)createQuickConnect:(AWSConnectCreateQuickConnectRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreateQuickConnectResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new routing profile.</p>
 
 @param request A container for the necessary parameters to execute the CreateRoutingProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateRoutingProfileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateRoutingProfileRequest
 @see AWSConnectCreateRoutingProfileResponse
 */
- (AWSTask<AWSConnectCreateRoutingProfileResponse *> *)createRoutingProfile:(AWSConnectCreateRoutingProfileRequest *)request;

/**
 <p>Creates a new routing profile.</p>
 
 @param request A container for the necessary parameters to execute the CreateRoutingProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateRoutingProfileRequest
 @see AWSConnectCreateRoutingProfileResponse
 */
- (void)createRoutingProfile:(AWSConnectCreateRoutingProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreateRoutingProfileResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Creates a security profile.</p>
 
 @param request A container for the necessary parameters to execute the CreateSecurityProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateSecurityProfileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateSecurityProfileRequest
 @see AWSConnectCreateSecurityProfileResponse
 */
- (AWSTask<AWSConnectCreateSecurityProfileResponse *> *)createSecurityProfile:(AWSConnectCreateSecurityProfileRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Creates a security profile.</p>
 
 @param request A container for the necessary parameters to execute the CreateSecurityProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateSecurityProfileRequest
 @see AWSConnectCreateSecurityProfileResponse
 */
- (void)createSecurityProfile:(AWSConnectCreateSecurityProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreateSecurityProfileResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new task template in the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the CreateTaskTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateTaskTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorPropertyValidation`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateTaskTemplateRequest
 @see AWSConnectCreateTaskTemplateResponse
 */
- (AWSTask<AWSConnectCreateTaskTemplateResponse *> *)createTaskTemplate:(AWSConnectCreateTaskTemplateRequest *)request;

/**
 <p>Creates a new task template in the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the CreateTaskTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorPropertyValidation`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateTaskTemplateRequest
 @see AWSConnectCreateTaskTemplateResponse
 */
- (void)createTaskTemplate:(AWSConnectCreateTaskTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreateTaskTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a traffic distribution group given an Amazon Connect instance that has been replicated. </p><p>For more information about creating traffic distribution groups, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/setup-traffic-distribution-groups.html">Set up traffic distribution groups</a> in the <i>Amazon Connect Administrator Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the CreateTrafficDistributionGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateTrafficDistributionGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorResourceNotReady`.
 
 @see AWSConnectCreateTrafficDistributionGroupRequest
 @see AWSConnectCreateTrafficDistributionGroupResponse
 */
- (AWSTask<AWSConnectCreateTrafficDistributionGroupResponse *> *)createTrafficDistributionGroup:(AWSConnectCreateTrafficDistributionGroupRequest *)request;

/**
 <p>Creates a traffic distribution group given an Amazon Connect instance that has been replicated. </p><p>For more information about creating traffic distribution groups, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/setup-traffic-distribution-groups.html">Set up traffic distribution groups</a> in the <i>Amazon Connect Administrator Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the CreateTrafficDistributionGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorResourceNotReady`.
 
 @see AWSConnectCreateTrafficDistributionGroupRequest
 @see AWSConnectCreateTrafficDistributionGroupResponse
 */
- (void)createTrafficDistributionGroup:(AWSConnectCreateTrafficDistributionGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreateTrafficDistributionGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a use case for an integration association.</p>
 
 @param request A container for the necessary parameters to execute the CreateUseCase service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateUseCaseResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectCreateUseCaseRequest
 @see AWSConnectCreateUseCaseResponse
 */
- (AWSTask<AWSConnectCreateUseCaseResponse *> *)createUseCase:(AWSConnectCreateUseCaseRequest *)request;

/**
 <p>Creates a use case for an integration association.</p>
 
 @param request A container for the necessary parameters to execute the CreateUseCase service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectCreateUseCaseRequest
 @see AWSConnectCreateUseCaseResponse
 */
- (void)createUseCase:(AWSConnectCreateUseCaseRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreateUseCaseResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a user account for the specified Amazon Connect instance.</p><p>For information about how to create user accounts using the Amazon Connect console, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/user-management.html">Add Users</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateUserRequest
 @see AWSConnectCreateUserResponse
 */
- (AWSTask<AWSConnectCreateUserResponse *> *)createUser:(AWSConnectCreateUserRequest *)request;

/**
 <p>Creates a user account for the specified Amazon Connect instance.</p><p>For information about how to create user accounts using the Amazon Connect console, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/user-management.html">Add Users</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateUserRequest
 @see AWSConnectCreateUserResponse
 */
- (void)createUser:(AWSConnectCreateUserRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreateUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new user hierarchy group.</p>
 
 @param request A container for the necessary parameters to execute the CreateUserHierarchyGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateUserHierarchyGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateUserHierarchyGroupRequest
 @see AWSConnectCreateUserHierarchyGroupResponse
 */
- (AWSTask<AWSConnectCreateUserHierarchyGroupResponse *> *)createUserHierarchyGroup:(AWSConnectCreateUserHierarchyGroupRequest *)request;

/**
 <p>Creates a new user hierarchy group.</p>
 
 @param request A container for the necessary parameters to execute the CreateUserHierarchyGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateUserHierarchyGroupRequest
 @see AWSConnectCreateUserHierarchyGroupResponse
 */
- (void)createUserHierarchyGroup:(AWSConnectCreateUserHierarchyGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreateUserHierarchyGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a custom vocabulary associated with your Amazon Connect instance. You can set a custom vocabulary to be your default vocabulary for a given language. Contact Lens for Amazon Connect uses the default vocabulary in post-call and real-time contact analysis sessions for that language.</p>
 
 @param request A container for the necessary parameters to execute the CreateVocabulary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateVocabularyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorServiceQuotaExceeded`.
 
 @see AWSConnectCreateVocabularyRequest
 @see AWSConnectCreateVocabularyResponse
 */
- (AWSTask<AWSConnectCreateVocabularyResponse *> *)createVocabulary:(AWSConnectCreateVocabularyRequest *)request;

/**
 <p>Creates a custom vocabulary associated with your Amazon Connect instance. You can set a custom vocabulary to be your default vocabulary for a given language. Contact Lens for Amazon Connect uses the default vocabulary in post-call and real-time contact analysis sessions for that language.</p>
 
 @param request A container for the necessary parameters to execute the CreateVocabulary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorServiceQuotaExceeded`.
 
 @see AWSConnectCreateVocabularyRequest
 @see AWSConnectCreateVocabularyResponse
 */
- (void)createVocabulary:(AWSConnectCreateVocabularyRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreateVocabularyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a flow for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the DeleteContactFlow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDeleteContactFlowRequest
 */
- (AWSTask *)deleteContactFlow:(AWSConnectDeleteContactFlowRequest *)request;

/**
 <p>Deletes a flow for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the DeleteContactFlow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDeleteContactFlowRequest
 */
- (void)deleteContactFlow:(AWSConnectDeleteContactFlowRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified flow module.</p>
 
 @param request A container for the necessary parameters to execute the DeleteContactFlowModule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDeleteContactFlowModuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteContactFlowModuleRequest
 @see AWSConnectDeleteContactFlowModuleResponse
 */
- (AWSTask<AWSConnectDeleteContactFlowModuleResponse *> *)deleteContactFlowModule:(AWSConnectDeleteContactFlowModuleRequest *)request;

/**
 <p>Deletes the specified flow module.</p>
 
 @param request A container for the necessary parameters to execute the DeleteContactFlowModule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteContactFlowModuleRequest
 @see AWSConnectDeleteContactFlowModuleResponse
 */
- (void)deleteContactFlowModule:(AWSConnectDeleteContactFlowModuleRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDeleteContactFlowModuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Deletes an hours of operation.</p>
 
 @param request A container for the necessary parameters to execute the DeleteHoursOfOperation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteHoursOfOperationRequest
 */
- (AWSTask *)deleteHoursOfOperation:(AWSConnectDeleteHoursOfOperationRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Deletes an hours of operation.</p>
 
 @param request A container for the necessary parameters to execute the DeleteHoursOfOperation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteHoursOfOperationRequest
 */
- (void)deleteHoursOfOperation:(AWSConnectDeleteHoursOfOperationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Deletes the Amazon Connect instance.</p><p>Amazon Connect enforces a limit on the total number of instances that you can create or delete in 30 days. If you exceed this limit, you will get an error message indicating there has been an excessive number of attempts at creating or deleting instances. You must wait 30 days before you can restart creating and deleting instances in your account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`.
 
 @see AWSConnectDeleteInstanceRequest
 */
- (AWSTask *)deleteInstance:(AWSConnectDeleteInstanceRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Deletes the Amazon Connect instance.</p><p>Amazon Connect enforces a limit on the total number of instances that you can create or delete in 30 days. If you exceed this limit, you will get an error message indicating there has been an excessive number of attempts at creating or deleting instances. You must wait 30 days before you can restart creating and deleting instances in your account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`.
 
 @see AWSConnectDeleteInstanceRequest
 */
- (void)deleteInstance:(AWSConnectDeleteInstanceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an Amazon Web Services resource association from an Amazon Connect instance. The association must not have any use cases associated with it.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIntegrationAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDeleteIntegrationAssociationRequest
 */
- (AWSTask *)deleteIntegrationAssociation:(AWSConnectDeleteIntegrationAssociationRequest *)request;

/**
 <p>Deletes an Amazon Web Services resource association from an Amazon Connect instance. The association must not have any use cases associated with it.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIntegrationAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDeleteIntegrationAssociationRequest
 */
- (void)deleteIntegrationAssociation:(AWSConnectDeleteIntegrationAssociationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a quick connect.</p>
 
 @param request A container for the necessary parameters to execute the DeleteQuickConnect service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteQuickConnectRequest
 */
- (AWSTask *)deleteQuickConnect:(AWSConnectDeleteQuickConnectRequest *)request;

/**
 <p>Deletes a quick connect.</p>
 
 @param request A container for the necessary parameters to execute the DeleteQuickConnect service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteQuickConnectRequest
 */
- (void)deleteQuickConnect:(AWSConnectDeleteQuickConnectRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Deletes a security profile.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSecurityProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceInUse`.
 
 @see AWSConnectDeleteSecurityProfileRequest
 */
- (AWSTask *)deleteSecurityProfile:(AWSConnectDeleteSecurityProfileRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Deletes a security profile.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSecurityProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceInUse`.
 
 @see AWSConnectDeleteSecurityProfileRequest
 */
- (void)deleteSecurityProfile:(AWSConnectDeleteSecurityProfileRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the task template.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTaskTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDeleteTaskTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteTaskTemplateRequest
 @see AWSConnectDeleteTaskTemplateResponse
 */
- (AWSTask<AWSConnectDeleteTaskTemplateResponse *> *)deleteTaskTemplate:(AWSConnectDeleteTaskTemplateRequest *)request;

/**
 <p>Deletes the task template.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTaskTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteTaskTemplateRequest
 @see AWSConnectDeleteTaskTemplateResponse
 */
- (void)deleteTaskTemplate:(AWSConnectDeleteTaskTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDeleteTaskTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a traffic distribution group. This API can be called only in the Region where the traffic distribution group is created.</p><p>For more information about deleting traffic distribution groups, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/delete-traffic-distribution-groups.html">Delete traffic distribution groups</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrafficDistributionGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDeleteTrafficDistributionGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceInUse`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteTrafficDistributionGroupRequest
 @see AWSConnectDeleteTrafficDistributionGroupResponse
 */
- (AWSTask<AWSConnectDeleteTrafficDistributionGroupResponse *> *)deleteTrafficDistributionGroup:(AWSConnectDeleteTrafficDistributionGroupRequest *)request;

/**
 <p>Deletes a traffic distribution group. This API can be called only in the Region where the traffic distribution group is created.</p><p>For more information about deleting traffic distribution groups, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/delete-traffic-distribution-groups.html">Delete traffic distribution groups</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrafficDistributionGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceInUse`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteTrafficDistributionGroupRequest
 @see AWSConnectDeleteTrafficDistributionGroupResponse
 */
- (void)deleteTrafficDistributionGroup:(AWSConnectDeleteTrafficDistributionGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDeleteTrafficDistributionGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a use case from an integration association.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUseCase service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDeleteUseCaseRequest
 */
- (AWSTask *)deleteUseCase:(AWSConnectDeleteUseCaseRequest *)request;

/**
 <p>Deletes a use case from an integration association.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUseCase service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDeleteUseCaseRequest
 */
- (void)deleteUseCase:(AWSConnectDeleteUseCaseRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a user account from the specified Amazon Connect instance.</p><p>For information about what happens to a user's data when their account is deleted, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/delete-users.html">Delete Users from Your Amazon Connect Instance</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteUserRequest
 */
- (AWSTask *)deleteUser:(AWSConnectDeleteUserRequest *)request;

/**
 <p>Deletes a user account from the specified Amazon Connect instance.</p><p>For information about what happens to a user's data when their account is deleted, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/delete-users.html">Delete Users from Your Amazon Connect Instance</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteUserRequest
 */
- (void)deleteUser:(AWSConnectDeleteUserRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an existing user hierarchy group. It must not be associated with any agents or have any active child groups.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUserHierarchyGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceInUse`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteUserHierarchyGroupRequest
 */
- (AWSTask *)deleteUserHierarchyGroup:(AWSConnectDeleteUserHierarchyGroupRequest *)request;

/**
 <p>Deletes an existing user hierarchy group. It must not be associated with any agents or have any active child groups.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUserHierarchyGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceInUse`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteUserHierarchyGroupRequest
 */
- (void)deleteUserHierarchyGroup:(AWSConnectDeleteUserHierarchyGroupRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the vocabulary that has the given identifier.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVocabulary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDeleteVocabularyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceInUse`.
 
 @see AWSConnectDeleteVocabularyRequest
 @see AWSConnectDeleteVocabularyResponse
 */
- (AWSTask<AWSConnectDeleteVocabularyResponse *> *)deleteVocabulary:(AWSConnectDeleteVocabularyRequest *)request;

/**
 <p>Deletes the vocabulary that has the given identifier.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVocabulary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceInUse`.
 
 @see AWSConnectDeleteVocabularyRequest
 @see AWSConnectDeleteVocabularyResponse
 */
- (void)deleteVocabulary:(AWSConnectDeleteVocabularyRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDeleteVocabularyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Describes an agent status.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAgentStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeAgentStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeAgentStatusRequest
 @see AWSConnectDescribeAgentStatusResponse
 */
- (AWSTask<AWSConnectDescribeAgentStatusResponse *> *)describeAgentStatus:(AWSConnectDescribeAgentStatusRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Describes an agent status.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAgentStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeAgentStatusRequest
 @see AWSConnectDescribeAgentStatusResponse
 */
- (void)describeAgentStatus:(AWSConnectDescribeAgentStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeAgentStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Describes the specified contact. </p><important><p>Contact information remains available in Amazon Connect for 24 months, and then it is deleted.</p><p>Only data from November 12, 2021, and later is returned by this API.</p></important>
 
 @param request A container for the necessary parameters to execute the DescribeContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDescribeContactRequest
 @see AWSConnectDescribeContactResponse
 */
- (AWSTask<AWSConnectDescribeContactResponse *> *)describeContact:(AWSConnectDescribeContactRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Describes the specified contact. </p><important><p>Contact information remains available in Amazon Connect for 24 months, and then it is deleted.</p><p>Only data from November 12, 2021, and later is returned by this API.</p></important>
 
 @param request A container for the necessary parameters to execute the DescribeContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDescribeContactRequest
 @see AWSConnectDescribeContactResponse
 */
- (void)describeContact:(AWSConnectDescribeContactRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified flow.</p><p>You can also create and update flows using the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect Flow language</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeContactFlow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeContactFlowResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorContactFlowNotPublished`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeContactFlowRequest
 @see AWSConnectDescribeContactFlowResponse
 */
- (AWSTask<AWSConnectDescribeContactFlowResponse *> *)describeContactFlow:(AWSConnectDescribeContactFlowRequest *)request;

/**
 <p>Describes the specified flow.</p><p>You can also create and update flows using the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect Flow language</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeContactFlow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorContactFlowNotPublished`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeContactFlowRequest
 @see AWSConnectDescribeContactFlowResponse
 */
- (void)describeContactFlow:(AWSConnectDescribeContactFlowRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeContactFlowResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified flow module.</p>
 
 @param request A container for the necessary parameters to execute the DescribeContactFlowModule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeContactFlowModuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeContactFlowModuleRequest
 @see AWSConnectDescribeContactFlowModuleResponse
 */
- (AWSTask<AWSConnectDescribeContactFlowModuleResponse *> *)describeContactFlowModule:(AWSConnectDescribeContactFlowModuleRequest *)request;

/**
 <p>Describes the specified flow module.</p>
 
 @param request A container for the necessary parameters to execute the DescribeContactFlowModule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeContactFlowModuleRequest
 @see AWSConnectDescribeContactFlowModuleResponse
 */
- (void)describeContactFlowModule:(AWSConnectDescribeContactFlowModuleRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeContactFlowModuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Describes the hours of operation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHoursOfOperation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeHoursOfOperationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeHoursOfOperationRequest
 @see AWSConnectDescribeHoursOfOperationResponse
 */
- (AWSTask<AWSConnectDescribeHoursOfOperationResponse *> *)describeHoursOfOperation:(AWSConnectDescribeHoursOfOperationRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Describes the hours of operation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHoursOfOperation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeHoursOfOperationRequest
 @see AWSConnectDescribeHoursOfOperationResponse
 */
- (void)describeHoursOfOperation:(AWSConnectDescribeHoursOfOperationRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeHoursOfOperationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Returns the current state of the specified instance identifier. It tracks the instance while it is being created and returns an error status, if applicable. </p><p>If an instance is not created successfully, the instance status reason field returns details relevant to the reason. The instance in a failed state is returned only for 24 hours after the CreateInstance API was invoked.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeInstanceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeInstanceRequest
 @see AWSConnectDescribeInstanceResponse
 */
- (AWSTask<AWSConnectDescribeInstanceResponse *> *)describeInstance:(AWSConnectDescribeInstanceRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Returns the current state of the specified instance identifier. It tracks the instance while it is being created and returns an error status, if applicable. </p><p>If an instance is not created successfully, the instance status reason field returns details relevant to the reason. The instance in a failed state is returned only for 24 hours after the CreateInstance API was invoked.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeInstanceRequest
 @see AWSConnectDescribeInstanceResponse
 */
- (void)describeInstance:(AWSConnectDescribeInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeInstanceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Describes the specified instance attribute.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeInstanceAttributeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDescribeInstanceAttributeRequest
 @see AWSConnectDescribeInstanceAttributeResponse
 */
- (AWSTask<AWSConnectDescribeInstanceAttributeResponse *> *)describeInstanceAttribute:(AWSConnectDescribeInstanceAttributeRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Describes the specified instance attribute.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDescribeInstanceAttributeRequest
 @see AWSConnectDescribeInstanceAttributeResponse
 */
- (void)describeInstanceAttribute:(AWSConnectDescribeInstanceAttributeRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeInstanceAttributeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Retrieves the current storage configurations for the specified resource type, association ID, and instance ID.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceStorageConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeInstanceStorageConfigResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDescribeInstanceStorageConfigRequest
 @see AWSConnectDescribeInstanceStorageConfigResponse
 */
- (AWSTask<AWSConnectDescribeInstanceStorageConfigResponse *> *)describeInstanceStorageConfig:(AWSConnectDescribeInstanceStorageConfigRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Retrieves the current storage configurations for the specified resource type, association ID, and instance ID.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceStorageConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDescribeInstanceStorageConfigRequest
 @see AWSConnectDescribeInstanceStorageConfigResponse
 */
- (void)describeInstanceStorageConfig:(AWSConnectDescribeInstanceStorageConfigRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeInstanceStorageConfigResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets details and status of a phone number that’s claimed to your Amazon Connect instance or traffic distribution group.</p><important><p>If the number is claimed to a traffic distribution group, and you are calling in the Amazon Web Services Region where the traffic distribution group was created, you can use either a phone number ARN or UUID value for the <code>PhoneNumberId</code> URI request parameter. However, if the number is claimed to a traffic distribution group and you are calling this API in the alternate Amazon Web Services Region associated with the traffic distribution group, you must provide a full phone number ARN. If a UUID is provided in this scenario, you will receive a <code>ResourceNotFoundException</code>.</p></important>
 
 @param request A container for the necessary parameters to execute the DescribePhoneNumber service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribePhoneNumberResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectDescribePhoneNumberRequest
 @see AWSConnectDescribePhoneNumberResponse
 */
- (AWSTask<AWSConnectDescribePhoneNumberResponse *> *)describePhoneNumber:(AWSConnectDescribePhoneNumberRequest *)request;

/**
 <p>Gets details and status of a phone number that’s claimed to your Amazon Connect instance or traffic distribution group.</p><important><p>If the number is claimed to a traffic distribution group, and you are calling in the Amazon Web Services Region where the traffic distribution group was created, you can use either a phone number ARN or UUID value for the <code>PhoneNumberId</code> URI request parameter. However, if the number is claimed to a traffic distribution group and you are calling this API in the alternate Amazon Web Services Region associated with the traffic distribution group, you must provide a full phone number ARN. If a UUID is provided in this scenario, you will receive a <code>ResourceNotFoundException</code>.</p></important>
 
 @param request A container for the necessary parameters to execute the DescribePhoneNumber service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectDescribePhoneNumberRequest
 @see AWSConnectDescribePhoneNumberResponse
 */
- (void)describePhoneNumber:(AWSConnectDescribePhoneNumberRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribePhoneNumberResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Describes the specified queue.</p>
 
 @param request A container for the necessary parameters to execute the DescribeQueue service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeQueueResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeQueueRequest
 @see AWSConnectDescribeQueueResponse
 */
- (AWSTask<AWSConnectDescribeQueueResponse *> *)describeQueue:(AWSConnectDescribeQueueRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Describes the specified queue.</p>
 
 @param request A container for the necessary parameters to execute the DescribeQueue service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeQueueRequest
 @see AWSConnectDescribeQueueResponse
 */
- (void)describeQueue:(AWSConnectDescribeQueueRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeQueueResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the quick connect.</p>
 
 @param request A container for the necessary parameters to execute the DescribeQuickConnect service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeQuickConnectResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeQuickConnectRequest
 @see AWSConnectDescribeQuickConnectResponse
 */
- (AWSTask<AWSConnectDescribeQuickConnectResponse *> *)describeQuickConnect:(AWSConnectDescribeQuickConnectRequest *)request;

/**
 <p>Describes the quick connect.</p>
 
 @param request A container for the necessary parameters to execute the DescribeQuickConnect service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeQuickConnectRequest
 @see AWSConnectDescribeQuickConnectResponse
 */
- (void)describeQuickConnect:(AWSConnectDescribeQuickConnectRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeQuickConnectResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified routing profile.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRoutingProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeRoutingProfileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeRoutingProfileRequest
 @see AWSConnectDescribeRoutingProfileResponse
 */
- (AWSTask<AWSConnectDescribeRoutingProfileResponse *> *)describeRoutingProfile:(AWSConnectDescribeRoutingProfileRequest *)request;

/**
 <p>Describes the specified routing profile.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRoutingProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeRoutingProfileRequest
 @see AWSConnectDescribeRoutingProfileResponse
 */
- (void)describeRoutingProfile:(AWSConnectDescribeRoutingProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeRoutingProfileResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Gets basic information about the security profle.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSecurityProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeSecurityProfileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeSecurityProfileRequest
 @see AWSConnectDescribeSecurityProfileResponse
 */
- (AWSTask<AWSConnectDescribeSecurityProfileResponse *> *)describeSecurityProfile:(AWSConnectDescribeSecurityProfileRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Gets basic information about the security profle.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSecurityProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeSecurityProfileRequest
 @see AWSConnectDescribeSecurityProfileResponse
 */
- (void)describeSecurityProfile:(AWSConnectDescribeSecurityProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeSecurityProfileResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets details and status of a traffic distribution group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrafficDistributionGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeTrafficDistributionGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDescribeTrafficDistributionGroupRequest
 @see AWSConnectDescribeTrafficDistributionGroupResponse
 */
- (AWSTask<AWSConnectDescribeTrafficDistributionGroupResponse *> *)describeTrafficDistributionGroup:(AWSConnectDescribeTrafficDistributionGroupRequest *)request;

/**
 <p>Gets details and status of a traffic distribution group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrafficDistributionGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDescribeTrafficDistributionGroupRequest
 @see AWSConnectDescribeTrafficDistributionGroupResponse
 */
- (void)describeTrafficDistributionGroup:(AWSConnectDescribeTrafficDistributionGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeTrafficDistributionGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified user account. You can find the instance ID in the console (it’s the final part of the ARN). The console does not display the user IDs. Instead, list the users and note the IDs provided in the output.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeUserRequest
 @see AWSConnectDescribeUserResponse
 */
- (AWSTask<AWSConnectDescribeUserResponse *> *)describeUser:(AWSConnectDescribeUserRequest *)request;

/**
 <p>Describes the specified user account. You can find the instance ID in the console (it’s the final part of the ARN). The console does not display the user IDs. Instead, list the users and note the IDs provided in the output.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeUserRequest
 @see AWSConnectDescribeUserResponse
 */
- (void)describeUser:(AWSConnectDescribeUserRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified hierarchy group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserHierarchyGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeUserHierarchyGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeUserHierarchyGroupRequest
 @see AWSConnectDescribeUserHierarchyGroupResponse
 */
- (AWSTask<AWSConnectDescribeUserHierarchyGroupResponse *> *)describeUserHierarchyGroup:(AWSConnectDescribeUserHierarchyGroupRequest *)request;

/**
 <p>Describes the specified hierarchy group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserHierarchyGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeUserHierarchyGroupRequest
 @see AWSConnectDescribeUserHierarchyGroupResponse
 */
- (void)describeUserHierarchyGroup:(AWSConnectDescribeUserHierarchyGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeUserHierarchyGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the hierarchy structure of the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserHierarchyStructure service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeUserHierarchyStructureResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeUserHierarchyStructureRequest
 @see AWSConnectDescribeUserHierarchyStructureResponse
 */
- (AWSTask<AWSConnectDescribeUserHierarchyStructureResponse *> *)describeUserHierarchyStructure:(AWSConnectDescribeUserHierarchyStructureRequest *)request;

/**
 <p>Describes the hierarchy structure of the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserHierarchyStructure service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeUserHierarchyStructureRequest
 @see AWSConnectDescribeUserHierarchyStructureResponse
 */
- (void)describeUserHierarchyStructure:(AWSConnectDescribeUserHierarchyStructureRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeUserHierarchyStructureResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified vocabulary.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVocabulary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeVocabularyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectDescribeVocabularyRequest
 @see AWSConnectDescribeVocabularyResponse
 */
- (AWSTask<AWSConnectDescribeVocabularyResponse *> *)describeVocabulary:(AWSConnectDescribeVocabularyRequest *)request;

/**
 <p>Describes the specified vocabulary.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVocabulary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectDescribeVocabularyRequest
 @see AWSConnectDescribeVocabularyResponse
 */
- (void)describeVocabulary:(AWSConnectDescribeVocabularyRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeVocabularyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Revokes access to integrated applications from Amazon Connect.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateApprovedOrigin service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDisassociateApprovedOriginRequest
 */
- (AWSTask *)disassociateApprovedOrigin:(AWSConnectDisassociateApprovedOriginRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Revokes access to integrated applications from Amazon Connect.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateApprovedOrigin service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDisassociateApprovedOriginRequest
 */
- (void)disassociateApprovedOrigin:(AWSConnectDisassociateApprovedOriginRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Revokes authorization from the specified instance to access the specified Amazon Lex or Amazon Lex V2 bot. </p>
 
 @param request A container for the necessary parameters to execute the DisassociateBot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDisassociateBotRequest
 */
- (AWSTask *)disassociateBot:(AWSConnectDisassociateBotRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Revokes authorization from the specified instance to access the specified Amazon Lex or Amazon Lex V2 bot. </p>
 
 @param request A container for the necessary parameters to execute the DisassociateBot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDisassociateBotRequest
 */
- (void)disassociateBot:(AWSConnectDisassociateBotRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Removes the storage type configurations for the specified resource type and association ID.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateInstanceStorageConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDisassociateInstanceStorageConfigRequest
 */
- (AWSTask *)disassociateInstanceStorageConfig:(AWSConnectDisassociateInstanceStorageConfigRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Removes the storage type configurations for the specified resource type and association ID.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateInstanceStorageConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDisassociateInstanceStorageConfigRequest
 */
- (void)disassociateInstanceStorageConfig:(AWSConnectDisassociateInstanceStorageConfigRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Remove the Lambda function from the dropdown options available in the relevant flow blocks.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateLambdaFunction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDisassociateLambdaFunctionRequest
 */
- (AWSTask *)disassociateLambdaFunction:(AWSConnectDisassociateLambdaFunctionRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Remove the Lambda function from the dropdown options available in the relevant flow blocks.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateLambdaFunction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDisassociateLambdaFunctionRequest
 */
- (void)disassociateLambdaFunction:(AWSConnectDisassociateLambdaFunctionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Revokes authorization from the specified instance to access the specified Amazon Lex bot.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateLexBot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDisassociateLexBotRequest
 */
- (AWSTask *)disassociateLexBot:(AWSConnectDisassociateLexBotRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Revokes authorization from the specified instance to access the specified Amazon Lex bot.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateLexBot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDisassociateLexBotRequest
 */
- (void)disassociateLexBot:(AWSConnectDisassociateLexBotRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes the flow association from a phone number claimed to your Amazon Connect instance.</p><important><p>If the number is claimed to a traffic distribution group, and you are calling this API using an instance in the Amazon Web Services Region where the traffic distribution group was created, you can use either a full phone number ARN or UUID value for the <code>PhoneNumberId</code> URI request parameter. However, if the number is claimed to a traffic distribution group and you are calling this API using an instance in the alternate Amazon Web Services Region associated with the traffic distribution group, you must provide a full phone number ARN. If a UUID is provided in this scenario, you will receive a <code>ResourceNotFoundException</code>.</p></important>
 
 @param request A container for the necessary parameters to execute the DisassociatePhoneNumberContactFlow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectDisassociatePhoneNumberContactFlowRequest
 */
- (AWSTask *)disassociatePhoneNumberContactFlow:(AWSConnectDisassociatePhoneNumberContactFlowRequest *)request;

/**
 <p>Removes the flow association from a phone number claimed to your Amazon Connect instance.</p><important><p>If the number is claimed to a traffic distribution group, and you are calling this API using an instance in the Amazon Web Services Region where the traffic distribution group was created, you can use either a full phone number ARN or UUID value for the <code>PhoneNumberId</code> URI request parameter. However, if the number is claimed to a traffic distribution group and you are calling this API using an instance in the alternate Amazon Web Services Region associated with the traffic distribution group, you must provide a full phone number ARN. If a UUID is provided in this scenario, you will receive a <code>ResourceNotFoundException</code>.</p></important>
 
 @param request A container for the necessary parameters to execute the DisassociatePhoneNumberContactFlow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectDisassociatePhoneNumberContactFlowRequest
 */
- (void)disassociatePhoneNumberContactFlow:(AWSConnectDisassociatePhoneNumberContactFlowRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Disassociates a set of quick connects from a queue.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateQueueQuickConnects service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDisassociateQueueQuickConnectsRequest
 */
- (AWSTask *)disassociateQueueQuickConnects:(AWSConnectDisassociateQueueQuickConnectsRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Disassociates a set of quick connects from a queue.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateQueueQuickConnects service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDisassociateQueueQuickConnectsRequest
 */
- (void)disassociateQueueQuickConnects:(AWSConnectDisassociateQueueQuickConnectsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a set of queues from a routing profile.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateRoutingProfileQueues service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDisassociateRoutingProfileQueuesRequest
 */
- (AWSTask *)disassociateRoutingProfileQueues:(AWSConnectDisassociateRoutingProfileQueuesRequest *)request;

/**
 <p>Disassociates a set of queues from a routing profile.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateRoutingProfileQueues service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDisassociateRoutingProfileQueuesRequest
 */
- (void)disassociateRoutingProfileQueues:(AWSConnectDisassociateRoutingProfileQueuesRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Deletes the specified security key.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateSecurityKey service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDisassociateSecurityKeyRequest
 */
- (AWSTask *)disassociateSecurityKey:(AWSConnectDisassociateSecurityKeyRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Deletes the specified security key.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateSecurityKey service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDisassociateSecurityKeyRequest
 */
- (void)disassociateSecurityKey:(AWSConnectDisassociateSecurityKeyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Dismisses contacts from an agent’s CCP and returns the agent to an available state, which allows the agent to receive a new routed contact. Contacts can only be dismissed if they are in a <code>MISSED</code>, <code>ERROR</code>, <code>ENDED</code>, or <code>REJECTED</code> state in the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/about-contact-states.html">Agent Event Stream</a>.</p>
 
 @param request A container for the necessary parameters to execute the DismissUserContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDismissUserContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDismissUserContactRequest
 @see AWSConnectDismissUserContactResponse
 */
- (AWSTask<AWSConnectDismissUserContactResponse *> *)dismissUserContact:(AWSConnectDismissUserContactRequest *)request;

/**
 <p>Dismisses contacts from an agent’s CCP and returns the agent to an available state, which allows the agent to receive a new routed contact. Contacts can only be dismissed if they are in a <code>MISSED</code>, <code>ERROR</code>, <code>ENDED</code>, or <code>REJECTED</code> state in the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/about-contact-states.html">Agent Event Stream</a>.</p>
 
 @param request A container for the necessary parameters to execute the DismissUserContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDismissUserContactRequest
 @see AWSConnectDismissUserContactResponse
 */
- (void)dismissUserContact:(AWSConnectDismissUserContactRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDismissUserContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the contact attributes for the specified contact.</p>
 
 @param request A container for the necessary parameters to execute the GetContactAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectGetContactAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectGetContactAttributesRequest
 @see AWSConnectGetContactAttributesResponse
 */
- (AWSTask<AWSConnectGetContactAttributesResponse *> *)getContactAttributes:(AWSConnectGetContactAttributesRequest *)request;

/**
 <p>Retrieves the contact attributes for the specified contact.</p>
 
 @param request A container for the necessary parameters to execute the GetContactAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectGetContactAttributesRequest
 @see AWSConnectGetContactAttributesResponse
 */
- (void)getContactAttributes:(AWSConnectGetContactAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectGetContactAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the real-time metric data from the specified Amazon Connect instance.</p><p>For a description of each metric, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html">Real-time Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetCurrentMetricData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectGetCurrentMetricDataResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`.
 
 @see AWSConnectGetCurrentMetricDataRequest
 @see AWSConnectGetCurrentMetricDataResponse
 */
- (AWSTask<AWSConnectGetCurrentMetricDataResponse *> *)getCurrentMetricData:(AWSConnectGetCurrentMetricDataRequest *)request;

/**
 <p>Gets the real-time metric data from the specified Amazon Connect instance.</p><p>For a description of each metric, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html">Real-time Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetCurrentMetricData service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`.
 
 @see AWSConnectGetCurrentMetricDataRequest
 @see AWSConnectGetCurrentMetricDataResponse
 */
- (void)getCurrentMetricData:(AWSConnectGetCurrentMetricDataRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectGetCurrentMetricDataResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the real-time active user data from the specified Amazon Connect instance. </p>
 
 @param request A container for the necessary parameters to execute the GetCurrentUserData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectGetCurrentUserDataResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`.
 
 @see AWSConnectGetCurrentUserDataRequest
 @see AWSConnectGetCurrentUserDataResponse
 */
- (AWSTask<AWSConnectGetCurrentUserDataResponse *> *)getCurrentUserData:(AWSConnectGetCurrentUserDataRequest *)request;

/**
 <p>Gets the real-time active user data from the specified Amazon Connect instance. </p>
 
 @param request A container for the necessary parameters to execute the GetCurrentUserData service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`.
 
 @see AWSConnectGetCurrentUserDataRequest
 @see AWSConnectGetCurrentUserDataResponse
 */
- (void)getCurrentUserData:(AWSConnectGetCurrentUserDataRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectGetCurrentUserDataResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a token for federation.</p><note><p>This API doesn't support root users. If you try to invoke GetFederationToken with root credentials, an error message similar to the following one appears: </p><p><code>Provided identity: Principal: .... User: .... cannot be used for federation with Amazon Connect</code></p></note>
 
 @param request A container for the necessary parameters to execute the GetFederationToken service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectGetFederationTokenResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorUserNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorDuplicateResource`.
 
 @see AWSConnectGetFederationTokenRequest
 @see AWSConnectGetFederationTokenResponse
 */
- (AWSTask<AWSConnectGetFederationTokenResponse *> *)getFederationToken:(AWSConnectGetFederationTokenRequest *)request;

/**
 <p>Retrieves a token for federation.</p><note><p>This API doesn't support root users. If you try to invoke GetFederationToken with root credentials, an error message similar to the following one appears: </p><p><code>Provided identity: Principal: .... User: .... cannot be used for federation with Amazon Connect</code></p></note>
 
 @param request A container for the necessary parameters to execute the GetFederationToken service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorUserNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorDuplicateResource`.
 
 @see AWSConnectGetFederationTokenRequest
 @see AWSConnectGetFederationTokenResponse
 */
- (void)getFederationToken:(AWSConnectGetFederationTokenRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectGetFederationTokenResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets historical metric data from the specified Amazon Connect instance.</p><p>For a description of each historical metric, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics-definitions.html">Historical Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetMetricData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectGetMetricDataResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`.
 
 @see AWSConnectGetMetricDataRequest
 @see AWSConnectGetMetricDataResponse
 */
- (AWSTask<AWSConnectGetMetricDataResponse *> *)getMetricData:(AWSConnectGetMetricDataRequest *)request;

/**
 <p>Gets historical metric data from the specified Amazon Connect instance.</p><p>For a description of each historical metric, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics-definitions.html">Historical Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetMetricData service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`.
 
 @see AWSConnectGetMetricDataRequest
 @see AWSConnectGetMetricDataResponse
 */
- (void)getMetricData:(AWSConnectGetMetricDataRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectGetMetricDataResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets details about a specific task template in the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the GetTaskTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectGetTaskTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectGetTaskTemplateRequest
 @see AWSConnectGetTaskTemplateResponse
 */
- (AWSTask<AWSConnectGetTaskTemplateResponse *> *)getTaskTemplate:(AWSConnectGetTaskTemplateRequest *)request;

/**
 <p>Gets details about a specific task template in the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the GetTaskTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectGetTaskTemplateRequest
 @see AWSConnectGetTaskTemplateResponse
 */
- (void)getTaskTemplate:(AWSConnectGetTaskTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectGetTaskTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the current traffic distribution for a given traffic distribution group.</p>
 
 @param request A container for the necessary parameters to execute the GetTrafficDistribution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectGetTrafficDistributionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectGetTrafficDistributionRequest
 @see AWSConnectGetTrafficDistributionResponse
 */
- (AWSTask<AWSConnectGetTrafficDistributionResponse *> *)getTrafficDistribution:(AWSConnectGetTrafficDistributionRequest *)request;

/**
 <p>Retrieves the current traffic distribution for a given traffic distribution group.</p>
 
 @param request A container for the necessary parameters to execute the GetTrafficDistribution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectGetTrafficDistributionRequest
 @see AWSConnectGetTrafficDistributionResponse
 */
- (void)getTrafficDistribution:(AWSConnectGetTrafficDistributionRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectGetTrafficDistributionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Lists agent statuses.</p>
 
 @param request A container for the necessary parameters to execute the ListAgentStatuses service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListAgentStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListAgentStatusRequest
 @see AWSConnectListAgentStatusResponse
 */
- (AWSTask<AWSConnectListAgentStatusResponse *> *)listAgentStatuses:(AWSConnectListAgentStatusRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Lists agent statuses.</p>
 
 @param request A container for the necessary parameters to execute the ListAgentStatuses service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListAgentStatusRequest
 @see AWSConnectListAgentStatusResponse
 */
- (void)listAgentStatuses:(AWSConnectListAgentStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListAgentStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Returns a paginated list of all approved origins associated with the instance.</p>
 
 @param request A container for the necessary parameters to execute the ListApprovedOrigins service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListApprovedOriginsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListApprovedOriginsRequest
 @see AWSConnectListApprovedOriginsResponse
 */
- (AWSTask<AWSConnectListApprovedOriginsResponse *> *)listApprovedOrigins:(AWSConnectListApprovedOriginsRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Returns a paginated list of all approved origins associated with the instance.</p>
 
 @param request A container for the necessary parameters to execute the ListApprovedOrigins service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListApprovedOriginsRequest
 @see AWSConnectListApprovedOriginsResponse
 */
- (void)listApprovedOrigins:(AWSConnectListApprovedOriginsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListApprovedOriginsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>For the specified version of Amazon Lex, returns a paginated list of all the Amazon Lex bots currently associated with the instance. Use this API to returns both Amazon Lex V1 and V2 bots.</p>
 
 @param request A container for the necessary parameters to execute the ListBots service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListBotsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListBotsRequest
 @see AWSConnectListBotsResponse
 */
- (AWSTask<AWSConnectListBotsResponse *> *)listBots:(AWSConnectListBotsRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>For the specified version of Amazon Lex, returns a paginated list of all the Amazon Lex bots currently associated with the instance. Use this API to returns both Amazon Lex V1 and V2 bots.</p>
 
 @param request A container for the necessary parameters to execute the ListBots service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListBotsRequest
 @see AWSConnectListBotsResponse
 */
- (void)listBots:(AWSConnectListBotsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListBotsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about the flow modules for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListContactFlowModules service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListContactFlowModulesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListContactFlowModulesRequest
 @see AWSConnectListContactFlowModulesResponse
 */
- (AWSTask<AWSConnectListContactFlowModulesResponse *> *)listContactFlowModules:(AWSConnectListContactFlowModulesRequest *)request;

/**
 <p>Provides information about the flow modules for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListContactFlowModules service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListContactFlowModulesRequest
 @see AWSConnectListContactFlowModulesResponse
 */
- (void)listContactFlowModules:(AWSConnectListContactFlowModulesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListContactFlowModulesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about the flows for the specified Amazon Connect instance.</p><p>You can also create and update flows using the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect Flow language</a>.</p><p>For more information about flows, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-contact-flows.html">Flows</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListContactFlows service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListContactFlowsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListContactFlowsRequest
 @see AWSConnectListContactFlowsResponse
 */
- (AWSTask<AWSConnectListContactFlowsResponse *> *)listContactFlows:(AWSConnectListContactFlowsRequest *)request;

/**
 <p>Provides information about the flows for the specified Amazon Connect instance.</p><p>You can also create and update flows using the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect Flow language</a>.</p><p>For more information about flows, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-contact-flows.html">Flows</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListContactFlows service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListContactFlowsRequest
 @see AWSConnectListContactFlowsResponse
 */
- (void)listContactFlows:(AWSConnectListContactFlowsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListContactFlowsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>For the specified <code>referenceTypes</code>, returns a list of references associated with the contact. </p>
 
 @param request A container for the necessary parameters to execute the ListContactReferences service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListContactReferencesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListContactReferencesRequest
 @see AWSConnectListContactReferencesResponse
 */
- (AWSTask<AWSConnectListContactReferencesResponse *> *)listContactReferences:(AWSConnectListContactReferencesRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>For the specified <code>referenceTypes</code>, returns a list of references associated with the contact. </p>
 
 @param request A container for the necessary parameters to execute the ListContactReferences service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListContactReferencesRequest
 @see AWSConnectListContactReferencesResponse
 */
- (void)listContactReferences:(AWSConnectListContactReferencesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListContactReferencesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the default vocabularies for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListDefaultVocabularies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListDefaultVocabulariesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectListDefaultVocabulariesRequest
 @see AWSConnectListDefaultVocabulariesResponse
 */
- (AWSTask<AWSConnectListDefaultVocabulariesResponse *> *)listDefaultVocabularies:(AWSConnectListDefaultVocabulariesRequest *)request;

/**
 <p>Lists the default vocabularies for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListDefaultVocabularies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectListDefaultVocabulariesRequest
 @see AWSConnectListDefaultVocabulariesResponse
 */
- (void)listDefaultVocabularies:(AWSConnectListDefaultVocabulariesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListDefaultVocabulariesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about the hours of operation for the specified Amazon Connect instance.</p><p>For more information about hours of operation, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/set-hours-operation.html">Set the Hours of Operation for a Queue</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListHoursOfOperations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListHoursOfOperationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListHoursOfOperationsRequest
 @see AWSConnectListHoursOfOperationsResponse
 */
- (AWSTask<AWSConnectListHoursOfOperationsResponse *> *)listHoursOfOperations:(AWSConnectListHoursOfOperationsRequest *)request;

/**
 <p>Provides information about the hours of operation for the specified Amazon Connect instance.</p><p>For more information about hours of operation, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/set-hours-operation.html">Set the Hours of Operation for a Queue</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListHoursOfOperations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListHoursOfOperationsRequest
 @see AWSConnectListHoursOfOperationsResponse
 */
- (void)listHoursOfOperations:(AWSConnectListHoursOfOperationsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListHoursOfOperationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Returns a paginated list of all attribute types for the given instance.</p>
 
 @param request A container for the necessary parameters to execute the ListInstanceAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListInstanceAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListInstanceAttributesRequest
 @see AWSConnectListInstanceAttributesResponse
 */
- (AWSTask<AWSConnectListInstanceAttributesResponse *> *)listInstanceAttributes:(AWSConnectListInstanceAttributesRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Returns a paginated list of all attribute types for the given instance.</p>
 
 @param request A container for the necessary parameters to execute the ListInstanceAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListInstanceAttributesRequest
 @see AWSConnectListInstanceAttributesResponse
 */
- (void)listInstanceAttributes:(AWSConnectListInstanceAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListInstanceAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Returns a paginated list of storage configs for the identified instance and resource type.</p>
 
 @param request A container for the necessary parameters to execute the ListInstanceStorageConfigs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListInstanceStorageConfigsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListInstanceStorageConfigsRequest
 @see AWSConnectListInstanceStorageConfigsResponse
 */
- (AWSTask<AWSConnectListInstanceStorageConfigsResponse *> *)listInstanceStorageConfigs:(AWSConnectListInstanceStorageConfigsRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Returns a paginated list of storage configs for the identified instance and resource type.</p>
 
 @param request A container for the necessary parameters to execute the ListInstanceStorageConfigs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListInstanceStorageConfigsRequest
 @see AWSConnectListInstanceStorageConfigsResponse
 */
- (void)listInstanceStorageConfigs:(AWSConnectListInstanceStorageConfigsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListInstanceStorageConfigsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Return a list of instances which are in active state, creation-in-progress state, and failed state. Instances that aren't successfully created (they are in a failed state) are returned only for 24 hours after the CreateInstance API was invoked.</p>
 
 @param request A container for the necessary parameters to execute the ListInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListInstancesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListInstancesRequest
 @see AWSConnectListInstancesResponse
 */
- (AWSTask<AWSConnectListInstancesResponse *> *)listInstances:(AWSConnectListInstancesRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Return a list of instances which are in active state, creation-in-progress state, and failed state. Instances that aren't successfully created (they are in a failed state) are returned only for 24 hours after the CreateInstance API was invoked.</p>
 
 @param request A container for the necessary parameters to execute the ListInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListInstancesRequest
 @see AWSConnectListInstancesResponse
 */
- (void)listInstances:(AWSConnectListInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListInstancesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides summary information about the Amazon Web Services resource associations for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListIntegrationAssociations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListIntegrationAssociationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListIntegrationAssociationsRequest
 @see AWSConnectListIntegrationAssociationsResponse
 */
- (AWSTask<AWSConnectListIntegrationAssociationsResponse *> *)listIntegrationAssociations:(AWSConnectListIntegrationAssociationsRequest *)request;

/**
 <p>Provides summary information about the Amazon Web Services resource associations for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListIntegrationAssociations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListIntegrationAssociationsRequest
 @see AWSConnectListIntegrationAssociationsResponse
 */
- (void)listIntegrationAssociations:(AWSConnectListIntegrationAssociationsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListIntegrationAssociationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Returns a paginated list of all Lambda functions that display in the dropdown options in the relevant flow blocks.</p>
 
 @param request A container for the necessary parameters to execute the ListLambdaFunctions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListLambdaFunctionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListLambdaFunctionsRequest
 @see AWSConnectListLambdaFunctionsResponse
 */
- (AWSTask<AWSConnectListLambdaFunctionsResponse *> *)listLambdaFunctions:(AWSConnectListLambdaFunctionsRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Returns a paginated list of all Lambda functions that display in the dropdown options in the relevant flow blocks.</p>
 
 @param request A container for the necessary parameters to execute the ListLambdaFunctions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListLambdaFunctionsRequest
 @see AWSConnectListLambdaFunctionsResponse
 */
- (void)listLambdaFunctions:(AWSConnectListLambdaFunctionsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListLambdaFunctionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Returns a paginated list of all the Amazon Lex V1 bots currently associated with the instance. To return both Amazon Lex V1 and V2 bots, use the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ListBots.html">ListBots</a> API. </p>
 
 @param request A container for the necessary parameters to execute the ListLexBots service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListLexBotsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListLexBotsRequest
 @see AWSConnectListLexBotsResponse
 */
- (AWSTask<AWSConnectListLexBotsResponse *> *)listLexBots:(AWSConnectListLexBotsRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Returns a paginated list of all the Amazon Lex V1 bots currently associated with the instance. To return both Amazon Lex V1 and V2 bots, use the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ListBots.html">ListBots</a> API. </p>
 
 @param request A container for the necessary parameters to execute the ListLexBots service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListLexBotsRequest
 @see AWSConnectListLexBotsResponse
 */
- (void)listLexBots:(AWSConnectListLexBotsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListLexBotsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about the phone numbers for the specified Amazon Connect instance. </p><p>For more information about phone numbers, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/contact-center-phone-number.html">Set Up Phone Numbers for Your Contact Center</a> in the <i>Amazon Connect Administrator Guide</i>.</p><important><p>The phone number <code>Arn</code> value that is returned from each of the items in the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ListPhoneNumbers.html#connect-ListPhoneNumbers-response-PhoneNumberSummaryList">PhoneNumberSummaryList</a> cannot be used to tag phone number resources. It will fail with a <code>ResourceNotFoundException</code>. Instead, use the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ListPhoneNumbersV2.html">ListPhoneNumbersV2</a> API. It returns the new phone number ARN that can be used to tag phone number resources.</p></important>
 
 @param request A container for the necessary parameters to execute the ListPhoneNumbers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListPhoneNumbersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListPhoneNumbersRequest
 @see AWSConnectListPhoneNumbersResponse
 */
- (AWSTask<AWSConnectListPhoneNumbersResponse *> *)listPhoneNumbers:(AWSConnectListPhoneNumbersRequest *)request;

/**
 <p>Provides information about the phone numbers for the specified Amazon Connect instance. </p><p>For more information about phone numbers, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/contact-center-phone-number.html">Set Up Phone Numbers for Your Contact Center</a> in the <i>Amazon Connect Administrator Guide</i>.</p><important><p>The phone number <code>Arn</code> value that is returned from each of the items in the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ListPhoneNumbers.html#connect-ListPhoneNumbers-response-PhoneNumberSummaryList">PhoneNumberSummaryList</a> cannot be used to tag phone number resources. It will fail with a <code>ResourceNotFoundException</code>. Instead, use the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ListPhoneNumbersV2.html">ListPhoneNumbersV2</a> API. It returns the new phone number ARN that can be used to tag phone number resources.</p></important>
 
 @param request A container for the necessary parameters to execute the ListPhoneNumbers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListPhoneNumbersRequest
 @see AWSConnectListPhoneNumbersResponse
 */
- (void)listPhoneNumbers:(AWSConnectListPhoneNumbersRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListPhoneNumbersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists phone numbers claimed to your Amazon Connect instance or traffic distribution group. If the provided <code>TargetArn</code> is a traffic distribution group, you can call this API in both Amazon Web Services Regions associated with traffic distribution group.</p><p>For more information about phone numbers, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/contact-center-phone-number.html">Set Up Phone Numbers for Your Contact Center</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListPhoneNumbersV2 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListPhoneNumbersV2Response`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectListPhoneNumbersV2Request
 @see AWSConnectListPhoneNumbersV2Response
 */
- (AWSTask<AWSConnectListPhoneNumbersV2Response *> *)listPhoneNumbersV2:(AWSConnectListPhoneNumbersV2Request *)request;

/**
 <p>Lists phone numbers claimed to your Amazon Connect instance or traffic distribution group. If the provided <code>TargetArn</code> is a traffic distribution group, you can call this API in both Amazon Web Services Regions associated with traffic distribution group.</p><p>For more information about phone numbers, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/contact-center-phone-number.html">Set Up Phone Numbers for Your Contact Center</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListPhoneNumbersV2 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectListPhoneNumbersV2Request
 @see AWSConnectListPhoneNumbersV2Response
 */
- (void)listPhoneNumbersV2:(AWSConnectListPhoneNumbersV2Request *)request completionHandler:(void (^ _Nullable)(AWSConnectListPhoneNumbersV2Response * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about the prompts for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListPrompts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListPromptsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListPromptsRequest
 @see AWSConnectListPromptsResponse
 */
- (AWSTask<AWSConnectListPromptsResponse *> *)listPrompts:(AWSConnectListPromptsRequest *)request;

/**
 <p>Provides information about the prompts for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListPrompts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListPromptsRequest
 @see AWSConnectListPromptsResponse
 */
- (void)listPrompts:(AWSConnectListPromptsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListPromptsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Lists the quick connects associated with a queue.</p>
 
 @param request A container for the necessary parameters to execute the ListQueueQuickConnects service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListQueueQuickConnectsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListQueueQuickConnectsRequest
 @see AWSConnectListQueueQuickConnectsResponse
 */
- (AWSTask<AWSConnectListQueueQuickConnectsResponse *> *)listQueueQuickConnects:(AWSConnectListQueueQuickConnectsRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Lists the quick connects associated with a queue.</p>
 
 @param request A container for the necessary parameters to execute the ListQueueQuickConnects service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListQueueQuickConnectsRequest
 @see AWSConnectListQueueQuickConnectsResponse
 */
- (void)listQueueQuickConnects:(AWSConnectListQueueQuickConnectsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListQueueQuickConnectsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about the queues for the specified Amazon Connect instance.</p><p>If you do not specify a <code>QueueTypes</code> parameter, both standard and agent queues are returned. This might cause an unexpected truncation of results if you have more than 1000 agents and you limit the number of results of the API call in code.</p><p>For more information about queues, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-queues-standard-and-agent.html">Queues: Standard and Agent</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListQueues service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListQueuesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListQueuesRequest
 @see AWSConnectListQueuesResponse
 */
- (AWSTask<AWSConnectListQueuesResponse *> *)listQueues:(AWSConnectListQueuesRequest *)request;

/**
 <p>Provides information about the queues for the specified Amazon Connect instance.</p><p>If you do not specify a <code>QueueTypes</code> parameter, both standard and agent queues are returned. This might cause an unexpected truncation of results if you have more than 1000 agents and you limit the number of results of the API call in code.</p><p>For more information about queues, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-queues-standard-and-agent.html">Queues: Standard and Agent</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListQueues service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListQueuesRequest
 @see AWSConnectListQueuesResponse
 */
- (void)listQueues:(AWSConnectListQueuesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListQueuesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about the quick connects for the specified Amazon Connect instance. </p>
 
 @param request A container for the necessary parameters to execute the ListQuickConnects service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListQuickConnectsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListQuickConnectsRequest
 @see AWSConnectListQuickConnectsResponse
 */
- (AWSTask<AWSConnectListQuickConnectsResponse *> *)listQuickConnects:(AWSConnectListQuickConnectsRequest *)request;

/**
 <p>Provides information about the quick connects for the specified Amazon Connect instance. </p>
 
 @param request A container for the necessary parameters to execute the ListQuickConnects service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListQuickConnectsRequest
 @see AWSConnectListQuickConnectsResponse
 */
- (void)listQuickConnects:(AWSConnectListQuickConnectsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListQuickConnectsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the queues associated with a routing profile.</p>
 
 @param request A container for the necessary parameters to execute the ListRoutingProfileQueues service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListRoutingProfileQueuesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListRoutingProfileQueuesRequest
 @see AWSConnectListRoutingProfileQueuesResponse
 */
- (AWSTask<AWSConnectListRoutingProfileQueuesResponse *> *)listRoutingProfileQueues:(AWSConnectListRoutingProfileQueuesRequest *)request;

/**
 <p>Lists the queues associated with a routing profile.</p>
 
 @param request A container for the necessary parameters to execute the ListRoutingProfileQueues service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListRoutingProfileQueuesRequest
 @see AWSConnectListRoutingProfileQueuesResponse
 */
- (void)listRoutingProfileQueues:(AWSConnectListRoutingProfileQueuesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListRoutingProfileQueuesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides summary information about the routing profiles for the specified Amazon Connect instance.</p><p>For more information about routing profiles, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing.html">Routing Profiles</a> and <a href="https://docs.aws.amazon.com/connect/latest/adminguide/routing-profiles.html">Create a Routing Profile</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListRoutingProfiles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListRoutingProfilesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListRoutingProfilesRequest
 @see AWSConnectListRoutingProfilesResponse
 */
- (AWSTask<AWSConnectListRoutingProfilesResponse *> *)listRoutingProfiles:(AWSConnectListRoutingProfilesRequest *)request;

/**
 <p>Provides summary information about the routing profiles for the specified Amazon Connect instance.</p><p>For more information about routing profiles, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing.html">Routing Profiles</a> and <a href="https://docs.aws.amazon.com/connect/latest/adminguide/routing-profiles.html">Create a Routing Profile</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListRoutingProfiles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListRoutingProfilesRequest
 @see AWSConnectListRoutingProfilesResponse
 */
- (void)listRoutingProfiles:(AWSConnectListRoutingProfilesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListRoutingProfilesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Returns a paginated list of all security keys associated with the instance.</p>
 
 @param request A container for the necessary parameters to execute the ListSecurityKeys service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListSecurityKeysResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListSecurityKeysRequest
 @see AWSConnectListSecurityKeysResponse
 */
- (AWSTask<AWSConnectListSecurityKeysResponse *> *)listSecurityKeys:(AWSConnectListSecurityKeysRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Returns a paginated list of all security keys associated with the instance.</p>
 
 @param request A container for the necessary parameters to execute the ListSecurityKeys service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListSecurityKeysRequest
 @see AWSConnectListSecurityKeysResponse
 */
- (void)listSecurityKeys:(AWSConnectListSecurityKeysRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListSecurityKeysResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Lists the permissions granted to a security profile.</p>
 
 @param request A container for the necessary parameters to execute the ListSecurityProfilePermissions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListSecurityProfilePermissionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListSecurityProfilePermissionsRequest
 @see AWSConnectListSecurityProfilePermissionsResponse
 */
- (AWSTask<AWSConnectListSecurityProfilePermissionsResponse *> *)listSecurityProfilePermissions:(AWSConnectListSecurityProfilePermissionsRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Lists the permissions granted to a security profile.</p>
 
 @param request A container for the necessary parameters to execute the ListSecurityProfilePermissions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListSecurityProfilePermissionsRequest
 @see AWSConnectListSecurityProfilePermissionsResponse
 */
- (void)listSecurityProfilePermissions:(AWSConnectListSecurityProfilePermissionsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListSecurityProfilePermissionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides summary information about the security profiles for the specified Amazon Connect instance.</p><p>For more information about security profiles, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/connect-security-profiles.html">Security Profiles</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListSecurityProfiles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListSecurityProfilesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListSecurityProfilesRequest
 @see AWSConnectListSecurityProfilesResponse
 */
- (AWSTask<AWSConnectListSecurityProfilesResponse *> *)listSecurityProfiles:(AWSConnectListSecurityProfilesRequest *)request;

/**
 <p>Provides summary information about the security profiles for the specified Amazon Connect instance.</p><p>For more information about security profiles, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/connect-security-profiles.html">Security Profiles</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListSecurityProfiles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListSecurityProfilesRequest
 @see AWSConnectListSecurityProfilesResponse
 */
- (void)listSecurityProfiles:(AWSConnectListSecurityProfilesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListSecurityProfilesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tags for the specified resource.</p><p>For sample policies that use tags, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/security_iam_id-based-policy-examples.html">Amazon Connect Identity-Based Policy Examples</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListTagsForResourceRequest
 @see AWSConnectListTagsForResourceResponse
 */
- (AWSTask<AWSConnectListTagsForResourceResponse *> *)listTagsForResource:(AWSConnectListTagsForResourceRequest *)request;

/**
 <p>Lists the tags for the specified resource.</p><p>For sample policies that use tags, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/security_iam_id-based-policy-examples.html">Amazon Connect Identity-Based Policy Examples</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListTagsForResourceRequest
 @see AWSConnectListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSConnectListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists task templates for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListTaskTemplates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListTaskTemplatesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListTaskTemplatesRequest
 @see AWSConnectListTaskTemplatesResponse
 */
- (AWSTask<AWSConnectListTaskTemplatesResponse *> *)listTaskTemplates:(AWSConnectListTaskTemplatesRequest *)request;

/**
 <p>Lists task templates for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListTaskTemplates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListTaskTemplatesRequest
 @see AWSConnectListTaskTemplatesResponse
 */
- (void)listTaskTemplates:(AWSConnectListTaskTemplatesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListTaskTemplatesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists traffic distribution groups.</p>
 
 @param request A container for the necessary parameters to execute the ListTrafficDistributionGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListTrafficDistributionGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListTrafficDistributionGroupsRequest
 @see AWSConnectListTrafficDistributionGroupsResponse
 */
- (AWSTask<AWSConnectListTrafficDistributionGroupsResponse *> *)listTrafficDistributionGroups:(AWSConnectListTrafficDistributionGroupsRequest *)request;

/**
 <p>Lists traffic distribution groups.</p>
 
 @param request A container for the necessary parameters to execute the ListTrafficDistributionGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListTrafficDistributionGroupsRequest
 @see AWSConnectListTrafficDistributionGroupsResponse
 */
- (void)listTrafficDistributionGroups:(AWSConnectListTrafficDistributionGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListTrafficDistributionGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the use cases for the integration association. </p>
 
 @param request A container for the necessary parameters to execute the ListUseCases service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListUseCasesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListUseCasesRequest
 @see AWSConnectListUseCasesResponse
 */
- (AWSTask<AWSConnectListUseCasesResponse *> *)listUseCases:(AWSConnectListUseCasesRequest *)request;

/**
 <p>Lists the use cases for the integration association. </p>
 
 @param request A container for the necessary parameters to execute the ListUseCases service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListUseCasesRequest
 @see AWSConnectListUseCasesResponse
 */
- (void)listUseCases:(AWSConnectListUseCasesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListUseCasesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides summary information about the hierarchy groups for the specified Amazon Connect instance.</p><p>For more information about agent hierarchies, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/agent-hierarchy.html">Set Up Agent Hierarchies</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListUserHierarchyGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListUserHierarchyGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListUserHierarchyGroupsRequest
 @see AWSConnectListUserHierarchyGroupsResponse
 */
- (AWSTask<AWSConnectListUserHierarchyGroupsResponse *> *)listUserHierarchyGroups:(AWSConnectListUserHierarchyGroupsRequest *)request;

/**
 <p>Provides summary information about the hierarchy groups for the specified Amazon Connect instance.</p><p>For more information about agent hierarchies, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/agent-hierarchy.html">Set Up Agent Hierarchies</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListUserHierarchyGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListUserHierarchyGroupsRequest
 @see AWSConnectListUserHierarchyGroupsResponse
 */
- (void)listUserHierarchyGroups:(AWSConnectListUserHierarchyGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListUserHierarchyGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides summary information about the users for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListUsers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListUsersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListUsersRequest
 @see AWSConnectListUsersResponse
 */
- (AWSTask<AWSConnectListUsersResponse *> *)listUsers:(AWSConnectListUsersRequest *)request;

/**
 <p>Provides summary information about the users for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListUsers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListUsersRequest
 @see AWSConnectListUsersResponse
 */
- (void)listUsers:(AWSConnectListUsersRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListUsersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Changes the current status of a user or agent in Amazon Connect. If the agent is currently handling a contact, this sets the agent's next status.</p><p>For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/metrics-agent-status.html">Agent status</a> and <a href="https://docs.aws.amazon.com/connect/latest/adminguide/set-next-status.html">Set your next status</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutUserStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectPutUserStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectPutUserStatusRequest
 @see AWSConnectPutUserStatusResponse
 */
- (AWSTask<AWSConnectPutUserStatusResponse *> *)putUserStatus:(AWSConnectPutUserStatusRequest *)request;

/**
 <p>Changes the current status of a user or agent in Amazon Connect. If the agent is currently handling a contact, this sets the agent's next status.</p><p>For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/metrics-agent-status.html">Agent status</a> and <a href="https://docs.aws.amazon.com/connect/latest/adminguide/set-next-status.html">Set your next status</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutUserStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectPutUserStatusRequest
 @see AWSConnectPutUserStatusResponse
 */
- (void)putUserStatus:(AWSConnectPutUserStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectPutUserStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Releases a phone number previously claimed to an Amazon Connect instance or traffic distribution group. You can call this API only in the Amazon Web Services Region where the number was claimed.</p><important><p>To release phone numbers from a traffic distribution group, use the <code>ReleasePhoneNumber</code> API, not the Amazon Connect console.</p><p>After releasing a phone number, the phone number enters into a cooldown period of 30 days. It cannot be searched for or claimed again until the period has ended. If you accidentally release a phone number, contact Amazon Web Services Support.</p></important>
 
 @param request A container for the necessary parameters to execute the ReleasePhoneNumber service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceInUse`, `AWSConnectErrorIdempotency`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectReleasePhoneNumberRequest
 */
- (AWSTask *)releasePhoneNumber:(AWSConnectReleasePhoneNumberRequest *)request;

/**
 <p>Releases a phone number previously claimed to an Amazon Connect instance or traffic distribution group. You can call this API only in the Amazon Web Services Region where the number was claimed.</p><important><p>To release phone numbers from a traffic distribution group, use the <code>ReleasePhoneNumber</code> API, not the Amazon Connect console.</p><p>After releasing a phone number, the phone number enters into a cooldown period of 30 days. It cannot be searched for or claimed again until the period has ended. If you accidentally release a phone number, contact Amazon Web Services Support.</p></important>
 
 @param request A container for the necessary parameters to execute the ReleasePhoneNumber service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceInUse`, `AWSConnectErrorIdempotency`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectReleasePhoneNumberRequest
 */
- (void)releasePhoneNumber:(AWSConnectReleasePhoneNumberRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Replicates an Amazon Connect instance in the specified Amazon Web Services Region.</p><p>For more information about replicating an Amazon Connect instance, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/create-replica-connect-instance.html">Create a replica of your existing Amazon Connect instance</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ReplicateInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectReplicateInstanceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceNotReady`, `AWSConnectErrorResourceConflict`.
 
 @see AWSConnectReplicateInstanceRequest
 @see AWSConnectReplicateInstanceResponse
 */
- (AWSTask<AWSConnectReplicateInstanceResponse *> *)replicateInstance:(AWSConnectReplicateInstanceRequest *)request;

/**
 <p>Replicates an Amazon Connect instance in the specified Amazon Web Services Region.</p><p>For more information about replicating an Amazon Connect instance, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/create-replica-connect-instance.html">Create a replica of your existing Amazon Connect instance</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ReplicateInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceNotReady`, `AWSConnectErrorResourceConflict`.
 
 @see AWSConnectReplicateInstanceRequest
 @see AWSConnectReplicateInstanceResponse
 */
- (void)replicateInstance:(AWSConnectReplicateInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectReplicateInstanceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>When a contact is being recorded, and the recording has been suspended using SuspendContactRecording, this API resumes recording the call.</p><p>Only voice recordings are supported at this time.</p>
 
 @param request A container for the necessary parameters to execute the ResumeContactRecording service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectResumeContactRecordingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectResumeContactRecordingRequest
 @see AWSConnectResumeContactRecordingResponse
 */
- (AWSTask<AWSConnectResumeContactRecordingResponse *> *)resumeContactRecording:(AWSConnectResumeContactRecordingRequest *)request;

/**
 <p>When a contact is being recorded, and the recording has been suspended using SuspendContactRecording, this API resumes recording the call.</p><p>Only voice recordings are supported at this time.</p>
 
 @param request A container for the necessary parameters to execute the ResumeContactRecording service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectResumeContactRecordingRequest
 @see AWSConnectResumeContactRecordingResponse
 */
- (void)resumeContactRecording:(AWSConnectResumeContactRecordingRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectResumeContactRecordingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches for available phone numbers that you can claim to your Amazon Connect instance or traffic distribution group. If the provided <code>TargetArn</code> is a traffic distribution group, you can call this API in both Amazon Web Services Regions associated with the traffic distribution group.</p>
 
 @param request A container for the necessary parameters to execute the SearchAvailablePhoneNumbers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectSearchAvailablePhoneNumbersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectSearchAvailablePhoneNumbersRequest
 @see AWSConnectSearchAvailablePhoneNumbersResponse
 */
- (AWSTask<AWSConnectSearchAvailablePhoneNumbersResponse *> *)searchAvailablePhoneNumbers:(AWSConnectSearchAvailablePhoneNumbersRequest *)request;

/**
 <p>Searches for available phone numbers that you can claim to your Amazon Connect instance or traffic distribution group. If the provided <code>TargetArn</code> is a traffic distribution group, you can call this API in both Amazon Web Services Regions associated with the traffic distribution group.</p>
 
 @param request A container for the necessary parameters to execute the SearchAvailablePhoneNumbers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectSearchAvailablePhoneNumbersRequest
 @see AWSConnectSearchAvailablePhoneNumbersResponse
 */
- (void)searchAvailablePhoneNumbers:(AWSConnectSearchAvailablePhoneNumbersRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectSearchAvailablePhoneNumbersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Searches queues in an Amazon Connect instance, with optional filtering.</p>
 
 @param request A container for the necessary parameters to execute the SearchQueues service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectSearchQueuesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSearchQueuesRequest
 @see AWSConnectSearchQueuesResponse
 */
- (AWSTask<AWSConnectSearchQueuesResponse *> *)searchQueues:(AWSConnectSearchQueuesRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Searches queues in an Amazon Connect instance, with optional filtering.</p>
 
 @param request A container for the necessary parameters to execute the SearchQueues service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSearchQueuesRequest
 @see AWSConnectSearchQueuesResponse
 */
- (void)searchQueues:(AWSConnectSearchQueuesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectSearchQueuesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Searches routing profiles in an Amazon Connect instance, with optional filtering.</p>
 
 @param request A container for the necessary parameters to execute the SearchRoutingProfiles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectSearchRoutingProfilesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSearchRoutingProfilesRequest
 @see AWSConnectSearchRoutingProfilesResponse
 */
- (AWSTask<AWSConnectSearchRoutingProfilesResponse *> *)searchRoutingProfiles:(AWSConnectSearchRoutingProfilesRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Searches routing profiles in an Amazon Connect instance, with optional filtering.</p>
 
 @param request A container for the necessary parameters to execute the SearchRoutingProfiles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSearchRoutingProfilesRequest
 @see AWSConnectSearchRoutingProfilesResponse
 */
- (void)searchRoutingProfiles:(AWSConnectSearchRoutingProfilesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectSearchRoutingProfilesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Searches security profiles in an Amazon Connect instance, with optional filtering.</p>
 
 @param request A container for the necessary parameters to execute the SearchSecurityProfiles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectSearchSecurityProfilesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSearchSecurityProfilesRequest
 @see AWSConnectSearchSecurityProfilesResponse
 */
- (AWSTask<AWSConnectSearchSecurityProfilesResponse *> *)searchSecurityProfiles:(AWSConnectSearchSecurityProfilesRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Searches security profiles in an Amazon Connect instance, with optional filtering.</p>
 
 @param request A container for the necessary parameters to execute the SearchSecurityProfiles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSearchSecurityProfilesRequest
 @see AWSConnectSearchSecurityProfilesResponse
 */
- (void)searchSecurityProfiles:(AWSConnectSearchSecurityProfilesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectSearchSecurityProfilesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches users in an Amazon Connect instance, with optional filtering.</p><note><p><code>AfterContactWorkTimeLimit</code> is returned in milliseconds. </p></note>
 
 @param request A container for the necessary parameters to execute the SearchUsers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectSearchUsersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSearchUsersRequest
 @see AWSConnectSearchUsersResponse
 */
- (AWSTask<AWSConnectSearchUsersResponse *> *)searchUsers:(AWSConnectSearchUsersRequest *)request;

/**
 <p>Searches users in an Amazon Connect instance, with optional filtering.</p><note><p><code>AfterContactWorkTimeLimit</code> is returned in milliseconds. </p></note>
 
 @param request A container for the necessary parameters to execute the SearchUsers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSearchUsersRequest
 @see AWSConnectSearchUsersResponse
 */
- (void)searchUsers:(AWSConnectSearchUsersRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectSearchUsersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches for vocabularies within a specific Amazon Connect instance using <code>State</code>, <code>NameStartsWith</code>, and <code>LanguageCode</code>.</p>
 
 @param request A container for the necessary parameters to execute the SearchVocabularies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectSearchVocabulariesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectSearchVocabulariesRequest
 @see AWSConnectSearchVocabulariesResponse
 */
- (AWSTask<AWSConnectSearchVocabulariesResponse *> *)searchVocabularies:(AWSConnectSearchVocabulariesRequest *)request;

/**
 <p>Searches for vocabularies within a specific Amazon Connect instance using <code>State</code>, <code>NameStartsWith</code>, and <code>LanguageCode</code>.</p>
 
 @param request A container for the necessary parameters to execute the SearchVocabularies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectSearchVocabulariesRequest
 @see AWSConnectSearchVocabulariesResponse
 */
- (void)searchVocabularies:(AWSConnectSearchVocabulariesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectSearchVocabulariesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates a flow to start a new chat for the customer. Response of this API provides a token required to obtain credentials from the <a href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a> API in the Amazon Connect Participant Service.</p><p>When a new chat contact is successfully created, clients must subscribe to the participant’s connection for the created chat within 5 minutes. This is achieved by invoking <a href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a> with WEBSOCKET and CONNECTION_CREDENTIALS. </p><p>A 429 error occurs in the following situations:</p><ul><li><p>API rate limit is exceeded. API TPS throttling returns a <code>TooManyRequests</code> exception.</p></li><li><p>The <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">quota for concurrent active chats</a> is exceeded. Active chat throttling returns a <code>LimitExceededException</code>.</p></li></ul><p>If you use the <code>ChatDurationInMinutes</code> parameter and receive a 400 error, your account may not support the ability to configure custom chat durations. For more information, contact Amazon Web Services Support. </p><p>For more information about chat, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/chat.html">Chat</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StartChatContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectStartChatContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorLimitExceeded`.
 
 @see AWSConnectStartChatContactRequest
 @see AWSConnectStartChatContactResponse
 */
- (AWSTask<AWSConnectStartChatContactResponse *> *)startChatContact:(AWSConnectStartChatContactRequest *)request;

/**
 <p>Initiates a flow to start a new chat for the customer. Response of this API provides a token required to obtain credentials from the <a href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a> API in the Amazon Connect Participant Service.</p><p>When a new chat contact is successfully created, clients must subscribe to the participant’s connection for the created chat within 5 minutes. This is achieved by invoking <a href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a> with WEBSOCKET and CONNECTION_CREDENTIALS. </p><p>A 429 error occurs in the following situations:</p><ul><li><p>API rate limit is exceeded. API TPS throttling returns a <code>TooManyRequests</code> exception.</p></li><li><p>The <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">quota for concurrent active chats</a> is exceeded. Active chat throttling returns a <code>LimitExceededException</code>.</p></li></ul><p>If you use the <code>ChatDurationInMinutes</code> parameter and receive a 400 error, your account may not support the ability to configure custom chat durations. For more information, contact Amazon Web Services Support. </p><p>For more information about chat, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/chat.html">Chat</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StartChatContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorLimitExceeded`.
 
 @see AWSConnectStartChatContactRequest
 @see AWSConnectStartChatContactResponse
 */
- (void)startChatContact:(AWSConnectStartChatContactRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectStartChatContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts recording the contact: </p><ul><li><p>If the API is called <i>before</i> the agent joins the call, recording starts when the agent joins the call.</p></li><li><p>If the API is called <i>after</i> the agent joins the call, recording starts at the time of the API call.</p></li></ul><p>StartContactRecording is a one-time action. For example, if you use StopContactRecording to stop recording an ongoing call, you can't use StartContactRecording to restart it. For scenarios where the recording has started and you want to suspend and resume it, such as when collecting sensitive information (for example, a credit card number), use SuspendContactRecording and ResumeContactRecording.</p><p>You can use this API to override the recording behavior configured in the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/set-recording-behavior.html">Set recording behavior</a> block.</p><p>Only voice recordings are supported at this time.</p>
 
 @param request A container for the necessary parameters to execute the StartContactRecording service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectStartContactRecordingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectStartContactRecordingRequest
 @see AWSConnectStartContactRecordingResponse
 */
- (AWSTask<AWSConnectStartContactRecordingResponse *> *)startContactRecording:(AWSConnectStartContactRecordingRequest *)request;

/**
 <p>Starts recording the contact: </p><ul><li><p>If the API is called <i>before</i> the agent joins the call, recording starts when the agent joins the call.</p></li><li><p>If the API is called <i>after</i> the agent joins the call, recording starts at the time of the API call.</p></li></ul><p>StartContactRecording is a one-time action. For example, if you use StopContactRecording to stop recording an ongoing call, you can't use StartContactRecording to restart it. For scenarios where the recording has started and you want to suspend and resume it, such as when collecting sensitive information (for example, a credit card number), use SuspendContactRecording and ResumeContactRecording.</p><p>You can use this API to override the recording behavior configured in the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/set-recording-behavior.html">Set recording behavior</a> block.</p><p>Only voice recordings are supported at this time.</p>
 
 @param request A container for the necessary parameters to execute the StartContactRecording service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectStartContactRecordingRequest
 @see AWSConnectStartContactRecordingResponse
 */
- (void)startContactRecording:(AWSConnectStartContactRecordingRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectStartContactRecordingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Initiates real-time message streaming for a new chat contact.</p><p> For more information about message streaming, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/chat-message-streaming.html">Enable real-time chat message streaming</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StartContactStreaming service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectStartContactStreamingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorLimitExceeded`.
 
 @see AWSConnectStartContactStreamingRequest
 @see AWSConnectStartContactStreamingResponse
 */
- (AWSTask<AWSConnectStartContactStreamingResponse *> *)startContactStreaming:(AWSConnectStartContactStreamingRequest *)request;

/**
 <p> Initiates real-time message streaming for a new chat contact.</p><p> For more information about message streaming, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/chat-message-streaming.html">Enable real-time chat message streaming</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StartContactStreaming service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorLimitExceeded`.
 
 @see AWSConnectStartContactStreamingRequest
 @see AWSConnectStartContactStreamingResponse
 */
- (void)startContactStreaming:(AWSConnectStartContactStreamingRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectStartContactStreamingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Places an outbound call to a contact, and then initiates the flow. It performs the actions in the flow that's specified (in <code>ContactFlowId</code>).</p><p>Agents do not initiate the outbound API, which means that they do not dial the contact. If the flow places an outbound call to a contact, and then puts the contact in queue, the call is then routed to the agent, like any other inbound case.</p><p>There is a 60-second dialing timeout for this operation. If the call is not connected after 60 seconds, it fails.</p><note><p>UK numbers with a 447 prefix are not allowed by default. Before you can dial these UK mobile numbers, you must submit a service quota increase request. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">Amazon Connect Service Quotas</a> in the <i>Amazon Connect Administrator Guide</i>. </p></note><note><p>Campaign calls are not allowed by default. Before you can make a call with <code>TrafficType</code> = <code>CAMPAIGN</code>, you must submit a service quota increase request to the quota <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#outbound-communications-quotas">Amazon Connect campaigns</a>. </p></note>
 
 @param request A container for the necessary parameters to execute the StartOutboundVoiceContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectStartOutboundVoiceContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorDestinationNotAllowed`, `AWSConnectErrorOutboundContactNotPermitted`.
 
 @see AWSConnectStartOutboundVoiceContactRequest
 @see AWSConnectStartOutboundVoiceContactResponse
 */
- (AWSTask<AWSConnectStartOutboundVoiceContactResponse *> *)startOutboundVoiceContact:(AWSConnectStartOutboundVoiceContactRequest *)request;

/**
 <p>Places an outbound call to a contact, and then initiates the flow. It performs the actions in the flow that's specified (in <code>ContactFlowId</code>).</p><p>Agents do not initiate the outbound API, which means that they do not dial the contact. If the flow places an outbound call to a contact, and then puts the contact in queue, the call is then routed to the agent, like any other inbound case.</p><p>There is a 60-second dialing timeout for this operation. If the call is not connected after 60 seconds, it fails.</p><note><p>UK numbers with a 447 prefix are not allowed by default. Before you can dial these UK mobile numbers, you must submit a service quota increase request. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">Amazon Connect Service Quotas</a> in the <i>Amazon Connect Administrator Guide</i>. </p></note><note><p>Campaign calls are not allowed by default. Before you can make a call with <code>TrafficType</code> = <code>CAMPAIGN</code>, you must submit a service quota increase request to the quota <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#outbound-communications-quotas">Amazon Connect campaigns</a>. </p></note>
 
 @param request A container for the necessary parameters to execute the StartOutboundVoiceContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorDestinationNotAllowed`, `AWSConnectErrorOutboundContactNotPermitted`.
 
 @see AWSConnectStartOutboundVoiceContactRequest
 @see AWSConnectStartOutboundVoiceContactResponse
 */
- (void)startOutboundVoiceContact:(AWSConnectStartOutboundVoiceContactRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectStartOutboundVoiceContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates a flow to start a new task.</p>
 
 @param request A container for the necessary parameters to execute the StartTaskContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectStartTaskContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectStartTaskContactRequest
 @see AWSConnectStartTaskContactResponse
 */
- (AWSTask<AWSConnectStartTaskContactResponse *> *)startTaskContact:(AWSConnectStartTaskContactRequest *)request;

/**
 <p>Initiates a flow to start a new task.</p>
 
 @param request A container for the necessary parameters to execute the StartTaskContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectStartTaskContactRequest
 @see AWSConnectStartTaskContactResponse
 */
- (void)startTaskContact:(AWSConnectStartTaskContactRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectStartTaskContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Ends the specified contact. This call does not work for the following initiation methods:</p><ul><li><p>DISCONNECT</p></li><li><p>TRANSFER</p></li><li><p>QUEUE_TRANSFER</p></li></ul>
 
 @param request A container for the necessary parameters to execute the StopContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectStopContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorContactNotFound`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectStopContactRequest
 @see AWSConnectStopContactResponse
 */
- (AWSTask<AWSConnectStopContactResponse *> *)stopContact:(AWSConnectStopContactRequest *)request;

/**
 <p>Ends the specified contact. This call does not work for the following initiation methods:</p><ul><li><p>DISCONNECT</p></li><li><p>TRANSFER</p></li><li><p>QUEUE_TRANSFER</p></li></ul>
 
 @param request A container for the necessary parameters to execute the StopContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorContactNotFound`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectStopContactRequest
 @see AWSConnectStopContactResponse
 */
- (void)stopContact:(AWSConnectStopContactRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectStopContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops recording a call when a contact is being recorded. StopContactRecording is a one-time action. If you use StopContactRecording to stop recording an ongoing call, you can't use StartContactRecording to restart it. For scenarios where the recording has started and you want to suspend it for sensitive information (for example, to collect a credit card number), and then restart it, use SuspendContactRecording and ResumeContactRecording.</p><p>Only voice recordings are supported at this time.</p>
 
 @param request A container for the necessary parameters to execute the StopContactRecording service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectStopContactRecordingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectStopContactRecordingRequest
 @see AWSConnectStopContactRecordingResponse
 */
- (AWSTask<AWSConnectStopContactRecordingResponse *> *)stopContactRecording:(AWSConnectStopContactRecordingRequest *)request;

/**
 <p>Stops recording a call when a contact is being recorded. StopContactRecording is a one-time action. If you use StopContactRecording to stop recording an ongoing call, you can't use StartContactRecording to restart it. For scenarios where the recording has started and you want to suspend it for sensitive information (for example, to collect a credit card number), and then restart it, use SuspendContactRecording and ResumeContactRecording.</p><p>Only voice recordings are supported at this time.</p>
 
 @param request A container for the necessary parameters to execute the StopContactRecording service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectStopContactRecordingRequest
 @see AWSConnectStopContactRecordingResponse
 */
- (void)stopContactRecording:(AWSConnectStopContactRecordingRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectStopContactRecordingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Ends message streaming on a specified contact. To restart message streaming on that contact, call the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_StartContactStreaming.html">StartContactStreaming</a> API. </p>
 
 @param request A container for the necessary parameters to execute the StopContactStreaming service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectStopContactStreamingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectStopContactStreamingRequest
 @see AWSConnectStopContactStreamingResponse
 */
- (AWSTask<AWSConnectStopContactStreamingResponse *> *)stopContactStreaming:(AWSConnectStopContactStreamingRequest *)request;

/**
 <p> Ends message streaming on a specified contact. To restart message streaming on that contact, call the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_StartContactStreaming.html">StartContactStreaming</a> API. </p>
 
 @param request A container for the necessary parameters to execute the StopContactStreaming service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectStopContactStreamingRequest
 @see AWSConnectStopContactStreamingResponse
 */
- (void)stopContactStreaming:(AWSConnectStopContactStreamingRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectStopContactStreamingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>When a contact is being recorded, this API suspends recording the call. For example, you might suspend the call recording while collecting sensitive information, such as a credit card number. Then use ResumeContactRecording to restart recording. </p><p>The period of time that the recording is suspended is filled with silence in the final recording. </p><p>Only voice recordings are supported at this time.</p>
 
 @param request A container for the necessary parameters to execute the SuspendContactRecording service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectSuspendContactRecordingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSuspendContactRecordingRequest
 @see AWSConnectSuspendContactRecordingResponse
 */
- (AWSTask<AWSConnectSuspendContactRecordingResponse *> *)suspendContactRecording:(AWSConnectSuspendContactRecordingRequest *)request;

/**
 <p>When a contact is being recorded, this API suspends recording the call. For example, you might suspend the call recording while collecting sensitive information, such as a credit card number. Then use ResumeContactRecording to restart recording. </p><p>The period of time that the recording is suspended is filled with silence in the final recording. </p><p>Only voice recordings are supported at this time.</p>
 
 @param request A container for the necessary parameters to execute the SuspendContactRecording service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSuspendContactRecordingRequest
 @see AWSConnectSuspendContactRecordingResponse
 */
- (void)suspendContactRecording:(AWSConnectSuspendContactRecordingRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectSuspendContactRecordingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds the specified tags to the specified resource.</p><p>Some of the supported resource types are agents, routing profiles, queues, quick connects, contact flows, agent statuses, hours of operation, phone numbers, security profiles, and task templates. For a complete list, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/tagging.html">Tagging resources in Amazon Connect</a>.</p><p>For sample policies that use tags, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/security_iam_id-based-policy-examples.html">Amazon Connect Identity-Based Policy Examples</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectTagResourceRequest
 */
- (AWSTask *)tagResource:(AWSConnectTagResourceRequest *)request;

/**
 <p>Adds the specified tags to the specified resource.</p><p>Some of the supported resource types are agents, routing profiles, queues, quick connects, contact flows, agent statuses, hours of operation, phone numbers, security profiles, and task templates. For a complete list, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/tagging.html">Tagging resources in Amazon Connect</a>.</p><p>For sample policies that use tags, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/security_iam_id-based-policy-examples.html">Amazon Connect Identity-Based Policy Examples</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectTagResourceRequest
 */
- (void)tagResource:(AWSConnectTagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Transfers contacts from one agent or queue to another agent or queue at any point after a contact is created. You can transfer a contact to another queue by providing the flow which orchestrates the contact to the destination queue. This gives you more control over contact handling and helps you adhere to the service level agreement (SLA) guaranteed to your customers.</p><p>Note the following requirements:</p><ul><li><p>Transfer is supported for only <code>TASK</code> contacts.</p></li><li><p>Do not use both <code>QueueId</code> and <code>UserId</code> in the same call.</p></li><li><p>The following flow types are supported: Inbound flow, Transfer to agent flow, and Transfer to queue flow.</p></li><li><p>The <code>TransferContact</code> API can be called only on active contacts.</p></li><li><p>A contact cannot be transferred more than 11 times.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the TransferContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectTransferContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorIdempotency`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectTransferContactRequest
 @see AWSConnectTransferContactResponse
 */
- (AWSTask<AWSConnectTransferContactResponse *> *)transferContact:(AWSConnectTransferContactRequest *)request;

/**
 <p>Transfers contacts from one agent or queue to another agent or queue at any point after a contact is created. You can transfer a contact to another queue by providing the flow which orchestrates the contact to the destination queue. This gives you more control over contact handling and helps you adhere to the service level agreement (SLA) guaranteed to your customers.</p><p>Note the following requirements:</p><ul><li><p>Transfer is supported for only <code>TASK</code> contacts.</p></li><li><p>Do not use both <code>QueueId</code> and <code>UserId</code> in the same call.</p></li><li><p>The following flow types are supported: Inbound flow, Transfer to agent flow, and Transfer to queue flow.</p></li><li><p>The <code>TransferContact</code> API can be called only on active contacts.</p></li><li><p>A contact cannot be transferred more than 11 times.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the TransferContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorIdempotency`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectTransferContactRequest
 @see AWSConnectTransferContactResponse
 */
- (void)transferContact:(AWSConnectTransferContactRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectTransferContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified tags from the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectUntagResourceRequest
 */
- (AWSTask *)untagResource:(AWSConnectUntagResourceRequest *)request;

/**
 <p>Removes the specified tags from the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectUntagResourceRequest
 */
- (void)untagResource:(AWSConnectUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Updates agent status.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAgentStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateAgentStatusRequest
 */
- (AWSTask *)updateAgentStatus:(AWSConnectUpdateAgentStatusRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Updates agent status.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAgentStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateAgentStatusRequest
 */
- (void)updateAgentStatus:(AWSConnectUpdateAgentStatusRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Adds or updates user-defined contact information associated with the specified contact. At least one field to be updated must be present in the request.</p><important><p>You can add or update user-defined contact information for both ongoing and completed contacts.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectUpdateContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectUpdateContactRequest
 @see AWSConnectUpdateContactResponse
 */
- (AWSTask<AWSConnectUpdateContactResponse *> *)updateContact:(AWSConnectUpdateContactRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Adds or updates user-defined contact information associated with the specified contact. At least one field to be updated must be present in the request.</p><important><p>You can add or update user-defined contact information for both ongoing and completed contacts.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectUpdateContactRequest
 @see AWSConnectUpdateContactResponse
 */
- (void)updateContact:(AWSConnectUpdateContactRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectUpdateContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates user-defined contact attributes associated with the specified contact.</p><p>You can create or update user-defined attributes for both ongoing and completed contacts. For example, while the call is active, you can update the customer's name or the reason the customer called. You can add notes about steps that the agent took during the call that display to the next agent that takes the call. You can also update attributes for a contact using data from your CRM application and save the data with the contact in Amazon Connect. You could also flag calls for additional analysis, such as legal review or to identify abusive callers.</p><p>Contact attributes are available in Amazon Connect for 24 months, and are then deleted. For information about contact record retention and the maximum size of the contact record attributes section, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#feature-limits">Feature specifications</a> in the <i>Amazon Connect Administrator Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the UpdateContactAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectUpdateContactAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactAttributesRequest
 @see AWSConnectUpdateContactAttributesResponse
 */
- (AWSTask<AWSConnectUpdateContactAttributesResponse *> *)updateContactAttributes:(AWSConnectUpdateContactAttributesRequest *)request;

/**
 <p>Creates or updates user-defined contact attributes associated with the specified contact.</p><p>You can create or update user-defined attributes for both ongoing and completed contacts. For example, while the call is active, you can update the customer's name or the reason the customer called. You can add notes about steps that the agent took during the call that display to the next agent that takes the call. You can also update attributes for a contact using data from your CRM application and save the data with the contact in Amazon Connect. You could also flag calls for additional analysis, such as legal review or to identify abusive callers.</p><p>Contact attributes are available in Amazon Connect for 24 months, and are then deleted. For information about contact record retention and the maximum size of the contact record attributes section, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#feature-limits">Feature specifications</a> in the <i>Amazon Connect Administrator Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the UpdateContactAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactAttributesRequest
 @see AWSConnectUpdateContactAttributesResponse
 */
- (void)updateContactAttributes:(AWSConnectUpdateContactAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectUpdateContactAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified flow.</p><p>You can also create and update flows using the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect Flow language</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactFlowContent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidContactFlow`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactFlowContentRequest
 */
- (AWSTask *)updateContactFlowContent:(AWSConnectUpdateContactFlowContentRequest *)request;

/**
 <p>Updates the specified flow.</p><p>You can also create and update flows using the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect Flow language</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactFlowContent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidContactFlow`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactFlowContentRequest
 */
- (void)updateContactFlowContent:(AWSConnectUpdateContactFlowContentRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates metadata about specified flow.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactFlowMetadata service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactFlowMetadataRequest
 */
- (AWSTask *)updateContactFlowMetadata:(AWSConnectUpdateContactFlowMetadataRequest *)request;

/**
 <p>Updates metadata about specified flow.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactFlowMetadata service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactFlowMetadataRequest
 */
- (void)updateContactFlowMetadata:(AWSConnectUpdateContactFlowMetadataRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates specified flow module for the specified Amazon Connect instance. </p>
 
 @param request A container for the necessary parameters to execute the UpdateContactFlowModuleContent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectUpdateContactFlowModuleContentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidContactFlowModule`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactFlowModuleContentRequest
 @see AWSConnectUpdateContactFlowModuleContentResponse
 */
- (AWSTask<AWSConnectUpdateContactFlowModuleContentResponse *> *)updateContactFlowModuleContent:(AWSConnectUpdateContactFlowModuleContentRequest *)request;

/**
 <p>Updates specified flow module for the specified Amazon Connect instance. </p>
 
 @param request A container for the necessary parameters to execute the UpdateContactFlowModuleContent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidContactFlowModule`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactFlowModuleContentRequest
 @see AWSConnectUpdateContactFlowModuleContentResponse
 */
- (void)updateContactFlowModuleContent:(AWSConnectUpdateContactFlowModuleContentRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectUpdateContactFlowModuleContentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates metadata about specified flow module.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactFlowModuleMetadata service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectUpdateContactFlowModuleMetadataResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactFlowModuleMetadataRequest
 @see AWSConnectUpdateContactFlowModuleMetadataResponse
 */
- (AWSTask<AWSConnectUpdateContactFlowModuleMetadataResponse *> *)updateContactFlowModuleMetadata:(AWSConnectUpdateContactFlowModuleMetadataRequest *)request;

/**
 <p>Updates metadata about specified flow module.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactFlowModuleMetadata service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactFlowModuleMetadataRequest
 @see AWSConnectUpdateContactFlowModuleMetadataResponse
 */
- (void)updateContactFlowModuleMetadata:(AWSConnectUpdateContactFlowModuleMetadataRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectUpdateContactFlowModuleMetadataResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>The name of the flow.</p><p>You can also create and update flows using the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect Flow language</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactFlowName service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactFlowNameRequest
 */
- (AWSTask *)updateContactFlowName:(AWSConnectUpdateContactFlowNameRequest *)request;

/**
 <p>The name of the flow.</p><p>You can also create and update flows using the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect Flow language</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactFlowName service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactFlowNameRequest
 */
- (void)updateContactFlowName:(AWSConnectUpdateContactFlowNameRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the scheduled time of a task contact that is already scheduled.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectUpdateContactScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactScheduleRequest
 @see AWSConnectUpdateContactScheduleResponse
 */
- (AWSTask<AWSConnectUpdateContactScheduleResponse *> *)updateContactSchedule:(AWSConnectUpdateContactScheduleRequest *)request;

/**
 <p>Updates the scheduled time of a task contact that is already scheduled.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactScheduleRequest
 @see AWSConnectUpdateContactScheduleResponse
 */
- (void)updateContactSchedule:(AWSConnectUpdateContactScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectUpdateContactScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Updates the hours of operation.</p>
 
 @param request A container for the necessary parameters to execute the UpdateHoursOfOperation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorDuplicateResource`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateHoursOfOperationRequest
 */
- (AWSTask *)updateHoursOfOperation:(AWSConnectUpdateHoursOfOperationRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Updates the hours of operation.</p>
 
 @param request A container for the necessary parameters to execute the UpdateHoursOfOperation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorDuplicateResource`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateHoursOfOperationRequest
 */
- (void)updateHoursOfOperation:(AWSConnectUpdateHoursOfOperationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Updates the value for the specified attribute type.</p>
 
 @param request A container for the necessary parameters to execute the UpdateInstanceAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectUpdateInstanceAttributeRequest
 */
- (AWSTask *)updateInstanceAttribute:(AWSConnectUpdateInstanceAttributeRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Updates the value for the specified attribute type.</p>
 
 @param request A container for the necessary parameters to execute the UpdateInstanceAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectUpdateInstanceAttributeRequest
 */
- (void)updateInstanceAttribute:(AWSConnectUpdateInstanceAttributeRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Updates an existing configuration for a resource type. This API is idempotent.</p>
 
 @param request A container for the necessary parameters to execute the UpdateInstanceStorageConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectUpdateInstanceStorageConfigRequest
 */
- (AWSTask *)updateInstanceStorageConfig:(AWSConnectUpdateInstanceStorageConfigRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Updates an existing configuration for a resource type. This API is idempotent.</p>
 
 @param request A container for the necessary parameters to execute the UpdateInstanceStorageConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectUpdateInstanceStorageConfigRequest
 */
- (void)updateInstanceStorageConfig:(AWSConnectUpdateInstanceStorageConfigRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates your claimed phone number from its current Amazon Connect instance or traffic distribution group to another Amazon Connect instance or traffic distribution group in the same Amazon Web Services Region.</p><important><p>You can call <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DescribePhoneNumber.html">DescribePhoneNumber</a> API to verify the status of a previous <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_UpdatePhoneNumber.html">UpdatePhoneNumber</a> operation.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdatePhoneNumber service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectUpdatePhoneNumberResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceInUse`, `AWSConnectErrorIdempotency`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectUpdatePhoneNumberRequest
 @see AWSConnectUpdatePhoneNumberResponse
 */
- (AWSTask<AWSConnectUpdatePhoneNumberResponse *> *)updatePhoneNumber:(AWSConnectUpdatePhoneNumberRequest *)request;

/**
 <p>Updates your claimed phone number from its current Amazon Connect instance or traffic distribution group to another Amazon Connect instance or traffic distribution group in the same Amazon Web Services Region.</p><important><p>You can call <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DescribePhoneNumber.html">DescribePhoneNumber</a> API to verify the status of a previous <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_UpdatePhoneNumber.html">UpdatePhoneNumber</a> operation.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdatePhoneNumber service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceInUse`, `AWSConnectErrorIdempotency`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectUpdatePhoneNumberRequest
 @see AWSConnectUpdatePhoneNumberResponse
 */
- (void)updatePhoneNumber:(AWSConnectUpdatePhoneNumberRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectUpdatePhoneNumberResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Updates the hours of operation for the specified queue.</p>
 
 @param request A container for the necessary parameters to execute the UpdateQueueHoursOfOperation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateQueueHoursOfOperationRequest
 */
- (AWSTask *)updateQueueHoursOfOperation:(AWSConnectUpdateQueueHoursOfOperationRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Updates the hours of operation for the specified queue.</p>
 
 @param request A container for the necessary parameters to execute the UpdateQueueHoursOfOperation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateQueueHoursOfOperationRequest
 */
- (void)updateQueueHoursOfOperation:(AWSConnectUpdateQueueHoursOfOperationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Updates the maximum number of contacts allowed in a queue before it is considered full.</p>
 
 @param request A container for the necessary parameters to execute the UpdateQueueMaxContacts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateQueueMaxContactsRequest
 */
- (AWSTask *)updateQueueMaxContacts:(AWSConnectUpdateQueueMaxContactsRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Updates the maximum number of contacts allowed in a queue before it is considered full.</p>
 
 @param request A container for the necessary parameters to execute the UpdateQueueMaxContacts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateQueueMaxContactsRequest
 */
- (void)updateQueueMaxContacts:(AWSConnectUpdateQueueMaxContactsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Updates the name and description of a queue. At least <code>Name</code> or <code>Description</code> must be provided.</p>
 
 @param request A container for the necessary parameters to execute the UpdateQueueName service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorDuplicateResource`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateQueueNameRequest
 */
- (AWSTask *)updateQueueName:(AWSConnectUpdateQueueNameRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Updates the name and description of a queue. At least <code>Name</code> or <code>Description</code> must be provided.</p>
 
 @param request A container for the necessary parameters to execute the UpdateQueueName service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorDuplicateResource`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateQueueNameRequest
 */
- (void)updateQueueName:(AWSConnectUpdateQueueNameRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Updates the outbound caller ID name, number, and outbound whisper flow for a specified queue.</p><important><p>If the number being used in the input is claimed to a traffic distribution group, and you are calling this API using an instance in the Amazon Web Services Region where the traffic distribution group was created, you can use either a full phone number ARN or UUID value for the <code>OutboundCallerIdNumberId</code> value of the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_OutboundCallerConfig">OutboundCallerConfig</a> request body parameter. However, if the number is claimed to a traffic distribution group and you are calling this API using an instance in the alternate Amazon Web Services Region associated with the traffic distribution group, you must provide a full phone number ARN. If a UUID is provided in this scenario, you will receive a <code>ResourceNotFoundException</code>.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateQueueOutboundCallerConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateQueueOutboundCallerConfigRequest
 */
- (AWSTask *)updateQueueOutboundCallerConfig:(AWSConnectUpdateQueueOutboundCallerConfigRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Updates the outbound caller ID name, number, and outbound whisper flow for a specified queue.</p><important><p>If the number being used in the input is claimed to a traffic distribution group, and you are calling this API using an instance in the Amazon Web Services Region where the traffic distribution group was created, you can use either a full phone number ARN or UUID value for the <code>OutboundCallerIdNumberId</code> value of the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_OutboundCallerConfig">OutboundCallerConfig</a> request body parameter. However, if the number is claimed to a traffic distribution group and you are calling this API using an instance in the alternate Amazon Web Services Region associated with the traffic distribution group, you must provide a full phone number ARN. If a UUID is provided in this scenario, you will receive a <code>ResourceNotFoundException</code>.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateQueueOutboundCallerConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateQueueOutboundCallerConfigRequest
 */
- (void)updateQueueOutboundCallerConfig:(AWSConnectUpdateQueueOutboundCallerConfigRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Updates the status of the queue.</p>
 
 @param request A container for the necessary parameters to execute the UpdateQueueStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateQueueStatusRequest
 */
- (AWSTask *)updateQueueStatus:(AWSConnectUpdateQueueStatusRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Updates the status of the queue.</p>
 
 @param request A container for the necessary parameters to execute the UpdateQueueStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateQueueStatusRequest
 */
- (void)updateQueueStatus:(AWSConnectUpdateQueueStatusRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the configuration settings for the specified quick connect.</p>
 
 @param request A container for the necessary parameters to execute the UpdateQuickConnectConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateQuickConnectConfigRequest
 */
- (AWSTask *)updateQuickConnectConfig:(AWSConnectUpdateQuickConnectConfigRequest *)request;

/**
 <p>Updates the configuration settings for the specified quick connect.</p>
 
 @param request A container for the necessary parameters to execute the UpdateQuickConnectConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateQuickConnectConfigRequest
 */
- (void)updateQuickConnectConfig:(AWSConnectUpdateQuickConnectConfigRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the name and description of a quick connect. The request accepts the following data in JSON format. At least <code>Name</code> or <code>Description</code> must be provided.</p>
 
 @param request A container for the necessary parameters to execute the UpdateQuickConnectName service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateQuickConnectNameRequest
 */
- (AWSTask *)updateQuickConnectName:(AWSConnectUpdateQuickConnectNameRequest *)request;

/**
 <p>Updates the name and description of a quick connect. The request accepts the following data in JSON format. At least <code>Name</code> or <code>Description</code> must be provided.</p>
 
 @param request A container for the necessary parameters to execute the UpdateQuickConnectName service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateQuickConnectNameRequest
 */
- (void)updateQuickConnectName:(AWSConnectUpdateQuickConnectNameRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the channels that agents can handle in the Contact Control Panel (CCP) for a routing profile.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRoutingProfileConcurrency service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateRoutingProfileConcurrencyRequest
 */
- (AWSTask *)updateRoutingProfileConcurrency:(AWSConnectUpdateRoutingProfileConcurrencyRequest *)request;

/**
 <p>Updates the channels that agents can handle in the Contact Control Panel (CCP) for a routing profile.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRoutingProfileConcurrency service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateRoutingProfileConcurrencyRequest
 */
- (void)updateRoutingProfileConcurrency:(AWSConnectUpdateRoutingProfileConcurrencyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the default outbound queue of a routing profile.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRoutingProfileDefaultOutboundQueue service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateRoutingProfileDefaultOutboundQueueRequest
 */
- (AWSTask *)updateRoutingProfileDefaultOutboundQueue:(AWSConnectUpdateRoutingProfileDefaultOutboundQueueRequest *)request;

/**
 <p>Updates the default outbound queue of a routing profile.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRoutingProfileDefaultOutboundQueue service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateRoutingProfileDefaultOutboundQueueRequest
 */
- (void)updateRoutingProfileDefaultOutboundQueue:(AWSConnectUpdateRoutingProfileDefaultOutboundQueueRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the name and description of a routing profile. The request accepts the following data in JSON format. At least <code>Name</code> or <code>Description</code> must be provided.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRoutingProfileName service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorDuplicateResource`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateRoutingProfileNameRequest
 */
- (AWSTask *)updateRoutingProfileName:(AWSConnectUpdateRoutingProfileNameRequest *)request;

/**
 <p>Updates the name and description of a routing profile. The request accepts the following data in JSON format. At least <code>Name</code> or <code>Description</code> must be provided.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRoutingProfileName service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorDuplicateResource`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateRoutingProfileNameRequest
 */
- (void)updateRoutingProfileName:(AWSConnectUpdateRoutingProfileNameRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the properties associated with a set of queues for a routing profile.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRoutingProfileQueues service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateRoutingProfileQueuesRequest
 */
- (AWSTask *)updateRoutingProfileQueues:(AWSConnectUpdateRoutingProfileQueuesRequest *)request;

/**
 <p>Updates the properties associated with a set of queues for a routing profile.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRoutingProfileQueues service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateRoutingProfileQueuesRequest
 */
- (void)updateRoutingProfileQueues:(AWSConnectUpdateRoutingProfileQueuesRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Updates a security profile.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSecurityProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateSecurityProfileRequest
 */
- (AWSTask *)updateSecurityProfile:(AWSConnectUpdateSecurityProfileRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Updates a security profile.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSecurityProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateSecurityProfileRequest
 */
- (void)updateSecurityProfile:(AWSConnectUpdateSecurityProfileRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates details about a specific task template in the specified Amazon Connect instance. This operation does not support partial updates. Instead it does a full update of template content.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTaskTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectUpdateTaskTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorPropertyValidation`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateTaskTemplateRequest
 @see AWSConnectUpdateTaskTemplateResponse
 */
- (AWSTask<AWSConnectUpdateTaskTemplateResponse *> *)updateTaskTemplate:(AWSConnectUpdateTaskTemplateRequest *)request;

/**
 <p>Updates details about a specific task template in the specified Amazon Connect instance. This operation does not support partial updates. Instead it does a full update of template content.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTaskTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorPropertyValidation`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateTaskTemplateRequest
 @see AWSConnectUpdateTaskTemplateResponse
 */
- (void)updateTaskTemplate:(AWSConnectUpdateTaskTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectUpdateTaskTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the traffic distribution for a given traffic distribution group. </p><p>For more information about updating a traffic distribution group, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/update-telephony-traffic-distribution.html">Update telephony traffic distribution across Amazon Web Services Regions </a> in the <i>Amazon Connect Administrator Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the UpdateTrafficDistribution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectUpdateTrafficDistributionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateTrafficDistributionRequest
 @see AWSConnectUpdateTrafficDistributionResponse
 */
- (AWSTask<AWSConnectUpdateTrafficDistributionResponse *> *)updateTrafficDistribution:(AWSConnectUpdateTrafficDistributionRequest *)request;

/**
 <p>Updates the traffic distribution for a given traffic distribution group. </p><p>For more information about updating a traffic distribution group, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/update-telephony-traffic-distribution.html">Update telephony traffic distribution across Amazon Web Services Regions </a> in the <i>Amazon Connect Administrator Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the UpdateTrafficDistribution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateTrafficDistributionRequest
 @see AWSConnectUpdateTrafficDistributionResponse
 */
- (void)updateTrafficDistribution:(AWSConnectUpdateTrafficDistributionRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectUpdateTrafficDistributionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Assigns the specified hierarchy group to the specified user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserHierarchy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserHierarchyRequest
 */
- (AWSTask *)updateUserHierarchy:(AWSConnectUpdateUserHierarchyRequest *)request;

/**
 <p>Assigns the specified hierarchy group to the specified user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserHierarchy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserHierarchyRequest
 */
- (void)updateUserHierarchy:(AWSConnectUpdateUserHierarchyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the name of the user hierarchy group. </p>
 
 @param request A container for the necessary parameters to execute the UpdateUserHierarchyGroupName service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserHierarchyGroupNameRequest
 */
- (AWSTask *)updateUserHierarchyGroupName:(AWSConnectUpdateUserHierarchyGroupNameRequest *)request;

/**
 <p>Updates the name of the user hierarchy group. </p>
 
 @param request A container for the necessary parameters to execute the UpdateUserHierarchyGroupName service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserHierarchyGroupNameRequest
 */
- (void)updateUserHierarchyGroupName:(AWSConnectUpdateUserHierarchyGroupNameRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the user hierarchy structure: add, remove, and rename user hierarchy levels.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserHierarchyStructure service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceInUse`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserHierarchyStructureRequest
 */
- (AWSTask *)updateUserHierarchyStructure:(AWSConnectUpdateUserHierarchyStructureRequest *)request;

/**
 <p>Updates the user hierarchy structure: add, remove, and rename user hierarchy levels.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserHierarchyStructure service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceInUse`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserHierarchyStructureRequest
 */
- (void)updateUserHierarchyStructure:(AWSConnectUpdateUserHierarchyStructureRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the identity information for the specified user.</p><important><p>We strongly recommend limiting who has the ability to invoke <code>UpdateUserIdentityInfo</code>. Someone with that ability can change the login credentials of other users by changing their email address. This poses a security risk to your organization. They can change the email address of a user to the attacker's email address, and then reset the password through email. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/security-profile-best-practices.html">Best Practices for Security Profiles</a> in the <i>Amazon Connect Administrator Guide</i>.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateUserIdentityInfo service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserIdentityInfoRequest
 */
- (AWSTask *)updateUserIdentityInfo:(AWSConnectUpdateUserIdentityInfoRequest *)request;

/**
 <p>Updates the identity information for the specified user.</p><important><p>We strongly recommend limiting who has the ability to invoke <code>UpdateUserIdentityInfo</code>. Someone with that ability can change the login credentials of other users by changing their email address. This poses a security risk to your organization. They can change the email address of a user to the attacker's email address, and then reset the password through email. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/security-profile-best-practices.html">Best Practices for Security Profiles</a> in the <i>Amazon Connect Administrator Guide</i>.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateUserIdentityInfo service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserIdentityInfoRequest
 */
- (void)updateUserIdentityInfo:(AWSConnectUpdateUserIdentityInfoRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the phone configuration settings for the specified user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserPhoneConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserPhoneConfigRequest
 */
- (AWSTask *)updateUserPhoneConfig:(AWSConnectUpdateUserPhoneConfigRequest *)request;

/**
 <p>Updates the phone configuration settings for the specified user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserPhoneConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserPhoneConfigRequest
 */
- (void)updateUserPhoneConfig:(AWSConnectUpdateUserPhoneConfigRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Assigns the specified routing profile to the specified user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserRoutingProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserRoutingProfileRequest
 */
- (AWSTask *)updateUserRoutingProfile:(AWSConnectUpdateUserRoutingProfileRequest *)request;

/**
 <p>Assigns the specified routing profile to the specified user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserRoutingProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserRoutingProfileRequest
 */
- (void)updateUserRoutingProfile:(AWSConnectUpdateUserRoutingProfileRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Assigns the specified security profiles to the specified user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserSecurityProfiles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserSecurityProfilesRequest
 */
- (AWSTask *)updateUserSecurityProfiles:(AWSConnectUpdateUserSecurityProfilesRequest *)request;

/**
 <p>Assigns the specified security profiles to the specified user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserSecurityProfiles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserSecurityProfilesRequest
 */
- (void)updateUserSecurityProfiles:(AWSConnectUpdateUserSecurityProfilesRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
