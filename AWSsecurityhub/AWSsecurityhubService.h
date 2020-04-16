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
#import "AWSsecurityhubModel.h"
#import "AWSsecurityhubResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSsecurityhub
FOUNDATION_EXPORT NSString *const AWSsecurityhubSDKVersion;

/**
 <p>Security Hub provides you with a comprehensive view of the security state of your AWS environment and resources. It also provides you with the readiness status of your environment based on controls from supported security standards. Security Hub collects security data from AWS accounts, services, and integrated third-party products and helps you analyze security trends in your environment to identify the highest priority security issues. For more information about Security Hub, see the <i><a href="https://docs.aws.amazon.com/securityhub/latest/userguide/what-is-securityhub.html">AWS Security Hub User Guide</a></i>.</p><p>When you use operations in the Security Hub API, the requests are executed only in the AWS Region that is currently active or in the specific AWS Region that you specify in your request. Any configuration or settings change that results from the operation is applied only to that Region. To make the same change in other Regions, execute the same command for each Region to apply the change to.</p><p>For example, if your Region is set to <code>us-west-2</code>, when you use <code><a>CreateMembers</a></code> to add a member account to Security Hub, the association of the member account with the master account is created only in the <code>us-west-2</code> Region. Security Hub must be enabled for the member account in the same Region that the invitation was sent from.</p><p>The following throttling limits apply to using Security Hub API operations.</p><ul><li><p><code><a>GetFindings</a></code> - <code>RateLimit</code> of 3 requests per second. <code>BurstLimit</code> of 6 requests per second.</p></li><li><p><code><a>UpdateFindings</a></code> - <code>RateLimit</code> of 1 request per second. <code>BurstLimit</code> of 5 requests per second.</p></li><li><p>All other operations - <code>RateLimit</code> of 10 requests per second. <code>BurstLimit</code> of 30 requests per second.</p></li></ul>
 */
@interface AWSsecurityhub : AWSService

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

     let securityhub = AWSsecurityhub.default()

 *Objective-C*

     AWSsecurityhub *securityhub = [AWSsecurityhub defaultsecurityhub];

 @return The default service client.
 */
+ (instancetype)defaultsecurityhub;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSsecurityhub.register(with: configuration!, forKey: "USWest2securityhub")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:@"USWest2securityhub"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let securityhub = AWSsecurityhub(forKey: "USWest2securityhub")

 *Objective-C*

     AWSsecurityhub *securityhub = [AWSsecurityhub securityhubForKey:@"USWest2securityhub"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registersecurityhubWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registersecurityhubWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSsecurityhub.register(with: configuration!, forKey: "USWest2securityhub")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:@"USWest2securityhub"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let securityhub = AWSsecurityhub(forKey: "USWest2securityhub")

 *Objective-C*

     AWSsecurityhub *securityhub = [AWSsecurityhub securityhubForKey:@"USWest2securityhub"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)securityhubForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removesecurityhubForKey:(NSString *)key;

/**
 <p>Accepts the invitation to be a member account and be monitored by the Security Hub master account that the invitation was sent from.</p><p>When the member account accepts the invitation, permission is granted to the master account to view findings generated in the member account.</p>
 
 @param request A container for the necessary parameters to execute the AcceptInvitation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubAcceptInvitationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceNotFound`, `AWSsecurityhubErrorInvalidAccess`.
 
 @see AWSsecurityhubAcceptInvitationRequest
 @see AWSsecurityhubAcceptInvitationResponse
 */
- (AWSTask<AWSsecurityhubAcceptInvitationResponse *> *)acceptInvitation:(AWSsecurityhubAcceptInvitationRequest *)request;

/**
 <p>Accepts the invitation to be a member account and be monitored by the Security Hub master account that the invitation was sent from.</p><p>When the member account accepts the invitation, permission is granted to the master account to view findings generated in the member account.</p>
 
 @param request A container for the necessary parameters to execute the AcceptInvitation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceNotFound`, `AWSsecurityhubErrorInvalidAccess`.
 
 @see AWSsecurityhubAcceptInvitationRequest
 @see AWSsecurityhubAcceptInvitationResponse
 */
- (void)acceptInvitation:(AWSsecurityhubAcceptInvitationRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubAcceptInvitationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables the standards specified by the provided <code>StandardsSubscriptionArns</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards.html">Security Standards</a> section of the <i>AWS Security Hub User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the BatchDisableStandards service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubBatchDisableStandardsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`.
 
 @see AWSsecurityhubBatchDisableStandardsRequest
 @see AWSsecurityhubBatchDisableStandardsResponse
 */
- (AWSTask<AWSsecurityhubBatchDisableStandardsResponse *> *)batchDisableStandards:(AWSsecurityhubBatchDisableStandardsRequest *)request;

/**
 <p>Disables the standards specified by the provided <code>StandardsSubscriptionArns</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards.html">Security Standards</a> section of the <i>AWS Security Hub User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the BatchDisableStandards service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`.
 
 @see AWSsecurityhubBatchDisableStandardsRequest
 @see AWSsecurityhubBatchDisableStandardsResponse
 */
- (void)batchDisableStandards:(AWSsecurityhubBatchDisableStandardsRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubBatchDisableStandardsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables the standards specified by the provided <code>StandardsArn</code>. To obtain the ARN for a standard, use the <code><a>DescribeStandards</a></code> operation.</p><p>For more information, see the <a href="https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards.html">Security Standards</a> section of the <i>AWS Security Hub User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the BatchEnableStandards service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubBatchEnableStandardsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`.
 
 @see AWSsecurityhubBatchEnableStandardsRequest
 @see AWSsecurityhubBatchEnableStandardsResponse
 */
- (AWSTask<AWSsecurityhubBatchEnableStandardsResponse *> *)batchEnableStandards:(AWSsecurityhubBatchEnableStandardsRequest *)request;

/**
 <p>Enables the standards specified by the provided <code>StandardsArn</code>. To obtain the ARN for a standard, use the <code><a>DescribeStandards</a></code> operation.</p><p>For more information, see the <a href="https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards.html">Security Standards</a> section of the <i>AWS Security Hub User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the BatchEnableStandards service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`.
 
 @see AWSsecurityhubBatchEnableStandardsRequest
 @see AWSsecurityhubBatchEnableStandardsResponse
 */
- (void)batchEnableStandards:(AWSsecurityhubBatchEnableStandardsRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubBatchEnableStandardsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Imports security findings generated from an integrated third-party product into Security Hub. This action is requested by the integrated product to import its findings into Security Hub.</p><p>The maximum allowed size for a finding is 240 Kb. An error is returned for any finding larger than 240 Kb.</p><p>After a finding is created, <code>BatchImportFindings</code> cannot be used to update the following finding fields and objects, which Security Hub customers use to manage their investigation workflow.</p><ul><li><p><code>Confidence</code></p></li><li><p><code>Criticality</code></p></li><li><p><code>Note</code></p></li><li><p><code>RelatedFindings</code></p></li><li><p><code>Severity</code></p></li><li><p><code>Types</code></p></li><li><p><code>UserDefinedFields</code></p></li><li><p><code>VerificationState</code></p></li><li><p><code>Workflow</code></p></li></ul>
 
 @param request A container for the necessary parameters to execute the BatchImportFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubBatchImportFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorInvalidAccess`.
 
 @see AWSsecurityhubBatchImportFindingsRequest
 @see AWSsecurityhubBatchImportFindingsResponse
 */
- (AWSTask<AWSsecurityhubBatchImportFindingsResponse *> *)batchImportFindings:(AWSsecurityhubBatchImportFindingsRequest *)request;

/**
 <p>Imports security findings generated from an integrated third-party product into Security Hub. This action is requested by the integrated product to import its findings into Security Hub.</p><p>The maximum allowed size for a finding is 240 Kb. An error is returned for any finding larger than 240 Kb.</p><p>After a finding is created, <code>BatchImportFindings</code> cannot be used to update the following finding fields and objects, which Security Hub customers use to manage their investigation workflow.</p><ul><li><p><code>Confidence</code></p></li><li><p><code>Criticality</code></p></li><li><p><code>Note</code></p></li><li><p><code>RelatedFindings</code></p></li><li><p><code>Severity</code></p></li><li><p><code>Types</code></p></li><li><p><code>UserDefinedFields</code></p></li><li><p><code>VerificationState</code></p></li><li><p><code>Workflow</code></p></li></ul>
 
 @param request A container for the necessary parameters to execute the BatchImportFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorInvalidAccess`.
 
 @see AWSsecurityhubBatchImportFindingsRequest
 @see AWSsecurityhubBatchImportFindingsResponse
 */
- (void)batchImportFindings:(AWSsecurityhubBatchImportFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubBatchImportFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Used by Security Hub customers to update information about their investigation into a finding. Requested by master accounts or member accounts. Master accounts can update findings for their account and their member accounts. Member accounts can update findings for their account.</p><p>Updates from <code>BatchUpdateFindings</code> do not affect the value of <code>UpdatedAt</code> for a finding.</p><p>Master accounts can use <code>BatchUpdateFindings</code> to update the following finding fields and objects.</p><ul><li><p><code>Confidence</code></p></li><li><p><code>Criticality</code></p></li><li><p><code>Note</code></p></li><li><p><code>RelatedFindings</code></p></li><li><p><code>Severity</code></p></li><li><p><code>Types</code></p></li><li><p><code>UserDefinedFields</code></p></li><li><p><code>VerificationState</code></p></li><li><p><code>Workflow</code></p></li></ul><p>Member accounts can only use <code>BatchUpdateFindings</code> to update the Note object.</p>
 
 @param request A container for the necessary parameters to execute the BatchUpdateFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubBatchUpdateFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorInvalidAccess`.
 
 @see AWSsecurityhubBatchUpdateFindingsRequest
 @see AWSsecurityhubBatchUpdateFindingsResponse
 */
- (AWSTask<AWSsecurityhubBatchUpdateFindingsResponse *> *)batchUpdateFindings:(AWSsecurityhubBatchUpdateFindingsRequest *)request;

/**
 <p>Used by Security Hub customers to update information about their investigation into a finding. Requested by master accounts or member accounts. Master accounts can update findings for their account and their member accounts. Member accounts can update findings for their account.</p><p>Updates from <code>BatchUpdateFindings</code> do not affect the value of <code>UpdatedAt</code> for a finding.</p><p>Master accounts can use <code>BatchUpdateFindings</code> to update the following finding fields and objects.</p><ul><li><p><code>Confidence</code></p></li><li><p><code>Criticality</code></p></li><li><p><code>Note</code></p></li><li><p><code>RelatedFindings</code></p></li><li><p><code>Severity</code></p></li><li><p><code>Types</code></p></li><li><p><code>UserDefinedFields</code></p></li><li><p><code>VerificationState</code></p></li><li><p><code>Workflow</code></p></li></ul><p>Member accounts can only use <code>BatchUpdateFindings</code> to update the Note object.</p>
 
 @param request A container for the necessary parameters to execute the BatchUpdateFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorInvalidAccess`.
 
 @see AWSsecurityhubBatchUpdateFindingsRequest
 @see AWSsecurityhubBatchUpdateFindingsResponse
 */
- (void)batchUpdateFindings:(AWSsecurityhubBatchUpdateFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubBatchUpdateFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a custom action target in Security Hub.</p><p>You can use custom actions on findings and insights in Security Hub to trigger target actions in Amazon CloudWatch Events.</p>
 
 @param request A container for the necessary parameters to execute the CreateActionTarget service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubCreateActionTargetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceConflict`.
 
 @see AWSsecurityhubCreateActionTargetRequest
 @see AWSsecurityhubCreateActionTargetResponse
 */
- (AWSTask<AWSsecurityhubCreateActionTargetResponse *> *)createActionTarget:(AWSsecurityhubCreateActionTargetRequest *)request;

/**
 <p>Creates a custom action target in Security Hub.</p><p>You can use custom actions on findings and insights in Security Hub to trigger target actions in Amazon CloudWatch Events.</p>
 
 @param request A container for the necessary parameters to execute the CreateActionTarget service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceConflict`.
 
 @see AWSsecurityhubCreateActionTargetRequest
 @see AWSsecurityhubCreateActionTargetResponse
 */
- (void)createActionTarget:(AWSsecurityhubCreateActionTargetRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubCreateActionTargetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a custom insight in Security Hub. An insight is a consolidation of findings that relate to a security issue that requires attention or remediation.</p><p>To group the related findings in the insight, use the <code>GroupByAttribute</code>.</p>
 
 @param request A container for the necessary parameters to execute the CreateInsight service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubCreateInsightResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorResourceConflict`.
 
 @see AWSsecurityhubCreateInsightRequest
 @see AWSsecurityhubCreateInsightResponse
 */
- (AWSTask<AWSsecurityhubCreateInsightResponse *> *)createInsight:(AWSsecurityhubCreateInsightRequest *)request;

/**
 <p>Creates a custom insight in Security Hub. An insight is a consolidation of findings that relate to a security issue that requires attention or remediation.</p><p>To group the related findings in the insight, use the <code>GroupByAttribute</code>.</p>
 
 @param request A container for the necessary parameters to execute the CreateInsight service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorResourceConflict`.
 
 @see AWSsecurityhubCreateInsightRequest
 @see AWSsecurityhubCreateInsightResponse
 */
- (void)createInsight:(AWSsecurityhubCreateInsightRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubCreateInsightResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a member association in Security Hub between the specified accounts and the account used to make the request, which is the master account. To successfully create a member, you must use this action from an account that already has Security Hub enabled. To enable Security Hub, you can use the <code><a>EnableSecurityHub</a></code> operation.</p><p>After you use <code>CreateMembers</code> to create member account associations in Security Hub, you must use the <code><a>InviteMembers</a></code> operation to invite the accounts to enable Security Hub and become member accounts in Security Hub.</p><p>If the account owner accepts the invitation, the account becomes a member account in Security Hub, and a permission policy is added that permits the master account to view the findings generated in the member account. When Security Hub is enabled in the invited account, findings start to be sent to both the member and master accounts.</p><p>To remove the association between the master and member accounts, use the <code><a>DisassociateFromMasterAccount</a></code> or <code><a>DisassociateMembers</a></code> operation.</p>
 
 @param request A container for the necessary parameters to execute the CreateMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubCreateMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorResourceConflict`.
 
 @see AWSsecurityhubCreateMembersRequest
 @see AWSsecurityhubCreateMembersResponse
 */
- (AWSTask<AWSsecurityhubCreateMembersResponse *> *)createMembers:(AWSsecurityhubCreateMembersRequest *)request;

/**
 <p>Creates a member association in Security Hub between the specified accounts and the account used to make the request, which is the master account. To successfully create a member, you must use this action from an account that already has Security Hub enabled. To enable Security Hub, you can use the <code><a>EnableSecurityHub</a></code> operation.</p><p>After you use <code>CreateMembers</code> to create member account associations in Security Hub, you must use the <code><a>InviteMembers</a></code> operation to invite the accounts to enable Security Hub and become member accounts in Security Hub.</p><p>If the account owner accepts the invitation, the account becomes a member account in Security Hub, and a permission policy is added that permits the master account to view the findings generated in the member account. When Security Hub is enabled in the invited account, findings start to be sent to both the member and master accounts.</p><p>To remove the association between the master and member accounts, use the <code><a>DisassociateFromMasterAccount</a></code> or <code><a>DisassociateMembers</a></code> operation.</p>
 
 @param request A container for the necessary parameters to execute the CreateMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorResourceConflict`.
 
 @see AWSsecurityhubCreateMembersRequest
 @see AWSsecurityhubCreateMembersResponse
 */
- (void)createMembers:(AWSsecurityhubCreateMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubCreateMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Declines invitations to become a member account.</p>
 
 @param request A container for the necessary parameters to execute the DeclineInvitations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubDeclineInvitationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubDeclineInvitationsRequest
 @see AWSsecurityhubDeclineInvitationsResponse
 */
- (AWSTask<AWSsecurityhubDeclineInvitationsResponse *> *)declineInvitations:(AWSsecurityhubDeclineInvitationsRequest *)request;

/**
 <p>Declines invitations to become a member account.</p>
 
 @param request A container for the necessary parameters to execute the DeclineInvitations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubDeclineInvitationsRequest
 @see AWSsecurityhubDeclineInvitationsResponse
 */
- (void)declineInvitations:(AWSsecurityhubDeclineInvitationsRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubDeclineInvitationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a custom action target from Security Hub.</p><p>Deleting a custom action target does not affect any findings or insights that were already sent to Amazon CloudWatch Events using the custom action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteActionTarget service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubDeleteActionTargetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubDeleteActionTargetRequest
 @see AWSsecurityhubDeleteActionTargetResponse
 */
- (AWSTask<AWSsecurityhubDeleteActionTargetResponse *> *)deleteActionTarget:(AWSsecurityhubDeleteActionTargetRequest *)request;

/**
 <p>Deletes a custom action target from Security Hub.</p><p>Deleting a custom action target does not affect any findings or insights that were already sent to Amazon CloudWatch Events using the custom action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteActionTarget service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubDeleteActionTargetRequest
 @see AWSsecurityhubDeleteActionTargetResponse
 */
- (void)deleteActionTarget:(AWSsecurityhubDeleteActionTargetRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubDeleteActionTargetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the insight specified by the <code>InsightArn</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInsight service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubDeleteInsightResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubDeleteInsightRequest
 @see AWSsecurityhubDeleteInsightResponse
 */
- (AWSTask<AWSsecurityhubDeleteInsightResponse *> *)deleteInsight:(AWSsecurityhubDeleteInsightRequest *)request;

/**
 <p>Deletes the insight specified by the <code>InsightArn</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInsight service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubDeleteInsightRequest
 @see AWSsecurityhubDeleteInsightResponse
 */
- (void)deleteInsight:(AWSsecurityhubDeleteInsightRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubDeleteInsightResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes invitations received by the AWS account to become a member account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInvitations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubDeleteInvitationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceNotFound`, `AWSsecurityhubErrorInvalidAccess`.
 
 @see AWSsecurityhubDeleteInvitationsRequest
 @see AWSsecurityhubDeleteInvitationsResponse
 */
- (AWSTask<AWSsecurityhubDeleteInvitationsResponse *> *)deleteInvitations:(AWSsecurityhubDeleteInvitationsRequest *)request;

/**
 <p>Deletes invitations received by the AWS account to become a member account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInvitations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceNotFound`, `AWSsecurityhubErrorInvalidAccess`.
 
 @see AWSsecurityhubDeleteInvitationsRequest
 @see AWSsecurityhubDeleteInvitationsResponse
 */
- (void)deleteInvitations:(AWSsecurityhubDeleteInvitationsRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubDeleteInvitationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified member accounts from Security Hub.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubDeleteMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubDeleteMembersRequest
 @see AWSsecurityhubDeleteMembersResponse
 */
- (AWSTask<AWSsecurityhubDeleteMembersResponse *> *)deleteMembers:(AWSsecurityhubDeleteMembersRequest *)request;

/**
 <p>Deletes the specified member accounts from Security Hub.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubDeleteMembersRequest
 @see AWSsecurityhubDeleteMembersResponse
 */
- (void)deleteMembers:(AWSsecurityhubDeleteMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubDeleteMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the custom action targets in Security Hub in your account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeActionTargets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubDescribeActionTargetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubDescribeActionTargetsRequest
 @see AWSsecurityhubDescribeActionTargetsResponse
 */
- (AWSTask<AWSsecurityhubDescribeActionTargetsResponse *> *)describeActionTargets:(AWSsecurityhubDescribeActionTargetsRequest *)request;

/**
 <p>Returns a list of the custom action targets in Security Hub in your account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeActionTargets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubDescribeActionTargetsRequest
 @see AWSsecurityhubDescribeActionTargetsResponse
 */
- (void)describeActionTargets:(AWSsecurityhubDescribeActionTargetsRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubDescribeActionTargetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns details about the Hub resource in your account, including the <code>HubArn</code> and the time when you enabled Security Hub.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHub service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubDescribeHubResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubDescribeHubRequest
 @see AWSsecurityhubDescribeHubResponse
 */
- (AWSTask<AWSsecurityhubDescribeHubResponse *> *)describeHub:(AWSsecurityhubDescribeHubRequest *)request;

/**
 <p>Returns details about the Hub resource in your account, including the <code>HubArn</code> and the time when you enabled Security Hub.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHub service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubDescribeHubRequest
 @see AWSsecurityhubDescribeHubResponse
 */
- (void)describeHub:(AWSsecurityhubDescribeHubRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubDescribeHubResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the available products that you can subscribe to and integrate with Security Hub in order to consolidate findings.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProducts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubDescribeProductsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorInvalidInput`.
 
 @see AWSsecurityhubDescribeProductsRequest
 @see AWSsecurityhubDescribeProductsResponse
 */
- (AWSTask<AWSsecurityhubDescribeProductsResponse *> *)describeProducts:(AWSsecurityhubDescribeProductsRequest *)request;

/**
 <p>Returns information about the available products that you can subscribe to and integrate with Security Hub in order to consolidate findings.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProducts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorInvalidInput`.
 
 @see AWSsecurityhubDescribeProductsRequest
 @see AWSsecurityhubDescribeProductsResponse
 */
- (void)describeProducts:(AWSsecurityhubDescribeProductsRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubDescribeProductsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the available standards in Security Hub.</p><p>For each standard, the results include the standard ARN, the name, and a description. </p>
 
 @param request A container for the necessary parameters to execute the DescribeStandards service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubDescribeStandardsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`.
 
 @see AWSsecurityhubDescribeStandardsRequest
 @see AWSsecurityhubDescribeStandardsResponse
 */
- (AWSTask<AWSsecurityhubDescribeStandardsResponse *> *)describeStandards:(AWSsecurityhubDescribeStandardsRequest *)request;

/**
 <p>Returns a list of the available standards in Security Hub.</p><p>For each standard, the results include the standard ARN, the name, and a description. </p>
 
 @param request A container for the necessary parameters to execute the DescribeStandards service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`.
 
 @see AWSsecurityhubDescribeStandardsRequest
 @see AWSsecurityhubDescribeStandardsResponse
 */
- (void)describeStandards:(AWSsecurityhubDescribeStandardsRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubDescribeStandardsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of security standards controls.</p><p>For each control, the results include information about whether it is currently enabled, the severity, and a link to remediation information.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStandardsControls service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubDescribeStandardsControlsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubDescribeStandardsControlsRequest
 @see AWSsecurityhubDescribeStandardsControlsResponse
 */
- (AWSTask<AWSsecurityhubDescribeStandardsControlsResponse *> *)describeStandardsControls:(AWSsecurityhubDescribeStandardsControlsRequest *)request;

/**
 <p>Returns a list of security standards controls.</p><p>For each control, the results include information about whether it is currently enabled, the severity, and a link to remediation information.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStandardsControls service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubDescribeStandardsControlsRequest
 @see AWSsecurityhubDescribeStandardsControlsResponse
 */
- (void)describeStandardsControls:(AWSsecurityhubDescribeStandardsControlsRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubDescribeStandardsControlsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables the integration of the specified product with Security Hub. After the integration is disabled, findings from that product are no longer sent to Security Hub.</p>
 
 @param request A container for the necessary parameters to execute the DisableImportFindingsForProduct service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubDisableImportFindingsForProductResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorResourceNotFound`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`.
 
 @see AWSsecurityhubDisableImportFindingsForProductRequest
 @see AWSsecurityhubDisableImportFindingsForProductResponse
 */
- (AWSTask<AWSsecurityhubDisableImportFindingsForProductResponse *> *)disableImportFindingsForProduct:(AWSsecurityhubDisableImportFindingsForProductRequest *)request;

/**
 <p>Disables the integration of the specified product with Security Hub. After the integration is disabled, findings from that product are no longer sent to Security Hub.</p>
 
 @param request A container for the necessary parameters to execute the DisableImportFindingsForProduct service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorResourceNotFound`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`.
 
 @see AWSsecurityhubDisableImportFindingsForProductRequest
 @see AWSsecurityhubDisableImportFindingsForProductResponse
 */
- (void)disableImportFindingsForProduct:(AWSsecurityhubDisableImportFindingsForProductRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubDisableImportFindingsForProductResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables Security Hub in your account only in the current Region. To disable Security Hub in all Regions, you must submit one request per Region where you have enabled Security Hub.</p><p>When you disable Security Hub for a master account, it doesn't disable Security Hub for any associated member accounts.</p><p>When you disable Security Hub, your existing findings and insights and any Security Hub configuration settings are deleted after 90 days and cannot be recovered. Any standards that were enabled are disabled, and your master and member account associations are removed.</p><p>If you want to save your existing findings, you must export them before you disable Security Hub.</p>
 
 @param request A container for the necessary parameters to execute the DisableSecurityHub service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubDisableSecurityHubResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubDisableSecurityHubRequest
 @see AWSsecurityhubDisableSecurityHubResponse
 */
- (AWSTask<AWSsecurityhubDisableSecurityHubResponse *> *)disableSecurityHub:(AWSsecurityhubDisableSecurityHubRequest *)request;

/**
 <p>Disables Security Hub in your account only in the current Region. To disable Security Hub in all Regions, you must submit one request per Region where you have enabled Security Hub.</p><p>When you disable Security Hub for a master account, it doesn't disable Security Hub for any associated member accounts.</p><p>When you disable Security Hub, your existing findings and insights and any Security Hub configuration settings are deleted after 90 days and cannot be recovered. Any standards that were enabled are disabled, and your master and member account associations are removed.</p><p>If you want to save your existing findings, you must export them before you disable Security Hub.</p>
 
 @param request A container for the necessary parameters to execute the DisableSecurityHub service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubDisableSecurityHubRequest
 @see AWSsecurityhubDisableSecurityHubResponse
 */
- (void)disableSecurityHub:(AWSsecurityhubDisableSecurityHubRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubDisableSecurityHubResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates the current Security Hub member account from the associated master account.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateFromMasterAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubDisassociateFromMasterAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubDisassociateFromMasterAccountRequest
 @see AWSsecurityhubDisassociateFromMasterAccountResponse
 */
- (AWSTask<AWSsecurityhubDisassociateFromMasterAccountResponse *> *)disassociateFromMasterAccount:(AWSsecurityhubDisassociateFromMasterAccountRequest *)request;

/**
 <p>Disassociates the current Security Hub member account from the associated master account.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateFromMasterAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubDisassociateFromMasterAccountRequest
 @see AWSsecurityhubDisassociateFromMasterAccountResponse
 */
- (void)disassociateFromMasterAccount:(AWSsecurityhubDisassociateFromMasterAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubDisassociateFromMasterAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates the specified member accounts from the associated master account.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubDisassociateMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubDisassociateMembersRequest
 @see AWSsecurityhubDisassociateMembersResponse
 */
- (AWSTask<AWSsecurityhubDisassociateMembersResponse *> *)disassociateMembers:(AWSsecurityhubDisassociateMembersRequest *)request;

/**
 <p>Disassociates the specified member accounts from the associated master account.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubDisassociateMembersRequest
 @see AWSsecurityhubDisassociateMembersResponse
 */
- (void)disassociateMembers:(AWSsecurityhubDisassociateMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubDisassociateMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables the integration of a partner product with Security Hub. Integrated products send findings to Security Hub.</p><p>When you enable a product integration, a permission policy that grants permission for the product to send findings to Security Hub is applied.</p>
 
 @param request A container for the necessary parameters to execute the EnableImportFindingsForProduct service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubEnableImportFindingsForProductResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorResourceConflict`, `AWSsecurityhubErrorLimitExceeded`.
 
 @see AWSsecurityhubEnableImportFindingsForProductRequest
 @see AWSsecurityhubEnableImportFindingsForProductResponse
 */
- (AWSTask<AWSsecurityhubEnableImportFindingsForProductResponse *> *)enableImportFindingsForProduct:(AWSsecurityhubEnableImportFindingsForProductRequest *)request;

/**
 <p>Enables the integration of a partner product with Security Hub. Integrated products send findings to Security Hub.</p><p>When you enable a product integration, a permission policy that grants permission for the product to send findings to Security Hub is applied.</p>
 
 @param request A container for the necessary parameters to execute the EnableImportFindingsForProduct service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorResourceConflict`, `AWSsecurityhubErrorLimitExceeded`.
 
 @see AWSsecurityhubEnableImportFindingsForProductRequest
 @see AWSsecurityhubEnableImportFindingsForProductResponse
 */
- (void)enableImportFindingsForProduct:(AWSsecurityhubEnableImportFindingsForProductRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubEnableImportFindingsForProductResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables Security Hub for your account in the current Region or the Region you specify in the request.</p><p>When you enable Security Hub, you grant to Security Hub the permissions necessary to gather findings from other services that are integrated with Security Hub.</p><p>When you use the <code>EnableSecurityHub</code> operation to enable Security Hub, you also automatically enable the CIS AWS Foundations standard. You do not enable the Payment Card Industry Data Security Standard (PCI DSS) standard. To not enable the CIS AWS Foundations standard, set <code>EnableDefaultStandards</code> to <code>false</code>.</p><p>After you enable Security Hub, to enable a standard, use the <code><a>BatchEnableStandards</a></code> operation. To disable a standard, use the <code><a>BatchDisableStandards</a></code> operation.</p><p>To learn more, see <a href="https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-settingup.html">Setting Up AWS Security Hub</a> in the <i>AWS Security Hub User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the EnableSecurityHub service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubEnableSecurityHubResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorResourceConflict`, `AWSsecurityhubErrorAccessDenied`.
 
 @see AWSsecurityhubEnableSecurityHubRequest
 @see AWSsecurityhubEnableSecurityHubResponse
 */
- (AWSTask<AWSsecurityhubEnableSecurityHubResponse *> *)enableSecurityHub:(AWSsecurityhubEnableSecurityHubRequest *)request;

/**
 <p>Enables Security Hub for your account in the current Region or the Region you specify in the request.</p><p>When you enable Security Hub, you grant to Security Hub the permissions necessary to gather findings from other services that are integrated with Security Hub.</p><p>When you use the <code>EnableSecurityHub</code> operation to enable Security Hub, you also automatically enable the CIS AWS Foundations standard. You do not enable the Payment Card Industry Data Security Standard (PCI DSS) standard. To not enable the CIS AWS Foundations standard, set <code>EnableDefaultStandards</code> to <code>false</code>.</p><p>After you enable Security Hub, to enable a standard, use the <code><a>BatchEnableStandards</a></code> operation. To disable a standard, use the <code><a>BatchDisableStandards</a></code> operation.</p><p>To learn more, see <a href="https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-settingup.html">Setting Up AWS Security Hub</a> in the <i>AWS Security Hub User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the EnableSecurityHub service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorResourceConflict`, `AWSsecurityhubErrorAccessDenied`.
 
 @see AWSsecurityhubEnableSecurityHubRequest
 @see AWSsecurityhubEnableSecurityHubResponse
 */
- (void)enableSecurityHub:(AWSsecurityhubEnableSecurityHubRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubEnableSecurityHubResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the standards that are currently enabled.</p>
 
 @param request A container for the necessary parameters to execute the GetEnabledStandards service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubGetEnabledStandardsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`.
 
 @see AWSsecurityhubGetEnabledStandardsRequest
 @see AWSsecurityhubGetEnabledStandardsResponse
 */
- (AWSTask<AWSsecurityhubGetEnabledStandardsResponse *> *)getEnabledStandards:(AWSsecurityhubGetEnabledStandardsRequest *)request;

/**
 <p>Returns a list of the standards that are currently enabled.</p>
 
 @param request A container for the necessary parameters to execute the GetEnabledStandards service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`.
 
 @see AWSsecurityhubGetEnabledStandardsRequest
 @see AWSsecurityhubGetEnabledStandardsResponse
 */
- (void)getEnabledStandards:(AWSsecurityhubGetEnabledStandardsRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubGetEnabledStandardsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of findings that match the specified criteria.</p>
 
 @param request A container for the necessary parameters to execute the GetFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubGetFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`.
 
 @see AWSsecurityhubGetFindingsRequest
 @see AWSsecurityhubGetFindingsResponse
 */
- (AWSTask<AWSsecurityhubGetFindingsResponse *> *)getFindings:(AWSsecurityhubGetFindingsRequest *)request;

/**
 <p>Returns a list of findings that match the specified criteria.</p>
 
 @param request A container for the necessary parameters to execute the GetFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`.
 
 @see AWSsecurityhubGetFindingsRequest
 @see AWSsecurityhubGetFindingsResponse
 */
- (void)getFindings:(AWSsecurityhubGetFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubGetFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the results of the Security Hub insight specified by the insight ARN.</p>
 
 @param request A container for the necessary parameters to execute the GetInsightResults service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubGetInsightResultsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubGetInsightResultsRequest
 @see AWSsecurityhubGetInsightResultsResponse
 */
- (AWSTask<AWSsecurityhubGetInsightResultsResponse *> *)getInsightResults:(AWSsecurityhubGetInsightResultsRequest *)request;

/**
 <p>Lists the results of the Security Hub insight specified by the insight ARN.</p>
 
 @param request A container for the necessary parameters to execute the GetInsightResults service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubGetInsightResultsRequest
 @see AWSsecurityhubGetInsightResultsResponse
 */
- (void)getInsightResults:(AWSsecurityhubGetInsightResultsRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubGetInsightResultsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists and describes insights for the specified insight ARNs.</p>
 
 @param request A container for the necessary parameters to execute the GetInsights service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubGetInsightsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubGetInsightsRequest
 @see AWSsecurityhubGetInsightsResponse
 */
- (AWSTask<AWSsecurityhubGetInsightsResponse *> *)getInsights:(AWSsecurityhubGetInsightsRequest *)request;

/**
 <p>Lists and describes insights for the specified insight ARNs.</p>
 
 @param request A container for the necessary parameters to execute the GetInsights service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubGetInsightsRequest
 @see AWSsecurityhubGetInsightsResponse
 */
- (void)getInsights:(AWSsecurityhubGetInsightsRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubGetInsightsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the count of all Security Hub membership invitations that were sent to the current member account, not including the currently accepted invitation. </p>
 
 @param request A container for the necessary parameters to execute the GetInvitationsCount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubGetInvitationsCountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`.
 
 @see AWSsecurityhubGetInvitationsCountRequest
 @see AWSsecurityhubGetInvitationsCountResponse
 */
- (AWSTask<AWSsecurityhubGetInvitationsCountResponse *> *)getInvitationsCount:(AWSsecurityhubGetInvitationsCountRequest *)request;

/**
 <p>Returns the count of all Security Hub membership invitations that were sent to the current member account, not including the currently accepted invitation. </p>
 
 @param request A container for the necessary parameters to execute the GetInvitationsCount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`.
 
 @see AWSsecurityhubGetInvitationsCountRequest
 @see AWSsecurityhubGetInvitationsCountResponse
 */
- (void)getInvitationsCount:(AWSsecurityhubGetInvitationsCountRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubGetInvitationsCountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides the details for the Security Hub master account for the current member account. </p>
 
 @param request A container for the necessary parameters to execute the GetMasterAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubGetMasterAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubGetMasterAccountRequest
 @see AWSsecurityhubGetMasterAccountResponse
 */
- (AWSTask<AWSsecurityhubGetMasterAccountResponse *> *)getMasterAccount:(AWSsecurityhubGetMasterAccountRequest *)request;

/**
 <p>Provides the details for the Security Hub master account for the current member account. </p>
 
 @param request A container for the necessary parameters to execute the GetMasterAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubGetMasterAccountRequest
 @see AWSsecurityhubGetMasterAccountResponse
 */
- (void)getMasterAccount:(AWSsecurityhubGetMasterAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubGetMasterAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the details for the Security Hub member accounts for the specified account IDs.</p>
 
 @param request A container for the necessary parameters to execute the GetMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubGetMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubGetMembersRequest
 @see AWSsecurityhubGetMembersResponse
 */
- (AWSTask<AWSsecurityhubGetMembersResponse *> *)getMembers:(AWSsecurityhubGetMembersRequest *)request;

/**
 <p>Returns the details for the Security Hub member accounts for the specified account IDs.</p>
 
 @param request A container for the necessary parameters to execute the GetMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubGetMembersRequest
 @see AWSsecurityhubGetMembersResponse
 */
- (void)getMembers:(AWSsecurityhubGetMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubGetMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Invites other AWS accounts to become member accounts for the Security Hub master account that the invitation is sent from.</p><p>Before you can use this action to invite a member, you must first use the <code><a>CreateMembers</a></code> action to create the member account in Security Hub.</p><p>When the account owner accepts the invitation to become a member account and enables Security Hub, the master account can view the findings generated from the member account.</p>
 
 @param request A container for the necessary parameters to execute the InviteMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubInviteMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubInviteMembersRequest
 @see AWSsecurityhubInviteMembersResponse
 */
- (AWSTask<AWSsecurityhubInviteMembersResponse *> *)inviteMembers:(AWSsecurityhubInviteMembersRequest *)request;

/**
 <p>Invites other AWS accounts to become member accounts for the Security Hub master account that the invitation is sent from.</p><p>Before you can use this action to invite a member, you must first use the <code><a>CreateMembers</a></code> action to create the member account in Security Hub.</p><p>When the account owner accepts the invitation to become a member account and enables Security Hub, the master account can view the findings generated from the member account.</p>
 
 @param request A container for the necessary parameters to execute the InviteMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubInviteMembersRequest
 @see AWSsecurityhubInviteMembersResponse
 */
- (void)inviteMembers:(AWSsecurityhubInviteMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubInviteMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all findings-generating solutions (products) that you are subscribed to receive findings from in Security Hub.</p>
 
 @param request A container for the necessary parameters to execute the ListEnabledProductsForImport service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubListEnabledProductsForImportResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorInvalidAccess`.
 
 @see AWSsecurityhubListEnabledProductsForImportRequest
 @see AWSsecurityhubListEnabledProductsForImportResponse
 */
- (AWSTask<AWSsecurityhubListEnabledProductsForImportResponse *> *)listEnabledProductsForImport:(AWSsecurityhubListEnabledProductsForImportRequest *)request;

/**
 <p>Lists all findings-generating solutions (products) that you are subscribed to receive findings from in Security Hub.</p>
 
 @param request A container for the necessary parameters to execute the ListEnabledProductsForImport service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorInvalidAccess`.
 
 @see AWSsecurityhubListEnabledProductsForImportRequest
 @see AWSsecurityhubListEnabledProductsForImportResponse
 */
- (void)listEnabledProductsForImport:(AWSsecurityhubListEnabledProductsForImportRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubListEnabledProductsForImportResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all Security Hub membership invitations that were sent to the current AWS account. </p>
 
 @param request A container for the necessary parameters to execute the ListInvitations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubListInvitationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`.
 
 @see AWSsecurityhubListInvitationsRequest
 @see AWSsecurityhubListInvitationsResponse
 */
- (AWSTask<AWSsecurityhubListInvitationsResponse *> *)listInvitations:(AWSsecurityhubListInvitationsRequest *)request;

/**
 <p>Lists all Security Hub membership invitations that were sent to the current AWS account. </p>
 
 @param request A container for the necessary parameters to execute the ListInvitations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`.
 
 @see AWSsecurityhubListInvitationsRequest
 @see AWSsecurityhubListInvitationsResponse
 */
- (void)listInvitations:(AWSsecurityhubListInvitationsRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubListInvitationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists details about all member accounts for the current Security Hub master account.</p>
 
 @param request A container for the necessary parameters to execute the ListMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubListMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`.
 
 @see AWSsecurityhubListMembersRequest
 @see AWSsecurityhubListMembersResponse
 */
- (AWSTask<AWSsecurityhubListMembersResponse *> *)listMembers:(AWSsecurityhubListMembersRequest *)request;

/**
 <p>Lists details about all member accounts for the current Security Hub master account.</p>
 
 @param request A container for the necessary parameters to execute the ListMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`.
 
 @see AWSsecurityhubListMembersRequest
 @see AWSsecurityhubListMembersResponse
 */
- (void)listMembers:(AWSsecurityhubListMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubListMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of tags associated with a resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubListTagsForResourceRequest
 @see AWSsecurityhubListTagsForResourceResponse
 */
- (AWSTask<AWSsecurityhubListTagsForResourceResponse *> *)listTagsForResource:(AWSsecurityhubListTagsForResourceRequest *)request;

/**
 <p>Returns a list of tags associated with a resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubListTagsForResourceRequest
 @see AWSsecurityhubListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSsecurityhubListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds one or more tags to a resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubTagResourceRequest
 @see AWSsecurityhubTagResourceResponse
 */
- (AWSTask<AWSsecurityhubTagResourceResponse *> *)tagResource:(AWSsecurityhubTagResourceRequest *)request;

/**
 <p>Adds one or more tags to a resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubTagResourceRequest
 @see AWSsecurityhubTagResourceResponse
 */
- (void)tagResource:(AWSsecurityhubTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes one or more tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubUntagResourceRequest
 @see AWSsecurityhubUntagResourceResponse
 */
- (AWSTask<AWSsecurityhubUntagResourceResponse *> *)untagResource:(AWSsecurityhubUntagResourceRequest *)request;

/**
 <p>Removes one or more tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubUntagResourceRequest
 @see AWSsecurityhubUntagResourceResponse
 */
- (void)untagResource:(AWSsecurityhubUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the name and description of a custom action target in Security Hub.</p>
 
 @param request A container for the necessary parameters to execute the UpdateActionTarget service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubUpdateActionTargetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorResourceNotFound`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubUpdateActionTargetRequest
 @see AWSsecurityhubUpdateActionTargetResponse
 */
- (AWSTask<AWSsecurityhubUpdateActionTargetResponse *> *)updateActionTarget:(AWSsecurityhubUpdateActionTargetRequest *)request;

/**
 <p>Updates the name and description of a custom action target in Security Hub.</p>
 
 @param request A container for the necessary parameters to execute the UpdateActionTarget service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorResourceNotFound`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubUpdateActionTargetRequest
 @see AWSsecurityhubUpdateActionTargetResponse
 */
- (void)updateActionTarget:(AWSsecurityhubUpdateActionTargetRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubUpdateActionTargetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p><code>UpdateFindings</code> is deprecated. Instead of <code>UpdateFindings</code>, use <code>BatchUpdateFindings</code>.</p><p>Updates the <code>Note</code> and <code>RecordState</code> of the Security Hub-aggregated findings that the filter attributes specify. Any member account that can view the finding also sees the update to the finding.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubUpdateFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubUpdateFindingsRequest
 @see AWSsecurityhubUpdateFindingsResponse
 */
- (AWSTask<AWSsecurityhubUpdateFindingsResponse *> *)updateFindings:(AWSsecurityhubUpdateFindingsRequest *)request;

/**
 <p><code>UpdateFindings</code> is deprecated. Instead of <code>UpdateFindings</code>, use <code>BatchUpdateFindings</code>.</p><p>Updates the <code>Note</code> and <code>RecordState</code> of the Security Hub-aggregated findings that the filter attributes specify. Any member account that can view the finding also sees the update to the finding.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubUpdateFindingsRequest
 @see AWSsecurityhubUpdateFindingsResponse
 */
- (void)updateFindings:(AWSsecurityhubUpdateFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubUpdateFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the Security Hub insight identified by the specified insight ARN.</p>
 
 @param request A container for the necessary parameters to execute the UpdateInsight service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubUpdateInsightResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubUpdateInsightRequest
 @see AWSsecurityhubUpdateInsightResponse
 */
- (AWSTask<AWSsecurityhubUpdateInsightResponse *> *)updateInsight:(AWSsecurityhubUpdateInsightRequest *)request;

/**
 <p>Updates the Security Hub insight identified by the specified insight ARN.</p>
 
 @param request A container for the necessary parameters to execute the UpdateInsight service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorLimitExceeded`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubUpdateInsightRequest
 @see AWSsecurityhubUpdateInsightResponse
 */
- (void)updateInsight:(AWSsecurityhubUpdateInsightRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubUpdateInsightResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Used to control whether an individual security standard control is enabled or disabled.</p>
 
 @param request A container for the necessary parameters to execute the UpdateStandardsControl service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsecurityhubUpdateStandardsControlResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubUpdateStandardsControlRequest
 @see AWSsecurityhubUpdateStandardsControlResponse
 */
- (AWSTask<AWSsecurityhubUpdateStandardsControlResponse *> *)updateStandardsControl:(AWSsecurityhubUpdateStandardsControlRequest *)request;

/**
 <p>Used to control whether an individual security standard control is enabled or disabled.</p>
 
 @param request A container for the necessary parameters to execute the UpdateStandardsControl service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsecurityhubErrorDomain` domain and the following error code: `AWSsecurityhubErrorInternal`, `AWSsecurityhubErrorInvalidInput`, `AWSsecurityhubErrorInvalidAccess`, `AWSsecurityhubErrorResourceNotFound`.
 
 @see AWSsecurityhubUpdateStandardsControlRequest
 @see AWSsecurityhubUpdateStandardsControlResponse
 */
- (void)updateStandardsControl:(AWSsecurityhubUpdateStandardsControlRequest *)request completionHandler:(void (^ _Nullable)(AWSsecurityhubUpdateStandardsControlResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
