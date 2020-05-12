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
#import "AWSWorkmailModel.h"
#import "AWSWorkmailResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSWorkmail
FOUNDATION_EXPORT NSString *const AWSWorkmailSDKVersion;

/**
 <p>Amazon WorkMail is a secure, managed business email and calendaring service with support for existing desktop and mobile email clients. You can access your email, contacts, and calendars using Microsoft Outlook, your browser, or other native iOS and Android email applications. You can integrate WorkMail with your existing corporate directory and control both the keys that encrypt your data and the location in which your data is stored.</p><p>The WorkMail API is designed for the following scenarios:</p><ul><li><p>Listing and describing organizations</p></li></ul><ul><li><p>Managing users</p></li></ul><ul><li><p>Managing groups</p></li></ul><ul><li><p>Managing resources</p></li></ul><p>All WorkMail API operations are Amazon-authenticated and certificate-signed. They not only require the use of the AWS SDK, but also allow for the exclusive use of AWS Identity and Access Management users and roles to help facilitate access, trust, and permission policies. By creating a role and allowing an IAM user to access the WorkMail site, the IAM user gains full administrative visibility into the entire WorkMail organization (or as set in the IAM policy). This includes, but is not limited to, the ability to create, update, and delete users, groups, and resources. This allows developers to perform the scenarios listed above, as well as give users the ability to grant access on a selective basis using the IAM model.</p>
 */
@interface AWSWorkmail : AWSService

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

     let Workmail = AWSWorkmail.default()

 *Objective-C*

     AWSWorkmail *Workmail = [AWSWorkmail defaultWorkmail];

 @return The default service client.
 */
+ (instancetype)defaultWorkmail;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSWorkmail.register(with: configuration!, forKey: "USWest2Workmail")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:@"USWest2Workmail"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Workmail = AWSWorkmail(forKey: "USWest2Workmail")

 *Objective-C*

     AWSWorkmail *Workmail = [AWSWorkmail WorkmailForKey:@"USWest2Workmail"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerWorkmailWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerWorkmailWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSWorkmail.register(with: configuration!, forKey: "USWest2Workmail")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:@"USWest2Workmail"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Workmail = AWSWorkmail(forKey: "USWest2Workmail")

 *Objective-C*

     AWSWorkmail *Workmail = [AWSWorkmail WorkmailForKey:@"USWest2Workmail"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)WorkmailForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeWorkmailForKey:(NSString *)key;

/**
 <p>Adds a member (user or group) to the resource's set of delegates.</p>
 
 @param request A container for the necessary parameters to execute the AssociateDelegateToResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailAssociateDelegateToResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailAssociateDelegateToResourceRequest
 @see AWSWorkmailAssociateDelegateToResourceResponse
 */
- (AWSTask<AWSWorkmailAssociateDelegateToResourceResponse *> *)associateDelegateToResource:(AWSWorkmailAssociateDelegateToResourceRequest *)request;

/**
 <p>Adds a member (user or group) to the resource's set of delegates.</p>
 
 @param request A container for the necessary parameters to execute the AssociateDelegateToResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailAssociateDelegateToResourceRequest
 @see AWSWorkmailAssociateDelegateToResourceResponse
 */
- (void)associateDelegateToResource:(AWSWorkmailAssociateDelegateToResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailAssociateDelegateToResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds a member (user or group) to the group's set.</p>
 
 @param request A container for the necessary parameters to execute the AssociateMemberToGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailAssociateMemberToGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorDirectoryServiceAuthenticationFailed`, `AWSWorkmailErrorDirectoryUnavailable`, `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`, `AWSWorkmailErrorUnsupportedOperation`.
 
 @see AWSWorkmailAssociateMemberToGroupRequest
 @see AWSWorkmailAssociateMemberToGroupResponse
 */
- (AWSTask<AWSWorkmailAssociateMemberToGroupResponse *> *)associateMemberToGroup:(AWSWorkmailAssociateMemberToGroupRequest *)request;

/**
 <p>Adds a member (user or group) to the group's set.</p>
 
 @param request A container for the necessary parameters to execute the AssociateMemberToGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorDirectoryServiceAuthenticationFailed`, `AWSWorkmailErrorDirectoryUnavailable`, `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`, `AWSWorkmailErrorUnsupportedOperation`.
 
 @see AWSWorkmailAssociateMemberToGroupRequest
 @see AWSWorkmailAssociateMemberToGroupResponse
 */
- (void)associateMemberToGroup:(AWSWorkmailAssociateMemberToGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailAssociateMemberToGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds an alias to the set of a given member (user or group) of Amazon WorkMail.</p>
 
 @param request A container for the necessary parameters to execute the CreateAlias service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailCreateAliasResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEmailAddressInUse`, `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorMailDomainNotFound`, `AWSWorkmailErrorMailDomainState`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`, `AWSWorkmailErrorLimitExceeded`.
 
 @see AWSWorkmailCreateAliasRequest
 @see AWSWorkmailCreateAliasResponse
 */
- (AWSTask<AWSWorkmailCreateAliasResponse *> *)createAlias:(AWSWorkmailCreateAliasRequest *)request;

/**
 <p>Adds an alias to the set of a given member (user or group) of Amazon WorkMail.</p>
 
 @param request A container for the necessary parameters to execute the CreateAlias service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEmailAddressInUse`, `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorMailDomainNotFound`, `AWSWorkmailErrorMailDomainState`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`, `AWSWorkmailErrorLimitExceeded`.
 
 @see AWSWorkmailCreateAliasRequest
 @see AWSWorkmailCreateAliasResponse
 */
- (void)createAlias:(AWSWorkmailCreateAliasRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailCreateAliasResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a group that can be used in Amazon WorkMail by calling the <a>RegisterToWorkMail</a> operation.</p>
 
 @param request A container for the necessary parameters to execute the CreateGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailCreateGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorDirectoryServiceAuthenticationFailed`, `AWSWorkmailErrorDirectoryUnavailable`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorNameAvailability`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`, `AWSWorkmailErrorReservedName`, `AWSWorkmailErrorUnsupportedOperation`.
 
 @see AWSWorkmailCreateGroupRequest
 @see AWSWorkmailCreateGroupResponse
 */
- (AWSTask<AWSWorkmailCreateGroupResponse *> *)createGroup:(AWSWorkmailCreateGroupRequest *)request;

/**
 <p>Creates a group that can be used in Amazon WorkMail by calling the <a>RegisterToWorkMail</a> operation.</p>
 
 @param request A container for the necessary parameters to execute the CreateGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorDirectoryServiceAuthenticationFailed`, `AWSWorkmailErrorDirectoryUnavailable`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorNameAvailability`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`, `AWSWorkmailErrorReservedName`, `AWSWorkmailErrorUnsupportedOperation`.
 
 @see AWSWorkmailCreateGroupRequest
 @see AWSWorkmailCreateGroupResponse
 */
- (void)createGroup:(AWSWorkmailCreateGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailCreateGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new Amazon WorkMail resource. </p>
 
 @param request A container for the necessary parameters to execute the CreateResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailCreateResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorDirectoryServiceAuthenticationFailed`, `AWSWorkmailErrorDirectoryUnavailable`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorNameAvailability`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`, `AWSWorkmailErrorReservedName`.
 
 @see AWSWorkmailCreateResourceRequest
 @see AWSWorkmailCreateResourceResponse
 */
- (AWSTask<AWSWorkmailCreateResourceResponse *> *)createResource:(AWSWorkmailCreateResourceRequest *)request;

/**
 <p>Creates a new Amazon WorkMail resource. </p>
 
 @param request A container for the necessary parameters to execute the CreateResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorDirectoryServiceAuthenticationFailed`, `AWSWorkmailErrorDirectoryUnavailable`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorNameAvailability`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`, `AWSWorkmailErrorReservedName`.
 
 @see AWSWorkmailCreateResourceRequest
 @see AWSWorkmailCreateResourceResponse
 */
- (void)createResource:(AWSWorkmailCreateResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailCreateResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a user who can be used in Amazon WorkMail by calling the <a>RegisterToWorkMail</a> operation.</p>
 
 @param request A container for the necessary parameters to execute the CreateUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailCreateUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorDirectoryServiceAuthenticationFailed`, `AWSWorkmailErrorDirectoryUnavailable`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorInvalidPassword`, `AWSWorkmailErrorNameAvailability`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`, `AWSWorkmailErrorReservedName`, `AWSWorkmailErrorUnsupportedOperation`.
 
 @see AWSWorkmailCreateUserRequest
 @see AWSWorkmailCreateUserResponse
 */
- (AWSTask<AWSWorkmailCreateUserResponse *> *)createUser:(AWSWorkmailCreateUserRequest *)request;

/**
 <p>Creates a user who can be used in Amazon WorkMail by calling the <a>RegisterToWorkMail</a> operation.</p>
 
 @param request A container for the necessary parameters to execute the CreateUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorDirectoryServiceAuthenticationFailed`, `AWSWorkmailErrorDirectoryUnavailable`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorInvalidPassword`, `AWSWorkmailErrorNameAvailability`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`, `AWSWorkmailErrorReservedName`, `AWSWorkmailErrorUnsupportedOperation`.
 
 @see AWSWorkmailCreateUserRequest
 @see AWSWorkmailCreateUserResponse
 */
- (void)createUser:(AWSWorkmailCreateUserRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailCreateUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an access control rule for the specified WorkMail organization.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAccessControlRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailDeleteAccessControlRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailDeleteAccessControlRuleRequest
 @see AWSWorkmailDeleteAccessControlRuleResponse
 */
- (AWSTask<AWSWorkmailDeleteAccessControlRuleResponse *> *)deleteAccessControlRule:(AWSWorkmailDeleteAccessControlRuleRequest *)request;

/**
 <p>Deletes an access control rule for the specified WorkMail organization.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAccessControlRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailDeleteAccessControlRuleRequest
 @see AWSWorkmailDeleteAccessControlRuleResponse
 */
- (void)deleteAccessControlRule:(AWSWorkmailDeleteAccessControlRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailDeleteAccessControlRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Remove one or more specified aliases from a set of aliases for a given user.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAlias service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailDeleteAliasResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailDeleteAliasRequest
 @see AWSWorkmailDeleteAliasResponse
 */
- (AWSTask<AWSWorkmailDeleteAliasResponse *> *)deleteAlias:(AWSWorkmailDeleteAliasRequest *)request;

/**
 <p>Remove one or more specified aliases from a set of aliases for a given user.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAlias service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailDeleteAliasRequest
 @see AWSWorkmailDeleteAliasResponse
 */
- (void)deleteAlias:(AWSWorkmailDeleteAliasRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailDeleteAliasResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a group from Amazon WorkMail.</p>
 
 @param request A container for the necessary parameters to execute the DeleteGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailDeleteGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorDirectoryServiceAuthenticationFailed`, `AWSWorkmailErrorDirectoryUnavailable`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`, `AWSWorkmailErrorUnsupportedOperation`.
 
 @see AWSWorkmailDeleteGroupRequest
 @see AWSWorkmailDeleteGroupResponse
 */
- (AWSTask<AWSWorkmailDeleteGroupResponse *> *)deleteGroup:(AWSWorkmailDeleteGroupRequest *)request;

/**
 <p>Deletes a group from Amazon WorkMail.</p>
 
 @param request A container for the necessary parameters to execute the DeleteGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorDirectoryServiceAuthenticationFailed`, `AWSWorkmailErrorDirectoryUnavailable`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`, `AWSWorkmailErrorUnsupportedOperation`.
 
 @see AWSWorkmailDeleteGroupRequest
 @see AWSWorkmailDeleteGroupResponse
 */
- (void)deleteGroup:(AWSWorkmailDeleteGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailDeleteGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes permissions granted to a member (user or group).</p>
 
 @param request A container for the necessary parameters to execute the DeleteMailboxPermissions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailDeleteMailboxPermissionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailDeleteMailboxPermissionsRequest
 @see AWSWorkmailDeleteMailboxPermissionsResponse
 */
- (AWSTask<AWSWorkmailDeleteMailboxPermissionsResponse *> *)deleteMailboxPermissions:(AWSWorkmailDeleteMailboxPermissionsRequest *)request;

/**
 <p>Deletes permissions granted to a member (user or group).</p>
 
 @param request A container for the necessary parameters to execute the DeleteMailboxPermissions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailDeleteMailboxPermissionsRequest
 @see AWSWorkmailDeleteMailboxPermissionsResponse
 */
- (void)deleteMailboxPermissions:(AWSWorkmailDeleteMailboxPermissionsRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailDeleteMailboxPermissionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified resource. </p>
 
 @param request A container for the necessary parameters to execute the DeleteResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailDeleteResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailDeleteResourceRequest
 @see AWSWorkmailDeleteResourceResponse
 */
- (AWSTask<AWSWorkmailDeleteResourceResponse *> *)deleteResource:(AWSWorkmailDeleteResourceRequest *)request;

/**
 <p>Deletes the specified resource. </p>
 
 @param request A container for the necessary parameters to execute the DeleteResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailDeleteResourceRequest
 @see AWSWorkmailDeleteResourceResponse
 */
- (void)deleteResource:(AWSWorkmailDeleteResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailDeleteResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a user from Amazon WorkMail and all subsequent systems. Before you can delete a user, the user state must be <code>DISABLED</code>. Use the <a>DescribeUser</a> action to confirm the user state.</p><p>Deleting a user is permanent and cannot be undone. WorkMail archives user mailboxes for 30 days before they are permanently removed.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailDeleteUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorDirectoryServiceAuthenticationFailed`, `AWSWorkmailErrorDirectoryUnavailable`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`, `AWSWorkmailErrorUnsupportedOperation`.
 
 @see AWSWorkmailDeleteUserRequest
 @see AWSWorkmailDeleteUserResponse
 */
- (AWSTask<AWSWorkmailDeleteUserResponse *> *)deleteUser:(AWSWorkmailDeleteUserRequest *)request;

/**
 <p>Deletes a user from Amazon WorkMail and all subsequent systems. Before you can delete a user, the user state must be <code>DISABLED</code>. Use the <a>DescribeUser</a> action to confirm the user state.</p><p>Deleting a user is permanent and cannot be undone. WorkMail archives user mailboxes for 30 days before they are permanently removed.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorDirectoryServiceAuthenticationFailed`, `AWSWorkmailErrorDirectoryUnavailable`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`, `AWSWorkmailErrorUnsupportedOperation`.
 
 @see AWSWorkmailDeleteUserRequest
 @see AWSWorkmailDeleteUserResponse
 */
- (void)deleteUser:(AWSWorkmailDeleteUserRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailDeleteUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Mark a user, group, or resource as no longer used in Amazon WorkMail. This action disassociates the mailbox and schedules it for clean-up. WorkMail keeps mailboxes for 30 days before they are permanently removed. The functionality in the console is <i>Disable</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterFromWorkMail service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailDeregisterFromWorkMailResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailDeregisterFromWorkMailRequest
 @see AWSWorkmailDeregisterFromWorkMailResponse
 */
- (AWSTask<AWSWorkmailDeregisterFromWorkMailResponse *> *)deregisterFromWorkMail:(AWSWorkmailDeregisterFromWorkMailRequest *)request;

/**
 <p>Mark a user, group, or resource as no longer used in Amazon WorkMail. This action disassociates the mailbox and schedules it for clean-up. WorkMail keeps mailboxes for 30 days before they are permanently removed. The functionality in the console is <i>Disable</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterFromWorkMail service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailDeregisterFromWorkMailRequest
 @see AWSWorkmailDeregisterFromWorkMailResponse
 */
- (void)deregisterFromWorkMail:(AWSWorkmailDeregisterFromWorkMailRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailDeregisterFromWorkMailResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the data available for the group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailDescribeGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailDescribeGroupRequest
 @see AWSWorkmailDescribeGroupResponse
 */
- (AWSTask<AWSWorkmailDescribeGroupResponse *> *)describeGroup:(AWSWorkmailDescribeGroupRequest *)request;

/**
 <p>Returns the data available for the group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailDescribeGroupRequest
 @see AWSWorkmailDescribeGroupResponse
 */
- (void)describeGroup:(AWSWorkmailDescribeGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailDescribeGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides more information regarding a given organization based on its identifier.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOrganization service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailDescribeOrganizationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`.
 
 @see AWSWorkmailDescribeOrganizationRequest
 @see AWSWorkmailDescribeOrganizationResponse
 */
- (AWSTask<AWSWorkmailDescribeOrganizationResponse *> *)describeOrganization:(AWSWorkmailDescribeOrganizationRequest *)request;

/**
 <p>Provides more information regarding a given organization based on its identifier.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOrganization service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`.
 
 @see AWSWorkmailDescribeOrganizationRequest
 @see AWSWorkmailDescribeOrganizationResponse
 */
- (void)describeOrganization:(AWSWorkmailDescribeOrganizationRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailDescribeOrganizationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the data available for the resource.</p>
 
 @param request A container for the necessary parameters to execute the DescribeResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailDescribeResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailDescribeResourceRequest
 @see AWSWorkmailDescribeResourceResponse
 */
- (AWSTask<AWSWorkmailDescribeResourceResponse *> *)describeResource:(AWSWorkmailDescribeResourceRequest *)request;

/**
 <p>Returns the data available for the resource.</p>
 
 @param request A container for the necessary parameters to execute the DescribeResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailDescribeResourceRequest
 @see AWSWorkmailDescribeResourceResponse
 */
- (void)describeResource:(AWSWorkmailDescribeResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailDescribeResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information regarding the user.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailDescribeUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailDescribeUserRequest
 @see AWSWorkmailDescribeUserResponse
 */
- (AWSTask<AWSWorkmailDescribeUserResponse *> *)describeUser:(AWSWorkmailDescribeUserRequest *)request;

/**
 <p>Provides information regarding the user.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailDescribeUserRequest
 @see AWSWorkmailDescribeUserResponse
 */
- (void)describeUser:(AWSWorkmailDescribeUserRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailDescribeUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a member from the resource's set of delegates.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateDelegateFromResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailDisassociateDelegateFromResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailDisassociateDelegateFromResourceRequest
 @see AWSWorkmailDisassociateDelegateFromResourceResponse
 */
- (AWSTask<AWSWorkmailDisassociateDelegateFromResourceResponse *> *)disassociateDelegateFromResource:(AWSWorkmailDisassociateDelegateFromResourceRequest *)request;

/**
 <p>Removes a member from the resource's set of delegates.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateDelegateFromResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailDisassociateDelegateFromResourceRequest
 @see AWSWorkmailDisassociateDelegateFromResourceResponse
 */
- (void)disassociateDelegateFromResource:(AWSWorkmailDisassociateDelegateFromResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailDisassociateDelegateFromResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a member from a group.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateMemberFromGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailDisassociateMemberFromGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorDirectoryServiceAuthenticationFailed`, `AWSWorkmailErrorDirectoryUnavailable`, `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`, `AWSWorkmailErrorUnsupportedOperation`.
 
 @see AWSWorkmailDisassociateMemberFromGroupRequest
 @see AWSWorkmailDisassociateMemberFromGroupResponse
 */
- (AWSTask<AWSWorkmailDisassociateMemberFromGroupResponse *> *)disassociateMemberFromGroup:(AWSWorkmailDisassociateMemberFromGroupRequest *)request;

/**
 <p>Removes a member from a group.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateMemberFromGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorDirectoryServiceAuthenticationFailed`, `AWSWorkmailErrorDirectoryUnavailable`, `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`, `AWSWorkmailErrorUnsupportedOperation`.
 
 @see AWSWorkmailDisassociateMemberFromGroupRequest
 @see AWSWorkmailDisassociateMemberFromGroupResponse
 */
- (void)disassociateMemberFromGroup:(AWSWorkmailDisassociateMemberFromGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailDisassociateMemberFromGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the effects of an organization's access control rules as they apply to a specified IPv4 address, access protocol action, or user ID. </p>
 
 @param request A container for the necessary parameters to execute the GetAccessControlEffect service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailGetAccessControlEffectResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailGetAccessControlEffectRequest
 @see AWSWorkmailGetAccessControlEffectResponse
 */
- (AWSTask<AWSWorkmailGetAccessControlEffectResponse *> *)getAccessControlEffect:(AWSWorkmailGetAccessControlEffectRequest *)request;

/**
 <p>Gets the effects of an organization's access control rules as they apply to a specified IPv4 address, access protocol action, or user ID. </p>
 
 @param request A container for the necessary parameters to execute the GetAccessControlEffect service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailGetAccessControlEffectRequest
 @see AWSWorkmailGetAccessControlEffectResponse
 */
- (void)getAccessControlEffect:(AWSWorkmailGetAccessControlEffectRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailGetAccessControlEffectResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Requests a user's mailbox details for a specified organization and user.</p>
 
 @param request A container for the necessary parameters to execute the GetMailboxDetails service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailGetMailboxDetailsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`, `AWSWorkmailErrorEntityNotFound`.
 
 @see AWSWorkmailGetMailboxDetailsRequest
 @see AWSWorkmailGetMailboxDetailsResponse
 */
- (AWSTask<AWSWorkmailGetMailboxDetailsResponse *> *)getMailboxDetails:(AWSWorkmailGetMailboxDetailsRequest *)request;

/**
 <p>Requests a user's mailbox details for a specified organization and user.</p>
 
 @param request A container for the necessary parameters to execute the GetMailboxDetails service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`, `AWSWorkmailErrorEntityNotFound`.
 
 @see AWSWorkmailGetMailboxDetailsRequest
 @see AWSWorkmailGetMailboxDetailsResponse
 */
- (void)getMailboxDetails:(AWSWorkmailGetMailboxDetailsRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailGetMailboxDetailsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the access control rules for the specified organization.</p>
 
 @param request A container for the necessary parameters to execute the ListAccessControlRules service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailListAccessControlRulesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailListAccessControlRulesRequest
 @see AWSWorkmailListAccessControlRulesResponse
 */
- (AWSTask<AWSWorkmailListAccessControlRulesResponse *> *)listAccessControlRules:(AWSWorkmailListAccessControlRulesRequest *)request;

/**
 <p>Lists the access control rules for the specified organization.</p>
 
 @param request A container for the necessary parameters to execute the ListAccessControlRules service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailListAccessControlRulesRequest
 @see AWSWorkmailListAccessControlRulesResponse
 */
- (void)listAccessControlRules:(AWSWorkmailListAccessControlRulesRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailListAccessControlRulesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a paginated call to list the aliases associated with a given entity.</p>
 
 @param request A container for the necessary parameters to execute the ListAliases service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailListAliasesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailListAliasesRequest
 @see AWSWorkmailListAliasesResponse
 */
- (AWSTask<AWSWorkmailListAliasesResponse *> *)listAliases:(AWSWorkmailListAliasesRequest *)request;

/**
 <p>Creates a paginated call to list the aliases associated with a given entity.</p>
 
 @param request A container for the necessary parameters to execute the ListAliases service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailListAliasesRequest
 @see AWSWorkmailListAliasesResponse
 */
- (void)listAliases:(AWSWorkmailListAliasesRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailListAliasesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an overview of the members of a group. Users and groups can be members of a group.</p>
 
 @param request A container for the necessary parameters to execute the ListGroupMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailListGroupMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailListGroupMembersRequest
 @see AWSWorkmailListGroupMembersResponse
 */
- (AWSTask<AWSWorkmailListGroupMembersResponse *> *)listGroupMembers:(AWSWorkmailListGroupMembersRequest *)request;

/**
 <p>Returns an overview of the members of a group. Users and groups can be members of a group.</p>
 
 @param request A container for the necessary parameters to execute the ListGroupMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailListGroupMembersRequest
 @see AWSWorkmailListGroupMembersResponse
 */
- (void)listGroupMembers:(AWSWorkmailListGroupMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailListGroupMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns summaries of the organization's groups.</p>
 
 @param request A container for the necessary parameters to execute the ListGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailListGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailListGroupsRequest
 @see AWSWorkmailListGroupsResponse
 */
- (AWSTask<AWSWorkmailListGroupsResponse *> *)listGroups:(AWSWorkmailListGroupsRequest *)request;

/**
 <p>Returns summaries of the organization's groups.</p>
 
 @param request A container for the necessary parameters to execute the ListGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailListGroupsRequest
 @see AWSWorkmailListGroupsResponse
 */
- (void)listGroups:(AWSWorkmailListGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailListGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the mailbox permissions associated with a user, group, or resource mailbox.</p>
 
 @param request A container for the necessary parameters to execute the ListMailboxPermissions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailListMailboxPermissionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailListMailboxPermissionsRequest
 @see AWSWorkmailListMailboxPermissionsResponse
 */
- (AWSTask<AWSWorkmailListMailboxPermissionsResponse *> *)listMailboxPermissions:(AWSWorkmailListMailboxPermissionsRequest *)request;

/**
 <p>Lists the mailbox permissions associated with a user, group, or resource mailbox.</p>
 
 @param request A container for the necessary parameters to execute the ListMailboxPermissions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailListMailboxPermissionsRequest
 @see AWSWorkmailListMailboxPermissionsResponse
 */
- (void)listMailboxPermissions:(AWSWorkmailListMailboxPermissionsRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailListMailboxPermissionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns summaries of the customer's organizations.</p>
 
 @param request A container for the necessary parameters to execute the ListOrganizations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailListOrganizationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorInvalidParameter`.
 
 @see AWSWorkmailListOrganizationsRequest
 @see AWSWorkmailListOrganizationsResponse
 */
- (AWSTask<AWSWorkmailListOrganizationsResponse *> *)listOrganizations:(AWSWorkmailListOrganizationsRequest *)request;

/**
 <p>Returns summaries of the customer's organizations.</p>
 
 @param request A container for the necessary parameters to execute the ListOrganizations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorInvalidParameter`.
 
 @see AWSWorkmailListOrganizationsRequest
 @see AWSWorkmailListOrganizationsResponse
 */
- (void)listOrganizations:(AWSWorkmailListOrganizationsRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailListOrganizationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the delegates associated with a resource. Users and groups can be resource delegates and answer requests on behalf of the resource.</p>
 
 @param request A container for the necessary parameters to execute the ListResourceDelegates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailListResourceDelegatesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailListResourceDelegatesRequest
 @see AWSWorkmailListResourceDelegatesResponse
 */
- (AWSTask<AWSWorkmailListResourceDelegatesResponse *> *)listResourceDelegates:(AWSWorkmailListResourceDelegatesRequest *)request;

/**
 <p>Lists the delegates associated with a resource. Users and groups can be resource delegates and answer requests on behalf of the resource.</p>
 
 @param request A container for the necessary parameters to execute the ListResourceDelegates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailListResourceDelegatesRequest
 @see AWSWorkmailListResourceDelegatesResponse
 */
- (void)listResourceDelegates:(AWSWorkmailListResourceDelegatesRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailListResourceDelegatesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns summaries of the organization's resources.</p>
 
 @param request A container for the necessary parameters to execute the ListResources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailListResourcesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailListResourcesRequest
 @see AWSWorkmailListResourcesResponse
 */
- (AWSTask<AWSWorkmailListResourcesResponse *> *)listResources:(AWSWorkmailListResourcesRequest *)request;

/**
 <p>Returns summaries of the organization's resources.</p>
 
 @param request A container for the necessary parameters to execute the ListResources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailListResourcesRequest
 @see AWSWorkmailListResourcesResponse
 */
- (void)listResources:(AWSWorkmailListResourcesRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailListResourcesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tags applied to an Amazon WorkMail organization resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorResourceNotFound`.
 
 @see AWSWorkmailListTagsForResourceRequest
 @see AWSWorkmailListTagsForResourceResponse
 */
- (AWSTask<AWSWorkmailListTagsForResourceResponse *> *)listTagsForResource:(AWSWorkmailListTagsForResourceRequest *)request;

/**
 <p>Lists the tags applied to an Amazon WorkMail organization resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorResourceNotFound`.
 
 @see AWSWorkmailListTagsForResourceRequest
 @see AWSWorkmailListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSWorkmailListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns summaries of the organization's users.</p>
 
 @param request A container for the necessary parameters to execute the ListUsers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailListUsersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailListUsersRequest
 @see AWSWorkmailListUsersResponse
 */
- (AWSTask<AWSWorkmailListUsersResponse *> *)listUsers:(AWSWorkmailListUsersRequest *)request;

/**
 <p>Returns summaries of the organization's users.</p>
 
 @param request A container for the necessary parameters to execute the ListUsers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailListUsersRequest
 @see AWSWorkmailListUsersResponse
 */
- (void)listUsers:(AWSWorkmailListUsersRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailListUsersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds a new access control rule for the specified organization. The rule allows or denies access to the organization for the specified IPv4 addresses, access protocol actions, and user IDs. Adding a new rule with the same name as an existing rule replaces the older rule.</p>
 
 @param request A container for the necessary parameters to execute the PutAccessControlRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailPutAccessControlRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorLimitExceeded`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailPutAccessControlRuleRequest
 @see AWSWorkmailPutAccessControlRuleResponse
 */
- (AWSTask<AWSWorkmailPutAccessControlRuleResponse *> *)putAccessControlRule:(AWSWorkmailPutAccessControlRuleRequest *)request;

/**
 <p>Adds a new access control rule for the specified organization. The rule allows or denies access to the organization for the specified IPv4 addresses, access protocol actions, and user IDs. Adding a new rule with the same name as an existing rule replaces the older rule.</p>
 
 @param request A container for the necessary parameters to execute the PutAccessControlRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorLimitExceeded`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailPutAccessControlRuleRequest
 @see AWSWorkmailPutAccessControlRuleResponse
 */
- (void)putAccessControlRule:(AWSWorkmailPutAccessControlRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailPutAccessControlRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets permissions for a user, group, or resource. This replaces any pre-existing permissions.</p>
 
 @param request A container for the necessary parameters to execute the PutMailboxPermissions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailPutMailboxPermissionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailPutMailboxPermissionsRequest
 @see AWSWorkmailPutMailboxPermissionsResponse
 */
- (AWSTask<AWSWorkmailPutMailboxPermissionsResponse *> *)putMailboxPermissions:(AWSWorkmailPutMailboxPermissionsRequest *)request;

/**
 <p>Sets permissions for a user, group, or resource. This replaces any pre-existing permissions.</p>
 
 @param request A container for the necessary parameters to execute the PutMailboxPermissions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailPutMailboxPermissionsRequest
 @see AWSWorkmailPutMailboxPermissionsResponse
 */
- (void)putMailboxPermissions:(AWSWorkmailPutMailboxPermissionsRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailPutMailboxPermissionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers an existing and disabled user, group, or resource for Amazon WorkMail use by associating a mailbox and calendaring capabilities. It performs no change if the user, group, or resource is enabled and fails if the user, group, or resource is deleted. This operation results in the accumulation of costs. For more information, see <a href="https://aws.amazon.com/workmail/pricing">Pricing</a>. The equivalent console functionality for this operation is <i>Enable</i>. </p><p>Users can either be created by calling the <a>CreateUser</a> API operation or they can be synchronized from your directory. For more information, see <a>DeregisterFromWorkMail</a>.</p>
 
 @param request A container for the necessary parameters to execute the RegisterToWorkMail service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailRegisterToWorkMailResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorDirectoryServiceAuthenticationFailed`, `AWSWorkmailErrorDirectoryUnavailable`, `AWSWorkmailErrorEmailAddressInUse`, `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorEntityAlreadyRegistered`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorMailDomainNotFound`, `AWSWorkmailErrorMailDomainState`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailRegisterToWorkMailRequest
 @see AWSWorkmailRegisterToWorkMailResponse
 */
- (AWSTask<AWSWorkmailRegisterToWorkMailResponse *> *)registerToWorkMail:(AWSWorkmailRegisterToWorkMailRequest *)request;

/**
 <p>Registers an existing and disabled user, group, or resource for Amazon WorkMail use by associating a mailbox and calendaring capabilities. It performs no change if the user, group, or resource is enabled and fails if the user, group, or resource is deleted. This operation results in the accumulation of costs. For more information, see <a href="https://aws.amazon.com/workmail/pricing">Pricing</a>. The equivalent console functionality for this operation is <i>Enable</i>. </p><p>Users can either be created by calling the <a>CreateUser</a> API operation or they can be synchronized from your directory. For more information, see <a>DeregisterFromWorkMail</a>.</p>
 
 @param request A container for the necessary parameters to execute the RegisterToWorkMail service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorDirectoryServiceAuthenticationFailed`, `AWSWorkmailErrorDirectoryUnavailable`, `AWSWorkmailErrorEmailAddressInUse`, `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorEntityAlreadyRegistered`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorMailDomainNotFound`, `AWSWorkmailErrorMailDomainState`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailRegisterToWorkMailRequest
 @see AWSWorkmailRegisterToWorkMailResponse
 */
- (void)registerToWorkMail:(AWSWorkmailRegisterToWorkMailRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailRegisterToWorkMailResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allows the administrator to reset the password for a user.</p>
 
 @param request A container for the necessary parameters to execute the ResetPassword service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailResetPasswordResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorDirectoryServiceAuthenticationFailed`, `AWSWorkmailErrorDirectoryUnavailable`, `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorInvalidPassword`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`, `AWSWorkmailErrorUnsupportedOperation`.
 
 @see AWSWorkmailResetPasswordRequest
 @see AWSWorkmailResetPasswordResponse
 */
- (AWSTask<AWSWorkmailResetPasswordResponse *> *)resetPassword:(AWSWorkmailResetPasswordRequest *)request;

/**
 <p>Allows the administrator to reset the password for a user.</p>
 
 @param request A container for the necessary parameters to execute the ResetPassword service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorDirectoryServiceAuthenticationFailed`, `AWSWorkmailErrorDirectoryUnavailable`, `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorInvalidPassword`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`, `AWSWorkmailErrorUnsupportedOperation`.
 
 @see AWSWorkmailResetPasswordRequest
 @see AWSWorkmailResetPasswordResponse
 */
- (void)resetPassword:(AWSWorkmailResetPasswordRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailResetPasswordResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Applies the specified tags to the specified Amazon WorkMail organization resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorResourceNotFound`, `AWSWorkmailErrorTooManyTags`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailTagResourceRequest
 @see AWSWorkmailTagResourceResponse
 */
- (AWSTask<AWSWorkmailTagResourceResponse *> *)tagResource:(AWSWorkmailTagResourceRequest *)request;

/**
 <p>Applies the specified tags to the specified Amazon WorkMail organization resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorResourceNotFound`, `AWSWorkmailErrorTooManyTags`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailTagResourceRequest
 @see AWSWorkmailTagResourceResponse
 */
- (void)tagResource:(AWSWorkmailTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Untags the specified tags from the specified Amazon WorkMail organization resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorResourceNotFound`.
 
 @see AWSWorkmailUntagResourceRequest
 @see AWSWorkmailUntagResourceResponse
 */
- (AWSTask<AWSWorkmailUntagResourceResponse *> *)untagResource:(AWSWorkmailUntagResourceRequest *)request;

/**
 <p>Untags the specified tags from the specified Amazon WorkMail organization resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorResourceNotFound`.
 
 @see AWSWorkmailUntagResourceRequest
 @see AWSWorkmailUntagResourceResponse
 */
- (void)untagResource:(AWSWorkmailUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a user's current mailbox quota for a specified organization and user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMailboxQuota service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailUpdateMailboxQuotaResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`, `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`.
 
 @see AWSWorkmailUpdateMailboxQuotaRequest
 @see AWSWorkmailUpdateMailboxQuotaResponse
 */
- (AWSTask<AWSWorkmailUpdateMailboxQuotaResponse *> *)updateMailboxQuota:(AWSWorkmailUpdateMailboxQuotaRequest *)request;

/**
 <p>Updates a user's current mailbox quota for a specified organization and user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMailboxQuota service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`, `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`.
 
 @see AWSWorkmailUpdateMailboxQuotaRequest
 @see AWSWorkmailUpdateMailboxQuotaResponse
 */
- (void)updateMailboxQuota:(AWSWorkmailUpdateMailboxQuotaRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailUpdateMailboxQuotaResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the primary email for a user, group, or resource. The current email is moved into the list of aliases (or swapped between an existing alias and the current primary email), and the email provided in the input is promoted as the primary.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePrimaryEmailAddress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailUpdatePrimaryEmailAddressResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorDirectoryServiceAuthenticationFailed`, `AWSWorkmailErrorDirectoryUnavailable`, `AWSWorkmailErrorEmailAddressInUse`, `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorMailDomainNotFound`, `AWSWorkmailErrorMailDomainState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`, `AWSWorkmailErrorUnsupportedOperation`.
 
 @see AWSWorkmailUpdatePrimaryEmailAddressRequest
 @see AWSWorkmailUpdatePrimaryEmailAddressResponse
 */
- (AWSTask<AWSWorkmailUpdatePrimaryEmailAddressResponse *> *)updatePrimaryEmailAddress:(AWSWorkmailUpdatePrimaryEmailAddressRequest *)request;

/**
 <p>Updates the primary email for a user, group, or resource. The current email is moved into the list of aliases (or swapped between an existing alias and the current primary email), and the email provided in the input is promoted as the primary.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePrimaryEmailAddress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorDirectoryServiceAuthenticationFailed`, `AWSWorkmailErrorDirectoryUnavailable`, `AWSWorkmailErrorEmailAddressInUse`, `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorMailDomainNotFound`, `AWSWorkmailErrorMailDomainState`, `AWSWorkmailErrorInvalidParameter`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`, `AWSWorkmailErrorUnsupportedOperation`.
 
 @see AWSWorkmailUpdatePrimaryEmailAddressRequest
 @see AWSWorkmailUpdatePrimaryEmailAddressResponse
 */
- (void)updatePrimaryEmailAddress:(AWSWorkmailUpdatePrimaryEmailAddressRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailUpdatePrimaryEmailAddressResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates data for the resource. To have the latest information, it must be preceded by a <a>DescribeResource</a> call. The dataset in the request should be the one expected when performing another <code>DescribeResource</code> call.</p>
 
 @param request A container for the necessary parameters to execute the UpdateResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorkmailUpdateResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorDirectoryUnavailable`, `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidConfiguration`, `AWSWorkmailErrorEmailAddressInUse`, `AWSWorkmailErrorMailDomainNotFound`, `AWSWorkmailErrorMailDomainState`, `AWSWorkmailErrorNameAvailability`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailUpdateResourceRequest
 @see AWSWorkmailUpdateResourceResponse
 */
- (AWSTask<AWSWorkmailUpdateResourceResponse *> *)updateResource:(AWSWorkmailUpdateResourceRequest *)request;

/**
 <p>Updates data for the resource. To have the latest information, it must be preceded by a <a>DescribeResource</a> call. The dataset in the request should be the one expected when performing another <code>DescribeResource</code> call.</p>
 
 @param request A container for the necessary parameters to execute the UpdateResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorkmailErrorDomain` domain and the following error code: `AWSWorkmailErrorDirectoryUnavailable`, `AWSWorkmailErrorEntityNotFound`, `AWSWorkmailErrorEntityState`, `AWSWorkmailErrorInvalidConfiguration`, `AWSWorkmailErrorEmailAddressInUse`, `AWSWorkmailErrorMailDomainNotFound`, `AWSWorkmailErrorMailDomainState`, `AWSWorkmailErrorNameAvailability`, `AWSWorkmailErrorOrganizationNotFound`, `AWSWorkmailErrorOrganizationState`.
 
 @see AWSWorkmailUpdateResourceRequest
 @see AWSWorkmailUpdateResourceResponse
 */
- (void)updateResource:(AWSWorkmailUpdateResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSWorkmailUpdateResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
