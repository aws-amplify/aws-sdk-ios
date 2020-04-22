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
#import "AWSfmsModel.h"
#import "AWSfmsResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSfms
FOUNDATION_EXPORT NSString *const AWSfmsSDKVersion;

/**
 <fullname>AWS Firewall Manager</fullname><p>This is the <i>AWS Firewall Manager API Reference</i>. This guide is for developers who need detailed information about the AWS Firewall Manager API actions, data types, and errors. For detailed information about AWS Firewall Manager features, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/fms-chapter.html">AWS Firewall Manager Developer Guide</a>.</p>
 */
@interface AWSfms : AWSService

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

     let fms = AWSfms.default()

 *Objective-C*

     AWSfms *fms = [AWSfms defaultfms];

 @return The default service client.
 */
+ (instancetype)defaultfms;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSfms.register(with: configuration!, forKey: "USWest2fms")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSfms registerfmsWithConfiguration:configuration forKey:@"USWest2fms"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let fms = AWSfms(forKey: "USWest2fms")

 *Objective-C*

     AWSfms *fms = [AWSfms fmsForKey:@"USWest2fms"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerfmsWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerfmsWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSfms.register(with: configuration!, forKey: "USWest2fms")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSfms registerfmsWithConfiguration:configuration forKey:@"USWest2fms"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let fms = AWSfms(forKey: "USWest2fms")

 *Objective-C*

     AWSfms *fms = [AWSfms fmsForKey:@"USWest2fms"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)fmsForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removefmsForKey:(NSString *)key;

/**
 <p>Sets the AWS Firewall Manager administrator account. AWS Firewall Manager must be associated with the master account of your AWS organization or associated with a member account that has the appropriate permissions. If the account ID that you submit is not an AWS Organizations master account, AWS Firewall Manager will set the appropriate permissions for the given member account.</p><p>The account that you associate with AWS Firewall Manager is called the AWS Firewall Manager administrator account. </p>
 
 @param request A container for the necessary parameters to execute the AssociateAdminAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorInvalidOperation`, `AWSfmsErrorInvalidInput`, `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInternalError`.
 
 @see AWSfmsAssociateAdminAccountRequest
 */
- (AWSTask *)associateAdminAccount:(AWSfmsAssociateAdminAccountRequest *)request;

/**
 <p>Sets the AWS Firewall Manager administrator account. AWS Firewall Manager must be associated with the master account of your AWS organization or associated with a member account that has the appropriate permissions. If the account ID that you submit is not an AWS Organizations master account, AWS Firewall Manager will set the appropriate permissions for the given member account.</p><p>The account that you associate with AWS Firewall Manager is called the AWS Firewall Manager administrator account. </p>
 
 @param request A container for the necessary parameters to execute the AssociateAdminAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorInvalidOperation`, `AWSfmsErrorInvalidInput`, `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInternalError`.
 
 @see AWSfmsAssociateAdminAccountRequest
 */
- (void)associateAdminAccount:(AWSfmsAssociateAdminAccountRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an AWS Firewall Manager association with the IAM role and the Amazon Simple Notification Service (SNS) topic that is used to record AWS Firewall Manager SNS logs.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNotificationChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInvalidOperation`, `AWSfmsErrorInternalError`.
 
 @see AWSfmsDeleteNotificationChannelRequest
 */
- (AWSTask *)deleteNotificationChannel:(AWSfmsDeleteNotificationChannelRequest *)request;

/**
 <p>Deletes an AWS Firewall Manager association with the IAM role and the Amazon Simple Notification Service (SNS) topic that is used to record AWS Firewall Manager SNS logs.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNotificationChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInvalidOperation`, `AWSfmsErrorInternalError`.
 
 @see AWSfmsDeleteNotificationChannelRequest
 */
- (void)deleteNotificationChannel:(AWSfmsDeleteNotificationChannelRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Permanently deletes an AWS Firewall Manager policy. </p>
 
 @param request A container for the necessary parameters to execute the DeletePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInvalidOperation`, `AWSfmsErrorInternalError`.
 
 @see AWSfmsDeletePolicyRequest
 */
- (AWSTask *)deletePolicy:(AWSfmsDeletePolicyRequest *)request;

/**
 <p>Permanently deletes an AWS Firewall Manager policy. </p>
 
 @param request A container for the necessary parameters to execute the DeletePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInvalidOperation`, `AWSfmsErrorInternalError`.
 
 @see AWSfmsDeletePolicyRequest
 */
- (void)deletePolicy:(AWSfmsDeletePolicyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates the account that has been set as the AWS Firewall Manager administrator account. To set a different account as the administrator account, you must submit an <code>AssociateAdminAccount</code> request.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateAdminAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorInvalidOperation`, `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInternalError`.
 
 @see AWSfmsDisassociateAdminAccountRequest
 */
- (AWSTask *)disassociateAdminAccount:(AWSfmsDisassociateAdminAccountRequest *)request;

/**
 <p>Disassociates the account that has been set as the AWS Firewall Manager administrator account. To set a different account as the administrator account, you must submit an <code>AssociateAdminAccount</code> request.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateAdminAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorInvalidOperation`, `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInternalError`.
 
 @see AWSfmsDisassociateAdminAccountRequest
 */
- (void)disassociateAdminAccount:(AWSfmsDisassociateAdminAccountRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Returns the AWS Organizations master account that is associated with AWS Firewall Manager as the AWS Firewall Manager administrator.</p>
 
 @param request A container for the necessary parameters to execute the GetAdminAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfmsGetAdminAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorInvalidOperation`, `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInternalError`.
 
 @see AWSfmsGetAdminAccountRequest
 @see AWSfmsGetAdminAccountResponse
 */
- (AWSTask<AWSfmsGetAdminAccountResponse *> *)getAdminAccount:(AWSfmsGetAdminAccountRequest *)request;

/**
 <p>Returns the AWS Organizations master account that is associated with AWS Firewall Manager as the AWS Firewall Manager administrator.</p>
 
 @param request A container for the necessary parameters to execute the GetAdminAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorInvalidOperation`, `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInternalError`.
 
 @see AWSfmsGetAdminAccountRequest
 @see AWSfmsGetAdminAccountResponse
 */
- (void)getAdminAccount:(AWSfmsGetAdminAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSfmsGetAdminAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns detailed compliance information about the specified member account. Details include resources that are in and out of compliance with the specified policy. Resources are considered noncompliant for AWS WAF and Shield Advanced policies if the specified policy has not been applied to them. Resources are considered noncompliant for security group policies if they are in scope of the policy, they violate one or more of the policy rules, and remediation is disabled or not possible. </p>
 
 @param request A container for the necessary parameters to execute the GetComplianceDetail service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfmsGetComplianceDetailResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInternalError`.
 
 @see AWSfmsGetComplianceDetailRequest
 @see AWSfmsGetComplianceDetailResponse
 */
- (AWSTask<AWSfmsGetComplianceDetailResponse *> *)getComplianceDetail:(AWSfmsGetComplianceDetailRequest *)request;

/**
 <p>Returns detailed compliance information about the specified member account. Details include resources that are in and out of compliance with the specified policy. Resources are considered noncompliant for AWS WAF and Shield Advanced policies if the specified policy has not been applied to them. Resources are considered noncompliant for security group policies if they are in scope of the policy, they violate one or more of the policy rules, and remediation is disabled or not possible. </p>
 
 @param request A container for the necessary parameters to execute the GetComplianceDetail service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInternalError`.
 
 @see AWSfmsGetComplianceDetailRequest
 @see AWSfmsGetComplianceDetailResponse
 */
- (void)getComplianceDetail:(AWSfmsGetComplianceDetailRequest *)request completionHandler:(void (^ _Nullable)(AWSfmsGetComplianceDetailResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Information about the Amazon Simple Notification Service (SNS) topic that is used to record AWS Firewall Manager SNS logs.</p>
 
 @param request A container for the necessary parameters to execute the GetNotificationChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfmsGetNotificationChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInvalidOperation`, `AWSfmsErrorInternalError`.
 
 @see AWSfmsGetNotificationChannelRequest
 @see AWSfmsGetNotificationChannelResponse
 */
- (AWSTask<AWSfmsGetNotificationChannelResponse *> *)getNotificationChannel:(AWSfmsGetNotificationChannelRequest *)request;

/**
 <p>Information about the Amazon Simple Notification Service (SNS) topic that is used to record AWS Firewall Manager SNS logs.</p>
 
 @param request A container for the necessary parameters to execute the GetNotificationChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInvalidOperation`, `AWSfmsErrorInternalError`.
 
 @see AWSfmsGetNotificationChannelRequest
 @see AWSfmsGetNotificationChannelResponse
 */
- (void)getNotificationChannel:(AWSfmsGetNotificationChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSfmsGetNotificationChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the specified AWS Firewall Manager policy.</p>
 
 @param request A container for the necessary parameters to execute the GetPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfmsGetPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInvalidOperation`, `AWSfmsErrorInternalError`, `AWSfmsErrorInvalidType`.
 
 @see AWSfmsGetPolicyRequest
 @see AWSfmsGetPolicyResponse
 */
- (AWSTask<AWSfmsGetPolicyResponse *> *)getPolicy:(AWSfmsGetPolicyRequest *)request;

/**
 <p>Returns information about the specified AWS Firewall Manager policy.</p>
 
 @param request A container for the necessary parameters to execute the GetPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInvalidOperation`, `AWSfmsErrorInternalError`, `AWSfmsErrorInvalidType`.
 
 @see AWSfmsGetPolicyRequest
 @see AWSfmsGetPolicyResponse
 */
- (void)getPolicy:(AWSfmsGetPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSfmsGetPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>If you created a Shield Advanced policy, returns policy-level attack summary information in the event of a potential DDoS attack. Other policy types are currently unsupported.</p>
 
 @param request A container for the necessary parameters to execute the GetProtectionStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfmsGetProtectionStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorInvalidInput`, `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInternalError`.
 
 @see AWSfmsGetProtectionStatusRequest
 @see AWSfmsGetProtectionStatusResponse
 */
- (AWSTask<AWSfmsGetProtectionStatusResponse *> *)getProtectionStatus:(AWSfmsGetProtectionStatusRequest *)request;

/**
 <p>If you created a Shield Advanced policy, returns policy-level attack summary information in the event of a potential DDoS attack. Other policy types are currently unsupported.</p>
 
 @param request A container for the necessary parameters to execute the GetProtectionStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorInvalidInput`, `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInternalError`.
 
 @see AWSfmsGetProtectionStatusRequest
 @see AWSfmsGetProtectionStatusResponse
 */
- (void)getProtectionStatus:(AWSfmsGetProtectionStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSfmsGetProtectionStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an array of <code>PolicyComplianceStatus</code> objects in the response. Use <code>PolicyComplianceStatus</code> to get a summary of which member accounts are protected by the specified policy. </p>
 
 @param request A container for the necessary parameters to execute the ListComplianceStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfmsListComplianceStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInternalError`.
 
 @see AWSfmsListComplianceStatusRequest
 @see AWSfmsListComplianceStatusResponse
 */
- (AWSTask<AWSfmsListComplianceStatusResponse *> *)listComplianceStatus:(AWSfmsListComplianceStatusRequest *)request;

/**
 <p>Returns an array of <code>PolicyComplianceStatus</code> objects in the response. Use <code>PolicyComplianceStatus</code> to get a summary of which member accounts are protected by the specified policy. </p>
 
 @param request A container for the necessary parameters to execute the ListComplianceStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInternalError`.
 
 @see AWSfmsListComplianceStatusRequest
 @see AWSfmsListComplianceStatusResponse
 */
- (void)listComplianceStatus:(AWSfmsListComplianceStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSfmsListComplianceStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a <code>MemberAccounts</code> object that lists the member accounts in the administrator's AWS organization.</p><p>The <code>ListMemberAccounts</code> must be submitted by the account that is set as the AWS Firewall Manager administrator.</p>
 
 @param request A container for the necessary parameters to execute the ListMemberAccounts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfmsListMemberAccountsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInternalError`.
 
 @see AWSfmsListMemberAccountsRequest
 @see AWSfmsListMemberAccountsResponse
 */
- (AWSTask<AWSfmsListMemberAccountsResponse *> *)listMemberAccounts:(AWSfmsListMemberAccountsRequest *)request;

/**
 <p>Returns a <code>MemberAccounts</code> object that lists the member accounts in the administrator's AWS organization.</p><p>The <code>ListMemberAccounts</code> must be submitted by the account that is set as the AWS Firewall Manager administrator.</p>
 
 @param request A container for the necessary parameters to execute the ListMemberAccounts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInternalError`.
 
 @see AWSfmsListMemberAccountsRequest
 @see AWSfmsListMemberAccountsResponse
 */
- (void)listMemberAccounts:(AWSfmsListMemberAccountsRequest *)request completionHandler:(void (^ _Nullable)(AWSfmsListMemberAccountsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an array of <code>PolicySummary</code> objects in the response.</p>
 
 @param request A container for the necessary parameters to execute the ListPolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfmsListPoliciesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInvalidOperation`, `AWSfmsErrorLimitExceeded`, `AWSfmsErrorInternalError`.
 
 @see AWSfmsListPoliciesRequest
 @see AWSfmsListPoliciesResponse
 */
- (AWSTask<AWSfmsListPoliciesResponse *> *)listPolicies:(AWSfmsListPoliciesRequest *)request;

/**
 <p>Returns an array of <code>PolicySummary</code> objects in the response.</p>
 
 @param request A container for the necessary parameters to execute the ListPolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInvalidOperation`, `AWSfmsErrorLimitExceeded`, `AWSfmsErrorInternalError`.
 
 @see AWSfmsListPoliciesRequest
 @see AWSfmsListPoliciesResponse
 */
- (void)listPolicies:(AWSfmsListPoliciesRequest *)request completionHandler:(void (^ _Nullable)(AWSfmsListPoliciesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the list of tags for the specified AWS resource. </p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfmsListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInvalidOperation`, `AWSfmsErrorInternalError`, `AWSfmsErrorInvalidInput`.
 
 @see AWSfmsListTagsForResourceRequest
 @see AWSfmsListTagsForResourceResponse
 */
- (AWSTask<AWSfmsListTagsForResourceResponse *> *)listTagsForResource:(AWSfmsListTagsForResourceRequest *)request;

/**
 <p>Retrieves the list of tags for the specified AWS resource. </p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInvalidOperation`, `AWSfmsErrorInternalError`, `AWSfmsErrorInvalidInput`.
 
 @see AWSfmsListTagsForResourceRequest
 @see AWSfmsListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSfmsListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSfmsListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Designates the IAM role and Amazon Simple Notification Service (SNS) topic that AWS Firewall Manager uses to record SNS logs.</p>
 
 @param request A container for the necessary parameters to execute the PutNotificationChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInvalidOperation`, `AWSfmsErrorInternalError`.
 
 @see AWSfmsPutNotificationChannelRequest
 */
- (AWSTask *)putNotificationChannel:(AWSfmsPutNotificationChannelRequest *)request;

/**
 <p>Designates the IAM role and Amazon Simple Notification Service (SNS) topic that AWS Firewall Manager uses to record SNS logs.</p>
 
 @param request A container for the necessary parameters to execute the PutNotificationChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInvalidOperation`, `AWSfmsErrorInternalError`.
 
 @see AWSfmsPutNotificationChannelRequest
 */
- (void)putNotificationChannel:(AWSfmsPutNotificationChannelRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates an AWS Firewall Manager policy.</p><p>Firewall Manager provides the following types of policies: </p><ul><li><p>A Shield Advanced policy, which applies Shield Advanced protection to specified accounts and resources</p></li><li><p>An AWS WAF policy (type WAFV2), which defines rule groups to run first in the corresponding AWS WAF web ACL and rule groups to run last in the web ACL.</p></li><li><p>An AWS WAF Classic policy (type WAF), which defines a rule group. </p></li><li><p>A security group policy, which manages VPC security groups across your AWS organization. </p></li></ul><p>Each policy is specific to one of the types. If you want to enforce more than one policy type across accounts, create multiple policies. You can create multiple policies for each type.</p><p>You must be subscribed to Shield Advanced to create a Shield Advanced policy. For more information about subscribing to Shield Advanced, see <a href="https://docs.aws.amazon.com/waf/latest/DDOSAPIReference/API_CreateSubscription.html">CreateSubscription</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfmsPutPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInvalidOperation`, `AWSfmsErrorInvalidInput`, `AWSfmsErrorLimitExceeded`, `AWSfmsErrorInternalError`, `AWSfmsErrorInvalidType`.
 
 @see AWSfmsPutPolicyRequest
 @see AWSfmsPutPolicyResponse
 */
- (AWSTask<AWSfmsPutPolicyResponse *> *)putPolicy:(AWSfmsPutPolicyRequest *)request;

/**
 <p>Creates an AWS Firewall Manager policy.</p><p>Firewall Manager provides the following types of policies: </p><ul><li><p>A Shield Advanced policy, which applies Shield Advanced protection to specified accounts and resources</p></li><li><p>An AWS WAF policy (type WAFV2), which defines rule groups to run first in the corresponding AWS WAF web ACL and rule groups to run last in the web ACL.</p></li><li><p>An AWS WAF Classic policy (type WAF), which defines a rule group. </p></li><li><p>A security group policy, which manages VPC security groups across your AWS organization. </p></li></ul><p>Each policy is specific to one of the types. If you want to enforce more than one policy type across accounts, create multiple policies. You can create multiple policies for each type.</p><p>You must be subscribed to Shield Advanced to create a Shield Advanced policy. For more information about subscribing to Shield Advanced, see <a href="https://docs.aws.amazon.com/waf/latest/DDOSAPIReference/API_CreateSubscription.html">CreateSubscription</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInvalidOperation`, `AWSfmsErrorInvalidInput`, `AWSfmsErrorLimitExceeded`, `AWSfmsErrorInternalError`, `AWSfmsErrorInvalidType`.
 
 @see AWSfmsPutPolicyRequest
 @see AWSfmsPutPolicyResponse
 */
- (void)putPolicy:(AWSfmsPutPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSfmsPutPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds one or more tags to an AWS resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfmsTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInvalidOperation`, `AWSfmsErrorInternalError`, `AWSfmsErrorInvalidInput`, `AWSfmsErrorLimitExceeded`.
 
 @see AWSfmsTagResourceRequest
 @see AWSfmsTagResourceResponse
 */
- (AWSTask<AWSfmsTagResourceResponse *> *)tagResource:(AWSfmsTagResourceRequest *)request;

/**
 <p>Adds one or more tags to an AWS resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInvalidOperation`, `AWSfmsErrorInternalError`, `AWSfmsErrorInvalidInput`, `AWSfmsErrorLimitExceeded`.
 
 @see AWSfmsTagResourceRequest
 @see AWSfmsTagResourceResponse
 */
- (void)tagResource:(AWSfmsTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSfmsTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes one or more tags from an AWS resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfmsUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInvalidOperation`, `AWSfmsErrorInternalError`, `AWSfmsErrorInvalidInput`.
 
 @see AWSfmsUntagResourceRequest
 @see AWSfmsUntagResourceResponse
 */
- (AWSTask<AWSfmsUntagResourceResponse *> *)untagResource:(AWSfmsUntagResourceRequest *)request;

/**
 <p>Removes one or more tags from an AWS resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfmsErrorDomain` domain and the following error code: `AWSfmsErrorResourceNotFound`, `AWSfmsErrorInvalidOperation`, `AWSfmsErrorInternalError`, `AWSfmsErrorInvalidInput`.
 
 @see AWSfmsUntagResourceRequest
 @see AWSfmsUntagResourceResponse
 */
- (void)untagResource:(AWSfmsUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSfmsUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
