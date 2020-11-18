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
#import "AWSConnectModel.h"
#import "AWSConnectResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSConnect
FOUNDATION_EXPORT NSString *const AWSConnectSDKVersion;

/**
 <p>Amazon Connect is a cloud-based contact center solution that makes it easy to set up and manage a customer contact center and provide reliable customer engagement at any scale.</p><p>Amazon Connect provides rich metrics and real-time reporting that allow you to optimize contact routing. You can also resolve customer issues more efficiently by putting customers in touch with the right agents.</p><p>There are limits to the number of Amazon Connect resources that you can create and limits to the number of requests that you can make per second. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">Amazon Connect Service Quotas</a> in the <i>Amazon Connect Administrator Guide</i>.</p><p>To connect programmatically to an AWS service, you use an endpoint. For a list of Amazon Connect endpoints, see <a href="https://docs.aws.amazon.com/general/latest/gr/connect_region.html">Amazon Connect Endpoints</a>.</p><note><p>Working with contact flows? Check out the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect Flow language</a>.</p></note>
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
 <p>Creates a contact flow for the specified Amazon Connect instance.</p><p>You can also create and update contact flows using the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect Flow language</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateContactFlow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateContactFlowResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidContactFlow`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateContactFlowRequest
 @see AWSConnectCreateContactFlowResponse
 */
- (AWSTask<AWSConnectCreateContactFlowResponse *> *)createContactFlow:(AWSConnectCreateContactFlowRequest *)request;

/**
 <p>Creates a contact flow for the specified Amazon Connect instance.</p><p>You can also create and update contact flows using the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect Flow language</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateContactFlow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidContactFlow`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateContactFlowRequest
 @see AWSConnectCreateContactFlowResponse
 */
- (void)createContactFlow:(AWSConnectCreateContactFlowRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreateContactFlowResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Describes the specified contact flow.</p><p>You can also create and update contact flows using the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect Flow language</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeContactFlow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeContactFlowResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorContactFlowNotPublished`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeContactFlowRequest
 @see AWSConnectDescribeContactFlowResponse
 */
- (AWSTask<AWSConnectDescribeContactFlowResponse *> *)describeContactFlow:(AWSConnectDescribeContactFlowRequest *)request;

/**
 <p>Describes the specified contact flow.</p><p>You can also create and update contact flows using the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect Flow language</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeContactFlow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorContactFlowNotPublished`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeContactFlowRequest
 @see AWSConnectDescribeContactFlowResponse
 */
- (void)describeContactFlow:(AWSConnectDescribeContactFlowRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeContactFlowResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Retrieves a token for federation.</p>
 
 @param request A container for the necessary parameters to execute the GetFederationToken service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectGetFederationTokenResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorUserNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorDuplicateResource`.
 
 @see AWSConnectGetFederationTokenRequest
 @see AWSConnectGetFederationTokenResponse
 */
- (AWSTask<AWSConnectGetFederationTokenResponse *> *)getFederationToken:(AWSConnectGetFederationTokenRequest *)request;

/**
 <p>Retrieves a token for federation.</p>
 
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
 <p>Provides information about the contact flows for the specified Amazon Connect instance.</p><p>You can also create and update contact flows using the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect Flow language</a>.</p><p>For more information about contact flows, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-contact-flows.html">Contact Flows</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListContactFlows service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListContactFlowsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListContactFlowsRequest
 @see AWSConnectListContactFlowsResponse
 */
- (AWSTask<AWSConnectListContactFlowsResponse *> *)listContactFlows:(AWSConnectListContactFlowsRequest *)request;

/**
 <p>Provides information about the contact flows for the specified Amazon Connect instance.</p><p>You can also create and update contact flows using the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect Flow language</a>.</p><p>For more information about contact flows, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-contact-flows.html">Contact Flows</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListContactFlows service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListContactFlowsRequest
 @see AWSConnectListContactFlowsResponse
 */
- (void)listContactFlows:(AWSConnectListContactFlowsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListContactFlowsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Provides information about the phone numbers for the specified Amazon Connect instance. </p><p>For more information about phone numbers, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/contact-center-phone-number.html">Set Up Phone Numbers for Your Contact Center</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListPhoneNumbers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListPhoneNumbersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListPhoneNumbersRequest
 @see AWSConnectListPhoneNumbersResponse
 */
- (AWSTask<AWSConnectListPhoneNumbersResponse *> *)listPhoneNumbers:(AWSConnectListPhoneNumbersRequest *)request;

/**
 <p>Provides information about the phone numbers for the specified Amazon Connect instance. </p><p>For more information about phone numbers, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/contact-center-phone-number.html">Set Up Phone Numbers for Your Contact Center</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListPhoneNumbers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListPhoneNumbersRequest
 @see AWSConnectListPhoneNumbersResponse
 */
- (void)listPhoneNumbers:(AWSConnectListPhoneNumbersRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListPhoneNumbersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Provides information about the queues for the specified Amazon Connect instance.</p><p>For more information about queues, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-queues-standard-and-agent.html">Queues: Standard and Agent</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListQueues service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListQueuesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListQueuesRequest
 @see AWSConnectListQueuesResponse
 */
- (AWSTask<AWSConnectListQueuesResponse *> *)listQueues:(AWSConnectListQueuesRequest *)request;

/**
 <p>Provides information about the queues for the specified Amazon Connect instance.</p><p>For more information about queues, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-queues-standard-and-agent.html">Queues: Standard and Agent</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListQueues service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListQueuesRequest
 @see AWSConnectListQueuesResponse
 */
- (void)listQueues:(AWSConnectListQueuesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListQueuesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List the queues associated with a routing profile.</p>
 
 @param request A container for the necessary parameters to execute the ListRoutingProfileQueues service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListRoutingProfileQueuesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListRoutingProfileQueuesRequest
 @see AWSConnectListRoutingProfileQueuesResponse
 */
- (AWSTask<AWSConnectListRoutingProfileQueuesResponse *> *)listRoutingProfileQueues:(AWSConnectListRoutingProfileQueuesRequest *)request;

/**
 <p>List the queues associated with a routing profile.</p>
 
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
 <p>Initiates a contact flow to start a new chat for the customer. Response of this API provides a token required to obtain credentials from the <a href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a> API in the Amazon Connect Participant Service.</p><p>When a new chat contact is successfully created, clients need to subscribe to the participant’s connection for the created chat within 5 minutes. This is achieved by invoking <a href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a> with WEBSOCKET and CONNECTION_CREDENTIALS. </p><p>A 429 error occurs in two situations:</p><ul><li><p>API rate limit is exceeded. API TPS throttling returns a <code>TooManyRequests</code> exception from the API Gateway.</p></li><li><p>The <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">quota for concurrent active chats</a> is exceeded. Active chat throttling returns a <code>LimitExceededException</code>.</p></li></ul><p>For more information about how chat works, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/chat.html">Chat</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StartChatContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectStartChatContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorLimitExceeded`.
 
 @see AWSConnectStartChatContactRequest
 @see AWSConnectStartChatContactResponse
 */
- (AWSTask<AWSConnectStartChatContactResponse *> *)startChatContact:(AWSConnectStartChatContactRequest *)request;

/**
 <p>Initiates a contact flow to start a new chat for the customer. Response of this API provides a token required to obtain credentials from the <a href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a> API in the Amazon Connect Participant Service.</p><p>When a new chat contact is successfully created, clients need to subscribe to the participant’s connection for the created chat within 5 minutes. This is achieved by invoking <a href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a> with WEBSOCKET and CONNECTION_CREDENTIALS. </p><p>A 429 error occurs in two situations:</p><ul><li><p>API rate limit is exceeded. API TPS throttling returns a <code>TooManyRequests</code> exception from the API Gateway.</p></li><li><p>The <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">quota for concurrent active chats</a> is exceeded. Active chat throttling returns a <code>LimitExceededException</code>.</p></li></ul><p>For more information about how chat works, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/chat.html">Chat</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StartChatContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorLimitExceeded`.
 
 @see AWSConnectStartChatContactRequest
 @see AWSConnectStartChatContactResponse
 */
- (void)startChatContact:(AWSConnectStartChatContactRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectStartChatContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API starts recording the contact when the agent joins the call. StartContactRecording is a one-time action. For example, if you use StopContactRecording to stop recording an ongoing call, you can't use StartContactRecording to restart it. For scenarios where the recording has started and you want to suspend and resume it, such as when collecting sensitive information (for example, a credit card number), use SuspendContactRecording and ResumeContactRecording.</p><p>You can use this API to override the recording behavior configured in the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/set-recording-behavior.html">Set recording behavior</a> block.</p><p>Only voice recordings are supported at this time.</p>
 
 @param request A container for the necessary parameters to execute the StartContactRecording service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectStartContactRecordingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectStartContactRecordingRequest
 @see AWSConnectStartContactRecordingResponse
 */
- (AWSTask<AWSConnectStartContactRecordingResponse *> *)startContactRecording:(AWSConnectStartContactRecordingRequest *)request;

/**
 <p>This API starts recording the contact when the agent joins the call. StartContactRecording is a one-time action. For example, if you use StopContactRecording to stop recording an ongoing call, you can't use StartContactRecording to restart it. For scenarios where the recording has started and you want to suspend and resume it, such as when collecting sensitive information (for example, a credit card number), use SuspendContactRecording and ResumeContactRecording.</p><p>You can use this API to override the recording behavior configured in the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/set-recording-behavior.html">Set recording behavior</a> block.</p><p>Only voice recordings are supported at this time.</p>
 
 @param request A container for the necessary parameters to execute the StartContactRecording service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectStartContactRecordingRequest
 @see AWSConnectStartContactRecordingResponse
 */
- (void)startContactRecording:(AWSConnectStartContactRecordingRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectStartContactRecordingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API places an outbound call to a contact, and then initiates the contact flow. It performs the actions in the contact flow that's specified (in <code>ContactFlowId</code>).</p><p>Agents are not involved in initiating the outbound API (that is, dialing the contact). If the contact flow places an outbound call to a contact, and then puts the contact in queue, that's when the call is routed to the agent, like any other inbound case.</p><p>There is a 60 second dialing timeout for this operation. If the call is not connected after 60 seconds, it fails.</p><note><p>UK numbers with a 447 prefix are not allowed by default. Before you can dial these UK mobile numbers, you must submit a service quota increase request. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">Amazon Connect Service Quotas</a> in the <i>Amazon Connect Administrator Guide</i>. </p></note>
 
 @param request A container for the necessary parameters to execute the StartOutboundVoiceContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectStartOutboundVoiceContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorDestinationNotAllowed`, `AWSConnectErrorOutboundContactNotPermitted`.
 
 @see AWSConnectStartOutboundVoiceContactRequest
 @see AWSConnectStartOutboundVoiceContactResponse
 */
- (AWSTask<AWSConnectStartOutboundVoiceContactResponse *> *)startOutboundVoiceContact:(AWSConnectStartOutboundVoiceContactRequest *)request;

/**
 <p>This API places an outbound call to a contact, and then initiates the contact flow. It performs the actions in the contact flow that's specified (in <code>ContactFlowId</code>).</p><p>Agents are not involved in initiating the outbound API (that is, dialing the contact). If the contact flow places an outbound call to a contact, and then puts the contact in queue, that's when the call is routed to the agent, like any other inbound case.</p><p>There is a 60 second dialing timeout for this operation. If the call is not connected after 60 seconds, it fails.</p><note><p>UK numbers with a 447 prefix are not allowed by default. Before you can dial these UK mobile numbers, you must submit a service quota increase request. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">Amazon Connect Service Quotas</a> in the <i>Amazon Connect Administrator Guide</i>. </p></note>
 
 @param request A container for the necessary parameters to execute the StartOutboundVoiceContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorDestinationNotAllowed`, `AWSConnectErrorOutboundContactNotPermitted`.
 
 @see AWSConnectStartOutboundVoiceContactRequest
 @see AWSConnectStartOutboundVoiceContactResponse
 */
- (void)startOutboundVoiceContact:(AWSConnectStartOutboundVoiceContactRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectStartOutboundVoiceContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Ends the specified contact.</p>
 
 @param request A container for the necessary parameters to execute the StopContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectStopContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorContactNotFound`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectStopContactRequest
 @see AWSConnectStopContactResponse
 */
- (AWSTask<AWSConnectStopContactResponse *> *)stopContact:(AWSConnectStopContactRequest *)request;

/**
 <p>Ends the specified contact.</p>
 
 @param request A container for the necessary parameters to execute the StopContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorContactNotFound`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectStopContactRequest
 @see AWSConnectStopContactResponse
 */
- (void)stopContact:(AWSConnectStopContactRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectStopContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>When a contact is being recorded, this API stops recording the call. StopContactRecording is a one-time action. If you use StopContactRecording to stop recording an ongoing call, you can't use StartContactRecording to restart it. For scenarios where the recording has started and you want to suspend it for sensitive information (for example, to collect a credit card number), and then restart it, use SuspendContactRecording and ResumeContactRecording.</p><p>Only voice recordings are supported at this time.</p>
 
 @param request A container for the necessary parameters to execute the StopContactRecording service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectStopContactRecordingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectStopContactRecordingRequest
 @see AWSConnectStopContactRecordingResponse
 */
- (AWSTask<AWSConnectStopContactRecordingResponse *> *)stopContactRecording:(AWSConnectStopContactRecordingRequest *)request;

/**
 <p>When a contact is being recorded, this API stops recording the call. StopContactRecording is a one-time action. If you use StopContactRecording to stop recording an ongoing call, you can't use StartContactRecording to restart it. For scenarios where the recording has started and you want to suspend it for sensitive information (for example, to collect a credit card number), and then restart it, use SuspendContactRecording and ResumeContactRecording.</p><p>Only voice recordings are supported at this time.</p>
 
 @param request A container for the necessary parameters to execute the StopContactRecording service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectStopContactRecordingRequest
 @see AWSConnectStopContactRecordingResponse
 */
- (void)stopContactRecording:(AWSConnectStopContactRecordingRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectStopContactRecordingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Adds the specified tags to the specified resource.</p><p>The supported resource types are users, routing profiles, and contact flows.</p><p>For sample policies that use tags, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/security_iam_id-based-policy-examples.html">Amazon Connect Identity-Based Policy Examples</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectTagResourceRequest
 */
- (AWSTask *)tagResource:(AWSConnectTagResourceRequest *)request;

/**
 <p>Adds the specified tags to the specified resource.</p><p>The supported resource types are users, routing profiles, and contact flows.</p><p>For sample policies that use tags, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/security_iam_id-based-policy-examples.html">Amazon Connect Identity-Based Policy Examples</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectTagResourceRequest
 */
- (void)tagResource:(AWSConnectTagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

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
 <p>Creates or updates the contact attributes associated with the specified contact.</p><p>You can add or update attributes for both ongoing and completed contacts. For example, you can update the customer's name or the reason the customer called while the call is active, or add notes about steps that the agent took during the call that are displayed to the next agent that takes the call. You can also update attributes for a contact using data from your CRM application and save the data with the contact in Amazon Connect. You could also flag calls for additional analysis, such as legal review or identifying abusive callers.</p><p>Contact attributes are available in Amazon Connect for 24 months, and are then deleted.</p><p><b>Important:</b> You cannot use the operation to update attributes for contacts that occurred prior to the release of the API, September 12, 2018. You can update attributes only for contacts that started after the release of the API. If you attempt to update attributes for a contact that occurred prior to the release of the API, a 400 error is returned. This applies also to queued callbacks that were initiated prior to the release of the API but are still active in your instance.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectUpdateContactAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactAttributesRequest
 @see AWSConnectUpdateContactAttributesResponse
 */
- (AWSTask<AWSConnectUpdateContactAttributesResponse *> *)updateContactAttributes:(AWSConnectUpdateContactAttributesRequest *)request;

/**
 <p>Creates or updates the contact attributes associated with the specified contact.</p><p>You can add or update attributes for both ongoing and completed contacts. For example, you can update the customer's name or the reason the customer called while the call is active, or add notes about steps that the agent took during the call that are displayed to the next agent that takes the call. You can also update attributes for a contact using data from your CRM application and save the data with the contact in Amazon Connect. You could also flag calls for additional analysis, such as legal review or identifying abusive callers.</p><p>Contact attributes are available in Amazon Connect for 24 months, and are then deleted.</p><p><b>Important:</b> You cannot use the operation to update attributes for contacts that occurred prior to the release of the API, September 12, 2018. You can update attributes only for contacts that started after the release of the API. If you attempt to update attributes for a contact that occurred prior to the release of the API, a 400 error is returned. This applies also to queued callbacks that were initiated prior to the release of the API but are still active in your instance.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactAttributesRequest
 @see AWSConnectUpdateContactAttributesResponse
 */
- (void)updateContactAttributes:(AWSConnectUpdateContactAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectUpdateContactAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified contact flow.</p><p>You can also create and update contact flows using the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect Flow language</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactFlowContent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidContactFlow`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactFlowContentRequest
 */
- (AWSTask *)updateContactFlowContent:(AWSConnectUpdateContactFlowContentRequest *)request;

/**
 <p>Updates the specified contact flow.</p><p>You can also create and update contact flows using the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect Flow language</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactFlowContent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidContactFlow`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactFlowContentRequest
 */
- (void)updateContactFlowContent:(AWSConnectUpdateContactFlowContentRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>The name of the contact flow.</p><p>You can also create and update contact flows using the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect Flow language</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactFlowName service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactFlowNameRequest
 */
- (AWSTask *)updateContactFlowName:(AWSConnectUpdateContactFlowNameRequest *)request;

/**
 <p>The name of the contact flow.</p><p>You can also create and update contact flows using the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect Flow language</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactFlowName service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactFlowNameRequest
 */
- (void)updateContactFlowName:(AWSConnectUpdateContactFlowNameRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

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
 <p>Updates the identity information for the specified user.</p><important><p>Someone with the ability to invoke <code>UpdateUserIndentityInfo</code> can change the login credentials of other users by changing their email address. This poses a security risk to your organization. They can change the email address of a user to the attacker's email address, and then reset the password through email. We strongly recommend limiting who has the ability to invoke <code>UpdateUserIndentityInfo</code>. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/security-profile-best-practices.html">Best Practices for Security Profiles</a> in the <i>Amazon Connect Administrator Guide</i>.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateUserIdentityInfo service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserIdentityInfoRequest
 */
- (AWSTask *)updateUserIdentityInfo:(AWSConnectUpdateUserIdentityInfoRequest *)request;

/**
 <p>Updates the identity information for the specified user.</p><important><p>Someone with the ability to invoke <code>UpdateUserIndentityInfo</code> can change the login credentials of other users by changing their email address. This poses a security risk to your organization. They can change the email address of a user to the attacker's email address, and then reset the password through email. We strongly recommend limiting who has the ability to invoke <code>UpdateUserIndentityInfo</code>. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/security-profile-best-practices.html">Best Practices for Security Profiles</a> in the <i>Amazon Connect Administrator Guide</i>.</p></important>
 
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
