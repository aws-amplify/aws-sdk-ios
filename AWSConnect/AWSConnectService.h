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
 <p>Amazon Connect is a cloud-based contact center solution that makes it easy to set up and manage a customer contact center and provide reliable customer engagement at any scale.</p><p>Amazon Connect provides rich metrics and real-time reporting that allow you to optimize contact routing. You can also resolve customer issues more efficiently by putting customers in touch with the right agents.</p><p>There are limits to the number of Amazon Connect resources that you can create and limits to the number of requests that you can make per second. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">Amazon Connect Service Limits</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
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
 <p>Creates a user account for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the CreateUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectCreateUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateUserRequest
 @see AWSConnectCreateUserResponse
 */
- (AWSTask<AWSConnectCreateUserResponse *> *)createUser:(AWSConnectCreateUserRequest *)request;

/**
 <p>Creates a user account for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the CreateUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorDuplicateResource`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectCreateUserRequest
 @see AWSConnectCreateUserResponse
 */
- (void)createUser:(AWSConnectCreateUserRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectCreateUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a user account from the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteUserRequest
 */
- (AWSTask *)deleteUser:(AWSConnectDeleteUserRequest *)request;

/**
 <p>Deletes a user account from the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectDeleteUserRequest
 */
- (void)deleteUser:(AWSConnectDeleteUserRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

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
 <p>Gets the real-time metric data from the specified Amazon Connect instance.</p><p>For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-reports.html">Real-time Metrics Reports</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetCurrentMetricData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectGetCurrentMetricDataResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`.
 
 @see AWSConnectGetCurrentMetricDataRequest
 @see AWSConnectGetCurrentMetricDataResponse
 */
- (AWSTask<AWSConnectGetCurrentMetricDataResponse *> *)getCurrentMetricData:(AWSConnectGetCurrentMetricDataRequest *)request;

/**
 <p>Gets the real-time metric data from the specified Amazon Connect instance.</p><p>For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-reports.html">Real-time Metrics Reports</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
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
 <p>Gets historical metric data from the specified Amazon Connect instance.</p><p>For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics.html">Historical Metrics Reports</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetMetricData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectGetMetricDataResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`.
 
 @see AWSConnectGetMetricDataRequest
 @see AWSConnectGetMetricDataResponse
 */
- (AWSTask<AWSConnectGetMetricDataResponse *> *)getMetricData:(AWSConnectGetMetricDataRequest *)request;

/**
 <p>Gets historical metric data from the specified Amazon Connect instance.</p><p>For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics.html">Historical Metrics Reports</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetMetricData service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorThrottling`, `AWSConnectErrorResourceNotFound`.
 
 @see AWSConnectGetMetricDataRequest
 @see AWSConnectGetMetricDataResponse
 */
- (void)getMetricData:(AWSConnectGetMetricDataRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectGetMetricDataResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about the contact flows for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListContactFlows service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListContactFlowsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListContactFlowsRequest
 @see AWSConnectListContactFlowsResponse
 */
- (AWSTask<AWSConnectListContactFlowsResponse *> *)listContactFlows:(AWSConnectListContactFlowsRequest *)request;

/**
 <p>Provides information about the contact flows for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListContactFlows service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListContactFlowsRequest
 @see AWSConnectListContactFlowsResponse
 */
- (void)listContactFlows:(AWSConnectListContactFlowsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListContactFlowsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about the hours of operation for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListHoursOfOperations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListHoursOfOperationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListHoursOfOperationsRequest
 @see AWSConnectListHoursOfOperationsResponse
 */
- (AWSTask<AWSConnectListHoursOfOperationsResponse *> *)listHoursOfOperations:(AWSConnectListHoursOfOperationsRequest *)request;

/**
 <p>Provides information about the hours of operation for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListHoursOfOperations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListHoursOfOperationsRequest
 @see AWSConnectListHoursOfOperationsResponse
 */
- (void)listHoursOfOperations:(AWSConnectListHoursOfOperationsRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListHoursOfOperationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about the phone numbers for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListPhoneNumbers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListPhoneNumbersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListPhoneNumbersRequest
 @see AWSConnectListPhoneNumbersResponse
 */
- (AWSTask<AWSConnectListPhoneNumbersResponse *> *)listPhoneNumbers:(AWSConnectListPhoneNumbersRequest *)request;

/**
 <p>Provides information about the phone numbers for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListPhoneNumbers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListPhoneNumbersRequest
 @see AWSConnectListPhoneNumbersResponse
 */
- (void)listPhoneNumbers:(AWSConnectListPhoneNumbersRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListPhoneNumbersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about the queues for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListQueues service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListQueuesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListQueuesRequest
 @see AWSConnectListQueuesResponse
 */
- (AWSTask<AWSConnectListQueuesResponse *> *)listQueues:(AWSConnectListQueuesRequest *)request;

/**
 <p>Provides information about the queues for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListQueues service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListQueuesRequest
 @see AWSConnectListQueuesResponse
 */
- (void)listQueues:(AWSConnectListQueuesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListQueuesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides summary information about the routing profiles for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListRoutingProfiles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListRoutingProfilesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListRoutingProfilesRequest
 @see AWSConnectListRoutingProfilesResponse
 */
- (AWSTask<AWSConnectListRoutingProfilesResponse *> *)listRoutingProfiles:(AWSConnectListRoutingProfilesRequest *)request;

/**
 <p>Provides summary information about the routing profiles for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListRoutingProfiles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListRoutingProfilesRequest
 @see AWSConnectListRoutingProfilesResponse
 */
- (void)listRoutingProfiles:(AWSConnectListRoutingProfilesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListRoutingProfilesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides summary information about the security profiles for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListSecurityProfiles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListSecurityProfilesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListSecurityProfilesRequest
 @see AWSConnectListSecurityProfilesResponse
 */
- (AWSTask<AWSConnectListSecurityProfilesResponse *> *)listSecurityProfiles:(AWSConnectListSecurityProfilesRequest *)request;

/**
 <p>Provides summary information about the security profiles for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListSecurityProfiles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListSecurityProfilesRequest
 @see AWSConnectListSecurityProfilesResponse
 */
- (void)listSecurityProfiles:(AWSConnectListSecurityProfilesRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListSecurityProfilesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tags for the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListTagsForResourceRequest
 @see AWSConnectListTagsForResourceResponse
 */
- (AWSTask<AWSConnectListTagsForResourceResponse *> *)listTagsForResource:(AWSConnectListTagsForResourceRequest *)request;

/**
 <p>Lists the tags for the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectListTagsForResourceRequest
 @see AWSConnectListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSConnectListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides summary information about the hierarchy groups for the specified Amazon Connect instance.</p>
 
 @param request A container for the necessary parameters to execute the ListUserHierarchyGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectListUserHierarchyGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectListUserHierarchyGroupsRequest
 @see AWSConnectListUserHierarchyGroupsResponse
 */
- (AWSTask<AWSConnectListUserHierarchyGroupsResponse *> *)listUserHierarchyGroups:(AWSConnectListUserHierarchyGroupsRequest *)request;

/**
 <p>Provides summary information about the hierarchy groups for the specified Amazon Connect instance.</p>
 
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
 <p>Initiates a contact flow to start a new chat for the customer. Response of this API provides a token required to obtain credentials from the <a href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a> API in the Amazon Connect Participant Service.</p><p>When a new chat contact is successfully created, clients need to subscribe to the participant’s connection for the created chat within 5 minutes. This is achieved by invoking <a href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a> with WEBSOCKET and CONNECTION_CREDENTIALS. </p>
 
 @param request A container for the necessary parameters to execute the StartChatContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectStartChatContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorLimitExceeded`.
 
 @see AWSConnectStartChatContactRequest
 @see AWSConnectStartChatContactResponse
 */
- (AWSTask<AWSConnectStartChatContactResponse *> *)startChatContact:(AWSConnectStartChatContactRequest *)request;

/**
 <p>Initiates a contact flow to start a new chat for the customer. Response of this API provides a token required to obtain credentials from the <a href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a> API in the Amazon Connect Participant Service.</p><p>When a new chat contact is successfully created, clients need to subscribe to the participant’s connection for the created chat within 5 minutes. This is achieved by invoking <a href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a> with WEBSOCKET and CONNECTION_CREDENTIALS. </p>
 
 @param request A container for the necessary parameters to execute the StartChatContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorLimitExceeded`.
 
 @see AWSConnectStartChatContactRequest
 @see AWSConnectStartChatContactResponse
 */
- (void)startChatContact:(AWSConnectStartChatContactRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectStartChatContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates a contact flow to place an outbound call to a customer.</p><p>There is a 60 second dialing timeout for this operation. If the call is not connected after 60 seconds, it fails.</p>
 
 @param request A container for the necessary parameters to execute the StartOutboundVoiceContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectStartOutboundVoiceContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorInternalService`, `AWSConnectErrorLimitExceeded`, `AWSConnectErrorDestinationNotAllowed`, `AWSConnectErrorOutboundContactNotPermitted`.
 
 @see AWSConnectStartOutboundVoiceContactRequest
 @see AWSConnectStartOutboundVoiceContactResponse
 */
- (AWSTask<AWSConnectStartOutboundVoiceContactResponse *> *)startOutboundVoiceContact:(AWSConnectStartOutboundVoiceContactRequest *)request;

/**
 <p>Initiates a contact flow to place an outbound call to a customer.</p><p>There is a 60 second dialing timeout for this operation. If the call is not connected after 60 seconds, it fails.</p>
 
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
 <p>Adds the specified tags to the specified resource.</p><p>The supported resource type is users.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorInternalService`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`.
 
 @see AWSConnectTagResourceRequest
 */
- (AWSTask *)tagResource:(AWSConnectTagResourceRequest *)request;

/**
 <p>Adds the specified tags to the specified resource.</p><p>The supported resource type is users.</p>
 
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
 <p>Updates the identity information for the specified user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserIdentityInfo service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectErrorDomain` domain and the following error code: `AWSConnectErrorInvalidRequest`, `AWSConnectErrorInvalidParameter`, `AWSConnectErrorResourceNotFound`, `AWSConnectErrorThrottling`, `AWSConnectErrorInternalService`.
 
 @see AWSConnectUpdateUserIdentityInfoRequest
 */
- (AWSTask *)updateUserIdentityInfo:(AWSConnectUpdateUserIdentityInfoRequest *)request;

/**
 <p>Updates the identity information for the specified user.</p>
 
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
