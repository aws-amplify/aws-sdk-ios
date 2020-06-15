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
#import "AWSChimeModel.h"
#import "AWSChimeResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSChime
FOUNDATION_EXPORT NSString *const AWSChimeSDKVersion;

/**
 <p>The Amazon Chime API (application programming interface) is designed for developers to perform key tasks, such as creating and managing Amazon Chime accounts, users, and Voice Connectors. This guide provides detailed information about the Amazon Chime API, including operations, types, inputs and outputs, and error codes. It also includes some server-side API actions to use with the Amazon Chime SDK. For more information about the Amazon Chime SDK, see <a href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.</p><p>You can use an AWS SDK, the AWS Command Line Interface (AWS CLI), or the REST API to make API calls. We recommend using an AWS SDK or the AWS CLI. Each API operation includes links to information about using it with a language-specific AWS SDK or the AWS CLI.</p><dl><dt>Using an AWS SDK</dt><dd><p>You don't need to write code to calculate a signature for request authentication. The SDK clients authenticate your requests by using access keys that you provide. For more information about AWS SDKs, see the <a href="http://aws.amazon.com/developer/">AWS Developer Center</a>.</p></dd><dt>Using the AWS CLI</dt><dd><p>Use your access keys with the AWS CLI to make API calls. For information about setting up the AWS CLI, see <a href="https://docs.aws.amazon.com/cli/latest/userguide/installing.html">Installing the AWS Command Line Interface</a> in the <i>AWS Command Line Interface User Guide</i>. For a list of available Amazon Chime commands, see the <a href="https://docs.aws.amazon.com/cli/latest/reference/chime/index.html">Amazon Chime commands</a> in the <i>AWS CLI Command Reference</i>.</p></dd><dt>Using REST API</dt><dd><p>If you use REST to make API calls, you must authenticate your request by providing a signature. Amazon Chime supports signature version 4. For more information, see <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 Signing Process</a> in the <i>Amazon Web Services General Reference</i>.</p><p>When making REST API calls, use the service name <code>chime</code> and REST endpoint <code>https://service.chime.aws.amazon.com</code>.</p></dd></dl><p>Administrative permissions are controlled using AWS Identity and Access Management (IAM). For more information, see <a href="https://docs.aws.amazon.com/chime/latest/ag/security-iam.html">Identity and Access Management for Amazon Chime</a> in the <i>Amazon Chime Administration Guide</i>.</p>
 */
@interface AWSChime : AWSService

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

     let Chime = AWSChime.default()

 *Objective-C*

     AWSChime *Chime = [AWSChime defaultChime];

 @return The default service client.
 */
+ (instancetype)defaultChime;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSChime.register(with: configuration!, forKey: "USWest2Chime")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSChime registerChimeWithConfiguration:configuration forKey:@"USWest2Chime"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Chime = AWSChime(forKey: "USWest2Chime")

 *Objective-C*

     AWSChime *Chime = [AWSChime ChimeForKey:@"USWest2Chime"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerChimeWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerChimeWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSChime.register(with: configuration!, forKey: "USWest2Chime")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSChime registerChimeWithConfiguration:configuration forKey:@"USWest2Chime"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Chime = AWSChime(forKey: "USWest2Chime")

 *Objective-C*

     AWSChime *Chime = [AWSChime ChimeForKey:@"USWest2Chime"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)ChimeForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeChimeForKey:(NSString *)key;

/**
 <p>Associates a phone number with the specified Amazon Chime user.</p>
 
 @param request A container for the necessary parameters to execute the AssociatePhoneNumberWithUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeAssociatePhoneNumberWithUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorAccessDenied`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeAssociatePhoneNumberWithUserRequest
 @see AWSChimeAssociatePhoneNumberWithUserResponse
 */
- (AWSTask<AWSChimeAssociatePhoneNumberWithUserResponse *> *)associatePhoneNumberWithUser:(AWSChimeAssociatePhoneNumberWithUserRequest *)request;

/**
 <p>Associates a phone number with the specified Amazon Chime user.</p>
 
 @param request A container for the necessary parameters to execute the AssociatePhoneNumberWithUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorAccessDenied`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeAssociatePhoneNumberWithUserRequest
 @see AWSChimeAssociatePhoneNumberWithUserResponse
 */
- (void)associatePhoneNumberWithUser:(AWSChimeAssociatePhoneNumberWithUserRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeAssociatePhoneNumberWithUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates phone numbers with the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the AssociatePhoneNumbersWithVoiceConnector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeAssociatePhoneNumbersWithVoiceConnectorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorAccessDenied`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeAssociatePhoneNumbersWithVoiceConnectorRequest
 @see AWSChimeAssociatePhoneNumbersWithVoiceConnectorResponse
 */
- (AWSTask<AWSChimeAssociatePhoneNumbersWithVoiceConnectorResponse *> *)associatePhoneNumbersWithVoiceConnector:(AWSChimeAssociatePhoneNumbersWithVoiceConnectorRequest *)request;

/**
 <p>Associates phone numbers with the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the AssociatePhoneNumbersWithVoiceConnector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorAccessDenied`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeAssociatePhoneNumbersWithVoiceConnectorRequest
 @see AWSChimeAssociatePhoneNumbersWithVoiceConnectorResponse
 */
- (void)associatePhoneNumbersWithVoiceConnector:(AWSChimeAssociatePhoneNumbersWithVoiceConnectorRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeAssociatePhoneNumbersWithVoiceConnectorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates phone numbers with the specified Amazon Chime Voice Connector group.</p>
 
 @param request A container for the necessary parameters to execute the AssociatePhoneNumbersWithVoiceConnectorGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeAssociatePhoneNumbersWithVoiceConnectorGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorAccessDenied`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeAssociatePhoneNumbersWithVoiceConnectorGroupRequest
 @see AWSChimeAssociatePhoneNumbersWithVoiceConnectorGroupResponse
 */
- (AWSTask<AWSChimeAssociatePhoneNumbersWithVoiceConnectorGroupResponse *> *)associatePhoneNumbersWithVoiceConnectorGroup:(AWSChimeAssociatePhoneNumbersWithVoiceConnectorGroupRequest *)request;

/**
 <p>Associates phone numbers with the specified Amazon Chime Voice Connector group.</p>
 
 @param request A container for the necessary parameters to execute the AssociatePhoneNumbersWithVoiceConnectorGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorAccessDenied`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeAssociatePhoneNumbersWithVoiceConnectorGroupRequest
 @see AWSChimeAssociatePhoneNumbersWithVoiceConnectorGroupResponse
 */
- (void)associatePhoneNumbersWithVoiceConnectorGroup:(AWSChimeAssociatePhoneNumbersWithVoiceConnectorGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeAssociatePhoneNumbersWithVoiceConnectorGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates the specified sign-in delegate groups with the specified Amazon Chime account.</p>
 
 @param request A container for the necessary parameters to execute the AssociateSigninDelegateGroupsWithAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeAssociateSigninDelegateGroupsWithAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeAssociateSigninDelegateGroupsWithAccountRequest
 @see AWSChimeAssociateSigninDelegateGroupsWithAccountResponse
 */
- (AWSTask<AWSChimeAssociateSigninDelegateGroupsWithAccountResponse *> *)associateSigninDelegateGroupsWithAccount:(AWSChimeAssociateSigninDelegateGroupsWithAccountRequest *)request;

/**
 <p>Associates the specified sign-in delegate groups with the specified Amazon Chime account.</p>
 
 @param request A container for the necessary parameters to execute the AssociateSigninDelegateGroupsWithAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeAssociateSigninDelegateGroupsWithAccountRequest
 @see AWSChimeAssociateSigninDelegateGroupsWithAccountResponse
 */
- (void)associateSigninDelegateGroupsWithAccount:(AWSChimeAssociateSigninDelegateGroupsWithAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeAssociateSigninDelegateGroupsWithAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates up to 100 new attendees for an active Amazon Chime SDK meeting. For more information about the Amazon Chime SDK, see <a href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the BatchCreateAttendee service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeBatchCreateAttendeeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeBatchCreateAttendeeRequest
 @see AWSChimeBatchCreateAttendeeResponse
 */
- (AWSTask<AWSChimeBatchCreateAttendeeResponse *> *)batchCreateAttendee:(AWSChimeBatchCreateAttendeeRequest *)request;

/**
 <p>Creates up to 100 new attendees for an active Amazon Chime SDK meeting. For more information about the Amazon Chime SDK, see <a href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the BatchCreateAttendee service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeBatchCreateAttendeeRequest
 @see AWSChimeBatchCreateAttendeeResponse
 */
- (void)batchCreateAttendee:(AWSChimeBatchCreateAttendeeRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeBatchCreateAttendeeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds up to 50 members to a chat room in an Amazon Chime Enterprise account. Members can be either users or bots. The member role designates whether the member is a chat room administrator or a general chat room member.</p>
 
 @param request A container for the necessary parameters to execute the BatchCreateRoomMembership service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeBatchCreateRoomMembershipResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeBatchCreateRoomMembershipRequest
 @see AWSChimeBatchCreateRoomMembershipResponse
 */
- (AWSTask<AWSChimeBatchCreateRoomMembershipResponse *> *)batchCreateRoomMembership:(AWSChimeBatchCreateRoomMembershipRequest *)request;

/**
 <p>Adds up to 50 members to a chat room in an Amazon Chime Enterprise account. Members can be either users or bots. The member role designates whether the member is a chat room administrator or a general chat room member.</p>
 
 @param request A container for the necessary parameters to execute the BatchCreateRoomMembership service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeBatchCreateRoomMembershipRequest
 @see AWSChimeBatchCreateRoomMembershipResponse
 */
- (void)batchCreateRoomMembership:(AWSChimeBatchCreateRoomMembershipRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeBatchCreateRoomMembershipResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Moves phone numbers into the <b>Deletion queue</b>. Phone numbers must be disassociated from any users or Amazon Chime Voice Connectors before they can be deleted.</p><p>Phone numbers remain in the <b>Deletion queue</b> for 7 days before they are deleted permanently.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeletePhoneNumber service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeBatchDeletePhoneNumberResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeBatchDeletePhoneNumberRequest
 @see AWSChimeBatchDeletePhoneNumberResponse
 */
- (AWSTask<AWSChimeBatchDeletePhoneNumberResponse *> *)batchDeletePhoneNumber:(AWSChimeBatchDeletePhoneNumberRequest *)request;

/**
 <p>Moves phone numbers into the <b>Deletion queue</b>. Phone numbers must be disassociated from any users or Amazon Chime Voice Connectors before they can be deleted.</p><p>Phone numbers remain in the <b>Deletion queue</b> for 7 days before they are deleted permanently.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeletePhoneNumber service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeBatchDeletePhoneNumberRequest
 @see AWSChimeBatchDeletePhoneNumberResponse
 */
- (void)batchDeletePhoneNumber:(AWSChimeBatchDeletePhoneNumberRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeBatchDeletePhoneNumberResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Suspends up to 50 users from a <code>Team</code> or <code>EnterpriseLWA</code> Amazon Chime account. For more information about different account types, see <a href="https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html">Managing Your Amazon Chime Accounts</a> in the <i>Amazon Chime Administration Guide</i>.</p><p>Users suspended from a <code>Team</code> account are disassociated from the account, but they can continue to use Amazon Chime as free users. To remove the suspension from suspended <code>Team</code> account users, invite them to the <code>Team</code> account again. You can use the <a>InviteUsers</a> action to do so.</p><p>Users suspended from an <code>EnterpriseLWA</code> account are immediately signed out of Amazon Chime and can no longer sign in. To remove the suspension from suspended <code>EnterpriseLWA</code> account users, use the <a>BatchUnsuspendUser</a> action. </p><p>To sign out users without suspending them, use the <a>LogoutUser</a> action.</p>
 
 @param request A container for the necessary parameters to execute the BatchSuspendUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeBatchSuspendUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeBatchSuspendUserRequest
 @see AWSChimeBatchSuspendUserResponse
 */
- (AWSTask<AWSChimeBatchSuspendUserResponse *> *)batchSuspendUser:(AWSChimeBatchSuspendUserRequest *)request;

/**
 <p>Suspends up to 50 users from a <code>Team</code> or <code>EnterpriseLWA</code> Amazon Chime account. For more information about different account types, see <a href="https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html">Managing Your Amazon Chime Accounts</a> in the <i>Amazon Chime Administration Guide</i>.</p><p>Users suspended from a <code>Team</code> account are disassociated from the account, but they can continue to use Amazon Chime as free users. To remove the suspension from suspended <code>Team</code> account users, invite them to the <code>Team</code> account again. You can use the <a>InviteUsers</a> action to do so.</p><p>Users suspended from an <code>EnterpriseLWA</code> account are immediately signed out of Amazon Chime and can no longer sign in. To remove the suspension from suspended <code>EnterpriseLWA</code> account users, use the <a>BatchUnsuspendUser</a> action. </p><p>To sign out users without suspending them, use the <a>LogoutUser</a> action.</p>
 
 @param request A container for the necessary parameters to execute the BatchSuspendUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeBatchSuspendUserRequest
 @see AWSChimeBatchSuspendUserResponse
 */
- (void)batchSuspendUser:(AWSChimeBatchSuspendUserRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeBatchSuspendUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the suspension from up to 50 previously suspended users for the specified Amazon Chime <code>EnterpriseLWA</code> account. Only users on <code>EnterpriseLWA</code> accounts can be unsuspended using this action. For more information about different account types, see <a href="https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html">Managing Your Amazon Chime Accounts</a> in the <i>Amazon Chime Administration Guide</i>.</p><p>Previously suspended users who are unsuspended using this action are returned to <code>Registered</code> status. Users who are not previously suspended are ignored.</p>
 
 @param request A container for the necessary parameters to execute the BatchUnsuspendUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeBatchUnsuspendUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeBatchUnsuspendUserRequest
 @see AWSChimeBatchUnsuspendUserResponse
 */
- (AWSTask<AWSChimeBatchUnsuspendUserResponse *> *)batchUnsuspendUser:(AWSChimeBatchUnsuspendUserRequest *)request;

/**
 <p>Removes the suspension from up to 50 previously suspended users for the specified Amazon Chime <code>EnterpriseLWA</code> account. Only users on <code>EnterpriseLWA</code> accounts can be unsuspended using this action. For more information about different account types, see <a href="https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html">Managing Your Amazon Chime Accounts</a> in the <i>Amazon Chime Administration Guide</i>.</p><p>Previously suspended users who are unsuspended using this action are returned to <code>Registered</code> status. Users who are not previously suspended are ignored.</p>
 
 @param request A container for the necessary parameters to execute the BatchUnsuspendUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeBatchUnsuspendUserRequest
 @see AWSChimeBatchUnsuspendUserResponse
 */
- (void)batchUnsuspendUser:(AWSChimeBatchUnsuspendUserRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeBatchUnsuspendUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates phone number product types or calling names. You can update one attribute at a time for each <code>UpdatePhoneNumberRequestItem</code>. For example, you can update either the product type or the calling name.</p><p>For product types, choose from Amazon Chime Business Calling and Amazon Chime Voice Connector. For toll-free numbers, you must use the Amazon Chime Voice Connector product type.</p><p>Updates to outbound calling names can take up to 72 hours to complete. Pending updates to outbound calling names must be complete before you can request another update.</p>
 
 @param request A container for the necessary parameters to execute the BatchUpdatePhoneNumber service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeBatchUpdatePhoneNumberResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeBatchUpdatePhoneNumberRequest
 @see AWSChimeBatchUpdatePhoneNumberResponse
 */
- (AWSTask<AWSChimeBatchUpdatePhoneNumberResponse *> *)batchUpdatePhoneNumber:(AWSChimeBatchUpdatePhoneNumberRequest *)request;

/**
 <p>Updates phone number product types or calling names. You can update one attribute at a time for each <code>UpdatePhoneNumberRequestItem</code>. For example, you can update either the product type or the calling name.</p><p>For product types, choose from Amazon Chime Business Calling and Amazon Chime Voice Connector. For toll-free numbers, you must use the Amazon Chime Voice Connector product type.</p><p>Updates to outbound calling names can take up to 72 hours to complete. Pending updates to outbound calling names must be complete before you can request another update.</p>
 
 @param request A container for the necessary parameters to execute the BatchUpdatePhoneNumber service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeBatchUpdatePhoneNumberRequest
 @see AWSChimeBatchUpdatePhoneNumberResponse
 */
- (void)batchUpdatePhoneNumber:(AWSChimeBatchUpdatePhoneNumberRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeBatchUpdatePhoneNumberResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates user details within the <a>UpdateUserRequestItem</a> object for up to 20 users for the specified Amazon Chime account. Currently, only <code>LicenseType</code> updates are supported for this action.</p>
 
 @param request A container for the necessary parameters to execute the BatchUpdateUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeBatchUpdateUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeBatchUpdateUserRequest
 @see AWSChimeBatchUpdateUserResponse
 */
- (AWSTask<AWSChimeBatchUpdateUserResponse *> *)batchUpdateUser:(AWSChimeBatchUpdateUserRequest *)request;

/**
 <p>Updates user details within the <a>UpdateUserRequestItem</a> object for up to 20 users for the specified Amazon Chime account. Currently, only <code>LicenseType</code> updates are supported for this action.</p>
 
 @param request A container for the necessary parameters to execute the BatchUpdateUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeBatchUpdateUserRequest
 @see AWSChimeBatchUpdateUserResponse
 */
- (void)batchUpdateUser:(AWSChimeBatchUpdateUserRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeBatchUpdateUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon Chime account under the administrator's AWS account. Only <code>Team</code> account types are currently supported for this action. For more information about different account types, see <a href="https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html">Managing Your Amazon Chime Accounts</a> in the <i>Amazon Chime Administration Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeCreateAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeCreateAccountRequest
 @see AWSChimeCreateAccountResponse
 */
- (AWSTask<AWSChimeCreateAccountResponse *> *)createAccount:(AWSChimeCreateAccountRequest *)request;

/**
 <p>Creates an Amazon Chime account under the administrator's AWS account. Only <code>Team</code> account types are currently supported for this action. For more information about different account types, see <a href="https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html">Managing Your Amazon Chime Accounts</a> in the <i>Amazon Chime Administration Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeCreateAccountRequest
 @see AWSChimeCreateAccountResponse
 */
- (void)createAccount:(AWSChimeCreateAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeCreateAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new attendee for an active Amazon Chime SDK meeting. For more information about the Amazon Chime SDK, see <a href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateAttendee service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeCreateAttendeeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeCreateAttendeeRequest
 @see AWSChimeCreateAttendeeResponse
 */
- (AWSTask<AWSChimeCreateAttendeeResponse *> *)createAttendee:(AWSChimeCreateAttendeeRequest *)request;

/**
 <p>Creates a new attendee for an active Amazon Chime SDK meeting. For more information about the Amazon Chime SDK, see <a href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateAttendee service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeCreateAttendeeRequest
 @see AWSChimeCreateAttendeeResponse
 */
- (void)createAttendee:(AWSChimeCreateAttendeeRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeCreateAttendeeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a bot for an Amazon Chime Enterprise account.</p>
 
 @param request A container for the necessary parameters to execute the CreateBot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeCreateBotResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorNotFound`, `AWSChimeErrorThrottledClient`.
 
 @see AWSChimeCreateBotRequest
 @see AWSChimeCreateBotResponse
 */
- (AWSTask<AWSChimeCreateBotResponse *> *)createBot:(AWSChimeCreateBotRequest *)request;

/**
 <p>Creates a bot for an Amazon Chime Enterprise account.</p>
 
 @param request A container for the necessary parameters to execute the CreateBot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorNotFound`, `AWSChimeErrorThrottledClient`.
 
 @see AWSChimeCreateBotRequest
 @see AWSChimeCreateBotResponse
 */
- (void)createBot:(AWSChimeCreateBotRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeCreateBotResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new Amazon Chime SDK meeting in the specified media Region with no initial attendees. For more information about specifying media Regions, see <a href="https://docs.aws.amazon.com/chime/latest/dg/chime-sdk-meetings-regions.html">Amazon Chime SDK Media Regions</a> in the <i>Amazon Chime Developer Guide</i>. For more information about the Amazon Chime SDK, see <a href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateMeeting service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeCreateMeetingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeCreateMeetingRequest
 @see AWSChimeCreateMeetingResponse
 */
- (AWSTask<AWSChimeCreateMeetingResponse *> *)createMeeting:(AWSChimeCreateMeetingRequest *)request;

/**
 <p>Creates a new Amazon Chime SDK meeting in the specified media Region with no initial attendees. For more information about specifying media Regions, see <a href="https://docs.aws.amazon.com/chime/latest/dg/chime-sdk-meetings-regions.html">Amazon Chime SDK Media Regions</a> in the <i>Amazon Chime Developer Guide</i>. For more information about the Amazon Chime SDK, see <a href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateMeeting service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeCreateMeetingRequest
 @see AWSChimeCreateMeetingResponse
 */
- (void)createMeeting:(AWSChimeCreateMeetingRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeCreateMeetingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new Amazon Chime SDK meeting in the specified media Region, with attendees. For more information about specifying media Regions, see <a href="https://docs.aws.amazon.com/chime/latest/dg/chime-sdk-meetings-regions.html">Amazon Chime SDK Media Regions</a> in the <i>Amazon Chime Developer Guide</i>. For more information about the Amazon Chime SDK, see <a href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateMeetingWithAttendees service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeCreateMeetingWithAttendeesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeCreateMeetingWithAttendeesRequest
 @see AWSChimeCreateMeetingWithAttendeesResponse
 */
- (AWSTask<AWSChimeCreateMeetingWithAttendeesResponse *> *)createMeetingWithAttendees:(AWSChimeCreateMeetingWithAttendeesRequest *)request;

/**
 <p>Creates a new Amazon Chime SDK meeting in the specified media Region, with attendees. For more information about specifying media Regions, see <a href="https://docs.aws.amazon.com/chime/latest/dg/chime-sdk-meetings-regions.html">Amazon Chime SDK Media Regions</a> in the <i>Amazon Chime Developer Guide</i>. For more information about the Amazon Chime SDK, see <a href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateMeetingWithAttendees service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeCreateMeetingWithAttendeesRequest
 @see AWSChimeCreateMeetingWithAttendeesResponse
 */
- (void)createMeetingWithAttendees:(AWSChimeCreateMeetingWithAttendeesRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeCreateMeetingWithAttendeesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an order for phone numbers to be provisioned. Choose from Amazon Chime Business Calling and Amazon Chime Voice Connector product types. For toll-free numbers, you must use the Amazon Chime Voice Connector product type.</p>
 
 @param request A container for the necessary parameters to execute the CreatePhoneNumberOrder service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeCreatePhoneNumberOrderResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorAccessDenied`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeCreatePhoneNumberOrderRequest
 @see AWSChimeCreatePhoneNumberOrderResponse
 */
- (AWSTask<AWSChimeCreatePhoneNumberOrderResponse *> *)createPhoneNumberOrder:(AWSChimeCreatePhoneNumberOrderRequest *)request;

/**
 <p>Creates an order for phone numbers to be provisioned. Choose from Amazon Chime Business Calling and Amazon Chime Voice Connector product types. For toll-free numbers, you must use the Amazon Chime Voice Connector product type.</p>
 
 @param request A container for the necessary parameters to execute the CreatePhoneNumberOrder service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorAccessDenied`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeCreatePhoneNumberOrderRequest
 @see AWSChimeCreatePhoneNumberOrderResponse
 */
- (void)createPhoneNumberOrder:(AWSChimeCreatePhoneNumberOrderRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeCreatePhoneNumberOrderResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a proxy session on the specified Amazon Chime Voice Connector for the specified participant phone numbers.</p>
 
 @param request A container for the necessary parameters to execute the CreateProxySession service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeCreateProxySessionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeCreateProxySessionRequest
 @see AWSChimeCreateProxySessionResponse
 */
- (AWSTask<AWSChimeCreateProxySessionResponse *> *)createProxySession:(AWSChimeCreateProxySessionRequest *)request;

/**
 <p>Creates a proxy session on the specified Amazon Chime Voice Connector for the specified participant phone numbers.</p>
 
 @param request A container for the necessary parameters to execute the CreateProxySession service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeCreateProxySessionRequest
 @see AWSChimeCreateProxySessionResponse
 */
- (void)createProxySession:(AWSChimeCreateProxySessionRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeCreateProxySessionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a chat room for the specified Amazon Chime Enterprise account.</p>
 
 @param request A container for the necessary parameters to execute the CreateRoom service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeCreateRoomResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorNotFound`, `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeCreateRoomRequest
 @see AWSChimeCreateRoomResponse
 */
- (AWSTask<AWSChimeCreateRoomResponse *> *)createRoom:(AWSChimeCreateRoomRequest *)request;

/**
 <p>Creates a chat room for the specified Amazon Chime Enterprise account.</p>
 
 @param request A container for the necessary parameters to execute the CreateRoom service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorNotFound`, `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeCreateRoomRequest
 @see AWSChimeCreateRoomResponse
 */
- (void)createRoom:(AWSChimeCreateRoomRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeCreateRoomResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds a member to a chat room in an Amazon Chime Enterprise account. A member can be either a user or a bot. The member role designates whether the member is a chat room administrator or a general chat room member.</p>
 
 @param request A container for the necessary parameters to execute the CreateRoomMembership service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeCreateRoomMembershipResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorConflict`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeCreateRoomMembershipRequest
 @see AWSChimeCreateRoomMembershipResponse
 */
- (AWSTask<AWSChimeCreateRoomMembershipResponse *> *)createRoomMembership:(AWSChimeCreateRoomMembershipRequest *)request;

/**
 <p>Adds a member to a chat room in an Amazon Chime Enterprise account. A member can be either a user or a bot. The member role designates whether the member is a chat room administrator or a general chat room member.</p>
 
 @param request A container for the necessary parameters to execute the CreateRoomMembership service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorConflict`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeCreateRoomMembershipRequest
 @see AWSChimeCreateRoomMembershipResponse
 */
- (void)createRoomMembership:(AWSChimeCreateRoomMembershipRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeCreateRoomMembershipResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a user under the specified Amazon Chime account.</p>
 
 @param request A container for the necessary parameters to execute the CreateUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeCreateUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorConflict`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeCreateUserRequest
 @see AWSChimeCreateUserResponse
 */
- (AWSTask<AWSChimeCreateUserResponse *> *)createUser:(AWSChimeCreateUserRequest *)request;

/**
 <p>Creates a user under the specified Amazon Chime account.</p>
 
 @param request A container for the necessary parameters to execute the CreateUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorConflict`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeCreateUserRequest
 @see AWSChimeCreateUserResponse
 */
- (void)createUser:(AWSChimeCreateUserRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeCreateUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon Chime Voice Connector under the administrator's AWS account. You can choose to create an Amazon Chime Voice Connector in a specific AWS Region.</p><p>Enabling <a>CreateVoiceConnectorRequest$RequireEncryption</a> configures your Amazon Chime Voice Connector to use TLS transport for SIP signaling and Secure RTP (SRTP) for media. Inbound calls use TLS transport, and unencrypted outbound calls are blocked.</p>
 
 @param request A container for the necessary parameters to execute the CreateVoiceConnector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeCreateVoiceConnectorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorAccessDenied`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeCreateVoiceConnectorRequest
 @see AWSChimeCreateVoiceConnectorResponse
 */
- (AWSTask<AWSChimeCreateVoiceConnectorResponse *> *)createVoiceConnector:(AWSChimeCreateVoiceConnectorRequest *)request;

/**
 <p>Creates an Amazon Chime Voice Connector under the administrator's AWS account. You can choose to create an Amazon Chime Voice Connector in a specific AWS Region.</p><p>Enabling <a>CreateVoiceConnectorRequest$RequireEncryption</a> configures your Amazon Chime Voice Connector to use TLS transport for SIP signaling and Secure RTP (SRTP) for media. Inbound calls use TLS transport, and unencrypted outbound calls are blocked.</p>
 
 @param request A container for the necessary parameters to execute the CreateVoiceConnector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorAccessDenied`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeCreateVoiceConnectorRequest
 @see AWSChimeCreateVoiceConnectorResponse
 */
- (void)createVoiceConnector:(AWSChimeCreateVoiceConnectorRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeCreateVoiceConnectorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon Chime Voice Connector group under the administrator's AWS account. You can associate Amazon Chime Voice Connectors with the Amazon Chime Voice Connector group by including <code>VoiceConnectorItems</code> in the request.</p><p>You can include Amazon Chime Voice Connectors from different AWS Regions in your group. This creates a fault tolerant mechanism for fallback in case of availability events.</p>
 
 @param request A container for the necessary parameters to execute the CreateVoiceConnectorGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeCreateVoiceConnectorGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorAccessDenied`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeCreateVoiceConnectorGroupRequest
 @see AWSChimeCreateVoiceConnectorGroupResponse
 */
- (AWSTask<AWSChimeCreateVoiceConnectorGroupResponse *> *)createVoiceConnectorGroup:(AWSChimeCreateVoiceConnectorGroupRequest *)request;

/**
 <p>Creates an Amazon Chime Voice Connector group under the administrator's AWS account. You can associate Amazon Chime Voice Connectors with the Amazon Chime Voice Connector group by including <code>VoiceConnectorItems</code> in the request.</p><p>You can include Amazon Chime Voice Connectors from different AWS Regions in your group. This creates a fault tolerant mechanism for fallback in case of availability events.</p>
 
 @param request A container for the necessary parameters to execute the CreateVoiceConnectorGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorAccessDenied`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeCreateVoiceConnectorGroupRequest
 @see AWSChimeCreateVoiceConnectorGroupResponse
 */
- (void)createVoiceConnectorGroup:(AWSChimeCreateVoiceConnectorGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeCreateVoiceConnectorGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified Amazon Chime account. You must suspend all users before deleting a <code>Team</code> account. You can use the <a>BatchSuspendUser</a> action to do so.</p><p>For <code>EnterpriseLWA</code> and <code>EnterpriseAD</code> accounts, you must release the claimed domains for your Amazon Chime account before deletion. As soon as you release the domain, all users under that account are suspended.</p><p>Deleted accounts appear in your <code>Disabled</code> accounts list for 90 days. To restore a deleted account from your <code>Disabled</code> accounts list, you must contact AWS Support.</p><p>After 90 days, deleted accounts are permanently removed from your <code>Disabled</code> accounts list.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeDeleteAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnprocessableEntity`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteAccountRequest
 @see AWSChimeDeleteAccountResponse
 */
- (AWSTask<AWSChimeDeleteAccountResponse *> *)deleteAccount:(AWSChimeDeleteAccountRequest *)request;

/**
 <p>Deletes the specified Amazon Chime account. You must suspend all users before deleting a <code>Team</code> account. You can use the <a>BatchSuspendUser</a> action to do so.</p><p>For <code>EnterpriseLWA</code> and <code>EnterpriseAD</code> accounts, you must release the claimed domains for your Amazon Chime account before deletion. As soon as you release the domain, all users under that account are suspended.</p><p>Deleted accounts appear in your <code>Disabled</code> accounts list for 90 days. To restore a deleted account from your <code>Disabled</code> accounts list, you must contact AWS Support.</p><p>After 90 days, deleted accounts are permanently removed from your <code>Disabled</code> accounts list.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnprocessableEntity`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteAccountRequest
 @see AWSChimeDeleteAccountResponse
 */
- (void)deleteAccount:(AWSChimeDeleteAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeDeleteAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an attendee from the specified Amazon Chime SDK meeting and deletes their <code>JoinToken</code>. Attendees are automatically deleted when a Amazon Chime SDK meeting is deleted. For more information about the Amazon Chime SDK, see <a href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAttendee service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteAttendeeRequest
 */
- (AWSTask *)deleteAttendee:(AWSChimeDeleteAttendeeRequest *)request;

/**
 <p>Deletes an attendee from the specified Amazon Chime SDK meeting and deletes their <code>JoinToken</code>. Attendees are automatically deleted when a Amazon Chime SDK meeting is deleted. For more information about the Amazon Chime SDK, see <a href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAttendee service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteAttendeeRequest
 */
- (void)deleteAttendee:(AWSChimeDeleteAttendeeRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the events configuration that allows a bot to receive outgoing events.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEventsConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorResourceLimitExceeded`.
 
 @see AWSChimeDeleteEventsConfigurationRequest
 */
- (AWSTask *)deleteEventsConfiguration:(AWSChimeDeleteEventsConfigurationRequest *)request;

/**
 <p>Deletes the events configuration that allows a bot to receive outgoing events.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEventsConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorResourceLimitExceeded`.
 
 @see AWSChimeDeleteEventsConfigurationRequest
 */
- (void)deleteEventsConfiguration:(AWSChimeDeleteEventsConfigurationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified Amazon Chime SDK meeting. When a meeting is deleted, its attendees are also deleted and clients can no longer join it. For more information about the Amazon Chime SDK, see <a href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMeeting service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteMeetingRequest
 */
- (AWSTask *)deleteMeeting:(AWSChimeDeleteMeetingRequest *)request;

/**
 <p>Deletes the specified Amazon Chime SDK meeting. When a meeting is deleted, its attendees are also deleted and clients can no longer join it. For more information about the Amazon Chime SDK, see <a href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMeeting service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteMeetingRequest
 */
- (void)deleteMeeting:(AWSChimeDeleteMeetingRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Moves the specified phone number into the <b>Deletion queue</b>. A phone number must be disassociated from any users or Amazon Chime Voice Connectors before it can be deleted.</p><p>Deleted phone numbers remain in the <b>Deletion queue</b> for 7 days before they are deleted permanently.</p>
 
 @param request A container for the necessary parameters to execute the DeletePhoneNumber service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeletePhoneNumberRequest
 */
- (AWSTask *)deletePhoneNumber:(AWSChimeDeletePhoneNumberRequest *)request;

/**
 <p>Moves the specified phone number into the <b>Deletion queue</b>. A phone number must be disassociated from any users or Amazon Chime Voice Connectors before it can be deleted.</p><p>Deleted phone numbers remain in the <b>Deletion queue</b> for 7 days before they are deleted permanently.</p>
 
 @param request A container for the necessary parameters to execute the DeletePhoneNumber service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeletePhoneNumberRequest
 */
- (void)deletePhoneNumber:(AWSChimeDeletePhoneNumberRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified proxy session from the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the DeleteProxySession service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteProxySessionRequest
 */
- (AWSTask *)deleteProxySession:(AWSChimeDeleteProxySessionRequest *)request;

/**
 <p>Deletes the specified proxy session from the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the DeleteProxySession service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteProxySessionRequest
 */
- (void)deleteProxySession:(AWSChimeDeleteProxySessionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a chat room in an Amazon Chime Enterprise account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRoom service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteRoomRequest
 */
- (AWSTask *)deleteRoom:(AWSChimeDeleteRoomRequest *)request;

/**
 <p>Deletes a chat room in an Amazon Chime Enterprise account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRoom service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteRoomRequest
 */
- (void)deleteRoom:(AWSChimeDeleteRoomRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes a member from a chat room in an Amazon Chime Enterprise account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRoomMembership service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteRoomMembershipRequest
 */
- (AWSTask *)deleteRoomMembership:(AWSChimeDeleteRoomMembershipRequest *)request;

/**
 <p>Removes a member from a chat room in an Amazon Chime Enterprise account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRoomMembership service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteRoomMembershipRequest
 */
- (void)deleteRoomMembership:(AWSChimeDeleteRoomMembershipRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified Amazon Chime Voice Connector. Any phone numbers associated with the Amazon Chime Voice Connector must be disassociated from it before it can be deleted.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVoiceConnector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorConflict`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteVoiceConnectorRequest
 */
- (AWSTask *)deleteVoiceConnector:(AWSChimeDeleteVoiceConnectorRequest *)request;

/**
 <p>Deletes the specified Amazon Chime Voice Connector. Any phone numbers associated with the Amazon Chime Voice Connector must be disassociated from it before it can be deleted.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVoiceConnector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorConflict`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteVoiceConnectorRequest
 */
- (void)deleteVoiceConnector:(AWSChimeDeleteVoiceConnectorRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified Amazon Chime Voice Connector group. Any <code>VoiceConnectorItems</code> and phone numbers associated with the group must be removed before it can be deleted.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVoiceConnectorGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorConflict`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteVoiceConnectorGroupRequest
 */
- (AWSTask *)deleteVoiceConnectorGroup:(AWSChimeDeleteVoiceConnectorGroupRequest *)request;

/**
 <p>Deletes the specified Amazon Chime Voice Connector group. Any <code>VoiceConnectorItems</code> and phone numbers associated with the group must be removed before it can be deleted.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVoiceConnectorGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorConflict`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteVoiceConnectorGroupRequest
 */
- (void)deleteVoiceConnectorGroup:(AWSChimeDeleteVoiceConnectorGroupRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the origination settings for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVoiceConnectorOrigination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteVoiceConnectorOriginationRequest
 */
- (AWSTask *)deleteVoiceConnectorOrigination:(AWSChimeDeleteVoiceConnectorOriginationRequest *)request;

/**
 <p>Deletes the origination settings for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVoiceConnectorOrigination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteVoiceConnectorOriginationRequest
 */
- (void)deleteVoiceConnectorOrigination:(AWSChimeDeleteVoiceConnectorOriginationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the proxy configuration from the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVoiceConnectorProxy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteVoiceConnectorProxyRequest
 */
- (AWSTask *)deleteVoiceConnectorProxy:(AWSChimeDeleteVoiceConnectorProxyRequest *)request;

/**
 <p>Deletes the proxy configuration from the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVoiceConnectorProxy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteVoiceConnectorProxyRequest
 */
- (void)deleteVoiceConnectorProxy:(AWSChimeDeleteVoiceConnectorProxyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the streaming configuration for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVoiceConnectorStreamingConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteVoiceConnectorStreamingConfigurationRequest
 */
- (AWSTask *)deleteVoiceConnectorStreamingConfiguration:(AWSChimeDeleteVoiceConnectorStreamingConfigurationRequest *)request;

/**
 <p>Deletes the streaming configuration for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVoiceConnectorStreamingConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteVoiceConnectorStreamingConfigurationRequest
 */
- (void)deleteVoiceConnectorStreamingConfiguration:(AWSChimeDeleteVoiceConnectorStreamingConfigurationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the termination settings for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVoiceConnectorTermination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteVoiceConnectorTerminationRequest
 */
- (AWSTask *)deleteVoiceConnectorTermination:(AWSChimeDeleteVoiceConnectorTerminationRequest *)request;

/**
 <p>Deletes the termination settings for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVoiceConnectorTermination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteVoiceConnectorTerminationRequest
 */
- (void)deleteVoiceConnectorTermination:(AWSChimeDeleteVoiceConnectorTerminationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified SIP credentials used by your equipment to authenticate during call termination.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVoiceConnectorTerminationCredentials service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteVoiceConnectorTerminationCredentialsRequest
 */
- (AWSTask *)deleteVoiceConnectorTerminationCredentials:(AWSChimeDeleteVoiceConnectorTerminationCredentialsRequest *)request;

/**
 <p>Deletes the specified SIP credentials used by your equipment to authenticate during call termination.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVoiceConnectorTerminationCredentials service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDeleteVoiceConnectorTerminationCredentialsRequest
 */
- (void)deleteVoiceConnectorTerminationCredentials:(AWSChimeDeleteVoiceConnectorTerminationCredentialsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates the primary provisioned phone number from the specified Amazon Chime user.</p>
 
 @param request A container for the necessary parameters to execute the DisassociatePhoneNumberFromUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeDisassociatePhoneNumberFromUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDisassociatePhoneNumberFromUserRequest
 @see AWSChimeDisassociatePhoneNumberFromUserResponse
 */
- (AWSTask<AWSChimeDisassociatePhoneNumberFromUserResponse *> *)disassociatePhoneNumberFromUser:(AWSChimeDisassociatePhoneNumberFromUserRequest *)request;

/**
 <p>Disassociates the primary provisioned phone number from the specified Amazon Chime user.</p>
 
 @param request A container for the necessary parameters to execute the DisassociatePhoneNumberFromUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDisassociatePhoneNumberFromUserRequest
 @see AWSChimeDisassociatePhoneNumberFromUserResponse
 */
- (void)disassociatePhoneNumberFromUser:(AWSChimeDisassociatePhoneNumberFromUserRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeDisassociatePhoneNumberFromUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates the specified phone numbers from the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the DisassociatePhoneNumbersFromVoiceConnector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeDisassociatePhoneNumbersFromVoiceConnectorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDisassociatePhoneNumbersFromVoiceConnectorRequest
 @see AWSChimeDisassociatePhoneNumbersFromVoiceConnectorResponse
 */
- (AWSTask<AWSChimeDisassociatePhoneNumbersFromVoiceConnectorResponse *> *)disassociatePhoneNumbersFromVoiceConnector:(AWSChimeDisassociatePhoneNumbersFromVoiceConnectorRequest *)request;

/**
 <p>Disassociates the specified phone numbers from the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the DisassociatePhoneNumbersFromVoiceConnector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDisassociatePhoneNumbersFromVoiceConnectorRequest
 @see AWSChimeDisassociatePhoneNumbersFromVoiceConnectorResponse
 */
- (void)disassociatePhoneNumbersFromVoiceConnector:(AWSChimeDisassociatePhoneNumbersFromVoiceConnectorRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeDisassociatePhoneNumbersFromVoiceConnectorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates the specified phone numbers from the specified Amazon Chime Voice Connector group.</p>
 
 @param request A container for the necessary parameters to execute the DisassociatePhoneNumbersFromVoiceConnectorGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeDisassociatePhoneNumbersFromVoiceConnectorGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDisassociatePhoneNumbersFromVoiceConnectorGroupRequest
 @see AWSChimeDisassociatePhoneNumbersFromVoiceConnectorGroupResponse
 */
- (AWSTask<AWSChimeDisassociatePhoneNumbersFromVoiceConnectorGroupResponse *> *)disassociatePhoneNumbersFromVoiceConnectorGroup:(AWSChimeDisassociatePhoneNumbersFromVoiceConnectorGroupRequest *)request;

/**
 <p>Disassociates the specified phone numbers from the specified Amazon Chime Voice Connector group.</p>
 
 @param request A container for the necessary parameters to execute the DisassociatePhoneNumbersFromVoiceConnectorGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDisassociatePhoneNumbersFromVoiceConnectorGroupRequest
 @see AWSChimeDisassociatePhoneNumbersFromVoiceConnectorGroupResponse
 */
- (void)disassociatePhoneNumbersFromVoiceConnectorGroup:(AWSChimeDisassociatePhoneNumbersFromVoiceConnectorGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeDisassociatePhoneNumbersFromVoiceConnectorGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates the specified sign-in delegate groups from the specified Amazon Chime account.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateSigninDelegateGroupsFromAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeDisassociateSigninDelegateGroupsFromAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDisassociateSigninDelegateGroupsFromAccountRequest
 @see AWSChimeDisassociateSigninDelegateGroupsFromAccountResponse
 */
- (AWSTask<AWSChimeDisassociateSigninDelegateGroupsFromAccountResponse *> *)disassociateSigninDelegateGroupsFromAccount:(AWSChimeDisassociateSigninDelegateGroupsFromAccountRequest *)request;

/**
 <p>Disassociates the specified sign-in delegate groups from the specified Amazon Chime account.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateSigninDelegateGroupsFromAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeDisassociateSigninDelegateGroupsFromAccountRequest
 @see AWSChimeDisassociateSigninDelegateGroupsFromAccountResponse
 */
- (void)disassociateSigninDelegateGroupsFromAccount:(AWSChimeDisassociateSigninDelegateGroupsFromAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeDisassociateSigninDelegateGroupsFromAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves details for the specified Amazon Chime account, such as account type and supported licenses.</p>
 
 @param request A container for the necessary parameters to execute the GetAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeGetAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetAccountRequest
 @see AWSChimeGetAccountResponse
 */
- (AWSTask<AWSChimeGetAccountResponse *> *)getAccount:(AWSChimeGetAccountRequest *)request;

/**
 <p>Retrieves details for the specified Amazon Chime account, such as account type and supported licenses.</p>
 
 @param request A container for the necessary parameters to execute the GetAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetAccountRequest
 @see AWSChimeGetAccountResponse
 */
- (void)getAccount:(AWSChimeGetAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeGetAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves account settings for the specified Amazon Chime account ID, such as remote control and dial out settings. For more information about these settings, see <a href="https://docs.aws.amazon.com/chime/latest/ag/policies.html">Use the Policies Page</a> in the <i>Amazon Chime Administration Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetAccountSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeGetAccountSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetAccountSettingsRequest
 @see AWSChimeGetAccountSettingsResponse
 */
- (AWSTask<AWSChimeGetAccountSettingsResponse *> *)getAccountSettings:(AWSChimeGetAccountSettingsRequest *)request;

/**
 <p>Retrieves account settings for the specified Amazon Chime account ID, such as remote control and dial out settings. For more information about these settings, see <a href="https://docs.aws.amazon.com/chime/latest/ag/policies.html">Use the Policies Page</a> in the <i>Amazon Chime Administration Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetAccountSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetAccountSettingsRequest
 @see AWSChimeGetAccountSettingsResponse
 */
- (void)getAccountSettings:(AWSChimeGetAccountSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeGetAccountSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the Amazon Chime SDK attendee details for a specified meeting ID and attendee ID. For more information about the Amazon Chime SDK, see <a href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetAttendee service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeGetAttendeeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetAttendeeRequest
 @see AWSChimeGetAttendeeResponse
 */
- (AWSTask<AWSChimeGetAttendeeResponse *> *)getAttendee:(AWSChimeGetAttendeeRequest *)request;

/**
 <p>Gets the Amazon Chime SDK attendee details for a specified meeting ID and attendee ID. For more information about the Amazon Chime SDK, see <a href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetAttendee service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetAttendeeRequest
 @see AWSChimeGetAttendeeResponse
 */
- (void)getAttendee:(AWSChimeGetAttendeeRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeGetAttendeeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves details for the specified bot, such as bot email address, bot type, status, and display name.</p>
 
 @param request A container for the necessary parameters to execute the GetBot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeGetBotResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`, `AWSChimeErrorForbidden`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`.
 
 @see AWSChimeGetBotRequest
 @see AWSChimeGetBotResponse
 */
- (AWSTask<AWSChimeGetBotResponse *> *)getBot:(AWSChimeGetBotRequest *)request;

/**
 <p>Retrieves details for the specified bot, such as bot email address, bot type, status, and display name.</p>
 
 @param request A container for the necessary parameters to execute the GetBot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`, `AWSChimeErrorForbidden`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`.
 
 @see AWSChimeGetBotRequest
 @see AWSChimeGetBotResponse
 */
- (void)getBot:(AWSChimeGetBotRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeGetBotResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets details for an events configuration that allows a bot to receive outgoing events, such as an HTTPS endpoint or Lambda function ARN. </p>
 
 @param request A container for the necessary parameters to execute the GetEventsConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeGetEventsConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorNotFound`.
 
 @see AWSChimeGetEventsConfigurationRequest
 @see AWSChimeGetEventsConfigurationResponse
 */
- (AWSTask<AWSChimeGetEventsConfigurationResponse *> *)getEventsConfiguration:(AWSChimeGetEventsConfigurationRequest *)request;

/**
 <p>Gets details for an events configuration that allows a bot to receive outgoing events, such as an HTTPS endpoint or Lambda function ARN. </p>
 
 @param request A container for the necessary parameters to execute the GetEventsConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorNotFound`.
 
 @see AWSChimeGetEventsConfigurationRequest
 @see AWSChimeGetEventsConfigurationResponse
 */
- (void)getEventsConfiguration:(AWSChimeGetEventsConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeGetEventsConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves global settings for the administrator's AWS account, such as Amazon Chime Business Calling and Amazon Chime Voice Connector settings.</p>
 
 @param request A container for the necessary parameters to execute the GetGlobalSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeGetGlobalSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSRequest
 @see AWSChimeGetGlobalSettingsResponse
 */
- (AWSTask<AWSChimeGetGlobalSettingsResponse *> *)getGlobalSettings:(AWSRequest *)request;

/**
 <p>Retrieves global settings for the administrator's AWS account, such as Amazon Chime Business Calling and Amazon Chime Voice Connector settings.</p>
 
 @param request A container for the necessary parameters to execute the GetGlobalSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSRequest
 @see AWSChimeGetGlobalSettingsResponse
 */
- (void)getGlobalSettings:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeGetGlobalSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the Amazon Chime SDK meeting details for the specified meeting ID. For more information about the Amazon Chime SDK, see <a href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetMeeting service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeGetMeetingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetMeetingRequest
 @see AWSChimeGetMeetingResponse
 */
- (AWSTask<AWSChimeGetMeetingResponse *> *)getMeeting:(AWSChimeGetMeetingRequest *)request;

/**
 <p>Gets the Amazon Chime SDK meeting details for the specified meeting ID. For more information about the Amazon Chime SDK, see <a href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetMeeting service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetMeetingRequest
 @see AWSChimeGetMeetingResponse
 */
- (void)getMeeting:(AWSChimeGetMeetingRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeGetMeetingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves details for the specified phone number ID, such as associations, capabilities, and product type.</p>
 
 @param request A container for the necessary parameters to execute the GetPhoneNumber service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeGetPhoneNumberResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetPhoneNumberRequest
 @see AWSChimeGetPhoneNumberResponse
 */
- (AWSTask<AWSChimeGetPhoneNumberResponse *> *)getPhoneNumber:(AWSChimeGetPhoneNumberRequest *)request;

/**
 <p>Retrieves details for the specified phone number ID, such as associations, capabilities, and product type.</p>
 
 @param request A container for the necessary parameters to execute the GetPhoneNumber service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetPhoneNumberRequest
 @see AWSChimeGetPhoneNumberResponse
 */
- (void)getPhoneNumber:(AWSChimeGetPhoneNumberRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeGetPhoneNumberResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves details for the specified phone number order, such as order creation timestamp, phone numbers in E.164 format, product type, and order status.</p>
 
 @param request A container for the necessary parameters to execute the GetPhoneNumberOrder service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeGetPhoneNumberOrderResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetPhoneNumberOrderRequest
 @see AWSChimeGetPhoneNumberOrderResponse
 */
- (AWSTask<AWSChimeGetPhoneNumberOrderResponse *> *)getPhoneNumberOrder:(AWSChimeGetPhoneNumberOrderRequest *)request;

/**
 <p>Retrieves details for the specified phone number order, such as order creation timestamp, phone numbers in E.164 format, product type, and order status.</p>
 
 @param request A container for the necessary parameters to execute the GetPhoneNumberOrder service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetPhoneNumberOrderRequest
 @see AWSChimeGetPhoneNumberOrderResponse
 */
- (void)getPhoneNumberOrder:(AWSChimeGetPhoneNumberOrderRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeGetPhoneNumberOrderResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the phone number settings for the administrator's AWS account, such as the default outbound calling name.</p>
 
 @param request A container for the necessary parameters to execute the GetPhoneNumberSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeGetPhoneNumberSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSRequest
 @see AWSChimeGetPhoneNumberSettingsResponse
 */
- (AWSTask<AWSChimeGetPhoneNumberSettingsResponse *> *)getPhoneNumberSettings:(AWSRequest *)request;

/**
 <p>Retrieves the phone number settings for the administrator's AWS account, such as the default outbound calling name.</p>
 
 @param request A container for the necessary parameters to execute the GetPhoneNumberSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSRequest
 @see AWSChimeGetPhoneNumberSettingsResponse
 */
- (void)getPhoneNumberSettings:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeGetPhoneNumberSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the specified proxy session details for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the GetProxySession service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeGetProxySessionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetProxySessionRequest
 @see AWSChimeGetProxySessionResponse
 */
- (AWSTask<AWSChimeGetProxySessionResponse *> *)getProxySession:(AWSChimeGetProxySessionRequest *)request;

/**
 <p>Gets the specified proxy session details for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the GetProxySession service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetProxySessionRequest
 @see AWSChimeGetProxySessionResponse
 */
- (void)getProxySession:(AWSChimeGetProxySessionRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeGetProxySessionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the retention settings for the specified Amazon Chime Enterprise account. For more information about retention settings, see <a href="https://docs.aws.amazon.com/chime/latest/ag/chat-retention.html">Managing Chat Retention Policies</a> in the <i>Amazon Chime Administration Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetRetentionSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeGetRetentionSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetRetentionSettingsRequest
 @see AWSChimeGetRetentionSettingsResponse
 */
- (AWSTask<AWSChimeGetRetentionSettingsResponse *> *)getRetentionSettings:(AWSChimeGetRetentionSettingsRequest *)request;

/**
 <p>Gets the retention settings for the specified Amazon Chime Enterprise account. For more information about retention settings, see <a href="https://docs.aws.amazon.com/chime/latest/ag/chat-retention.html">Managing Chat Retention Policies</a> in the <i>Amazon Chime Administration Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetRetentionSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetRetentionSettingsRequest
 @see AWSChimeGetRetentionSettingsResponse
 */
- (void)getRetentionSettings:(AWSChimeGetRetentionSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeGetRetentionSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves room details, such as the room name, for a room in an Amazon Chime Enterprise account.</p>
 
 @param request A container for the necessary parameters to execute the GetRoom service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeGetRoomResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetRoomRequest
 @see AWSChimeGetRoomResponse
 */
- (AWSTask<AWSChimeGetRoomResponse *> *)getRoom:(AWSChimeGetRoomRequest *)request;

/**
 <p>Retrieves room details, such as the room name, for a room in an Amazon Chime Enterprise account.</p>
 
 @param request A container for the necessary parameters to execute the GetRoom service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetRoomRequest
 @see AWSChimeGetRoomResponse
 */
- (void)getRoom:(AWSChimeGetRoomRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeGetRoomResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves details for the specified user ID, such as primary email address, license type, and personal meeting PIN.</p><p>To retrieve user details with an email address instead of a user ID, use the <a>ListUsers</a> action, and then filter by email address.</p>
 
 @param request A container for the necessary parameters to execute the GetUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeGetUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetUserRequest
 @see AWSChimeGetUserResponse
 */
- (AWSTask<AWSChimeGetUserResponse *> *)getUser:(AWSChimeGetUserRequest *)request;

/**
 <p>Retrieves details for the specified user ID, such as primary email address, license type, and personal meeting PIN.</p><p>To retrieve user details with an email address instead of a user ID, use the <a>ListUsers</a> action, and then filter by email address.</p>
 
 @param request A container for the necessary parameters to execute the GetUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetUserRequest
 @see AWSChimeGetUserResponse
 */
- (void)getUser:(AWSChimeGetUserRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeGetUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves settings for the specified user ID, such as any associated phone number settings.</p>
 
 @param request A container for the necessary parameters to execute the GetUserSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeGetUserSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetUserSettingsRequest
 @see AWSChimeGetUserSettingsResponse
 */
- (AWSTask<AWSChimeGetUserSettingsResponse *> *)getUserSettings:(AWSChimeGetUserSettingsRequest *)request;

/**
 <p>Retrieves settings for the specified user ID, such as any associated phone number settings.</p>
 
 @param request A container for the necessary parameters to execute the GetUserSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetUserSettingsRequest
 @see AWSChimeGetUserSettingsResponse
 */
- (void)getUserSettings:(AWSChimeGetUserSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeGetUserSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves details for the specified Amazon Chime Voice Connector, such as timestamps, name, outbound host, and encryption requirements.</p>
 
 @param request A container for the necessary parameters to execute the GetVoiceConnector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeGetVoiceConnectorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetVoiceConnectorRequest
 @see AWSChimeGetVoiceConnectorResponse
 */
- (AWSTask<AWSChimeGetVoiceConnectorResponse *> *)getVoiceConnector:(AWSChimeGetVoiceConnectorRequest *)request;

/**
 <p>Retrieves details for the specified Amazon Chime Voice Connector, such as timestamps, name, outbound host, and encryption requirements.</p>
 
 @param request A container for the necessary parameters to execute the GetVoiceConnector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetVoiceConnectorRequest
 @see AWSChimeGetVoiceConnectorResponse
 */
- (void)getVoiceConnector:(AWSChimeGetVoiceConnectorRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeGetVoiceConnectorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves details for the specified Amazon Chime Voice Connector group, such as timestamps, name, and associated <code>VoiceConnectorItems</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetVoiceConnectorGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeGetVoiceConnectorGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetVoiceConnectorGroupRequest
 @see AWSChimeGetVoiceConnectorGroupResponse
 */
- (AWSTask<AWSChimeGetVoiceConnectorGroupResponse *> *)getVoiceConnectorGroup:(AWSChimeGetVoiceConnectorGroupRequest *)request;

/**
 <p>Retrieves details for the specified Amazon Chime Voice Connector group, such as timestamps, name, and associated <code>VoiceConnectorItems</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetVoiceConnectorGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetVoiceConnectorGroupRequest
 @see AWSChimeGetVoiceConnectorGroupResponse
 */
- (void)getVoiceConnectorGroup:(AWSChimeGetVoiceConnectorGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeGetVoiceConnectorGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the logging configuration details for the specified Amazon Chime Voice Connector. Shows whether SIP message logs are enabled for sending to Amazon CloudWatch Logs.</p>
 
 @param request A container for the necessary parameters to execute the GetVoiceConnectorLoggingConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeGetVoiceConnectorLoggingConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetVoiceConnectorLoggingConfigurationRequest
 @see AWSChimeGetVoiceConnectorLoggingConfigurationResponse
 */
- (AWSTask<AWSChimeGetVoiceConnectorLoggingConfigurationResponse *> *)getVoiceConnectorLoggingConfiguration:(AWSChimeGetVoiceConnectorLoggingConfigurationRequest *)request;

/**
 <p>Retrieves the logging configuration details for the specified Amazon Chime Voice Connector. Shows whether SIP message logs are enabled for sending to Amazon CloudWatch Logs.</p>
 
 @param request A container for the necessary parameters to execute the GetVoiceConnectorLoggingConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetVoiceConnectorLoggingConfigurationRequest
 @see AWSChimeGetVoiceConnectorLoggingConfigurationResponse
 */
- (void)getVoiceConnectorLoggingConfiguration:(AWSChimeGetVoiceConnectorLoggingConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeGetVoiceConnectorLoggingConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves origination setting details for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the GetVoiceConnectorOrigination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeGetVoiceConnectorOriginationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetVoiceConnectorOriginationRequest
 @see AWSChimeGetVoiceConnectorOriginationResponse
 */
- (AWSTask<AWSChimeGetVoiceConnectorOriginationResponse *> *)getVoiceConnectorOrigination:(AWSChimeGetVoiceConnectorOriginationRequest *)request;

/**
 <p>Retrieves origination setting details for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the GetVoiceConnectorOrigination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetVoiceConnectorOriginationRequest
 @see AWSChimeGetVoiceConnectorOriginationResponse
 */
- (void)getVoiceConnectorOrigination:(AWSChimeGetVoiceConnectorOriginationRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeGetVoiceConnectorOriginationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the proxy configuration details for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the GetVoiceConnectorProxy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeGetVoiceConnectorProxyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetVoiceConnectorProxyRequest
 @see AWSChimeGetVoiceConnectorProxyResponse
 */
- (AWSTask<AWSChimeGetVoiceConnectorProxyResponse *> *)getVoiceConnectorProxy:(AWSChimeGetVoiceConnectorProxyRequest *)request;

/**
 <p>Gets the proxy configuration details for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the GetVoiceConnectorProxy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetVoiceConnectorProxyRequest
 @see AWSChimeGetVoiceConnectorProxyResponse
 */
- (void)getVoiceConnectorProxy:(AWSChimeGetVoiceConnectorProxyRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeGetVoiceConnectorProxyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the streaming configuration details for the specified Amazon Chime Voice Connector. Shows whether media streaming is enabled for sending to Amazon Kinesis. It also shows the retention period, in hours, for the Amazon Kinesis data.</p>
 
 @param request A container for the necessary parameters to execute the GetVoiceConnectorStreamingConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeGetVoiceConnectorStreamingConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetVoiceConnectorStreamingConfigurationRequest
 @see AWSChimeGetVoiceConnectorStreamingConfigurationResponse
 */
- (AWSTask<AWSChimeGetVoiceConnectorStreamingConfigurationResponse *> *)getVoiceConnectorStreamingConfiguration:(AWSChimeGetVoiceConnectorStreamingConfigurationRequest *)request;

/**
 <p>Retrieves the streaming configuration details for the specified Amazon Chime Voice Connector. Shows whether media streaming is enabled for sending to Amazon Kinesis. It also shows the retention period, in hours, for the Amazon Kinesis data.</p>
 
 @param request A container for the necessary parameters to execute the GetVoiceConnectorStreamingConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetVoiceConnectorStreamingConfigurationRequest
 @see AWSChimeGetVoiceConnectorStreamingConfigurationResponse
 */
- (void)getVoiceConnectorStreamingConfiguration:(AWSChimeGetVoiceConnectorStreamingConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeGetVoiceConnectorStreamingConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves termination setting details for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the GetVoiceConnectorTermination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeGetVoiceConnectorTerminationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetVoiceConnectorTerminationRequest
 @see AWSChimeGetVoiceConnectorTerminationResponse
 */
- (AWSTask<AWSChimeGetVoiceConnectorTerminationResponse *> *)getVoiceConnectorTermination:(AWSChimeGetVoiceConnectorTerminationRequest *)request;

/**
 <p>Retrieves termination setting details for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the GetVoiceConnectorTermination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetVoiceConnectorTerminationRequest
 @see AWSChimeGetVoiceConnectorTerminationResponse
 */
- (void)getVoiceConnectorTermination:(AWSChimeGetVoiceConnectorTerminationRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeGetVoiceConnectorTerminationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the last time a SIP <code>OPTIONS</code> ping was received from your SIP infrastructure for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the GetVoiceConnectorTerminationHealth service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeGetVoiceConnectorTerminationHealthResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetVoiceConnectorTerminationHealthRequest
 @see AWSChimeGetVoiceConnectorTerminationHealthResponse
 */
- (AWSTask<AWSChimeGetVoiceConnectorTerminationHealthResponse *> *)getVoiceConnectorTerminationHealth:(AWSChimeGetVoiceConnectorTerminationHealthRequest *)request;

/**
 <p>Retrieves information about the last time a SIP <code>OPTIONS</code> ping was received from your SIP infrastructure for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the GetVoiceConnectorTerminationHealth service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeGetVoiceConnectorTerminationHealthRequest
 @see AWSChimeGetVoiceConnectorTerminationHealthResponse
 */
- (void)getVoiceConnectorTerminationHealth:(AWSChimeGetVoiceConnectorTerminationHealthRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeGetVoiceConnectorTerminationHealthResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sends email to a maximum of 50 users, inviting them to the specified Amazon Chime <code>Team</code> account. Only <code>Team</code> account types are currently supported for this action. </p>
 
 @param request A container for the necessary parameters to execute the InviteUsers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeInviteUsersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeInviteUsersRequest
 @see AWSChimeInviteUsersResponse
 */
- (AWSTask<AWSChimeInviteUsersResponse *> *)inviteUsers:(AWSChimeInviteUsersRequest *)request;

/**
 <p>Sends email to a maximum of 50 users, inviting them to the specified Amazon Chime <code>Team</code> account. Only <code>Team</code> account types are currently supported for this action. </p>
 
 @param request A container for the necessary parameters to execute the InviteUsers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeInviteUsersRequest
 @see AWSChimeInviteUsersResponse
 */
- (void)inviteUsers:(AWSChimeInviteUsersRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeInviteUsersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the Amazon Chime accounts under the administrator's AWS account. You can filter accounts by account name prefix. To find out which Amazon Chime account a user belongs to, you can filter by the user's email address, which returns one account result.</p>
 
 @param request A container for the necessary parameters to execute the ListAccounts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeListAccountsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListAccountsRequest
 @see AWSChimeListAccountsResponse
 */
- (AWSTask<AWSChimeListAccountsResponse *> *)listAccounts:(AWSChimeListAccountsRequest *)request;

/**
 <p>Lists the Amazon Chime accounts under the administrator's AWS account. You can filter accounts by account name prefix. To find out which Amazon Chime account a user belongs to, you can filter by the user's email address, which returns one account result.</p>
 
 @param request A container for the necessary parameters to execute the ListAccounts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListAccountsRequest
 @see AWSChimeListAccountsResponse
 */
- (void)listAccounts:(AWSChimeListAccountsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeListAccountsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tags applied to an Amazon Chime SDK attendee resource.</p>
 
 @param request A container for the necessary parameters to execute the ListAttendeeTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeListAttendeeTagsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListAttendeeTagsRequest
 @see AWSChimeListAttendeeTagsResponse
 */
- (AWSTask<AWSChimeListAttendeeTagsResponse *> *)listAttendeeTags:(AWSChimeListAttendeeTagsRequest *)request;

/**
 <p>Lists the tags applied to an Amazon Chime SDK attendee resource.</p>
 
 @param request A container for the necessary parameters to execute the ListAttendeeTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListAttendeeTagsRequest
 @see AWSChimeListAttendeeTagsResponse
 */
- (void)listAttendeeTags:(AWSChimeListAttendeeTagsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeListAttendeeTagsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the attendees for the specified Amazon Chime SDK meeting. For more information about the Amazon Chime SDK, see <a href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListAttendees service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeListAttendeesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListAttendeesRequest
 @see AWSChimeListAttendeesResponse
 */
- (AWSTask<AWSChimeListAttendeesResponse *> *)listAttendees:(AWSChimeListAttendeesRequest *)request;

/**
 <p>Lists the attendees for the specified Amazon Chime SDK meeting. For more information about the Amazon Chime SDK, see <a href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListAttendees service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListAttendeesRequest
 @see AWSChimeListAttendeesResponse
 */
- (void)listAttendees:(AWSChimeListAttendeesRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeListAttendeesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the bots associated with the administrator's Amazon Chime Enterprise account ID.</p>
 
 @param request A container for the necessary parameters to execute the ListBots service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeListBotsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`, `AWSChimeErrorForbidden`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorBadRequest`, `AWSChimeErrorNotFound`, `AWSChimeErrorThrottledClient`.
 
 @see AWSChimeListBotsRequest
 @see AWSChimeListBotsResponse
 */
- (AWSTask<AWSChimeListBotsResponse *> *)listBots:(AWSChimeListBotsRequest *)request;

/**
 <p>Lists the bots associated with the administrator's Amazon Chime Enterprise account ID.</p>
 
 @param request A container for the necessary parameters to execute the ListBots service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`, `AWSChimeErrorForbidden`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorBadRequest`, `AWSChimeErrorNotFound`, `AWSChimeErrorThrottledClient`.
 
 @see AWSChimeListBotsRequest
 @see AWSChimeListBotsResponse
 */
- (void)listBots:(AWSChimeListBotsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeListBotsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tags applied to an Amazon Chime SDK meeting resource.</p>
 
 @param request A container for the necessary parameters to execute the ListMeetingTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeListMeetingTagsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListMeetingTagsRequest
 @see AWSChimeListMeetingTagsResponse
 */
- (AWSTask<AWSChimeListMeetingTagsResponse *> *)listMeetingTags:(AWSChimeListMeetingTagsRequest *)request;

/**
 <p>Lists the tags applied to an Amazon Chime SDK meeting resource.</p>
 
 @param request A container for the necessary parameters to execute the ListMeetingTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListMeetingTagsRequest
 @see AWSChimeListMeetingTagsResponse
 */
- (void)listMeetingTags:(AWSChimeListMeetingTagsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeListMeetingTagsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists up to 100 active Amazon Chime SDK meetings. For more information about the Amazon Chime SDK, see <a href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListMeetings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeListMeetingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListMeetingsRequest
 @see AWSChimeListMeetingsResponse
 */
- (AWSTask<AWSChimeListMeetingsResponse *> *)listMeetings:(AWSChimeListMeetingsRequest *)request;

/**
 <p>Lists up to 100 active Amazon Chime SDK meetings. For more information about the Amazon Chime SDK, see <a href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListMeetings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListMeetingsRequest
 @see AWSChimeListMeetingsResponse
 */
- (void)listMeetings:(AWSChimeListMeetingsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeListMeetingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the phone number orders for the administrator's Amazon Chime account.</p>
 
 @param request A container for the necessary parameters to execute the ListPhoneNumberOrders service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeListPhoneNumberOrdersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListPhoneNumberOrdersRequest
 @see AWSChimeListPhoneNumberOrdersResponse
 */
- (AWSTask<AWSChimeListPhoneNumberOrdersResponse *> *)listPhoneNumberOrders:(AWSChimeListPhoneNumberOrdersRequest *)request;

/**
 <p>Lists the phone number orders for the administrator's Amazon Chime account.</p>
 
 @param request A container for the necessary parameters to execute the ListPhoneNumberOrders service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListPhoneNumberOrdersRequest
 @see AWSChimeListPhoneNumberOrdersResponse
 */
- (void)listPhoneNumberOrders:(AWSChimeListPhoneNumberOrdersRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeListPhoneNumberOrdersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the phone numbers for the specified Amazon Chime account, Amazon Chime user, Amazon Chime Voice Connector, or Amazon Chime Voice Connector group.</p>
 
 @param request A container for the necessary parameters to execute the ListPhoneNumbers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeListPhoneNumbersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListPhoneNumbersRequest
 @see AWSChimeListPhoneNumbersResponse
 */
- (AWSTask<AWSChimeListPhoneNumbersResponse *> *)listPhoneNumbers:(AWSChimeListPhoneNumbersRequest *)request;

/**
 <p>Lists the phone numbers for the specified Amazon Chime account, Amazon Chime user, Amazon Chime Voice Connector, or Amazon Chime Voice Connector group.</p>
 
 @param request A container for the necessary parameters to execute the ListPhoneNumbers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListPhoneNumbersRequest
 @see AWSChimeListPhoneNumbersResponse
 */
- (void)listPhoneNumbers:(AWSChimeListPhoneNumbersRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeListPhoneNumbersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the proxy sessions for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the ListProxySessions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeListProxySessionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListProxySessionsRequest
 @see AWSChimeListProxySessionsResponse
 */
- (AWSTask<AWSChimeListProxySessionsResponse *> *)listProxySessions:(AWSChimeListProxySessionsRequest *)request;

/**
 <p>Lists the proxy sessions for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the ListProxySessions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListProxySessionsRequest
 @see AWSChimeListProxySessionsResponse
 */
- (void)listProxySessions:(AWSChimeListProxySessionsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeListProxySessionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the membership details for the specified room in an Amazon Chime Enterprise account, such as the members' IDs, email addresses, and names.</p>
 
 @param request A container for the necessary parameters to execute the ListRoomMemberships service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeListRoomMembershipsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorNotFound`, `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListRoomMembershipsRequest
 @see AWSChimeListRoomMembershipsResponse
 */
- (AWSTask<AWSChimeListRoomMembershipsResponse *> *)listRoomMemberships:(AWSChimeListRoomMembershipsRequest *)request;

/**
 <p>Lists the membership details for the specified room in an Amazon Chime Enterprise account, such as the members' IDs, email addresses, and names.</p>
 
 @param request A container for the necessary parameters to execute the ListRoomMemberships service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorNotFound`, `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListRoomMembershipsRequest
 @see AWSChimeListRoomMembershipsResponse
 */
- (void)listRoomMemberships:(AWSChimeListRoomMembershipsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeListRoomMembershipsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the room details for the specified Amazon Chime Enterprise account. Optionally, filter the results by a member ID (user ID or bot ID) to see a list of rooms that the member belongs to.</p>
 
 @param request A container for the necessary parameters to execute the ListRooms service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeListRoomsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorNotFound`, `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListRoomsRequest
 @see AWSChimeListRoomsResponse
 */
- (AWSTask<AWSChimeListRoomsResponse *> *)listRooms:(AWSChimeListRoomsRequest *)request;

/**
 <p>Lists the room details for the specified Amazon Chime Enterprise account. Optionally, filter the results by a member ID (user ID or bot ID) to see a list of rooms that the member belongs to.</p>
 
 @param request A container for the necessary parameters to execute the ListRooms service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorNotFound`, `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListRoomsRequest
 @see AWSChimeListRoomsResponse
 */
- (void)listRooms:(AWSChimeListRoomsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeListRoomsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tags applied to an Amazon Chime SDK meeting resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListTagsForResourceRequest
 @see AWSChimeListTagsForResourceResponse
 */
- (AWSTask<AWSChimeListTagsForResourceResponse *> *)listTagsForResource:(AWSChimeListTagsForResourceRequest *)request;

/**
 <p>Lists the tags applied to an Amazon Chime SDK meeting resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListTagsForResourceRequest
 @see AWSChimeListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSChimeListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the users that belong to the specified Amazon Chime account. You can specify an email address to list only the user that the email address belongs to.</p>
 
 @param request A container for the necessary parameters to execute the ListUsers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeListUsersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListUsersRequest
 @see AWSChimeListUsersResponse
 */
- (AWSTask<AWSChimeListUsersResponse *> *)listUsers:(AWSChimeListUsersRequest *)request;

/**
 <p>Lists the users that belong to the specified Amazon Chime account. You can specify an email address to list only the user that the email address belongs to.</p>
 
 @param request A container for the necessary parameters to execute the ListUsers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListUsersRequest
 @see AWSChimeListUsersResponse
 */
- (void)listUsers:(AWSChimeListUsersRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeListUsersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the Amazon Chime Voice Connector groups for the administrator's AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListVoiceConnectorGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeListVoiceConnectorGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListVoiceConnectorGroupsRequest
 @see AWSChimeListVoiceConnectorGroupsResponse
 */
- (AWSTask<AWSChimeListVoiceConnectorGroupsResponse *> *)listVoiceConnectorGroups:(AWSChimeListVoiceConnectorGroupsRequest *)request;

/**
 <p>Lists the Amazon Chime Voice Connector groups for the administrator's AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListVoiceConnectorGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListVoiceConnectorGroupsRequest
 @see AWSChimeListVoiceConnectorGroupsResponse
 */
- (void)listVoiceConnectorGroups:(AWSChimeListVoiceConnectorGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeListVoiceConnectorGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the SIP credentials for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the ListVoiceConnectorTerminationCredentials service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeListVoiceConnectorTerminationCredentialsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListVoiceConnectorTerminationCredentialsRequest
 @see AWSChimeListVoiceConnectorTerminationCredentialsResponse
 */
- (AWSTask<AWSChimeListVoiceConnectorTerminationCredentialsResponse *> *)listVoiceConnectorTerminationCredentials:(AWSChimeListVoiceConnectorTerminationCredentialsRequest *)request;

/**
 <p>Lists the SIP credentials for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the ListVoiceConnectorTerminationCredentials service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListVoiceConnectorTerminationCredentialsRequest
 @see AWSChimeListVoiceConnectorTerminationCredentialsResponse
 */
- (void)listVoiceConnectorTerminationCredentials:(AWSChimeListVoiceConnectorTerminationCredentialsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeListVoiceConnectorTerminationCredentialsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the Amazon Chime Voice Connectors for the administrator's AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListVoiceConnectors service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeListVoiceConnectorsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListVoiceConnectorsRequest
 @see AWSChimeListVoiceConnectorsResponse
 */
- (AWSTask<AWSChimeListVoiceConnectorsResponse *> *)listVoiceConnectors:(AWSChimeListVoiceConnectorsRequest *)request;

/**
 <p>Lists the Amazon Chime Voice Connectors for the administrator's AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListVoiceConnectors service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeListVoiceConnectorsRequest
 @see AWSChimeListVoiceConnectorsResponse
 */
- (void)listVoiceConnectors:(AWSChimeListVoiceConnectorsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeListVoiceConnectorsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Logs out the specified user from all of the devices they are currently logged into.</p>
 
 @param request A container for the necessary parameters to execute the LogoutUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeLogoutUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeLogoutUserRequest
 @see AWSChimeLogoutUserResponse
 */
- (AWSTask<AWSChimeLogoutUserResponse *> *)logoutUser:(AWSChimeLogoutUserRequest *)request;

/**
 <p>Logs out the specified user from all of the devices they are currently logged into.</p>
 
 @param request A container for the necessary parameters to execute the LogoutUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeLogoutUserRequest
 @see AWSChimeLogoutUserResponse
 */
- (void)logoutUser:(AWSChimeLogoutUserRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeLogoutUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an events configuration that allows a bot to receive outgoing events sent by Amazon Chime. Choose either an HTTPS endpoint or a Lambda function ARN. For more information, see <a>Bot</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutEventsConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimePutEventsConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorNotFound`.
 
 @see AWSChimePutEventsConfigurationRequest
 @see AWSChimePutEventsConfigurationResponse
 */
- (AWSTask<AWSChimePutEventsConfigurationResponse *> *)putEventsConfiguration:(AWSChimePutEventsConfigurationRequest *)request;

/**
 <p>Creates an events configuration that allows a bot to receive outgoing events sent by Amazon Chime. Choose either an HTTPS endpoint or a Lambda function ARN. For more information, see <a>Bot</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutEventsConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorNotFound`.
 
 @see AWSChimePutEventsConfigurationRequest
 @see AWSChimePutEventsConfigurationResponse
 */
- (void)putEventsConfiguration:(AWSChimePutEventsConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSChimePutEventsConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Puts retention settings for the specified Amazon Chime Enterprise account. We recommend using AWS CloudTrail to monitor usage of this API for your account. For more information, see <a href="https://docs.aws.amazon.com/chime/latest/ag/cloudtrail.html">Logging Amazon Chime API Calls with AWS CloudTrail</a> in the <i>Amazon Chime Administration Guide</i>.</p><p>To turn off existing retention settings, remove the number of days from the corresponding <b>RetentionDays</b> field in the <b>RetentionSettings</b> object. For more information about retention settings, see <a href="https://docs.aws.amazon.com/chime/latest/ag/chat-retention.html">Managing Chat Retention Policies</a> in the <i>Amazon Chime Administration Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutRetentionSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimePutRetentionSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorConflict`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimePutRetentionSettingsRequest
 @see AWSChimePutRetentionSettingsResponse
 */
- (AWSTask<AWSChimePutRetentionSettingsResponse *> *)putRetentionSettings:(AWSChimePutRetentionSettingsRequest *)request;

/**
 <p>Puts retention settings for the specified Amazon Chime Enterprise account. We recommend using AWS CloudTrail to monitor usage of this API for your account. For more information, see <a href="https://docs.aws.amazon.com/chime/latest/ag/cloudtrail.html">Logging Amazon Chime API Calls with AWS CloudTrail</a> in the <i>Amazon Chime Administration Guide</i>.</p><p>To turn off existing retention settings, remove the number of days from the corresponding <b>RetentionDays</b> field in the <b>RetentionSettings</b> object. For more information about retention settings, see <a href="https://docs.aws.amazon.com/chime/latest/ag/chat-retention.html">Managing Chat Retention Policies</a> in the <i>Amazon Chime Administration Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutRetentionSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorConflict`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimePutRetentionSettingsRequest
 @see AWSChimePutRetentionSettingsResponse
 */
- (void)putRetentionSettings:(AWSChimePutRetentionSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimePutRetentionSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds a logging configuration for the specified Amazon Chime Voice Connector. The logging configuration specifies whether SIP message logs are enabled for sending to Amazon CloudWatch Logs.</p>
 
 @param request A container for the necessary parameters to execute the PutVoiceConnectorLoggingConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimePutVoiceConnectorLoggingConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimePutVoiceConnectorLoggingConfigurationRequest
 @see AWSChimePutVoiceConnectorLoggingConfigurationResponse
 */
- (AWSTask<AWSChimePutVoiceConnectorLoggingConfigurationResponse *> *)putVoiceConnectorLoggingConfiguration:(AWSChimePutVoiceConnectorLoggingConfigurationRequest *)request;

/**
 <p>Adds a logging configuration for the specified Amazon Chime Voice Connector. The logging configuration specifies whether SIP message logs are enabled for sending to Amazon CloudWatch Logs.</p>
 
 @param request A container for the necessary parameters to execute the PutVoiceConnectorLoggingConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimePutVoiceConnectorLoggingConfigurationRequest
 @see AWSChimePutVoiceConnectorLoggingConfigurationResponse
 */
- (void)putVoiceConnectorLoggingConfiguration:(AWSChimePutVoiceConnectorLoggingConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSChimePutVoiceConnectorLoggingConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds origination settings for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the PutVoiceConnectorOrigination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimePutVoiceConnectorOriginationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimePutVoiceConnectorOriginationRequest
 @see AWSChimePutVoiceConnectorOriginationResponse
 */
- (AWSTask<AWSChimePutVoiceConnectorOriginationResponse *> *)putVoiceConnectorOrigination:(AWSChimePutVoiceConnectorOriginationRequest *)request;

/**
 <p>Adds origination settings for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the PutVoiceConnectorOrigination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimePutVoiceConnectorOriginationRequest
 @see AWSChimePutVoiceConnectorOriginationResponse
 */
- (void)putVoiceConnectorOrigination:(AWSChimePutVoiceConnectorOriginationRequest *)request completionHandler:(void (^ _Nullable)(AWSChimePutVoiceConnectorOriginationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Puts the specified proxy configuration to the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the PutVoiceConnectorProxy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimePutVoiceConnectorProxyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorAccessDenied`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimePutVoiceConnectorProxyRequest
 @see AWSChimePutVoiceConnectorProxyResponse
 */
- (AWSTask<AWSChimePutVoiceConnectorProxyResponse *> *)putVoiceConnectorProxy:(AWSChimePutVoiceConnectorProxyRequest *)request;

/**
 <p>Puts the specified proxy configuration to the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the PutVoiceConnectorProxy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorAccessDenied`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimePutVoiceConnectorProxyRequest
 @see AWSChimePutVoiceConnectorProxyResponse
 */
- (void)putVoiceConnectorProxy:(AWSChimePutVoiceConnectorProxyRequest *)request completionHandler:(void (^ _Nullable)(AWSChimePutVoiceConnectorProxyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds a streaming configuration for the specified Amazon Chime Voice Connector. The streaming configuration specifies whether media streaming is enabled for sending to Amazon Kinesis. It also sets the retention period, in hours, for the Amazon Kinesis data.</p>
 
 @param request A container for the necessary parameters to execute the PutVoiceConnectorStreamingConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimePutVoiceConnectorStreamingConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimePutVoiceConnectorStreamingConfigurationRequest
 @see AWSChimePutVoiceConnectorStreamingConfigurationResponse
 */
- (AWSTask<AWSChimePutVoiceConnectorStreamingConfigurationResponse *> *)putVoiceConnectorStreamingConfiguration:(AWSChimePutVoiceConnectorStreamingConfigurationRequest *)request;

/**
 <p>Adds a streaming configuration for the specified Amazon Chime Voice Connector. The streaming configuration specifies whether media streaming is enabled for sending to Amazon Kinesis. It also sets the retention period, in hours, for the Amazon Kinesis data.</p>
 
 @param request A container for the necessary parameters to execute the PutVoiceConnectorStreamingConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimePutVoiceConnectorStreamingConfigurationRequest
 @see AWSChimePutVoiceConnectorStreamingConfigurationResponse
 */
- (void)putVoiceConnectorStreamingConfiguration:(AWSChimePutVoiceConnectorStreamingConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSChimePutVoiceConnectorStreamingConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds termination settings for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the PutVoiceConnectorTermination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimePutVoiceConnectorTerminationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorAccessDenied`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimePutVoiceConnectorTerminationRequest
 @see AWSChimePutVoiceConnectorTerminationResponse
 */
- (AWSTask<AWSChimePutVoiceConnectorTerminationResponse *> *)putVoiceConnectorTermination:(AWSChimePutVoiceConnectorTerminationRequest *)request;

/**
 <p>Adds termination settings for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the PutVoiceConnectorTermination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorAccessDenied`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimePutVoiceConnectorTerminationRequest
 @see AWSChimePutVoiceConnectorTerminationResponse
 */
- (void)putVoiceConnectorTermination:(AWSChimePutVoiceConnectorTerminationRequest *)request completionHandler:(void (^ _Nullable)(AWSChimePutVoiceConnectorTerminationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds termination SIP credentials for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the PutVoiceConnectorTerminationCredentials service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimePutVoiceConnectorTerminationCredentialsRequest
 */
- (AWSTask *)putVoiceConnectorTerminationCredentials:(AWSChimePutVoiceConnectorTerminationCredentialsRequest *)request;

/**
 <p>Adds termination SIP credentials for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the PutVoiceConnectorTerminationCredentials service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimePutVoiceConnectorTerminationCredentialsRequest
 */
- (void)putVoiceConnectorTerminationCredentials:(AWSChimePutVoiceConnectorTerminationCredentialsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Redacts the specified message from the specified Amazon Chime conversation.</p>
 
 @param request A container for the necessary parameters to execute the RedactConversationMessage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeRedactConversationMessageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorBadRequest`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeRedactConversationMessageRequest
 @see AWSChimeRedactConversationMessageResponse
 */
- (AWSTask<AWSChimeRedactConversationMessageResponse *> *)redactConversationMessage:(AWSChimeRedactConversationMessageRequest *)request;

/**
 <p>Redacts the specified message from the specified Amazon Chime conversation.</p>
 
 @param request A container for the necessary parameters to execute the RedactConversationMessage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorBadRequest`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeRedactConversationMessageRequest
 @see AWSChimeRedactConversationMessageResponse
 */
- (void)redactConversationMessage:(AWSChimeRedactConversationMessageRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeRedactConversationMessageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Redacts the specified message from the specified Amazon Chime chat room.</p>
 
 @param request A container for the necessary parameters to execute the RedactRoomMessage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeRedactRoomMessageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorBadRequest`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeRedactRoomMessageRequest
 @see AWSChimeRedactRoomMessageResponse
 */
- (AWSTask<AWSChimeRedactRoomMessageResponse *> *)redactRoomMessage:(AWSChimeRedactRoomMessageRequest *)request;

/**
 <p>Redacts the specified message from the specified Amazon Chime chat room.</p>
 
 @param request A container for the necessary parameters to execute the RedactRoomMessage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorBadRequest`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeRedactRoomMessageRequest
 @see AWSChimeRedactRoomMessageResponse
 */
- (void)redactRoomMessage:(AWSChimeRedactRoomMessageRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeRedactRoomMessageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Regenerates the security token for a bot.</p>
 
 @param request A container for the necessary parameters to execute the RegenerateSecurityToken service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeRegenerateSecurityTokenResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorThrottledClient`.
 
 @see AWSChimeRegenerateSecurityTokenRequest
 @see AWSChimeRegenerateSecurityTokenResponse
 */
- (AWSTask<AWSChimeRegenerateSecurityTokenResponse *> *)regenerateSecurityToken:(AWSChimeRegenerateSecurityTokenRequest *)request;

/**
 <p>Regenerates the security token for a bot.</p>
 
 @param request A container for the necessary parameters to execute the RegenerateSecurityToken service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorThrottledClient`.
 
 @see AWSChimeRegenerateSecurityTokenRequest
 @see AWSChimeRegenerateSecurityTokenResponse
 */
- (void)regenerateSecurityToken:(AWSChimeRegenerateSecurityTokenRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeRegenerateSecurityTokenResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Resets the personal meeting PIN for the specified user on an Amazon Chime account. Returns the <a>User</a> object with the updated personal meeting PIN.</p>
 
 @param request A container for the necessary parameters to execute the ResetPersonalPIN service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeResetPersonalPINResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeResetPersonalPINRequest
 @see AWSChimeResetPersonalPINResponse
 */
- (AWSTask<AWSChimeResetPersonalPINResponse *> *)resetPersonalPIN:(AWSChimeResetPersonalPINRequest *)request;

/**
 <p>Resets the personal meeting PIN for the specified user on an Amazon Chime account. Returns the <a>User</a> object with the updated personal meeting PIN.</p>
 
 @param request A container for the necessary parameters to execute the ResetPersonalPIN service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeResetPersonalPINRequest
 @see AWSChimeResetPersonalPINResponse
 */
- (void)resetPersonalPIN:(AWSChimeResetPersonalPINRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeResetPersonalPINResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Moves a phone number from the <b>Deletion queue</b> back into the phone number <b>Inventory</b>.</p>
 
 @param request A container for the necessary parameters to execute the RestorePhoneNumber service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeRestorePhoneNumberResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeRestorePhoneNumberRequest
 @see AWSChimeRestorePhoneNumberResponse
 */
- (AWSTask<AWSChimeRestorePhoneNumberResponse *> *)restorePhoneNumber:(AWSChimeRestorePhoneNumberRequest *)request;

/**
 <p>Moves a phone number from the <b>Deletion queue</b> back into the phone number <b>Inventory</b>.</p>
 
 @param request A container for the necessary parameters to execute the RestorePhoneNumber service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeRestorePhoneNumberRequest
 @see AWSChimeRestorePhoneNumberResponse
 */
- (void)restorePhoneNumber:(AWSChimeRestorePhoneNumberRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeRestorePhoneNumberResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches phone numbers that can be ordered.</p>
 
 @param request A container for the necessary parameters to execute the SearchAvailablePhoneNumbers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSearchAvailablePhoneNumbersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorAccessDenied`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeSearchAvailablePhoneNumbersRequest
 @see AWSChimeSearchAvailablePhoneNumbersResponse
 */
- (AWSTask<AWSChimeSearchAvailablePhoneNumbersResponse *> *)searchAvailablePhoneNumbers:(AWSChimeSearchAvailablePhoneNumbersRequest *)request;

/**
 <p>Searches phone numbers that can be ordered.</p>
 
 @param request A container for the necessary parameters to execute the SearchAvailablePhoneNumbers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorAccessDenied`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeSearchAvailablePhoneNumbersRequest
 @see AWSChimeSearchAvailablePhoneNumbersResponse
 */
- (void)searchAvailablePhoneNumbers:(AWSChimeSearchAvailablePhoneNumbersRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSearchAvailablePhoneNumbersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Applies the specified tags to the specified Amazon Chime SDK attendee.</p>
 
 @param request A container for the necessary parameters to execute the TagAttendee service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeTagAttendeeRequest
 */
- (AWSTask *)tagAttendee:(AWSChimeTagAttendeeRequest *)request;

/**
 <p>Applies the specified tags to the specified Amazon Chime SDK attendee.</p>
 
 @param request A container for the necessary parameters to execute the TagAttendee service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeTagAttendeeRequest
 */
- (void)tagAttendee:(AWSChimeTagAttendeeRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Applies the specified tags to the specified Amazon Chime SDK meeting.</p>
 
 @param request A container for the necessary parameters to execute the TagMeeting service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeTagMeetingRequest
 */
- (AWSTask *)tagMeeting:(AWSChimeTagMeetingRequest *)request;

/**
 <p>Applies the specified tags to the specified Amazon Chime SDK meeting.</p>
 
 @param request A container for the necessary parameters to execute the TagMeeting service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorResourceLimitExceeded`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeTagMeetingRequest
 */
- (void)tagMeeting:(AWSChimeTagMeetingRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Applies the specified tags to the specified Amazon Chime SDK meeting resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeTagResourceRequest
 */
- (AWSTask *)tagResource:(AWSChimeTagResourceRequest *)request;

/**
 <p>Applies the specified tags to the specified Amazon Chime SDK meeting resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeTagResourceRequest
 */
- (void)tagResource:(AWSChimeTagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Untags the specified tags from the specified Amazon Chime SDK attendee.</p>
 
 @param request A container for the necessary parameters to execute the UntagAttendee service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUntagAttendeeRequest
 */
- (AWSTask *)untagAttendee:(AWSChimeUntagAttendeeRequest *)request;

/**
 <p>Untags the specified tags from the specified Amazon Chime SDK attendee.</p>
 
 @param request A container for the necessary parameters to execute the UntagAttendee service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUntagAttendeeRequest
 */
- (void)untagAttendee:(AWSChimeUntagAttendeeRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Untags the specified tags from the specified Amazon Chime SDK meeting.</p>
 
 @param request A container for the necessary parameters to execute the UntagMeeting service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUntagMeetingRequest
 */
- (AWSTask *)untagMeeting:(AWSChimeUntagMeetingRequest *)request;

/**
 <p>Untags the specified tags from the specified Amazon Chime SDK meeting.</p>
 
 @param request A container for the necessary parameters to execute the UntagMeeting service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUntagMeetingRequest
 */
- (void)untagMeeting:(AWSChimeUntagMeetingRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Untags the specified tags from the specified Amazon Chime SDK meeting resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUntagResourceRequest
 */
- (AWSTask *)untagResource:(AWSChimeUntagResourceRequest *)request;

/**
 <p>Untags the specified tags from the specified Amazon Chime SDK meeting resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUntagResourceRequest
 */
- (void)untagResource:(AWSChimeUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates account details for the specified Amazon Chime account. Currently, only account name updates are supported for this action.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeUpdateAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUpdateAccountRequest
 @see AWSChimeUpdateAccountResponse
 */
- (AWSTask<AWSChimeUpdateAccountResponse *> *)updateAccount:(AWSChimeUpdateAccountRequest *)request;

/**
 <p>Updates account details for the specified Amazon Chime account. Currently, only account name updates are supported for this action.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUpdateAccountRequest
 @see AWSChimeUpdateAccountResponse
 */
- (void)updateAccount:(AWSChimeUpdateAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeUpdateAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the settings for the specified Amazon Chime account. You can update settings for remote control of shared screens, or for the dial-out option. For more information about these settings, see <a href="https://docs.aws.amazon.com/chime/latest/ag/policies.html">Use the Policies Page</a> in the <i>Amazon Chime Administration Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAccountSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeUpdateAccountSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorConflict`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUpdateAccountSettingsRequest
 @see AWSChimeUpdateAccountSettingsResponse
 */
- (AWSTask<AWSChimeUpdateAccountSettingsResponse *> *)updateAccountSettings:(AWSChimeUpdateAccountSettingsRequest *)request;

/**
 <p>Updates the settings for the specified Amazon Chime account. You can update settings for remote control of shared screens, or for the dial-out option. For more information about these settings, see <a href="https://docs.aws.amazon.com/chime/latest/ag/policies.html">Use the Policies Page</a> in the <i>Amazon Chime Administration Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAccountSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorConflict`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUpdateAccountSettingsRequest
 @see AWSChimeUpdateAccountSettingsResponse
 */
- (void)updateAccountSettings:(AWSChimeUpdateAccountSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeUpdateAccountSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the status of the specified bot, such as starting or stopping the bot from running in your Amazon Chime Enterprise account.</p>
 
 @param request A container for the necessary parameters to execute the UpdateBot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeUpdateBotResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorThrottledClient`.
 
 @see AWSChimeUpdateBotRequest
 @see AWSChimeUpdateBotResponse
 */
- (AWSTask<AWSChimeUpdateBotResponse *> *)updateBot:(AWSChimeUpdateBotRequest *)request;

/**
 <p>Updates the status of the specified bot, such as starting or stopping the bot from running in your Amazon Chime Enterprise account.</p>
 
 @param request A container for the necessary parameters to execute the UpdateBot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorThrottledClient`.
 
 @see AWSChimeUpdateBotRequest
 @see AWSChimeUpdateBotResponse
 */
- (void)updateBot:(AWSChimeUpdateBotRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeUpdateBotResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates global settings for the administrator's AWS account, such as Amazon Chime Business Calling and Amazon Chime Voice Connector settings.</p>
 
 @param request A container for the necessary parameters to execute the UpdateGlobalSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUpdateGlobalSettingsRequest
 */
- (AWSTask *)updateGlobalSettings:(AWSChimeUpdateGlobalSettingsRequest *)request;

/**
 <p>Updates global settings for the administrator's AWS account, such as Amazon Chime Business Calling and Amazon Chime Voice Connector settings.</p>
 
 @param request A container for the necessary parameters to execute the UpdateGlobalSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUpdateGlobalSettingsRequest
 */
- (void)updateGlobalSettings:(AWSChimeUpdateGlobalSettingsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates phone number details, such as product type or calling name, for the specified phone number ID. You can update one phone number detail at a time. For example, you can update either the product type or the calling name in one action.</p><p>For toll-free numbers, you must use the Amazon Chime Voice Connector product type.</p><p>Updates to outbound calling names can take up to 72 hours to complete. Pending updates to outbound calling names must be complete before you can request another update.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePhoneNumber service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeUpdatePhoneNumberResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUpdatePhoneNumberRequest
 @see AWSChimeUpdatePhoneNumberResponse
 */
- (AWSTask<AWSChimeUpdatePhoneNumberResponse *> *)updatePhoneNumber:(AWSChimeUpdatePhoneNumberRequest *)request;

/**
 <p>Updates phone number details, such as product type or calling name, for the specified phone number ID. You can update one phone number detail at a time. For example, you can update either the product type or the calling name in one action.</p><p>For toll-free numbers, you must use the Amazon Chime Voice Connector product type.</p><p>Updates to outbound calling names can take up to 72 hours to complete. Pending updates to outbound calling names must be complete before you can request another update.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePhoneNumber service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUpdatePhoneNumberRequest
 @see AWSChimeUpdatePhoneNumberResponse
 */
- (void)updatePhoneNumber:(AWSChimeUpdatePhoneNumberRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeUpdatePhoneNumberResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the phone number settings for the administrator's AWS account, such as the default outbound calling name. You can update the default outbound calling name once every seven days. Outbound calling names can take up to 72 hours to update.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePhoneNumberSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUpdatePhoneNumberSettingsRequest
 */
- (AWSTask *)updatePhoneNumberSettings:(AWSChimeUpdatePhoneNumberSettingsRequest *)request;

/**
 <p>Updates the phone number settings for the administrator's AWS account, such as the default outbound calling name. You can update the default outbound calling name once every seven days. Outbound calling names can take up to 72 hours to update.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePhoneNumberSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUpdatePhoneNumberSettingsRequest
 */
- (void)updatePhoneNumberSettings:(AWSChimeUpdatePhoneNumberSettingsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified proxy session details, such as voice or SMS capabilities.</p>
 
 @param request A container for the necessary parameters to execute the UpdateProxySession service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeUpdateProxySessionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUpdateProxySessionRequest
 @see AWSChimeUpdateProxySessionResponse
 */
- (AWSTask<AWSChimeUpdateProxySessionResponse *> *)updateProxySession:(AWSChimeUpdateProxySessionRequest *)request;

/**
 <p>Updates the specified proxy session details, such as voice or SMS capabilities.</p>
 
 @param request A container for the necessary parameters to execute the UpdateProxySession service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUpdateProxySessionRequest
 @see AWSChimeUpdateProxySessionResponse
 */
- (void)updateProxySession:(AWSChimeUpdateProxySessionRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeUpdateProxySessionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates room details, such as the room name, for a room in an Amazon Chime Enterprise account.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRoom service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeUpdateRoomResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUpdateRoomRequest
 @see AWSChimeUpdateRoomResponse
 */
- (AWSTask<AWSChimeUpdateRoomResponse *> *)updateRoom:(AWSChimeUpdateRoomRequest *)request;

/**
 <p>Updates room details, such as the room name, for a room in an Amazon Chime Enterprise account.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRoom service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorNotFound`, `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUpdateRoomRequest
 @see AWSChimeUpdateRoomResponse
 */
- (void)updateRoom:(AWSChimeUpdateRoomRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeUpdateRoomResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates room membership details, such as the member role, for a room in an Amazon Chime Enterprise account. The member role designates whether the member is a chat room administrator or a general chat room member. The member role can be updated only for user IDs.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRoomMembership service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeUpdateRoomMembershipResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUpdateRoomMembershipRequest
 @see AWSChimeUpdateRoomMembershipResponse
 */
- (AWSTask<AWSChimeUpdateRoomMembershipResponse *> *)updateRoomMembership:(AWSChimeUpdateRoomMembershipRequest *)request;

/**
 <p>Updates room membership details, such as the member role, for a room in an Amazon Chime Enterprise account. The member role designates whether the member is a chat room administrator or a general chat room member. The member role can be updated only for user IDs.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRoomMembership service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorBadRequest`, `AWSChimeErrorForbidden`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUpdateRoomMembershipRequest
 @see AWSChimeUpdateRoomMembershipResponse
 */
- (void)updateRoomMembership:(AWSChimeUpdateRoomMembershipRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeUpdateRoomMembershipResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates user details for a specified user ID. Currently, only <code>LicenseType</code> updates are supported for this action.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeUpdateUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUpdateUserRequest
 @see AWSChimeUpdateUserResponse
 */
- (AWSTask<AWSChimeUpdateUserResponse *> *)updateUser:(AWSChimeUpdateUserRequest *)request;

/**
 <p>Updates user details for a specified user ID. Currently, only <code>LicenseType</code> updates are supported for this action.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUpdateUserRequest
 @see AWSChimeUpdateUserResponse
 */
- (void)updateUser:(AWSChimeUpdateUserRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeUpdateUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the settings for the specified user, such as phone number settings.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUpdateUserSettingsRequest
 */
- (AWSTask *)updateUserSettings:(AWSChimeUpdateUserSettingsRequest *)request;

/**
 <p>Updates the settings for the specified user, such as phone number settings.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUpdateUserSettingsRequest
 */
- (void)updateUserSettings:(AWSChimeUpdateUserSettingsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates details for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVoiceConnector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeUpdateVoiceConnectorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUpdateVoiceConnectorRequest
 @see AWSChimeUpdateVoiceConnectorResponse
 */
- (AWSTask<AWSChimeUpdateVoiceConnectorResponse *> *)updateVoiceConnector:(AWSChimeUpdateVoiceConnectorRequest *)request;

/**
 <p>Updates details for the specified Amazon Chime Voice Connector.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVoiceConnector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUpdateVoiceConnectorRequest
 @see AWSChimeUpdateVoiceConnectorResponse
 */
- (void)updateVoiceConnector:(AWSChimeUpdateVoiceConnectorRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeUpdateVoiceConnectorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates details for the specified Amazon Chime Voice Connector group, such as the name and Amazon Chime Voice Connector priority ranking.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVoiceConnectorGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeUpdateVoiceConnectorGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorConflict`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUpdateVoiceConnectorGroupRequest
 @see AWSChimeUpdateVoiceConnectorGroupResponse
 */
- (AWSTask<AWSChimeUpdateVoiceConnectorGroupResponse *> *)updateVoiceConnectorGroup:(AWSChimeUpdateVoiceConnectorGroupRequest *)request;

/**
 <p>Updates details for the specified Amazon Chime Voice Connector group, such as the name and Amazon Chime Voice Connector priority ranking.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVoiceConnectorGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeErrorDomain` domain and the following error code: `AWSChimeErrorUnauthorizedClient`, `AWSChimeErrorNotFound`, `AWSChimeErrorForbidden`, `AWSChimeErrorBadRequest`, `AWSChimeErrorConflict`, `AWSChimeErrorThrottledClient`, `AWSChimeErrorServiceUnavailable`, `AWSChimeErrorServiceFailure`.
 
 @see AWSChimeUpdateVoiceConnectorGroupRequest
 @see AWSChimeUpdateVoiceConnectorGroupResponse
 */
- (void)updateVoiceConnectorGroup:(AWSChimeUpdateVoiceConnectorGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeUpdateVoiceConnectorGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
