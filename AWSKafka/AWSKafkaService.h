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
#import "AWSKafkaModel.h"
#import "AWSKafkaResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSKafka
FOUNDATION_EXPORT NSString *const AWSKafkaSDKVersion;

/**
 <p>The operations for managing an Amazon MSK cluster.</p> 
 */
@interface AWSKafka : AWSService

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

     let Kafka = AWSKafka.default()

 *Objective-C*

     AWSKafka *Kafka = [AWSKafka defaultKafka];

 @return The default service client.
 */
+ (instancetype)defaultKafka;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSKafka.register(with: configuration!, forKey: "USWest2Kafka")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSKafka registerKafkaWithConfiguration:configuration forKey:@"USWest2Kafka"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Kafka = AWSKafka(forKey: "USWest2Kafka")

 *Objective-C*

     AWSKafka *Kafka = [AWSKafka KafkaForKey:@"USWest2Kafka"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerKafkaWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerKafkaWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSKafka.register(with: configuration!, forKey: "USWest2Kafka")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSKafka registerKafkaWithConfiguration:configuration forKey:@"USWest2Kafka"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Kafka = AWSKafka(forKey: "USWest2Kafka")

 *Objective-C*

     AWSKafka *Kafka = [AWSKafka KafkaForKey:@"USWest2Kafka"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)KafkaForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeKafkaForKey:(NSString *)key;

/**
  <p>Creates a new MSK cluster.</p>
 
 @param request A container for the necessary parameters to execute the CreateCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKafkaCreateClusterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorBadRequest`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorForbidden`, `AWSKafkaErrorServiceUnavailable`, `AWSKafkaErrorTooManyRequests`, `AWSKafkaErrorConflict`.
 
 @see AWSKafkaCreateClusterRequest
 @see AWSKafkaCreateClusterResponse
 */
- (AWSTask<AWSKafkaCreateClusterResponse *> *)createCluster:(AWSKafkaCreateClusterRequest *)request;

/**
  <p>Creates a new MSK cluster.</p>
 
 @param request A container for the necessary parameters to execute the CreateCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorBadRequest`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorForbidden`, `AWSKafkaErrorServiceUnavailable`, `AWSKafkaErrorTooManyRequests`, `AWSKafkaErrorConflict`.
 
 @see AWSKafkaCreateClusterRequest
 @see AWSKafkaCreateClusterResponse
 */
- (void)createCluster:(AWSKafkaCreateClusterRequest *)request completionHandler:(void (^ _Nullable)(AWSKafkaCreateClusterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
  <p>Creates a new MSK configuration.</p>
 
 @param request A container for the necessary parameters to execute the CreateConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKafkaCreateConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorBadRequest`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorForbidden`, `AWSKafkaErrorServiceUnavailable`, `AWSKafkaErrorTooManyRequests`, `AWSKafkaErrorConflict`.
 
 @see AWSKafkaCreateConfigurationRequest
 @see AWSKafkaCreateConfigurationResponse
 */
- (AWSTask<AWSKafkaCreateConfigurationResponse *> *)createConfiguration:(AWSKafkaCreateConfigurationRequest *)request;

/**
  <p>Creates a new MSK configuration.</p>
 
 @param request A container for the necessary parameters to execute the CreateConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorBadRequest`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorForbidden`, `AWSKafkaErrorServiceUnavailable`, `AWSKafkaErrorTooManyRequests`, `AWSKafkaErrorConflict`.
 
 @see AWSKafkaCreateConfigurationRequest
 @see AWSKafkaCreateConfigurationResponse
 */
- (void)createConfiguration:(AWSKafkaCreateConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSKafkaCreateConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
  <p>Deletes the MSK cluster specified by the Amazon Resource Name (ARN) in the request.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKafkaDeleteClusterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorNotFound`, `AWSKafkaErrorBadRequest`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`.
 
 @see AWSKafkaDeleteClusterRequest
 @see AWSKafkaDeleteClusterResponse
 */
- (AWSTask<AWSKafkaDeleteClusterResponse *> *)deleteCluster:(AWSKafkaDeleteClusterRequest *)request;

/**
  <p>Deletes the MSK cluster specified by the Amazon Resource Name (ARN) in the request.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorNotFound`, `AWSKafkaErrorBadRequest`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`.
 
 @see AWSKafkaDeleteClusterRequest
 @see AWSKafkaDeleteClusterResponse
 */
- (void)deleteCluster:(AWSKafkaDeleteClusterRequest *)request completionHandler:(void (^ _Nullable)(AWSKafkaDeleteClusterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
  <p>Returns a description of the MSK cluster whose Amazon Resource Name (ARN) is specified in the request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKafkaDescribeClusterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorNotFound`, `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`.
 
 @see AWSKafkaDescribeClusterRequest
 @see AWSKafkaDescribeClusterResponse
 */
- (AWSTask<AWSKafkaDescribeClusterResponse *> *)describeCluster:(AWSKafkaDescribeClusterRequest *)request;

/**
  <p>Returns a description of the MSK cluster whose Amazon Resource Name (ARN) is specified in the request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorNotFound`, `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`.
 
 @see AWSKafkaDescribeClusterRequest
 @see AWSKafkaDescribeClusterResponse
 */
- (void)describeCluster:(AWSKafkaDescribeClusterRequest *)request completionHandler:(void (^ _Nullable)(AWSKafkaDescribeClusterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
  <p>Returns a description of the cluster operation specified by the ARN.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClusterOperation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKafkaDescribeClusterOperationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorNotFound`, `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`.
 
 @see AWSKafkaDescribeClusterOperationRequest
 @see AWSKafkaDescribeClusterOperationResponse
 */
- (AWSTask<AWSKafkaDescribeClusterOperationResponse *> *)describeClusterOperation:(AWSKafkaDescribeClusterOperationRequest *)request;

/**
  <p>Returns a description of the cluster operation specified by the ARN.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClusterOperation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorNotFound`, `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`.
 
 @see AWSKafkaDescribeClusterOperationRequest
 @see AWSKafkaDescribeClusterOperationResponse
 */
- (void)describeClusterOperation:(AWSKafkaDescribeClusterOperationRequest *)request completionHandler:(void (^ _Nullable)(AWSKafkaDescribeClusterOperationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
  <p>Returns a description of this MSK configuration.</p>
 
 @param request A container for the necessary parameters to execute the DescribeConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKafkaDescribeConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`, `AWSKafkaErrorNotFound`, `AWSKafkaErrorServiceUnavailable`.
 
 @see AWSKafkaDescribeConfigurationRequest
 @see AWSKafkaDescribeConfigurationResponse
 */
- (AWSTask<AWSKafkaDescribeConfigurationResponse *> *)describeConfiguration:(AWSKafkaDescribeConfigurationRequest *)request;

/**
  <p>Returns a description of this MSK configuration.</p>
 
 @param request A container for the necessary parameters to execute the DescribeConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`, `AWSKafkaErrorNotFound`, `AWSKafkaErrorServiceUnavailable`.
 
 @see AWSKafkaDescribeConfigurationRequest
 @see AWSKafkaDescribeConfigurationResponse
 */
- (void)describeConfiguration:(AWSKafkaDescribeConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSKafkaDescribeConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
  <p>Returns a description of this revision of the configuration.</p>
 
 @param request A container for the necessary parameters to execute the DescribeConfigurationRevision service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKafkaDescribeConfigurationRevisionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`, `AWSKafkaErrorNotFound`, `AWSKafkaErrorServiceUnavailable`.
 
 @see AWSKafkaDescribeConfigurationRevisionRequest
 @see AWSKafkaDescribeConfigurationRevisionResponse
 */
- (AWSTask<AWSKafkaDescribeConfigurationRevisionResponse *> *)describeConfigurationRevision:(AWSKafkaDescribeConfigurationRevisionRequest *)request;

/**
  <p>Returns a description of this revision of the configuration.</p>
 
 @param request A container for the necessary parameters to execute the DescribeConfigurationRevision service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`, `AWSKafkaErrorNotFound`, `AWSKafkaErrorServiceUnavailable`.
 
 @see AWSKafkaDescribeConfigurationRevisionRequest
 @see AWSKafkaDescribeConfigurationRevisionResponse
 */
- (void)describeConfigurationRevision:(AWSKafkaDescribeConfigurationRevisionRequest *)request completionHandler:(void (^ _Nullable)(AWSKafkaDescribeConfigurationRevisionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
  <p>A list of brokers that a client application can use to bootstrap.</p>
 
 @param request A container for the necessary parameters to execute the GetBootstrapBrokers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKafkaGetBootstrapBrokersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorConflict`, `AWSKafkaErrorForbidden`.
 
 @see AWSKafkaGetBootstrapBrokersRequest
 @see AWSKafkaGetBootstrapBrokersResponse
 */
- (AWSTask<AWSKafkaGetBootstrapBrokersResponse *> *)getBootstrapBrokers:(AWSKafkaGetBootstrapBrokersRequest *)request;

/**
  <p>A list of brokers that a client application can use to bootstrap.</p>
 
 @param request A container for the necessary parameters to execute the GetBootstrapBrokers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorConflict`, `AWSKafkaErrorForbidden`.
 
 @see AWSKafkaGetBootstrapBrokersRequest
 @see AWSKafkaGetBootstrapBrokersResponse
 */
- (void)getBootstrapBrokers:(AWSKafkaGetBootstrapBrokersRequest *)request completionHandler:(void (^ _Nullable)(AWSKafkaGetBootstrapBrokersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
  <p>Gets the Apache Kafka versions to which you can update the MSK cluster.</p>
 
 @param request A container for the necessary parameters to execute the GetCompatibleKafkaVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKafkaGetCompatibleKafkaVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`, `AWSKafkaErrorNotFound`, `AWSKafkaErrorServiceUnavailable`, `AWSKafkaErrorTooManyRequests`.
 
 @see AWSKafkaGetCompatibleKafkaVersionsRequest
 @see AWSKafkaGetCompatibleKafkaVersionsResponse
 */
- (AWSTask<AWSKafkaGetCompatibleKafkaVersionsResponse *> *)getCompatibleKafkaVersions:(AWSKafkaGetCompatibleKafkaVersionsRequest *)request;

/**
  <p>Gets the Apache Kafka versions to which you can update the MSK cluster.</p>
 
 @param request A container for the necessary parameters to execute the GetCompatibleKafkaVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`, `AWSKafkaErrorNotFound`, `AWSKafkaErrorServiceUnavailable`, `AWSKafkaErrorTooManyRequests`.
 
 @see AWSKafkaGetCompatibleKafkaVersionsRequest
 @see AWSKafkaGetCompatibleKafkaVersionsResponse
 */
- (void)getCompatibleKafkaVersions:(AWSKafkaGetCompatibleKafkaVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSKafkaGetCompatibleKafkaVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
  <p>Returns a list of all the operations that have been performed on the specified MSK cluster.</p>
 
 @param request A container for the necessary parameters to execute the ListClusterOperations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKafkaListClusterOperationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorBadRequest`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorForbidden`.
 
 @see AWSKafkaListClusterOperationsRequest
 @see AWSKafkaListClusterOperationsResponse
 */
- (AWSTask<AWSKafkaListClusterOperationsResponse *> *)listClusterOperations:(AWSKafkaListClusterOperationsRequest *)request;

/**
  <p>Returns a list of all the operations that have been performed on the specified MSK cluster.</p>
 
 @param request A container for the necessary parameters to execute the ListClusterOperations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorBadRequest`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorForbidden`.
 
 @see AWSKafkaListClusterOperationsRequest
 @see AWSKafkaListClusterOperationsResponse
 */
- (void)listClusterOperations:(AWSKafkaListClusterOperationsRequest *)request completionHandler:(void (^ _Nullable)(AWSKafkaListClusterOperationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
  <p>Returns a list of all the MSK clusters in the current Region.</p>
 
 @param request A container for the necessary parameters to execute the ListClusters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKafkaListClustersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorBadRequest`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorForbidden`.
 
 @see AWSKafkaListClustersRequest
 @see AWSKafkaListClustersResponse
 */
- (AWSTask<AWSKafkaListClustersResponse *> *)listClusters:(AWSKafkaListClustersRequest *)request;

/**
  <p>Returns a list of all the MSK clusters in the current Region.</p>
 
 @param request A container for the necessary parameters to execute the ListClusters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorBadRequest`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorForbidden`.
 
 @see AWSKafkaListClustersRequest
 @see AWSKafkaListClustersResponse
 */
- (void)listClusters:(AWSKafkaListClustersRequest *)request completionHandler:(void (^ _Nullable)(AWSKafkaListClustersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
  <p>Returns a list of all the MSK configurations in this Region.</p>
 
 @param request A container for the necessary parameters to execute the ListConfigurationRevisions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKafkaListConfigurationRevisionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`, `AWSKafkaErrorNotFound`, `AWSKafkaErrorServiceUnavailable`.
 
 @see AWSKafkaListConfigurationRevisionsRequest
 @see AWSKafkaListConfigurationRevisionsResponse
 */
- (AWSTask<AWSKafkaListConfigurationRevisionsResponse *> *)listConfigurationRevisions:(AWSKafkaListConfigurationRevisionsRequest *)request;

/**
  <p>Returns a list of all the MSK configurations in this Region.</p>
 
 @param request A container for the necessary parameters to execute the ListConfigurationRevisions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`, `AWSKafkaErrorNotFound`, `AWSKafkaErrorServiceUnavailable`.
 
 @see AWSKafkaListConfigurationRevisionsRequest
 @see AWSKafkaListConfigurationRevisionsResponse
 */
- (void)listConfigurationRevisions:(AWSKafkaListConfigurationRevisionsRequest *)request completionHandler:(void (^ _Nullable)(AWSKafkaListConfigurationRevisionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
  <p>Returns a list of all the MSK configurations in this Region.</p>
 
 @param request A container for the necessary parameters to execute the ListConfigurations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKafkaListConfigurationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorServiceUnavailable`, `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`.
 
 @see AWSKafkaListConfigurationsRequest
 @see AWSKafkaListConfigurationsResponse
 */
- (AWSTask<AWSKafkaListConfigurationsResponse *> *)listConfigurations:(AWSKafkaListConfigurationsRequest *)request;

/**
  <p>Returns a list of all the MSK configurations in this Region.</p>
 
 @param request A container for the necessary parameters to execute the ListConfigurations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorServiceUnavailable`, `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`.
 
 @see AWSKafkaListConfigurationsRequest
 @see AWSKafkaListConfigurationsResponse
 */
- (void)listConfigurations:(AWSKafkaListConfigurationsRequest *)request completionHandler:(void (^ _Nullable)(AWSKafkaListConfigurationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
  <p>Returns a list of Kafka versions.</p>
 
 @param request A container for the necessary parameters to execute the ListKafkaVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKafkaListKafkaVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`.
 
 @see AWSKafkaListKafkaVersionsRequest
 @see AWSKafkaListKafkaVersionsResponse
 */
- (AWSTask<AWSKafkaListKafkaVersionsResponse *> *)listKafkaVersions:(AWSKafkaListKafkaVersionsRequest *)request;

/**
  <p>Returns a list of Kafka versions.</p>
 
 @param request A container for the necessary parameters to execute the ListKafkaVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`.
 
 @see AWSKafkaListKafkaVersionsRequest
 @see AWSKafkaListKafkaVersionsResponse
 */
- (void)listKafkaVersions:(AWSKafkaListKafkaVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSKafkaListKafkaVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
  <p>Returns a list of the broker nodes in the cluster.</p>
 
 @param request A container for the necessary parameters to execute the ListNodes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKafkaListNodesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorNotFound`, `AWSKafkaErrorBadRequest`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`.
 
 @see AWSKafkaListNodesRequest
 @see AWSKafkaListNodesResponse
 */
- (AWSTask<AWSKafkaListNodesResponse *> *)listNodes:(AWSKafkaListNodesRequest *)request;

/**
  <p>Returns a list of the broker nodes in the cluster.</p>
 
 @param request A container for the necessary parameters to execute the ListNodes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorNotFound`, `AWSKafkaErrorBadRequest`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`.
 
 @see AWSKafkaListNodesRequest
 @see AWSKafkaListNodesResponse
 */
- (void)listNodes:(AWSKafkaListNodesRequest *)request completionHandler:(void (^ _Nullable)(AWSKafkaListNodesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
  <p>Returns a list of the tags associated with the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKafkaListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorNotFound`, `AWSKafkaErrorBadRequest`, `AWSKafkaErrorInternalServerError`.
 
 @see AWSKafkaListTagsForResourceRequest
 @see AWSKafkaListTagsForResourceResponse
 */
- (AWSTask<AWSKafkaListTagsForResourceResponse *> *)listTagsForResource:(AWSKafkaListTagsForResourceRequest *)request;

/**
  <p>Returns a list of the tags associated with the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorNotFound`, `AWSKafkaErrorBadRequest`, `AWSKafkaErrorInternalServerError`.
 
 @see AWSKafkaListTagsForResourceRequest
 @see AWSKafkaListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSKafkaListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSKafkaListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
  <p>Adds tags to the specified MSK resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorNotFound`, `AWSKafkaErrorBadRequest`, `AWSKafkaErrorInternalServerError`.
 
 @see AWSKafkaTagResourceRequest
 */
- (AWSTask *)tagResource:(AWSKafkaTagResourceRequest *)request;

/**
  <p>Adds tags to the specified MSK resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorNotFound`, `AWSKafkaErrorBadRequest`, `AWSKafkaErrorInternalServerError`.
 
 @see AWSKafkaTagResourceRequest
 */
- (void)tagResource:(AWSKafkaTagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
  <p>Removes the tags associated with the keys that are provided in the query.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorNotFound`, `AWSKafkaErrorBadRequest`, `AWSKafkaErrorInternalServerError`.
 
 @see AWSKafkaUntagResourceRequest
 */
- (AWSTask *)untagResource:(AWSKafkaUntagResourceRequest *)request;

/**
  <p>Removes the tags associated with the keys that are provided in the query.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorNotFound`, `AWSKafkaErrorBadRequest`, `AWSKafkaErrorInternalServerError`.
 
 @see AWSKafkaUntagResourceRequest
 */
- (void)untagResource:(AWSKafkaUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
  <p>Updates the number of broker nodes in the cluster.</p>
 
 @param request A container for the necessary parameters to execute the UpdateBrokerCount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKafkaUpdateBrokerCountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorServiceUnavailable`, `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`.
 
 @see AWSKafkaUpdateBrokerCountRequest
 @see AWSKafkaUpdateBrokerCountResponse
 */
- (AWSTask<AWSKafkaUpdateBrokerCountResponse *> *)updateBrokerCount:(AWSKafkaUpdateBrokerCountRequest *)request;

/**
  <p>Updates the number of broker nodes in the cluster.</p>
 
 @param request A container for the necessary parameters to execute the UpdateBrokerCount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorServiceUnavailable`, `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`.
 
 @see AWSKafkaUpdateBrokerCountRequest
 @see AWSKafkaUpdateBrokerCountResponse
 */
- (void)updateBrokerCount:(AWSKafkaUpdateBrokerCountRequest *)request completionHandler:(void (^ _Nullable)(AWSKafkaUpdateBrokerCountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
  <p>Updates the EBS storage associated with MSK brokers.</p>
 
 @param request A container for the necessary parameters to execute the UpdateBrokerStorage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKafkaUpdateBrokerStorageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorServiceUnavailable`, `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`.
 
 @see AWSKafkaUpdateBrokerStorageRequest
 @see AWSKafkaUpdateBrokerStorageResponse
 */
- (AWSTask<AWSKafkaUpdateBrokerStorageResponse *> *)updateBrokerStorage:(AWSKafkaUpdateBrokerStorageRequest *)request;

/**
  <p>Updates the EBS storage associated with MSK brokers.</p>
 
 @param request A container for the necessary parameters to execute the UpdateBrokerStorage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorServiceUnavailable`, `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`.
 
 @see AWSKafkaUpdateBrokerStorageRequest
 @see AWSKafkaUpdateBrokerStorageResponse
 */
- (void)updateBrokerStorage:(AWSKafkaUpdateBrokerStorageRequest *)request completionHandler:(void (^ _Nullable)(AWSKafkaUpdateBrokerStorageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
  <p>Updates the cluster with the configuration that is specified in the request body.</p>
 
 @param request A container for the necessary parameters to execute the UpdateClusterConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKafkaUpdateClusterConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`, `AWSKafkaErrorNotFound`, `AWSKafkaErrorServiceUnavailable`.
 
 @see AWSKafkaUpdateClusterConfigurationRequest
 @see AWSKafkaUpdateClusterConfigurationResponse
 */
- (AWSTask<AWSKafkaUpdateClusterConfigurationResponse *> *)updateClusterConfiguration:(AWSKafkaUpdateClusterConfigurationRequest *)request;

/**
  <p>Updates the cluster with the configuration that is specified in the request body.</p>
 
 @param request A container for the necessary parameters to execute the UpdateClusterConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`, `AWSKafkaErrorNotFound`, `AWSKafkaErrorServiceUnavailable`.
 
 @see AWSKafkaUpdateClusterConfigurationRequest
 @see AWSKafkaUpdateClusterConfigurationResponse
 */
- (void)updateClusterConfiguration:(AWSKafkaUpdateClusterConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSKafkaUpdateClusterConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
  <p>Updates the Apache Kafka version for the cluster.</p>
 
 @param request A container for the necessary parameters to execute the UpdateClusterKafkaVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKafkaUpdateClusterKafkaVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`, `AWSKafkaErrorNotFound`, `AWSKafkaErrorServiceUnavailable`, `AWSKafkaErrorTooManyRequests`.
 
 @see AWSKafkaUpdateClusterKafkaVersionRequest
 @see AWSKafkaUpdateClusterKafkaVersionResponse
 */
- (AWSTask<AWSKafkaUpdateClusterKafkaVersionResponse *> *)updateClusterKafkaVersion:(AWSKafkaUpdateClusterKafkaVersionRequest *)request;

/**
  <p>Updates the Apache Kafka version for the cluster.</p>
 
 @param request A container for the necessary parameters to execute the UpdateClusterKafkaVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`, `AWSKafkaErrorNotFound`, `AWSKafkaErrorServiceUnavailable`, `AWSKafkaErrorTooManyRequests`.
 
 @see AWSKafkaUpdateClusterKafkaVersionRequest
 @see AWSKafkaUpdateClusterKafkaVersionResponse
 */
- (void)updateClusterKafkaVersion:(AWSKafkaUpdateClusterKafkaVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSKafkaUpdateClusterKafkaVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
  <p>Updates the monitoring settings for the cluster. You can use this operation to specify which Apache Kafka metrics you want Amazon MSK to send to Amazon CloudWatch. You can also specify settings for open monitoring with Prometheus.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMonitoring service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKafkaUpdateMonitoringResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorServiceUnavailable`, `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`.
 
 @see AWSKafkaUpdateMonitoringRequest
 @see AWSKafkaUpdateMonitoringResponse
 */
- (AWSTask<AWSKafkaUpdateMonitoringResponse *> *)updateMonitoring:(AWSKafkaUpdateMonitoringRequest *)request;

/**
  <p>Updates the monitoring settings for the cluster. You can use this operation to specify which Apache Kafka metrics you want Amazon MSK to send to Amazon CloudWatch. You can also specify settings for open monitoring with Prometheus.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMonitoring service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKafkaErrorDomain` domain and the following error code: `AWSKafkaErrorServiceUnavailable`, `AWSKafkaErrorBadRequest`, `AWSKafkaErrorUnauthorized`, `AWSKafkaErrorInternalServerError`, `AWSKafkaErrorForbidden`.
 
 @see AWSKafkaUpdateMonitoringRequest
 @see AWSKafkaUpdateMonitoringResponse
 */
- (void)updateMonitoring:(AWSKafkaUpdateMonitoringRequest *)request completionHandler:(void (^ _Nullable)(AWSKafkaUpdateMonitoringResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
