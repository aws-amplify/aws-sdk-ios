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
#import "AWSschemasModel.h"
#import "AWSschemasResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSschemas
FOUNDATION_EXPORT NSString *const AWSschemasSDKVersion;

/**
 <p>Amazon EventBridge Schema Registry</p>
 */
@interface AWSschemas : AWSService

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

     let schemas = AWSschemas.default()

 *Objective-C*

     AWSschemas *schemas = [AWSschemas defaultschemas];

 @return The default service client.
 */
+ (instancetype)defaultschemas;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSschemas.register(with: configuration!, forKey: "USWest2schemas")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSschemas registerschemasWithConfiguration:configuration forKey:@"USWest2schemas"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let schemas = AWSschemas(forKey: "USWest2schemas")

 *Objective-C*

     AWSschemas *schemas = [AWSschemas schemasForKey:@"USWest2schemas"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerschemasWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerschemasWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSschemas.register(with: configuration!, forKey: "USWest2schemas")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSschemas registerschemasWithConfiguration:configuration forKey:@"USWest2schemas"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let schemas = AWSschemas(forKey: "USWest2schemas")

 *Objective-C*

     AWSschemas *schemas = [AWSschemas schemasForKey:@"USWest2schemas"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)schemasForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeschemasForKey:(NSString *)key;

/**
 <p>Creates a discoverer.</p>
 
 @param request A container for the necessary parameters to execute the CreateDiscoverer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSschemasCreateDiscovererResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorForbidden`, `AWSschemasErrorServiceUnavailable`, `AWSschemasErrorConflict`.
 
 @see AWSschemasCreateDiscovererRequest
 @see AWSschemasCreateDiscovererResponse
 */
- (AWSTask<AWSschemasCreateDiscovererResponse *> *)createDiscoverer:(AWSschemasCreateDiscovererRequest *)request;

/**
 <p>Creates a discoverer.</p>
 
 @param request A container for the necessary parameters to execute the CreateDiscoverer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorForbidden`, `AWSschemasErrorServiceUnavailable`, `AWSschemasErrorConflict`.
 
 @see AWSschemasCreateDiscovererRequest
 @see AWSschemasCreateDiscovererResponse
 */
- (void)createDiscoverer:(AWSschemasCreateDiscovererRequest *)request completionHandler:(void (^ _Nullable)(AWSschemasCreateDiscovererResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a registry.</p>
 
 @param request A container for the necessary parameters to execute the CreateRegistry service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSschemasCreateRegistryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorForbidden`, `AWSschemasErrorServiceUnavailable`, `AWSschemasErrorConflict`.
 
 @see AWSschemasCreateRegistryRequest
 @see AWSschemasCreateRegistryResponse
 */
- (AWSTask<AWSschemasCreateRegistryResponse *> *)createRegistry:(AWSschemasCreateRegistryRequest *)request;

/**
 <p>Creates a registry.</p>
 
 @param request A container for the necessary parameters to execute the CreateRegistry service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorForbidden`, `AWSschemasErrorServiceUnavailable`, `AWSschemasErrorConflict`.
 
 @see AWSschemasCreateRegistryRequest
 @see AWSschemasCreateRegistryResponse
 */
- (void)createRegistry:(AWSschemasCreateRegistryRequest *)request completionHandler:(void (^ _Nullable)(AWSschemasCreateRegistryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a schema definition.</p><note><p>Inactive schemas will be deleted after two years.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateSchema service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSschemasCreateSchemaResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorServiceUnavailable`, `AWSschemasErrorBadRequest`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`.
 
 @see AWSschemasCreateSchemaRequest
 @see AWSschemasCreateSchemaResponse
 */
- (AWSTask<AWSschemasCreateSchemaResponse *> *)createSchema:(AWSschemasCreateSchemaRequest *)request;

/**
 <p>Creates a schema definition.</p><note><p>Inactive schemas will be deleted after two years.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateSchema service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorServiceUnavailable`, `AWSschemasErrorBadRequest`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`.
 
 @see AWSschemasCreateSchemaRequest
 @see AWSschemasCreateSchemaResponse
 */
- (void)createSchema:(AWSschemasCreateSchemaRequest *)request completionHandler:(void (^ _Nullable)(AWSschemasCreateSchemaResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a discoverer.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDiscoverer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasDeleteDiscovererRequest
 */
- (AWSTask *)deleteDiscoverer:(AWSschemasDeleteDiscovererRequest *)request;

/**
 <p>Deletes a discoverer.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDiscoverer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasDeleteDiscovererRequest
 */
- (void)deleteDiscoverer:(AWSschemasDeleteDiscovererRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a Registry.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRegistry service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasDeleteRegistryRequest
 */
- (AWSTask *)deleteRegistry:(AWSschemasDeleteRegistryRequest *)request;

/**
 <p>Deletes a Registry.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRegistry service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasDeleteRegistryRequest
 */
- (void)deleteRegistry:(AWSschemasDeleteRegistryRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Delete the resource-based policy attached to the specified registry.</p>
 
 @param request A container for the necessary parameters to execute the DeleteResourcePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasDeleteResourcePolicyRequest
 */
- (AWSTask *)deleteResourcePolicy:(AWSschemasDeleteResourcePolicyRequest *)request;

/**
 <p>Delete the resource-based policy attached to the specified registry.</p>
 
 @param request A container for the necessary parameters to execute the DeleteResourcePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasDeleteResourcePolicyRequest
 */
- (void)deleteResourcePolicy:(AWSschemasDeleteResourcePolicyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Delete a schema definition.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSchema service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasDeleteSchemaRequest
 */
- (AWSTask *)deleteSchema:(AWSschemasDeleteSchemaRequest *)request;

/**
 <p>Delete a schema definition.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSchema service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasDeleteSchemaRequest
 */
- (void)deleteSchema:(AWSschemasDeleteSchemaRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Delete the schema version definition</p>
 
 @param request A container for the necessary parameters to execute the DeleteSchemaVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasDeleteSchemaVersionRequest
 */
- (AWSTask *)deleteSchemaVersion:(AWSschemasDeleteSchemaVersionRequest *)request;

/**
 <p>Delete the schema version definition</p>
 
 @param request A container for the necessary parameters to execute the DeleteSchemaVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasDeleteSchemaVersionRequest
 */
- (void)deleteSchemaVersion:(AWSschemasDeleteSchemaVersionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Describe the code binding URI.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCodeBinding service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSschemasDescribeCodeBindingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorTooManyRequests`.
 
 @see AWSschemasDescribeCodeBindingRequest
 @see AWSschemasDescribeCodeBindingResponse
 */
- (AWSTask<AWSschemasDescribeCodeBindingResponse *> *)describeCodeBinding:(AWSschemasDescribeCodeBindingRequest *)request;

/**
 <p>Describe the code binding URI.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCodeBinding service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorTooManyRequests`.
 
 @see AWSschemasDescribeCodeBindingRequest
 @see AWSschemasDescribeCodeBindingResponse
 */
- (void)describeCodeBinding:(AWSschemasDescribeCodeBindingRequest *)request completionHandler:(void (^ _Nullable)(AWSschemasDescribeCodeBindingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the discoverer.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDiscoverer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSschemasDescribeDiscovererResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasDescribeDiscovererRequest
 @see AWSschemasDescribeDiscovererResponse
 */
- (AWSTask<AWSschemasDescribeDiscovererResponse *> *)describeDiscoverer:(AWSschemasDescribeDiscovererRequest *)request;

/**
 <p>Describes the discoverer.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDiscoverer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasDescribeDiscovererRequest
 @see AWSschemasDescribeDiscovererResponse
 */
- (void)describeDiscoverer:(AWSschemasDescribeDiscovererRequest *)request completionHandler:(void (^ _Nullable)(AWSschemasDescribeDiscovererResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the registry.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRegistry service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSschemasDescribeRegistryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasDescribeRegistryRequest
 @see AWSschemasDescribeRegistryResponse
 */
- (AWSTask<AWSschemasDescribeRegistryResponse *> *)describeRegistry:(AWSschemasDescribeRegistryRequest *)request;

/**
 <p>Describes the registry.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRegistry service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasDescribeRegistryRequest
 @see AWSschemasDescribeRegistryResponse
 */
- (void)describeRegistry:(AWSschemasDescribeRegistryRequest *)request completionHandler:(void (^ _Nullable)(AWSschemasDescribeRegistryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve the schema definition.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSchema service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSschemasDescribeSchemaResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasDescribeSchemaRequest
 @see AWSschemasDescribeSchemaResponse
 */
- (AWSTask<AWSschemasDescribeSchemaResponse *> *)describeSchema:(AWSschemasDescribeSchemaRequest *)request;

/**
 <p>Retrieve the schema definition.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSchema service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasDescribeSchemaRequest
 @see AWSschemasDescribeSchemaResponse
 */
- (void)describeSchema:(AWSschemasDescribeSchemaRequest *)request completionHandler:(void (^ _Nullable)(AWSschemasDescribeSchemaResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get the code binding source URI.</p>
 
 @param request A container for the necessary parameters to execute the GetCodeBindingSource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSschemasGetCodeBindingSourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorTooManyRequests`.
 
 @see AWSschemasGetCodeBindingSourceRequest
 @see AWSschemasGetCodeBindingSourceResponse
 */
- (AWSTask<AWSschemasGetCodeBindingSourceResponse *> *)getCodeBindingSource:(AWSschemasGetCodeBindingSourceRequest *)request;

/**
 <p>Get the code binding source URI.</p>
 
 @param request A container for the necessary parameters to execute the GetCodeBindingSource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorTooManyRequests`.
 
 @see AWSschemasGetCodeBindingSourceRequest
 @see AWSschemasGetCodeBindingSourceResponse
 */
- (void)getCodeBindingSource:(AWSschemasGetCodeBindingSourceRequest *)request completionHandler:(void (^ _Nullable)(AWSschemasGetCodeBindingSourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get the discovered schema that was generated based on sampled events.</p>
 
 @param request A container for the necessary parameters to execute the GetDiscoveredSchema service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSschemasGetDiscoveredSchemaResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorServiceUnavailable`, `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`.
 
 @see AWSschemasGetDiscoveredSchemaRequest
 @see AWSschemasGetDiscoveredSchemaResponse
 */
- (AWSTask<AWSschemasGetDiscoveredSchemaResponse *> *)getDiscoveredSchema:(AWSschemasGetDiscoveredSchemaRequest *)request;

/**
 <p>Get the discovered schema that was generated based on sampled events.</p>
 
 @param request A container for the necessary parameters to execute the GetDiscoveredSchema service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorServiceUnavailable`, `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`.
 
 @see AWSschemasGetDiscoveredSchemaRequest
 @see AWSschemasGetDiscoveredSchemaResponse
 */
- (void)getDiscoveredSchema:(AWSschemasGetDiscoveredSchemaRequest *)request completionHandler:(void (^ _Nullable)(AWSschemasGetDiscoveredSchemaResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the resource-based policy attached to a given registry.</p>
 
 @param request A container for the necessary parameters to execute the GetResourcePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSschemasGetResourcePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasGetResourcePolicyRequest
 @see AWSschemasGetResourcePolicyResponse
 */
- (AWSTask<AWSschemasGetResourcePolicyResponse *> *)getResourcePolicy:(AWSschemasGetResourcePolicyRequest *)request;

/**
 <p>Retrieves the resource-based policy attached to a given registry.</p>
 
 @param request A container for the necessary parameters to execute the GetResourcePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasGetResourcePolicyRequest
 @see AWSschemasGetResourcePolicyResponse
 */
- (void)getResourcePolicy:(AWSschemasGetResourcePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSschemasGetResourcePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List the discoverers.</p>
 
 @param request A container for the necessary parameters to execute the ListDiscoverers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSschemasListDiscoverersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorServiceUnavailable`, `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`.
 
 @see AWSschemasListDiscoverersRequest
 @see AWSschemasListDiscoverersResponse
 */
- (AWSTask<AWSschemasListDiscoverersResponse *> *)listDiscoverers:(AWSschemasListDiscoverersRequest *)request;

/**
 <p>List the discoverers.</p>
 
 @param request A container for the necessary parameters to execute the ListDiscoverers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorServiceUnavailable`, `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`.
 
 @see AWSschemasListDiscoverersRequest
 @see AWSschemasListDiscoverersResponse
 */
- (void)listDiscoverers:(AWSschemasListDiscoverersRequest *)request completionHandler:(void (^ _Nullable)(AWSschemasListDiscoverersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List the registries.</p>
 
 @param request A container for the necessary parameters to execute the ListRegistries service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSschemasListRegistriesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorServiceUnavailable`, `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`.
 
 @see AWSschemasListRegistriesRequest
 @see AWSschemasListRegistriesResponse
 */
- (AWSTask<AWSschemasListRegistriesResponse *> *)listRegistries:(AWSschemasListRegistriesRequest *)request;

/**
 <p>List the registries.</p>
 
 @param request A container for the necessary parameters to execute the ListRegistries service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorServiceUnavailable`, `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`.
 
 @see AWSschemasListRegistriesRequest
 @see AWSschemasListRegistriesResponse
 */
- (void)listRegistries:(AWSschemasListRegistriesRequest *)request completionHandler:(void (^ _Nullable)(AWSschemasListRegistriesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of the schema versions and related information.</p>
 
 @param request A container for the necessary parameters to execute the ListSchemaVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSschemasListSchemaVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasListSchemaVersionsRequest
 @see AWSschemasListSchemaVersionsResponse
 */
- (AWSTask<AWSschemasListSchemaVersionsResponse *> *)listSchemaVersions:(AWSschemasListSchemaVersionsRequest *)request;

/**
 <p>Provides a list of the schema versions and related information.</p>
 
 @param request A container for the necessary parameters to execute the ListSchemaVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasListSchemaVersionsRequest
 @see AWSschemasListSchemaVersionsResponse
 */
- (void)listSchemaVersions:(AWSschemasListSchemaVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSschemasListSchemaVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List the schemas.</p>
 
 @param request A container for the necessary parameters to execute the ListSchemas service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSschemasListSchemasResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorServiceUnavailable`, `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`.
 
 @see AWSschemasListSchemasRequest
 @see AWSschemasListSchemasResponse
 */
- (AWSTask<AWSschemasListSchemasResponse *> *)listSchemas:(AWSschemasListSchemasRequest *)request;

/**
 <p>List the schemas.</p>
 
 @param request A container for the necessary parameters to execute the ListSchemas service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorServiceUnavailable`, `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`.
 
 @see AWSschemasListSchemasRequest
 @see AWSschemasListSchemasResponse
 */
- (void)listSchemas:(AWSschemasListSchemasRequest *)request completionHandler:(void (^ _Nullable)(AWSschemasListSchemasResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get tags for resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSschemasListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorNotFound`, `AWSschemasErrorBadRequest`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`.
 
 @see AWSschemasListTagsForResourceRequest
 @see AWSschemasListTagsForResourceResponse
 */
- (AWSTask<AWSschemasListTagsForResourceResponse *> *)listTagsForResource:(AWSschemasListTagsForResourceRequest *)request;

/**
 <p>Get tags for resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorNotFound`, `AWSschemasErrorBadRequest`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`.
 
 @see AWSschemasListTagsForResourceRequest
 @see AWSschemasListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSschemasListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSschemasListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Put code binding URI</p>
 
 @param request A container for the necessary parameters to execute the PutCodeBinding service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSschemasPutCodeBindingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorGone`, `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorTooManyRequests`.
 
 @see AWSschemasPutCodeBindingRequest
 @see AWSschemasPutCodeBindingResponse
 */
- (AWSTask<AWSschemasPutCodeBindingResponse *> *)putCodeBinding:(AWSschemasPutCodeBindingRequest *)request;

/**
 <p>Put code binding URI</p>
 
 @param request A container for the necessary parameters to execute the PutCodeBinding service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorGone`, `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorTooManyRequests`.
 
 @see AWSschemasPutCodeBindingRequest
 @see AWSschemasPutCodeBindingResponse
 */
- (void)putCodeBinding:(AWSschemasPutCodeBindingRequest *)request completionHandler:(void (^ _Nullable)(AWSschemasPutCodeBindingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>The name of the policy.</p>
 
 @param request A container for the necessary parameters to execute the PutResourcePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSschemasPutResourcePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorPreconditionFailed`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasPutResourcePolicyRequest
 @see AWSschemasPutResourcePolicyResponse
 */
- (AWSTask<AWSschemasPutResourcePolicyResponse *> *)putResourcePolicy:(AWSschemasPutResourcePolicyRequest *)request;

/**
 <p>The name of the policy.</p>
 
 @param request A container for the necessary parameters to execute the PutResourcePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorPreconditionFailed`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasPutResourcePolicyRequest
 @see AWSschemasPutResourcePolicyResponse
 */
- (void)putResourcePolicy:(AWSschemasPutResourcePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSschemasPutResourcePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Search the schemas</p>
 
 @param request A container for the necessary parameters to execute the SearchSchemas service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSschemasSearchSchemasResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorServiceUnavailable`, `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`.
 
 @see AWSschemasSearchSchemasRequest
 @see AWSschemasSearchSchemasResponse
 */
- (AWSTask<AWSschemasSearchSchemasResponse *> *)searchSchemas:(AWSschemasSearchSchemasRequest *)request;

/**
 <p>Search the schemas</p>
 
 @param request A container for the necessary parameters to execute the SearchSchemas service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorServiceUnavailable`, `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`.
 
 @see AWSschemasSearchSchemasRequest
 @see AWSschemasSearchSchemasResponse
 */
- (void)searchSchemas:(AWSschemasSearchSchemasRequest *)request completionHandler:(void (^ _Nullable)(AWSschemasSearchSchemasResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts the discoverer</p>
 
 @param request A container for the necessary parameters to execute the StartDiscoverer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSschemasStartDiscovererResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasStartDiscovererRequest
 @see AWSschemasStartDiscovererResponse
 */
- (AWSTask<AWSschemasStartDiscovererResponse *> *)startDiscoverer:(AWSschemasStartDiscovererRequest *)request;

/**
 <p>Starts the discoverer</p>
 
 @param request A container for the necessary parameters to execute the StartDiscoverer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasStartDiscovererRequest
 @see AWSschemasStartDiscovererResponse
 */
- (void)startDiscoverer:(AWSschemasStartDiscovererRequest *)request completionHandler:(void (^ _Nullable)(AWSschemasStartDiscovererResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops the discoverer</p>
 
 @param request A container for the necessary parameters to execute the StopDiscoverer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSschemasStopDiscovererResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasStopDiscovererRequest
 @see AWSschemasStopDiscovererResponse
 */
- (AWSTask<AWSschemasStopDiscovererResponse *> *)stopDiscoverer:(AWSschemasStopDiscovererRequest *)request;

/**
 <p>Stops the discoverer</p>
 
 @param request A container for the necessary parameters to execute the StopDiscoverer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasStopDiscovererRequest
 @see AWSschemasStopDiscovererResponse
 */
- (void)stopDiscoverer:(AWSschemasStopDiscovererRequest *)request completionHandler:(void (^ _Nullable)(AWSschemasStopDiscovererResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Add tags to a resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorNotFound`, `AWSschemasErrorBadRequest`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`.
 
 @see AWSschemasTagResourceRequest
 */
- (AWSTask *)tagResource:(AWSschemasTagResourceRequest *)request;

/**
 <p>Add tags to a resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorNotFound`, `AWSschemasErrorBadRequest`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`.
 
 @see AWSschemasTagResourceRequest
 */
- (void)tagResource:(AWSschemasTagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorNotFound`, `AWSschemasErrorBadRequest`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`.
 
 @see AWSschemasUntagResourceRequest
 */
- (AWSTask *)untagResource:(AWSschemasUntagResourceRequest *)request;

/**
 <p>Removes tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorNotFound`, `AWSschemasErrorBadRequest`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`.
 
 @see AWSschemasUntagResourceRequest
 */
- (void)untagResource:(AWSschemasUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the discoverer</p>
 
 @param request A container for the necessary parameters to execute the UpdateDiscoverer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSschemasUpdateDiscovererResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasUpdateDiscovererRequest
 @see AWSschemasUpdateDiscovererResponse
 */
- (AWSTask<AWSschemasUpdateDiscovererResponse *> *)updateDiscoverer:(AWSschemasUpdateDiscovererRequest *)request;

/**
 <p>Updates the discoverer</p>
 
 @param request A container for the necessary parameters to execute the UpdateDiscoverer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasUpdateDiscovererRequest
 @see AWSschemasUpdateDiscovererResponse
 */
- (void)updateDiscoverer:(AWSschemasUpdateDiscovererRequest *)request completionHandler:(void (^ _Nullable)(AWSschemasUpdateDiscovererResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a registry.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRegistry service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSschemasUpdateRegistryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasUpdateRegistryRequest
 @see AWSschemasUpdateRegistryResponse
 */
- (AWSTask<AWSschemasUpdateRegistryResponse *> *)updateRegistry:(AWSschemasUpdateRegistryRequest *)request;

/**
 <p>Updates a registry.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRegistry service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorUnauthorized`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasUpdateRegistryRequest
 @see AWSschemasUpdateRegistryResponse
 */
- (void)updateRegistry:(AWSschemasUpdateRegistryRequest *)request completionHandler:(void (^ _Nullable)(AWSschemasUpdateRegistryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the schema definition</p><note><p>Inactive schemas will be deleted after two years.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateSchema service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSschemasUpdateSchemaResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasUpdateSchemaRequest
 @see AWSschemasUpdateSchemaResponse
 */
- (AWSTask<AWSschemasUpdateSchemaResponse *> *)updateSchema:(AWSschemasUpdateSchemaRequest *)request;

/**
 <p>Updates the schema definition</p><note><p>Inactive schemas will be deleted after two years.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateSchema service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSschemasErrorDomain` domain and the following error code: `AWSschemasErrorBadRequest`, `AWSschemasErrorInternalServerError`, `AWSschemasErrorForbidden`, `AWSschemasErrorNotFound`, `AWSschemasErrorServiceUnavailable`.
 
 @see AWSschemasUpdateSchemaRequest
 @see AWSschemasUpdateSchemaResponse
 */
- (void)updateSchema:(AWSschemasUpdateSchemaRequest *)request completionHandler:(void (^ _Nullable)(AWSschemasUpdateSchemaResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
