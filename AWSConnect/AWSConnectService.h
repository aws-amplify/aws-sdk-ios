//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
 <p>Amazon Connect is a cloud-based contact center solution that you use to set up and manage a customer contact center and provide reliable customer engagement at any scale.</p><p>Amazon Connect provides metrics and real-time reporting that enable you to optimize contact routing. You can also resolve customer issues more efficiently by getting customers in touch with the appropriate agents.</p><p>There are limits to the number of Amazon Connect resources that you can create. There are also limits to the number of requests that you can make per second. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">Amazon Connect Service Quotas</a> in the <i>Amazon Connect Administrator Guide</i>.</p><p>You can connect programmatically to an Amazon Web Services service by using an endpoint. For a list of Amazon Connect endpoints, see <a href="https://docs.aws.amazon.com/general/latest/gr/connect_region.html">Amazon Connect Endpoints</a>.</p>
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
 <p>Activates an evaluation form in the specified Amazon Connect instance. After the evaluation form is activated, it is available to start new evaluations based on the form. </p>
 
 @param request A container for the necessary parameters to execute the ActivateEvaluationForm service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectActivateEvaluationFormResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceConflict`.
 
 @see AWSConnectActivateEvaluationFormRequest
 @see AWSConnectActivateEvaluationFormResponse
 */
- (AWSTask<AWSConnectActivateEvaluationFormResponse *> *)activateEvaluationForm:(AWSConnectActivateEvaluationFormRequest *)request;

/**
 <p>Activates an evaluation form in the specified Amazon Connect instance. After the evaluation form is activated, it is available to start new evaluations based on the form. </p>
 
 @param request A container for the necessary parameters to execute the ActivateEvaluationForm service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceConflict`.
 
 @see AWSConnectActivateEvaluationFormRequest
 @see AWSConnectActivateEvaluationFormResponse
 */
- (void)activateEvaluationForm:(AWSConnectActivateEvaluationFormRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectActivateEvaluationFormResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Associates the specified dataset for a Amazon Connect instance with the target account. You can associate only one dataset in a single call.</p>
 
 @param request A container for the necessary parameters to execute the AssociateAnalyticsDataSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectAssociateAnalyticsDataSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectAssociateAnalyticsDataSetRequest
 @see AWSConnectAssociateAnalyticsDataSetResponse
 */
- (AWSTask<AWSConnectAssociateAnalyticsDataSetResponse *> *)associateAnalyticsDataSet:(AWSConnectAssociateAnalyticsDataSetRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Associates the specified dataset for a Amazon Connect instance with the target account. You can associate only one dataset in a single call.</p>
 
 @param request A container for the necessary parameters to execute the AssociateAnalyticsDataSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectAssociateAnalyticsDataSetRequest
 @see AWSConnectAssociateAnalyticsDataSetResponse
 */
- (void)associateAnalyticsDataSet:(AWSConnectAssociateAnalyticsDataSetRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectAssociateAnalyticsDataSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Associates a connect resource to a flow.</p>
 
 @param request A container for the necessary parameters to execute the AssociateFlow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectAssociateFlowResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectAssociateFlowRequest
 @see AWSConnectAssociateFlowResponse
 */
- (AWSTask<AWSConnectAssociateFlowResponse *> *)associateFlow:(AWSConnectAssociateFlowRequest *)request;

/**
 <p>Associates a connect resource to a flow.</p>
 
 @param request A container for the necessary parameters to execute the AssociateFlow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectAssociateFlowRequest
 @see AWSConnectAssociateFlowResponse
 */
- (void)associateFlow:(AWSConnectAssociateFlowRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectAssociateFlowResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Allows the specified Amazon Connect instance to access the specified Amazon Lex V1 bot. This API only supports the association of Amazon Lex V1 bots.</p>
 
 @param request A container for the necessary parameters to execute the AssociateLexBot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectAssociateLexBotRequest
 */
- (AWSTask *)associateLexBot:(AWSConnectAssociateLexBotRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Allows the specified Amazon Connect instance to access the specified Amazon Lex V1 bot. This API only supports the association of Amazon Lex V1 bots.</p>
 
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
 <p>Associates an agent with a traffic distribution group.</p>
 
 @param request A container for the necessary parameters to execute the AssociateTrafficDistributionGroupUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectAssociateTrafficDistributionGroupUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectAssociateTrafficDistributionGroupUserRequest
 @see AWSConnectAssociateTrafficDistributionGroupUserResponse
 */
- (AWSTask<AWSConnectAssociateTrafficDistributionGroupUserResponse *> *)associateTrafficDistributionGroupUser:(AWSConnectAssociateTrafficDistributionGroupUserRequest *)request;

/**
 <p>Associates an agent with a traffic distribution group.</p>
 
 @param request A container for the necessary parameters to execute the AssociateTrafficDistributionGroupUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectAssociateTrafficDistributionGroupUserRequest
 @see AWSConnectAssociateTrafficDistributionGroupUserResponse
 */
- (void)associateTrafficDistributionGroupUser:(AWSConnectAssociateTrafficDistributionGroupUserRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectAssociateTrafficDistributionGroupUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>&gt;Associates a set of proficiencies with a user.</p>
 
 @param request A container for the necessary parameters to execute the AssociateUserProficiencies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectAssociateUserProficienciesRequest
 */
- (AWSTask *)associateUserProficiencies:(AWSConnectAssociateUserProficienciesRequest *)request;

/**
 <p>&gt;Associates a set of proficiencies with a user.</p>
 
 @param request A container for the necessary parameters to execute the AssociateUserProficiencies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectAssociateUserProficienciesRequest
 */
- (void)associateUserProficiencies:(AWSConnectAssociateUserProficienciesRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Associates a list of analytics datasets for a given Amazon Connect instance to a target account. You can associate multiple datasets in a single call.</p>
 
 @param request A container for the necessary parameters to execute the BatchAssociateAnalyticsDataSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectBatchAssociateAnalyticsDataSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectBatchAssociateAnalyticsDataSetRequest
 @see AWSConnectBatchAssociateAnalyticsDataSetResponse
 */
- (AWSTask<AWSConnectBatchAssociateAnalyticsDataSetResponse *> *)batchAssociateAnalyticsDataSet:(AWSConnectBatchAssociateAnalyticsDataSetRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Associates a list of analytics datasets for a given Amazon Connect instance to a target account. You can associate multiple datasets in a single call.</p>
 
 @param request A container for the necessary parameters to execute the BatchAssociateAnalyticsDataSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectBatchAssociateAnalyticsDataSetRequest
 @see AWSConnectBatchAssociateAnalyticsDataSetResponse
 */
- (void)batchAssociateAnalyticsDataSet:(AWSConnectBatchAssociateAnalyticsDataSetRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectBatchAssociateAnalyticsDataSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Removes a list of analytics datasets associated with a given Amazon Connect instance. You can disassociate multiple datasets in a single call.</p>
 
 @param request A container for the necessary parameters to execute the BatchDisassociateAnalyticsDataSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectBatchDisassociateAnalyticsDataSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectBatchDisassociateAnalyticsDataSetRequest
 @see AWSConnectBatchDisassociateAnalyticsDataSetResponse
 */
- (AWSTask<AWSConnectBatchDisassociateAnalyticsDataSetResponse *> *)batchDisassociateAnalyticsDataSet:(AWSConnectBatchDisassociateAnalyticsDataSetRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Removes a list of analytics datasets associated with a given Amazon Connect instance. You can disassociate multiple datasets in a single call.</p>
 
 @param request A container for the necessary parameters to execute the BatchDisassociateAnalyticsDataSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectBatchDisassociateAnalyticsDataSetRequest
 @see AWSConnectBatchDisassociateAnalyticsDataSetResponse
 */
- (void)batchDisassociateAnalyticsDataSet:(AWSConnectBatchDisassociateAnalyticsDataSetRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectBatchDisassociateAnalyticsDataSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve the flow associations for the given resources.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetFlowAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectBatchGetFlowAssociationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectBatchGetFlowAssociationRequest
 @see AWSConnectBatchGetFlowAssociationResponse
 */
- (AWSTask<AWSConnectBatchGetFlowAssociationResponse *> *)batchGetFlowAssociation:(AWSConnectBatchGetFlowAssociationRequest *)request;

/**
 <p>Retrieve the flow associations for the given resources.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetFlowAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectBatchGetFlowAssociationRequest
 @see AWSConnectBatchGetFlowAssociationResponse
 */
- (void)batchGetFlowAssociation:(AWSConnectBatchGetFlowAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectBatchGetFlowAssociationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>Only the Amazon Connect outbound campaigns service principal is allowed to assume a role in your account and call this API.</p></note><p>Allows you to create a batch of contacts in Amazon Connect. The outbound campaigns capability ingests dial requests via the <a href="https://docs.aws.amazon.com/connect-outbound/latest/APIReference/API_PutDialRequestBatch.html">PutDialRequestBatch</a> API. It then uses BatchPutContact to create contacts corresponding to those dial requests. If agents are available, the dial requests are dialed out, which results in a voice call. The resulting voice call uses the same contactId that was created by BatchPutContact. </p>
 
 @param request A container for the necessary parameters to execute the BatchPutContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectBatchPutContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorIdempotency`.
 
 @see AWSConnectBatchPutContactRequest
 @see AWSConnectBatchPutContactResponse
 */
- (AWSTask<AWSConnectBatchPutContactResponse *> *)batchPutContact:(AWSConnectBatchPutContactRequest *)request;

/**
 <note><p>Only the Amazon Connect outbound campaigns service principal is allowed to assume a role in your account and call this API.</p></note><p>Allows you to create a batch of contacts in Amazon Connect. The outbound campaigns capability ingests dial requests via the <a href="https://docs.aws.amazon.com/connect-outbound/latest/APIReference/API_PutDialRequestBatch.html">PutDialRequestBatch</a> API. It then uses BatchPutContact to create contacts corresponding to those dial requests. If agents are available, the dial requests are dialed out, which results in a voice call. The resulting voice call uses the same contactId that was created by BatchPutContact. </p>
 
 @param request A container for the necessary parameters to execute the BatchPutContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorIdempotency`.
 
 @see AWSConnectBatchPutContactRequest
 @see AWSConnectBatchPutContactResponse
 */
- (void)batchPutContact:(AWSConnectBatchPutContactRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectBatchPutContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Claims an available phone number to your Amazon Connect instance or traffic distribution group. You can call this API only in the same Amazon Web Services Region where the Amazon Connect instance or traffic distribution group was created.</p><p>For more information about how to use this operation, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/claim-phone-number.html">Claim a phone number in your country</a> and <a href="https://docs.aws.amazon.com/connect/latest/adminguide/claim-phone-numbers-traffic-distribution-groups.html">Claim phone numbers to traffic distribution groups</a> in the <i>Amazon Connect Administrator Guide</i>. </p><important><p>You can call the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_SearchAvailablePhoneNumbers.html">SearchAvailablePhoneNumbers</a> API for available phone numbers that you can claim. Call the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DescribePhoneNumber.html">DescribePhoneNumber</a> API to verify the status of a previous <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ClaimPhoneNumber.html">ClaimPhoneNumber</a> operation.</p></important><p>If you plan to claim and release numbers frequently during a 30 day period, contact us for a service quota exception. Otherwise, it is possible you will be blocked from claiming and releasing any more numbers until 30 days past the oldest number released has expired.</p><p>By default you can claim and release up to 200% of your maximum number of active phone numbers during any 30 day period. If you claim and release phone numbers using the UI or API during a rolling 30 day cycle that exceeds 200% of your phone number service level quota, you will be blocked from claiming any more numbers until 30 days past the oldest number released has expired. </p><p>For example, if you already have 99 claimed numbers and a service level quota of 99 phone numbers, and in any 30 day period you release 99, claim 99, and then release 99, you will have exceeded the 200% limit. At that point you are blocked from claiming any more numbers until you open an Amazon Web Services support ticket.</p>
 
 @param request A container for the necessary parameters to execute the ClaimPhoneNumber service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectClaimPhoneNumberResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorIdempotency`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectClaimPhoneNumberRequest
 @see AWSConnectClaimPhoneNumberResponse
 */
- (AWSTask<AWSConnectClaimPhoneNumberResponse *> *)claimPhoneNumber:(AWSConnectClaimPhoneNumberRequest *)request;

/**
 <p>Claims an available phone number to your Amazon Connect instance or traffic distribution group. You can call this API only in the same Amazon Web Services Region where the Amazon Connect instance or traffic distribution group was created.</p><p>For more information about how to use this operation, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/claim-phone-number.html">Claim a phone number in your country</a> and <a href="https://docs.aws.amazon.com/connect/latest/adminguide/claim-phone-numbers-traffic-distribution-groups.html">Claim phone numbers to traffic distribution groups</a> in the <i>Amazon Connect Administrator Guide</i>. </p><important><p>You can call the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_SearchAvailablePhoneNumbers.html">SearchAvailablePhoneNumbers</a> API for available phone numbers that you can claim. Call the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DescribePhoneNumber.html">DescribePhoneNumber</a> API to verify the status of a previous <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ClaimPhoneNumber.html">ClaimPhoneNumber</a> operation.</p></important><p>If you plan to claim and release numbers frequently during a 30 day period, contact us for a service quota exception. Otherwise, it is possible you will be blocked from claiming and releasing any more numbers until 30 days past the oldest number released has expired.</p><p>By default you can claim and release up to 200% of your maximum number of active phone numbers during any 30 day period. If you claim and release phone numbers using the UI or API during a rolling 30 day cycle that exceeds 200% of your phone number service level quota, you will be blocked from claiming any more numbers until 30 days past the oldest number released has expired. </p><p>For example, if you already have 99 claimed numbers and a service level quota of 99 phone numbers, and in any 30 day period you release 99, claim 99, and then release 99, you will have exceeded the 200% limit. At that point you are blocked from claiming any more numbers until you open an Amazon Web Services support ticket.</p>
 
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
 <p>Creates a flow for the specified Amazon Connect instance.</p><p>You can also create and update flows using the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/flow-language.html">Amazon Connect Flow language</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateContactFlow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateContactFlowResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidContactFlow`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateContactFlowRequest
 @see AWSConnectCreateContactFlowResponse
 */
- (AWSTask<AWSConnectCreateContactFlowResponse *> *)createContactFlow:(AWSConnectCreateContactFlowRequest *)request;

/**
 <p>Creates a flow for the specified Amazon Connect instance.</p><p>You can also create and update flows using the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/flow-language.html">Amazon Connect Flow language</a>.</p>
 
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
 <p>Creates an evaluation form in the specified Amazon Connect instance. The form can be used to define questions related to agent performance, and create sections to organize such questions. Question and section identifiers cannot be duplicated within the same evaluation form.</p>
 
 @param request A container for the necessary parameters to execute the CreateEvaluationForm service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateEvaluationFormResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorResourceConflict`.
 
 @see AWSConnectCreateEvaluationFormRequest
 @see AWSConnectCreateEvaluationFormResponse
 */
- (AWSTask<AWSConnectCreateEvaluationFormResponse *> *)createEvaluationForm:(AWSConnectCreateEvaluationFormRequest *)request;

/**
 <p>Creates an evaluation form in the specified Amazon Connect instance. The form can be used to define questions related to agent performance, and create sections to organize such questions. Question and section identifiers cannot be duplicated within the same evaluation form.</p>
 
 @param request A container for the necessary parameters to execute the CreateEvaluationForm service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorResourceConflict`.
 
 @see AWSConnectCreateEvaluationFormRequest
 @see AWSConnectCreateEvaluationFormResponse
 */
- (void)createEvaluationForm:(AWSConnectCreateEvaluationFormRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreateEvaluationFormResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Adds a new participant into an on-going chat contact. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/chat-customize-flow.html">Customize chat flow experiences by integrating custom participants</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateParticipant service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateParticipantResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectCreateParticipantRequest
 @see AWSConnectCreateParticipantResponse
 */
- (AWSTask<AWSConnectCreateParticipantResponse *> *)createParticipant:(AWSConnectCreateParticipantRequest *)request;

/**
 <p>Adds a new participant into an on-going chat contact. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/chat-customize-flow.html">Customize chat flow experiences by integrating custom participants</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateParticipant service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectCreateParticipantRequest
 @see AWSConnectCreateParticipantResponse
 */
- (void)createParticipant:(AWSConnectCreateParticipantRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreateParticipantResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables rehydration of chats for the lifespan of a contact. For more information about chat rehydration, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/chat-persistence.html">Enable persistent chat</a> in the <i>Amazon Connect Administrator Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the CreatePersistentContactAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreatePersistentContactAssociationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreatePersistentContactAssociationRequest
 @see AWSConnectCreatePersistentContactAssociationResponse
 */
- (AWSTask<AWSConnectCreatePersistentContactAssociationResponse *> *)createPersistentContactAssociation:(AWSConnectCreatePersistentContactAssociationRequest *)request;

/**
 <p>Enables rehydration of chats for the lifespan of a contact. For more information about chat rehydration, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/chat-persistence.html">Enable persistent chat</a> in the <i>Amazon Connect Administrator Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the CreatePersistentContactAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreatePersistentContactAssociationRequest
 @see AWSConnectCreatePersistentContactAssociationResponse
 */
- (void)createPersistentContactAssociation:(AWSConnectCreatePersistentContactAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreatePersistentContactAssociationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new predefined attribute for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the CreatePredefinedAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorDuplicateResource`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreatePredefinedAttributeRequest
 */
- (AWSTask *)createPredefinedAttribute:(AWSConnectCreatePredefinedAttributeRequest *)request;

/**
 <p>Creates a new predefined attribute for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the CreatePredefinedAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorDuplicateResource`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreatePredefinedAttributeRequest
 */
- (void)createPredefinedAttribute:(AWSConnectCreatePredefinedAttributeRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates a prompt. For more information about prompts, such as supported file types and maximum length, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/prompts.html">Create prompts</a> in the <i>Amazon Connect Administrator's Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreatePrompt service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreatePromptResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorDuplicateResource`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreatePromptRequest
 @see AWSConnectCreatePromptResponse
 */
- (AWSTask<AWSConnectCreatePromptResponse *> *)createPrompt:(AWSConnectCreatePromptRequest *)request;

/**
 <p>Creates a prompt. For more information about prompts, such as supported file types and maximum length, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/prompts.html">Create prompts</a> in the <i>Amazon Connect Administrator's Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreatePrompt service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorDuplicateResource`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreatePromptRequest
 @see AWSConnectCreatePromptResponse
 */
- (void)createPrompt:(AWSConnectCreatePromptRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreatePromptResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Creates a new queue for the specified Amazon Connect instance.</p><important><ul><li><p>If the phone number is claimed to a traffic distribution group that was created in the same Region as the Amazon Connect instance where you are calling this API, then you can use a full phone number ARN or a UUID for <code>OutboundCallerIdNumberId</code>. However, if the phone number is claimed to a traffic distribution group that is in one Region, and you are calling this API from an instance in another Amazon Web Services Region that is associated with the traffic distribution group, you must provide a full phone number ARN. If a UUID is provided in this scenario, you will receive a <code>ResourceNotFoundException</code>.</p></li><li><p>Only use the phone number ARN format that doesn't contain <code>instance</code> in the path, for example, <code>arn:aws:connect:us-east-1:1234567890:phone-number/uuid</code>. This is the same ARN format that is returned when you call the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ListPhoneNumbersV2.html">ListPhoneNumbersV2</a> API.</p></li><li><p>If you plan to use IAM policies to allow/deny access to this API for phone number resources claimed to a traffic distribution group, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/security_iam_resource-level-policy-examples.html#allow-deny-queue-actions-replica-region">Allow or Deny queue API actions for phone numbers in a replica Region</a>.</p></li></ul></important>
 
 @param request A container for the necessary parameters to execute the CreateQueue service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateQueueResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateQueueRequest
 @see AWSConnectCreateQueueResponse
 */
- (AWSTask<AWSConnectCreateQueueResponse *> *)createQueue:(AWSConnectCreateQueueRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Creates a new queue for the specified Amazon Connect instance.</p><important><ul><li><p>If the phone number is claimed to a traffic distribution group that was created in the same Region as the Amazon Connect instance where you are calling this API, then you can use a full phone number ARN or a UUID for <code>OutboundCallerIdNumberId</code>. However, if the phone number is claimed to a traffic distribution group that is in one Region, and you are calling this API from an instance in another Amazon Web Services Region that is associated with the traffic distribution group, you must provide a full phone number ARN. If a UUID is provided in this scenario, you will receive a <code>ResourceNotFoundException</code>.</p></li><li><p>Only use the phone number ARN format that doesn't contain <code>instance</code> in the path, for example, <code>arn:aws:connect:us-east-1:1234567890:phone-number/uuid</code>. This is the same ARN format that is returned when you call the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ListPhoneNumbersV2.html">ListPhoneNumbersV2</a> API.</p></li><li><p>If you plan to use IAM policies to allow/deny access to this API for phone number resources claimed to a traffic distribution group, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/security_iam_resource-level-policy-examples.html#allow-deny-queue-actions-replica-region">Allow or Deny queue API actions for phone numbers in a replica Region</a>.</p></li></ul></important>
 
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
 <p>Creates a rule for the specified Amazon Connect instance.</p><p>Use the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/connect-rules-language.html">Rules Function language</a> to code conditions for the rule. </p>
 
 @param request A container for the necessary parameters to execute the CreateRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorServiceQuotaExceeded`.
 
 @see AWSConnectCreateRuleRequest
 @see AWSConnectCreateRuleResponse
 */
- (AWSTask<AWSConnectCreateRuleResponse *> *)createRule:(AWSConnectCreateRuleRequest *)request;

/**
 <p>Creates a rule for the specified Amazon Connect instance.</p><p>Use the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/connect-rules-language.html">Rules Function language</a> to code conditions for the rule. </p>
 
 @param request A container for the necessary parameters to execute the CreateRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorServiceQuotaExceeded`.
 
 @see AWSConnectCreateRuleRequest
 @see AWSConnectCreateRuleResponse
 */
- (void)createRule:(AWSConnectCreateRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreateRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a security profile.</p>
 
 @param request A container for the necessary parameters to execute the CreateSecurityProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateSecurityProfileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateSecurityProfileRequest
 @see AWSConnectCreateSecurityProfileResponse
 */
- (AWSTask<AWSConnectCreateSecurityProfileResponse *> *)createSecurityProfile:(AWSConnectCreateSecurityProfileRequest *)request;

/**
 <p>Creates a security profile.</p>
 
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
 <p>Creates a traffic distribution group given an Amazon Connect instance that has been replicated. </p><note><p>The <code>SignInConfig</code> distribution is available only on a default <code>TrafficDistributionGroup</code> (see the <code>IsDefault</code> parameter in the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_TrafficDistributionGroup.html">TrafficDistributionGroup</a> data type). If you call <code>UpdateTrafficDistribution</code> with a modified <code>SignInConfig</code> and a non-default <code>TrafficDistributionGroup</code>, an <code>InvalidRequestException</code> is returned.</p></note><p>For more information about creating traffic distribution groups, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/setup-traffic-distribution-groups.html">Set up traffic distribution groups</a> in the <i>Amazon Connect Administrator Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the CreateTrafficDistributionGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateTrafficDistributionGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorResourceNotReady`.
 
 @see AWSConnectCreateTrafficDistributionGroupRequest
 @see AWSConnectCreateTrafficDistributionGroupResponse
 */
- (AWSTask<AWSConnectCreateTrafficDistributionGroupResponse *> *)createTrafficDistributionGroup:(AWSConnectCreateTrafficDistributionGroupRequest *)request;

/**
 <p>Creates a traffic distribution group given an Amazon Connect instance that has been replicated. </p><note><p>The <code>SignInConfig</code> distribution is available only on a default <code>TrafficDistributionGroup</code> (see the <code>IsDefault</code> parameter in the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_TrafficDistributionGroup.html">TrafficDistributionGroup</a> data type). If you call <code>UpdateTrafficDistribution</code> with a modified <code>SignInConfig</code> and a non-default <code>TrafficDistributionGroup</code>, an <code>InvalidRequestException</code> is returned.</p></note><p>For more information about creating traffic distribution groups, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/setup-traffic-distribution-groups.html">Set up traffic distribution groups</a> in the <i>Amazon Connect Administrator Guide</i>. </p>
 
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
 <p>Creates a user account for the specified Amazon Connect instance.</p><important><p>Certain <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_UserIdentityInfo.html">UserIdentityInfo</a> parameters are required in some situations. For example, <code>Email</code> is required if you are using SAML for identity management. <code>FirstName</code> and <code>LastName</code> are required if you are using Amazon Connect or SAML for identity management.</p></important><p>For information about how to create users using the Amazon Connect admin website, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/user-management.html">Add Users</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateUserRequest
 @see AWSConnectCreateUserResponse
 */
- (AWSTask<AWSConnectCreateUserResponse *> *)createUser:(AWSConnectCreateUserRequest *)request;

/**
 <p>Creates a user account for the specified Amazon Connect instance.</p><important><p>Certain <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_UserIdentityInfo.html">UserIdentityInfo</a> parameters are required in some situations. For example, <code>Email</code> is required if you are using SAML for identity management. <code>FirstName</code> and <code>LastName</code> are required if you are using Amazon Connect or SAML for identity management.</p></important><p>For information about how to create users using the Amazon Connect admin website, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/user-management.html">Add Users</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
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
 <p>Creates a new view with the possible status of <code>SAVED</code> or <code>PUBLISHED</code>.</p><p>The views will have a unique name for each connect instance.</p><p>It performs basic content validation if the status is <code>SAVED</code> or full content validation if the status is set to <code>PUBLISHED</code>. An error is returned if validation fails. It associates either the <code>$SAVED</code> qualifier or both of the <code>$SAVED</code> and <code>$LATEST</code> qualifiers with the provided view content based on the status. The view is idempotent if ClientToken is provided.</p>
 
 @param request A container for the necessary parameters to execute the CreateView service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateViewResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorTooManyRequests`, `AWSConnectErrorResourceInUse`.
 
 @see AWSConnectCreateViewRequest
 @see AWSConnectCreateViewResponse
 */
- (AWSTask<AWSConnectCreateViewResponse *> *)createView:(AWSConnectCreateViewRequest *)request;

/**
 <p>Creates a new view with the possible status of <code>SAVED</code> or <code>PUBLISHED</code>.</p><p>The views will have a unique name for each connect instance.</p><p>It performs basic content validation if the status is <code>SAVED</code> or full content validation if the status is set to <code>PUBLISHED</code>. An error is returned if validation fails. It associates either the <code>$SAVED</code> qualifier or both of the <code>$SAVED</code> and <code>$LATEST</code> qualifiers with the provided view content based on the status. The view is idempotent if ClientToken is provided.</p>
 
 @param request A container for the necessary parameters to execute the CreateView service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorTooManyRequests`, `AWSConnectErrorResourceInUse`.
 
 @see AWSConnectCreateViewRequest
 @see AWSConnectCreateViewResponse
 */
- (void)createView:(AWSConnectCreateViewRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreateViewResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Publishes a new version of the view identifier.</p><p>Versions are immutable and monotonically increasing.</p><p>It returns the highest version if there is no change in content compared to that version. An error is displayed if the supplied ViewContentSha256 is different from the ViewContentSha256 of the <code>$LATEST</code> alias.</p>
 
 @param request A container for the necessary parameters to execute the CreateViewVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateViewVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorTooManyRequests`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorResourceInUse`.
 
 @see AWSConnectCreateViewVersionRequest
 @see AWSConnectCreateViewVersionResponse
 */
- (AWSTask<AWSConnectCreateViewVersionResponse *> *)createViewVersion:(AWSConnectCreateViewVersionRequest *)request;

/**
 <p>Publishes a new version of the view identifier.</p><p>Versions are immutable and monotonically increasing.</p><p>It returns the highest version if there is no change in content compared to that version. An error is displayed if the supplied ViewContentSha256 is different from the ViewContentSha256 of the <code>$LATEST</code> alias.</p>
 
 @param request A container for the necessary parameters to execute the CreateViewVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorTooManyRequests`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorResourceInUse`.
 
 @see AWSConnectCreateViewVersionRequest
 @see AWSConnectCreateViewVersionResponse
 */
- (void)createViewVersion:(AWSConnectCreateViewVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreateViewVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Deactivates an evaluation form in the specified Amazon Connect instance. After a form is deactivated, it is no longer available for users to start new evaluations based on the form. </p>
 
 @param request A container for the necessary parameters to execute the DeactivateEvaluationForm service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDeactivateEvaluationFormResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceConflict`.
 
 @see AWSConnectDeactivateEvaluationFormRequest
 @see AWSConnectDeactivateEvaluationFormResponse
 */
- (AWSTask<AWSConnectDeactivateEvaluationFormResponse *> *)deactivateEvaluationForm:(AWSConnectDeactivateEvaluationFormRequest *)request;

/**
 <p>Deactivates an evaluation form in the specified Amazon Connect instance. After a form is deactivated, it is no longer available for users to start new evaluations based on the form. </p>
 
 @param request A container for the necessary parameters to execute the DeactivateEvaluationForm service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceConflict`.
 
 @see AWSConnectDeactivateEvaluationFormRequest
 @see AWSConnectDeactivateEvaluationFormResponse
 */
- (void)deactivateEvaluationForm:(AWSConnectDeactivateEvaluationFormRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDeactivateEvaluationFormResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a contact evaluation in the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the DeleteContactEvaluation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceConflict`.
 
 @see AWSConnectDeleteContactEvaluationRequest
 */
- (AWSTask *)deleteContactEvaluation:(AWSConnectDeleteContactEvaluationRequest *)request;

/**
 <p>Deletes a contact evaluation in the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the DeleteContactEvaluation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceConflict`.
 
 @see AWSConnectDeleteContactEvaluationRequest
 */
- (void)deleteContactEvaluation:(AWSConnectDeleteContactEvaluationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a flow for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the DeleteContactFlow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDeleteContactFlowResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDeleteContactFlowRequest
 @see AWSConnectDeleteContactFlowResponse
 */
- (AWSTask<AWSConnectDeleteContactFlowResponse *> *)deleteContactFlow:(AWSConnectDeleteContactFlowRequest *)request;

/**
 <p>Deletes a flow for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the DeleteContactFlow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDeleteContactFlowRequest
 @see AWSConnectDeleteContactFlowResponse
 */
- (void)deleteContactFlow:(AWSConnectDeleteContactFlowRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDeleteContactFlowResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Deletes an evaluation form in the specified Amazon Connect instance. </p><ul><li><p>If the version property is provided, only the specified version of the evaluation form is deleted.</p></li><li><p>If no version is provided, then the full form (all versions) is deleted.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DeleteEvaluationForm service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceConflict`.
 
 @see AWSConnectDeleteEvaluationFormRequest
 */
- (AWSTask *)deleteEvaluationForm:(AWSConnectDeleteEvaluationFormRequest *)request;

/**
 <p>Deletes an evaluation form in the specified Amazon Connect instance. </p><ul><li><p>If the version property is provided, only the specified version of the evaluation form is deleted.</p></li><li><p>If no version is provided, then the full form (all versions) is deleted.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DeleteEvaluationForm service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceConflict`.
 
 @see AWSConnectDeleteEvaluationFormRequest
 */
- (void)deleteEvaluationForm:(AWSConnectDeleteEvaluationFormRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

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
 <p>Deletes a predefined attribute from the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the DeletePredefinedAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceInUse`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeletePredefinedAttributeRequest
 */
- (AWSTask *)deletePredefinedAttribute:(AWSConnectDeletePredefinedAttributeRequest *)request;

/**
 <p>Deletes a predefined attribute from the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the DeletePredefinedAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceInUse`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeletePredefinedAttributeRequest
 */
- (void)deletePredefinedAttribute:(AWSConnectDeletePredefinedAttributeRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a prompt.</p>
 
 @param request A container for the necessary parameters to execute the DeletePrompt service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeletePromptRequest
 */
- (AWSTask *)deletePrompt:(AWSConnectDeletePromptRequest *)request;

/**
 <p>Deletes a prompt.</p>
 
 @param request A container for the necessary parameters to execute the DeletePrompt service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeletePromptRequest
 */
- (void)deletePrompt:(AWSConnectDeletePromptRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a queue.</p>
 
 @param request A container for the necessary parameters to execute the DeleteQueue service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceInUse`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteQueueRequest
 */
- (AWSTask *)deleteQueue:(AWSConnectDeleteQueueRequest *)request;

/**
 <p>Deletes a queue.</p>
 
 @param request A container for the necessary parameters to execute the DeleteQueue service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceInUse`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteQueueRequest
 */
- (void)deleteQueue:(AWSConnectDeleteQueueRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a quick connect. </p><important><p>After calling <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DeleteUser.html">DeleteUser</a>, it's important to call <code>DeleteQuickConnect</code> to delete any records related to the deleted users. This will help you:</p><ul><li><p>Avoid dangling resources that impact your service quotas.</p></li><li><p>Remove deleted users so they don't appear to agents as transfer options.</p></li><li><p>Avoid the disruption of other Amazon Connect processes, such as instance replication and syncing if you're using <a href="https://docs.aws.amazon.com/connect/latest/adminguide/setup-connect-global-resiliency.html">Amazon Connect Global Resiliency</a>. </p></li></ul></important>
 
 @param request A container for the necessary parameters to execute the DeleteQuickConnect service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteQuickConnectRequest
 */
- (AWSTask *)deleteQuickConnect:(AWSConnectDeleteQuickConnectRequest *)request;

/**
 <p>Deletes a quick connect. </p><important><p>After calling <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DeleteUser.html">DeleteUser</a>, it's important to call <code>DeleteQuickConnect</code> to delete any records related to the deleted users. This will help you:</p><ul><li><p>Avoid dangling resources that impact your service quotas.</p></li><li><p>Remove deleted users so they don't appear to agents as transfer options.</p></li><li><p>Avoid the disruption of other Amazon Connect processes, such as instance replication and syncing if you're using <a href="https://docs.aws.amazon.com/connect/latest/adminguide/setup-connect-global-resiliency.html">Amazon Connect Global Resiliency</a>. </p></li></ul></important>
 
 @param request A container for the necessary parameters to execute the DeleteQuickConnect service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteQuickConnectRequest
 */
- (void)deleteQuickConnect:(AWSConnectDeleteQuickConnectRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a routing profile.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRoutingProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceInUse`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteRoutingProfileRequest
 */
- (AWSTask *)deleteRoutingProfile:(AWSConnectDeleteRoutingProfileRequest *)request;

/**
 <p>Deletes a routing profile.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRoutingProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceInUse`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteRoutingProfileRequest
 */
- (void)deleteRoutingProfile:(AWSConnectDeleteRoutingProfileRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a rule for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectDeleteRuleRequest
 */
- (AWSTask *)deleteRule:(AWSConnectDeleteRuleRequest *)request;

/**
 <p>Deletes a rule for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectDeleteRuleRequest
 */
- (void)deleteRule:(AWSConnectDeleteRuleRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a security profile.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSecurityProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceInUse`.
 
 @see AWSConnectDeleteSecurityProfileRequest
 */
- (AWSTask *)deleteSecurityProfile:(AWSConnectDeleteSecurityProfileRequest *)request;

/**
 <p>Deletes a security profile.</p>
 
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
 <p>Deletes a user account from the specified Amazon Connect instance.</p><p>For information about what happens to a user's data when their account is deleted, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/delete-users.html">Delete Users from Your Amazon Connect Instance</a> in the <i>Amazon Connect Administrator Guide</i>.</p><important><p>After calling DeleteUser, call <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DeleteQuickConnect.html">DeleteQuickConnect</a> to delete any records related to the deleted users. This will help you:</p><ul><li><p>Avoid dangling resources that impact your service quotas.</p></li><li><p>Remove deleted users so they don't appear to agents as transfer options.</p></li><li><p>Avoid the disruption of other Amazon Connect processes, such as instance replication and syncing if you're using <a href="https://docs.aws.amazon.com/connect/latest/adminguide/setup-connect-global-resiliency.html">Amazon Connect Global Resiliency</a>. </p></li></ul></important>
 
 @param request A container for the necessary parameters to execute the DeleteUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteUserRequest
 */
- (AWSTask *)deleteUser:(AWSConnectDeleteUserRequest *)request;

/**
 <p>Deletes a user account from the specified Amazon Connect instance.</p><p>For information about what happens to a user's data when their account is deleted, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/delete-users.html">Delete Users from Your Amazon Connect Instance</a> in the <i>Amazon Connect Administrator Guide</i>.</p><important><p>After calling DeleteUser, call <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DeleteQuickConnect.html">DeleteQuickConnect</a> to delete any records related to the deleted users. This will help you:</p><ul><li><p>Avoid dangling resources that impact your service quotas.</p></li><li><p>Remove deleted users so they don't appear to agents as transfer options.</p></li><li><p>Avoid the disruption of other Amazon Connect processes, such as instance replication and syncing if you're using <a href="https://docs.aws.amazon.com/connect/latest/adminguide/setup-connect-global-resiliency.html">Amazon Connect Global Resiliency</a>. </p></li></ul></important>
 
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
 <p>Deletes the view entirely. It deletes the view and all associated qualifiers (versions and aliases).</p>
 
 @param request A container for the necessary parameters to execute the DeleteView service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDeleteViewResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorTooManyRequests`, `AWSConnectErrorResourceInUse`.
 
 @see AWSConnectDeleteViewRequest
 @see AWSConnectDeleteViewResponse
 */
- (AWSTask<AWSConnectDeleteViewResponse *> *)deleteView:(AWSConnectDeleteViewRequest *)request;

/**
 <p>Deletes the view entirely. It deletes the view and all associated qualifiers (versions and aliases).</p>
 
 @param request A container for the necessary parameters to execute the DeleteView service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorTooManyRequests`, `AWSConnectErrorResourceInUse`.
 
 @see AWSConnectDeleteViewRequest
 @see AWSConnectDeleteViewResponse
 */
- (void)deleteView:(AWSConnectDeleteViewRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDeleteViewResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the particular version specified in <code>ViewVersion</code> identifier.</p>
 
 @param request A container for the necessary parameters to execute the DeleteViewVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDeleteViewVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorTooManyRequests`, `AWSConnectErrorResourceInUse`.
 
 @see AWSConnectDeleteViewVersionRequest
 @see AWSConnectDeleteViewVersionResponse
 */
- (AWSTask<AWSConnectDeleteViewVersionResponse *> *)deleteViewVersion:(AWSConnectDeleteViewVersionRequest *)request;

/**
 <p>Deletes the particular version specified in <code>ViewVersion</code> identifier.</p>
 
 @param request A container for the necessary parameters to execute the DeleteViewVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorTooManyRequests`, `AWSConnectErrorResourceInUse`.
 
 @see AWSConnectDeleteViewVersionRequest
 @see AWSConnectDeleteViewVersionResponse
 */
- (void)deleteViewVersion:(AWSConnectDeleteViewVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDeleteViewVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Describes a contact evaluation in the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeContactEvaluation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeContactEvaluationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeContactEvaluationRequest
 @see AWSConnectDescribeContactEvaluationResponse
 */
- (AWSTask<AWSConnectDescribeContactEvaluationResponse *> *)describeContactEvaluation:(AWSConnectDescribeContactEvaluationRequest *)request;

/**
 <p>Describes a contact evaluation in the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeContactEvaluation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeContactEvaluationRequest
 @see AWSConnectDescribeContactEvaluationResponse
 */
- (void)describeContactEvaluation:(AWSConnectDescribeContactEvaluationRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeContactEvaluationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified flow.</p><p>You can also create and update flows using the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/flow-language.html">Amazon Connect Flow language</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeContactFlow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeContactFlowResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorContactFlowNotPublished`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeContactFlowRequest
 @see AWSConnectDescribeContactFlowResponse
 */
- (AWSTask<AWSConnectDescribeContactFlowResponse *> *)describeContactFlow:(AWSConnectDescribeContactFlowRequest *)request;

/**
 <p>Describes the specified flow.</p><p>You can also create and update flows using the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/flow-language.html">Amazon Connect Flow language</a>.</p>
 
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
 <p>Describes an evaluation form in the specified Amazon Connect instance. If the version property is not provided, the latest version of the evaluation form is described.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEvaluationForm service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeEvaluationFormResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeEvaluationFormRequest
 @see AWSConnectDescribeEvaluationFormResponse
 */
- (AWSTask<AWSConnectDescribeEvaluationFormResponse *> *)describeEvaluationForm:(AWSConnectDescribeEvaluationFormRequest *)request;

/**
 <p>Describes an evaluation form in the specified Amazon Connect instance. If the version property is not provided, the latest version of the evaluation form is described.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEvaluationForm service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeEvaluationFormRequest
 @see AWSConnectDescribeEvaluationFormResponse
 */
- (void)describeEvaluationForm:(AWSConnectDescribeEvaluationFormRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeEvaluationFormResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Describes a predefined attribute for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribePredefinedAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribePredefinedAttributeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribePredefinedAttributeRequest
 @see AWSConnectDescribePredefinedAttributeResponse
 */
- (AWSTask<AWSConnectDescribePredefinedAttributeResponse *> *)describePredefinedAttribute:(AWSConnectDescribePredefinedAttributeRequest *)request;

/**
 <p>Describes a predefined attribute for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribePredefinedAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribePredefinedAttributeRequest
 @see AWSConnectDescribePredefinedAttributeResponse
 */
- (void)describePredefinedAttribute:(AWSConnectDescribePredefinedAttributeRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribePredefinedAttributeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the prompt.</p>
 
 @param request A container for the necessary parameters to execute the DescribePrompt service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribePromptResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribePromptRequest
 @see AWSConnectDescribePromptResponse
 */
- (AWSTask<AWSConnectDescribePromptResponse *> *)describePrompt:(AWSConnectDescribePromptRequest *)request;

/**
 <p>Describes the prompt.</p>
 
 @param request A container for the necessary parameters to execute the DescribePrompt service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribePromptRequest
 @see AWSConnectDescribePromptResponse
 */
- (void)describePrompt:(AWSConnectDescribePromptRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribePromptResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Describes a rule for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectDescribeRuleRequest
 @see AWSConnectDescribeRuleResponse
 */
- (AWSTask<AWSConnectDescribeRuleResponse *> *)describeRule:(AWSConnectDescribeRuleRequest *)request;

/**
 <p>Describes a rule for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectDescribeRuleRequest
 @see AWSConnectDescribeRuleResponse
 */
- (void)describeRule:(AWSConnectDescribeRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets basic information about the security profle.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSecurityProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeSecurityProfileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeSecurityProfileRequest
 @see AWSConnectDescribeSecurityProfileResponse
 */
- (AWSTask<AWSConnectDescribeSecurityProfileResponse *> *)describeSecurityProfile:(AWSConnectDescribeSecurityProfileRequest *)request;

/**
 <p>Gets basic information about the security profle.</p>
 
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
 <p>Describes the specified user. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID in the Amazon Connect console</a> (it’s the final part of the ARN). The console does not display the user IDs. Instead, list the users and note the IDs provided in the output.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeUserRequest
 @see AWSConnectDescribeUserResponse
 */
- (AWSTask<AWSConnectDescribeUserResponse *> *)describeUser:(AWSConnectDescribeUserRequest *)request;

/**
 <p>Describes the specified user. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID in the Amazon Connect console</a> (it’s the final part of the ARN). The console does not display the user IDs. Instead, list the users and note the IDs provided in the output.</p>
 
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
 <p>Retrieves the view for the specified Amazon Connect instance and view identifier.</p><p>The view identifier can be supplied as a ViewId or ARN.</p><p><code>$SAVED</code> needs to be supplied if a view is unpublished.</p><p>The view identifier can contain an optional qualifier, for example, <code>&lt;view-id&gt;:$SAVED</code>, which is either an actual version number or an Amazon Connect managed qualifier <code>$SAVED | $LATEST</code>. If it is not supplied, then <code>$LATEST</code> is assumed for customer managed views and an error is returned if there is no published content available. Version 1 is assumed for Amazon Web Services managed views.</p>
 
 @param request A container for the necessary parameters to execute the DescribeView service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeViewResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorTooManyRequests`.
 
 @see AWSConnectDescribeViewRequest
 @see AWSConnectDescribeViewResponse
 */
- (AWSTask<AWSConnectDescribeViewResponse *> *)describeView:(AWSConnectDescribeViewRequest *)request;

/**
 <p>Retrieves the view for the specified Amazon Connect instance and view identifier.</p><p>The view identifier can be supplied as a ViewId or ARN.</p><p><code>$SAVED</code> needs to be supplied if a view is unpublished.</p><p>The view identifier can contain an optional qualifier, for example, <code>&lt;view-id&gt;:$SAVED</code>, which is either an actual version number or an Amazon Connect managed qualifier <code>$SAVED | $LATEST</code>. If it is not supplied, then <code>$LATEST</code> is assumed for customer managed views and an error is returned if there is no published content available. Version 1 is assumed for Amazon Web Services managed views.</p>
 
 @param request A container for the necessary parameters to execute the DescribeView service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorTooManyRequests`.
 
 @see AWSConnectDescribeViewRequest
 @see AWSConnectDescribeViewResponse
 */
- (void)describeView:(AWSConnectDescribeViewRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeViewResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Removes the dataset ID associated with a given Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateAnalyticsDataSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDisassociateAnalyticsDataSetRequest
 */
- (AWSTask *)disassociateAnalyticsDataSet:(AWSConnectDisassociateAnalyticsDataSetRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Removes the dataset ID associated with a given Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateAnalyticsDataSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDisassociateAnalyticsDataSetRequest
 */
- (void)disassociateAnalyticsDataSet:(AWSConnectDisassociateAnalyticsDataSetRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

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
 <p>Disassociates a connect resource from a flow.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateFlow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDisassociateFlowResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDisassociateFlowRequest
 @see AWSConnectDisassociateFlowResponse
 */
- (AWSTask<AWSConnectDisassociateFlowResponse *> *)disassociateFlow:(AWSConnectDisassociateFlowRequest *)request;

/**
 <p>Disassociates a connect resource from a flow.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateFlow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectDisassociateFlowRequest
 @see AWSConnectDisassociateFlowResponse
 */
- (void)disassociateFlow:(AWSConnectDisassociateFlowRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDisassociateFlowResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Disassociates an agent from a traffic distribution group.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateTrafficDistributionGroupUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDisassociateTrafficDistributionGroupUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDisassociateTrafficDistributionGroupUserRequest
 @see AWSConnectDisassociateTrafficDistributionGroupUserResponse
 */
- (AWSTask<AWSConnectDisassociateTrafficDistributionGroupUserResponse *> *)disassociateTrafficDistributionGroupUser:(AWSConnectDisassociateTrafficDistributionGroupUserRequest *)request;

/**
 <p>Disassociates an agent from a traffic distribution group.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateTrafficDistributionGroupUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDisassociateTrafficDistributionGroupUserRequest
 @see AWSConnectDisassociateTrafficDistributionGroupUserResponse
 */
- (void)disassociateTrafficDistributionGroupUser:(AWSConnectDisassociateTrafficDistributionGroupUserRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDisassociateTrafficDistributionGroupUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a set of proficiencies from a user.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateUserProficiencies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDisassociateUserProficienciesRequest
 */
- (AWSTask *)disassociateUserProficiencies:(AWSConnectDisassociateUserProficienciesRequest *)request;

/**
 <p>Disassociates a set of proficiencies from a user.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateUserProficiencies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDisassociateUserProficienciesRequest
 */
- (void)disassociateUserProficiencies:(AWSConnectDisassociateUserProficienciesRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

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
 <p>Supports SAML sign-in for Amazon Connect. Retrieves a token for federation. The token is for the Amazon Connect user which corresponds to the IAM credentials that were used to invoke this action. </p><p>For more information about how SAML sign-in works in Amazon Connect, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/configure-saml.html ">Configure SAML with IAM for Amazon Connect in the <i>Amazon Connect Administrator Guide</i>.</a></p><note><p>This API doesn't support root users. If you try to invoke GetFederationToken with root credentials, an error message similar to the following one appears: </p><p><code>Provided identity: Principal: .... User: .... cannot be used for federation with Amazon Connect</code></p></note>
 
 @param request A container for the necessary parameters to execute the GetFederationToken service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectGetFederationTokenResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorUserNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorDuplicateResource`.
 
 @see AWSConnectGetFederationTokenRequest
 @see AWSConnectGetFederationTokenResponse
 */
- (AWSTask<AWSConnectGetFederationTokenResponse *> *)getFederationToken:(AWSConnectGetFederationTokenRequest *)request;

/**
 <p>Supports SAML sign-in for Amazon Connect. Retrieves a token for federation. The token is for the Amazon Connect user which corresponds to the IAM credentials that were used to invoke this action. </p><p>For more information about how SAML sign-in works in Amazon Connect, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/configure-saml.html ">Configure SAML with IAM for Amazon Connect in the <i>Amazon Connect Administrator Guide</i>.</a></p><note><p>This API doesn't support root users. If you try to invoke GetFederationToken with root credentials, an error message similar to the following one appears: </p><p><code>Provided identity: Principal: .... User: .... cannot be used for federation with Amazon Connect</code></p></note>
 
 @param request A container for the necessary parameters to execute the GetFederationToken service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorUserNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorDuplicateResource`.
 
 @see AWSConnectGetFederationTokenRequest
 @see AWSConnectGetFederationTokenResponse
 */
- (void)getFederationToken:(AWSConnectGetFederationTokenRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectGetFederationTokenResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the flow associated for a given resource.</p>
 
 @param request A container for the necessary parameters to execute the GetFlowAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectGetFlowAssociationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectGetFlowAssociationRequest
 @see AWSConnectGetFlowAssociationResponse
 */
- (AWSTask<AWSConnectGetFlowAssociationResponse *> *)getFlowAssociation:(AWSConnectGetFlowAssociationRequest *)request;

/**
 <p>Retrieves the flow associated for a given resource.</p>
 
 @param request A container for the necessary parameters to execute the GetFlowAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectGetFlowAssociationRequest
 @see AWSConnectGetFlowAssociationResponse
 */
- (void)getFlowAssociation:(AWSConnectGetFlowAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectGetFlowAssociationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets historical metric data from the specified Amazon Connect instance.</p><p>For a description of each historical metric, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics-definitions.html">Historical Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.</p><note><p>We recommend using the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_GetMetricDataV2.html">GetMetricDataV2</a> API. It provides more flexibility, features, and the ability to query longer time ranges than <code>GetMetricData</code>. Use it to retrieve historical agent and contact metrics for the last 3 months, at varying intervals. You can also use it to build custom dashboards to measure historical queue and agent performance. For example, you can track the number of incoming contacts for the last 7 days, with data split by day, to see how contact volume changed per day of the week.</p></note>
 
 @param request A container for the necessary parameters to execute the GetMetricData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectGetMetricDataResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`.
 
 @see AWSConnectGetMetricDataRequest
 @see AWSConnectGetMetricDataResponse
 */
- (AWSTask<AWSConnectGetMetricDataResponse *> *)getMetricData:(AWSConnectGetMetricDataRequest *)request;

/**
 <p>Gets historical metric data from the specified Amazon Connect instance.</p><p>For a description of each historical metric, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics-definitions.html">Historical Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.</p><note><p>We recommend using the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_GetMetricDataV2.html">GetMetricDataV2</a> API. It provides more flexibility, features, and the ability to query longer time ranges than <code>GetMetricData</code>. Use it to retrieve historical agent and contact metrics for the last 3 months, at varying intervals. You can also use it to build custom dashboards to measure historical queue and agent performance. For example, you can track the number of incoming contacts for the last 7 days, with data split by day, to see how contact volume changed per day of the week.</p></note>
 
 @param request A container for the necessary parameters to execute the GetMetricData service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`.
 
 @see AWSConnectGetMetricDataRequest
 @see AWSConnectGetMetricDataResponse
 */
- (void)getMetricData:(AWSConnectGetMetricDataRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectGetMetricDataResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets metric data from the specified Amazon Connect instance. </p><p><code>GetMetricDataV2</code> offers more features than <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_GetMetricData.html">GetMetricData</a>, the previous version of this API. It has new metrics, offers filtering at a metric level, and offers the ability to filter and group data by channels, queues, routing profiles, agents, and agent hierarchy levels. It can retrieve historical data for the last 3 months, at varying intervals. </p><p>For a description of the historical metrics that are supported by <code>GetMetricDataV2</code> and <code>GetMetricData</code>, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics-definitions.html">Historical metrics definitions</a> in the <i>Amazon Connect Administrator's Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetMetricDataV2 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectGetMetricDataV2Response`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`.
 
 @see AWSConnectGetMetricDataV2Request
 @see AWSConnectGetMetricDataV2Response
 */
- (AWSTask<AWSConnectGetMetricDataV2Response *> *)getMetricDataV2:(AWSConnectGetMetricDataV2Request *)request;

/**
 <p>Gets metric data from the specified Amazon Connect instance. </p><p><code>GetMetricDataV2</code> offers more features than <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_GetMetricData.html">GetMetricData</a>, the previous version of this API. It has new metrics, offers filtering at a metric level, and offers the ability to filter and group data by channels, queues, routing profiles, agents, and agent hierarchy levels. It can retrieve historical data for the last 3 months, at varying intervals. </p><p>For a description of the historical metrics that are supported by <code>GetMetricDataV2</code> and <code>GetMetricData</code>, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics-definitions.html">Historical metrics definitions</a> in the <i>Amazon Connect Administrator's Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetMetricDataV2 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`.
 
 @see AWSConnectGetMetricDataV2Request
 @see AWSConnectGetMetricDataV2Response
 */
- (void)getMetricDataV2:(AWSConnectGetMetricDataV2Request *)request completionHandler:(void (^ _Nullable)(AWSConnectGetMetricDataV2Response * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the prompt file.</p>
 
 @param request A container for the necessary parameters to execute the GetPromptFile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectGetPromptFileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectGetPromptFileRequest
 @see AWSConnectGetPromptFileResponse
 */
- (AWSTask<AWSConnectGetPromptFileResponse *> *)getPromptFile:(AWSConnectGetPromptFileRequest *)request;

/**
 <p>Gets the prompt file.</p>
 
 @param request A container for the necessary parameters to execute the GetPromptFile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectGetPromptFileRequest
 @see AWSConnectGetPromptFileResponse
 */
- (void)getPromptFile:(AWSConnectGetPromptFileRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectGetPromptFileResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Imports a claimed phone number from an external service, such as Amazon Pinpoint, into an Amazon Connect instance. You can call this API only in the same Amazon Web Services Region where the Amazon Connect instance was created.</p>
 
 @param request A container for the necessary parameters to execute the ImportPhoneNumber service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectImportPhoneNumberResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorIdempotency`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectImportPhoneNumberRequest
 @see AWSConnectImportPhoneNumberResponse
 */
- (AWSTask<AWSConnectImportPhoneNumberResponse *> *)importPhoneNumber:(AWSConnectImportPhoneNumberRequest *)request;

/**
 <p>Imports a claimed phone number from an external service, such as Amazon Pinpoint, into an Amazon Connect instance. You can call this API only in the same Amazon Web Services Region where the Amazon Connect instance was created.</p>
 
 @param request A container for the necessary parameters to execute the ImportPhoneNumber service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorIdempotency`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectImportPhoneNumberRequest
 @see AWSConnectImportPhoneNumberResponse
 */
- (void)importPhoneNumber:(AWSConnectImportPhoneNumberRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectImportPhoneNumberResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Lists the association status of requested dataset ID for a given Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListAnalyticsDataAssociations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListAnalyticsDataAssociationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListAnalyticsDataAssociationsRequest
 @see AWSConnectListAnalyticsDataAssociationsResponse
 */
- (AWSTask<AWSConnectListAnalyticsDataAssociationsResponse *> *)listAnalyticsDataAssociations:(AWSConnectListAnalyticsDataAssociationsRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Lists the association status of requested dataset ID for a given Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListAnalyticsDataAssociations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListAnalyticsDataAssociationsRequest
 @see AWSConnectListAnalyticsDataAssociationsResponse
 */
- (void)listAnalyticsDataAssociations:(AWSConnectListAnalyticsDataAssociationsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListAnalyticsDataAssociationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Lists contact evaluations in the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListContactEvaluations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListContactEvaluationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListContactEvaluationsRequest
 @see AWSConnectListContactEvaluationsResponse
 */
- (AWSTask<AWSConnectListContactEvaluationsResponse *> *)listContactEvaluations:(AWSConnectListContactEvaluationsRequest *)request;

/**
 <p>Lists contact evaluations in the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListContactEvaluations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListContactEvaluationsRequest
 @see AWSConnectListContactEvaluationsResponse
 */
- (void)listContactEvaluations:(AWSConnectListContactEvaluationsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListContactEvaluationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Provides information about the flows for the specified Amazon Connect instance.</p><p>You can also create and update flows using the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/flow-language.html">Amazon Connect Flow language</a>.</p><p>For more information about flows, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-contact-flows.html">Flows</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListContactFlows service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListContactFlowsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListContactFlowsRequest
 @see AWSConnectListContactFlowsResponse
 */
- (AWSTask<AWSConnectListContactFlowsResponse *> *)listContactFlows:(AWSConnectListContactFlowsRequest *)request;

/**
 <p>Provides information about the flows for the specified Amazon Connect instance.</p><p>You can also create and update flows using the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/flow-language.html">Amazon Connect Flow language</a>.</p><p>For more information about flows, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-contact-flows.html">Flows</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListContactFlows service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListContactFlowsRequest
 @see AWSConnectListContactFlowsResponse
 */
- (void)listContactFlows:(AWSConnectListContactFlowsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListContactFlowsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>For the specified <code>referenceTypes</code>, returns a list of references associated with the contact. <i>References</i> are links to documents that are related to a contact, such as emails, attachments, or URLs.</p>
 
 @param request A container for the necessary parameters to execute the ListContactReferences service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListContactReferencesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListContactReferencesRequest
 @see AWSConnectListContactReferencesResponse
 */
- (AWSTask<AWSConnectListContactReferencesResponse *> *)listContactReferences:(AWSConnectListContactReferencesRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>For the specified <code>referenceTypes</code>, returns a list of references associated with the contact. <i>References</i> are links to documents that are related to a contact, such as emails, attachments, or URLs.</p>
 
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
 <p>Lists versions of an evaluation form in the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListEvaluationFormVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListEvaluationFormVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListEvaluationFormVersionsRequest
 @see AWSConnectListEvaluationFormVersionsResponse
 */
- (AWSTask<AWSConnectListEvaluationFormVersionsResponse *> *)listEvaluationFormVersions:(AWSConnectListEvaluationFormVersionsRequest *)request;

/**
 <p>Lists versions of an evaluation form in the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListEvaluationFormVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListEvaluationFormVersionsRequest
 @see AWSConnectListEvaluationFormVersionsResponse
 */
- (void)listEvaluationFormVersions:(AWSConnectListEvaluationFormVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListEvaluationFormVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists evaluation forms in the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListEvaluationForms service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListEvaluationFormsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListEvaluationFormsRequest
 @see AWSConnectListEvaluationFormsResponse
 */
- (AWSTask<AWSConnectListEvaluationFormsResponse *> *)listEvaluationForms:(AWSConnectListEvaluationFormsRequest *)request;

/**
 <p>Lists evaluation forms in the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListEvaluationForms service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListEvaluationFormsRequest
 @see AWSConnectListEvaluationFormsResponse
 */
- (void)listEvaluationForms:(AWSConnectListEvaluationFormsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListEvaluationFormsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List the flow association based on the filters.</p>
 
 @param request A container for the necessary parameters to execute the ListFlowAssociations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListFlowAssociationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListFlowAssociationsRequest
 @see AWSConnectListFlowAssociationsResponse
 */
- (AWSTask<AWSConnectListFlowAssociationsResponse *> *)listFlowAssociations:(AWSConnectListFlowAssociationsRequest *)request;

/**
 <p>List the flow association based on the filters.</p>
 
 @param request A container for the necessary parameters to execute the ListFlowAssociations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListFlowAssociationsRequest
 @see AWSConnectListFlowAssociationsResponse
 */
- (void)listFlowAssociations:(AWSConnectListFlowAssociationsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListFlowAssociationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Provides information about the phone numbers for the specified Amazon Connect instance. </p><p>For more information about phone numbers, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/contact-center-phone-number.html">Set Up Phone Numbers for Your Contact Center</a> in the <i>Amazon Connect Administrator Guide</i>.</p><important><ul><li><p>We recommend using <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ListPhoneNumbersV2.html">ListPhoneNumbersV2</a> to return phone number types. ListPhoneNumbers doesn't support number types <code>UIFN</code>, <code>SHARED</code>, <code>THIRD_PARTY_TF</code>, and <code>THIRD_PARTY_DID</code>. While it returns numbers of those types, it incorrectly lists them as <code>TOLL_FREE</code> or <code>DID</code>. </p></li><li><p>The phone number <code>Arn</code> value that is returned from each of the items in the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ListPhoneNumbers.html#connect-ListPhoneNumbers-response-PhoneNumberSummaryList">PhoneNumberSummaryList</a> cannot be used to tag phone number resources. It will fail with a <code>ResourceNotFoundException</code>. Instead, use the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ListPhoneNumbersV2.html">ListPhoneNumbersV2</a> API. It returns the new phone number ARN that can be used to tag phone number resources.</p></li></ul></important>
 
 @param request A container for the necessary parameters to execute the ListPhoneNumbers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListPhoneNumbersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListPhoneNumbersRequest
 @see AWSConnectListPhoneNumbersResponse
 */
- (AWSTask<AWSConnectListPhoneNumbersResponse *> *)listPhoneNumbers:(AWSConnectListPhoneNumbersRequest *)request;

/**
 <p>Provides information about the phone numbers for the specified Amazon Connect instance. </p><p>For more information about phone numbers, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/contact-center-phone-number.html">Set Up Phone Numbers for Your Contact Center</a> in the <i>Amazon Connect Administrator Guide</i>.</p><important><ul><li><p>We recommend using <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ListPhoneNumbersV2.html">ListPhoneNumbersV2</a> to return phone number types. ListPhoneNumbers doesn't support number types <code>UIFN</code>, <code>SHARED</code>, <code>THIRD_PARTY_TF</code>, and <code>THIRD_PARTY_DID</code>. While it returns numbers of those types, it incorrectly lists them as <code>TOLL_FREE</code> or <code>DID</code>. </p></li><li><p>The phone number <code>Arn</code> value that is returned from each of the items in the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ListPhoneNumbers.html#connect-ListPhoneNumbers-response-PhoneNumberSummaryList">PhoneNumberSummaryList</a> cannot be used to tag phone number resources. It will fail with a <code>ResourceNotFoundException</code>. Instead, use the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ListPhoneNumbersV2.html">ListPhoneNumbersV2</a> API. It returns the new phone number ARN that can be used to tag phone number resources.</p></li></ul></important>
 
 @param request A container for the necessary parameters to execute the ListPhoneNumbers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListPhoneNumbersRequest
 @see AWSConnectListPhoneNumbersResponse
 */
- (void)listPhoneNumbers:(AWSConnectListPhoneNumbersRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListPhoneNumbersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists phone numbers claimed to your Amazon Connect instance or traffic distribution group. If the provided <code>TargetArn</code> is a traffic distribution group, you can call this API in both Amazon Web Services Regions associated with traffic distribution group.</p><p>For more information about phone numbers, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/contact-center-phone-number.html">Set Up Phone Numbers for Your Contact Center</a> in the <i>Amazon Connect Administrator Guide</i>.</p><note><ul><li><p>When given an instance ARN, <code>ListPhoneNumbersV2</code> returns only the phone numbers claimed to the instance.</p></li><li><p>When given a traffic distribution group ARN <code>ListPhoneNumbersV2</code> returns only the phone numbers claimed to the traffic distribution group.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the ListPhoneNumbersV2 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListPhoneNumbersV2Response`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectListPhoneNumbersV2Request
 @see AWSConnectListPhoneNumbersV2Response
 */
- (AWSTask<AWSConnectListPhoneNumbersV2Response *> *)listPhoneNumbersV2:(AWSConnectListPhoneNumbersV2Request *)request;

/**
 <p>Lists phone numbers claimed to your Amazon Connect instance or traffic distribution group. If the provided <code>TargetArn</code> is a traffic distribution group, you can call this API in both Amazon Web Services Regions associated with traffic distribution group.</p><p>For more information about phone numbers, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/contact-center-phone-number.html">Set Up Phone Numbers for Your Contact Center</a> in the <i>Amazon Connect Administrator Guide</i>.</p><note><ul><li><p>When given an instance ARN, <code>ListPhoneNumbersV2</code> returns only the phone numbers claimed to the instance.</p></li><li><p>When given a traffic distribution group ARN <code>ListPhoneNumbersV2</code> returns only the phone numbers claimed to the traffic distribution group.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the ListPhoneNumbersV2 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectListPhoneNumbersV2Request
 @see AWSConnectListPhoneNumbersV2Response
 */
- (void)listPhoneNumbersV2:(AWSConnectListPhoneNumbersV2Request *)request completionHandler:(void (^ _Nullable)(AWSConnectListPhoneNumbersV2Response * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists predefined attributes for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListPredefinedAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListPredefinedAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListPredefinedAttributesRequest
 @see AWSConnectListPredefinedAttributesResponse
 */
- (AWSTask<AWSConnectListPredefinedAttributesResponse *> *)listPredefinedAttributes:(AWSConnectListPredefinedAttributesRequest *)request;

/**
 <p>Lists predefined attributes for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListPredefinedAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListPredefinedAttributesRequest
 @see AWSConnectListPredefinedAttributesResponse
 */
- (void)listPredefinedAttributes:(AWSConnectListPredefinedAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListPredefinedAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Provides a list of analysis segments for a real-time analysis session. </p>
 
 @param request A container for the necessary parameters to execute the ListRealtimeContactAnalysisSegmentsV2 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListRealtimeContactAnalysisSegmentsV2Response`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorOutputTypeNotFound`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListRealtimeContactAnalysisSegmentsV2Request
 @see AWSConnectListRealtimeContactAnalysisSegmentsV2Response
 */
- (AWSTask<AWSConnectListRealtimeContactAnalysisSegmentsV2Response *> *)listRealtimeContactAnalysisSegmentsV2:(AWSConnectListRealtimeContactAnalysisSegmentsV2Request *)request;

/**
 <p>Provides a list of analysis segments for a real-time analysis session. </p>
 
 @param request A container for the necessary parameters to execute the ListRealtimeContactAnalysisSegmentsV2 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorOutputTypeNotFound`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListRealtimeContactAnalysisSegmentsV2Request
 @see AWSConnectListRealtimeContactAnalysisSegmentsV2Response
 */
- (void)listRealtimeContactAnalysisSegmentsV2:(AWSConnectListRealtimeContactAnalysisSegmentsV2Request *)request completionHandler:(void (^ _Nullable)(AWSConnectListRealtimeContactAnalysisSegmentsV2Response * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>List all rules for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListRules service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListRulesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`.
 
 @see AWSConnectListRulesRequest
 @see AWSConnectListRulesResponse
 */
- (AWSTask<AWSConnectListRulesResponse *> *)listRules:(AWSConnectListRulesRequest *)request;

/**
 <p>List all rules for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListRules service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`.
 
 @see AWSConnectListRulesRequest
 @see AWSConnectListRulesResponse
 */
- (void)listRules:(AWSConnectListRulesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListRulesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Returns a list of third-party applications in a specific security profile.</p>
 
 @param request A container for the necessary parameters to execute the ListSecurityProfileApplications service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListSecurityProfileApplicationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListSecurityProfileApplicationsRequest
 @see AWSConnectListSecurityProfileApplicationsResponse
 */
- (AWSTask<AWSConnectListSecurityProfileApplicationsResponse *> *)listSecurityProfileApplications:(AWSConnectListSecurityProfileApplicationsRequest *)request;

/**
 <p>Returns a list of third-party applications in a specific security profile.</p>
 
 @param request A container for the necessary parameters to execute the ListSecurityProfileApplications service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListSecurityProfileApplicationsRequest
 @see AWSConnectListSecurityProfileApplicationsResponse
 */
- (void)listSecurityProfileApplications:(AWSConnectListSecurityProfileApplicationsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListSecurityProfileApplicationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the permissions granted to a security profile.</p>
 
 @param request A container for the necessary parameters to execute the ListSecurityProfilePermissions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListSecurityProfilePermissionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListSecurityProfilePermissionsRequest
 @see AWSConnectListSecurityProfilePermissionsResponse
 */
- (AWSTask<AWSConnectListSecurityProfilePermissionsResponse *> *)listSecurityProfilePermissions:(AWSConnectListSecurityProfilePermissionsRequest *)request;

/**
 <p>Lists the permissions granted to a security profile.</p>
 
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
 <p>Lists traffic distribution group users.</p>
 
 @param request A container for the necessary parameters to execute the ListTrafficDistributionGroupUsers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListTrafficDistributionGroupUsersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListTrafficDistributionGroupUsersRequest
 @see AWSConnectListTrafficDistributionGroupUsersResponse
 */
- (AWSTask<AWSConnectListTrafficDistributionGroupUsersResponse *> *)listTrafficDistributionGroupUsers:(AWSConnectListTrafficDistributionGroupUsersRequest *)request;

/**
 <p>Lists traffic distribution group users.</p>
 
 @param request A container for the necessary parameters to execute the ListTrafficDistributionGroupUsers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListTrafficDistributionGroupUsersRequest
 @see AWSConnectListTrafficDistributionGroupUsersResponse
 */
- (void)listTrafficDistributionGroupUsers:(AWSConnectListTrafficDistributionGroupUsersRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListTrafficDistributionGroupUsersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Lists proficiencies associated with a user.</p>
 
 @param request A container for the necessary parameters to execute the ListUserProficiencies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListUserProficienciesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListUserProficienciesRequest
 @see AWSConnectListUserProficienciesResponse
 */
- (AWSTask<AWSConnectListUserProficienciesResponse *> *)listUserProficiencies:(AWSConnectListUserProficienciesRequest *)request;

/**
 <p>Lists proficiencies associated with a user.</p>
 
 @param request A container for the necessary parameters to execute the ListUserProficiencies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListUserProficienciesRequest
 @see AWSConnectListUserProficienciesResponse
 */
- (void)listUserProficiencies:(AWSConnectListUserProficienciesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListUserProficienciesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Returns all the available versions for the specified Amazon Connect instance and view identifier.</p><p>Results will be sorted from highest to lowest.</p>
 
 @param request A container for the necessary parameters to execute the ListViewVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListViewVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorTooManyRequests`.
 
 @see AWSConnectListViewVersionsRequest
 @see AWSConnectListViewVersionsResponse
 */
- (AWSTask<AWSConnectListViewVersionsResponse *> *)listViewVersions:(AWSConnectListViewVersionsRequest *)request;

/**
 <p>Returns all the available versions for the specified Amazon Connect instance and view identifier.</p><p>Results will be sorted from highest to lowest.</p>
 
 @param request A container for the necessary parameters to execute the ListViewVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorTooManyRequests`.
 
 @see AWSConnectListViewVersionsRequest
 @see AWSConnectListViewVersionsResponse
 */
- (void)listViewVersions:(AWSConnectListViewVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListViewVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns views in the given instance.</p><p>Results are sorted primarily by type, and secondarily by name.</p>
 
 @param request A container for the necessary parameters to execute the ListViews service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListViewsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorTooManyRequests`.
 
 @see AWSConnectListViewsRequest
 @see AWSConnectListViewsResponse
 */
- (AWSTask<AWSConnectListViewsResponse *> *)listViews:(AWSConnectListViewsRequest *)request;

/**
 <p>Returns views in the given instance.</p><p>Results are sorted primarily by type, and secondarily by name.</p>
 
 @param request A container for the necessary parameters to execute the ListViews service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorTooManyRequests`.
 
 @see AWSConnectListViewsRequest
 @see AWSConnectListViewsResponse
 */
- (void)listViews:(AWSConnectListViewsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListViewsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates silent monitoring of a contact. The Contact Control Panel (CCP) of the user specified by <i>userId</i> will be set to silent monitoring mode on the contact.</p>
 
 @param request A container for the necessary parameters to execute the MonitorContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectMonitorContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorIdempotency`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectMonitorContactRequest
 @see AWSConnectMonitorContactResponse
 */
- (AWSTask<AWSConnectMonitorContactResponse *> *)monitorContact:(AWSConnectMonitorContactRequest *)request;

/**
 <p>Initiates silent monitoring of a contact. The Contact Control Panel (CCP) of the user specified by <i>userId</i> will be set to silent monitoring mode on the contact.</p>
 
 @param request A container for the necessary parameters to execute the MonitorContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorIdempotency`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectMonitorContactRequest
 @see AWSConnectMonitorContactResponse
 */
- (void)monitorContact:(AWSConnectMonitorContactRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectMonitorContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allows pausing an ongoing task contact.</p>
 
 @param request A container for the necessary parameters to execute the PauseContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectPauseContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorConflict`.
 
 @see AWSConnectPauseContactRequest
 @see AWSConnectPauseContactResponse
 */
- (AWSTask<AWSConnectPauseContactResponse *> *)pauseContact:(AWSConnectPauseContactRequest *)request;

/**
 <p>Allows pausing an ongoing task contact.</p>
 
 @param request A container for the necessary parameters to execute the PauseContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorConflict`.
 
 @see AWSConnectPauseContactRequest
 @see AWSConnectPauseContactResponse
 */
- (void)pauseContact:(AWSConnectPauseContactRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectPauseContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Releases a phone number previously claimed to an Amazon Connect instance or traffic distribution group. You can call this API only in the Amazon Web Services Region where the number was claimed.</p><important><p>To release phone numbers from a traffic distribution group, use the <code>ReleasePhoneNumber</code> API, not the Amazon Connect admin website.</p><p>After releasing a phone number, the phone number enters into a cooldown period of 30 days. It cannot be searched for or claimed again until the period has ended. If you accidentally release a phone number, contact Amazon Web Services Support.</p></important><p>If you plan to claim and release numbers frequently during a 30 day period, contact us for a service quota exception. Otherwise, it is possible you will be blocked from claiming and releasing any more numbers until 30 days past the oldest number released has expired.</p><p>By default you can claim and release up to 200% of your maximum number of active phone numbers during any 30 day period. If you claim and release phone numbers using the UI or API during a rolling 30 day cycle that exceeds 200% of your phone number service level quota, you will be blocked from claiming any more numbers until 30 days past the oldest number released has expired. </p><p>For example, if you already have 99 claimed numbers and a service level quota of 99 phone numbers, and in any 30 day period you release 99, claim 99, and then release 99, you will have exceeded the 200% limit. At that point you are blocked from claiming any more numbers until you open an Amazon Web Services support ticket.</p>
 
 @param request A container for the necessary parameters to execute the ReleasePhoneNumber service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceInUse`, `AWSConnectErrorIdempotency`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectReleasePhoneNumberRequest
 */
- (AWSTask *)releasePhoneNumber:(AWSConnectReleasePhoneNumberRequest *)request;

/**
 <p>Releases a phone number previously claimed to an Amazon Connect instance or traffic distribution group. You can call this API only in the Amazon Web Services Region where the number was claimed.</p><important><p>To release phone numbers from a traffic distribution group, use the <code>ReleasePhoneNumber</code> API, not the Amazon Connect admin website.</p><p>After releasing a phone number, the phone number enters into a cooldown period of 30 days. It cannot be searched for or claimed again until the period has ended. If you accidentally release a phone number, contact Amazon Web Services Support.</p></important><p>If you plan to claim and release numbers frequently during a 30 day period, contact us for a service quota exception. Otherwise, it is possible you will be blocked from claiming and releasing any more numbers until 30 days past the oldest number released has expired.</p><p>By default you can claim and release up to 200% of your maximum number of active phone numbers during any 30 day period. If you claim and release phone numbers using the UI or API during a rolling 30 day cycle that exceeds 200% of your phone number service level quota, you will be blocked from claiming any more numbers until 30 days past the oldest number released has expired. </p><p>For example, if you already have 99 claimed numbers and a service level quota of 99 phone numbers, and in any 30 day period you release 99, claim 99, and then release 99, you will have exceeded the 200% limit. At that point you are blocked from claiming any more numbers until you open an Amazon Web Services support ticket.</p>
 
 @param request A container for the necessary parameters to execute the ReleasePhoneNumber service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceInUse`, `AWSConnectErrorIdempotency`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectReleasePhoneNumberRequest
 */
- (void)releasePhoneNumber:(AWSConnectReleasePhoneNumberRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Replicates an Amazon Connect instance in the specified Amazon Web Services Region and copies configuration information for Amazon Connect resources across Amazon Web Services Regions. </p><p>For more information about replicating an Amazon Connect instance, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/create-replica-connect-instance.html">Create a replica of your existing Amazon Connect instance</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ReplicateInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectReplicateInstanceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceNotReady`, `AWSConnectErrorResourceConflict`.
 
 @see AWSConnectReplicateInstanceRequest
 @see AWSConnectReplicateInstanceResponse
 */
- (AWSTask<AWSConnectReplicateInstanceResponse *> *)replicateInstance:(AWSConnectReplicateInstanceRequest *)request;

/**
 <p>Replicates an Amazon Connect instance in the specified Amazon Web Services Region and copies configuration information for Amazon Connect resources across Amazon Web Services Regions. </p><p>For more information about replicating an Amazon Connect instance, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/create-replica-connect-instance.html">Create a replica of your existing Amazon Connect instance</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ReplicateInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceNotReady`, `AWSConnectErrorResourceConflict`.
 
 @see AWSConnectReplicateInstanceRequest
 @see AWSConnectReplicateInstanceResponse
 */
- (void)replicateInstance:(AWSConnectReplicateInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectReplicateInstanceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allows resuming a task contact in a paused state.</p>
 
 @param request A container for the necessary parameters to execute the ResumeContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectResumeContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorConflict`.
 
 @see AWSConnectResumeContactRequest
 @see AWSConnectResumeContactResponse
 */
- (AWSTask<AWSConnectResumeContactResponse *> *)resumeContact:(AWSConnectResumeContactRequest *)request;

/**
 <p>Allows resuming a task contact in a paused state.</p>
 
 @param request A container for the necessary parameters to execute the ResumeContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorConflict`.
 
 @see AWSConnectResumeContactRequest
 @see AWSConnectResumeContactResponse
 */
- (void)resumeContact:(AWSConnectResumeContactRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectResumeContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>When a contact is being recorded, and the recording has been suspended using SuspendContactRecording, this API resumes recording whatever recording is selected in the flow configuration: call, screen, or both. If only call recording or only screen recording is enabled, then it would resume.</p><p>Voice and screen recordings are supported.</p>
 
 @param request A container for the necessary parameters to execute the ResumeContactRecording service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectResumeContactRecordingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectResumeContactRecordingRequest
 @see AWSConnectResumeContactRecordingResponse
 */
- (AWSTask<AWSConnectResumeContactRecordingResponse *> *)resumeContactRecording:(AWSConnectResumeContactRecordingRequest *)request;

/**
 <p>When a contact is being recorded, and the recording has been suspended using SuspendContactRecording, this API resumes recording whatever recording is selected in the flow configuration: call, screen, or both. If only call recording or only screen recording is enabled, then it would resume.</p><p>Voice and screen recordings are supported.</p>
 
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
 <p>Searches contacts in an Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the SearchContacts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectSearchContactsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectSearchContactsRequest
 @see AWSConnectSearchContactsResponse
 */
- (AWSTask<AWSConnectSearchContactsResponse *> *)searchContacts:(AWSConnectSearchContactsRequest *)request;

/**
 <p>Searches contacts in an Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the SearchContacts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectSearchContactsRequest
 @see AWSConnectSearchContactsResponse
 */
- (void)searchContacts:(AWSConnectSearchContactsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectSearchContactsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches the hours of operation in an Amazon Connect instance, with optional filtering.</p>
 
 @param request A container for the necessary parameters to execute the SearchHoursOfOperations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectSearchHoursOfOperationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSearchHoursOfOperationsRequest
 @see AWSConnectSearchHoursOfOperationsResponse
 */
- (AWSTask<AWSConnectSearchHoursOfOperationsResponse *> *)searchHoursOfOperations:(AWSConnectSearchHoursOfOperationsRequest *)request;

/**
 <p>Searches the hours of operation in an Amazon Connect instance, with optional filtering.</p>
 
 @param request A container for the necessary parameters to execute the SearchHoursOfOperations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSearchHoursOfOperationsRequest
 @see AWSConnectSearchHoursOfOperationsResponse
 */
- (void)searchHoursOfOperations:(AWSConnectSearchHoursOfOperationsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectSearchHoursOfOperationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Predefined attributes that meet certain criteria.</p>
 
 @param request A container for the necessary parameters to execute the SearchPredefinedAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectSearchPredefinedAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSearchPredefinedAttributesRequest
 @see AWSConnectSearchPredefinedAttributesResponse
 */
- (AWSTask<AWSConnectSearchPredefinedAttributesResponse *> *)searchPredefinedAttributes:(AWSConnectSearchPredefinedAttributesRequest *)request;

/**
 <p>Predefined attributes that meet certain criteria.</p>
 
 @param request A container for the necessary parameters to execute the SearchPredefinedAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSearchPredefinedAttributesRequest
 @see AWSConnectSearchPredefinedAttributesResponse
 */
- (void)searchPredefinedAttributes:(AWSConnectSearchPredefinedAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectSearchPredefinedAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches prompts in an Amazon Connect instance, with optional filtering.</p>
 
 @param request A container for the necessary parameters to execute the SearchPrompts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectSearchPromptsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSearchPromptsRequest
 @see AWSConnectSearchPromptsResponse
 */
- (AWSTask<AWSConnectSearchPromptsResponse *> *)searchPrompts:(AWSConnectSearchPromptsRequest *)request;

/**
 <p>Searches prompts in an Amazon Connect instance, with optional filtering.</p>
 
 @param request A container for the necessary parameters to execute the SearchPrompts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSearchPromptsRequest
 @see AWSConnectSearchPromptsResponse
 */
- (void)searchPrompts:(AWSConnectSearchPromptsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectSearchPromptsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches queues in an Amazon Connect instance, with optional filtering.</p>
 
 @param request A container for the necessary parameters to execute the SearchQueues service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectSearchQueuesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSearchQueuesRequest
 @see AWSConnectSearchQueuesResponse
 */
- (AWSTask<AWSConnectSearchQueuesResponse *> *)searchQueues:(AWSConnectSearchQueuesRequest *)request;

/**
 <p>Searches queues in an Amazon Connect instance, with optional filtering.</p>
 
 @param request A container for the necessary parameters to execute the SearchQueues service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSearchQueuesRequest
 @see AWSConnectSearchQueuesResponse
 */
- (void)searchQueues:(AWSConnectSearchQueuesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectSearchQueuesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches quick connects in an Amazon Connect instance, with optional filtering.</p>
 
 @param request A container for the necessary parameters to execute the SearchQuickConnects service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectSearchQuickConnectsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSearchQuickConnectsRequest
 @see AWSConnectSearchQuickConnectsResponse
 */
- (AWSTask<AWSConnectSearchQuickConnectsResponse *> *)searchQuickConnects:(AWSConnectSearchQuickConnectsRequest *)request;

/**
 <p>Searches quick connects in an Amazon Connect instance, with optional filtering.</p>
 
 @param request A container for the necessary parameters to execute the SearchQuickConnects service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSearchQuickConnectsRequest
 @see AWSConnectSearchQuickConnectsResponse
 */
- (void)searchQuickConnects:(AWSConnectSearchQuickConnectsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectSearchQuickConnectsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches tags used in an Amazon Connect instance using optional search criteria.</p>
 
 @param request A container for the necessary parameters to execute the SearchResourceTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectSearchResourceTagsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorMaximumResultReturned`.
 
 @see AWSConnectSearchResourceTagsRequest
 @see AWSConnectSearchResourceTagsResponse
 */
- (AWSTask<AWSConnectSearchResourceTagsResponse *> *)searchResourceTags:(AWSConnectSearchResourceTagsRequest *)request;

/**
 <p>Searches tags used in an Amazon Connect instance using optional search criteria.</p>
 
 @param request A container for the necessary parameters to execute the SearchResourceTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorMaximumResultReturned`.
 
 @see AWSConnectSearchResourceTagsRequest
 @see AWSConnectSearchResourceTagsResponse
 */
- (void)searchResourceTags:(AWSConnectSearchResourceTagsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectSearchResourceTagsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches routing profiles in an Amazon Connect instance, with optional filtering.</p>
 
 @param request A container for the necessary parameters to execute the SearchRoutingProfiles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectSearchRoutingProfilesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSearchRoutingProfilesRequest
 @see AWSConnectSearchRoutingProfilesResponse
 */
- (AWSTask<AWSConnectSearchRoutingProfilesResponse *> *)searchRoutingProfiles:(AWSConnectSearchRoutingProfilesRequest *)request;

/**
 <p>Searches routing profiles in an Amazon Connect instance, with optional filtering.</p>
 
 @param request A container for the necessary parameters to execute the SearchRoutingProfiles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSearchRoutingProfilesRequest
 @see AWSConnectSearchRoutingProfilesResponse
 */
- (void)searchRoutingProfiles:(AWSConnectSearchRoutingProfilesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectSearchRoutingProfilesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches security profiles in an Amazon Connect instance, with optional filtering.</p>
 
 @param request A container for the necessary parameters to execute the SearchSecurityProfiles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectSearchSecurityProfilesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSearchSecurityProfilesRequest
 @see AWSConnectSearchSecurityProfilesResponse
 */
- (AWSTask<AWSConnectSearchSecurityProfilesResponse *> *)searchSecurityProfiles:(AWSConnectSearchSecurityProfilesRequest *)request;

/**
 <p>Searches security profiles in an Amazon Connect instance, with optional filtering.</p>
 
 @param request A container for the necessary parameters to execute the SearchSecurityProfiles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSearchSecurityProfilesRequest
 @see AWSConnectSearchSecurityProfilesResponse
 */
- (void)searchSecurityProfiles:(AWSConnectSearchSecurityProfilesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectSearchSecurityProfilesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches users in an Amazon Connect instance, with optional filtering. </p><note><p><code>AfterContactWorkTimeLimit</code> is returned in milliseconds. </p></note>
 
 @param request A container for the necessary parameters to execute the SearchUsers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectSearchUsersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSearchUsersRequest
 @see AWSConnectSearchUsersResponse
 */
- (AWSTask<AWSConnectSearchUsersResponse *> *)searchUsers:(AWSConnectSearchUsersRequest *)request;

/**
 <p>Searches users in an Amazon Connect instance, with optional filtering. </p><note><p><code>AfterContactWorkTimeLimit</code> is returned in milliseconds. </p></note>
 
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
 <p>Processes chat integration events from Amazon Web Services or external integrations to Amazon Connect. A chat integration event includes:</p><ul><li><p>SourceId, DestinationId, and Subtype: a set of identifiers, uniquely representing a chat</p></li><li><p> ChatEvent: details of the chat action to perform such as sending a message, event, or disconnecting from a chat</p></li></ul><p>When a chat integration event is sent with chat identifiers that do not map to an active chat contact, a new chat contact is also created before handling chat action. </p><p>Access to this API is currently restricted to Amazon Pinpoint for supporting SMS integration. </p>
 
 @param request A container for the necessary parameters to execute the SendChatIntegrationEvent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectSendChatIntegrationEventResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectSendChatIntegrationEventRequest
 @see AWSConnectSendChatIntegrationEventResponse
 */
- (AWSTask<AWSConnectSendChatIntegrationEventResponse *> *)sendChatIntegrationEvent:(AWSConnectSendChatIntegrationEventRequest *)request;

/**
 <p>Processes chat integration events from Amazon Web Services or external integrations to Amazon Connect. A chat integration event includes:</p><ul><li><p>SourceId, DestinationId, and Subtype: a set of identifiers, uniquely representing a chat</p></li><li><p> ChatEvent: details of the chat action to perform such as sending a message, event, or disconnecting from a chat</p></li></ul><p>When a chat integration event is sent with chat identifiers that do not map to an active chat contact, a new chat contact is also created before handling chat action. </p><p>Access to this API is currently restricted to Amazon Pinpoint for supporting SMS integration. </p>
 
 @param request A container for the necessary parameters to execute the SendChatIntegrationEvent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectSendChatIntegrationEventRequest
 @see AWSConnectSendChatIntegrationEventResponse
 */
- (void)sendChatIntegrationEvent:(AWSConnectSendChatIntegrationEventRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectSendChatIntegrationEventResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Starts an empty evaluation in the specified Amazon Connect instance, using the given evaluation form for the particular contact. The evaluation form version used for the contact evaluation corresponds to the currently activated version. If no version is activated for the evaluation form, the contact evaluation cannot be started. </p><note><p>Evaluations created through the public API do not contain answer values suggested from automation.</p></note>
 
 @param request A container for the necessary parameters to execute the StartContactEvaluation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectStartContactEvaluationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorResourceConflict`.
 
 @see AWSConnectStartContactEvaluationRequest
 @see AWSConnectStartContactEvaluationResponse
 */
- (AWSTask<AWSConnectStartContactEvaluationResponse *> *)startContactEvaluation:(AWSConnectStartContactEvaluationRequest *)request;

/**
 <p>Starts an empty evaluation in the specified Amazon Connect instance, using the given evaluation form for the particular contact. The evaluation form version used for the contact evaluation corresponds to the currently activated version. If no version is activated for the evaluation form, the contact evaluation cannot be started. </p><note><p>Evaluations created through the public API do not contain answer values suggested from automation.</p></note>
 
 @param request A container for the necessary parameters to execute the StartContactEvaluation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorResourceConflict`.
 
 @see AWSConnectStartContactEvaluationRequest
 @see AWSConnectStartContactEvaluationResponse
 */
- (void)startContactEvaluation:(AWSConnectStartContactEvaluationRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectStartContactEvaluationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Initiates a flow to start a new task contact. For more information about task contacts, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/tasks.html">Concepts: Tasks in Amazon Connect</a> in the <i>Amazon Connect Administrator Guide</i>. </p><p>When using <code>PreviousContactId</code> and <code>RelatedContactId</code> input parameters, note the following:</p><ul><li><p><code>PreviousContactId</code></p><ul><li><p>Any updates to user-defined task contact attributes on any contact linked through the same <code>PreviousContactId</code> will affect every contact in the chain.</p></li><li><p>There can be a maximum of 12 linked task contacts in a chain. That is, 12 task contacts can be created that share the same <code>PreviousContactId</code>.</p></li></ul></li><li><p><code>RelatedContactId</code></p><ul><li><p>Copies contact attributes from the related task contact to the new contact.</p></li><li><p>Any update on attributes in a new task contact does not update attributes on previous contact.</p></li><li><p>There’s no limit on the number of task contacts that can be created that use the same <code>RelatedContactId</code>.</p></li></ul></li></ul><p>In addition, when calling StartTaskContact include only one of these parameters: <code>ContactFlowID</code>, <code>QuickConnectID</code>, or <code>TaskTemplateID</code>. Only one parameter is required as long as the task template has a flow configured to run it. If more than one parameter is specified, or only the <code>TaskTemplateID</code> is specified but it does not have a flow configured, the request returns an error because Amazon Connect cannot identify the unique flow to run when the task is created.</p><p>A <code>ServiceQuotaExceededException</code> occurs when the number of open tasks exceeds the active tasks quota or there are already 12 tasks referencing the same <code>PreviousContactId</code>. For more information about service quotas for task contacts, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">Amazon Connect service quotas</a> in the <i>Amazon Connect Administrator Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the StartTaskContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectStartTaskContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectStartTaskContactRequest
 @see AWSConnectStartTaskContactResponse
 */
- (AWSTask<AWSConnectStartTaskContactResponse *> *)startTaskContact:(AWSConnectStartTaskContactRequest *)request;

/**
 <p>Initiates a flow to start a new task contact. For more information about task contacts, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/tasks.html">Concepts: Tasks in Amazon Connect</a> in the <i>Amazon Connect Administrator Guide</i>. </p><p>When using <code>PreviousContactId</code> and <code>RelatedContactId</code> input parameters, note the following:</p><ul><li><p><code>PreviousContactId</code></p><ul><li><p>Any updates to user-defined task contact attributes on any contact linked through the same <code>PreviousContactId</code> will affect every contact in the chain.</p></li><li><p>There can be a maximum of 12 linked task contacts in a chain. That is, 12 task contacts can be created that share the same <code>PreviousContactId</code>.</p></li></ul></li><li><p><code>RelatedContactId</code></p><ul><li><p>Copies contact attributes from the related task contact to the new contact.</p></li><li><p>Any update on attributes in a new task contact does not update attributes on previous contact.</p></li><li><p>There’s no limit on the number of task contacts that can be created that use the same <code>RelatedContactId</code>.</p></li></ul></li></ul><p>In addition, when calling StartTaskContact include only one of these parameters: <code>ContactFlowID</code>, <code>QuickConnectID</code>, or <code>TaskTemplateID</code>. Only one parameter is required as long as the task template has a flow configured to run it. If more than one parameter is specified, or only the <code>TaskTemplateID</code> is specified but it does not have a flow configured, the request returns an error because Amazon Connect cannot identify the unique flow to run when the task is created.</p><p>A <code>ServiceQuotaExceededException</code> occurs when the number of open tasks exceeds the active tasks quota or there are already 12 tasks referencing the same <code>PreviousContactId</code>. For more information about service quotas for task contacts, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">Amazon Connect service quotas</a> in the <i>Amazon Connect Administrator Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the StartTaskContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectStartTaskContactRequest
 @see AWSConnectStartTaskContactResponse
 */
- (void)startTaskContact:(AWSConnectStartTaskContactRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectStartTaskContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Places an inbound in-app, web, or video call to a contact, and then initiates the flow. It performs the actions in the flow that are specified (in ContactFlowId) and present in the Amazon Connect instance (specified as InstanceId).</p>
 
 @param request A container for the necessary parameters to execute the StartWebRTCContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectStartWebRTCContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorResourceNotFound`.
 
 @see AWSConnectStartWebRTCContactRequest
 @see AWSConnectStartWebRTCContactResponse
 */
- (AWSTask<AWSConnectStartWebRTCContactResponse *> *)startWebRTCContact:(AWSConnectStartWebRTCContactRequest *)request;

/**
 <p>Places an inbound in-app, web, or video call to a contact, and then initiates the flow. It performs the actions in the flow that are specified (in ContactFlowId) and present in the Amazon Connect instance (specified as InstanceId).</p>
 
 @param request A container for the necessary parameters to execute the StartWebRTCContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorResourceNotFound`.
 
 @see AWSConnectStartWebRTCContactRequest
 @see AWSConnectStartWebRTCContactResponse
 */
- (void)startWebRTCContact:(AWSConnectStartWebRTCContactRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectStartWebRTCContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Ends the specified contact. Use this API to stop queued callbacks. It does not work for voice contacts that use the following initiation methods:</p><ul><li><p>DISCONNECT</p></li><li><p>TRANSFER</p></li><li><p>QUEUE_TRANSFER</p></li></ul><p>Chat and task contacts can be terminated in any state, regardless of initiation method.</p>
 
 @param request A container for the necessary parameters to execute the StopContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectStopContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorContactNotFound`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectStopContactRequest
 @see AWSConnectStopContactResponse
 */
- (AWSTask<AWSConnectStopContactResponse *> *)stopContact:(AWSConnectStopContactRequest *)request;

/**
 <p>Ends the specified contact. Use this API to stop queued callbacks. It does not work for voice contacts that use the following initiation methods:</p><ul><li><p>DISCONNECT</p></li><li><p>TRANSFER</p></li><li><p>QUEUE_TRANSFER</p></li></ul><p>Chat and task contacts can be terminated in any state, regardless of initiation method.</p>
 
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
 <p>Submits a contact evaluation in the specified Amazon Connect instance. Answers included in the request are merged with existing answers for the given evaluation. If no answers or notes are passed, the evaluation is submitted with the existing answers and notes. You can delete an answer or note by passing an empty object (<code>{}</code>) to the question identifier. </p><p>If a contact evaluation is already in submitted state, this operation will trigger a resubmission.</p>
 
 @param request A container for the necessary parameters to execute the SubmitContactEvaluation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectSubmitContactEvaluationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceConflict`.
 
 @see AWSConnectSubmitContactEvaluationRequest
 @see AWSConnectSubmitContactEvaluationResponse
 */
- (AWSTask<AWSConnectSubmitContactEvaluationResponse *> *)submitContactEvaluation:(AWSConnectSubmitContactEvaluationRequest *)request;

/**
 <p>Submits a contact evaluation in the specified Amazon Connect instance. Answers included in the request are merged with existing answers for the given evaluation. If no answers or notes are passed, the evaluation is submitted with the existing answers and notes. You can delete an answer or note by passing an empty object (<code>{}</code>) to the question identifier. </p><p>If a contact evaluation is already in submitted state, this operation will trigger a resubmission.</p>
 
 @param request A container for the necessary parameters to execute the SubmitContactEvaluation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceConflict`.
 
 @see AWSConnectSubmitContactEvaluationRequest
 @see AWSConnectSubmitContactEvaluationResponse
 */
- (void)submitContactEvaluation:(AWSConnectSubmitContactEvaluationRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectSubmitContactEvaluationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>When a contact is being recorded, this API suspends recording whatever is selected in the flow configuration: call, screen, or both. If only call recording or only screen recording is enabled, then it would be suspended. For example, you might suspend the screen recording while collecting sensitive information, such as a credit card number. Then use ResumeContactRecording to restart recording the screen.</p><p>The period of time that the recording is suspended is filled with silence in the final recording.</p><p>Voice and screen recordings are supported.</p>
 
 @param request A container for the necessary parameters to execute the SuspendContactRecording service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectSuspendContactRecordingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSuspendContactRecordingRequest
 @see AWSConnectSuspendContactRecordingResponse
 */
- (AWSTask<AWSConnectSuspendContactRecordingResponse *> *)suspendContactRecording:(AWSConnectSuspendContactRecordingRequest *)request;

/**
 <p>When a contact is being recorded, this API suspends recording whatever is selected in the flow configuration: call, screen, or both. If only call recording or only screen recording is enabled, then it would be suspended. For example, you might suspend the screen recording while collecting sensitive information, such as a credit card number. Then use ResumeContactRecording to restart recording the screen.</p><p>The period of time that the recording is suspended is filled with silence in the final recording.</p><p>Voice and screen recordings are supported.</p>
 
 @param request A container for the necessary parameters to execute the SuspendContactRecording service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectSuspendContactRecordingRequest
 @see AWSConnectSuspendContactRecordingResponse
 */
- (void)suspendContactRecording:(AWSConnectSuspendContactRecordingRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectSuspendContactRecordingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds the specified tags to the contact resource. For more information about this API is used, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/granular-billing.html">Set up granular billing for a detailed view of your Amazon Connect usage</a>. </p>
 
 @param request A container for the necessary parameters to execute the TagContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectTagContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectTagContactRequest
 @see AWSConnectTagContactResponse
 */
- (AWSTask<AWSConnectTagContactResponse *> *)tagContact:(AWSConnectTagContactRequest *)request;

/**
 <p>Adds the specified tags to the contact resource. For more information about this API is used, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/granular-billing.html">Set up granular billing for a detailed view of your Amazon Connect usage</a>. </p>
 
 @param request A container for the necessary parameters to execute the TagContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectTagContactRequest
 @see AWSConnectTagContactResponse
 */
- (void)tagContact:(AWSConnectTagContactRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectTagContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Removes the specified tags from the contact resource. For more information about this API is used, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/granular-billing.html">Set up granular billing for a detailed view of your Amazon Connect usage</a>.</p>
 
 @param request A container for the necessary parameters to execute the UntagContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectUntagContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectUntagContactRequest
 @see AWSConnectUntagContactResponse
 */
- (AWSTask<AWSConnectUntagContactResponse *> *)untagContact:(AWSConnectUntagContactRequest *)request;

/**
 <p>Removes the specified tags from the contact resource. For more information about this API is used, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/granular-billing.html">Set up granular billing for a detailed view of your Amazon Connect usage</a>.</p>
 
 @param request A container for the necessary parameters to execute the UntagContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectUntagContactRequest
 @see AWSConnectUntagContactResponse
 */
- (void)untagContact:(AWSConnectUntagContactRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectUntagContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Updates details about a contact evaluation in the specified Amazon Connect instance. A contact evaluation must be in draft state. Answers included in the request are merged with existing answers for the given evaluation. An answer or note can be deleted by passing an empty object (<code>{}</code>) to the question identifier. </p>
 
 @param request A container for the necessary parameters to execute the UpdateContactEvaluation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectUpdateContactEvaluationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceConflict`.
 
 @see AWSConnectUpdateContactEvaluationRequest
 @see AWSConnectUpdateContactEvaluationResponse
 */
- (AWSTask<AWSConnectUpdateContactEvaluationResponse *> *)updateContactEvaluation:(AWSConnectUpdateContactEvaluationRequest *)request;

/**
 <p>Updates details about a contact evaluation in the specified Amazon Connect instance. A contact evaluation must be in draft state. Answers included in the request are merged with existing answers for the given evaluation. An answer or note can be deleted by passing an empty object (<code>{}</code>) to the question identifier. </p>
 
 @param request A container for the necessary parameters to execute the UpdateContactEvaluation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceConflict`.
 
 @see AWSConnectUpdateContactEvaluationRequest
 @see AWSConnectUpdateContactEvaluationResponse
 */
- (void)updateContactEvaluation:(AWSConnectUpdateContactEvaluationRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectUpdateContactEvaluationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified flow.</p><p>You can also create and update flows using the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/flow-language.html">Amazon Connect Flow language</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactFlowContent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectUpdateContactFlowContentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidContactFlow`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactFlowContentRequest
 @see AWSConnectUpdateContactFlowContentResponse
 */
- (AWSTask<AWSConnectUpdateContactFlowContentResponse *> *)updateContactFlowContent:(AWSConnectUpdateContactFlowContentRequest *)request;

/**
 <p>Updates the specified flow.</p><p>You can also create and update flows using the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/flow-language.html">Amazon Connect Flow language</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactFlowContent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidContactFlow`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactFlowContentRequest
 @see AWSConnectUpdateContactFlowContentResponse
 */
- (void)updateContactFlowContent:(AWSConnectUpdateContactFlowContentRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectUpdateContactFlowContentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates metadata about specified flow.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactFlowMetadata service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectUpdateContactFlowMetadataResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactFlowMetadataRequest
 @see AWSConnectUpdateContactFlowMetadataResponse
 */
- (AWSTask<AWSConnectUpdateContactFlowMetadataResponse *> *)updateContactFlowMetadata:(AWSConnectUpdateContactFlowMetadataRequest *)request;

/**
 <p>Updates metadata about specified flow.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactFlowMetadata service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactFlowMetadataRequest
 @see AWSConnectUpdateContactFlowMetadataResponse
 */
- (void)updateContactFlowMetadata:(AWSConnectUpdateContactFlowMetadataRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectUpdateContactFlowMetadataResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>The name of the flow.</p><p>You can also create and update flows using the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/flow-language.html">Amazon Connect Flow language</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactFlowName service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectUpdateContactFlowNameResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactFlowNameRequest
 @see AWSConnectUpdateContactFlowNameResponse
 */
- (AWSTask<AWSConnectUpdateContactFlowNameResponse *> *)updateContactFlowName:(AWSConnectUpdateContactFlowNameRequest *)request;

/**
 <p>The name of the flow.</p><p>You can also create and update flows using the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/flow-language.html">Amazon Connect Flow language</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactFlowName service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactFlowNameRequest
 @see AWSConnectUpdateContactFlowNameResponse
 */
- (void)updateContactFlowName:(AWSConnectUpdateContactFlowNameRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectUpdateContactFlowNameResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Updates routing priority and age on the contact (<b>QueuePriority</b> and <b>QueueTimeAdjustmentInSeconds</b>). These properties can be used to change a customer's position in the queue. For example, you can move a contact to the back of the queue by setting a lower routing priority relative to other contacts in queue; or you can move a contact to the front of the queue by increasing the routing age which will make the contact look artificially older and therefore higher up in the first-in-first-out routing order. Note that adjusting the routing age of a contact affects only its position in queue, and not its actual queue wait time as reported through metrics. These properties can also be updated by using <a href="https://docs.aws.amazon.com/connect/latest/adminguide/change-routing-priority.html">the Set routing priority / age flow block</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactRoutingData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectUpdateContactRoutingDataResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceConflict`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectUpdateContactRoutingDataRequest
 @see AWSConnectUpdateContactRoutingDataResponse
 */
- (AWSTask<AWSConnectUpdateContactRoutingDataResponse *> *)updateContactRoutingData:(AWSConnectUpdateContactRoutingDataRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Updates routing priority and age on the contact (<b>QueuePriority</b> and <b>QueueTimeAdjustmentInSeconds</b>). These properties can be used to change a customer's position in the queue. For example, you can move a contact to the back of the queue by setting a lower routing priority relative to other contacts in queue; or you can move a contact to the front of the queue by increasing the routing age which will make the contact look artificially older and therefore higher up in the first-in-first-out routing order. Note that adjusting the routing age of a contact affects only its position in queue, and not its actual queue wait time as reported through metrics. These properties can also be updated by using <a href="https://docs.aws.amazon.com/connect/latest/adminguide/change-routing-priority.html">the Set routing priority / age flow block</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactRoutingData service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorResourceConflict`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectUpdateContactRoutingDataRequest
 @see AWSConnectUpdateContactRoutingDataResponse
 */
- (void)updateContactRoutingData:(AWSConnectUpdateContactRoutingDataRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectUpdateContactRoutingDataResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Updates details about a specific evaluation form version in the specified Amazon Connect instance. Question and section identifiers cannot be duplicated within the same evaluation form.</p><p>This operation does not support partial updates. Instead it does a full update of evaluation form content.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEvaluationForm service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectUpdateEvaluationFormResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorResourceConflict`.
 
 @see AWSConnectUpdateEvaluationFormRequest
 @see AWSConnectUpdateEvaluationFormResponse
 */
- (AWSTask<AWSConnectUpdateEvaluationFormResponse *> *)updateEvaluationForm:(AWSConnectUpdateEvaluationFormRequest *)request;

/**
 <p>Updates details about a specific evaluation form version in the specified Amazon Connect instance. Question and section identifiers cannot be duplicated within the same evaluation form.</p><p>This operation does not support partial updates. Instead it does a full update of evaluation form content.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEvaluationForm service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorServiceQuotaExceeded`, `AWSConnectErrorResourceConflict`.
 
 @see AWSConnectUpdateEvaluationFormRequest
 @see AWSConnectUpdateEvaluationFormResponse
 */
- (void)updateEvaluationForm:(AWSConnectUpdateEvaluationFormRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectUpdateEvaluationFormResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Updates timeouts for when human chat participants are to be considered idle, and when agents are automatically disconnected from a chat due to idleness. You can set four timers:</p><ul><li><p>Customer idle timeout</p></li><li><p>Customer auto-disconnect timeout</p></li><li><p>Agent idle timeout</p></li><li><p>Agent auto-disconnect timeout</p></li></ul><p>For more information about how chat timeouts work, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/setup-chat-timeouts.html">Set up chat timeouts for human participants</a>. </p>
 
 @param request A container for the necessary parameters to execute the UpdateParticipantRoleConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectUpdateParticipantRoleConfigResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateParticipantRoleConfigRequest
 @see AWSConnectUpdateParticipantRoleConfigResponse
 */
- (AWSTask<AWSConnectUpdateParticipantRoleConfigResponse *> *)updateParticipantRoleConfig:(AWSConnectUpdateParticipantRoleConfigRequest *)request;

/**
 <p>Updates timeouts for when human chat participants are to be considered idle, and when agents are automatically disconnected from a chat due to idleness. You can set four timers:</p><ul><li><p>Customer idle timeout</p></li><li><p>Customer auto-disconnect timeout</p></li><li><p>Agent idle timeout</p></li><li><p>Agent auto-disconnect timeout</p></li></ul><p>For more information about how chat timeouts work, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/setup-chat-timeouts.html">Set up chat timeouts for human participants</a>. </p>
 
 @param request A container for the necessary parameters to execute the UpdateParticipantRoleConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateParticipantRoleConfigRequest
 @see AWSConnectUpdateParticipantRoleConfigResponse
 */
- (void)updateParticipantRoleConfig:(AWSConnectUpdateParticipantRoleConfigRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectUpdateParticipantRoleConfigResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates your claimed phone number from its current Amazon Connect instance or traffic distribution group to another Amazon Connect instance or traffic distribution group in the same Amazon Web Services Region.</p><important><p>After using this API, you must verify that the phone number is attached to the correct flow in the target instance or traffic distribution group. You need to do this because the API switches only the phone number to a new instance or traffic distribution group. It doesn't migrate the flow configuration of the phone number, too.</p><p>You can call <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DescribePhoneNumber.html">DescribePhoneNumber</a> API to verify the status of a previous <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_UpdatePhoneNumber.html">UpdatePhoneNumber</a> operation.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdatePhoneNumber service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectUpdatePhoneNumberResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceInUse`, `AWSConnectErrorIdempotency`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectUpdatePhoneNumberRequest
 @see AWSConnectUpdatePhoneNumberResponse
 */
- (AWSTask<AWSConnectUpdatePhoneNumberResponse *> *)updatePhoneNumber:(AWSConnectUpdatePhoneNumberRequest *)request;

/**
 <p>Updates your claimed phone number from its current Amazon Connect instance or traffic distribution group to another Amazon Connect instance or traffic distribution group in the same Amazon Web Services Region.</p><important><p>After using this API, you must verify that the phone number is attached to the correct flow in the target instance or traffic distribution group. You need to do this because the API switches only the phone number to a new instance or traffic distribution group. It doesn't migrate the flow configuration of the phone number, too.</p><p>You can call <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DescribePhoneNumber.html">DescribePhoneNumber</a> API to verify the status of a previous <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_UpdatePhoneNumber.html">UpdatePhoneNumber</a> operation.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdatePhoneNumber service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceInUse`, `AWSConnectErrorIdempotency`, `AWSConnectErrorAccessDenied`.
 
 @see AWSConnectUpdatePhoneNumberRequest
 @see AWSConnectUpdatePhoneNumberResponse
 */
- (void)updatePhoneNumber:(AWSConnectUpdatePhoneNumberRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectUpdatePhoneNumberResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a phone number’s metadata.</p><important><p>To verify the status of a previous UpdatePhoneNumberMetadata operation, call the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DescribePhoneNumber.html">DescribePhoneNumber</a> API.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdatePhoneNumberMetadata service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceInUse`, `AWSConnectErrorIdempotency`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdatePhoneNumberMetadataRequest
 */
- (AWSTask *)updatePhoneNumberMetadata:(AWSConnectUpdatePhoneNumberMetadataRequest *)request;

/**
 <p>Updates a phone number’s metadata.</p><important><p>To verify the status of a previous UpdatePhoneNumberMetadata operation, call the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DescribePhoneNumber.html">DescribePhoneNumber</a> API.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdatePhoneNumberMetadata service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceInUse`, `AWSConnectErrorIdempotency`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdatePhoneNumberMetadataRequest
 */
- (void)updatePhoneNumberMetadata:(AWSConnectUpdatePhoneNumberMetadataRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates a predefined attribute for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePredefinedAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdatePredefinedAttributeRequest
 */
- (AWSTask *)updatePredefinedAttribute:(AWSConnectUpdatePredefinedAttributeRequest *)request;

/**
 <p>Updates a predefined attribute for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePredefinedAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdatePredefinedAttributeRequest
 */
- (void)updatePredefinedAttribute:(AWSConnectUpdatePredefinedAttributeRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates a prompt.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePrompt service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectUpdatePromptResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdatePromptRequest
 @see AWSConnectUpdatePromptResponse
 */
- (AWSTask<AWSConnectUpdatePromptResponse *> *)updatePrompt:(AWSConnectUpdatePromptRequest *)request;

/**
 <p>Updates a prompt.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePrompt service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdatePromptRequest
 @see AWSConnectUpdatePromptResponse
 */
- (void)updatePrompt:(AWSConnectUpdatePromptRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectUpdatePromptResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Updates the outbound caller ID name, number, and outbound whisper flow for a specified queue.</p><important><ul><li><p>If the phone number is claimed to a traffic distribution group that was created in the same Region as the Amazon Connect instance where you are calling this API, then you can use a full phone number ARN or a UUID for <code>OutboundCallerIdNumberId</code>. However, if the phone number is claimed to a traffic distribution group that is in one Region, and you are calling this API from an instance in another Amazon Web Services Region that is associated with the traffic distribution group, you must provide a full phone number ARN. If a UUID is provided in this scenario, you will receive a <code>ResourceNotFoundException</code>.</p></li><li><p>Only use the phone number ARN format that doesn't contain <code>instance</code> in the path, for example, <code>arn:aws:connect:us-east-1:1234567890:phone-number/uuid</code>. This is the same ARN format that is returned when you call the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ListPhoneNumbersV2.html">ListPhoneNumbersV2</a> API.</p></li><li><p>If you plan to use IAM policies to allow/deny access to this API for phone number resources claimed to a traffic distribution group, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/security_iam_resource-level-policy-examples.html#allow-deny-queue-actions-replica-region">Allow or Deny queue API actions for phone numbers in a replica Region</a>.</p></li></ul></important>
 
 @param request A container for the necessary parameters to execute the UpdateQueueOutboundCallerConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateQueueOutboundCallerConfigRequest
 */
- (AWSTask *)updateQueueOutboundCallerConfig:(AWSConnectUpdateQueueOutboundCallerConfigRequest *)request;

/**
 <p>This API is in preview release for Amazon Connect and is subject to change.</p><p>Updates the outbound caller ID name, number, and outbound whisper flow for a specified queue.</p><important><ul><li><p>If the phone number is claimed to a traffic distribution group that was created in the same Region as the Amazon Connect instance where you are calling this API, then you can use a full phone number ARN or a UUID for <code>OutboundCallerIdNumberId</code>. However, if the phone number is claimed to a traffic distribution group that is in one Region, and you are calling this API from an instance in another Amazon Web Services Region that is associated with the traffic distribution group, you must provide a full phone number ARN. If a UUID is provided in this scenario, you will receive a <code>ResourceNotFoundException</code>.</p></li><li><p>Only use the phone number ARN format that doesn't contain <code>instance</code> in the path, for example, <code>arn:aws:connect:us-east-1:1234567890:phone-number/uuid</code>. This is the same ARN format that is returned when you call the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ListPhoneNumbersV2.html">ListPhoneNumbersV2</a> API.</p></li><li><p>If you plan to use IAM policies to allow/deny access to this API for phone number resources claimed to a traffic distribution group, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/security_iam_resource-level-policy-examples.html#allow-deny-queue-actions-replica-region">Allow or Deny queue API actions for phone numbers in a replica Region</a>.</p></li></ul></important>
 
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
 <p>Whether agents with this routing profile will have their routing order calculated based on <i>time since their last inbound contact</i> or <i>longest idle time</i>. </p>
 
 @param request A container for the necessary parameters to execute the UpdateRoutingProfileAgentAvailabilityTimer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateRoutingProfileAgentAvailabilityTimerRequest
 */
- (AWSTask *)updateRoutingProfileAgentAvailabilityTimer:(AWSConnectUpdateRoutingProfileAgentAvailabilityTimerRequest *)request;

/**
 <p>Whether agents with this routing profile will have their routing order calculated based on <i>time since their last inbound contact</i> or <i>longest idle time</i>. </p>
 
 @param request A container for the necessary parameters to execute the UpdateRoutingProfileAgentAvailabilityTimer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateRoutingProfileAgentAvailabilityTimerRequest
 */
- (void)updateRoutingProfileAgentAvailabilityTimer:(AWSConnectUpdateRoutingProfileAgentAvailabilityTimerRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

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
 <p>Updates a rule for the specified Amazon Connect instance.</p><p>Use the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/connect-rules-language.html">Rules Function language</a> to code conditions for the rule. </p>
 
 @param request A container for the necessary parameters to execute the UpdateRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceConflict`.
 
 @see AWSConnectUpdateRuleRequest
 */
- (AWSTask *)updateRule:(AWSConnectUpdateRuleRequest *)request;

/**
 <p>Updates a rule for the specified Amazon Connect instance.</p><p>Use the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/connect-rules-language.html">Rules Function language</a> to code conditions for the rule. </p>
 
 @param request A container for the necessary parameters to execute the UpdateRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceConflict`.
 
 @see AWSConnectUpdateRuleRequest
 */
- (void)updateRule:(AWSConnectUpdateRuleRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates a security profile.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSecurityProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateSecurityProfileRequest
 */
- (AWSTask *)updateSecurityProfile:(AWSConnectUpdateSecurityProfileRequest *)request;

/**
 <p>Updates a security profile.</p>
 
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
 <p>Updates the traffic distribution for a given traffic distribution group. </p><note><p>The <code>SignInConfig</code> distribution is available only on a default <code>TrafficDistributionGroup</code> (see the <code>IsDefault</code> parameter in the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_TrafficDistributionGroup.html">TrafficDistributionGroup</a> data type). If you call <code>UpdateTrafficDistribution</code> with a modified <code>SignInConfig</code> and a non-default <code>TrafficDistributionGroup</code>, an <code>InvalidRequestException</code> is returned.</p></note><p>For more information about updating a traffic distribution group, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/update-telephony-traffic-distribution.html">Update telephony traffic distribution across Amazon Web Services Regions </a> in the <i>Amazon Connect Administrator Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the UpdateTrafficDistribution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectUpdateTrafficDistributionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorAccessDenied`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorResourceConflict`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateTrafficDistributionRequest
 @see AWSConnectUpdateTrafficDistributionResponse
 */
- (AWSTask<AWSConnectUpdateTrafficDistributionResponse *> *)updateTrafficDistribution:(AWSConnectUpdateTrafficDistributionRequest *)request;

/**
 <p>Updates the traffic distribution for a given traffic distribution group. </p><note><p>The <code>SignInConfig</code> distribution is available only on a default <code>TrafficDistributionGroup</code> (see the <code>IsDefault</code> parameter in the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_TrafficDistributionGroup.html">TrafficDistributionGroup</a> data type). If you call <code>UpdateTrafficDistribution</code> with a modified <code>SignInConfig</code> and a non-default <code>TrafficDistributionGroup</code>, an <code>InvalidRequestException</code> is returned.</p></note><p>For more information about updating a traffic distribution group, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/update-telephony-traffic-distribution.html">Update telephony traffic distribution across Amazon Web Services Regions </a> in the <i>Amazon Connect Administrator Guide</i>. </p>
 
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
 <p>Updates the properties associated with the proficiencies of a user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserProficiencies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserProficienciesRequest
 */
- (AWSTask *)updateUserProficiencies:(AWSConnectUpdateUserProficienciesRequest *)request;

/**
 <p>Updates the properties associated with the proficiencies of a user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserProficiencies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserProficienciesRequest
 */
- (void)updateUserProficiencies:(AWSConnectUpdateUserProficienciesRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

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

/**
 <p>Updates the view content of the given view identifier in the specified Amazon Connect instance.</p><p>It performs content validation if <code>Status</code> is set to <code>SAVED</code> and performs full content validation if <code>Status</code> is <code>PUBLISHED</code>. Note that the <code>$SAVED</code> alias' content will always be updated, but the <code>$LATEST</code> alias' content will only be updated if <code>Status</code> is <code>PUBLISHED</code>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateViewContent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectUpdateViewContentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorTooManyRequests`, `AWSConnectErrorResourceInUse`.
 
 @see AWSConnectUpdateViewContentRequest
 @see AWSConnectUpdateViewContentResponse
 */
- (AWSTask<AWSConnectUpdateViewContentResponse *> *)updateViewContent:(AWSConnectUpdateViewContentRequest *)request;

/**
 <p>Updates the view content of the given view identifier in the specified Amazon Connect instance.</p><p>It performs content validation if <code>Status</code> is set to <code>SAVED</code> and performs full content validation if <code>Status</code> is <code>PUBLISHED</code>. Note that the <code>$SAVED</code> alias' content will always be updated, but the <code>$LATEST</code> alias' content will only be updated if <code>Status</code> is <code>PUBLISHED</code>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateViewContent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorTooManyRequests`, `AWSConnectErrorResourceInUse`.
 
 @see AWSConnectUpdateViewContentRequest
 @see AWSConnectUpdateViewContentResponse
 */
- (void)updateViewContent:(AWSConnectUpdateViewContentRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectUpdateViewContentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the view metadata. Note that either <code>Name</code> or <code>Description</code> must be provided.</p>
 
 @param request A container for the necessary parameters to execute the UpdateViewMetadata service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectUpdateViewMetadataResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorTooManyRequests`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceInUse`.
 
 @see AWSConnectUpdateViewMetadataRequest
 @see AWSConnectUpdateViewMetadataResponse
 */
- (AWSTask<AWSConnectUpdateViewMetadataResponse *> *)updateViewMetadata:(AWSConnectUpdateViewMetadataRequest *)request;

/**
 <p>Updates the view metadata. Note that either <code>Name</code> or <code>Description</code> must be provided.</p>
 
 @param request A container for the necessary parameters to execute the UpdateViewMetadata service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorAccessDenied`, `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorTooManyRequests`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceInUse`.
 
 @see AWSConnectUpdateViewMetadataRequest
 @see AWSConnectUpdateViewMetadataResponse
 */
- (void)updateViewMetadata:(AWSConnectUpdateViewMetadataRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectUpdateViewMetadataResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
