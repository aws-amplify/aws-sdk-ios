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
#import "AWSSecurityhubModel.h"
#import "AWSSecurityhubResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSSecurityhub
FOUNDATION_EXPORT NSString *const AWSSecurityhubSDKVersion;

/**
 <p>Security Hub provides you with a comprehensive view of the security state of your AWS environment and resources. It also provides you with the readiness status of your environment based on controls from supported security standards. Security Hub collects security data from AWS accounts, services, and integrated third-party products and helps you analyze security trends in your environment to identify the highest priority security issues. For more information about Security Hub, see the <i><a href="https://docs.aws.amazon.com/securityhub/latest/userguide/what-is-securityhub.html">AWS Security Hub User Guide</a></i>.</p><p>When you use operations in the Security Hub API, the requests are executed only in the AWS Region that is currently active or in the specific AWS Region that you specify in your request. Any configuration or settings change that results from the operation is applied only to that Region. To make the same change in other Regions, execute the same command for each Region to apply the change to.</p><p>For example, if your Region is set to <code>us-west-2</code>, when you use <code><a>CreateMembers</a></code> to add a member account to Security Hub, the association of the member account with the master account is created only in the <code>us-west-2</code> Region. Security Hub must be enabled for the member account in the same Region that the invitation was sent from.</p><p>The following throttling limits apply to using Security Hub API operations.</p><ul><li><p><code><a>GetFindings</a></code> - <code>RateLimit</code> of 3 requests per second. <code>BurstLimit</code> of 6 requests per second.</p></li><li><p><code><a>UpdateFindings</a></code> - <code>RateLimit</code> of 1 request per second. <code>BurstLimit</code> of 5 requests per second.</p></li><li><p>All other operations - <code>RateLimit</code> of 10 requests per second. <code>BurstLimit</code> of 30 requests per second.</p></li></ul>
 */
@interface AWSSecurityhub : AWSService

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

     let Securityhub = AWSSecurityhub.default()

 *Objective-C*

     AWSSecurityhub *Securityhub = [AWSSecurityhub defaultSecurityhub];

 @return The default service client.
 */
+ (instancetype)defaultSecurityhub;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSecurityhub.register(with: configuration!, forKey: "USWest2Securityhub")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:@"USWest2Securityhub"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Securityhub = AWSSecurityhub(forKey: "USWest2Securityhub")

 *Objective-C*

     AWSSecurityhub *Securityhub = [AWSSecurityhub SecurityhubForKey:@"USWest2Securityhub"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerSecurityhubWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerSecurityhubWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSecurityhub.register(with: configuration!, forKey: "USWest2Securityhub")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:@"USWest2Securityhub"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Securityhub = AWSSecurityhub(forKey: "USWest2Securityhub")

 *Objective-C*

     AWSSecurityhub *Securityhub = [AWSSecurityhub SecurityhubForKey:@"USWest2Securityhub"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)SecurityhubForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeSecurityhubForKey:(NSString *)key;

/**
 <p>Accepts the invitation to be a member account and be monitored by the Security Hub master account that the invitation was sent from.</p><p>When the member account accepts the invitation, permission is granted to the master account to view findings generated in the member account.</p>
 
 @param request A container for the necessary parameters to execute the AcceptInvitation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubAcceptInvitationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceNotFound`, `AWSSecurityhubErrorInvalidAccess`.
 
 @see AWSSecurityhubAcceptInvitationRequest
 @see AWSSecurityhubAcceptInvitationResponse
 */
- (AWSTask<AWSSecurityhubAcceptInvitationResponse *> *)acceptInvitation:(AWSSecurityhubAcceptInvitationRequest *)request;

/**
 <p>Accepts the invitation to be a member account and be monitored by the Security Hub master account that the invitation was sent from.</p><p>When the member account accepts the invitation, permission is granted to the master account to view findings generated in the member account.</p>
 
 @param request A container for the necessary parameters to execute the AcceptInvitation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceNotFound`, `AWSSecurityhubErrorInvalidAccess`.
 
 @see AWSSecurityhubAcceptInvitationRequest
 @see AWSSecurityhubAcceptInvitationResponse
 */
- (void)acceptInvitation:(AWSSecurityhubAcceptInvitationRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubAcceptInvitationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables the standards specified by the provided <code>StandardsSubscriptionArns</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards.html">Security Standards</a> section of the <i>AWS Security Hub User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the BatchDisableStandards service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubBatchDisableStandardsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`.
 
 @see AWSSecurityhubBatchDisableStandardsRequest
 @see AWSSecurityhubBatchDisableStandardsResponse
 */
- (AWSTask<AWSSecurityhubBatchDisableStandardsResponse *> *)batchDisableStandards:(AWSSecurityhubBatchDisableStandardsRequest *)request;

/**
 <p>Disables the standards specified by the provided <code>StandardsSubscriptionArns</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards.html">Security Standards</a> section of the <i>AWS Security Hub User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the BatchDisableStandards service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`.
 
 @see AWSSecurityhubBatchDisableStandardsRequest
 @see AWSSecurityhubBatchDisableStandardsResponse
 */
- (void)batchDisableStandards:(AWSSecurityhubBatchDisableStandardsRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubBatchDisableStandardsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables the standards specified by the provided <code>StandardsArn</code>. To obtain the ARN for a standard, use the <code><a>DescribeStandards</a></code> operation.</p><p>For more information, see the <a href="https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards.html">Security Standards</a> section of the <i>AWS Security Hub User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the BatchEnableStandards service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubBatchEnableStandardsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`.
 
 @see AWSSecurityhubBatchEnableStandardsRequest
 @see AWSSecurityhubBatchEnableStandardsResponse
 */
- (AWSTask<AWSSecurityhubBatchEnableStandardsResponse *> *)batchEnableStandards:(AWSSecurityhubBatchEnableStandardsRequest *)request;

/**
 <p>Enables the standards specified by the provided <code>StandardsArn</code>. To obtain the ARN for a standard, use the <code><a>DescribeStandards</a></code> operation.</p><p>For more information, see the <a href="https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards.html">Security Standards</a> section of the <i>AWS Security Hub User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the BatchEnableStandards service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`.
 
 @see AWSSecurityhubBatchEnableStandardsRequest
 @see AWSSecurityhubBatchEnableStandardsResponse
 */
- (void)batchEnableStandards:(AWSSecurityhubBatchEnableStandardsRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubBatchEnableStandardsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Imports security findings generated from an integrated third-party product into Security Hub. This action is requested by the integrated product to import its findings into Security Hub.</p><p>The maximum allowed size for a finding is 240 Kb. An error is returned for any finding larger than 240 Kb.</p><p>After a finding is created, <code>BatchImportFindings</code> cannot be used to update the following finding fields and objects, which Security Hub customers use to manage their investigation workflow.</p><ul><li><p><code>Confidence</code></p></li><li><p><code>Criticality</code></p></li><li><p><code>Note</code></p></li><li><p><code>RelatedFindings</code></p></li><li><p><code>Severity</code></p></li><li><p><code>Types</code></p></li><li><p><code>UserDefinedFields</code></p></li><li><p><code>VerificationState</code></p></li><li><p><code>Workflow</code></p></li></ul>
 
 @param request A container for the necessary parameters to execute the BatchImportFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubBatchImportFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorInvalidAccess`.
 
 @see AWSSecurityhubBatchImportFindingsRequest
 @see AWSSecurityhubBatchImportFindingsResponse
 */
- (AWSTask<AWSSecurityhubBatchImportFindingsResponse *> *)batchImportFindings:(AWSSecurityhubBatchImportFindingsRequest *)request;

/**
 <p>Imports security findings generated from an integrated third-party product into Security Hub. This action is requested by the integrated product to import its findings into Security Hub.</p><p>The maximum allowed size for a finding is 240 Kb. An error is returned for any finding larger than 240 Kb.</p><p>After a finding is created, <code>BatchImportFindings</code> cannot be used to update the following finding fields and objects, which Security Hub customers use to manage their investigation workflow.</p><ul><li><p><code>Confidence</code></p></li><li><p><code>Criticality</code></p></li><li><p><code>Note</code></p></li><li><p><code>RelatedFindings</code></p></li><li><p><code>Severity</code></p></li><li><p><code>Types</code></p></li><li><p><code>UserDefinedFields</code></p></li><li><p><code>VerificationState</code></p></li><li><p><code>Workflow</code></p></li></ul>
 
 @param request A container for the necessary parameters to execute the BatchImportFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorInvalidAccess`.
 
 @see AWSSecurityhubBatchImportFindingsRequest
 @see AWSSecurityhubBatchImportFindingsResponse
 */
- (void)batchImportFindings:(AWSSecurityhubBatchImportFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubBatchImportFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Used by Security Hub customers to update information about their investigation into a finding. Requested by master accounts or member accounts. Master accounts can update findings for their account and their member accounts. Member accounts can update findings for their account.</p><p>Updates from <code>BatchUpdateFindings</code> do not affect the value of <code>UpdatedAt</code> for a finding.</p><p>Master accounts can use <code>BatchUpdateFindings</code> to update the following finding fields and objects.</p><ul><li><p><code>Confidence</code></p></li><li><p><code>Criticality</code></p></li><li><p><code>Note</code></p></li><li><p><code>RelatedFindings</code></p></li><li><p><code>Severity</code></p></li><li><p><code>Types</code></p></li><li><p><code>UserDefinedFields</code></p></li><li><p><code>VerificationState</code></p></li><li><p><code>Workflow</code></p></li></ul><p>Member accounts can only use <code>BatchUpdateFindings</code> to update the Note object.</p>
 
 @param request A container for the necessary parameters to execute the BatchUpdateFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubBatchUpdateFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorInvalidAccess`.
 
 @see AWSSecurityhubBatchUpdateFindingsRequest
 @see AWSSecurityhubBatchUpdateFindingsResponse
 */
- (AWSTask<AWSSecurityhubBatchUpdateFindingsResponse *> *)batchUpdateFindings:(AWSSecurityhubBatchUpdateFindingsRequest *)request;

/**
 <p>Used by Security Hub customers to update information about their investigation into a finding. Requested by master accounts or member accounts. Master accounts can update findings for their account and their member accounts. Member accounts can update findings for their account.</p><p>Updates from <code>BatchUpdateFindings</code> do not affect the value of <code>UpdatedAt</code> for a finding.</p><p>Master accounts can use <code>BatchUpdateFindings</code> to update the following finding fields and objects.</p><ul><li><p><code>Confidence</code></p></li><li><p><code>Criticality</code></p></li><li><p><code>Note</code></p></li><li><p><code>RelatedFindings</code></p></li><li><p><code>Severity</code></p></li><li><p><code>Types</code></p></li><li><p><code>UserDefinedFields</code></p></li><li><p><code>VerificationState</code></p></li><li><p><code>Workflow</code></p></li></ul><p>Member accounts can only use <code>BatchUpdateFindings</code> to update the Note object.</p>
 
 @param request A container for the necessary parameters to execute the BatchUpdateFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorInvalidAccess`.
 
 @see AWSSecurityhubBatchUpdateFindingsRequest
 @see AWSSecurityhubBatchUpdateFindingsResponse
 */
- (void)batchUpdateFindings:(AWSSecurityhubBatchUpdateFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubBatchUpdateFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a custom action target in Security Hub.</p><p>You can use custom actions on findings and insights in Security Hub to trigger target actions in Amazon CloudWatch Events.</p>
 
 @param request A container for the necessary parameters to execute the CreateActionTarget service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubCreateActionTargetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceConflict`.
 
 @see AWSSecurityhubCreateActionTargetRequest
 @see AWSSecurityhubCreateActionTargetResponse
 */
- (AWSTask<AWSSecurityhubCreateActionTargetResponse *> *)createActionTarget:(AWSSecurityhubCreateActionTargetRequest *)request;

/**
 <p>Creates a custom action target in Security Hub.</p><p>You can use custom actions on findings and insights in Security Hub to trigger target actions in Amazon CloudWatch Events.</p>
 
 @param request A container for the necessary parameters to execute the CreateActionTarget service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceConflict`.
 
 @see AWSSecurityhubCreateActionTargetRequest
 @see AWSSecurityhubCreateActionTargetResponse
 */
- (void)createActionTarget:(AWSSecurityhubCreateActionTargetRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubCreateActionTargetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a custom insight in Security Hub. An insight is a consolidation of findings that relate to a security issue that requires attention or remediation.</p><p>To group the related findings in the insight, use the <code>GroupByAttribute</code>.</p>
 
 @param request A container for the necessary parameters to execute the CreateInsight service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubCreateInsightResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorResourceConflict`.
 
 @see AWSSecurityhubCreateInsightRequest
 @see AWSSecurityhubCreateInsightResponse
 */
- (AWSTask<AWSSecurityhubCreateInsightResponse *> *)createInsight:(AWSSecurityhubCreateInsightRequest *)request;

/**
 <p>Creates a custom insight in Security Hub. An insight is a consolidation of findings that relate to a security issue that requires attention or remediation.</p><p>To group the related findings in the insight, use the <code>GroupByAttribute</code>.</p>
 
 @param request A container for the necessary parameters to execute the CreateInsight service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorResourceConflict`.
 
 @see AWSSecurityhubCreateInsightRequest
 @see AWSSecurityhubCreateInsightResponse
 */
- (void)createInsight:(AWSSecurityhubCreateInsightRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubCreateInsightResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a member association in Security Hub between the specified accounts and the account used to make the request, which is the master account. To successfully create a member, you must use this action from an account that already has Security Hub enabled. To enable Security Hub, you can use the <code><a>EnableSecurityHub</a></code> operation.</p><p>After you use <code>CreateMembers</code> to create member account associations in Security Hub, you must use the <code><a>InviteMembers</a></code> operation to invite the accounts to enable Security Hub and become member accounts in Security Hub.</p><p>If the account owner accepts the invitation, the account becomes a member account in Security Hub. A permissions policy is added that permits the master account to view the findings generated in the member account. When Security Hub is enabled in the invited account, findings start to be sent to both the member and master accounts.</p><p>To remove the association between the master and member accounts, use the <code><a>DisassociateFromMasterAccount</a></code> or <code><a>DisassociateMembers</a></code> operation.</p>
 
 @param request A container for the necessary parameters to execute the CreateMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubCreateMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorResourceConflict`.
 
 @see AWSSecurityhubCreateMembersRequest
 @see AWSSecurityhubCreateMembersResponse
 */
- (AWSTask<AWSSecurityhubCreateMembersResponse *> *)createMembers:(AWSSecurityhubCreateMembersRequest *)request;

/**
 <p>Creates a member association in Security Hub between the specified accounts and the account used to make the request, which is the master account. To successfully create a member, you must use this action from an account that already has Security Hub enabled. To enable Security Hub, you can use the <code><a>EnableSecurityHub</a></code> operation.</p><p>After you use <code>CreateMembers</code> to create member account associations in Security Hub, you must use the <code><a>InviteMembers</a></code> operation to invite the accounts to enable Security Hub and become member accounts in Security Hub.</p><p>If the account owner accepts the invitation, the account becomes a member account in Security Hub. A permissions policy is added that permits the master account to view the findings generated in the member account. When Security Hub is enabled in the invited account, findings start to be sent to both the member and master accounts.</p><p>To remove the association between the master and member accounts, use the <code><a>DisassociateFromMasterAccount</a></code> or <code><a>DisassociateMembers</a></code> operation.</p>
 
 @param request A container for the necessary parameters to execute the CreateMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorResourceConflict`.
 
 @see AWSSecurityhubCreateMembersRequest
 @see AWSSecurityhubCreateMembersResponse
 */
- (void)createMembers:(AWSSecurityhubCreateMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubCreateMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Declines invitations to become a member account.</p>
 
 @param request A container for the necessary parameters to execute the DeclineInvitations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubDeclineInvitationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubDeclineInvitationsRequest
 @see AWSSecurityhubDeclineInvitationsResponse
 */
- (AWSTask<AWSSecurityhubDeclineInvitationsResponse *> *)declineInvitations:(AWSSecurityhubDeclineInvitationsRequest *)request;

/**
 <p>Declines invitations to become a member account.</p>
 
 @param request A container for the necessary parameters to execute the DeclineInvitations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubDeclineInvitationsRequest
 @see AWSSecurityhubDeclineInvitationsResponse
 */
- (void)declineInvitations:(AWSSecurityhubDeclineInvitationsRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubDeclineInvitationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a custom action target from Security Hub.</p><p>Deleting a custom action target does not affect any findings or insights that were already sent to Amazon CloudWatch Events using the custom action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteActionTarget service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubDeleteActionTargetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubDeleteActionTargetRequest
 @see AWSSecurityhubDeleteActionTargetResponse
 */
- (AWSTask<AWSSecurityhubDeleteActionTargetResponse *> *)deleteActionTarget:(AWSSecurityhubDeleteActionTargetRequest *)request;

/**
 <p>Deletes a custom action target from Security Hub.</p><p>Deleting a custom action target does not affect any findings or insights that were already sent to Amazon CloudWatch Events using the custom action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteActionTarget service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubDeleteActionTargetRequest
 @see AWSSecurityhubDeleteActionTargetResponse
 */
- (void)deleteActionTarget:(AWSSecurityhubDeleteActionTargetRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubDeleteActionTargetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the insight specified by the <code>InsightArn</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInsight service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubDeleteInsightResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubDeleteInsightRequest
 @see AWSSecurityhubDeleteInsightResponse
 */
- (AWSTask<AWSSecurityhubDeleteInsightResponse *> *)deleteInsight:(AWSSecurityhubDeleteInsightRequest *)request;

/**
 <p>Deletes the insight specified by the <code>InsightArn</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInsight service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubDeleteInsightRequest
 @see AWSSecurityhubDeleteInsightResponse
 */
- (void)deleteInsight:(AWSSecurityhubDeleteInsightRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubDeleteInsightResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes invitations received by the AWS account to become a member account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInvitations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubDeleteInvitationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceNotFound`, `AWSSecurityhubErrorInvalidAccess`.
 
 @see AWSSecurityhubDeleteInvitationsRequest
 @see AWSSecurityhubDeleteInvitationsResponse
 */
- (AWSTask<AWSSecurityhubDeleteInvitationsResponse *> *)deleteInvitations:(AWSSecurityhubDeleteInvitationsRequest *)request;

/**
 <p>Deletes invitations received by the AWS account to become a member account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInvitations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceNotFound`, `AWSSecurityhubErrorInvalidAccess`.
 
 @see AWSSecurityhubDeleteInvitationsRequest
 @see AWSSecurityhubDeleteInvitationsResponse
 */
- (void)deleteInvitations:(AWSSecurityhubDeleteInvitationsRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubDeleteInvitationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified member accounts from Security Hub.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubDeleteMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubDeleteMembersRequest
 @see AWSSecurityhubDeleteMembersResponse
 */
- (AWSTask<AWSSecurityhubDeleteMembersResponse *> *)deleteMembers:(AWSSecurityhubDeleteMembersRequest *)request;

/**
 <p>Deletes the specified member accounts from Security Hub.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubDeleteMembersRequest
 @see AWSSecurityhubDeleteMembersResponse
 */
- (void)deleteMembers:(AWSSecurityhubDeleteMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubDeleteMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the custom action targets in Security Hub in your account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeActionTargets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubDescribeActionTargetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubDescribeActionTargetsRequest
 @see AWSSecurityhubDescribeActionTargetsResponse
 */
- (AWSTask<AWSSecurityhubDescribeActionTargetsResponse *> *)describeActionTargets:(AWSSecurityhubDescribeActionTargetsRequest *)request;

/**
 <p>Returns a list of the custom action targets in Security Hub in your account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeActionTargets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubDescribeActionTargetsRequest
 @see AWSSecurityhubDescribeActionTargetsResponse
 */
- (void)describeActionTargets:(AWSSecurityhubDescribeActionTargetsRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubDescribeActionTargetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns details about the Hub resource in your account, including the <code>HubArn</code> and the time when you enabled Security Hub.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHub service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubDescribeHubResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubDescribeHubRequest
 @see AWSSecurityhubDescribeHubResponse
 */
- (AWSTask<AWSSecurityhubDescribeHubResponse *> *)describeHub:(AWSSecurityhubDescribeHubRequest *)request;

/**
 <p>Returns details about the Hub resource in your account, including the <code>HubArn</code> and the time when you enabled Security Hub.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHub service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubDescribeHubRequest
 @see AWSSecurityhubDescribeHubResponse
 */
- (void)describeHub:(AWSSecurityhubDescribeHubRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubDescribeHubResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the available products that you can subscribe to and integrate with Security Hub in order to consolidate findings.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProducts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubDescribeProductsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorInvalidInput`.
 
 @see AWSSecurityhubDescribeProductsRequest
 @see AWSSecurityhubDescribeProductsResponse
 */
- (AWSTask<AWSSecurityhubDescribeProductsResponse *> *)describeProducts:(AWSSecurityhubDescribeProductsRequest *)request;

/**
 <p>Returns information about the available products that you can subscribe to and integrate with Security Hub in order to consolidate findings.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProducts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorInvalidInput`.
 
 @see AWSSecurityhubDescribeProductsRequest
 @see AWSSecurityhubDescribeProductsResponse
 */
- (void)describeProducts:(AWSSecurityhubDescribeProductsRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubDescribeProductsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the available standards in Security Hub.</p><p>For each standard, the results include the standard ARN, the name, and a description. </p>
 
 @param request A container for the necessary parameters to execute the DescribeStandards service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubDescribeStandardsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`.
 
 @see AWSSecurityhubDescribeStandardsRequest
 @see AWSSecurityhubDescribeStandardsResponse
 */
- (AWSTask<AWSSecurityhubDescribeStandardsResponse *> *)describeStandards:(AWSSecurityhubDescribeStandardsRequest *)request;

/**
 <p>Returns a list of the available standards in Security Hub.</p><p>For each standard, the results include the standard ARN, the name, and a description. </p>
 
 @param request A container for the necessary parameters to execute the DescribeStandards service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`.
 
 @see AWSSecurityhubDescribeStandardsRequest
 @see AWSSecurityhubDescribeStandardsResponse
 */
- (void)describeStandards:(AWSSecurityhubDescribeStandardsRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubDescribeStandardsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of security standards controls.</p><p>For each control, the results include information about whether it is currently enabled, the severity, and a link to remediation information.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStandardsControls service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubDescribeStandardsControlsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubDescribeStandardsControlsRequest
 @see AWSSecurityhubDescribeStandardsControlsResponse
 */
- (AWSTask<AWSSecurityhubDescribeStandardsControlsResponse *> *)describeStandardsControls:(AWSSecurityhubDescribeStandardsControlsRequest *)request;

/**
 <p>Returns a list of security standards controls.</p><p>For each control, the results include information about whether it is currently enabled, the severity, and a link to remediation information.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStandardsControls service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubDescribeStandardsControlsRequest
 @see AWSSecurityhubDescribeStandardsControlsResponse
 */
- (void)describeStandardsControls:(AWSSecurityhubDescribeStandardsControlsRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubDescribeStandardsControlsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables the integration of the specified product with Security Hub. After the integration is disabled, findings from that product are no longer sent to Security Hub.</p>
 
 @param request A container for the necessary parameters to execute the DisableImportFindingsForProduct service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubDisableImportFindingsForProductResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorResourceNotFound`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`.
 
 @see AWSSecurityhubDisableImportFindingsForProductRequest
 @see AWSSecurityhubDisableImportFindingsForProductResponse
 */
- (AWSTask<AWSSecurityhubDisableImportFindingsForProductResponse *> *)disableImportFindingsForProduct:(AWSSecurityhubDisableImportFindingsForProductRequest *)request;

/**
 <p>Disables the integration of the specified product with Security Hub. After the integration is disabled, findings from that product are no longer sent to Security Hub.</p>
 
 @param request A container for the necessary parameters to execute the DisableImportFindingsForProduct service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorResourceNotFound`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`.
 
 @see AWSSecurityhubDisableImportFindingsForProductRequest
 @see AWSSecurityhubDisableImportFindingsForProductResponse
 */
- (void)disableImportFindingsForProduct:(AWSSecurityhubDisableImportFindingsForProductRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubDisableImportFindingsForProductResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables Security Hub in your account only in the current Region. To disable Security Hub in all Regions, you must submit one request per Region where you have enabled Security Hub.</p><p>When you disable Security Hub for a master account, it doesn't disable Security Hub for any associated member accounts.</p><p>When you disable Security Hub, your existing findings and insights and any Security Hub configuration settings are deleted after 90 days and cannot be recovered. Any standards that were enabled are disabled, and your master and member account associations are removed.</p><p>If you want to save your existing findings, you must export them before you disable Security Hub.</p>
 
 @param request A container for the necessary parameters to execute the DisableSecurityHub service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubDisableSecurityHubResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubDisableSecurityHubRequest
 @see AWSSecurityhubDisableSecurityHubResponse
 */
- (AWSTask<AWSSecurityhubDisableSecurityHubResponse *> *)disableSecurityHub:(AWSSecurityhubDisableSecurityHubRequest *)request;

/**
 <p>Disables Security Hub in your account only in the current Region. To disable Security Hub in all Regions, you must submit one request per Region where you have enabled Security Hub.</p><p>When you disable Security Hub for a master account, it doesn't disable Security Hub for any associated member accounts.</p><p>When you disable Security Hub, your existing findings and insights and any Security Hub configuration settings are deleted after 90 days and cannot be recovered. Any standards that were enabled are disabled, and your master and member account associations are removed.</p><p>If you want to save your existing findings, you must export them before you disable Security Hub.</p>
 
 @param request A container for the necessary parameters to execute the DisableSecurityHub service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubDisableSecurityHubRequest
 @see AWSSecurityhubDisableSecurityHubResponse
 */
- (void)disableSecurityHub:(AWSSecurityhubDisableSecurityHubRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubDisableSecurityHubResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates the current Security Hub member account from the associated master account.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateFromMasterAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubDisassociateFromMasterAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubDisassociateFromMasterAccountRequest
 @see AWSSecurityhubDisassociateFromMasterAccountResponse
 */
- (AWSTask<AWSSecurityhubDisassociateFromMasterAccountResponse *> *)disassociateFromMasterAccount:(AWSSecurityhubDisassociateFromMasterAccountRequest *)request;

/**
 <p>Disassociates the current Security Hub member account from the associated master account.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateFromMasterAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubDisassociateFromMasterAccountRequest
 @see AWSSecurityhubDisassociateFromMasterAccountResponse
 */
- (void)disassociateFromMasterAccount:(AWSSecurityhubDisassociateFromMasterAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubDisassociateFromMasterAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates the specified member accounts from the associated master account.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubDisassociateMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubDisassociateMembersRequest
 @see AWSSecurityhubDisassociateMembersResponse
 */
- (AWSTask<AWSSecurityhubDisassociateMembersResponse *> *)disassociateMembers:(AWSSecurityhubDisassociateMembersRequest *)request;

/**
 <p>Disassociates the specified member accounts from the associated master account.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubDisassociateMembersRequest
 @see AWSSecurityhubDisassociateMembersResponse
 */
- (void)disassociateMembers:(AWSSecurityhubDisassociateMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubDisassociateMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables the integration of a partner product with Security Hub. Integrated products send findings to Security Hub.</p><p>When you enable a product integration, a permissions policy that grants permission for the product to send findings to Security Hub is applied.</p>
 
 @param request A container for the necessary parameters to execute the EnableImportFindingsForProduct service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubEnableImportFindingsForProductResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorResourceConflict`, `AWSSecurityhubErrorLimitExceeded`.
 
 @see AWSSecurityhubEnableImportFindingsForProductRequest
 @see AWSSecurityhubEnableImportFindingsForProductResponse
 */
- (AWSTask<AWSSecurityhubEnableImportFindingsForProductResponse *> *)enableImportFindingsForProduct:(AWSSecurityhubEnableImportFindingsForProductRequest *)request;

/**
 <p>Enables the integration of a partner product with Security Hub. Integrated products send findings to Security Hub.</p><p>When you enable a product integration, a permissions policy that grants permission for the product to send findings to Security Hub is applied.</p>
 
 @param request A container for the necessary parameters to execute the EnableImportFindingsForProduct service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorResourceConflict`, `AWSSecurityhubErrorLimitExceeded`.
 
 @see AWSSecurityhubEnableImportFindingsForProductRequest
 @see AWSSecurityhubEnableImportFindingsForProductResponse
 */
- (void)enableImportFindingsForProduct:(AWSSecurityhubEnableImportFindingsForProductRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubEnableImportFindingsForProductResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables Security Hub for your account in the current Region or the Region you specify in the request.</p><p>When you enable Security Hub, you grant to Security Hub the permissions necessary to gather findings from other services that are integrated with Security Hub.</p><p>When you use the <code>EnableSecurityHub</code> operation to enable Security Hub, you also automatically enable the following standards.</p><ul><li><p>CIS AWS Foundations</p></li><li><p>AWS Foundational Security Best Practices</p></li></ul><p>You do not enable the Payment Card Industry Data Security Standard (PCI DSS) standard. </p><p>To not enable the automatically enabled standards, set <code>EnableDefaultStandards</code> to <code>false</code>.</p><p>After you enable Security Hub, to enable a standard, use the <code><a>BatchEnableStandards</a></code> operation. To disable a standard, use the <code><a>BatchDisableStandards</a></code> operation.</p><p>To learn more, see <a href="https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-settingup.html">Setting Up AWS Security Hub</a> in the <i>AWS Security Hub User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the EnableSecurityHub service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubEnableSecurityHubResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorResourceConflict`, `AWSSecurityhubErrorAccessDenied`.
 
 @see AWSSecurityhubEnableSecurityHubRequest
 @see AWSSecurityhubEnableSecurityHubResponse
 */
- (AWSTask<AWSSecurityhubEnableSecurityHubResponse *> *)enableSecurityHub:(AWSSecurityhubEnableSecurityHubRequest *)request;

/**
 <p>Enables Security Hub for your account in the current Region or the Region you specify in the request.</p><p>When you enable Security Hub, you grant to Security Hub the permissions necessary to gather findings from other services that are integrated with Security Hub.</p><p>When you use the <code>EnableSecurityHub</code> operation to enable Security Hub, you also automatically enable the following standards.</p><ul><li><p>CIS AWS Foundations</p></li><li><p>AWS Foundational Security Best Practices</p></li></ul><p>You do not enable the Payment Card Industry Data Security Standard (PCI DSS) standard. </p><p>To not enable the automatically enabled standards, set <code>EnableDefaultStandards</code> to <code>false</code>.</p><p>After you enable Security Hub, to enable a standard, use the <code><a>BatchEnableStandards</a></code> operation. To disable a standard, use the <code><a>BatchDisableStandards</a></code> operation.</p><p>To learn more, see <a href="https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-settingup.html">Setting Up AWS Security Hub</a> in the <i>AWS Security Hub User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the EnableSecurityHub service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorResourceConflict`, `AWSSecurityhubErrorAccessDenied`.
 
 @see AWSSecurityhubEnableSecurityHubRequest
 @see AWSSecurityhubEnableSecurityHubResponse
 */
- (void)enableSecurityHub:(AWSSecurityhubEnableSecurityHubRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubEnableSecurityHubResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the standards that are currently enabled.</p>
 
 @param request A container for the necessary parameters to execute the GetEnabledStandards service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubGetEnabledStandardsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`.
 
 @see AWSSecurityhubGetEnabledStandardsRequest
 @see AWSSecurityhubGetEnabledStandardsResponse
 */
- (AWSTask<AWSSecurityhubGetEnabledStandardsResponse *> *)getEnabledStandards:(AWSSecurityhubGetEnabledStandardsRequest *)request;

/**
 <p>Returns a list of the standards that are currently enabled.</p>
 
 @param request A container for the necessary parameters to execute the GetEnabledStandards service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`.
 
 @see AWSSecurityhubGetEnabledStandardsRequest
 @see AWSSecurityhubGetEnabledStandardsResponse
 */
- (void)getEnabledStandards:(AWSSecurityhubGetEnabledStandardsRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubGetEnabledStandardsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of findings that match the specified criteria.</p>
 
 @param request A container for the necessary parameters to execute the GetFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubGetFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`.
 
 @see AWSSecurityhubGetFindingsRequest
 @see AWSSecurityhubGetFindingsResponse
 */
- (AWSTask<AWSSecurityhubGetFindingsResponse *> *)getFindings:(AWSSecurityhubGetFindingsRequest *)request;

/**
 <p>Returns a list of findings that match the specified criteria.</p>
 
 @param request A container for the necessary parameters to execute the GetFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`.
 
 @see AWSSecurityhubGetFindingsRequest
 @see AWSSecurityhubGetFindingsResponse
 */
- (void)getFindings:(AWSSecurityhubGetFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubGetFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the results of the Security Hub insight specified by the insight ARN.</p>
 
 @param request A container for the necessary parameters to execute the GetInsightResults service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubGetInsightResultsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubGetInsightResultsRequest
 @see AWSSecurityhubGetInsightResultsResponse
 */
- (AWSTask<AWSSecurityhubGetInsightResultsResponse *> *)getInsightResults:(AWSSecurityhubGetInsightResultsRequest *)request;

/**
 <p>Lists the results of the Security Hub insight specified by the insight ARN.</p>
 
 @param request A container for the necessary parameters to execute the GetInsightResults service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubGetInsightResultsRequest
 @see AWSSecurityhubGetInsightResultsResponse
 */
- (void)getInsightResults:(AWSSecurityhubGetInsightResultsRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubGetInsightResultsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists and describes insights for the specified insight ARNs.</p>
 
 @param request A container for the necessary parameters to execute the GetInsights service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubGetInsightsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubGetInsightsRequest
 @see AWSSecurityhubGetInsightsResponse
 */
- (AWSTask<AWSSecurityhubGetInsightsResponse *> *)getInsights:(AWSSecurityhubGetInsightsRequest *)request;

/**
 <p>Lists and describes insights for the specified insight ARNs.</p>
 
 @param request A container for the necessary parameters to execute the GetInsights service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubGetInsightsRequest
 @see AWSSecurityhubGetInsightsResponse
 */
- (void)getInsights:(AWSSecurityhubGetInsightsRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubGetInsightsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the count of all Security Hub membership invitations that were sent to the current member account, not including the currently accepted invitation. </p>
 
 @param request A container for the necessary parameters to execute the GetInvitationsCount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubGetInvitationsCountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`.
 
 @see AWSSecurityhubGetInvitationsCountRequest
 @see AWSSecurityhubGetInvitationsCountResponse
 */
- (AWSTask<AWSSecurityhubGetInvitationsCountResponse *> *)getInvitationsCount:(AWSSecurityhubGetInvitationsCountRequest *)request;

/**
 <p>Returns the count of all Security Hub membership invitations that were sent to the current member account, not including the currently accepted invitation. </p>
 
 @param request A container for the necessary parameters to execute the GetInvitationsCount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`.
 
 @see AWSSecurityhubGetInvitationsCountRequest
 @see AWSSecurityhubGetInvitationsCountResponse
 */
- (void)getInvitationsCount:(AWSSecurityhubGetInvitationsCountRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubGetInvitationsCountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides the details for the Security Hub master account for the current member account. </p>
 
 @param request A container for the necessary parameters to execute the GetMasterAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubGetMasterAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubGetMasterAccountRequest
 @see AWSSecurityhubGetMasterAccountResponse
 */
- (AWSTask<AWSSecurityhubGetMasterAccountResponse *> *)getMasterAccount:(AWSSecurityhubGetMasterAccountRequest *)request;

/**
 <p>Provides the details for the Security Hub master account for the current member account. </p>
 
 @param request A container for the necessary parameters to execute the GetMasterAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubGetMasterAccountRequest
 @see AWSSecurityhubGetMasterAccountResponse
 */
- (void)getMasterAccount:(AWSSecurityhubGetMasterAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubGetMasterAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the details for the Security Hub member accounts for the specified account IDs.</p>
 
 @param request A container for the necessary parameters to execute the GetMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubGetMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubGetMembersRequest
 @see AWSSecurityhubGetMembersResponse
 */
- (AWSTask<AWSSecurityhubGetMembersResponse *> *)getMembers:(AWSSecurityhubGetMembersRequest *)request;

/**
 <p>Returns the details for the Security Hub member accounts for the specified account IDs.</p>
 
 @param request A container for the necessary parameters to execute the GetMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubGetMembersRequest
 @see AWSSecurityhubGetMembersResponse
 */
- (void)getMembers:(AWSSecurityhubGetMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubGetMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Invites other AWS accounts to become member accounts for the Security Hub master account that the invitation is sent from.</p><p>Before you can use this action to invite a member, you must first use the <code><a>CreateMembers</a></code> action to create the member account in Security Hub.</p><p>When the account owner accepts the invitation to become a member account and enables Security Hub, the master account can view the findings generated from the member account.</p>
 
 @param request A container for the necessary parameters to execute the InviteMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubInviteMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubInviteMembersRequest
 @see AWSSecurityhubInviteMembersResponse
 */
- (AWSTask<AWSSecurityhubInviteMembersResponse *> *)inviteMembers:(AWSSecurityhubInviteMembersRequest *)request;

/**
 <p>Invites other AWS accounts to become member accounts for the Security Hub master account that the invitation is sent from.</p><p>Before you can use this action to invite a member, you must first use the <code><a>CreateMembers</a></code> action to create the member account in Security Hub.</p><p>When the account owner accepts the invitation to become a member account and enables Security Hub, the master account can view the findings generated from the member account.</p>
 
 @param request A container for the necessary parameters to execute the InviteMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubInviteMembersRequest
 @see AWSSecurityhubInviteMembersResponse
 */
- (void)inviteMembers:(AWSSecurityhubInviteMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubInviteMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all findings-generating solutions (products) that you are subscribed to receive findings from in Security Hub.</p>
 
 @param request A container for the necessary parameters to execute the ListEnabledProductsForImport service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubListEnabledProductsForImportResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorInvalidAccess`.
 
 @see AWSSecurityhubListEnabledProductsForImportRequest
 @see AWSSecurityhubListEnabledProductsForImportResponse
 */
- (AWSTask<AWSSecurityhubListEnabledProductsForImportResponse *> *)listEnabledProductsForImport:(AWSSecurityhubListEnabledProductsForImportRequest *)request;

/**
 <p>Lists all findings-generating solutions (products) that you are subscribed to receive findings from in Security Hub.</p>
 
 @param request A container for the necessary parameters to execute the ListEnabledProductsForImport service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorInvalidAccess`.
 
 @see AWSSecurityhubListEnabledProductsForImportRequest
 @see AWSSecurityhubListEnabledProductsForImportResponse
 */
- (void)listEnabledProductsForImport:(AWSSecurityhubListEnabledProductsForImportRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubListEnabledProductsForImportResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all Security Hub membership invitations that were sent to the current AWS account. </p>
 
 @param request A container for the necessary parameters to execute the ListInvitations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubListInvitationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`.
 
 @see AWSSecurityhubListInvitationsRequest
 @see AWSSecurityhubListInvitationsResponse
 */
- (AWSTask<AWSSecurityhubListInvitationsResponse *> *)listInvitations:(AWSSecurityhubListInvitationsRequest *)request;

/**
 <p>Lists all Security Hub membership invitations that were sent to the current AWS account. </p>
 
 @param request A container for the necessary parameters to execute the ListInvitations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`.
 
 @see AWSSecurityhubListInvitationsRequest
 @see AWSSecurityhubListInvitationsResponse
 */
- (void)listInvitations:(AWSSecurityhubListInvitationsRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubListInvitationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists details about all member accounts for the current Security Hub master account.</p>
 
 @param request A container for the necessary parameters to execute the ListMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubListMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`.
 
 @see AWSSecurityhubListMembersRequest
 @see AWSSecurityhubListMembersResponse
 */
- (AWSTask<AWSSecurityhubListMembersResponse *> *)listMembers:(AWSSecurityhubListMembersRequest *)request;

/**
 <p>Lists details about all member accounts for the current Security Hub master account.</p>
 
 @param request A container for the necessary parameters to execute the ListMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`.
 
 @see AWSSecurityhubListMembersRequest
 @see AWSSecurityhubListMembersResponse
 */
- (void)listMembers:(AWSSecurityhubListMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubListMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of tags associated with a resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubListTagsForResourceRequest
 @see AWSSecurityhubListTagsForResourceResponse
 */
- (AWSTask<AWSSecurityhubListTagsForResourceResponse *> *)listTagsForResource:(AWSSecurityhubListTagsForResourceRequest *)request;

/**
 <p>Returns a list of tags associated with a resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubListTagsForResourceRequest
 @see AWSSecurityhubListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSSecurityhubListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds one or more tags to a resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubTagResourceRequest
 @see AWSSecurityhubTagResourceResponse
 */
- (AWSTask<AWSSecurityhubTagResourceResponse *> *)tagResource:(AWSSecurityhubTagResourceRequest *)request;

/**
 <p>Adds one or more tags to a resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubTagResourceRequest
 @see AWSSecurityhubTagResourceResponse
 */
- (void)tagResource:(AWSSecurityhubTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes one or more tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubUntagResourceRequest
 @see AWSSecurityhubUntagResourceResponse
 */
- (AWSTask<AWSSecurityhubUntagResourceResponse *> *)untagResource:(AWSSecurityhubUntagResourceRequest *)request;

/**
 <p>Removes one or more tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubUntagResourceRequest
 @see AWSSecurityhubUntagResourceResponse
 */
- (void)untagResource:(AWSSecurityhubUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the name and description of a custom action target in Security Hub.</p>
 
 @param request A container for the necessary parameters to execute the UpdateActionTarget service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubUpdateActionTargetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorResourceNotFound`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubUpdateActionTargetRequest
 @see AWSSecurityhubUpdateActionTargetResponse
 */
- (AWSTask<AWSSecurityhubUpdateActionTargetResponse *> *)updateActionTarget:(AWSSecurityhubUpdateActionTargetRequest *)request;

/**
 <p>Updates the name and description of a custom action target in Security Hub.</p>
 
 @param request A container for the necessary parameters to execute the UpdateActionTarget service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorResourceNotFound`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubUpdateActionTargetRequest
 @see AWSSecurityhubUpdateActionTargetResponse
 */
- (void)updateActionTarget:(AWSSecurityhubUpdateActionTargetRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubUpdateActionTargetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p><code>UpdateFindings</code> is deprecated. Instead of <code>UpdateFindings</code>, use <code>BatchUpdateFindings</code>.</p><p>Updates the <code>Note</code> and <code>RecordState</code> of the Security Hub-aggregated findings that the filter attributes specify. Any member account that can view the finding also sees the update to the finding.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubUpdateFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubUpdateFindingsRequest
 @see AWSSecurityhubUpdateFindingsResponse
 */
- (AWSTask<AWSSecurityhubUpdateFindingsResponse *> *)updateFindings:(AWSSecurityhubUpdateFindingsRequest *)request;

/**
 <p><code>UpdateFindings</code> is deprecated. Instead of <code>UpdateFindings</code>, use <code>BatchUpdateFindings</code>.</p><p>Updates the <code>Note</code> and <code>RecordState</code> of the Security Hub-aggregated findings that the filter attributes specify. Any member account that can view the finding also sees the update to the finding.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubUpdateFindingsRequest
 @see AWSSecurityhubUpdateFindingsResponse
 */
- (void)updateFindings:(AWSSecurityhubUpdateFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubUpdateFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the Security Hub insight identified by the specified insight ARN.</p>
 
 @param request A container for the necessary parameters to execute the UpdateInsight service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubUpdateInsightResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubUpdateInsightRequest
 @see AWSSecurityhubUpdateInsightResponse
 */
- (AWSTask<AWSSecurityhubUpdateInsightResponse *> *)updateInsight:(AWSSecurityhubUpdateInsightRequest *)request;

/**
 <p>Updates the Security Hub insight identified by the specified insight ARN.</p>
 
 @param request A container for the necessary parameters to execute the UpdateInsight service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorLimitExceeded`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubUpdateInsightRequest
 @see AWSSecurityhubUpdateInsightResponse
 */
- (void)updateInsight:(AWSSecurityhubUpdateInsightRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubUpdateInsightResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Used to control whether an individual security standard control is enabled or disabled.</p>
 
 @param request A container for the necessary parameters to execute the UpdateStandardsControl service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecurityhubUpdateStandardsControlResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubUpdateStandardsControlRequest
 @see AWSSecurityhubUpdateStandardsControlResponse
 */
- (AWSTask<AWSSecurityhubUpdateStandardsControlResponse *> *)updateStandardsControl:(AWSSecurityhubUpdateStandardsControlRequest *)request;

/**
 <p>Used to control whether an individual security standard control is enabled or disabled.</p>
 
 @param request A container for the necessary parameters to execute the UpdateStandardsControl service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecurityhubErrorDomain` domain and the following error code: `AWSSecurityhubErrorInternal`, `AWSSecurityhubErrorInvalidInput`, `AWSSecurityhubErrorInvalidAccess`, `AWSSecurityhubErrorResourceNotFound`.
 
 @see AWSSecurityhubUpdateStandardsControlRequest
 @see AWSSecurityhubUpdateStandardsControlResponse
 */
- (void)updateStandardsControl:(AWSSecurityhubUpdateStandardsControlRequest *)request completionHandler:(void (^ _Nullable)(AWSSecurityhubUpdateStandardsControlResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
