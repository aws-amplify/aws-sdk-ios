//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
 <p>The Amazon Connect API Reference provides descriptions, syntax, and usage examples for each of the Amazon Connect actions, data types, parameters, and errors. Amazon Connect is a cloud-based contact center solution that makes it easy to set up and manage a customer contact center and provide reliable customer engagement at any scale.</p><p>Throttling limits for the Amazon Connect API operations:</p><p>For the <code>GetMetricData</code> and <code>GetCurrentMetricData</code> operations, a RateLimit of 5 per second, and a BurstLimit of 8 per second.</p><p>For all other operations, a RateLimit of 2 per second, and a BurstLimit of 5 per second.</p><p>You can request an increase to the throttling limits by submitting a <a href="https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase">Amazon Connect service limits increase form</a>. You must be signed in to your AWS account to access the form.</p>
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
 <p>Creates a new user account in your Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the CreateUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateUserRequest
 @see AWSConnectCreateUserResponse
 */
- (AWSTask<AWSConnectCreateUserResponse *> *)createUser:(AWSConnectCreateUserRequest *)request;

/**
 <p>Creates a new user account in your Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the CreateUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateUserRequest
 @see AWSConnectCreateUserResponse
 */
- (void)createUser:(AWSConnectCreateUserRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreateUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a user account from Amazon Connect.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteUserRequest
 */
- (AWSTask *)deleteUser:(AWSConnectDeleteUserRequest *)request;

/**
 <p>Deletes a user account from Amazon Connect.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteUserRequest
 */
- (void)deleteUser:(AWSConnectDeleteUserRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Returns a <code>User</code> object that contains information about the user account specified by the <code>UserId</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeUserRequest
 @see AWSConnectDescribeUserResponse
 */
- (AWSTask<AWSConnectDescribeUserResponse *> *)describeUser:(AWSConnectDescribeUserRequest *)request;

/**
 <p>Returns a <code>User</code> object that contains information about the user account specified by the <code>UserId</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeUserRequest
 @see AWSConnectDescribeUserResponse
 */
- (void)describeUser:(AWSConnectDescribeUserRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a <code>HierarchyGroup</code> object that includes information about a hierarchy group in your instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserHierarchyGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeUserHierarchyGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeUserHierarchyGroupRequest
 @see AWSConnectDescribeUserHierarchyGroupResponse
 */
- (AWSTask<AWSConnectDescribeUserHierarchyGroupResponse *> *)describeUserHierarchyGroup:(AWSConnectDescribeUserHierarchyGroupRequest *)request;

/**
 <p>Returns a <code>HierarchyGroup</code> object that includes information about a hierarchy group in your instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserHierarchyGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeUserHierarchyGroupRequest
 @see AWSConnectDescribeUserHierarchyGroupResponse
 */
- (void)describeUserHierarchyGroup:(AWSConnectDescribeUserHierarchyGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeUserHierarchyGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a <code>HiearchyGroupStructure</code> object, which contains data about the levels in the agent hierarchy.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserHierarchyStructure service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectDescribeUserHierarchyStructureResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeUserHierarchyStructureRequest
 @see AWSConnectDescribeUserHierarchyStructureResponse
 */
- (AWSTask<AWSConnectDescribeUserHierarchyStructureResponse *> *)describeUserHierarchyStructure:(AWSConnectDescribeUserHierarchyStructureRequest *)request;

/**
 <p>Returns a <code>HiearchyGroupStructure</code> object, which contains data about the levels in the agent hierarchy.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserHierarchyStructure service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDescribeUserHierarchyStructureRequest
 @see AWSConnectDescribeUserHierarchyStructureResponse
 */
- (void)describeUserHierarchyStructure:(AWSConnectDescribeUserHierarchyStructureRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectDescribeUserHierarchyStructureResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the contact attributes associated with a contact.</p>
 
 @param request A container for the necessary parameters to execute the GetContactAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectGetContactAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectGetContactAttributesRequest
 @see AWSConnectGetContactAttributesResponse
 */
- (AWSTask<AWSConnectGetContactAttributesResponse *> *)getContactAttributes:(AWSConnectGetContactAttributesRequest *)request;

/**
 <p>Retrieves the contact attributes associated with a contact.</p>
 
 @param request A container for the necessary parameters to execute the GetContactAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectGetContactAttributesRequest
 @see AWSConnectGetContactAttributesResponse
 */
- (void)getContactAttributes:(AWSConnectGetContactAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectGetContactAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>The <code>GetCurrentMetricData</code> operation retrieves current metric data from your Amazon Connect instance.</p><p>If you are using an IAM account, it must have permission to the <code>connect:GetCurrentMetricData</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetCurrentMetricData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectGetCurrentMetricDataResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`.
 
 @see AWSConnectGetCurrentMetricDataRequest
 @see AWSConnectGetCurrentMetricDataResponse
 */
- (AWSTask<AWSConnectGetCurrentMetricDataResponse *> *)getCurrentMetricData:(AWSConnectGetCurrentMetricDataRequest *)request;

/**
 <p>The <code>GetCurrentMetricData</code> operation retrieves current metric data from your Amazon Connect instance.</p><p>If you are using an IAM account, it must have permission to the <code>connect:GetCurrentMetricData</code> action.</p>
 
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
 <p>The <code>GetMetricData</code> operation retrieves historical metrics data from your Amazon Connect instance.</p><p>If you are using an IAM account, it must have permission to the <code>connect:GetMetricData</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetMetricData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectGetMetricDataResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`.
 
 @see AWSConnectGetMetricDataRequest
 @see AWSConnectGetMetricDataResponse
 */
- (AWSTask<AWSConnectGetMetricDataResponse *> *)getMetricData:(AWSConnectGetMetricDataRequest *)request;

/**
 <p>The <code>GetMetricData</code> operation retrieves historical metrics data from your Amazon Connect instance.</p><p>If you are using an IAM account, it must have permission to the <code>connect:GetMetricData</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetMetricData service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`.
 
 @see AWSConnectGetMetricDataRequest
 @see AWSConnectGetMetricDataResponse
 */
- (void)getMetricData:(AWSConnectGetMetricDataRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectGetMetricDataResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an array of <code>RoutingProfileSummary</code> objects that includes information about the routing profiles in your instance.</p>
 
 @param request A container for the necessary parameters to execute the ListRoutingProfiles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListRoutingProfilesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListRoutingProfilesRequest
 @see AWSConnectListRoutingProfilesResponse
 */
- (AWSTask<AWSConnectListRoutingProfilesResponse *> *)listRoutingProfiles:(AWSConnectListRoutingProfilesRequest *)request;

/**
 <p>Returns an array of <code>RoutingProfileSummary</code> objects that includes information about the routing profiles in your instance.</p>
 
 @param request A container for the necessary parameters to execute the ListRoutingProfiles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListRoutingProfilesRequest
 @see AWSConnectListRoutingProfilesResponse
 */
- (void)listRoutingProfiles:(AWSConnectListRoutingProfilesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListRoutingProfilesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an array of SecurityProfileSummary objects that contain information about the security profiles in your instance, including the ARN, Id, and Name of the security profile.</p>
 
 @param request A container for the necessary parameters to execute the ListSecurityProfiles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListSecurityProfilesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListSecurityProfilesRequest
 @see AWSConnectListSecurityProfilesResponse
 */
- (AWSTask<AWSConnectListSecurityProfilesResponse *> *)listSecurityProfiles:(AWSConnectListSecurityProfilesRequest *)request;

/**
 <p>Returns an array of SecurityProfileSummary objects that contain information about the security profiles in your instance, including the ARN, Id, and Name of the security profile.</p>
 
 @param request A container for the necessary parameters to execute the ListSecurityProfiles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListSecurityProfilesRequest
 @see AWSConnectListSecurityProfilesResponse
 */
- (void)listSecurityProfiles:(AWSConnectListSecurityProfilesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListSecurityProfilesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a <code>UserHierarchyGroupSummaryList</code>, which is an array of <code>HierarchyGroupSummary</code> objects that contain information about the hierarchy groups in your instance.</p>
 
 @param request A container for the necessary parameters to execute the ListUserHierarchyGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListUserHierarchyGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListUserHierarchyGroupsRequest
 @see AWSConnectListUserHierarchyGroupsResponse
 */
- (AWSTask<AWSConnectListUserHierarchyGroupsResponse *> *)listUserHierarchyGroups:(AWSConnectListUserHierarchyGroupsRequest *)request;

/**
 <p>Returns a <code>UserHierarchyGroupSummaryList</code>, which is an array of <code>HierarchyGroupSummary</code> objects that contain information about the hierarchy groups in your instance.</p>
 
 @param request A container for the necessary parameters to execute the ListUserHierarchyGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListUserHierarchyGroupsRequest
 @see AWSConnectListUserHierarchyGroupsResponse
 */
- (void)listUserHierarchyGroups:(AWSConnectListUserHierarchyGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListUserHierarchyGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a <code>UserSummaryList</code>, which is an array of <code>UserSummary</code> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListUsers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListUsersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListUsersRequest
 @see AWSConnectListUsersResponse
 */
- (AWSTask<AWSConnectListUsersResponse *> *)listUsers:(AWSConnectListUsersRequest *)request;

/**
 <p>Returns a <code>UserSummaryList</code>, which is an array of <code>UserSummary</code> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListUsers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListUsersRequest
 @see AWSConnectListUsersResponse
 */
- (void)listUsers:(AWSConnectListUsersRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListUsersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>The <code>StartOutboundVoiceContact</code> operation initiates a contact flow to place an outbound call to a customer.</p><p>If you are using an IAM account, it must have permission to the <code>connect:StartOutboundVoiceContact</code> action.</p><p>There is a 60 second dialing timeout for this operation. If the call is not connected after 60 seconds, the call fails.</p>
 
 @param request A container for the necessary parameters to execute the StartOutboundVoiceContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectStartOutboundVoiceContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorDestinationNotAllowed`, `AWSConnectErrorOutboundContactNotPermitted`.
 
 @see AWSConnectStartOutboundVoiceContactRequest
 @see AWSConnectStartOutboundVoiceContactResponse
 */
- (AWSTask<AWSConnectStartOutboundVoiceContactResponse *> *)startOutboundVoiceContact:(AWSConnectStartOutboundVoiceContactRequest *)request;

/**
 <p>The <code>StartOutboundVoiceContact</code> operation initiates a contact flow to place an outbound call to a customer.</p><p>If you are using an IAM account, it must have permission to the <code>connect:StartOutboundVoiceContact</code> action.</p><p>There is a 60 second dialing timeout for this operation. If the call is not connected after 60 seconds, the call fails.</p>
 
 @param request A container for the necessary parameters to execute the StartOutboundVoiceContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorDestinationNotAllowed`, `AWSConnectErrorOutboundContactNotPermitted`.
 
 @see AWSConnectStartOutboundVoiceContactRequest
 @see AWSConnectStartOutboundVoiceContactResponse
 */
- (void)startOutboundVoiceContact:(AWSConnectStartOutboundVoiceContactRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectStartOutboundVoiceContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Ends the contact initiated by the <code>StartOutboundVoiceContact</code> operation.</p><p>If you are using an IAM account, it must have permission to the <code>connect:StopContact</code> action.</p>
 
 @param request A container for the necessary parameters to execute the StopContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectStopContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorContactNotFound`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectStopContactRequest
 @see AWSConnectStopContactResponse
 */
- (AWSTask<AWSConnectStopContactResponse *> *)stopContact:(AWSConnectStopContactRequest *)request;

/**
 <p>Ends the contact initiated by the <code>StartOutboundVoiceContact</code> operation.</p><p>If you are using an IAM account, it must have permission to the <code>connect:StopContact</code> action.</p>
 
 @param request A container for the necessary parameters to execute the StopContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorContactNotFound`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectStopContactRequest
 @see AWSConnectStopContactResponse
 */
- (void)stopContact:(AWSConnectStopContactRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectStopContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>The <code>UpdateContactAttributes</code> operation lets you programmatically create new, or update existing, contact attributes associated with a contact. You can use the operation to add or update attributes for both ongoing and completed contacts. For example, you can update the customer's name or the reason the customer called while the call is active, or add notes about steps that the agent took during the call that are displayed to the next agent that takes the call. You can also use the <code>UpdateContactAttributes</code> operation to update attributes for a contact using data from your CRM application and save the data with the contact in Amazon Connect. You could also flag calls for additional analysis, such as legal review or identifying abusive callers.</p><p>Contact attributes are available in Amazon Connect for 24 months, and are then deleted.</p><p><i>Important:</i></p><p>You cannot use the operation to update attributes for contacts that occurred prior to the release of the API, September 12, 2018. You can update attributes only for contacts that started after the release of the API. If you attempt to update attributes for a contact that occurred prior to the release of the API, a 400 error is returned. This applies also to queued callbacks that were initiated prior to the release of the API but are still active in your instance.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectUpdateContactAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactAttributesRequest
 @see AWSConnectUpdateContactAttributesResponse
 */
- (AWSTask<AWSConnectUpdateContactAttributesResponse *> *)updateContactAttributes:(AWSConnectUpdateContactAttributesRequest *)request;

/**
 <p>The <code>UpdateContactAttributes</code> operation lets you programmatically create new, or update existing, contact attributes associated with a contact. You can use the operation to add or update attributes for both ongoing and completed contacts. For example, you can update the customer's name or the reason the customer called while the call is active, or add notes about steps that the agent took during the call that are displayed to the next agent that takes the call. You can also use the <code>UpdateContactAttributes</code> operation to update attributes for a contact using data from your CRM application and save the data with the contact in Amazon Connect. You could also flag calls for additional analysis, such as legal review or identifying abusive callers.</p><p>Contact attributes are available in Amazon Connect for 24 months, and are then deleted.</p><p><i>Important:</i></p><p>You cannot use the operation to update attributes for contacts that occurred prior to the release of the API, September 12, 2018. You can update attributes only for contacts that started after the release of the API. If you attempt to update attributes for a contact that occurred prior to the release of the API, a 400 error is returned. This applies also to queued callbacks that were initiated prior to the release of the API but are still active in your instance.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContactAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateContactAttributesRequest
 @see AWSConnectUpdateContactAttributesResponse
 */
- (void)updateContactAttributes:(AWSConnectUpdateContactAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectUpdateContactAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Assigns the specified hierarchy group to the user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserHierarchy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserHierarchyRequest
 */
- (AWSTask *)updateUserHierarchy:(AWSConnectUpdateUserHierarchyRequest *)request;

/**
 <p>Assigns the specified hierarchy group to the user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserHierarchy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserHierarchyRequest
 */
- (void)updateUserHierarchy:(AWSConnectUpdateUserHierarchyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the identity information for the specified user in a <code>UserIdentityInfo</code> object, including email, first name, and last name.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserIdentityInfo service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserIdentityInfoRequest
 */
- (AWSTask *)updateUserIdentityInfo:(AWSConnectUpdateUserIdentityInfoRequest *)request;

/**
 <p>Updates the identity information for the specified user in a <code>UserIdentityInfo</code> object, including email, first name, and last name.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserIdentityInfo service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserIdentityInfoRequest
 */
- (void)updateUserIdentityInfo:(AWSConnectUpdateUserIdentityInfoRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the phone configuration settings in the <code>UserPhoneConfig</code> object for the specified user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserPhoneConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserPhoneConfigRequest
 */
- (AWSTask *)updateUserPhoneConfig:(AWSConnectUpdateUserPhoneConfigRequest *)request;

/**
 <p>Updates the phone configuration settings in the <code>UserPhoneConfig</code> object for the specified user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserPhoneConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserPhoneConfigRequest
 */
- (void)updateUserPhoneConfig:(AWSConnectUpdateUserPhoneConfigRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Assigns the specified routing profile to a user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserRoutingProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserRoutingProfileRequest
 */
- (AWSTask *)updateUserRoutingProfile:(AWSConnectUpdateUserRoutingProfileRequest *)request;

/**
 <p>Assigns the specified routing profile to a user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserRoutingProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserRoutingProfileRequest
 */
- (void)updateUserRoutingProfile:(AWSConnectUpdateUserRoutingProfileRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the security profiles assigned to the user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserSecurityProfiles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserSecurityProfilesRequest
 */
- (AWSTask *)updateUserSecurityProfiles:(AWSConnectUpdateUserSecurityProfilesRequest *)request;

/**
 <p>Updates the security profiles assigned to the user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserSecurityProfiles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserSecurityProfilesRequest
 */
- (void)updateUserSecurityProfiles:(AWSConnectUpdateUserSecurityProfilesRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
