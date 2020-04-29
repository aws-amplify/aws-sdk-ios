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
#import "AWSservicediscoveryModel.h"
#import "AWSservicediscoveryResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSservicediscovery
FOUNDATION_EXPORT NSString *const AWSservicediscoverySDKVersion;

/**
 <p>AWS Cloud Map lets you configure public DNS, private DNS, or HTTP namespaces that your microservice applications run in. When an instance of the service becomes available, you can call the AWS Cloud Map API to register the instance with AWS Cloud Map. For public or private DNS namespaces, AWS Cloud Map automatically creates DNS records and an optional health check. Clients that submit public or private DNS queries, or HTTP requests, for the service receive an answer that contains up to eight healthy records. </p>
 */
@interface AWSservicediscovery : AWSService

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

     let servicediscovery = AWSservicediscovery.default()

 *Objective-C*

     AWSservicediscovery *servicediscovery = [AWSservicediscovery defaultservicediscovery];

 @return The default service client.
 */
+ (instancetype)defaultservicediscovery;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSservicediscovery.register(with: configuration!, forKey: "USWest2servicediscovery")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:@"USWest2servicediscovery"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let servicediscovery = AWSservicediscovery(forKey: "USWest2servicediscovery")

 *Objective-C*

     AWSservicediscovery *servicediscovery = [AWSservicediscovery servicediscoveryForKey:@"USWest2servicediscovery"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerservicediscoveryWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerservicediscoveryWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSservicediscovery.register(with: configuration!, forKey: "USWest2servicediscovery")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:@"USWest2servicediscovery"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let servicediscovery = AWSservicediscovery(forKey: "USWest2servicediscovery")

 *Objective-C*

     AWSservicediscovery *servicediscovery = [AWSservicediscovery servicediscoveryForKey:@"USWest2servicediscovery"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)servicediscoveryForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeservicediscoveryForKey:(NSString *)key;

/**
 <p>Creates an HTTP namespace. Service instances that you register using an HTTP namespace can be discovered using a <code>DiscoverInstances</code> request but can't be discovered using DNS. </p><p>For the current limit on the number of namespaces that you can create using the same AWS account, see <a href="https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html">AWS Cloud Map Limits</a> in the <i>AWS Cloud Map Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateHttpNamespace service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSservicediscoveryCreateHttpNamespaceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorNamespaceAlreadyExists`, `AWSservicediscoveryErrorResourceLimitExceeded`, `AWSservicediscoveryErrorDuplicateRequest`.
 
 @see AWSservicediscoveryCreateHttpNamespaceRequest
 @see AWSservicediscoveryCreateHttpNamespaceResponse
 */
- (AWSTask<AWSservicediscoveryCreateHttpNamespaceResponse *> *)createHttpNamespace:(AWSservicediscoveryCreateHttpNamespaceRequest *)request;

/**
 <p>Creates an HTTP namespace. Service instances that you register using an HTTP namespace can be discovered using a <code>DiscoverInstances</code> request but can't be discovered using DNS. </p><p>For the current limit on the number of namespaces that you can create using the same AWS account, see <a href="https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html">AWS Cloud Map Limits</a> in the <i>AWS Cloud Map Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateHttpNamespace service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorNamespaceAlreadyExists`, `AWSservicediscoveryErrorResourceLimitExceeded`, `AWSservicediscoveryErrorDuplicateRequest`.
 
 @see AWSservicediscoveryCreateHttpNamespaceRequest
 @see AWSservicediscoveryCreateHttpNamespaceResponse
 */
- (void)createHttpNamespace:(AWSservicediscoveryCreateHttpNamespaceRequest *)request completionHandler:(void (^ _Nullable)(AWSservicediscoveryCreateHttpNamespaceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a private namespace based on DNS, which will be visible only inside a specified Amazon VPC. The namespace defines your service naming scheme. For example, if you name your namespace <code>example.com</code> and name your service <code>backend</code>, the resulting DNS name for the service will be <code>backend.example.com</code>. For the current limit on the number of namespaces that you can create using the same AWS account, see <a href="https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html">AWS Cloud Map Limits</a> in the <i>AWS Cloud Map Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreatePrivateDnsNamespace service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSservicediscoveryCreatePrivateDnsNamespaceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorNamespaceAlreadyExists`, `AWSservicediscoveryErrorResourceLimitExceeded`, `AWSservicediscoveryErrorDuplicateRequest`.
 
 @see AWSservicediscoveryCreatePrivateDnsNamespaceRequest
 @see AWSservicediscoveryCreatePrivateDnsNamespaceResponse
 */
- (AWSTask<AWSservicediscoveryCreatePrivateDnsNamespaceResponse *> *)createPrivateDnsNamespace:(AWSservicediscoveryCreatePrivateDnsNamespaceRequest *)request;

/**
 <p>Creates a private namespace based on DNS, which will be visible only inside a specified Amazon VPC. The namespace defines your service naming scheme. For example, if you name your namespace <code>example.com</code> and name your service <code>backend</code>, the resulting DNS name for the service will be <code>backend.example.com</code>. For the current limit on the number of namespaces that you can create using the same AWS account, see <a href="https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html">AWS Cloud Map Limits</a> in the <i>AWS Cloud Map Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreatePrivateDnsNamespace service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorNamespaceAlreadyExists`, `AWSservicediscoveryErrorResourceLimitExceeded`, `AWSservicediscoveryErrorDuplicateRequest`.
 
 @see AWSservicediscoveryCreatePrivateDnsNamespaceRequest
 @see AWSservicediscoveryCreatePrivateDnsNamespaceResponse
 */
- (void)createPrivateDnsNamespace:(AWSservicediscoveryCreatePrivateDnsNamespaceRequest *)request completionHandler:(void (^ _Nullable)(AWSservicediscoveryCreatePrivateDnsNamespaceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a public namespace based on DNS, which will be visible on the internet. The namespace defines your service naming scheme. For example, if you name your namespace <code>example.com</code> and name your service <code>backend</code>, the resulting DNS name for the service will be <code>backend.example.com</code>. For the current limit on the number of namespaces that you can create using the same AWS account, see <a href="https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html">AWS Cloud Map Limits</a> in the <i>AWS Cloud Map Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreatePublicDnsNamespace service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSservicediscoveryCreatePublicDnsNamespaceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorNamespaceAlreadyExists`, `AWSservicediscoveryErrorResourceLimitExceeded`, `AWSservicediscoveryErrorDuplicateRequest`.
 
 @see AWSservicediscoveryCreatePublicDnsNamespaceRequest
 @see AWSservicediscoveryCreatePublicDnsNamespaceResponse
 */
- (AWSTask<AWSservicediscoveryCreatePublicDnsNamespaceResponse *> *)createPublicDnsNamespace:(AWSservicediscoveryCreatePublicDnsNamespaceRequest *)request;

/**
 <p>Creates a public namespace based on DNS, which will be visible on the internet. The namespace defines your service naming scheme. For example, if you name your namespace <code>example.com</code> and name your service <code>backend</code>, the resulting DNS name for the service will be <code>backend.example.com</code>. For the current limit on the number of namespaces that you can create using the same AWS account, see <a href="https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html">AWS Cloud Map Limits</a> in the <i>AWS Cloud Map Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreatePublicDnsNamespace service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorNamespaceAlreadyExists`, `AWSservicediscoveryErrorResourceLimitExceeded`, `AWSservicediscoveryErrorDuplicateRequest`.
 
 @see AWSservicediscoveryCreatePublicDnsNamespaceRequest
 @see AWSservicediscoveryCreatePublicDnsNamespaceResponse
 */
- (void)createPublicDnsNamespace:(AWSservicediscoveryCreatePublicDnsNamespaceRequest *)request completionHandler:(void (^ _Nullable)(AWSservicediscoveryCreatePublicDnsNamespaceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a service, which defines the configuration for the following entities:</p><ul><li><p>For public and private DNS namespaces, one of the following combinations of DNS records in Amazon Route 53:</p><ul><li><p>A</p></li><li><p>AAAA</p></li><li><p>A and AAAA</p></li><li><p>SRV</p></li><li><p>CNAME</p></li></ul></li><li><p>Optionally, a health check</p></li></ul><p>After you create the service, you can submit a <a href="https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html">RegisterInstance</a> request, and AWS Cloud Map uses the values in the configuration to create the specified entities.</p><p>For the current limit on the number of instances that you can register using the same namespace and using the same service, see <a href="https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html">AWS Cloud Map Limits</a> in the <i>AWS Cloud Map Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateService service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSservicediscoveryCreateServiceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorResourceLimitExceeded`, `AWSservicediscoveryErrorNamespaceNotFound`, `AWSservicediscoveryErrorServiceAlreadyExists`.
 
 @see AWSservicediscoveryCreateServiceRequest
 @see AWSservicediscoveryCreateServiceResponse
 */
- (AWSTask<AWSservicediscoveryCreateServiceResponse *> *)createService:(AWSservicediscoveryCreateServiceRequest *)request;

/**
 <p>Creates a service, which defines the configuration for the following entities:</p><ul><li><p>For public and private DNS namespaces, one of the following combinations of DNS records in Amazon Route 53:</p><ul><li><p>A</p></li><li><p>AAAA</p></li><li><p>A and AAAA</p></li><li><p>SRV</p></li><li><p>CNAME</p></li></ul></li><li><p>Optionally, a health check</p></li></ul><p>After you create the service, you can submit a <a href="https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html">RegisterInstance</a> request, and AWS Cloud Map uses the values in the configuration to create the specified entities.</p><p>For the current limit on the number of instances that you can register using the same namespace and using the same service, see <a href="https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html">AWS Cloud Map Limits</a> in the <i>AWS Cloud Map Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateService service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorResourceLimitExceeded`, `AWSservicediscoveryErrorNamespaceNotFound`, `AWSservicediscoveryErrorServiceAlreadyExists`.
 
 @see AWSservicediscoveryCreateServiceRequest
 @see AWSservicediscoveryCreateServiceResponse
 */
- (void)createService:(AWSservicediscoveryCreateServiceRequest *)request completionHandler:(void (^ _Nullable)(AWSservicediscoveryCreateServiceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a namespace from the current account. If the namespace still contains one or more services, the request fails.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNamespace service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSservicediscoveryDeleteNamespaceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorNamespaceNotFound`, `AWSservicediscoveryErrorResourceInUse`, `AWSservicediscoveryErrorDuplicateRequest`.
 
 @see AWSservicediscoveryDeleteNamespaceRequest
 @see AWSservicediscoveryDeleteNamespaceResponse
 */
- (AWSTask<AWSservicediscoveryDeleteNamespaceResponse *> *)deleteNamespace:(AWSservicediscoveryDeleteNamespaceRequest *)request;

/**
 <p>Deletes a namespace from the current account. If the namespace still contains one or more services, the request fails.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNamespace service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorNamespaceNotFound`, `AWSservicediscoveryErrorResourceInUse`, `AWSservicediscoveryErrorDuplicateRequest`.
 
 @see AWSservicediscoveryDeleteNamespaceRequest
 @see AWSservicediscoveryDeleteNamespaceResponse
 */
- (void)deleteNamespace:(AWSservicediscoveryDeleteNamespaceRequest *)request completionHandler:(void (^ _Nullable)(AWSservicediscoveryDeleteNamespaceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified service. If the service still contains one or more registered instances, the request fails.</p>
 
 @param request A container for the necessary parameters to execute the DeleteService service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSservicediscoveryDeleteServiceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorServiceNotFound`, `AWSservicediscoveryErrorResourceInUse`.
 
 @see AWSservicediscoveryDeleteServiceRequest
 @see AWSservicediscoveryDeleteServiceResponse
 */
- (AWSTask<AWSservicediscoveryDeleteServiceResponse *> *)deleteService:(AWSservicediscoveryDeleteServiceRequest *)request;

/**
 <p>Deletes a specified service. If the service still contains one or more registered instances, the request fails.</p>
 
 @param request A container for the necessary parameters to execute the DeleteService service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorServiceNotFound`, `AWSservicediscoveryErrorResourceInUse`.
 
 @see AWSservicediscoveryDeleteServiceRequest
 @see AWSservicediscoveryDeleteServiceResponse
 */
- (void)deleteService:(AWSservicediscoveryDeleteServiceRequest *)request completionHandler:(void (^ _Nullable)(AWSservicediscoveryDeleteServiceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the Amazon Route 53 DNS records and health check, if any, that AWS Cloud Map created for the specified instance.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSservicediscoveryDeregisterInstanceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorDuplicateRequest`, `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorInstanceNotFound`, `AWSservicediscoveryErrorResourceInUse`, `AWSservicediscoveryErrorServiceNotFound`.
 
 @see AWSservicediscoveryDeregisterInstanceRequest
 @see AWSservicediscoveryDeregisterInstanceResponse
 */
- (AWSTask<AWSservicediscoveryDeregisterInstanceResponse *> *)deregisterInstance:(AWSservicediscoveryDeregisterInstanceRequest *)request;

/**
 <p>Deletes the Amazon Route 53 DNS records and health check, if any, that AWS Cloud Map created for the specified instance.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorDuplicateRequest`, `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorInstanceNotFound`, `AWSservicediscoveryErrorResourceInUse`, `AWSservicediscoveryErrorServiceNotFound`.
 
 @see AWSservicediscoveryDeregisterInstanceRequest
 @see AWSservicediscoveryDeregisterInstanceResponse
 */
- (void)deregisterInstance:(AWSservicediscoveryDeregisterInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSservicediscoveryDeregisterInstanceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Discovers registered instances for a specified namespace and service. You can use <code>DiscoverInstances</code> to discover instances for any type of namespace. For public and private DNS namespaces, you can also use DNS queries to discover instances.</p>
 
 @param request A container for the necessary parameters to execute the DiscoverInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSservicediscoveryDiscoverInstancesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorServiceNotFound`, `AWSservicediscoveryErrorNamespaceNotFound`, `AWSservicediscoveryErrorInvalidInput`.
 
 @see AWSservicediscoveryDiscoverInstancesRequest
 @see AWSservicediscoveryDiscoverInstancesResponse
 */
- (AWSTask<AWSservicediscoveryDiscoverInstancesResponse *> *)discoverInstances:(AWSservicediscoveryDiscoverInstancesRequest *)request;

/**
 <p>Discovers registered instances for a specified namespace and service. You can use <code>DiscoverInstances</code> to discover instances for any type of namespace. For public and private DNS namespaces, you can also use DNS queries to discover instances.</p>
 
 @param request A container for the necessary parameters to execute the DiscoverInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorServiceNotFound`, `AWSservicediscoveryErrorNamespaceNotFound`, `AWSservicediscoveryErrorInvalidInput`.
 
 @see AWSservicediscoveryDiscoverInstancesRequest
 @see AWSservicediscoveryDiscoverInstancesResponse
 */
- (void)discoverInstances:(AWSservicediscoveryDiscoverInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSservicediscoveryDiscoverInstancesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about a specified instance.</p>
 
 @param request A container for the necessary parameters to execute the GetInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSservicediscoveryGetInstanceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInstanceNotFound`, `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorServiceNotFound`.
 
 @see AWSservicediscoveryGetInstanceRequest
 @see AWSservicediscoveryGetInstanceResponse
 */
- (AWSTask<AWSservicediscoveryGetInstanceResponse *> *)getInstance:(AWSservicediscoveryGetInstanceRequest *)request;

/**
 <p>Gets information about a specified instance.</p>
 
 @param request A container for the necessary parameters to execute the GetInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInstanceNotFound`, `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorServiceNotFound`.
 
 @see AWSservicediscoveryGetInstanceRequest
 @see AWSservicediscoveryGetInstanceResponse
 */
- (void)getInstance:(AWSservicediscoveryGetInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSservicediscoveryGetInstanceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the current health status (<code>Healthy</code>, <code>Unhealthy</code>, or <code>Unknown</code>) of one or more instances that are associated with a specified service.</p><note><p>There is a brief delay between when you register an instance and when the health status for the instance is available. </p></note>
 
 @param request A container for the necessary parameters to execute the GetInstancesHealthStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSservicediscoveryGetInstancesHealthStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInstanceNotFound`, `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorServiceNotFound`.
 
 @see AWSservicediscoveryGetInstancesHealthStatusRequest
 @see AWSservicediscoveryGetInstancesHealthStatusResponse
 */
- (AWSTask<AWSservicediscoveryGetInstancesHealthStatusResponse *> *)getInstancesHealthStatus:(AWSservicediscoveryGetInstancesHealthStatusRequest *)request;

/**
 <p>Gets the current health status (<code>Healthy</code>, <code>Unhealthy</code>, or <code>Unknown</code>) of one or more instances that are associated with a specified service.</p><note><p>There is a brief delay between when you register an instance and when the health status for the instance is available. </p></note>
 
 @param request A container for the necessary parameters to execute the GetInstancesHealthStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInstanceNotFound`, `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorServiceNotFound`.
 
 @see AWSservicediscoveryGetInstancesHealthStatusRequest
 @see AWSservicediscoveryGetInstancesHealthStatusResponse
 */
- (void)getInstancesHealthStatus:(AWSservicediscoveryGetInstancesHealthStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSservicediscoveryGetInstancesHealthStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about a namespace.</p>
 
 @param request A container for the necessary parameters to execute the GetNamespace service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSservicediscoveryGetNamespaceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorNamespaceNotFound`.
 
 @see AWSservicediscoveryGetNamespaceRequest
 @see AWSservicediscoveryGetNamespaceResponse
 */
- (AWSTask<AWSservicediscoveryGetNamespaceResponse *> *)getNamespace:(AWSservicediscoveryGetNamespaceRequest *)request;

/**
 <p>Gets information about a namespace.</p>
 
 @param request A container for the necessary parameters to execute the GetNamespace service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorNamespaceNotFound`.
 
 @see AWSservicediscoveryGetNamespaceRequest
 @see AWSservicediscoveryGetNamespaceResponse
 */
- (void)getNamespace:(AWSservicediscoveryGetNamespaceRequest *)request completionHandler:(void (^ _Nullable)(AWSservicediscoveryGetNamespaceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about any operation that returns an operation ID in the response, such as a <code>CreateService</code> request.</p><note><p>To get a list of operations that match specified criteria, see <a href="https://docs.aws.amazon.com/cloud-map/latest/api/API_ListOperations.html">ListOperations</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the GetOperation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSservicediscoveryGetOperationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorOperationNotFound`.
 
 @see AWSservicediscoveryGetOperationRequest
 @see AWSservicediscoveryGetOperationResponse
 */
- (AWSTask<AWSservicediscoveryGetOperationResponse *> *)getOperation:(AWSservicediscoveryGetOperationRequest *)request;

/**
 <p>Gets information about any operation that returns an operation ID in the response, such as a <code>CreateService</code> request.</p><note><p>To get a list of operations that match specified criteria, see <a href="https://docs.aws.amazon.com/cloud-map/latest/api/API_ListOperations.html">ListOperations</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the GetOperation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorOperationNotFound`.
 
 @see AWSservicediscoveryGetOperationRequest
 @see AWSservicediscoveryGetOperationResponse
 */
- (void)getOperation:(AWSservicediscoveryGetOperationRequest *)request completionHandler:(void (^ _Nullable)(AWSservicediscoveryGetOperationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the settings for a specified service.</p>
 
 @param request A container for the necessary parameters to execute the GetService service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSservicediscoveryGetServiceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorServiceNotFound`.
 
 @see AWSservicediscoveryGetServiceRequest
 @see AWSservicediscoveryGetServiceResponse
 */
- (AWSTask<AWSservicediscoveryGetServiceResponse *> *)getService:(AWSservicediscoveryGetServiceRequest *)request;

/**
 <p>Gets the settings for a specified service.</p>
 
 @param request A container for the necessary parameters to execute the GetService service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorServiceNotFound`.
 
 @see AWSservicediscoveryGetServiceRequest
 @see AWSservicediscoveryGetServiceResponse
 */
- (void)getService:(AWSservicediscoveryGetServiceRequest *)request completionHandler:(void (^ _Nullable)(AWSservicediscoveryGetServiceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists summary information about the instances that you registered by using a specified service.</p>
 
 @param request A container for the necessary parameters to execute the ListInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSservicediscoveryListInstancesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorServiceNotFound`, `AWSservicediscoveryErrorInvalidInput`.
 
 @see AWSservicediscoveryListInstancesRequest
 @see AWSservicediscoveryListInstancesResponse
 */
- (AWSTask<AWSservicediscoveryListInstancesResponse *> *)listInstances:(AWSservicediscoveryListInstancesRequest *)request;

/**
 <p>Lists summary information about the instances that you registered by using a specified service.</p>
 
 @param request A container for the necessary parameters to execute the ListInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorServiceNotFound`, `AWSservicediscoveryErrorInvalidInput`.
 
 @see AWSservicediscoveryListInstancesRequest
 @see AWSservicediscoveryListInstancesResponse
 */
- (void)listInstances:(AWSservicediscoveryListInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSservicediscoveryListInstancesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists summary information about the namespaces that were created by the current AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListNamespaces service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSservicediscoveryListNamespacesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInvalidInput`.
 
 @see AWSservicediscoveryListNamespacesRequest
 @see AWSservicediscoveryListNamespacesResponse
 */
- (AWSTask<AWSservicediscoveryListNamespacesResponse *> *)listNamespaces:(AWSservicediscoveryListNamespacesRequest *)request;

/**
 <p>Lists summary information about the namespaces that were created by the current AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListNamespaces service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInvalidInput`.
 
 @see AWSservicediscoveryListNamespacesRequest
 @see AWSservicediscoveryListNamespacesResponse
 */
- (void)listNamespaces:(AWSservicediscoveryListNamespacesRequest *)request completionHandler:(void (^ _Nullable)(AWSservicediscoveryListNamespacesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists operations that match the criteria that you specify.</p>
 
 @param request A container for the necessary parameters to execute the ListOperations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSservicediscoveryListOperationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInvalidInput`.
 
 @see AWSservicediscoveryListOperationsRequest
 @see AWSservicediscoveryListOperationsResponse
 */
- (AWSTask<AWSservicediscoveryListOperationsResponse *> *)listOperations:(AWSservicediscoveryListOperationsRequest *)request;

/**
 <p>Lists operations that match the criteria that you specify.</p>
 
 @param request A container for the necessary parameters to execute the ListOperations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInvalidInput`.
 
 @see AWSservicediscoveryListOperationsRequest
 @see AWSservicediscoveryListOperationsResponse
 */
- (void)listOperations:(AWSservicediscoveryListOperationsRequest *)request completionHandler:(void (^ _Nullable)(AWSservicediscoveryListOperationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists summary information for all the services that are associated with one or more specified namespaces.</p>
 
 @param request A container for the necessary parameters to execute the ListServices service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSservicediscoveryListServicesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInvalidInput`.
 
 @see AWSservicediscoveryListServicesRequest
 @see AWSservicediscoveryListServicesResponse
 */
- (AWSTask<AWSservicediscoveryListServicesResponse *> *)listServices:(AWSservicediscoveryListServicesRequest *)request;

/**
 <p>Lists summary information for all the services that are associated with one or more specified namespaces.</p>
 
 @param request A container for the necessary parameters to execute the ListServices service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInvalidInput`.
 
 @see AWSservicediscoveryListServicesRequest
 @see AWSservicediscoveryListServicesResponse
 */
- (void)listServices:(AWSservicediscoveryListServicesRequest *)request completionHandler:(void (^ _Nullable)(AWSservicediscoveryListServicesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates one or more records and, optionally, creates a health check based on the settings in a specified service. When you submit a <code>RegisterInstance</code> request, the following occurs:</p><ul><li><p>For each DNS record that you define in the service that is specified by <code>ServiceId</code>, a record is created or updated in the hosted zone that is associated with the corresponding namespace.</p></li><li><p>If the service includes <code>HealthCheckConfig</code>, a health check is created based on the settings in the health check configuration.</p></li><li><p>The health check, if any, is associated with each of the new or updated records.</p></li></ul><important><p>One <code>RegisterInstance</code> request must complete before you can submit another request and specify the same service ID and instance ID.</p></important><p>For more information, see <a href="https://docs.aws.amazon.com/cloud-map/latest/api/API_CreateService.html">CreateService</a>.</p><p>When AWS Cloud Map receives a DNS query for the specified DNS name, it returns the applicable value:</p><ul><li><p><b>If the health check is healthy</b>: returns all the records</p></li><li><p><b>If the health check is unhealthy</b>: returns the applicable value for the last healthy instance</p></li><li><p><b>If you didn't specify a health check configuration</b>: returns all the records</p></li></ul><p>For the current limit on the number of instances that you can register using the same namespace and using the same service, see <a href="https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html">AWS Cloud Map Limits</a> in the <i>AWS Cloud Map Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RegisterInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSservicediscoveryRegisterInstanceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorDuplicateRequest`, `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorResourceInUse`, `AWSservicediscoveryErrorResourceLimitExceeded`, `AWSservicediscoveryErrorServiceNotFound`.
 
 @see AWSservicediscoveryRegisterInstanceRequest
 @see AWSservicediscoveryRegisterInstanceResponse
 */
- (AWSTask<AWSservicediscoveryRegisterInstanceResponse *> *)registerInstance:(AWSservicediscoveryRegisterInstanceRequest *)request;

/**
 <p>Creates or updates one or more records and, optionally, creates a health check based on the settings in a specified service. When you submit a <code>RegisterInstance</code> request, the following occurs:</p><ul><li><p>For each DNS record that you define in the service that is specified by <code>ServiceId</code>, a record is created or updated in the hosted zone that is associated with the corresponding namespace.</p></li><li><p>If the service includes <code>HealthCheckConfig</code>, a health check is created based on the settings in the health check configuration.</p></li><li><p>The health check, if any, is associated with each of the new or updated records.</p></li></ul><important><p>One <code>RegisterInstance</code> request must complete before you can submit another request and specify the same service ID and instance ID.</p></important><p>For more information, see <a href="https://docs.aws.amazon.com/cloud-map/latest/api/API_CreateService.html">CreateService</a>.</p><p>When AWS Cloud Map receives a DNS query for the specified DNS name, it returns the applicable value:</p><ul><li><p><b>If the health check is healthy</b>: returns all the records</p></li><li><p><b>If the health check is unhealthy</b>: returns the applicable value for the last healthy instance</p></li><li><p><b>If you didn't specify a health check configuration</b>: returns all the records</p></li></ul><p>For the current limit on the number of instances that you can register using the same namespace and using the same service, see <a href="https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html">AWS Cloud Map Limits</a> in the <i>AWS Cloud Map Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RegisterInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorDuplicateRequest`, `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorResourceInUse`, `AWSservicediscoveryErrorResourceLimitExceeded`, `AWSservicediscoveryErrorServiceNotFound`.
 
 @see AWSservicediscoveryRegisterInstanceRequest
 @see AWSservicediscoveryRegisterInstanceResponse
 */
- (void)registerInstance:(AWSservicediscoveryRegisterInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSservicediscoveryRegisterInstanceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Submits a request to change the health status of a custom health check to healthy or unhealthy.</p><p>You can use <code>UpdateInstanceCustomHealthStatus</code> to change the status only for custom health checks, which you define using <code>HealthCheckCustomConfig</code> when you create a service. You can't use it to change the status for Route 53 health checks, which you define using <code>HealthCheckConfig</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/cloud-map/latest/api/API_HealthCheckCustomConfig.html">HealthCheckCustomConfig</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateInstanceCustomHealthStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInstanceNotFound`, `AWSservicediscoveryErrorServiceNotFound`, `AWSservicediscoveryErrorCustomHealthNotFound`, `AWSservicediscoveryErrorInvalidInput`.
 
 @see AWSservicediscoveryUpdateInstanceCustomHealthStatusRequest
 */
- (AWSTask *)updateInstanceCustomHealthStatus:(AWSservicediscoveryUpdateInstanceCustomHealthStatusRequest *)request;

/**
 <p>Submits a request to change the health status of a custom health check to healthy or unhealthy.</p><p>You can use <code>UpdateInstanceCustomHealthStatus</code> to change the status only for custom health checks, which you define using <code>HealthCheckCustomConfig</code> when you create a service. You can't use it to change the status for Route 53 health checks, which you define using <code>HealthCheckConfig</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/cloud-map/latest/api/API_HealthCheckCustomConfig.html">HealthCheckCustomConfig</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateInstanceCustomHealthStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorInstanceNotFound`, `AWSservicediscoveryErrorServiceNotFound`, `AWSservicediscoveryErrorCustomHealthNotFound`, `AWSservicediscoveryErrorInvalidInput`.
 
 @see AWSservicediscoveryUpdateInstanceCustomHealthStatusRequest
 */
- (void)updateInstanceCustomHealthStatus:(AWSservicediscoveryUpdateInstanceCustomHealthStatusRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Submits a request to perform the following operations:</p><ul><li><p>Update the TTL setting for existing <code>DnsRecords</code> configurations</p></li><li><p>Add, update, or delete <code>HealthCheckConfig</code> for a specified service</p><note><p>You can't add, update, or delete a <code>HealthCheckCustomConfig</code> configuration.</p></note></li></ul><p>For public and private DNS namespaces, note the following:</p><ul><li><p>If you omit any existing <code>DnsRecords</code> or <code>HealthCheckConfig</code> configurations from an <code>UpdateService</code> request, the configurations are deleted from the service.</p></li><li><p>If you omit an existing <code>HealthCheckCustomConfig</code> configuration from an <code>UpdateService</code> request, the configuration is not deleted from the service.</p></li></ul><p>When you update settings for a service, AWS Cloud Map also updates the corresponding settings in all the records and health checks that were created by using the specified service.</p>
 
 @param request A container for the necessary parameters to execute the UpdateService service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSservicediscoveryUpdateServiceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorDuplicateRequest`, `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorServiceNotFound`.
 
 @see AWSservicediscoveryUpdateServiceRequest
 @see AWSservicediscoveryUpdateServiceResponse
 */
- (AWSTask<AWSservicediscoveryUpdateServiceResponse *> *)updateService:(AWSservicediscoveryUpdateServiceRequest *)request;

/**
 <p>Submits a request to perform the following operations:</p><ul><li><p>Update the TTL setting for existing <code>DnsRecords</code> configurations</p></li><li><p>Add, update, or delete <code>HealthCheckConfig</code> for a specified service</p><note><p>You can't add, update, or delete a <code>HealthCheckCustomConfig</code> configuration.</p></note></li></ul><p>For public and private DNS namespaces, note the following:</p><ul><li><p>If you omit any existing <code>DnsRecords</code> or <code>HealthCheckConfig</code> configurations from an <code>UpdateService</code> request, the configurations are deleted from the service.</p></li><li><p>If you omit an existing <code>HealthCheckCustomConfig</code> configuration from an <code>UpdateService</code> request, the configuration is not deleted from the service.</p></li></ul><p>When you update settings for a service, AWS Cloud Map also updates the corresponding settings in all the records and health checks that were created by using the specified service.</p>
 
 @param request A container for the necessary parameters to execute the UpdateService service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSservicediscoveryErrorDomain` domain and the following error code: `AWSservicediscoveryErrorDuplicateRequest`, `AWSservicediscoveryErrorInvalidInput`, `AWSservicediscoveryErrorServiceNotFound`.
 
 @see AWSservicediscoveryUpdateServiceRequest
 @see AWSservicediscoveryUpdateServiceResponse
 */
- (void)updateService:(AWSservicediscoveryUpdateServiceRequest *)request completionHandler:(void (^ _Nullable)(AWSservicediscoveryUpdateServiceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
