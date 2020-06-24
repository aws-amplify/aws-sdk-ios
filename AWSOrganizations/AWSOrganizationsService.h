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
#import "AWSOrganizationsModel.h"
#import "AWSOrganizationsResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSOrganizations
FOUNDATION_EXPORT NSString *const AWSOrganizationsSDKVersion;

/**
 <fullname>AWS Organizations</fullname>
 */
@interface AWSOrganizations : AWSService

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

     let Organizations = AWSOrganizations.default()

 *Objective-C*

     AWSOrganizations *Organizations = [AWSOrganizations defaultOrganizations];

 @return The default service client.
 */
+ (instancetype)defaultOrganizations;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSOrganizations.register(with: configuration!, forKey: "USWest2Organizations")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:@"USWest2Organizations"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Organizations = AWSOrganizations(forKey: "USWest2Organizations")

 *Objective-C*

     AWSOrganizations *Organizations = [AWSOrganizations OrganizationsForKey:@"USWest2Organizations"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerOrganizationsWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerOrganizationsWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSOrganizations.register(with: configuration!, forKey: "USWest2Organizations")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:@"USWest2Organizations"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Organizations = AWSOrganizations(forKey: "USWest2Organizations")

 *Objective-C*

     AWSOrganizations *Organizations = [AWSOrganizations OrganizationsForKey:@"USWest2Organizations"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)OrganizationsForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeOrganizationsForKey:(NSString *)key;

/**
 <p>Sends a response to the originator of a handshake agreeing to the action proposed by the handshake request. </p><p>This operation can be called only by the following principals when they also have the relevant IAM permissions:</p><ul><li><p><b>Invitation to join</b> or <b>Approve all features request</b> handshakes: only a principal from the member account. </p><p>The user who calls the API for an invitation to join must have the <code>organizations:AcceptHandshake</code> permission. If you enabled all features in the organization, the user must also have the <code>iam:CreateServiceLinkedRole</code> permission so that AWS Organizations can create the required service-linked role named <code>AWSServiceRoleForOrganizations</code>. For more information, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_integration_services.html#orgs_integration_service-linked-roles">AWS Organizations and Service-Linked Roles</a> in the <i>AWS Organizations User Guide</i>.</p></li><li><p><b>Enable all features final confirmation</b> handshake: only a principal from the master account.</p><p>For more information about invitations, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_invites.html">Inviting an AWS Account to Join Your Organization</a> in the <i>AWS Organizations User Guide.</i> For more information about requests to enable all features in the organization, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html">Enabling All Features in Your Organization</a> in the <i>AWS Organizations User Guide.</i></p></li></ul><p>After you accept a handshake, it continues to appear in the results of relevant APIs for only 30 days. After that, it's deleted.</p>
 
 @param request A container for the necessary parameters to execute the AcceptHandshake service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsAcceptHandshakeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorHandshakeConstraintViolation`, `AWSOrganizationsErrorHandshakeNotFound`, `AWSOrganizationsErrorInvalidHandshakeTransition`, `AWSOrganizationsErrorHandshakeAlreadyInState`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorAccessDeniedForDependency`.
 
 @see AWSOrganizationsAcceptHandshakeRequest
 @see AWSOrganizationsAcceptHandshakeResponse
 */
- (AWSTask<AWSOrganizationsAcceptHandshakeResponse *> *)acceptHandshake:(AWSOrganizationsAcceptHandshakeRequest *)request;

/**
 <p>Sends a response to the originator of a handshake agreeing to the action proposed by the handshake request. </p><p>This operation can be called only by the following principals when they also have the relevant IAM permissions:</p><ul><li><p><b>Invitation to join</b> or <b>Approve all features request</b> handshakes: only a principal from the member account. </p><p>The user who calls the API for an invitation to join must have the <code>organizations:AcceptHandshake</code> permission. If you enabled all features in the organization, the user must also have the <code>iam:CreateServiceLinkedRole</code> permission so that AWS Organizations can create the required service-linked role named <code>AWSServiceRoleForOrganizations</code>. For more information, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_integration_services.html#orgs_integration_service-linked-roles">AWS Organizations and Service-Linked Roles</a> in the <i>AWS Organizations User Guide</i>.</p></li><li><p><b>Enable all features final confirmation</b> handshake: only a principal from the master account.</p><p>For more information about invitations, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_invites.html">Inviting an AWS Account to Join Your Organization</a> in the <i>AWS Organizations User Guide.</i> For more information about requests to enable all features in the organization, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html">Enabling All Features in Your Organization</a> in the <i>AWS Organizations User Guide.</i></p></li></ul><p>After you accept a handshake, it continues to appear in the results of relevant APIs for only 30 days. After that, it's deleted.</p>
 
 @param request A container for the necessary parameters to execute the AcceptHandshake service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorHandshakeConstraintViolation`, `AWSOrganizationsErrorHandshakeNotFound`, `AWSOrganizationsErrorInvalidHandshakeTransition`, `AWSOrganizationsErrorHandshakeAlreadyInState`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorAccessDeniedForDependency`.
 
 @see AWSOrganizationsAcceptHandshakeRequest
 @see AWSOrganizationsAcceptHandshakeResponse
 */
- (void)acceptHandshake:(AWSOrganizationsAcceptHandshakeRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsAcceptHandshakeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attaches a policy to a root, an organizational unit (OU), or an individual account. How the policy affects accounts depends on the type of policy. Refer to the <i>AWS Organizations User Guide</i> for information about each policy type:</p><ul><li><p><a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html">BACKUP_POLICY</a></p></li><li><p><a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html">SERVICE_CONTROL_POLICY</a></p></li><li><p><a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html">TAG_POLICY</a></p></li></ul><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the AttachPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorDuplicatePolicyAttachment`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorPolicyNotFound`, `AWSOrganizationsErrorPolicyTypeNotEnabled`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTargetNotFound`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`, `AWSOrganizationsErrorPolicyChangesInProgress`.
 
 @see AWSOrganizationsAttachPolicyRequest
 */
- (AWSTask *)attachPolicy:(AWSOrganizationsAttachPolicyRequest *)request;

/**
 <p>Attaches a policy to a root, an organizational unit (OU), or an individual account. How the policy affects accounts depends on the type of policy. Refer to the <i>AWS Organizations User Guide</i> for information about each policy type:</p><ul><li><p><a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html">BACKUP_POLICY</a></p></li><li><p><a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html">SERVICE_CONTROL_POLICY</a></p></li><li><p><a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html">TAG_POLICY</a></p></li></ul><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the AttachPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorDuplicatePolicyAttachment`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorPolicyNotFound`, `AWSOrganizationsErrorPolicyTypeNotEnabled`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTargetNotFound`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`, `AWSOrganizationsErrorPolicyChangesInProgress`.
 
 @see AWSOrganizationsAttachPolicyRequest
 */
- (void)attachPolicy:(AWSOrganizationsAttachPolicyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Cancels a handshake. Canceling a handshake sets the handshake state to <code>CANCELED</code>. </p><p>This operation can be called only from the account that originated the handshake. The recipient of the handshake can't cancel it, but can use <a>DeclineHandshake</a> instead. After a handshake is canceled, the recipient can no longer respond to that handshake.</p><p>After you cancel a handshake, it continues to appear in the results of relevant APIs for only 30 days. After that, it's deleted.</p>
 
 @param request A container for the necessary parameters to execute the CancelHandshake service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsCancelHandshakeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorHandshakeNotFound`, `AWSOrganizationsErrorInvalidHandshakeTransition`, `AWSOrganizationsErrorHandshakeAlreadyInState`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsCancelHandshakeRequest
 @see AWSOrganizationsCancelHandshakeResponse
 */
- (AWSTask<AWSOrganizationsCancelHandshakeResponse *> *)cancelHandshake:(AWSOrganizationsCancelHandshakeRequest *)request;

/**
 <p>Cancels a handshake. Canceling a handshake sets the handshake state to <code>CANCELED</code>. </p><p>This operation can be called only from the account that originated the handshake. The recipient of the handshake can't cancel it, but can use <a>DeclineHandshake</a> instead. After a handshake is canceled, the recipient can no longer respond to that handshake.</p><p>After you cancel a handshake, it continues to appear in the results of relevant APIs for only 30 days. After that, it's deleted.</p>
 
 @param request A container for the necessary parameters to execute the CancelHandshake service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorHandshakeNotFound`, `AWSOrganizationsErrorInvalidHandshakeTransition`, `AWSOrganizationsErrorHandshakeAlreadyInState`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsCancelHandshakeRequest
 @see AWSOrganizationsCancelHandshakeResponse
 */
- (void)cancelHandshake:(AWSOrganizationsCancelHandshakeRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsCancelHandshakeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an AWS account that is automatically a member of the organization whose credentials made the request. This is an asynchronous request that AWS performs in the background. Because <code>CreateAccount</code> operates asynchronously, it can return a successful completion message even though account initialization might still be in progress. You might need to wait a few minutes before you can successfully access the account. To check the status of the request, do one of the following:</p><ul><li><p>Use the <code>OperationId</code> response element from this operation to provide as a parameter to the <a>DescribeCreateAccountStatus</a> operation.</p></li><li><p>Check the AWS CloudTrail log for the <code>CreateAccountResult</code> event. For information on using AWS CloudTrail with AWS Organizations, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_monitoring.html">Monitoring the Activity in Your Organization</a> in the <i>AWS Organizations User Guide.</i></p></li></ul><p/><p>The user who calls the API to create an account must have the <code>organizations:CreateAccount</code> permission. If you enabled all features in the organization, AWS Organizations creates the required service-linked role named <code>AWSServiceRoleForOrganizations</code>. For more information, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html#orgs_integrate_services-using_slrs">AWS Organizations and Service-Linked Roles</a> in the <i>AWS Organizations User Guide</i>.</p><p>AWS Organizations preconfigures the new member account with a role (named <code>OrganizationAccountAccessRole</code> by default) that grants users in the master account administrator permissions in the new member account. Principals in the master account can assume the role. AWS Organizations clones the company name and address information for the new account from the organization's master account.</p><p>This operation can be called only from the organization's master account.</p><p>For more information about creating accounts, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_create.html">Creating an AWS Account in Your Organization</a> in the <i>AWS Organizations User Guide.</i></p><important><ul><li><p>When you create an account in an organization using the AWS Organizations console, API, or CLI commands, the information required for the account to operate as a standalone account, such as a payment method and signing the end user license agreement (EULA) is <i>not</i> automatically collected. If you must remove an account from your organization later, you can do so only after you provide the missing information. Follow the steps at <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html#leave-without-all-info"> To leave an organization as a member account</a> in the <i>AWS Organizations User Guide</i>.</p></li><li><p>If you get an exception that indicates that you exceeded your account limits for the organization, contact <a href="https://console.aws.amazon.com/support/home#/">AWS Support</a>.</p></li><li><p>If you get an exception that indicates that the operation failed because your organization is still initializing, wait one hour and then try again. If the error persists, contact <a href="https://console.aws.amazon.com/support/home#/">AWS Support</a>.</p></li><li><p>Using <code>CreateAccount</code> to create multiple temporary accounts isn't recommended. You can only close an account from the Billing and Cost Management Console, and you must be signed in as the root user. For information on the requirements and process for closing an account, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_close.html">Closing an AWS Account</a> in the <i>AWS Organizations User Guide</i>.</p></li></ul></important><note><p>When you create a member account with this operation, you can choose whether to create the account with the <b>IAM User and Role Access to Billing Information</b> switch enabled. If you enable it, IAM users and roles that have appropriate permissions can view billing information for the account. If you disable it, only the account root user can access billing information. For information about how to disable this switch for an account, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html">Granting Access to Your Billing Information and Tools</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsCreateAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorFinalizingOrganization`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsCreateAccountRequest
 @see AWSOrganizationsCreateAccountResponse
 */
- (AWSTask<AWSOrganizationsCreateAccountResponse *> *)createAccount:(AWSOrganizationsCreateAccountRequest *)request;

/**
 <p>Creates an AWS account that is automatically a member of the organization whose credentials made the request. This is an asynchronous request that AWS performs in the background. Because <code>CreateAccount</code> operates asynchronously, it can return a successful completion message even though account initialization might still be in progress. You might need to wait a few minutes before you can successfully access the account. To check the status of the request, do one of the following:</p><ul><li><p>Use the <code>OperationId</code> response element from this operation to provide as a parameter to the <a>DescribeCreateAccountStatus</a> operation.</p></li><li><p>Check the AWS CloudTrail log for the <code>CreateAccountResult</code> event. For information on using AWS CloudTrail with AWS Organizations, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_monitoring.html">Monitoring the Activity in Your Organization</a> in the <i>AWS Organizations User Guide.</i></p></li></ul><p/><p>The user who calls the API to create an account must have the <code>organizations:CreateAccount</code> permission. If you enabled all features in the organization, AWS Organizations creates the required service-linked role named <code>AWSServiceRoleForOrganizations</code>. For more information, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html#orgs_integrate_services-using_slrs">AWS Organizations and Service-Linked Roles</a> in the <i>AWS Organizations User Guide</i>.</p><p>AWS Organizations preconfigures the new member account with a role (named <code>OrganizationAccountAccessRole</code> by default) that grants users in the master account administrator permissions in the new member account. Principals in the master account can assume the role. AWS Organizations clones the company name and address information for the new account from the organization's master account.</p><p>This operation can be called only from the organization's master account.</p><p>For more information about creating accounts, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_create.html">Creating an AWS Account in Your Organization</a> in the <i>AWS Organizations User Guide.</i></p><important><ul><li><p>When you create an account in an organization using the AWS Organizations console, API, or CLI commands, the information required for the account to operate as a standalone account, such as a payment method and signing the end user license agreement (EULA) is <i>not</i> automatically collected. If you must remove an account from your organization later, you can do so only after you provide the missing information. Follow the steps at <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html#leave-without-all-info"> To leave an organization as a member account</a> in the <i>AWS Organizations User Guide</i>.</p></li><li><p>If you get an exception that indicates that you exceeded your account limits for the organization, contact <a href="https://console.aws.amazon.com/support/home#/">AWS Support</a>.</p></li><li><p>If you get an exception that indicates that the operation failed because your organization is still initializing, wait one hour and then try again. If the error persists, contact <a href="https://console.aws.amazon.com/support/home#/">AWS Support</a>.</p></li><li><p>Using <code>CreateAccount</code> to create multiple temporary accounts isn't recommended. You can only close an account from the Billing and Cost Management Console, and you must be signed in as the root user. For information on the requirements and process for closing an account, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_close.html">Closing an AWS Account</a> in the <i>AWS Organizations User Guide</i>.</p></li></ul></important><note><p>When you create a member account with this operation, you can choose whether to create the account with the <b>IAM User and Role Access to Billing Information</b> switch enabled. If you enable it, IAM users and roles that have appropriate permissions can view billing information for the account. If you disable it, only the account root user can access billing information. For information about how to disable this switch for an account, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html">Granting Access to Your Billing Information and Tools</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorFinalizingOrganization`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsCreateAccountRequest
 @see AWSOrganizationsCreateAccountResponse
 */
- (void)createAccount:(AWSOrganizationsCreateAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsCreateAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This action is available if all of the following are true:</p><ul><li><p>You're authorized to create accounts in the AWS GovCloud (US) Region. For more information on the AWS GovCloud (US) Region, see the <a href="http://docs.aws.amazon.com/govcloud-us/latest/UserGuide/welcome.html"><i>AWS GovCloud User Guide</i>.</a></p></li><li><p>You already have an account in the AWS GovCloud (US) Region that is associated with your master account in the commercial Region. </p></li><li><p>You call this action from the master account of your organization in the commercial Region.</p></li><li><p>You have the <code>organizations:CreateGovCloudAccount</code> permission. AWS Organizations creates the required service-linked role named <code>AWSServiceRoleForOrganizations</code>. For more information, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html#orgs_integrate_services-using_slrs">AWS Organizations and Service-Linked Roles</a> in the <i>AWS Organizations User Guide.</i></p></li></ul><p>AWS automatically enables AWS CloudTrail for AWS GovCloud (US) accounts, but you should also do the following:</p><ul><li><p>Verify that AWS CloudTrail is enabled to store logs.</p></li><li><p>Create an S3 bucket for AWS CloudTrail log storage.</p><p>For more information, see <a href="http://docs.aws.amazon.com/govcloud-us/latest/UserGuide/verifying-cloudtrail.html">Verifying AWS CloudTrail Is Enabled</a> in the <i>AWS GovCloud User Guide</i>. </p></li></ul><p>You call this action from the master account of your organization in the commercial Region to create a standalone AWS account in the AWS GovCloud (US) Region. After the account is created, the master account of an organization in the AWS GovCloud (US) Region can invite it to that organization. For more information on inviting standalone accounts in the AWS GovCloud (US) to join an organization, see <a href="http://docs.aws.amazon.com/govcloud-us/latest/UserGuide/govcloud-organizations.html">AWS Organizations</a> in the <i>AWS GovCloud User Guide.</i></p><p>Calling <code>CreateGovCloudAccount</code> is an asynchronous request that AWS performs in the background. Because <code>CreateGovCloudAccount</code> operates asynchronously, it can return a successful completion message even though account initialization might still be in progress. You might need to wait a few minutes before you can successfully access the account. To check the status of the request, do one of the following:</p><ul><li><p>Use the <code>OperationId</code> response element from this operation to provide as a parameter to the <a>DescribeCreateAccountStatus</a> operation.</p></li><li><p>Check the AWS CloudTrail log for the <code>CreateAccountResult</code> event. For information on using AWS CloudTrail with Organizations, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_monitoring.html">Monitoring the Activity in Your Organization</a> in the <i>AWS Organizations User Guide.</i></p></li></ul><p/><p>When you call the <code>CreateGovCloudAccount</code> action, you create two accounts: a standalone account in the AWS GovCloud (US) Region and an associated account in the commercial Region for billing and support purposes. The account in the commercial Region is automatically a member of the organization whose credentials made the request. Both accounts are associated with the same email address.</p><p>A role is created in the new account in the commercial Region that allows the master account in the organization in the commercial Region to assume it. An AWS GovCloud (US) account is then created and associated with the commercial account that you just created. A role is created in the new AWS GovCloud (US) account that can be assumed by the AWS GovCloud (US) account that is associated with the master account of the commercial organization. For more information and to view a diagram that explains how account access works, see <a href="http://docs.aws.amazon.com/govcloud-us/latest/UserGuide/govcloud-organizations.html">AWS Organizations</a> in the <i>AWS GovCloud User Guide.</i></p><p>For more information about creating accounts, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_create.html">Creating an AWS Account in Your Organization</a> in the <i>AWS Organizations User Guide.</i></p><important><ul><li><p>When you create an account in an organization using the AWS Organizations console, API, or CLI commands, the information required for the account to operate as a standalone account is <i>not</i> automatically collected. This includes a payment method and signing the end user license agreement (EULA). If you must remove an account from your organization later, you can do so only after you provide the missing information. Follow the steps at <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html#leave-without-all-info"> To leave an organization as a member account</a> in the <i>AWS Organizations User Guide.</i></p></li><li><p>If you get an exception that indicates that you exceeded your account limits for the organization, contact <a href="https://console.aws.amazon.com/support/home#/">AWS Support</a>.</p></li><li><p>If you get an exception that indicates that the operation failed because your organization is still initializing, wait one hour and then try again. If the error persists, contact <a href="https://console.aws.amazon.com/support/home#/">AWS Support</a>.</p></li><li><p>Using <code>CreateGovCloudAccount</code> to create multiple temporary accounts isn't recommended. You can only close an account from the AWS Billing and Cost Management console, and you must be signed in as the root user. For information on the requirements and process for closing an account, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_close.html">Closing an AWS Account</a> in the <i>AWS Organizations User Guide</i>.</p></li></ul></important><note><p>When you create a member account with this operation, you can choose whether to create the account with the <b>IAM User and Role Access to Billing Information</b> switch enabled. If you enable it, IAM users and roles that have appropriate permissions can view billing information for the account. If you disable it, only the account root user can access billing information. For information about how to disable this switch for an account, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html">Granting Access to Your Billing Information and Tools</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateGovCloudAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsCreateGovCloudAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorFinalizingOrganization`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsCreateGovCloudAccountRequest
 @see AWSOrganizationsCreateGovCloudAccountResponse
 */
- (AWSTask<AWSOrganizationsCreateGovCloudAccountResponse *> *)createGovCloudAccount:(AWSOrganizationsCreateGovCloudAccountRequest *)request;

/**
 <p>This action is available if all of the following are true:</p><ul><li><p>You're authorized to create accounts in the AWS GovCloud (US) Region. For more information on the AWS GovCloud (US) Region, see the <a href="http://docs.aws.amazon.com/govcloud-us/latest/UserGuide/welcome.html"><i>AWS GovCloud User Guide</i>.</a></p></li><li><p>You already have an account in the AWS GovCloud (US) Region that is associated with your master account in the commercial Region. </p></li><li><p>You call this action from the master account of your organization in the commercial Region.</p></li><li><p>You have the <code>organizations:CreateGovCloudAccount</code> permission. AWS Organizations creates the required service-linked role named <code>AWSServiceRoleForOrganizations</code>. For more information, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html#orgs_integrate_services-using_slrs">AWS Organizations and Service-Linked Roles</a> in the <i>AWS Organizations User Guide.</i></p></li></ul><p>AWS automatically enables AWS CloudTrail for AWS GovCloud (US) accounts, but you should also do the following:</p><ul><li><p>Verify that AWS CloudTrail is enabled to store logs.</p></li><li><p>Create an S3 bucket for AWS CloudTrail log storage.</p><p>For more information, see <a href="http://docs.aws.amazon.com/govcloud-us/latest/UserGuide/verifying-cloudtrail.html">Verifying AWS CloudTrail Is Enabled</a> in the <i>AWS GovCloud User Guide</i>. </p></li></ul><p>You call this action from the master account of your organization in the commercial Region to create a standalone AWS account in the AWS GovCloud (US) Region. After the account is created, the master account of an organization in the AWS GovCloud (US) Region can invite it to that organization. For more information on inviting standalone accounts in the AWS GovCloud (US) to join an organization, see <a href="http://docs.aws.amazon.com/govcloud-us/latest/UserGuide/govcloud-organizations.html">AWS Organizations</a> in the <i>AWS GovCloud User Guide.</i></p><p>Calling <code>CreateGovCloudAccount</code> is an asynchronous request that AWS performs in the background. Because <code>CreateGovCloudAccount</code> operates asynchronously, it can return a successful completion message even though account initialization might still be in progress. You might need to wait a few minutes before you can successfully access the account. To check the status of the request, do one of the following:</p><ul><li><p>Use the <code>OperationId</code> response element from this operation to provide as a parameter to the <a>DescribeCreateAccountStatus</a> operation.</p></li><li><p>Check the AWS CloudTrail log for the <code>CreateAccountResult</code> event. For information on using AWS CloudTrail with Organizations, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_monitoring.html">Monitoring the Activity in Your Organization</a> in the <i>AWS Organizations User Guide.</i></p></li></ul><p/><p>When you call the <code>CreateGovCloudAccount</code> action, you create two accounts: a standalone account in the AWS GovCloud (US) Region and an associated account in the commercial Region for billing and support purposes. The account in the commercial Region is automatically a member of the organization whose credentials made the request. Both accounts are associated with the same email address.</p><p>A role is created in the new account in the commercial Region that allows the master account in the organization in the commercial Region to assume it. An AWS GovCloud (US) account is then created and associated with the commercial account that you just created. A role is created in the new AWS GovCloud (US) account that can be assumed by the AWS GovCloud (US) account that is associated with the master account of the commercial organization. For more information and to view a diagram that explains how account access works, see <a href="http://docs.aws.amazon.com/govcloud-us/latest/UserGuide/govcloud-organizations.html">AWS Organizations</a> in the <i>AWS GovCloud User Guide.</i></p><p>For more information about creating accounts, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_create.html">Creating an AWS Account in Your Organization</a> in the <i>AWS Organizations User Guide.</i></p><important><ul><li><p>When you create an account in an organization using the AWS Organizations console, API, or CLI commands, the information required for the account to operate as a standalone account is <i>not</i> automatically collected. This includes a payment method and signing the end user license agreement (EULA). If you must remove an account from your organization later, you can do so only after you provide the missing information. Follow the steps at <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html#leave-without-all-info"> To leave an organization as a member account</a> in the <i>AWS Organizations User Guide.</i></p></li><li><p>If you get an exception that indicates that you exceeded your account limits for the organization, contact <a href="https://console.aws.amazon.com/support/home#/">AWS Support</a>.</p></li><li><p>If you get an exception that indicates that the operation failed because your organization is still initializing, wait one hour and then try again. If the error persists, contact <a href="https://console.aws.amazon.com/support/home#/">AWS Support</a>.</p></li><li><p>Using <code>CreateGovCloudAccount</code> to create multiple temporary accounts isn't recommended. You can only close an account from the AWS Billing and Cost Management console, and you must be signed in as the root user. For information on the requirements and process for closing an account, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_close.html">Closing an AWS Account</a> in the <i>AWS Organizations User Guide</i>.</p></li></ul></important><note><p>When you create a member account with this operation, you can choose whether to create the account with the <b>IAM User and Role Access to Billing Information</b> switch enabled. If you enable it, IAM users and roles that have appropriate permissions can view billing information for the account. If you disable it, only the account root user can access billing information. For information about how to disable this switch for an account, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html">Granting Access to Your Billing Information and Tools</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateGovCloudAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorFinalizingOrganization`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsCreateGovCloudAccountRequest
 @see AWSOrganizationsCreateGovCloudAccountResponse
 */
- (void)createGovCloudAccount:(AWSOrganizationsCreateGovCloudAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsCreateGovCloudAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an AWS organization. The account whose user is calling the <code>CreateOrganization</code> operation automatically becomes the <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/orgs_getting-started_concepts.html#account">master account</a> of the new organization.</p><p>This operation must be called using credentials from the account that is to become the new organization's master account. The principal must also have the relevant IAM permissions.</p><p>By default (or if you set the <code>FeatureSet</code> parameter to <code>ALL</code>), the new organization is created with all features enabled and service control policies automatically enabled in the root. If you instead choose to create the organization supporting only the consolidated billing features by setting the <code>FeatureSet</code> parameter to <code>CONSOLIDATED_BILLING"</code>, no policy types are enabled by default, and you can't use organization policies</p>
 
 @param request A container for the necessary parameters to execute the CreateOrganization service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsCreateOrganizationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAlreadyInOrganization`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorAccessDeniedForDependency`.
 
 @see AWSOrganizationsCreateOrganizationRequest
 @see AWSOrganizationsCreateOrganizationResponse
 */
- (AWSTask<AWSOrganizationsCreateOrganizationResponse *> *)createOrganization:(AWSOrganizationsCreateOrganizationRequest *)request;

/**
 <p>Creates an AWS organization. The account whose user is calling the <code>CreateOrganization</code> operation automatically becomes the <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/orgs_getting-started_concepts.html#account">master account</a> of the new organization.</p><p>This operation must be called using credentials from the account that is to become the new organization's master account. The principal must also have the relevant IAM permissions.</p><p>By default (or if you set the <code>FeatureSet</code> parameter to <code>ALL</code>), the new organization is created with all features enabled and service control policies automatically enabled in the root. If you instead choose to create the organization supporting only the consolidated billing features by setting the <code>FeatureSet</code> parameter to <code>CONSOLIDATED_BILLING"</code>, no policy types are enabled by default, and you can't use organization policies</p>
 
 @param request A container for the necessary parameters to execute the CreateOrganization service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAlreadyInOrganization`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorAccessDeniedForDependency`.
 
 @see AWSOrganizationsCreateOrganizationRequest
 @see AWSOrganizationsCreateOrganizationResponse
 */
- (void)createOrganization:(AWSOrganizationsCreateOrganizationRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsCreateOrganizationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an organizational unit (OU) within a root or parent OU. An OU is a container for accounts that enables you to organize your accounts to apply policies according to your business requirements. The number of levels deep that you can nest OUs is dependent upon the policy types enabled for that root. For service control policies, the limit is five. </p><p>For more information about OUs, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_ous.html">Managing Organizational Units</a> in the <i>AWS Organizations User Guide.</i></p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the CreateOrganizationalUnit service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsCreateOrganizationalUnitResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorDuplicateOrganizationalUnit`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorParentNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsCreateOrganizationalUnitRequest
 @see AWSOrganizationsCreateOrganizationalUnitResponse
 */
- (AWSTask<AWSOrganizationsCreateOrganizationalUnitResponse *> *)createOrganizationalUnit:(AWSOrganizationsCreateOrganizationalUnitRequest *)request;

/**
 <p>Creates an organizational unit (OU) within a root or parent OU. An OU is a container for accounts that enables you to organize your accounts to apply policies according to your business requirements. The number of levels deep that you can nest OUs is dependent upon the policy types enabled for that root. For service control policies, the limit is five. </p><p>For more information about OUs, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_ous.html">Managing Organizational Units</a> in the <i>AWS Organizations User Guide.</i></p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the CreateOrganizationalUnit service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorDuplicateOrganizationalUnit`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorParentNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsCreateOrganizationalUnitRequest
 @see AWSOrganizationsCreateOrganizationalUnitResponse
 */
- (void)createOrganizationalUnit:(AWSOrganizationsCreateOrganizationalUnitRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsCreateOrganizationalUnitResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a policy of a specified type that you can attach to a root, an organizational unit (OU), or an individual AWS account.</p><p>For more information about policies and their use, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies.html">Managing Organization Policies</a>.</p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the CreatePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsCreatePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorDuplicatePolicy`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorMalformedPolicyDocument`, `AWSOrganizationsErrorPolicyTypeNotAvailableForOrganization`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsCreatePolicyRequest
 @see AWSOrganizationsCreatePolicyResponse
 */
- (AWSTask<AWSOrganizationsCreatePolicyResponse *> *)createPolicy:(AWSOrganizationsCreatePolicyRequest *)request;

/**
 <p>Creates a policy of a specified type that you can attach to a root, an organizational unit (OU), or an individual AWS account.</p><p>For more information about policies and their use, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies.html">Managing Organization Policies</a>.</p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the CreatePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorDuplicatePolicy`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorMalformedPolicyDocument`, `AWSOrganizationsErrorPolicyTypeNotAvailableForOrganization`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsCreatePolicyRequest
 @see AWSOrganizationsCreatePolicyResponse
 */
- (void)createPolicy:(AWSOrganizationsCreatePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsCreatePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Declines a handshake request. This sets the handshake state to <code>DECLINED</code> and effectively deactivates the request.</p><p>This operation can be called only from the account that received the handshake. The originator of the handshake can use <a>CancelHandshake</a> instead. The originator can't reactivate a declined request, but can reinitiate the process with a new handshake request.</p><p>After you decline a handshake, it continues to appear in the results of relevant APIs for only 30 days. After that, it's deleted.</p>
 
 @param request A container for the necessary parameters to execute the DeclineHandshake service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsDeclineHandshakeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorHandshakeNotFound`, `AWSOrganizationsErrorInvalidHandshakeTransition`, `AWSOrganizationsErrorHandshakeAlreadyInState`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsDeclineHandshakeRequest
 @see AWSOrganizationsDeclineHandshakeResponse
 */
- (AWSTask<AWSOrganizationsDeclineHandshakeResponse *> *)declineHandshake:(AWSOrganizationsDeclineHandshakeRequest *)request;

/**
 <p>Declines a handshake request. This sets the handshake state to <code>DECLINED</code> and effectively deactivates the request.</p><p>This operation can be called only from the account that received the handshake. The originator of the handshake can use <a>CancelHandshake</a> instead. The originator can't reactivate a declined request, but can reinitiate the process with a new handshake request.</p><p>After you decline a handshake, it continues to appear in the results of relevant APIs for only 30 days. After that, it's deleted.</p>
 
 @param request A container for the necessary parameters to execute the DeclineHandshake service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorHandshakeNotFound`, `AWSOrganizationsErrorInvalidHandshakeTransition`, `AWSOrganizationsErrorHandshakeAlreadyInState`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsDeclineHandshakeRequest
 @see AWSOrganizationsDeclineHandshakeResponse
 */
- (void)declineHandshake:(AWSOrganizationsDeclineHandshakeRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsDeclineHandshakeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the organization. You can delete an organization only by using credentials from the master account. The organization must be empty of member accounts.</p>
 
 @param request A container for the necessary parameters to execute the DeleteOrganization service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorOrganizationNotEmpty`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSRequest
 */
- (AWSTask *)deleteOrganization:(AWSRequest *)request;

/**
 <p>Deletes the organization. You can delete an organization only by using credentials from the master account. The organization must be empty of member accounts.</p>
 
 @param request A container for the necessary parameters to execute the DeleteOrganization service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorOrganizationNotEmpty`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSRequest
 */
- (void)deleteOrganization:(AWSRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an organizational unit (OU) from a root or another OU. You must first remove all accounts and child OUs from the OU that you want to delete.</p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteOrganizationalUnit service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorOrganizationalUnitNotEmpty`, `AWSOrganizationsErrorOrganizationalUnitNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsDeleteOrganizationalUnitRequest
 */
- (AWSTask *)deleteOrganizationalUnit:(AWSOrganizationsDeleteOrganizationalUnitRequest *)request;

/**
 <p>Deletes an organizational unit (OU) from a root or another OU. You must first remove all accounts and child OUs from the OU that you want to delete.</p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteOrganizationalUnit service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorOrganizationalUnitNotEmpty`, `AWSOrganizationsErrorOrganizationalUnitNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsDeleteOrganizationalUnitRequest
 */
- (void)deleteOrganizationalUnit:(AWSOrganizationsDeleteOrganizationalUnitRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified policy from your organization. Before you perform this operation, you must first detach the policy from all organizational units (OUs), roots, and accounts.</p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the DeletePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorPolicyInUse`, `AWSOrganizationsErrorPolicyNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsDeletePolicyRequest
 */
- (AWSTask *)deletePolicy:(AWSOrganizationsDeletePolicyRequest *)request;

/**
 <p>Deletes the specified policy from your organization. Before you perform this operation, you must first detach the policy from all organizational units (OUs), roots, and accounts.</p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the DeletePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorPolicyInUse`, `AWSOrganizationsErrorPolicyNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsDeletePolicyRequest
 */
- (void)deletePolicy:(AWSOrganizationsDeletePolicyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified member AWS account as a delegated administrator for the specified AWS service.</p><p>You can run this action only for AWS services that support this feature. For a current list of services that support it, see the column <i>Supports Delegated Administrator</i> in the table at <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrated-services-list.html">AWS Services that you can use with AWS Organizations</a> in the <i>AWS Organizations User Guide.</i></p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterDelegatedAdministrator service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAccountNotFound`, `AWSOrganizationsErrorAccountNotRegistered`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsDeregisterDelegatedAdministratorRequest
 */
- (AWSTask *)deregisterDelegatedAdministrator:(AWSOrganizationsDeregisterDelegatedAdministratorRequest *)request;

/**
 <p>Removes the specified member AWS account as a delegated administrator for the specified AWS service.</p><p>You can run this action only for AWS services that support this feature. For a current list of services that support it, see the column <i>Supports Delegated Administrator</i> in the table at <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrated-services-list.html">AWS Services that you can use with AWS Organizations</a> in the <i>AWS Organizations User Guide.</i></p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterDelegatedAdministrator service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAccountNotFound`, `AWSOrganizationsErrorAccountNotRegistered`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsDeregisterDelegatedAdministratorRequest
 */
- (void)deregisterDelegatedAdministrator:(AWSOrganizationsDeregisterDelegatedAdministratorRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves AWS Organizations-related information about the specified account.</p><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsDescribeAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAccountNotFound`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsDescribeAccountRequest
 @see AWSOrganizationsDescribeAccountResponse
 */
- (AWSTask<AWSOrganizationsDescribeAccountResponse *> *)describeAccount:(AWSOrganizationsDescribeAccountRequest *)request;

/**
 <p>Retrieves AWS Organizations-related information about the specified account.</p><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAccountNotFound`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsDescribeAccountRequest
 @see AWSOrganizationsDescribeAccountResponse
 */
- (void)describeAccount:(AWSOrganizationsDescribeAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsDescribeAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the current status of an asynchronous request to create an account.</p><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCreateAccountStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsDescribeCreateAccountStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorCreateAccountStatusNotFound`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsDescribeCreateAccountStatusRequest
 @see AWSOrganizationsDescribeCreateAccountStatusResponse
 */
- (AWSTask<AWSOrganizationsDescribeCreateAccountStatusResponse *> *)describeCreateAccountStatus:(AWSOrganizationsDescribeCreateAccountStatusRequest *)request;

/**
 <p>Retrieves the current status of an asynchronous request to create an account.</p><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCreateAccountStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorCreateAccountStatusNotFound`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsDescribeCreateAccountStatusRequest
 @see AWSOrganizationsDescribeCreateAccountStatusResponse
 */
- (void)describeCreateAccountStatus:(AWSOrganizationsDescribeCreateAccountStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsDescribeCreateAccountStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the contents of the effective policy for specified policy type and account. The effective policy is the aggregation of any policies of the specified type that the account inherits, plus any policy of that type that is directly attached to the account. </p><p>This operation applies only to policy types <i>other</i> than service control policies (SCPs).</p><p>For more information about policy inheritance, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies-inheritance.html">How Policy Inheritance Works</a> in the <i>AWS Organizations User Guide</i>.</p><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEffectivePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsDescribeEffectivePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorTargetNotFound`, `AWSOrganizationsErrorEffectivePolicyNotFound`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsDescribeEffectivePolicyRequest
 @see AWSOrganizationsDescribeEffectivePolicyResponse
 */
- (AWSTask<AWSOrganizationsDescribeEffectivePolicyResponse *> *)describeEffectivePolicy:(AWSOrganizationsDescribeEffectivePolicyRequest *)request;

/**
 <p>Returns the contents of the effective policy for specified policy type and account. The effective policy is the aggregation of any policies of the specified type that the account inherits, plus any policy of that type that is directly attached to the account. </p><p>This operation applies only to policy types <i>other</i> than service control policies (SCPs).</p><p>For more information about policy inheritance, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies-inheritance.html">How Policy Inheritance Works</a> in the <i>AWS Organizations User Guide</i>.</p><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEffectivePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorTargetNotFound`, `AWSOrganizationsErrorEffectivePolicyNotFound`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsDescribeEffectivePolicyRequest
 @see AWSOrganizationsDescribeEffectivePolicyResponse
 */
- (void)describeEffectivePolicy:(AWSOrganizationsDescribeEffectivePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsDescribeEffectivePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a previously requested handshake. The handshake ID comes from the response to the original <a>InviteAccountToOrganization</a> operation that generated the handshake.</p><p>You can access handshakes that are <code>ACCEPTED</code>, <code>DECLINED</code>, or <code>CANCELED</code> for only 30 days after they change to that state. They're then deleted and no longer accessible.</p><p>This operation can be called from any account in the organization.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHandshake service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsDescribeHandshakeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorHandshakeNotFound`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsDescribeHandshakeRequest
 @see AWSOrganizationsDescribeHandshakeResponse
 */
- (AWSTask<AWSOrganizationsDescribeHandshakeResponse *> *)describeHandshake:(AWSOrganizationsDescribeHandshakeRequest *)request;

/**
 <p>Retrieves information about a previously requested handshake. The handshake ID comes from the response to the original <a>InviteAccountToOrganization</a> operation that generated the handshake.</p><p>You can access handshakes that are <code>ACCEPTED</code>, <code>DECLINED</code>, or <code>CANCELED</code> for only 30 days after they change to that state. They're then deleted and no longer accessible.</p><p>This operation can be called from any account in the organization.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHandshake service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorHandshakeNotFound`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsDescribeHandshakeRequest
 @see AWSOrganizationsDescribeHandshakeResponse
 */
- (void)describeHandshake:(AWSOrganizationsDescribeHandshakeRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsDescribeHandshakeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the organization that the user's account belongs to.</p><p>This operation can be called from any account in the organization.</p><note><p>Even if a policy type is shown as available in the organization, you can disable it separately at the root level with <a>DisablePolicyType</a>. Use <a>ListRoots</a> to see the status of policy types for a specified root.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeOrganization service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsDescribeOrganizationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSRequest
 @see AWSOrganizationsDescribeOrganizationResponse
 */
- (AWSTask<AWSOrganizationsDescribeOrganizationResponse *> *)describeOrganization:(AWSRequest *)request;

/**
 <p>Retrieves information about the organization that the user's account belongs to.</p><p>This operation can be called from any account in the organization.</p><note><p>Even if a policy type is shown as available in the organization, you can disable it separately at the root level with <a>DisablePolicyType</a>. Use <a>ListRoots</a> to see the status of policy types for a specified root.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeOrganization service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSRequest
 @see AWSOrganizationsDescribeOrganizationResponse
 */
- (void)describeOrganization:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsDescribeOrganizationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about an organizational unit (OU).</p><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOrganizationalUnit service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsDescribeOrganizationalUnitResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorOrganizationalUnitNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsDescribeOrganizationalUnitRequest
 @see AWSOrganizationsDescribeOrganizationalUnitResponse
 */
- (AWSTask<AWSOrganizationsDescribeOrganizationalUnitResponse *> *)describeOrganizationalUnit:(AWSOrganizationsDescribeOrganizationalUnitRequest *)request;

/**
 <p>Retrieves information about an organizational unit (OU).</p><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOrganizationalUnit service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorOrganizationalUnitNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsDescribeOrganizationalUnitRequest
 @see AWSOrganizationsDescribeOrganizationalUnitResponse
 */
- (void)describeOrganizationalUnit:(AWSOrganizationsDescribeOrganizationalUnitRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsDescribeOrganizationalUnitResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a policy.</p><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the DescribePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsDescribePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorPolicyNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsDescribePolicyRequest
 @see AWSOrganizationsDescribePolicyResponse
 */
- (AWSTask<AWSOrganizationsDescribePolicyResponse *> *)describePolicy:(AWSOrganizationsDescribePolicyRequest *)request;

/**
 <p>Retrieves information about a policy.</p><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the DescribePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorPolicyNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsDescribePolicyRequest
 @see AWSOrganizationsDescribePolicyResponse
 */
- (void)describePolicy:(AWSOrganizationsDescribePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsDescribePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detaches a policy from a target root, organizational unit (OU), or account. </p><important><p>If the policy being detached is a service control policy (SCP), the changes to permissions for AWS Identity and Access Management (IAM) users and roles in affected accounts are immediate.</p></important><p>Every root, OU, and account must have at least one SCP attached. If you want to replace the default <code>FullAWSAccess</code> policy with an SCP that limits the permissions that can be delegated, you must attach the replacement SCP before you can remove the default SCP. This is the authorization strategy of an "<a href="https://docs.aws.amazon.com/organizations/latest/userguide/SCP_strategies.html#orgs_policies_allowlist">allow list</a>". If you instead attach a second SCP and leave the <code>FullAWSAccess</code> SCP still attached, and specify <code>"Effect": "Deny"</code> in the second SCP to override the <code>"Effect": "Allow"</code> in the <code>FullAWSAccess</code> policy (or any other attached SCP), you're using the authorization strategy of a "<a href="https://docs.aws.amazon.com/organizations/latest/userguide/SCP_strategies.html#orgs_policies_denylist">deny list</a>".</p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the DetachPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorPolicyNotAttached`, `AWSOrganizationsErrorPolicyNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTargetNotFound`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`, `AWSOrganizationsErrorPolicyChangesInProgress`.
 
 @see AWSOrganizationsDetachPolicyRequest
 */
- (AWSTask *)detachPolicy:(AWSOrganizationsDetachPolicyRequest *)request;

/**
 <p>Detaches a policy from a target root, organizational unit (OU), or account. </p><important><p>If the policy being detached is a service control policy (SCP), the changes to permissions for AWS Identity and Access Management (IAM) users and roles in affected accounts are immediate.</p></important><p>Every root, OU, and account must have at least one SCP attached. If you want to replace the default <code>FullAWSAccess</code> policy with an SCP that limits the permissions that can be delegated, you must attach the replacement SCP before you can remove the default SCP. This is the authorization strategy of an "<a href="https://docs.aws.amazon.com/organizations/latest/userguide/SCP_strategies.html#orgs_policies_allowlist">allow list</a>". If you instead attach a second SCP and leave the <code>FullAWSAccess</code> SCP still attached, and specify <code>"Effect": "Deny"</code> in the second SCP to override the <code>"Effect": "Allow"</code> in the <code>FullAWSAccess</code> policy (or any other attached SCP), you're using the authorization strategy of a "<a href="https://docs.aws.amazon.com/organizations/latest/userguide/SCP_strategies.html#orgs_policies_denylist">deny list</a>".</p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the DetachPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorPolicyNotAttached`, `AWSOrganizationsErrorPolicyNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTargetNotFound`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`, `AWSOrganizationsErrorPolicyChangesInProgress`.
 
 @see AWSOrganizationsDetachPolicyRequest
 */
- (void)detachPolicy:(AWSOrganizationsDetachPolicyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Disables the integration of an AWS service (the service that is specified by <code>ServicePrincipal</code>) with AWS Organizations. When you disable integration, the specified service no longer can create a <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html">service-linked role</a> in <i>new</i> accounts in your organization. This means the service can't perform operations on your behalf on any new accounts in your organization. The service can still perform operations in older accounts until the service completes its clean-up from AWS Organizations.</p><p/><important><p>We recommend that you disable integration between AWS Organizations and the specified AWS service by using the console or commands that are provided by the specified service. Doing so ensures that the other service is aware that it can clean up any resources that are required only for the integration. How the service cleans up its resources in the organization's accounts depends on that service. For more information, see the documentation for the other AWS service.</p></important><p>After you perform the <code>DisableAWSServiceAccess</code> operation, the specified service can no longer perform operations in your organization's accounts unless the operations are explicitly permitted by the IAM policies that are attached to your roles.</p><p>For more information about integrating other services with AWS Organizations, including the list of services that work with Organizations, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html">Integrating AWS Organizations with Other AWS Services</a> in the <i>AWS Organizations User Guide.</i></p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the DisableAWSServiceAccess service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsDisableAWSServiceAccessRequest
 */
- (AWSTask *)disableAWSServiceAccess:(AWSOrganizationsDisableAWSServiceAccessRequest *)request;

/**
 <p>Disables the integration of an AWS service (the service that is specified by <code>ServicePrincipal</code>) with AWS Organizations. When you disable integration, the specified service no longer can create a <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html">service-linked role</a> in <i>new</i> accounts in your organization. This means the service can't perform operations on your behalf on any new accounts in your organization. The service can still perform operations in older accounts until the service completes its clean-up from AWS Organizations.</p><p/><important><p>We recommend that you disable integration between AWS Organizations and the specified AWS service by using the console or commands that are provided by the specified service. Doing so ensures that the other service is aware that it can clean up any resources that are required only for the integration. How the service cleans up its resources in the organization's accounts depends on that service. For more information, see the documentation for the other AWS service.</p></important><p>After you perform the <code>DisableAWSServiceAccess</code> operation, the specified service can no longer perform operations in your organization's accounts unless the operations are explicitly permitted by the IAM policies that are attached to your roles.</p><p>For more information about integrating other services with AWS Organizations, including the list of services that work with Organizations, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html">Integrating AWS Organizations with Other AWS Services</a> in the <i>AWS Organizations User Guide.</i></p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the DisableAWSServiceAccess service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsDisableAWSServiceAccessRequest
 */
- (void)disableAWSServiceAccess:(AWSOrganizationsDisableAWSServiceAccessRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Disables an organizational policy type in a root. A policy of a certain type can be attached to entities in a root only if that type is enabled in the root. After you perform this operation, you no longer can attach policies of the specified type to that root or to any organizational unit (OU) or account in that root. You can undo this by using the <a>EnablePolicyType</a> operation.</p><p>This is an asynchronous request that AWS performs in the background. If you disable a policy type for a root, it still appears enabled for the organization if <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html">all features</a> are enabled for the organization. AWS recommends that you first use <a>ListRoots</a> to see the status of policy types for a specified root, and then use this operation. </p><p>This operation can be called only from the organization's master account.</p><p> To view the status of available policy types in the organization, use <a>DescribeOrganization</a>.</p>
 
 @param request A container for the necessary parameters to execute the DisablePolicyType service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsDisablePolicyTypeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorPolicyTypeNotEnabled`, `AWSOrganizationsErrorRootNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`, `AWSOrganizationsErrorPolicyChangesInProgress`.
 
 @see AWSOrganizationsDisablePolicyTypeRequest
 @see AWSOrganizationsDisablePolicyTypeResponse
 */
- (AWSTask<AWSOrganizationsDisablePolicyTypeResponse *> *)disablePolicyType:(AWSOrganizationsDisablePolicyTypeRequest *)request;

/**
 <p>Disables an organizational policy type in a root. A policy of a certain type can be attached to entities in a root only if that type is enabled in the root. After you perform this operation, you no longer can attach policies of the specified type to that root or to any organizational unit (OU) or account in that root. You can undo this by using the <a>EnablePolicyType</a> operation.</p><p>This is an asynchronous request that AWS performs in the background. If you disable a policy type for a root, it still appears enabled for the organization if <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html">all features</a> are enabled for the organization. AWS recommends that you first use <a>ListRoots</a> to see the status of policy types for a specified root, and then use this operation. </p><p>This operation can be called only from the organization's master account.</p><p> To view the status of available policy types in the organization, use <a>DescribeOrganization</a>.</p>
 
 @param request A container for the necessary parameters to execute the DisablePolicyType service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorPolicyTypeNotEnabled`, `AWSOrganizationsErrorRootNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`, `AWSOrganizationsErrorPolicyChangesInProgress`.
 
 @see AWSOrganizationsDisablePolicyTypeRequest
 @see AWSOrganizationsDisablePolicyTypeResponse
 */
- (void)disablePolicyType:(AWSOrganizationsDisablePolicyTypeRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsDisablePolicyTypeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables the integration of an AWS service (the service that is specified by <code>ServicePrincipal</code>) with AWS Organizations. When you enable integration, you allow the specified service to create a <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html">service-linked role</a> in all the accounts in your organization. This allows the service to perform operations on your behalf in your organization and its accounts.</p><important><p>We recommend that you enable integration between AWS Organizations and the specified AWS service by using the console or commands that are provided by the specified service. Doing so ensures that the service is aware that it can create the resources that are required for the integration. How the service creates those resources in the organization's accounts depends on that service. For more information, see the documentation for the other AWS service.</p></important><p>For more information about enabling services to integrate with AWS Organizations, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html">Integrating AWS Organizations with Other AWS Services</a> in the <i>AWS Organizations User Guide.</i></p><p>This operation can be called only from the organization's master account and only if the organization has <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html">enabled all features</a>.</p>
 
 @param request A container for the necessary parameters to execute the EnableAWSServiceAccess service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsEnableAWSServiceAccessRequest
 */
- (AWSTask *)enableAWSServiceAccess:(AWSOrganizationsEnableAWSServiceAccessRequest *)request;

/**
 <p>Enables the integration of an AWS service (the service that is specified by <code>ServicePrincipal</code>) with AWS Organizations. When you enable integration, you allow the specified service to create a <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html">service-linked role</a> in all the accounts in your organization. This allows the service to perform operations on your behalf in your organization and its accounts.</p><important><p>We recommend that you enable integration between AWS Organizations and the specified AWS service by using the console or commands that are provided by the specified service. Doing so ensures that the service is aware that it can create the resources that are required for the integration. How the service creates those resources in the organization's accounts depends on that service. For more information, see the documentation for the other AWS service.</p></important><p>For more information about enabling services to integrate with AWS Organizations, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html">Integrating AWS Organizations with Other AWS Services</a> in the <i>AWS Organizations User Guide.</i></p><p>This operation can be called only from the organization's master account and only if the organization has <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html">enabled all features</a>.</p>
 
 @param request A container for the necessary parameters to execute the EnableAWSServiceAccess service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsEnableAWSServiceAccessRequest
 */
- (void)enableAWSServiceAccess:(AWSOrganizationsEnableAWSServiceAccessRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Enables all features in an organization. This enables the use of organization policies that can restrict the services and actions that can be called in each account. Until you enable all features, you have access only to consolidated billing, and you can't use any of the advanced account administration features that AWS Organizations supports. For more information, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html">Enabling All Features in Your Organization</a> in the <i>AWS Organizations User Guide.</i></p><important><p>This operation is required only for organizations that were created explicitly with only the consolidated billing features enabled. Calling this operation sends a handshake to every invited account in the organization. The feature set change can be finalized and the additional features enabled only after all administrators in the invited accounts approve the change by accepting the handshake.</p></important><p>After you enable all features, you can separately enable or disable individual policy types in a root using <a>EnablePolicyType</a> and <a>DisablePolicyType</a>. To see the status of policy types in a root, use <a>ListRoots</a>.</p><p>After all invited member accounts accept the handshake, you finalize the feature set change by accepting the handshake that contains <code>"Action": "ENABLE_ALL_FEATURES"</code>. This completes the change.</p><p>After you enable all features in your organization, the master account in the organization can apply policies on all member accounts. These policies can restrict what users and even administrators in those accounts can do. The master account can apply policies that prevent accounts from leaving the organization. Ensure that your account administrators are aware of this.</p><p>This operation can be called only from the organization's master account. </p>
 
 @param request A container for the necessary parameters to execute the EnableAllFeatures service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsEnableAllFeaturesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorHandshakeConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsEnableAllFeaturesRequest
 @see AWSOrganizationsEnableAllFeaturesResponse
 */
- (AWSTask<AWSOrganizationsEnableAllFeaturesResponse *> *)enableAllFeatures:(AWSOrganizationsEnableAllFeaturesRequest *)request;

/**
 <p>Enables all features in an organization. This enables the use of organization policies that can restrict the services and actions that can be called in each account. Until you enable all features, you have access only to consolidated billing, and you can't use any of the advanced account administration features that AWS Organizations supports. For more information, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html">Enabling All Features in Your Organization</a> in the <i>AWS Organizations User Guide.</i></p><important><p>This operation is required only for organizations that were created explicitly with only the consolidated billing features enabled. Calling this operation sends a handshake to every invited account in the organization. The feature set change can be finalized and the additional features enabled only after all administrators in the invited accounts approve the change by accepting the handshake.</p></important><p>After you enable all features, you can separately enable or disable individual policy types in a root using <a>EnablePolicyType</a> and <a>DisablePolicyType</a>. To see the status of policy types in a root, use <a>ListRoots</a>.</p><p>After all invited member accounts accept the handshake, you finalize the feature set change by accepting the handshake that contains <code>"Action": "ENABLE_ALL_FEATURES"</code>. This completes the change.</p><p>After you enable all features in your organization, the master account in the organization can apply policies on all member accounts. These policies can restrict what users and even administrators in those accounts can do. The master account can apply policies that prevent accounts from leaving the organization. Ensure that your account administrators are aware of this.</p><p>This operation can be called only from the organization's master account. </p>
 
 @param request A container for the necessary parameters to execute the EnableAllFeatures service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorHandshakeConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsEnableAllFeaturesRequest
 @see AWSOrganizationsEnableAllFeaturesResponse
 */
- (void)enableAllFeatures:(AWSOrganizationsEnableAllFeaturesRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsEnableAllFeaturesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables a policy type in a root. After you enable a policy type in a root, you can attach policies of that type to the root, any organizational unit (OU), or account in that root. You can undo this by using the <a>DisablePolicyType</a> operation.</p><p>This is an asynchronous request that AWS performs in the background. AWS recommends that you first use <a>ListRoots</a> to see the status of policy types for a specified root, and then use this operation. </p><p>This operation can be called only from the organization's master account.</p><p>You can enable a policy type in a root only if that policy type is available in the organization. To view the status of available policy types in the organization, use <a>DescribeOrganization</a>.</p>
 
 @param request A container for the necessary parameters to execute the EnablePolicyType service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsEnablePolicyTypeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorPolicyTypeAlreadyEnabled`, `AWSOrganizationsErrorRootNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorPolicyTypeNotAvailableForOrganization`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`, `AWSOrganizationsErrorPolicyChangesInProgress`.
 
 @see AWSOrganizationsEnablePolicyTypeRequest
 @see AWSOrganizationsEnablePolicyTypeResponse
 */
- (AWSTask<AWSOrganizationsEnablePolicyTypeResponse *> *)enablePolicyType:(AWSOrganizationsEnablePolicyTypeRequest *)request;

/**
 <p>Enables a policy type in a root. After you enable a policy type in a root, you can attach policies of that type to the root, any organizational unit (OU), or account in that root. You can undo this by using the <a>DisablePolicyType</a> operation.</p><p>This is an asynchronous request that AWS performs in the background. AWS recommends that you first use <a>ListRoots</a> to see the status of policy types for a specified root, and then use this operation. </p><p>This operation can be called only from the organization's master account.</p><p>You can enable a policy type in a root only if that policy type is available in the organization. To view the status of available policy types in the organization, use <a>DescribeOrganization</a>.</p>
 
 @param request A container for the necessary parameters to execute the EnablePolicyType service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorPolicyTypeAlreadyEnabled`, `AWSOrganizationsErrorRootNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorPolicyTypeNotAvailableForOrganization`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`, `AWSOrganizationsErrorPolicyChangesInProgress`.
 
 @see AWSOrganizationsEnablePolicyTypeRequest
 @see AWSOrganizationsEnablePolicyTypeResponse
 */
- (void)enablePolicyType:(AWSOrganizationsEnablePolicyTypeRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsEnablePolicyTypeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sends an invitation to another account to join your organization as a member account. AWS Organizations sends email on your behalf to the email address that is associated with the other account's owner. The invitation is implemented as a <a>Handshake</a> whose details are in the response.</p><important><ul><li><p>You can invite AWS accounts only from the same seller as the master account. For example, if your organization's master account was created by Amazon Internet Services Pvt. Ltd (AISPL), an AWS seller in India, you can invite only other AISPL accounts to your organization. You can't combine accounts from AISPL and AWS or from any other AWS seller. For more information, see <a href="http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/useconsolidatedbilliing-India.html">Consolidated Billing in India</a>.</p></li><li><p>If you receive an exception that indicates that you exceeded your account limits for the organization or that the operation failed because your organization is still initializing, wait one hour and then try again. If the error persists after an hour, contact <a href="https://console.aws.amazon.com/support/home#/">AWS Support</a>.</p></li></ul></important><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the InviteAccountToOrganization service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsInviteAccountToOrganizationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorAccountOwnerNotVerified`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorHandshakeConstraintViolation`, `AWSOrganizationsErrorDuplicateHandshake`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorFinalizingOrganization`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsInviteAccountToOrganizationRequest
 @see AWSOrganizationsInviteAccountToOrganizationResponse
 */
- (AWSTask<AWSOrganizationsInviteAccountToOrganizationResponse *> *)inviteAccountToOrganization:(AWSOrganizationsInviteAccountToOrganizationRequest *)request;

/**
 <p>Sends an invitation to another account to join your organization as a member account. AWS Organizations sends email on your behalf to the email address that is associated with the other account's owner. The invitation is implemented as a <a>Handshake</a> whose details are in the response.</p><important><ul><li><p>You can invite AWS accounts only from the same seller as the master account. For example, if your organization's master account was created by Amazon Internet Services Pvt. Ltd (AISPL), an AWS seller in India, you can invite only other AISPL accounts to your organization. You can't combine accounts from AISPL and AWS or from any other AWS seller. For more information, see <a href="http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/useconsolidatedbilliing-India.html">Consolidated Billing in India</a>.</p></li><li><p>If you receive an exception that indicates that you exceeded your account limits for the organization or that the operation failed because your organization is still initializing, wait one hour and then try again. If the error persists after an hour, contact <a href="https://console.aws.amazon.com/support/home#/">AWS Support</a>.</p></li></ul></important><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the InviteAccountToOrganization service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorAccountOwnerNotVerified`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorHandshakeConstraintViolation`, `AWSOrganizationsErrorDuplicateHandshake`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorFinalizingOrganization`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsInviteAccountToOrganizationRequest
 @see AWSOrganizationsInviteAccountToOrganizationResponse
 */
- (void)inviteAccountToOrganization:(AWSOrganizationsInviteAccountToOrganizationRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsInviteAccountToOrganizationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a member account from its parent organization. This version of the operation is performed by the account that wants to leave. To remove a member account as a user in the master account, use <a>RemoveAccountFromOrganization</a> instead.</p><p>This operation can be called only from a member account in the organization.</p><important><ul><li><p>The master account in an organization with all features enabled can set service control policies (SCPs) that can restrict what administrators of member accounts can do. This includes preventing them from successfully calling <code>LeaveOrganization</code> and leaving the organization. </p></li><li><p>You can leave an organization as a member account only if the account is configured with the information required to operate as a standalone account. When you create an account in an organization using the AWS Organizations console, API, or CLI commands, the information required of standalone accounts is <i>not</i> automatically collected. For each account that you want to make standalone, you must do the following steps:</p><ul><li><p>Accept the end user license agreement (EULA)</p></li><li><p>Choose a support plan</p></li><li><p>Provide and verify the required contact information</p></li><li><p>Provide a current payment method</p></li></ul><p>AWS uses the payment method to charge for any billable (not free tier) AWS activity that occurs while the account isn't attached to an organization. Follow the steps at <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html#leave-without-all-info"> To leave an organization when all required account information has not yet been provided</a> in the <i>AWS Organizations User Guide.</i></p></li><li><p>You can leave an organization only after you enable IAM user access to billing in your account. For more information, see <a href="http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html#ControllingAccessWebsite-Activate">Activating Access to the Billing and Cost Management Console</a> in the <i>AWS Billing and Cost Management User Guide.</i></p></li></ul></important>
 
 @param request A container for the necessary parameters to execute the LeaveOrganization service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAccountNotFound`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorMasterCannotLeaveOrganization`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSRequest
 */
- (AWSTask *)leaveOrganization:(AWSRequest *)request;

/**
 <p>Removes a member account from its parent organization. This version of the operation is performed by the account that wants to leave. To remove a member account as a user in the master account, use <a>RemoveAccountFromOrganization</a> instead.</p><p>This operation can be called only from a member account in the organization.</p><important><ul><li><p>The master account in an organization with all features enabled can set service control policies (SCPs) that can restrict what administrators of member accounts can do. This includes preventing them from successfully calling <code>LeaveOrganization</code> and leaving the organization. </p></li><li><p>You can leave an organization as a member account only if the account is configured with the information required to operate as a standalone account. When you create an account in an organization using the AWS Organizations console, API, or CLI commands, the information required of standalone accounts is <i>not</i> automatically collected. For each account that you want to make standalone, you must do the following steps:</p><ul><li><p>Accept the end user license agreement (EULA)</p></li><li><p>Choose a support plan</p></li><li><p>Provide and verify the required contact information</p></li><li><p>Provide a current payment method</p></li></ul><p>AWS uses the payment method to charge for any billable (not free tier) AWS activity that occurs while the account isn't attached to an organization. Follow the steps at <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html#leave-without-all-info"> To leave an organization when all required account information has not yet been provided</a> in the <i>AWS Organizations User Guide.</i></p></li><li><p>You can leave an organization only after you enable IAM user access to billing in your account. For more information, see <a href="http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html#ControllingAccessWebsite-Activate">Activating Access to the Billing and Cost Management Console</a> in the <i>AWS Billing and Cost Management User Guide.</i></p></li></ul></important>
 
 @param request A container for the necessary parameters to execute the LeaveOrganization service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAccountNotFound`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorMasterCannotLeaveOrganization`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSRequest
 */
- (void)leaveOrganization:(AWSRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the AWS services that you enabled to integrate with your organization. After a service on this list creates the resources that it requires for the integration, it can perform operations on your organization and its accounts.</p><p>For more information about integrating other services with AWS Organizations, including the list of services that currently work with Organizations, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html">Integrating AWS Organizations with Other AWS Services</a> in the <i>AWS Organizations User Guide.</i></p><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListAWSServiceAccessForOrganization service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsListAWSServiceAccessForOrganizationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsListAWSServiceAccessForOrganizationRequest
 @see AWSOrganizationsListAWSServiceAccessForOrganizationResponse
 */
- (AWSTask<AWSOrganizationsListAWSServiceAccessForOrganizationResponse *> *)listAWSServiceAccessForOrganization:(AWSOrganizationsListAWSServiceAccessForOrganizationRequest *)request;

/**
 <p>Returns a list of the AWS services that you enabled to integrate with your organization. After a service on this list creates the resources that it requires for the integration, it can perform operations on your organization and its accounts.</p><p>For more information about integrating other services with AWS Organizations, including the list of services that currently work with Organizations, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html">Integrating AWS Organizations with Other AWS Services</a> in the <i>AWS Organizations User Guide.</i></p><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListAWSServiceAccessForOrganization service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsListAWSServiceAccessForOrganizationRequest
 @see AWSOrganizationsListAWSServiceAccessForOrganizationResponse
 */
- (void)listAWSServiceAccessForOrganization:(AWSOrganizationsListAWSServiceAccessForOrganizationRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsListAWSServiceAccessForOrganizationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the accounts in the organization. To request only the accounts in a specified root or organizational unit (OU), use the <a>ListAccountsForParent</a> operation instead.</p><note><p>Always check the <code>NextToken</code> response parameter for a <code>null</code> value when calling a <code>List*</code> operation. These operations can occasionally return an empty set of results even when there are more results available. The <code>NextToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display.</p></note><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListAccounts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsListAccountsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsListAccountsRequest
 @see AWSOrganizationsListAccountsResponse
 */
- (AWSTask<AWSOrganizationsListAccountsResponse *> *)listAccounts:(AWSOrganizationsListAccountsRequest *)request;

/**
 <p>Lists all the accounts in the organization. To request only the accounts in a specified root or organizational unit (OU), use the <a>ListAccountsForParent</a> operation instead.</p><note><p>Always check the <code>NextToken</code> response parameter for a <code>null</code> value when calling a <code>List*</code> operation. These operations can occasionally return an empty set of results even when there are more results available. The <code>NextToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display.</p></note><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListAccounts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsListAccountsRequest
 @see AWSOrganizationsListAccountsResponse
 */
- (void)listAccounts:(AWSOrganizationsListAccountsRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsListAccountsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the accounts in an organization that are contained by the specified target root or organizational unit (OU). If you specify the root, you get a list of all the accounts that aren't in any OU. If you specify an OU, you get a list of all the accounts in only that OU and not in any child OUs. To get a list of all accounts in the organization, use the <a>ListAccounts</a> operation.</p><note><p>Always check the <code>NextToken</code> response parameter for a <code>null</code> value when calling a <code>List*</code> operation. These operations can occasionally return an empty set of results even when there are more results available. The <code>NextToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display.</p></note><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListAccountsForParent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsListAccountsForParentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorParentNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsListAccountsForParentRequest
 @see AWSOrganizationsListAccountsForParentResponse
 */
- (AWSTask<AWSOrganizationsListAccountsForParentResponse *> *)listAccountsForParent:(AWSOrganizationsListAccountsForParentRequest *)request;

/**
 <p>Lists the accounts in an organization that are contained by the specified target root or organizational unit (OU). If you specify the root, you get a list of all the accounts that aren't in any OU. If you specify an OU, you get a list of all the accounts in only that OU and not in any child OUs. To get a list of all accounts in the organization, use the <a>ListAccounts</a> operation.</p><note><p>Always check the <code>NextToken</code> response parameter for a <code>null</code> value when calling a <code>List*</code> operation. These operations can occasionally return an empty set of results even when there are more results available. The <code>NextToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display.</p></note><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListAccountsForParent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorParentNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsListAccountsForParentRequest
 @see AWSOrganizationsListAccountsForParentResponse
 */
- (void)listAccountsForParent:(AWSOrganizationsListAccountsForParentRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsListAccountsForParentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all of the organizational units (OUs) or accounts that are contained in the specified parent OU or root. This operation, along with <a>ListParents</a> enables you to traverse the tree structure that makes up this root.</p><note><p>Always check the <code>NextToken</code> response parameter for a <code>null</code> value when calling a <code>List*</code> operation. These operations can occasionally return an empty set of results even when there are more results available. The <code>NextToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display.</p></note><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListChildren service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsListChildrenResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorParentNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsListChildrenRequest
 @see AWSOrganizationsListChildrenResponse
 */
- (AWSTask<AWSOrganizationsListChildrenResponse *> *)listChildren:(AWSOrganizationsListChildrenRequest *)request;

/**
 <p>Lists all of the organizational units (OUs) or accounts that are contained in the specified parent OU or root. This operation, along with <a>ListParents</a> enables you to traverse the tree structure that makes up this root.</p><note><p>Always check the <code>NextToken</code> response parameter for a <code>null</code> value when calling a <code>List*</code> operation. These operations can occasionally return an empty set of results even when there are more results available. The <code>NextToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display.</p></note><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListChildren service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorParentNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsListChildrenRequest
 @see AWSOrganizationsListChildrenResponse
 */
- (void)listChildren:(AWSOrganizationsListChildrenRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsListChildrenResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the account creation requests that match the specified status that is currently being tracked for the organization.</p><note><p>Always check the <code>NextToken</code> response parameter for a <code>null</code> value when calling a <code>List*</code> operation. These operations can occasionally return an empty set of results even when there are more results available. The <code>NextToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display.</p></note><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListCreateAccountStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsListCreateAccountStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsListCreateAccountStatusRequest
 @see AWSOrganizationsListCreateAccountStatusResponse
 */
- (AWSTask<AWSOrganizationsListCreateAccountStatusResponse *> *)listCreateAccountStatus:(AWSOrganizationsListCreateAccountStatusRequest *)request;

/**
 <p>Lists the account creation requests that match the specified status that is currently being tracked for the organization.</p><note><p>Always check the <code>NextToken</code> response parameter for a <code>null</code> value when calling a <code>List*</code> operation. These operations can occasionally return an empty set of results even when there are more results available. The <code>NextToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display.</p></note><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListCreateAccountStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsListCreateAccountStatusRequest
 @see AWSOrganizationsListCreateAccountStatusResponse
 */
- (void)listCreateAccountStatus:(AWSOrganizationsListCreateAccountStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsListCreateAccountStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the AWS accounts that are designated as delegated administrators in this organization.</p><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListDelegatedAdministrators service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsListDelegatedAdministratorsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsListDelegatedAdministratorsRequest
 @see AWSOrganizationsListDelegatedAdministratorsResponse
 */
- (AWSTask<AWSOrganizationsListDelegatedAdministratorsResponse *> *)listDelegatedAdministrators:(AWSOrganizationsListDelegatedAdministratorsRequest *)request;

/**
 <p>Lists the AWS accounts that are designated as delegated administrators in this organization.</p><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListDelegatedAdministrators service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsListDelegatedAdministratorsRequest
 @see AWSOrganizationsListDelegatedAdministratorsResponse
 */
- (void)listDelegatedAdministrators:(AWSOrganizationsListDelegatedAdministratorsRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsListDelegatedAdministratorsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List the AWS services for which the specified account is a delegated administrator. </p><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListDelegatedServicesForAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsListDelegatedServicesForAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAccountNotFound`, `AWSOrganizationsErrorAccountNotRegistered`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsListDelegatedServicesForAccountRequest
 @see AWSOrganizationsListDelegatedServicesForAccountResponse
 */
- (AWSTask<AWSOrganizationsListDelegatedServicesForAccountResponse *> *)listDelegatedServicesForAccount:(AWSOrganizationsListDelegatedServicesForAccountRequest *)request;

/**
 <p>List the AWS services for which the specified account is a delegated administrator. </p><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListDelegatedServicesForAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAccountNotFound`, `AWSOrganizationsErrorAccountNotRegistered`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsListDelegatedServicesForAccountRequest
 @see AWSOrganizationsListDelegatedServicesForAccountResponse
 */
- (void)listDelegatedServicesForAccount:(AWSOrganizationsListDelegatedServicesForAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsListDelegatedServicesForAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the current handshakes that are associated with the account of the requesting user.</p><p>Handshakes that are <code>ACCEPTED</code>, <code>DECLINED</code>, or <code>CANCELED</code> appear in the results of this API for only 30 days after changing to that state. After that, they're deleted and no longer accessible.</p><note><p>Always check the <code>NextToken</code> response parameter for a <code>null</code> value when calling a <code>List*</code> operation. These operations can occasionally return an empty set of results even when there are more results available. The <code>NextToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display.</p></note><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListHandshakesForAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsListHandshakesForAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsListHandshakesForAccountRequest
 @see AWSOrganizationsListHandshakesForAccountResponse
 */
- (AWSTask<AWSOrganizationsListHandshakesForAccountResponse *> *)listHandshakesForAccount:(AWSOrganizationsListHandshakesForAccountRequest *)request;

/**
 <p>Lists the current handshakes that are associated with the account of the requesting user.</p><p>Handshakes that are <code>ACCEPTED</code>, <code>DECLINED</code>, or <code>CANCELED</code> appear in the results of this API for only 30 days after changing to that state. After that, they're deleted and no longer accessible.</p><note><p>Always check the <code>NextToken</code> response parameter for a <code>null</code> value when calling a <code>List*</code> operation. These operations can occasionally return an empty set of results even when there are more results available. The <code>NextToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display.</p></note><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListHandshakesForAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsListHandshakesForAccountRequest
 @see AWSOrganizationsListHandshakesForAccountResponse
 */
- (void)listHandshakesForAccount:(AWSOrganizationsListHandshakesForAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsListHandshakesForAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the handshakes that are associated with the organization that the requesting user is part of. The <code>ListHandshakesForOrganization</code> operation returns a list of handshake structures. Each structure contains details and status about a handshake.</p><p>Handshakes that are <code>ACCEPTED</code>, <code>DECLINED</code>, or <code>CANCELED</code> appear in the results of this API for only 30 days after changing to that state. After that, they're deleted and no longer accessible.</p><note><p>Always check the <code>NextToken</code> response parameter for a <code>null</code> value when calling a <code>List*</code> operation. These operations can occasionally return an empty set of results even when there are more results available. The <code>NextToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display.</p></note><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListHandshakesForOrganization service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsListHandshakesForOrganizationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsListHandshakesForOrganizationRequest
 @see AWSOrganizationsListHandshakesForOrganizationResponse
 */
- (AWSTask<AWSOrganizationsListHandshakesForOrganizationResponse *> *)listHandshakesForOrganization:(AWSOrganizationsListHandshakesForOrganizationRequest *)request;

/**
 <p>Lists the handshakes that are associated with the organization that the requesting user is part of. The <code>ListHandshakesForOrganization</code> operation returns a list of handshake structures. Each structure contains details and status about a handshake.</p><p>Handshakes that are <code>ACCEPTED</code>, <code>DECLINED</code>, or <code>CANCELED</code> appear in the results of this API for only 30 days after changing to that state. After that, they're deleted and no longer accessible.</p><note><p>Always check the <code>NextToken</code> response parameter for a <code>null</code> value when calling a <code>List*</code> operation. These operations can occasionally return an empty set of results even when there are more results available. The <code>NextToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display.</p></note><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListHandshakesForOrganization service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsListHandshakesForOrganizationRequest
 @see AWSOrganizationsListHandshakesForOrganizationResponse
 */
- (void)listHandshakesForOrganization:(AWSOrganizationsListHandshakesForOrganizationRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsListHandshakesForOrganizationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the organizational units (OUs) in a parent organizational unit or root.</p><note><p>Always check the <code>NextToken</code> response parameter for a <code>null</code> value when calling a <code>List*</code> operation. These operations can occasionally return an empty set of results even when there are more results available. The <code>NextToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display.</p></note><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListOrganizationalUnitsForParent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsListOrganizationalUnitsForParentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorParentNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsListOrganizationalUnitsForParentRequest
 @see AWSOrganizationsListOrganizationalUnitsForParentResponse
 */
- (AWSTask<AWSOrganizationsListOrganizationalUnitsForParentResponse *> *)listOrganizationalUnitsForParent:(AWSOrganizationsListOrganizationalUnitsForParentRequest *)request;

/**
 <p>Lists the organizational units (OUs) in a parent organizational unit or root.</p><note><p>Always check the <code>NextToken</code> response parameter for a <code>null</code> value when calling a <code>List*</code> operation. These operations can occasionally return an empty set of results even when there are more results available. The <code>NextToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display.</p></note><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListOrganizationalUnitsForParent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorParentNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsListOrganizationalUnitsForParentRequest
 @see AWSOrganizationsListOrganizationalUnitsForParentResponse
 */
- (void)listOrganizationalUnitsForParent:(AWSOrganizationsListOrganizationalUnitsForParentRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsListOrganizationalUnitsForParentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the root or organizational units (OUs) that serve as the immediate parent of the specified child OU or account. This operation, along with <a>ListChildren</a> enables you to traverse the tree structure that makes up this root.</p><note><p>Always check the <code>NextToken</code> response parameter for a <code>null</code> value when calling a <code>List*</code> operation. These operations can occasionally return an empty set of results even when there are more results available. The <code>NextToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display.</p></note><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p><note><p>In the current release, a child can have only a single parent. </p></note>
 
 @param request A container for the necessary parameters to execute the ListParents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsListParentsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorChildNotFound`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsListParentsRequest
 @see AWSOrganizationsListParentsResponse
 */
- (AWSTask<AWSOrganizationsListParentsResponse *> *)listParents:(AWSOrganizationsListParentsRequest *)request;

/**
 <p>Lists the root or organizational units (OUs) that serve as the immediate parent of the specified child OU or account. This operation, along with <a>ListChildren</a> enables you to traverse the tree structure that makes up this root.</p><note><p>Always check the <code>NextToken</code> response parameter for a <code>null</code> value when calling a <code>List*</code> operation. These operations can occasionally return an empty set of results even when there are more results available. The <code>NextToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display.</p></note><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p><note><p>In the current release, a child can have only a single parent. </p></note>
 
 @param request A container for the necessary parameters to execute the ListParents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorChildNotFound`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsListParentsRequest
 @see AWSOrganizationsListParentsResponse
 */
- (void)listParents:(AWSOrganizationsListParentsRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsListParentsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the list of all policies in an organization of a specified type.</p><note><p>Always check the <code>NextToken</code> response parameter for a <code>null</code> value when calling a <code>List*</code> operation. These operations can occasionally return an empty set of results even when there are more results available. The <code>NextToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display.</p></note><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListPolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsListPoliciesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsListPoliciesRequest
 @see AWSOrganizationsListPoliciesResponse
 */
- (AWSTask<AWSOrganizationsListPoliciesResponse *> *)listPolicies:(AWSOrganizationsListPoliciesRequest *)request;

/**
 <p>Retrieves the list of all policies in an organization of a specified type.</p><note><p>Always check the <code>NextToken</code> response parameter for a <code>null</code> value when calling a <code>List*</code> operation. These operations can occasionally return an empty set of results even when there are more results available. The <code>NextToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display.</p></note><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListPolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsListPoliciesRequest
 @see AWSOrganizationsListPoliciesResponse
 */
- (void)listPolicies:(AWSOrganizationsListPoliciesRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsListPoliciesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the policies that are directly attached to the specified target root, organizational unit (OU), or account. You must specify the policy type that you want included in the returned list.</p><note><p>Always check the <code>NextToken</code> response parameter for a <code>null</code> value when calling a <code>List*</code> operation. These operations can occasionally return an empty set of results even when there are more results available. The <code>NextToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display.</p></note><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListPoliciesForTarget service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsListPoliciesForTargetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTargetNotFound`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsListPoliciesForTargetRequest
 @see AWSOrganizationsListPoliciesForTargetResponse
 */
- (AWSTask<AWSOrganizationsListPoliciesForTargetResponse *> *)listPoliciesForTarget:(AWSOrganizationsListPoliciesForTargetRequest *)request;

/**
 <p>Lists the policies that are directly attached to the specified target root, organizational unit (OU), or account. You must specify the policy type that you want included in the returned list.</p><note><p>Always check the <code>NextToken</code> response parameter for a <code>null</code> value when calling a <code>List*</code> operation. These operations can occasionally return an empty set of results even when there are more results available. The <code>NextToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display.</p></note><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListPoliciesForTarget service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTargetNotFound`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsListPoliciesForTargetRequest
 @see AWSOrganizationsListPoliciesForTargetResponse
 */
- (void)listPoliciesForTarget:(AWSOrganizationsListPoliciesForTargetRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsListPoliciesForTargetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the roots that are defined in the current organization.</p><note><p>Always check the <code>NextToken</code> response parameter for a <code>null</code> value when calling a <code>List*</code> operation. These operations can occasionally return an empty set of results even when there are more results available. The <code>NextToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display.</p></note><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p><note><p>Policy types can be enabled and disabled in roots. This is distinct from whether they're available in the organization. When you enable all features, you make policy types available for use in that organization. Individual policy types can then be enabled and disabled in a root. To see the availability of a policy type in an organization, use <a>DescribeOrganization</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the ListRoots service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsListRootsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsListRootsRequest
 @see AWSOrganizationsListRootsResponse
 */
- (AWSTask<AWSOrganizationsListRootsResponse *> *)listRoots:(AWSOrganizationsListRootsRequest *)request;

/**
 <p>Lists the roots that are defined in the current organization.</p><note><p>Always check the <code>NextToken</code> response parameter for a <code>null</code> value when calling a <code>List*</code> operation. These operations can occasionally return an empty set of results even when there are more results available. The <code>NextToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display.</p></note><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p><note><p>Policy types can be enabled and disabled in roots. This is distinct from whether they're available in the organization. When you enable all features, you make policy types available for use in that organization. Individual policy types can then be enabled and disabled in a root. To see the availability of a policy type in an organization, use <a>DescribeOrganization</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the ListRoots service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsListRootsRequest
 @see AWSOrganizationsListRootsResponse
 */
- (void)listRoots:(AWSOrganizationsListRootsRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsListRootsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists tags for the specified resource. </p><p>Currently, you can list tags on an account in AWS Organizations.</p><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorTargetNotFound`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsListTagsForResourceRequest
 @see AWSOrganizationsListTagsForResourceResponse
 */
- (AWSTask<AWSOrganizationsListTagsForResourceResponse *> *)listTagsForResource:(AWSOrganizationsListTagsForResourceRequest *)request;

/**
 <p>Lists tags for the specified resource. </p><p>Currently, you can list tags on an account in AWS Organizations.</p><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorTargetNotFound`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsListTagsForResourceRequest
 @see AWSOrganizationsListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSOrganizationsListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the roots, organizational units (OUs), and accounts that the specified policy is attached to.</p><note><p>Always check the <code>NextToken</code> response parameter for a <code>null</code> value when calling a <code>List*</code> operation. These operations can occasionally return an empty set of results even when there are more results available. The <code>NextToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display.</p></note><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListTargetsForPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsListTargetsForPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorPolicyNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsListTargetsForPolicyRequest
 @see AWSOrganizationsListTargetsForPolicyResponse
 */
- (AWSTask<AWSOrganizationsListTargetsForPolicyResponse *> *)listTargetsForPolicy:(AWSOrganizationsListTargetsForPolicyRequest *)request;

/**
 <p>Lists all the roots, organizational units (OUs), and accounts that the specified policy is attached to.</p><note><p>Always check the <code>NextToken</code> response parameter for a <code>null</code> value when calling a <code>List*</code> operation. These operations can occasionally return an empty set of results even when there are more results available. The <code>NextToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display.</p></note><p>This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.</p>
 
 @param request A container for the necessary parameters to execute the ListTargetsForPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorPolicyNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsListTargetsForPolicyRequest
 @see AWSOrganizationsListTargetsForPolicyResponse
 */
- (void)listTargetsForPolicy:(AWSOrganizationsListTargetsForPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsListTargetsForPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Moves an account from its current source parent root or organizational unit (OU) to the specified destination parent root or OU.</p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the MoveAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorSourceParentNotFound`, `AWSOrganizationsErrorDestinationParentNotFound`, `AWSOrganizationsErrorDuplicateAccount`, `AWSOrganizationsErrorAccountNotFound`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorService`.
 
 @see AWSOrganizationsMoveAccountRequest
 */
- (AWSTask *)moveAccount:(AWSOrganizationsMoveAccountRequest *)request;

/**
 <p>Moves an account from its current source parent root or organizational unit (OU) to the specified destination parent root or OU.</p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the MoveAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorSourceParentNotFound`, `AWSOrganizationsErrorDestinationParentNotFound`, `AWSOrganizationsErrorDuplicateAccount`, `AWSOrganizationsErrorAccountNotFound`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorService`.
 
 @see AWSOrganizationsMoveAccountRequest
 */
- (void)moveAccount:(AWSOrganizationsMoveAccountRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Enables the specified member account to administer the Organizations features of the specified AWS service. It grants read-only access to AWS Organizations service data. The account still requires IAM permissions to access and administer the AWS service.</p><p>You can run this action only for AWS services that support this feature. For a current list of services that support it, see the column <i>Supports Delegated Administrator</i> in the table at <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrated-services-list.html">AWS Services that you can use with AWS Organizations</a> in the <i>AWS Organizations User Guide.</i></p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the RegisterDelegatedAdministrator service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAccountAlreadyRegistered`, `AWSOrganizationsErrorAccountNotFound`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsRegisterDelegatedAdministratorRequest
 */
- (AWSTask *)registerDelegatedAdministrator:(AWSOrganizationsRegisterDelegatedAdministratorRequest *)request;

/**
 <p>Enables the specified member account to administer the Organizations features of the specified AWS service. It grants read-only access to AWS Organizations service data. The account still requires IAM permissions to access and administer the AWS service.</p><p>You can run this action only for AWS services that support this feature. For a current list of services that support it, see the column <i>Supports Delegated Administrator</i> in the table at <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrated-services-list.html">AWS Services that you can use with AWS Organizations</a> in the <i>AWS Organizations User Guide.</i></p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the RegisterDelegatedAdministrator service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAccountAlreadyRegistered`, `AWSOrganizationsErrorAccountNotFound`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`.
 
 @see AWSOrganizationsRegisterDelegatedAdministratorRequest
 */
- (void)registerDelegatedAdministrator:(AWSOrganizationsRegisterDelegatedAdministratorRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified account from the organization.</p><p>The removed account becomes a standalone account that isn't a member of any organization. It's no longer subject to any policies and is responsible for its own bill payments. The organization's master account is no longer charged for any expenses accrued by the member account after it's removed from the organization.</p><p>This operation can be called only from the organization's master account. Member accounts can remove themselves with <a>LeaveOrganization</a> instead.</p><important><p>You can remove an account from your organization only if the account is configured with the information required to operate as a standalone account. When you create an account in an organization using the AWS Organizations console, API, or CLI commands, the information required of standalone accounts is <i>not</i> automatically collected. For an account that you want to make standalone, you must accept the end user license agreement (EULA), choose a support plan, provide and verify the required contact information, and provide a current payment method. AWS uses the payment method to charge for any billable (not free tier) AWS activity that occurs while the account isn't attached to an organization. To remove an account that doesn't yet have this information, you must sign in as the member account and follow the steps at <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html#leave-without-all-info"> To leave an organization when all required account information has not yet been provided</a> in the <i>AWS Organizations User Guide.</i></p></important>
 
 @param request A container for the necessary parameters to execute the RemoveAccountFromOrganization service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAccountNotFound`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorMasterCannotLeaveOrganization`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsRemoveAccountFromOrganizationRequest
 */
- (AWSTask *)removeAccountFromOrganization:(AWSOrganizationsRemoveAccountFromOrganizationRequest *)request;

/**
 <p>Removes the specified account from the organization.</p><p>The removed account becomes a standalone account that isn't a member of any organization. It's no longer subject to any policies and is responsible for its own bill payments. The organization's master account is no longer charged for any expenses accrued by the member account after it's removed from the organization.</p><p>This operation can be called only from the organization's master account. Member accounts can remove themselves with <a>LeaveOrganization</a> instead.</p><important><p>You can remove an account from your organization only if the account is configured with the information required to operate as a standalone account. When you create an account in an organization using the AWS Organizations console, API, or CLI commands, the information required of standalone accounts is <i>not</i> automatically collected. For an account that you want to make standalone, you must accept the end user license agreement (EULA), choose a support plan, provide and verify the required contact information, and provide a current payment method. AWS uses the payment method to charge for any billable (not free tier) AWS activity that occurs while the account isn't attached to an organization. To remove an account that doesn't yet have this information, you must sign in as the member account and follow the steps at <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html#leave-without-all-info"> To leave an organization when all required account information has not yet been provided</a> in the <i>AWS Organizations User Guide.</i></p></important>
 
 @param request A container for the necessary parameters to execute the RemoveAccountFromOrganization service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAccountNotFound`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorMasterCannotLeaveOrganization`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsRemoveAccountFromOrganizationRequest
 */
- (void)removeAccountFromOrganization:(AWSOrganizationsRemoveAccountFromOrganizationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Adds one or more tags to the specified resource.</p><p>Currently, you can tag and untag accounts in AWS Organizations.</p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorTargetNotFound`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsTagResourceRequest
 */
- (AWSTask *)tagResource:(AWSOrganizationsTagResourceRequest *)request;

/**
 <p>Adds one or more tags to the specified resource.</p><p>Currently, you can tag and untag accounts in AWS Organizations.</p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorTargetNotFound`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsTagResourceRequest
 */
- (void)tagResource:(AWSOrganizationsTagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes a tag from the specified resource. </p><p>Currently, you can tag and untag accounts in AWS Organizations.</p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorTargetNotFound`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsUntagResourceRequest
 */
- (AWSTask *)untagResource:(AWSOrganizationsUntagResourceRequest *)request;

/**
 <p>Removes a tag from the specified resource. </p><p>Currently, you can tag and untag accounts in AWS Organizations.</p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorTargetNotFound`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsUntagResourceRequest
 */
- (void)untagResource:(AWSOrganizationsUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Renames the specified organizational unit (OU). The ID and ARN don't change. The child OUs and accounts remain in place, and any attached policies of the OU remain attached. </p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the UpdateOrganizationalUnit service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsUpdateOrganizationalUnitResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorDuplicateOrganizationalUnit`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorOrganizationalUnitNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsUpdateOrganizationalUnitRequest
 @see AWSOrganizationsUpdateOrganizationalUnitResponse
 */
- (AWSTask<AWSOrganizationsUpdateOrganizationalUnitResponse *> *)updateOrganizationalUnit:(AWSOrganizationsUpdateOrganizationalUnitRequest *)request;

/**
 <p>Renames the specified organizational unit (OU). The ID and ARN don't change. The child OUs and accounts remain in place, and any attached policies of the OU remain attached. </p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the UpdateOrganizationalUnit service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorDuplicateOrganizationalUnit`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorOrganizationalUnitNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`.
 
 @see AWSOrganizationsUpdateOrganizationalUnitRequest
 @see AWSOrganizationsUpdateOrganizationalUnitResponse
 */
- (void)updateOrganizationalUnit:(AWSOrganizationsUpdateOrganizationalUnitRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsUpdateOrganizationalUnitResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing policy with a new name, description, or content. If you don't supply any parameter, that value remains unchanged. You can't change a policy's type.</p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSOrganizationsUpdatePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorDuplicatePolicy`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorMalformedPolicyDocument`, `AWSOrganizationsErrorPolicyNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`, `AWSOrganizationsErrorPolicyChangesInProgress`.
 
 @see AWSOrganizationsUpdatePolicyRequest
 @see AWSOrganizationsUpdatePolicyResponse
 */
- (AWSTask<AWSOrganizationsUpdatePolicyResponse *> *)updatePolicy:(AWSOrganizationsUpdatePolicyRequest *)request;

/**
 <p>Updates an existing policy with a new name, description, or content. If you don't supply any parameter, that value remains unchanged. You can't change a policy's type.</p><p>This operation can be called only from the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSOrganizationsErrorDomain` domain and the following error code: `AWSOrganizationsErrorAccessDenied`, `AWSOrganizationsErrorAWSOrganizationsNotInUse`, `AWSOrganizationsErrorConcurrentModification`, `AWSOrganizationsErrorConstraintViolation`, `AWSOrganizationsErrorDuplicatePolicy`, `AWSOrganizationsErrorInvalidInput`, `AWSOrganizationsErrorMalformedPolicyDocument`, `AWSOrganizationsErrorPolicyNotFound`, `AWSOrganizationsErrorService`, `AWSOrganizationsErrorTooManyRequests`, `AWSOrganizationsErrorUnsupportedAPIEndpoint`, `AWSOrganizationsErrorPolicyChangesInProgress`.
 
 @see AWSOrganizationsUpdatePolicyRequest
 @see AWSOrganizationsUpdatePolicyResponse
 */
- (void)updatePolicy:(AWSOrganizationsUpdatePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSOrganizationsUpdatePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
