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
#import "AWSLightsailModel.h"
#import "AWSLightsailResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSLightsail
FOUNDATION_EXPORT NSString *const AWSLightsailSDKVersion;

/**
 <p>Amazon Lightsail is the easiest way to get started with AWS for developers who just need virtual private servers. Lightsail includes everything you need to launch your project quickly - a virtual machine, a managed database, SSD-based storage, data transfer, DNS management, and a static IP - for a low, predictable price. You manage those Lightsail servers through the Lightsail console or by using the API or command-line interface (CLI).</p><p>For more information about Lightsail concepts and tasks, see the <a href="https://lightsail.aws.amazon.com/ls/docs/all">Lightsail Dev Guide</a>.</p><p>To use the Lightsail API or the CLI, you will need to use AWS Identity and Access Management (IAM) to generate access keys. For details about how to set this up, see the <a href="http://lightsail.aws.amazon.com/ls/docs/how-to/article/lightsail-how-to-set-up-access-keys-to-use-sdk-api-cli">Lightsail Dev Guide</a>.</p>
 */
@interface AWSLightsail : AWSService

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

     let Lightsail = AWSLightsail.default()

 *Objective-C*

     AWSLightsail *Lightsail = [AWSLightsail defaultLightsail];

 @return The default service client.
 */
+ (instancetype)defaultLightsail;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSLightsail.register(with: configuration!, forKey: "USWest2Lightsail")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSLightsail registerLightsailWithConfiguration:configuration forKey:@"USWest2Lightsail"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Lightsail = AWSLightsail(forKey: "USWest2Lightsail")

 *Objective-C*

     AWSLightsail *Lightsail = [AWSLightsail LightsailForKey:@"USWest2Lightsail"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerLightsailWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerLightsailWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSLightsail.register(with: configuration!, forKey: "USWest2Lightsail")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSLightsail registerLightsailWithConfiguration:configuration forKey:@"USWest2Lightsail"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Lightsail = AWSLightsail(forKey: "USWest2Lightsail")

 *Objective-C*

     AWSLightsail *Lightsail = [AWSLightsail LightsailForKey:@"USWest2Lightsail"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)LightsailForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeLightsailForKey:(NSString *)key;

/**
 <p>Allocates a static IP address.</p>
 
 @param request A container for the necessary parameters to execute the AllocateStaticIp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailAllocateStaticIpResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailAllocateStaticIpRequest
 @see AWSLightsailAllocateStaticIpResult
 */
- (AWSTask<AWSLightsailAllocateStaticIpResult *> *)allocateStaticIp:(AWSLightsailAllocateStaticIpRequest *)request;

/**
 <p>Allocates a static IP address.</p>
 
 @param request A container for the necessary parameters to execute the AllocateStaticIp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailAllocateStaticIpRequest
 @see AWSLightsailAllocateStaticIpResult
 */
- (void)allocateStaticIp:(AWSLightsailAllocateStaticIpRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailAllocateStaticIpResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attaches a block storage disk to a running or stopped Lightsail instance and exposes it to the instance with the specified disk name.</p><p>The <code>attach disk</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>disk name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the AttachDisk service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailAttachDiskResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailAttachDiskRequest
 @see AWSLightsailAttachDiskResult
 */
- (AWSTask<AWSLightsailAttachDiskResult *> *)attachDisk:(AWSLightsailAttachDiskRequest *)request;

/**
 <p>Attaches a block storage disk to a running or stopped Lightsail instance and exposes it to the instance with the specified disk name.</p><p>The <code>attach disk</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>disk name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the AttachDisk service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailAttachDiskRequest
 @see AWSLightsailAttachDiskResult
 */
- (void)attachDisk:(AWSLightsailAttachDiskRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailAttachDiskResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attaches one or more Lightsail instances to a load balancer.</p><p>After some time, the instances are attached to the load balancer and the health check status is available.</p><p>The <code>attach instances to load balancer</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>load balancer name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the AttachInstancesToLoadBalancer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailAttachInstancesToLoadBalancerResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailAttachInstancesToLoadBalancerRequest
 @see AWSLightsailAttachInstancesToLoadBalancerResult
 */
- (AWSTask<AWSLightsailAttachInstancesToLoadBalancerResult *> *)attachInstancesToLoadBalancer:(AWSLightsailAttachInstancesToLoadBalancerRequest *)request;

/**
 <p>Attaches one or more Lightsail instances to a load balancer.</p><p>After some time, the instances are attached to the load balancer and the health check status is available.</p><p>The <code>attach instances to load balancer</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>load balancer name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the AttachInstancesToLoadBalancer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailAttachInstancesToLoadBalancerRequest
 @see AWSLightsailAttachInstancesToLoadBalancerResult
 */
- (void)attachInstancesToLoadBalancer:(AWSLightsailAttachInstancesToLoadBalancerRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailAttachInstancesToLoadBalancerResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attaches a Transport Layer Security (TLS) certificate to your load balancer. TLS is just an updated, more secure version of Secure Socket Layer (SSL).</p><p>Once you create and validate your certificate, you can attach it to your load balancer. You can also use this API to rotate the certificates on your account. Use the <code>AttachLoadBalancerTlsCertificate</code> action with the non-attached certificate, and it will replace the existing one and become the attached certificate.</p><p>The <code>AttachLoadBalancerTlsCertificate</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>load balancer name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the AttachLoadBalancerTlsCertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailAttachLoadBalancerTlsCertificateResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailAttachLoadBalancerTlsCertificateRequest
 @see AWSLightsailAttachLoadBalancerTlsCertificateResult
 */
- (AWSTask<AWSLightsailAttachLoadBalancerTlsCertificateResult *> *)attachLoadBalancerTlsCertificate:(AWSLightsailAttachLoadBalancerTlsCertificateRequest *)request;

/**
 <p>Attaches a Transport Layer Security (TLS) certificate to your load balancer. TLS is just an updated, more secure version of Secure Socket Layer (SSL).</p><p>Once you create and validate your certificate, you can attach it to your load balancer. You can also use this API to rotate the certificates on your account. Use the <code>AttachLoadBalancerTlsCertificate</code> action with the non-attached certificate, and it will replace the existing one and become the attached certificate.</p><p>The <code>AttachLoadBalancerTlsCertificate</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>load balancer name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the AttachLoadBalancerTlsCertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailAttachLoadBalancerTlsCertificateRequest
 @see AWSLightsailAttachLoadBalancerTlsCertificateResult
 */
- (void)attachLoadBalancerTlsCertificate:(AWSLightsailAttachLoadBalancerTlsCertificateRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailAttachLoadBalancerTlsCertificateResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attaches a static IP address to a specific Amazon Lightsail instance.</p>
 
 @param request A container for the necessary parameters to execute the AttachStaticIp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailAttachStaticIpResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailAttachStaticIpRequest
 @see AWSLightsailAttachStaticIpResult
 */
- (AWSTask<AWSLightsailAttachStaticIpResult *> *)attachStaticIp:(AWSLightsailAttachStaticIpRequest *)request;

/**
 <p>Attaches a static IP address to a specific Amazon Lightsail instance.</p>
 
 @param request A container for the necessary parameters to execute the AttachStaticIp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailAttachStaticIpRequest
 @see AWSLightsailAttachStaticIpResult
 */
- (void)attachStaticIp:(AWSLightsailAttachStaticIpRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailAttachStaticIpResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Closes ports for a specific Amazon Lightsail instance.</p><p>The <code>CloseInstancePublicPorts</code> action supports tag-based access control via resource tags applied to the resource identified by <code>instanceName</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CloseInstancePublicPorts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailCloseInstancePublicPortsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCloseInstancePublicPortsRequest
 @see AWSLightsailCloseInstancePublicPortsResult
 */
- (AWSTask<AWSLightsailCloseInstancePublicPortsResult *> *)closeInstancePublicPorts:(AWSLightsailCloseInstancePublicPortsRequest *)request;

/**
 <p>Closes ports for a specific Amazon Lightsail instance.</p><p>The <code>CloseInstancePublicPorts</code> action supports tag-based access control via resource tags applied to the resource identified by <code>instanceName</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CloseInstancePublicPorts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCloseInstancePublicPortsRequest
 @see AWSLightsailCloseInstancePublicPortsResult
 */
- (void)closeInstancePublicPorts:(AWSLightsailCloseInstancePublicPortsRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailCloseInstancePublicPortsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Copies a manual snapshot of an instance or disk as another manual snapshot, or copies an automatic snapshot of an instance or disk as a manual snapshot. This operation can also be used to copy a manual or automatic snapshot of an instance or a disk from one AWS Region to another in Amazon Lightsail.</p><p>When copying a <i>manual snapshot</i>, be sure to define the <code>source region</code>, <code>source snapshot name</code>, and <code>target snapshot name</code> parameters.</p><p>When copying an <i>automatic snapshot</i>, be sure to define the <code>source region</code>, <code>source resource name</code>, <code>target snapshot name</code>, and either the <code>restore date</code> or the <code>use latest restorable auto snapshot</code> parameters.</p>
 
 @param request A container for the necessary parameters to execute the CopySnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailReplicateSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailReplicateSnapshotRequest
 @see AWSLightsailReplicateSnapshotResult
 */
- (AWSTask<AWSLightsailReplicateSnapshotResult *> *)replicateSnapshot:(AWSLightsailReplicateSnapshotRequest *)request;

/**
 <p>Copies a manual snapshot of an instance or disk as another manual snapshot, or copies an automatic snapshot of an instance or disk as a manual snapshot. This operation can also be used to copy a manual or automatic snapshot of an instance or a disk from one AWS Region to another in Amazon Lightsail.</p><p>When copying a <i>manual snapshot</i>, be sure to define the <code>source region</code>, <code>source snapshot name</code>, and <code>target snapshot name</code> parameters.</p><p>When copying an <i>automatic snapshot</i>, be sure to define the <code>source region</code>, <code>source resource name</code>, <code>target snapshot name</code>, and either the <code>restore date</code> or the <code>use latest restorable auto snapshot</code> parameters.</p>
 
 @param request A container for the necessary parameters to execute the CopySnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailReplicateSnapshotRequest
 @see AWSLightsailReplicateSnapshotResult
 */
- (void)replicateSnapshot:(AWSLightsailReplicateSnapshotRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailReplicateSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an AWS CloudFormation stack, which creates a new Amazon EC2 instance from an exported Amazon Lightsail snapshot. This operation results in a CloudFormation stack record that can be used to track the AWS CloudFormation stack created. Use the <code>get cloud formation stack records</code> operation to get a list of the CloudFormation stacks created.</p><important><p>Wait until after your new Amazon EC2 instance is created before running the <code>create cloud formation stack</code> operation again with the same export snapshot record.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateCloudFormationStack service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailCreateCloudFormationStackResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateCloudFormationStackRequest
 @see AWSLightsailCreateCloudFormationStackResult
 */
- (AWSTask<AWSLightsailCreateCloudFormationStackResult *> *)createCloudFormationStack:(AWSLightsailCreateCloudFormationStackRequest *)request;

/**
 <p>Creates an AWS CloudFormation stack, which creates a new Amazon EC2 instance from an exported Amazon Lightsail snapshot. This operation results in a CloudFormation stack record that can be used to track the AWS CloudFormation stack created. Use the <code>get cloud formation stack records</code> operation to get a list of the CloudFormation stacks created.</p><important><p>Wait until after your new Amazon EC2 instance is created before running the <code>create cloud formation stack</code> operation again with the same export snapshot record.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateCloudFormationStack service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateCloudFormationStackRequest
 @see AWSLightsailCreateCloudFormationStackResult
 */
- (void)createCloudFormationStack:(AWSLightsailCreateCloudFormationStackRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailCreateCloudFormationStackResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an email or SMS text message contact method.</p><p>A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each AWS Region. However, SMS text messaging is not supported in some AWS Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications">Notifications in Amazon Lightsail</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateContactMethod service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailCreateContactMethodResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateContactMethodRequest
 @see AWSLightsailCreateContactMethodResult
 */
- (AWSTask<AWSLightsailCreateContactMethodResult *> *)createContactMethod:(AWSLightsailCreateContactMethodRequest *)request;

/**
 <p>Creates an email or SMS text message contact method.</p><p>A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each AWS Region. However, SMS text messaging is not supported in some AWS Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications">Notifications in Amazon Lightsail</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateContactMethod service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateContactMethodRequest
 @see AWSLightsailCreateContactMethodResult
 */
- (void)createContactMethod:(AWSLightsailCreateContactMethodRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailCreateContactMethodResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a block storage disk that can be attached to an Amazon Lightsail instance in the same Availability Zone (e.g., <code>us-east-2a</code>).</p><p>The <code>create disk</code> operation supports tag-based access control via request tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDisk service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailCreateDiskResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateDiskRequest
 @see AWSLightsailCreateDiskResult
 */
- (AWSTask<AWSLightsailCreateDiskResult *> *)createDisk:(AWSLightsailCreateDiskRequest *)request;

/**
 <p>Creates a block storage disk that can be attached to an Amazon Lightsail instance in the same Availability Zone (e.g., <code>us-east-2a</code>).</p><p>The <code>create disk</code> operation supports tag-based access control via request tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDisk service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateDiskRequest
 @see AWSLightsailCreateDiskResult
 */
- (void)createDisk:(AWSLightsailCreateDiskRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailCreateDiskResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a block storage disk from a manual or automatic snapshot of a disk. The resulting disk can be attached to an Amazon Lightsail instance in the same Availability Zone (e.g., <code>us-east-2a</code>).</p><p>The <code>create disk from snapshot</code> operation supports tag-based access control via request tags and resource tags applied to the resource identified by <code>disk snapshot name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDiskFromSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailCreateDiskFromSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateDiskFromSnapshotRequest
 @see AWSLightsailCreateDiskFromSnapshotResult
 */
- (AWSTask<AWSLightsailCreateDiskFromSnapshotResult *> *)createDiskFromSnapshot:(AWSLightsailCreateDiskFromSnapshotRequest *)request;

/**
 <p>Creates a block storage disk from a manual or automatic snapshot of a disk. The resulting disk can be attached to an Amazon Lightsail instance in the same Availability Zone (e.g., <code>us-east-2a</code>).</p><p>The <code>create disk from snapshot</code> operation supports tag-based access control via request tags and resource tags applied to the resource identified by <code>disk snapshot name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDiskFromSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateDiskFromSnapshotRequest
 @see AWSLightsailCreateDiskFromSnapshotResult
 */
- (void)createDiskFromSnapshot:(AWSLightsailCreateDiskFromSnapshotRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailCreateDiskFromSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a snapshot of a block storage disk. You can use snapshots for backups, to make copies of disks, and to save data before shutting down a Lightsail instance.</p><p>You can take a snapshot of an attached disk that is in use; however, snapshots only capture data that has been written to your disk at the time the snapshot command is issued. This may exclude any data that has been cached by any applications or the operating system. If you can pause any file systems on the disk long enough to take a snapshot, your snapshot should be complete. Nevertheless, if you cannot pause all file writes to the disk, you should unmount the disk from within the Lightsail instance, issue the create disk snapshot command, and then remount the disk to ensure a consistent and complete snapshot. You may remount and use your disk while the snapshot status is pending.</p><p>You can also use this operation to create a snapshot of an instance's system volume. You might want to do this, for example, to recover data from the system volume of a botched instance or to create a backup of the system volume like you would for a block storage disk. To create a snapshot of a system volume, just define the <code>instance name</code> parameter when issuing the snapshot command, and a snapshot of the defined instance's system volume will be created. After the snapshot is available, you can create a block storage disk from the snapshot and attach it to a running instance to access the data on the disk.</p><p>The <code>create disk snapshot</code> operation supports tag-based access control via request tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDiskSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailCreateDiskSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateDiskSnapshotRequest
 @see AWSLightsailCreateDiskSnapshotResult
 */
- (AWSTask<AWSLightsailCreateDiskSnapshotResult *> *)createDiskSnapshot:(AWSLightsailCreateDiskSnapshotRequest *)request;

/**
 <p>Creates a snapshot of a block storage disk. You can use snapshots for backups, to make copies of disks, and to save data before shutting down a Lightsail instance.</p><p>You can take a snapshot of an attached disk that is in use; however, snapshots only capture data that has been written to your disk at the time the snapshot command is issued. This may exclude any data that has been cached by any applications or the operating system. If you can pause any file systems on the disk long enough to take a snapshot, your snapshot should be complete. Nevertheless, if you cannot pause all file writes to the disk, you should unmount the disk from within the Lightsail instance, issue the create disk snapshot command, and then remount the disk to ensure a consistent and complete snapshot. You may remount and use your disk while the snapshot status is pending.</p><p>You can also use this operation to create a snapshot of an instance's system volume. You might want to do this, for example, to recover data from the system volume of a botched instance or to create a backup of the system volume like you would for a block storage disk. To create a snapshot of a system volume, just define the <code>instance name</code> parameter when issuing the snapshot command, and a snapshot of the defined instance's system volume will be created. After the snapshot is available, you can create a block storage disk from the snapshot and attach it to a running instance to access the data on the disk.</p><p>The <code>create disk snapshot</code> operation supports tag-based access control via request tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDiskSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateDiskSnapshotRequest
 @see AWSLightsailCreateDiskSnapshotResult
 */
- (void)createDiskSnapshot:(AWSLightsailCreateDiskSnapshotRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailCreateDiskSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a domain resource for the specified domain (e.g., example.com).</p><p>The <code>create domain</code> operation supports tag-based access control via request tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailCreateDomainResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateDomainRequest
 @see AWSLightsailCreateDomainResult
 */
- (AWSTask<AWSLightsailCreateDomainResult *> *)createDomain:(AWSLightsailCreateDomainRequest *)request;

/**
 <p>Creates a domain resource for the specified domain (e.g., example.com).</p><p>The <code>create domain</code> operation supports tag-based access control via request tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateDomainRequest
 @see AWSLightsailCreateDomainResult
 */
- (void)createDomain:(AWSLightsailCreateDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailCreateDomainResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates one of the following entry records associated with the domain: Address (A), canonical name (CNAME), mail exchanger (MX), name server (NS), start of authority (SOA), service locator (SRV), or text (TXT).</p><p>The <code>create domain entry</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>domain name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDomainEntry service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailCreateDomainEntryResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateDomainEntryRequest
 @see AWSLightsailCreateDomainEntryResult
 */
- (AWSTask<AWSLightsailCreateDomainEntryResult *> *)createDomainEntry:(AWSLightsailCreateDomainEntryRequest *)request;

/**
 <p>Creates one of the following entry records associated with the domain: Address (A), canonical name (CNAME), mail exchanger (MX), name server (NS), start of authority (SOA), service locator (SRV), or text (TXT).</p><p>The <code>create domain entry</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>domain name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDomainEntry service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateDomainEntryRequest
 @see AWSLightsailCreateDomainEntryResult
 */
- (void)createDomainEntry:(AWSLightsailCreateDomainEntryRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailCreateDomainEntryResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a snapshot of a specific virtual private server, or <i>instance</i>. You can use a snapshot to create a new instance that is based on that snapshot.</p><p>The <code>create instance snapshot</code> operation supports tag-based access control via request tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateInstanceSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailCreateInstanceSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateInstanceSnapshotRequest
 @see AWSLightsailCreateInstanceSnapshotResult
 */
- (AWSTask<AWSLightsailCreateInstanceSnapshotResult *> *)createInstanceSnapshot:(AWSLightsailCreateInstanceSnapshotRequest *)request;

/**
 <p>Creates a snapshot of a specific virtual private server, or <i>instance</i>. You can use a snapshot to create a new instance that is based on that snapshot.</p><p>The <code>create instance snapshot</code> operation supports tag-based access control via request tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateInstanceSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateInstanceSnapshotRequest
 @see AWSLightsailCreateInstanceSnapshotResult
 */
- (void)createInstanceSnapshot:(AWSLightsailCreateInstanceSnapshotRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailCreateInstanceSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates one or more Amazon Lightsail instances.</p><p>The <code>create instances</code> operation supports tag-based access control via request tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailCreateInstancesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateInstancesRequest
 @see AWSLightsailCreateInstancesResult
 */
- (AWSTask<AWSLightsailCreateInstancesResult *> *)createInstances:(AWSLightsailCreateInstancesRequest *)request;

/**
 <p>Creates one or more Amazon Lightsail instances.</p><p>The <code>create instances</code> operation supports tag-based access control via request tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateInstancesRequest
 @see AWSLightsailCreateInstancesResult
 */
- (void)createInstances:(AWSLightsailCreateInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailCreateInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates one or more new instances from a manual or automatic snapshot of an instance.</p><p>The <code>create instances from snapshot</code> operation supports tag-based access control via request tags and resource tags applied to the resource identified by <code>instance snapshot name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateInstancesFromSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailCreateInstancesFromSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateInstancesFromSnapshotRequest
 @see AWSLightsailCreateInstancesFromSnapshotResult
 */
- (AWSTask<AWSLightsailCreateInstancesFromSnapshotResult *> *)createInstancesFromSnapshot:(AWSLightsailCreateInstancesFromSnapshotRequest *)request;

/**
 <p>Creates one or more new instances from a manual or automatic snapshot of an instance.</p><p>The <code>create instances from snapshot</code> operation supports tag-based access control via request tags and resource tags applied to the resource identified by <code>instance snapshot name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateInstancesFromSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateInstancesFromSnapshotRequest
 @see AWSLightsailCreateInstancesFromSnapshotResult
 */
- (void)createInstancesFromSnapshot:(AWSLightsailCreateInstancesFromSnapshotRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailCreateInstancesFromSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an SSH key pair.</p><p>The <code>create key pair</code> operation supports tag-based access control via request tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateKeyPair service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailCreateKeyPairResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateKeyPairRequest
 @see AWSLightsailCreateKeyPairResult
 */
- (AWSTask<AWSLightsailCreateKeyPairResult *> *)createKeyPair:(AWSLightsailCreateKeyPairRequest *)request;

/**
 <p>Creates an SSH key pair.</p><p>The <code>create key pair</code> operation supports tag-based access control via request tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateKeyPair service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateKeyPairRequest
 @see AWSLightsailCreateKeyPairResult
 */
- (void)createKeyPair:(AWSLightsailCreateKeyPairRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailCreateKeyPairResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Lightsail load balancer. To learn more about deciding whether to load balance your application, see <a href="https://lightsail.aws.amazon.com/ls/docs/how-to/article/configure-lightsail-instances-for-load-balancing">Configure your Lightsail instances for load balancing</a>. You can create up to 5 load balancers per AWS Region in your account.</p><p>When you create a load balancer, you can specify a unique name and port settings. To change additional load balancer settings, use the <code>UpdateLoadBalancerAttribute</code> operation.</p><p>The <code>create load balancer</code> operation supports tag-based access control via request tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateLoadBalancer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailCreateLoadBalancerResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateLoadBalancerRequest
 @see AWSLightsailCreateLoadBalancerResult
 */
- (AWSTask<AWSLightsailCreateLoadBalancerResult *> *)createLoadBalancer:(AWSLightsailCreateLoadBalancerRequest *)request;

/**
 <p>Creates a Lightsail load balancer. To learn more about deciding whether to load balance your application, see <a href="https://lightsail.aws.amazon.com/ls/docs/how-to/article/configure-lightsail-instances-for-load-balancing">Configure your Lightsail instances for load balancing</a>. You can create up to 5 load balancers per AWS Region in your account.</p><p>When you create a load balancer, you can specify a unique name and port settings. To change additional load balancer settings, use the <code>UpdateLoadBalancerAttribute</code> operation.</p><p>The <code>create load balancer</code> operation supports tag-based access control via request tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateLoadBalancer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateLoadBalancerRequest
 @see AWSLightsailCreateLoadBalancerResult
 */
- (void)createLoadBalancer:(AWSLightsailCreateLoadBalancerRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailCreateLoadBalancerResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Lightsail load balancer TLS certificate.</p><p>TLS is just an updated, more secure version of Secure Socket Layer (SSL).</p><p>The <code>CreateLoadBalancerTlsCertificate</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>load balancer name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateLoadBalancerTlsCertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailCreateLoadBalancerTlsCertificateResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateLoadBalancerTlsCertificateRequest
 @see AWSLightsailCreateLoadBalancerTlsCertificateResult
 */
- (AWSTask<AWSLightsailCreateLoadBalancerTlsCertificateResult *> *)createLoadBalancerTlsCertificate:(AWSLightsailCreateLoadBalancerTlsCertificateRequest *)request;

/**
 <p>Creates a Lightsail load balancer TLS certificate.</p><p>TLS is just an updated, more secure version of Secure Socket Layer (SSL).</p><p>The <code>CreateLoadBalancerTlsCertificate</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>load balancer name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateLoadBalancerTlsCertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateLoadBalancerTlsCertificateRequest
 @see AWSLightsailCreateLoadBalancerTlsCertificateResult
 */
- (void)createLoadBalancerTlsCertificate:(AWSLightsailCreateLoadBalancerTlsCertificateRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailCreateLoadBalancerTlsCertificateResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new database in Amazon Lightsail.</p><p>The <code>create relational database</code> operation supports tag-based access control via request tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRelationalDatabase service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailCreateRelationalDatabaseResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateRelationalDatabaseRequest
 @see AWSLightsailCreateRelationalDatabaseResult
 */
- (AWSTask<AWSLightsailCreateRelationalDatabaseResult *> *)createRelationalDatabase:(AWSLightsailCreateRelationalDatabaseRequest *)request;

/**
 <p>Creates a new database in Amazon Lightsail.</p><p>The <code>create relational database</code> operation supports tag-based access control via request tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRelationalDatabase service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateRelationalDatabaseRequest
 @see AWSLightsailCreateRelationalDatabaseResult
 */
- (void)createRelationalDatabase:(AWSLightsailCreateRelationalDatabaseRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailCreateRelationalDatabaseResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new database from an existing database snapshot in Amazon Lightsail.</p><p>You can create a new database from a snapshot in if something goes wrong with your original database, or to change it to a different plan, such as a high availability or standard plan.</p><p>The <code>create relational database from snapshot</code> operation supports tag-based access control via request tags and resource tags applied to the resource identified by relationalDatabaseSnapshotName. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRelationalDatabaseFromSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailCreateRelationalDatabaseFromSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateRelationalDatabaseFromSnapshotRequest
 @see AWSLightsailCreateRelationalDatabaseFromSnapshotResult
 */
- (AWSTask<AWSLightsailCreateRelationalDatabaseFromSnapshotResult *> *)createRelationalDatabaseFromSnapshot:(AWSLightsailCreateRelationalDatabaseFromSnapshotRequest *)request;

/**
 <p>Creates a new database from an existing database snapshot in Amazon Lightsail.</p><p>You can create a new database from a snapshot in if something goes wrong with your original database, or to change it to a different plan, such as a high availability or standard plan.</p><p>The <code>create relational database from snapshot</code> operation supports tag-based access control via request tags and resource tags applied to the resource identified by relationalDatabaseSnapshotName. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRelationalDatabaseFromSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateRelationalDatabaseFromSnapshotRequest
 @see AWSLightsailCreateRelationalDatabaseFromSnapshotResult
 */
- (void)createRelationalDatabaseFromSnapshot:(AWSLightsailCreateRelationalDatabaseFromSnapshotRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailCreateRelationalDatabaseFromSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a snapshot of your database in Amazon Lightsail. You can use snapshots for backups, to make copies of a database, and to save data before deleting a database.</p><p>The <code>create relational database snapshot</code> operation supports tag-based access control via request tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRelationalDatabaseSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailCreateRelationalDatabaseSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateRelationalDatabaseSnapshotRequest
 @see AWSLightsailCreateRelationalDatabaseSnapshotResult
 */
- (AWSTask<AWSLightsailCreateRelationalDatabaseSnapshotResult *> *)createRelationalDatabaseSnapshot:(AWSLightsailCreateRelationalDatabaseSnapshotRequest *)request;

/**
 <p>Creates a snapshot of your database in Amazon Lightsail. You can use snapshots for backups, to make copies of a database, and to save data before deleting a database.</p><p>The <code>create relational database snapshot</code> operation supports tag-based access control via request tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRelationalDatabaseSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailCreateRelationalDatabaseSnapshotRequest
 @see AWSLightsailCreateRelationalDatabaseSnapshotResult
 */
- (void)createRelationalDatabaseSnapshot:(AWSLightsailCreateRelationalDatabaseSnapshotRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailCreateRelationalDatabaseSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an alarm.</p><p>An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms">Alarms in Amazon Lightsail</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAlarm service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailDeleteAlarmResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorUnauthenticated`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorNotFound`.
 
 @see AWSLightsailDeleteAlarmRequest
 @see AWSLightsailDeleteAlarmResult
 */
- (AWSTask<AWSLightsailDeleteAlarmResult *> *)deleteAlarm:(AWSLightsailDeleteAlarmRequest *)request;

/**
 <p>Deletes an alarm.</p><p>An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms">Alarms in Amazon Lightsail</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAlarm service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorUnauthenticated`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorNotFound`.
 
 @see AWSLightsailDeleteAlarmRequest
 @see AWSLightsailDeleteAlarmResult
 */
- (void)deleteAlarm:(AWSLightsailDeleteAlarmRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailDeleteAlarmResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an automatic snapshot of an instance or disk. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAutoSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailDeleteAutoSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteAutoSnapshotRequest
 @see AWSLightsailDeleteAutoSnapshotResult
 */
- (AWSTask<AWSLightsailDeleteAutoSnapshotResult *> *)deleteAutoSnapshot:(AWSLightsailDeleteAutoSnapshotRequest *)request;

/**
 <p>Deletes an automatic snapshot of an instance or disk. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAutoSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteAutoSnapshotRequest
 @see AWSLightsailDeleteAutoSnapshotResult
 */
- (void)deleteAutoSnapshot:(AWSLightsailDeleteAutoSnapshotRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailDeleteAutoSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a contact method.</p><p>A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each AWS Region. However, SMS text messaging is not supported in some AWS Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications">Notifications in Amazon Lightsail</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteContactMethod service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailDeleteContactMethodResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorUnauthenticated`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorNotFound`.
 
 @see AWSLightsailDeleteContactMethodRequest
 @see AWSLightsailDeleteContactMethodResult
 */
- (AWSTask<AWSLightsailDeleteContactMethodResult *> *)deleteContactMethod:(AWSLightsailDeleteContactMethodRequest *)request;

/**
 <p>Deletes a contact method.</p><p>A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each AWS Region. However, SMS text messaging is not supported in some AWS Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications">Notifications in Amazon Lightsail</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteContactMethod service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorUnauthenticated`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorNotFound`.
 
 @see AWSLightsailDeleteContactMethodRequest
 @see AWSLightsailDeleteContactMethodResult
 */
- (void)deleteContactMethod:(AWSLightsailDeleteContactMethodRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailDeleteContactMethodResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified block storage disk. The disk must be in the <code>available</code> state (not attached to a Lightsail instance).</p><note><p>The disk may remain in the <code>deleting</code> state for several minutes.</p></note><p>The <code>delete disk</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>disk name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDisk service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailDeleteDiskResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteDiskRequest
 @see AWSLightsailDeleteDiskResult
 */
- (AWSTask<AWSLightsailDeleteDiskResult *> *)deleteDisk:(AWSLightsailDeleteDiskRequest *)request;

/**
 <p>Deletes the specified block storage disk. The disk must be in the <code>available</code> state (not attached to a Lightsail instance).</p><note><p>The disk may remain in the <code>deleting</code> state for several minutes.</p></note><p>The <code>delete disk</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>disk name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDisk service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteDiskRequest
 @see AWSLightsailDeleteDiskResult
 */
- (void)deleteDisk:(AWSLightsailDeleteDiskRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailDeleteDiskResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified disk snapshot.</p><p>When you make periodic snapshots of a disk, the snapshots are incremental, and only the blocks on the device that have changed since your last snapshot are saved in the new snapshot. When you delete a snapshot, only the data not needed for any other snapshot is removed. So regardless of which prior snapshots have been deleted, all active snapshots will have access to all the information needed to restore the disk.</p><p>The <code>delete disk snapshot</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>disk snapshot name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDiskSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailDeleteDiskSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteDiskSnapshotRequest
 @see AWSLightsailDeleteDiskSnapshotResult
 */
- (AWSTask<AWSLightsailDeleteDiskSnapshotResult *> *)deleteDiskSnapshot:(AWSLightsailDeleteDiskSnapshotRequest *)request;

/**
 <p>Deletes the specified disk snapshot.</p><p>When you make periodic snapshots of a disk, the snapshots are incremental, and only the blocks on the device that have changed since your last snapshot are saved in the new snapshot. When you delete a snapshot, only the data not needed for any other snapshot is removed. So regardless of which prior snapshots have been deleted, all active snapshots will have access to all the information needed to restore the disk.</p><p>The <code>delete disk snapshot</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>disk snapshot name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDiskSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteDiskSnapshotRequest
 @see AWSLightsailDeleteDiskSnapshotResult
 */
- (void)deleteDiskSnapshot:(AWSLightsailDeleteDiskSnapshotRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailDeleteDiskSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified domain recordset and all of its domain records.</p><p>The <code>delete domain</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>domain name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailDeleteDomainResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteDomainRequest
 @see AWSLightsailDeleteDomainResult
 */
- (AWSTask<AWSLightsailDeleteDomainResult *> *)deleteDomain:(AWSLightsailDeleteDomainRequest *)request;

/**
 <p>Deletes the specified domain recordset and all of its domain records.</p><p>The <code>delete domain</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>domain name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteDomainRequest
 @see AWSLightsailDeleteDomainResult
 */
- (void)deleteDomain:(AWSLightsailDeleteDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailDeleteDomainResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specific domain entry.</p><p>The <code>delete domain entry</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>domain name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDomainEntry service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailDeleteDomainEntryResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteDomainEntryRequest
 @see AWSLightsailDeleteDomainEntryResult
 */
- (AWSTask<AWSLightsailDeleteDomainEntryResult *> *)deleteDomainEntry:(AWSLightsailDeleteDomainEntryRequest *)request;

/**
 <p>Deletes a specific domain entry.</p><p>The <code>delete domain entry</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>domain name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDomainEntry service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteDomainEntryRequest
 @see AWSLightsailDeleteDomainEntryResult
 */
- (void)deleteDomainEntry:(AWSLightsailDeleteDomainEntryRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailDeleteDomainEntryResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an Amazon Lightsail instance.</p><p>The <code>delete instance</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>instance name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailDeleteInstanceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteInstanceRequest
 @see AWSLightsailDeleteInstanceResult
 */
- (AWSTask<AWSLightsailDeleteInstanceResult *> *)deleteInstance:(AWSLightsailDeleteInstanceRequest *)request;

/**
 <p>Deletes an Amazon Lightsail instance.</p><p>The <code>delete instance</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>instance name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteInstanceRequest
 @see AWSLightsailDeleteInstanceResult
 */
- (void)deleteInstance:(AWSLightsailDeleteInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailDeleteInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specific snapshot of a virtual private server (or <i>instance</i>).</p><p>The <code>delete instance snapshot</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>instance snapshot name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInstanceSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailDeleteInstanceSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteInstanceSnapshotRequest
 @see AWSLightsailDeleteInstanceSnapshotResult
 */
- (AWSTask<AWSLightsailDeleteInstanceSnapshotResult *> *)deleteInstanceSnapshot:(AWSLightsailDeleteInstanceSnapshotRequest *)request;

/**
 <p>Deletes a specific snapshot of a virtual private server (or <i>instance</i>).</p><p>The <code>delete instance snapshot</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>instance snapshot name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInstanceSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteInstanceSnapshotRequest
 @see AWSLightsailDeleteInstanceSnapshotResult
 */
- (void)deleteInstanceSnapshot:(AWSLightsailDeleteInstanceSnapshotRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailDeleteInstanceSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specific SSH key pair.</p><p>The <code>delete key pair</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>key pair name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteKeyPair service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailDeleteKeyPairResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteKeyPairRequest
 @see AWSLightsailDeleteKeyPairResult
 */
- (AWSTask<AWSLightsailDeleteKeyPairResult *> *)deleteKeyPair:(AWSLightsailDeleteKeyPairRequest *)request;

/**
 <p>Deletes a specific SSH key pair.</p><p>The <code>delete key pair</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>key pair name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteKeyPair service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteKeyPairRequest
 @see AWSLightsailDeleteKeyPairResult
 */
- (void)deleteKeyPair:(AWSLightsailDeleteKeyPairRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailDeleteKeyPairResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the known host key or certificate used by the Amazon Lightsail browser-based SSH or RDP clients to authenticate an instance. This operation enables the Lightsail browser-based SSH or RDP clients to connect to the instance after a host key mismatch.</p><important><p>Perform this operation only if you were expecting the host key or certificate mismatch or if you are familiar with the new host key or certificate on the instance. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-troubleshooting-browser-based-ssh-rdp-client-connection">Troubleshooting connection issues when using the Amazon Lightsail browser-based SSH or RDP client</a>.</p></important>
 
 @param request A container for the necessary parameters to execute the DeleteKnownHostKeys service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailDeleteKnownHostKeysResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteKnownHostKeysRequest
 @see AWSLightsailDeleteKnownHostKeysResult
 */
- (AWSTask<AWSLightsailDeleteKnownHostKeysResult *> *)deleteKnownHostKeys:(AWSLightsailDeleteKnownHostKeysRequest *)request;

/**
 <p>Deletes the known host key or certificate used by the Amazon Lightsail browser-based SSH or RDP clients to authenticate an instance. This operation enables the Lightsail browser-based SSH or RDP clients to connect to the instance after a host key mismatch.</p><important><p>Perform this operation only if you were expecting the host key or certificate mismatch or if you are familiar with the new host key or certificate on the instance. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-troubleshooting-browser-based-ssh-rdp-client-connection">Troubleshooting connection issues when using the Amazon Lightsail browser-based SSH or RDP client</a>.</p></important>
 
 @param request A container for the necessary parameters to execute the DeleteKnownHostKeys service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteKnownHostKeysRequest
 @see AWSLightsailDeleteKnownHostKeysResult
 */
- (void)deleteKnownHostKeys:(AWSLightsailDeleteKnownHostKeysRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailDeleteKnownHostKeysResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a Lightsail load balancer and all its associated SSL/TLS certificates. Once the load balancer is deleted, you will need to create a new load balancer, create a new certificate, and verify domain ownership again.</p><p>The <code>delete load balancer</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>load balancer name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLoadBalancer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailDeleteLoadBalancerResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteLoadBalancerRequest
 @see AWSLightsailDeleteLoadBalancerResult
 */
- (AWSTask<AWSLightsailDeleteLoadBalancerResult *> *)deleteLoadBalancer:(AWSLightsailDeleteLoadBalancerRequest *)request;

/**
 <p>Deletes a Lightsail load balancer and all its associated SSL/TLS certificates. Once the load balancer is deleted, you will need to create a new load balancer, create a new certificate, and verify domain ownership again.</p><p>The <code>delete load balancer</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>load balancer name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLoadBalancer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteLoadBalancerRequest
 @see AWSLightsailDeleteLoadBalancerResult
 */
- (void)deleteLoadBalancer:(AWSLightsailDeleteLoadBalancerRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailDeleteLoadBalancerResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an SSL/TLS certificate associated with a Lightsail load balancer.</p><p>The <code>DeleteLoadBalancerTlsCertificate</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>load balancer name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLoadBalancerTlsCertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailDeleteLoadBalancerTlsCertificateResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteLoadBalancerTlsCertificateRequest
 @see AWSLightsailDeleteLoadBalancerTlsCertificateResult
 */
- (AWSTask<AWSLightsailDeleteLoadBalancerTlsCertificateResult *> *)deleteLoadBalancerTlsCertificate:(AWSLightsailDeleteLoadBalancerTlsCertificateRequest *)request;

/**
 <p>Deletes an SSL/TLS certificate associated with a Lightsail load balancer.</p><p>The <code>DeleteLoadBalancerTlsCertificate</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>load balancer name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLoadBalancerTlsCertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteLoadBalancerTlsCertificateRequest
 @see AWSLightsailDeleteLoadBalancerTlsCertificateResult
 */
- (void)deleteLoadBalancerTlsCertificate:(AWSLightsailDeleteLoadBalancerTlsCertificateRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailDeleteLoadBalancerTlsCertificateResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a database in Amazon Lightsail.</p><p>The <code>delete relational database</code> operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRelationalDatabase service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailDeleteRelationalDatabaseResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteRelationalDatabaseRequest
 @see AWSLightsailDeleteRelationalDatabaseResult
 */
- (AWSTask<AWSLightsailDeleteRelationalDatabaseResult *> *)deleteRelationalDatabase:(AWSLightsailDeleteRelationalDatabaseRequest *)request;

/**
 <p>Deletes a database in Amazon Lightsail.</p><p>The <code>delete relational database</code> operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRelationalDatabase service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteRelationalDatabaseRequest
 @see AWSLightsailDeleteRelationalDatabaseResult
 */
- (void)deleteRelationalDatabase:(AWSLightsailDeleteRelationalDatabaseRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailDeleteRelationalDatabaseResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a database snapshot in Amazon Lightsail.</p><p>The <code>delete relational database snapshot</code> operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRelationalDatabaseSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailDeleteRelationalDatabaseSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteRelationalDatabaseSnapshotRequest
 @see AWSLightsailDeleteRelationalDatabaseSnapshotResult
 */
- (AWSTask<AWSLightsailDeleteRelationalDatabaseSnapshotResult *> *)deleteRelationalDatabaseSnapshot:(AWSLightsailDeleteRelationalDatabaseSnapshotRequest *)request;

/**
 <p>Deletes a database snapshot in Amazon Lightsail.</p><p>The <code>delete relational database snapshot</code> operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRelationalDatabaseSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDeleteRelationalDatabaseSnapshotRequest
 @see AWSLightsailDeleteRelationalDatabaseSnapshotResult
 */
- (void)deleteRelationalDatabaseSnapshot:(AWSLightsailDeleteRelationalDatabaseSnapshotRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailDeleteRelationalDatabaseSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detaches a stopped block storage disk from a Lightsail instance. Make sure to unmount any file systems on the device within your operating system before stopping the instance and detaching the disk.</p><p>The <code>detach disk</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>disk name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DetachDisk service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailDetachDiskResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDetachDiskRequest
 @see AWSLightsailDetachDiskResult
 */
- (AWSTask<AWSLightsailDetachDiskResult *> *)detachDisk:(AWSLightsailDetachDiskRequest *)request;

/**
 <p>Detaches a stopped block storage disk from a Lightsail instance. Make sure to unmount any file systems on the device within your operating system before stopping the instance and detaching the disk.</p><p>The <code>detach disk</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>disk name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DetachDisk service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDetachDiskRequest
 @see AWSLightsailDetachDiskResult
 */
- (void)detachDisk:(AWSLightsailDetachDiskRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailDetachDiskResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detaches the specified instances from a Lightsail load balancer.</p><p>This operation waits until the instances are no longer needed before they are detached from the load balancer.</p><p>The <code>detach instances from load balancer</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>load balancer name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DetachInstancesFromLoadBalancer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailDetachInstancesFromLoadBalancerResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDetachInstancesFromLoadBalancerRequest
 @see AWSLightsailDetachInstancesFromLoadBalancerResult
 */
- (AWSTask<AWSLightsailDetachInstancesFromLoadBalancerResult *> *)detachInstancesFromLoadBalancer:(AWSLightsailDetachInstancesFromLoadBalancerRequest *)request;

/**
 <p>Detaches the specified instances from a Lightsail load balancer.</p><p>This operation waits until the instances are no longer needed before they are detached from the load balancer.</p><p>The <code>detach instances from load balancer</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>load balancer name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DetachInstancesFromLoadBalancer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDetachInstancesFromLoadBalancerRequest
 @see AWSLightsailDetachInstancesFromLoadBalancerResult
 */
- (void)detachInstancesFromLoadBalancer:(AWSLightsailDetachInstancesFromLoadBalancerRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailDetachInstancesFromLoadBalancerResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detaches a static IP from the Amazon Lightsail instance to which it is attached.</p>
 
 @param request A container for the necessary parameters to execute the DetachStaticIp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailDetachStaticIpResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDetachStaticIpRequest
 @see AWSLightsailDetachStaticIpResult
 */
- (AWSTask<AWSLightsailDetachStaticIpResult *> *)detachStaticIp:(AWSLightsailDetachStaticIpRequest *)request;

/**
 <p>Detaches a static IP from the Amazon Lightsail instance to which it is attached.</p>
 
 @param request A container for the necessary parameters to execute the DetachStaticIp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDetachStaticIpRequest
 @see AWSLightsailDetachStaticIpResult
 */
- (void)detachStaticIp:(AWSLightsailDetachStaticIpRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailDetachStaticIpResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables an add-on for an Amazon Lightsail resource. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DisableAddOn service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailDisableAddOnResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDisableAddOnRequest
 @see AWSLightsailDisableAddOnResult
 */
- (AWSTask<AWSLightsailDisableAddOnResult *> *)disableAddOn:(AWSLightsailDisableAddOnRequest *)request;

/**
 <p>Disables an add-on for an Amazon Lightsail resource. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the DisableAddOn service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDisableAddOnRequest
 @see AWSLightsailDisableAddOnResult
 */
- (void)disableAddOn:(AWSLightsailDisableAddOnRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailDisableAddOnResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Downloads the default SSH key pair from the user's account.</p>
 
 @param request A container for the necessary parameters to execute the DownloadDefaultKeyPair service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailDownloadDefaultKeyPairResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDownloadDefaultKeyPairRequest
 @see AWSLightsailDownloadDefaultKeyPairResult
 */
- (AWSTask<AWSLightsailDownloadDefaultKeyPairResult *> *)downloadDefaultKeyPair:(AWSLightsailDownloadDefaultKeyPairRequest *)request;

/**
 <p>Downloads the default SSH key pair from the user's account.</p>
 
 @param request A container for the necessary parameters to execute the DownloadDefaultKeyPair service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailDownloadDefaultKeyPairRequest
 @see AWSLightsailDownloadDefaultKeyPairResult
 */
- (void)downloadDefaultKeyPair:(AWSLightsailDownloadDefaultKeyPairRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailDownloadDefaultKeyPairResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables or modifies an add-on for an Amazon Lightsail resource. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the EnableAddOn service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailEnableAddOnResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailEnableAddOnRequest
 @see AWSLightsailEnableAddOnResult
 */
- (AWSTask<AWSLightsailEnableAddOnResult *> *)enableAddOn:(AWSLightsailEnableAddOnRequest *)request;

/**
 <p>Enables or modifies an add-on for an Amazon Lightsail resource. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the EnableAddOn service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailEnableAddOnRequest
 @see AWSLightsailEnableAddOnResult
 */
- (void)enableAddOn:(AWSLightsailEnableAddOnRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailEnableAddOnResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Exports an Amazon Lightsail instance or block storage disk snapshot to Amazon Elastic Compute Cloud (Amazon EC2). This operation results in an export snapshot record that can be used with the <code>create cloud formation stack</code> operation to create new Amazon EC2 instances.</p><p>Exported instance snapshots appear in Amazon EC2 as Amazon Machine Images (AMIs), and the instance system disk appears as an Amazon Elastic Block Store (Amazon EBS) volume. Exported disk snapshots appear in Amazon EC2 as Amazon EBS volumes. Snapshots are exported to the same Amazon Web Services Region in Amazon EC2 as the source Lightsail snapshot.</p><p/><p>The <code>export snapshot</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>source snapshot name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p><note><p>Use the <code>get instance snapshots</code> or <code>get disk snapshots</code> operations to get a list of snapshots that you can export to Amazon EC2.</p></note>
 
 @param request A container for the necessary parameters to execute the ExportSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailExportSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailExportSnapshotRequest
 @see AWSLightsailExportSnapshotResult
 */
- (AWSTask<AWSLightsailExportSnapshotResult *> *)exportSnapshot:(AWSLightsailExportSnapshotRequest *)request;

/**
 <p>Exports an Amazon Lightsail instance or block storage disk snapshot to Amazon Elastic Compute Cloud (Amazon EC2). This operation results in an export snapshot record that can be used with the <code>create cloud formation stack</code> operation to create new Amazon EC2 instances.</p><p>Exported instance snapshots appear in Amazon EC2 as Amazon Machine Images (AMIs), and the instance system disk appears as an Amazon Elastic Block Store (Amazon EBS) volume. Exported disk snapshots appear in Amazon EC2 as Amazon EBS volumes. Snapshots are exported to the same Amazon Web Services Region in Amazon EC2 as the source Lightsail snapshot.</p><p/><p>The <code>export snapshot</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>source snapshot name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p><note><p>Use the <code>get instance snapshots</code> or <code>get disk snapshots</code> operations to get a list of snapshots that you can export to Amazon EC2.</p></note>
 
 @param request A container for the necessary parameters to execute the ExportSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailExportSnapshotRequest
 @see AWSLightsailExportSnapshotResult
 */
- (void)exportSnapshot:(AWSLightsailExportSnapshotRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailExportSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the names of all active (not deleted) resources.</p>
 
 @param request A container for the necessary parameters to execute the GetActiveNames service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetActiveNamesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetActiveNamesRequest
 @see AWSLightsailGetActiveNamesResult
 */
- (AWSTask<AWSLightsailGetActiveNamesResult *> *)getActiveNames:(AWSLightsailGetActiveNamesRequest *)request;

/**
 <p>Returns the names of all active (not deleted) resources.</p>
 
 @param request A container for the necessary parameters to execute the GetActiveNames service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetActiveNamesRequest
 @see AWSLightsailGetActiveNamesResult
 */
- (void)getActiveNames:(AWSLightsailGetActiveNamesRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetActiveNamesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the configured alarms. Specify an alarm name in your request to return information about a specific alarm, or specify a monitored resource name to return information about all alarms for a specific resource.</p><p>An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms">Alarms in Amazon Lightsail</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetAlarms service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetAlarmsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorUnauthenticated`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorNotFound`.
 
 @see AWSLightsailGetAlarmsRequest
 @see AWSLightsailGetAlarmsResult
 */
- (AWSTask<AWSLightsailGetAlarmsResult *> *)getAlarms:(AWSLightsailGetAlarmsRequest *)request;

/**
 <p>Returns information about the configured alarms. Specify an alarm name in your request to return information about a specific alarm, or specify a monitored resource name to return information about all alarms for a specific resource.</p><p>An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms">Alarms in Amazon Lightsail</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetAlarms service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorUnauthenticated`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorNotFound`.
 
 @see AWSLightsailGetAlarmsRequest
 @see AWSLightsailGetAlarmsResult
 */
- (void)getAlarms:(AWSLightsailGetAlarmsRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetAlarmsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the available automatic snapshots for an instance or disk. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetAutoSnapshots service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetAutoSnapshotsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetAutoSnapshotsRequest
 @see AWSLightsailGetAutoSnapshotsResult
 */
- (AWSTask<AWSLightsailGetAutoSnapshotsResult *> *)getAutoSnapshots:(AWSLightsailGetAutoSnapshotsRequest *)request;

/**
 <p>Returns the available automatic snapshots for an instance or disk. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetAutoSnapshots service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetAutoSnapshotsRequest
 @see AWSLightsailGetAutoSnapshotsResult
 */
- (void)getAutoSnapshots:(AWSLightsailGetAutoSnapshotsRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetAutoSnapshotsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the list of available instance images, or <i>blueprints</i>. You can use a blueprint to create a new instance already running a specific operating system, as well as a preinstalled app or development stack. The software each instance is running depends on the blueprint image you choose.</p><note><p>Use active blueprints when creating new instances. Inactive blueprints are listed to support customers with existing instances and are not necessarily available to create new instances. Blueprints are marked inactive when they become outdated due to operating system updates or new application releases.</p></note>
 
 @param request A container for the necessary parameters to execute the GetBlueprints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetBlueprintsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetBlueprintsRequest
 @see AWSLightsailGetBlueprintsResult
 */
- (AWSTask<AWSLightsailGetBlueprintsResult *> *)getBlueprints:(AWSLightsailGetBlueprintsRequest *)request;

/**
 <p>Returns the list of available instance images, or <i>blueprints</i>. You can use a blueprint to create a new instance already running a specific operating system, as well as a preinstalled app or development stack. The software each instance is running depends on the blueprint image you choose.</p><note><p>Use active blueprints when creating new instances. Inactive blueprints are listed to support customers with existing instances and are not necessarily available to create new instances. Blueprints are marked inactive when they become outdated due to operating system updates or new application releases.</p></note>
 
 @param request A container for the necessary parameters to execute the GetBlueprints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetBlueprintsRequest
 @see AWSLightsailGetBlueprintsResult
 */
- (void)getBlueprints:(AWSLightsailGetBlueprintsRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetBlueprintsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the list of bundles that are available for purchase. A bundle describes the specs for your virtual private server (or <i>instance</i>).</p>
 
 @param request A container for the necessary parameters to execute the GetBundles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetBundlesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetBundlesRequest
 @see AWSLightsailGetBundlesResult
 */
- (AWSTask<AWSLightsailGetBundlesResult *> *)getBundles:(AWSLightsailGetBundlesRequest *)request;

/**
 <p>Returns the list of bundles that are available for purchase. A bundle describes the specs for your virtual private server (or <i>instance</i>).</p>
 
 @param request A container for the necessary parameters to execute the GetBundles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetBundlesRequest
 @see AWSLightsailGetBundlesResult
 */
- (void)getBundles:(AWSLightsailGetBundlesRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetBundlesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the CloudFormation stack record created as a result of the <code>create cloud formation stack</code> operation.</p><p>An AWS CloudFormation stack is used to create a new Amazon EC2 instance from an exported Lightsail snapshot.</p>
 
 @param request A container for the necessary parameters to execute the GetCloudFormationStackRecords service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetCloudFormationStackRecordsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetCloudFormationStackRecordsRequest
 @see AWSLightsailGetCloudFormationStackRecordsResult
 */
- (AWSTask<AWSLightsailGetCloudFormationStackRecordsResult *> *)getCloudFormationStackRecords:(AWSLightsailGetCloudFormationStackRecordsRequest *)request;

/**
 <p>Returns the CloudFormation stack record created as a result of the <code>create cloud formation stack</code> operation.</p><p>An AWS CloudFormation stack is used to create a new Amazon EC2 instance from an exported Lightsail snapshot.</p>
 
 @param request A container for the necessary parameters to execute the GetCloudFormationStackRecords service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetCloudFormationStackRecordsRequest
 @see AWSLightsailGetCloudFormationStackRecordsResult
 */
- (void)getCloudFormationStackRecords:(AWSLightsailGetCloudFormationStackRecordsRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetCloudFormationStackRecordsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the configured contact methods. Specify a protocol in your request to return information about a specific contact method.</p><p>A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each AWS Region. However, SMS text messaging is not supported in some AWS Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications">Notifications in Amazon Lightsail</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetContactMethods service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetContactMethodsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetContactMethodsRequest
 @see AWSLightsailGetContactMethodsResult
 */
- (AWSTask<AWSLightsailGetContactMethodsResult *> *)getContactMethods:(AWSLightsailGetContactMethodsRequest *)request;

/**
 <p>Returns information about the configured contact methods. Specify a protocol in your request to return information about a specific contact method.</p><p>A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each AWS Region. However, SMS text messaging is not supported in some AWS Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications">Notifications in Amazon Lightsail</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetContactMethods service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetContactMethodsRequest
 @see AWSLightsailGetContactMethodsResult
 */
- (void)getContactMethods:(AWSLightsailGetContactMethodsRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetContactMethodsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a specific block storage disk.</p>
 
 @param request A container for the necessary parameters to execute the GetDisk service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetDiskResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetDiskRequest
 @see AWSLightsailGetDiskResult
 */
- (AWSTask<AWSLightsailGetDiskResult *> *)getDisk:(AWSLightsailGetDiskRequest *)request;

/**
 <p>Returns information about a specific block storage disk.</p>
 
 @param request A container for the necessary parameters to execute the GetDisk service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetDiskRequest
 @see AWSLightsailGetDiskResult
 */
- (void)getDisk:(AWSLightsailGetDiskRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetDiskResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a specific block storage disk snapshot.</p>
 
 @param request A container for the necessary parameters to execute the GetDiskSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetDiskSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetDiskSnapshotRequest
 @see AWSLightsailGetDiskSnapshotResult
 */
- (AWSTask<AWSLightsailGetDiskSnapshotResult *> *)getDiskSnapshot:(AWSLightsailGetDiskSnapshotRequest *)request;

/**
 <p>Returns information about a specific block storage disk snapshot.</p>
 
 @param request A container for the necessary parameters to execute the GetDiskSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetDiskSnapshotRequest
 @see AWSLightsailGetDiskSnapshotResult
 */
- (void)getDiskSnapshot:(AWSLightsailGetDiskSnapshotRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetDiskSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about all block storage disk snapshots in your AWS account and region.</p>
 
 @param request A container for the necessary parameters to execute the GetDiskSnapshots service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetDiskSnapshotsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetDiskSnapshotsRequest
 @see AWSLightsailGetDiskSnapshotsResult
 */
- (AWSTask<AWSLightsailGetDiskSnapshotsResult *> *)getDiskSnapshots:(AWSLightsailGetDiskSnapshotsRequest *)request;

/**
 <p>Returns information about all block storage disk snapshots in your AWS account and region.</p>
 
 @param request A container for the necessary parameters to execute the GetDiskSnapshots service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetDiskSnapshotsRequest
 @see AWSLightsailGetDiskSnapshotsResult
 */
- (void)getDiskSnapshots:(AWSLightsailGetDiskSnapshotsRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetDiskSnapshotsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about all block storage disks in your AWS account and region.</p>
 
 @param request A container for the necessary parameters to execute the GetDisks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetDisksResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetDisksRequest
 @see AWSLightsailGetDisksResult
 */
- (AWSTask<AWSLightsailGetDisksResult *> *)getDisks:(AWSLightsailGetDisksRequest *)request;

/**
 <p>Returns information about all block storage disks in your AWS account and region.</p>
 
 @param request A container for the necessary parameters to execute the GetDisks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetDisksRequest
 @see AWSLightsailGetDisksResult
 */
- (void)getDisks:(AWSLightsailGetDisksRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetDisksResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a specific domain recordset.</p>
 
 @param request A container for the necessary parameters to execute the GetDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetDomainResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetDomainRequest
 @see AWSLightsailGetDomainResult
 */
- (AWSTask<AWSLightsailGetDomainResult *> *)getDomain:(AWSLightsailGetDomainRequest *)request;

/**
 <p>Returns information about a specific domain recordset.</p>
 
 @param request A container for the necessary parameters to execute the GetDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetDomainRequest
 @see AWSLightsailGetDomainResult
 */
- (void)getDomain:(AWSLightsailGetDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetDomainResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of all domains in the user's account.</p>
 
 @param request A container for the necessary parameters to execute the GetDomains service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetDomainsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetDomainsRequest
 @see AWSLightsailGetDomainsResult
 */
- (AWSTask<AWSLightsailGetDomainsResult *> *)getDomains:(AWSLightsailGetDomainsRequest *)request;

/**
 <p>Returns a list of all domains in the user's account.</p>
 
 @param request A container for the necessary parameters to execute the GetDomains service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetDomainsRequest
 @see AWSLightsailGetDomainsResult
 */
- (void)getDomains:(AWSLightsailGetDomainsRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetDomainsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the export snapshot record created as a result of the <code>export snapshot</code> operation.</p><p>An export snapshot record can be used to create a new Amazon EC2 instance and its related resources with the <code>create cloud formation stack</code> operation.</p>
 
 @param request A container for the necessary parameters to execute the GetExportSnapshotRecords service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetExportSnapshotRecordsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetExportSnapshotRecordsRequest
 @see AWSLightsailGetExportSnapshotRecordsResult
 */
- (AWSTask<AWSLightsailGetExportSnapshotRecordsResult *> *)getExportSnapshotRecords:(AWSLightsailGetExportSnapshotRecordsRequest *)request;

/**
 <p>Returns the export snapshot record created as a result of the <code>export snapshot</code> operation.</p><p>An export snapshot record can be used to create a new Amazon EC2 instance and its related resources with the <code>create cloud formation stack</code> operation.</p>
 
 @param request A container for the necessary parameters to execute the GetExportSnapshotRecords service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetExportSnapshotRecordsRequest
 @see AWSLightsailGetExportSnapshotRecordsResult
 */
- (void)getExportSnapshotRecords:(AWSLightsailGetExportSnapshotRecordsRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetExportSnapshotRecordsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a specific Amazon Lightsail instance, which is a virtual private server.</p>
 
 @param request A container for the necessary parameters to execute the GetInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetInstanceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetInstanceRequest
 @see AWSLightsailGetInstanceResult
 */
- (AWSTask<AWSLightsailGetInstanceResult *> *)getInstance:(AWSLightsailGetInstanceRequest *)request;

/**
 <p>Returns information about a specific Amazon Lightsail instance, which is a virtual private server.</p>
 
 @param request A container for the necessary parameters to execute the GetInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetInstanceRequest
 @see AWSLightsailGetInstanceResult
 */
- (void)getInstance:(AWSLightsailGetInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns temporary SSH keys you can use to connect to a specific virtual private server, or <i>instance</i>.</p><p>The <code>get instance access details</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>instance name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetInstanceAccessDetails service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetInstanceAccessDetailsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetInstanceAccessDetailsRequest
 @see AWSLightsailGetInstanceAccessDetailsResult
 */
- (AWSTask<AWSLightsailGetInstanceAccessDetailsResult *> *)getInstanceAccessDetails:(AWSLightsailGetInstanceAccessDetailsRequest *)request;

/**
 <p>Returns temporary SSH keys you can use to connect to a specific virtual private server, or <i>instance</i>.</p><p>The <code>get instance access details</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>instance name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetInstanceAccessDetails service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetInstanceAccessDetailsRequest
 @see AWSLightsailGetInstanceAccessDetailsResult
 */
- (void)getInstanceAccessDetails:(AWSLightsailGetInstanceAccessDetailsRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetInstanceAccessDetailsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the data points for the specified Amazon Lightsail instance metric, given an instance name.</p>
 
 @param request A container for the necessary parameters to execute the GetInstanceMetricData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetInstanceMetricDataResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetInstanceMetricDataRequest
 @see AWSLightsailGetInstanceMetricDataResult
 */
- (AWSTask<AWSLightsailGetInstanceMetricDataResult *> *)getInstanceMetricData:(AWSLightsailGetInstanceMetricDataRequest *)request;

/**
 <p>Returns the data points for the specified Amazon Lightsail instance metric, given an instance name.</p>
 
 @param request A container for the necessary parameters to execute the GetInstanceMetricData service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetInstanceMetricDataRequest
 @see AWSLightsailGetInstanceMetricDataResult
 */
- (void)getInstanceMetricData:(AWSLightsailGetInstanceMetricDataRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetInstanceMetricDataResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the firewall port states for a specific Amazon Lightsail instance, the IP addresses allowed to connect to the instance through the ports, and the protocol.</p>
 
 @param request A container for the necessary parameters to execute the GetInstancePortStates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetInstancePortStatesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetInstancePortStatesRequest
 @see AWSLightsailGetInstancePortStatesResult
 */
- (AWSTask<AWSLightsailGetInstancePortStatesResult *> *)getInstancePortStates:(AWSLightsailGetInstancePortStatesRequest *)request;

/**
 <p>Returns the firewall port states for a specific Amazon Lightsail instance, the IP addresses allowed to connect to the instance through the ports, and the protocol.</p>
 
 @param request A container for the necessary parameters to execute the GetInstancePortStates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetInstancePortStatesRequest
 @see AWSLightsailGetInstancePortStatesResult
 */
- (void)getInstancePortStates:(AWSLightsailGetInstancePortStatesRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetInstancePortStatesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a specific instance snapshot.</p>
 
 @param request A container for the necessary parameters to execute the GetInstanceSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetInstanceSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetInstanceSnapshotRequest
 @see AWSLightsailGetInstanceSnapshotResult
 */
- (AWSTask<AWSLightsailGetInstanceSnapshotResult *> *)getInstanceSnapshot:(AWSLightsailGetInstanceSnapshotRequest *)request;

/**
 <p>Returns information about a specific instance snapshot.</p>
 
 @param request A container for the necessary parameters to execute the GetInstanceSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetInstanceSnapshotRequest
 @see AWSLightsailGetInstanceSnapshotResult
 */
- (void)getInstanceSnapshot:(AWSLightsailGetInstanceSnapshotRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetInstanceSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns all instance snapshots for the user's account.</p>
 
 @param request A container for the necessary parameters to execute the GetInstanceSnapshots service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetInstanceSnapshotsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetInstanceSnapshotsRequest
 @see AWSLightsailGetInstanceSnapshotsResult
 */
- (AWSTask<AWSLightsailGetInstanceSnapshotsResult *> *)getInstanceSnapshots:(AWSLightsailGetInstanceSnapshotsRequest *)request;

/**
 <p>Returns all instance snapshots for the user's account.</p>
 
 @param request A container for the necessary parameters to execute the GetInstanceSnapshots service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetInstanceSnapshotsRequest
 @see AWSLightsailGetInstanceSnapshotsResult
 */
- (void)getInstanceSnapshots:(AWSLightsailGetInstanceSnapshotsRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetInstanceSnapshotsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the state of a specific instance. Works on one instance at a time.</p>
 
 @param request A container for the necessary parameters to execute the GetInstanceState service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetInstanceStateResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetInstanceStateRequest
 @see AWSLightsailGetInstanceStateResult
 */
- (AWSTask<AWSLightsailGetInstanceStateResult *> *)getInstanceState:(AWSLightsailGetInstanceStateRequest *)request;

/**
 <p>Returns the state of a specific instance. Works on one instance at a time.</p>
 
 @param request A container for the necessary parameters to execute the GetInstanceState service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetInstanceStateRequest
 @see AWSLightsailGetInstanceStateResult
 */
- (void)getInstanceState:(AWSLightsailGetInstanceStateRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetInstanceStateResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about all Amazon Lightsail virtual private servers, or <i>instances</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetInstancesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetInstancesRequest
 @see AWSLightsailGetInstancesResult
 */
- (AWSTask<AWSLightsailGetInstancesResult *> *)getInstances:(AWSLightsailGetInstancesRequest *)request;

/**
 <p>Returns information about all Amazon Lightsail virtual private servers, or <i>instances</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetInstancesRequest
 @see AWSLightsailGetInstancesResult
 */
- (void)getInstances:(AWSLightsailGetInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a specific key pair.</p>
 
 @param request A container for the necessary parameters to execute the GetKeyPair service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetKeyPairResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetKeyPairRequest
 @see AWSLightsailGetKeyPairResult
 */
- (AWSTask<AWSLightsailGetKeyPairResult *> *)getKeyPair:(AWSLightsailGetKeyPairRequest *)request;

/**
 <p>Returns information about a specific key pair.</p>
 
 @param request A container for the necessary parameters to execute the GetKeyPair service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetKeyPairRequest
 @see AWSLightsailGetKeyPairResult
 */
- (void)getKeyPair:(AWSLightsailGetKeyPairRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetKeyPairResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about all key pairs in the user's account.</p>
 
 @param request A container for the necessary parameters to execute the GetKeyPairs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetKeyPairsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetKeyPairsRequest
 @see AWSLightsailGetKeyPairsResult
 */
- (AWSTask<AWSLightsailGetKeyPairsResult *> *)getKeyPairs:(AWSLightsailGetKeyPairsRequest *)request;

/**
 <p>Returns information about all key pairs in the user's account.</p>
 
 @param request A container for the necessary parameters to execute the GetKeyPairs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetKeyPairsRequest
 @see AWSLightsailGetKeyPairsResult
 */
- (void)getKeyPairs:(AWSLightsailGetKeyPairsRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetKeyPairsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the specified Lightsail load balancer.</p>
 
 @param request A container for the necessary parameters to execute the GetLoadBalancer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetLoadBalancerResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetLoadBalancerRequest
 @see AWSLightsailGetLoadBalancerResult
 */
- (AWSTask<AWSLightsailGetLoadBalancerResult *> *)getLoadBalancer:(AWSLightsailGetLoadBalancerRequest *)request;

/**
 <p>Returns information about the specified Lightsail load balancer.</p>
 
 @param request A container for the necessary parameters to execute the GetLoadBalancer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetLoadBalancerRequest
 @see AWSLightsailGetLoadBalancerResult
 */
- (void)getLoadBalancer:(AWSLightsailGetLoadBalancerRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetLoadBalancerResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about health metrics for your Lightsail load balancer.</p>
 
 @param request A container for the necessary parameters to execute the GetLoadBalancerMetricData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetLoadBalancerMetricDataResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetLoadBalancerMetricDataRequest
 @see AWSLightsailGetLoadBalancerMetricDataResult
 */
- (AWSTask<AWSLightsailGetLoadBalancerMetricDataResult *> *)getLoadBalancerMetricData:(AWSLightsailGetLoadBalancerMetricDataRequest *)request;

/**
 <p>Returns information about health metrics for your Lightsail load balancer.</p>
 
 @param request A container for the necessary parameters to execute the GetLoadBalancerMetricData service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetLoadBalancerMetricDataRequest
 @see AWSLightsailGetLoadBalancerMetricDataResult
 */
- (void)getLoadBalancerMetricData:(AWSLightsailGetLoadBalancerMetricDataRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetLoadBalancerMetricDataResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the TLS certificates that are associated with the specified Lightsail load balancer.</p><p>TLS is just an updated, more secure version of Secure Socket Layer (SSL).</p><p>You can have a maximum of 2 certificates associated with a Lightsail load balancer. One is active and the other is inactive.</p>
 
 @param request A container for the necessary parameters to execute the GetLoadBalancerTlsCertificates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetLoadBalancerTlsCertificatesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetLoadBalancerTlsCertificatesRequest
 @see AWSLightsailGetLoadBalancerTlsCertificatesResult
 */
- (AWSTask<AWSLightsailGetLoadBalancerTlsCertificatesResult *> *)getLoadBalancerTlsCertificates:(AWSLightsailGetLoadBalancerTlsCertificatesRequest *)request;

/**
 <p>Returns information about the TLS certificates that are associated with the specified Lightsail load balancer.</p><p>TLS is just an updated, more secure version of Secure Socket Layer (SSL).</p><p>You can have a maximum of 2 certificates associated with a Lightsail load balancer. One is active and the other is inactive.</p>
 
 @param request A container for the necessary parameters to execute the GetLoadBalancerTlsCertificates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetLoadBalancerTlsCertificatesRequest
 @see AWSLightsailGetLoadBalancerTlsCertificatesResult
 */
- (void)getLoadBalancerTlsCertificates:(AWSLightsailGetLoadBalancerTlsCertificatesRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetLoadBalancerTlsCertificatesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about all load balancers in an account.</p>
 
 @param request A container for the necessary parameters to execute the GetLoadBalancers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetLoadBalancersResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetLoadBalancersRequest
 @see AWSLightsailGetLoadBalancersResult
 */
- (AWSTask<AWSLightsailGetLoadBalancersResult *> *)getLoadBalancers:(AWSLightsailGetLoadBalancersRequest *)request;

/**
 <p>Returns information about all load balancers in an account.</p>
 
 @param request A container for the necessary parameters to execute the GetLoadBalancers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetLoadBalancersRequest
 @see AWSLightsailGetLoadBalancersResult
 */
- (void)getLoadBalancers:(AWSLightsailGetLoadBalancersRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetLoadBalancersResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a specific operation. Operations include events such as when you create an instance, allocate a static IP, attach a static IP, and so on.</p>
 
 @param request A container for the necessary parameters to execute the GetOperation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetOperationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetOperationRequest
 @see AWSLightsailGetOperationResult
 */
- (AWSTask<AWSLightsailGetOperationResult *> *)getOperation:(AWSLightsailGetOperationRequest *)request;

/**
 <p>Returns information about a specific operation. Operations include events such as when you create an instance, allocate a static IP, attach a static IP, and so on.</p>
 
 @param request A container for the necessary parameters to execute the GetOperation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetOperationRequest
 @see AWSLightsailGetOperationResult
 */
- (void)getOperation:(AWSLightsailGetOperationRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetOperationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about all operations.</p><p>Results are returned from oldest to newest, up to a maximum of 200. Results can be paged by making each subsequent call to <code>GetOperations</code> use the maximum (last) <code>statusChangedAt</code> value from the previous request.</p>
 
 @param request A container for the necessary parameters to execute the GetOperations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetOperationsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetOperationsRequest
 @see AWSLightsailGetOperationsResult
 */
- (AWSTask<AWSLightsailGetOperationsResult *> *)getOperations:(AWSLightsailGetOperationsRequest *)request;

/**
 <p>Returns information about all operations.</p><p>Results are returned from oldest to newest, up to a maximum of 200. Results can be paged by making each subsequent call to <code>GetOperations</code> use the maximum (last) <code>statusChangedAt</code> value from the previous request.</p>
 
 @param request A container for the necessary parameters to execute the GetOperations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetOperationsRequest
 @see AWSLightsailGetOperationsResult
 */
- (void)getOperations:(AWSLightsailGetOperationsRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetOperationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets operations for a specific resource (e.g., an instance or a static IP).</p>
 
 @param request A container for the necessary parameters to execute the GetOperationsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetOperationsForResourceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetOperationsForResourceRequest
 @see AWSLightsailGetOperationsForResourceResult
 */
- (AWSTask<AWSLightsailGetOperationsForResourceResult *> *)getOperationsForResource:(AWSLightsailGetOperationsForResourceRequest *)request;

/**
 <p>Gets operations for a specific resource (e.g., an instance or a static IP).</p>
 
 @param request A container for the necessary parameters to execute the GetOperationsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetOperationsForResourceRequest
 @see AWSLightsailGetOperationsForResourceResult
 */
- (void)getOperationsForResource:(AWSLightsailGetOperationsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetOperationsForResourceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of all valid regions for Amazon Lightsail. Use the <code>include availability zones</code> parameter to also return the Availability Zones in a region.</p>
 
 @param request A container for the necessary parameters to execute the GetRegions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetRegionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRegionsRequest
 @see AWSLightsailGetRegionsResult
 */
- (AWSTask<AWSLightsailGetRegionsResult *> *)getRegions:(AWSLightsailGetRegionsRequest *)request;

/**
 <p>Returns a list of all valid regions for Amazon Lightsail. Use the <code>include availability zones</code> parameter to also return the Availability Zones in a region.</p>
 
 @param request A container for the necessary parameters to execute the GetRegions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRegionsRequest
 @see AWSLightsailGetRegionsResult
 */
- (void)getRegions:(AWSLightsailGetRegionsRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetRegionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a specific database in Amazon Lightsail.</p>
 
 @param request A container for the necessary parameters to execute the GetRelationalDatabase service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetRelationalDatabaseResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRelationalDatabaseRequest
 @see AWSLightsailGetRelationalDatabaseResult
 */
- (AWSTask<AWSLightsailGetRelationalDatabaseResult *> *)getRelationalDatabase:(AWSLightsailGetRelationalDatabaseRequest *)request;

/**
 <p>Returns information about a specific database in Amazon Lightsail.</p>
 
 @param request A container for the necessary parameters to execute the GetRelationalDatabase service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRelationalDatabaseRequest
 @see AWSLightsailGetRelationalDatabaseResult
 */
- (void)getRelationalDatabase:(AWSLightsailGetRelationalDatabaseRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetRelationalDatabaseResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of available database blueprints in Amazon Lightsail. A blueprint describes the major engine version of a database.</p><p>You can use a blueprint ID to create a new database that runs a specific database engine.</p>
 
 @param request A container for the necessary parameters to execute the GetRelationalDatabaseBlueprints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetRelationalDatabaseBlueprintsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRelationalDatabaseBlueprintsRequest
 @see AWSLightsailGetRelationalDatabaseBlueprintsResult
 */
- (AWSTask<AWSLightsailGetRelationalDatabaseBlueprintsResult *> *)getRelationalDatabaseBlueprints:(AWSLightsailGetRelationalDatabaseBlueprintsRequest *)request;

/**
 <p>Returns a list of available database blueprints in Amazon Lightsail. A blueprint describes the major engine version of a database.</p><p>You can use a blueprint ID to create a new database that runs a specific database engine.</p>
 
 @param request A container for the necessary parameters to execute the GetRelationalDatabaseBlueprints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRelationalDatabaseBlueprintsRequest
 @see AWSLightsailGetRelationalDatabaseBlueprintsResult
 */
- (void)getRelationalDatabaseBlueprints:(AWSLightsailGetRelationalDatabaseBlueprintsRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetRelationalDatabaseBlueprintsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the list of bundles that are available in Amazon Lightsail. A bundle describes the performance specifications for a database.</p><p>You can use a bundle ID to create a new database with explicit performance specifications.</p>
 
 @param request A container for the necessary parameters to execute the GetRelationalDatabaseBundles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetRelationalDatabaseBundlesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRelationalDatabaseBundlesRequest
 @see AWSLightsailGetRelationalDatabaseBundlesResult
 */
- (AWSTask<AWSLightsailGetRelationalDatabaseBundlesResult *> *)getRelationalDatabaseBundles:(AWSLightsailGetRelationalDatabaseBundlesRequest *)request;

/**
 <p>Returns the list of bundles that are available in Amazon Lightsail. A bundle describes the performance specifications for a database.</p><p>You can use a bundle ID to create a new database with explicit performance specifications.</p>
 
 @param request A container for the necessary parameters to execute the GetRelationalDatabaseBundles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRelationalDatabaseBundlesRequest
 @see AWSLightsailGetRelationalDatabaseBundlesResult
 */
- (void)getRelationalDatabaseBundles:(AWSLightsailGetRelationalDatabaseBundlesRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetRelationalDatabaseBundlesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of events for a specific database in Amazon Lightsail.</p>
 
 @param request A container for the necessary parameters to execute the GetRelationalDatabaseEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetRelationalDatabaseEventsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRelationalDatabaseEventsRequest
 @see AWSLightsailGetRelationalDatabaseEventsResult
 */
- (AWSTask<AWSLightsailGetRelationalDatabaseEventsResult *> *)getRelationalDatabaseEvents:(AWSLightsailGetRelationalDatabaseEventsRequest *)request;

/**
 <p>Returns a list of events for a specific database in Amazon Lightsail.</p>
 
 @param request A container for the necessary parameters to execute the GetRelationalDatabaseEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRelationalDatabaseEventsRequest
 @see AWSLightsailGetRelationalDatabaseEventsResult
 */
- (void)getRelationalDatabaseEvents:(AWSLightsailGetRelationalDatabaseEventsRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetRelationalDatabaseEventsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of log events for a database in Amazon Lightsail.</p>
 
 @param request A container for the necessary parameters to execute the GetRelationalDatabaseLogEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetRelationalDatabaseLogEventsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRelationalDatabaseLogEventsRequest
 @see AWSLightsailGetRelationalDatabaseLogEventsResult
 */
- (AWSTask<AWSLightsailGetRelationalDatabaseLogEventsResult *> *)getRelationalDatabaseLogEvents:(AWSLightsailGetRelationalDatabaseLogEventsRequest *)request;

/**
 <p>Returns a list of log events for a database in Amazon Lightsail.</p>
 
 @param request A container for the necessary parameters to execute the GetRelationalDatabaseLogEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRelationalDatabaseLogEventsRequest
 @see AWSLightsailGetRelationalDatabaseLogEventsResult
 */
- (void)getRelationalDatabaseLogEvents:(AWSLightsailGetRelationalDatabaseLogEventsRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetRelationalDatabaseLogEventsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of available log streams for a specific database in Amazon Lightsail.</p>
 
 @param request A container for the necessary parameters to execute the GetRelationalDatabaseLogStreams service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetRelationalDatabaseLogStreamsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRelationalDatabaseLogStreamsRequest
 @see AWSLightsailGetRelationalDatabaseLogStreamsResult
 */
- (AWSTask<AWSLightsailGetRelationalDatabaseLogStreamsResult *> *)getRelationalDatabaseLogStreams:(AWSLightsailGetRelationalDatabaseLogStreamsRequest *)request;

/**
 <p>Returns a list of available log streams for a specific database in Amazon Lightsail.</p>
 
 @param request A container for the necessary parameters to execute the GetRelationalDatabaseLogStreams service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRelationalDatabaseLogStreamsRequest
 @see AWSLightsailGetRelationalDatabaseLogStreamsResult
 */
- (void)getRelationalDatabaseLogStreams:(AWSLightsailGetRelationalDatabaseLogStreamsRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetRelationalDatabaseLogStreamsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the current, previous, or pending versions of the master user password for a Lightsail database.</p><p>The <code>GetRelationalDatabaseMasterUserPassword</code> operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName.</p>
 
 @param request A container for the necessary parameters to execute the GetRelationalDatabaseMasterUserPassword service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetRelationalDatabaseMasterUserPasswordResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRelationalDatabaseMasterUserPasswordRequest
 @see AWSLightsailGetRelationalDatabaseMasterUserPasswordResult
 */
- (AWSTask<AWSLightsailGetRelationalDatabaseMasterUserPasswordResult *> *)getRelationalDatabaseMasterUserPassword:(AWSLightsailGetRelationalDatabaseMasterUserPasswordRequest *)request;

/**
 <p>Returns the current, previous, or pending versions of the master user password for a Lightsail database.</p><p>The <code>GetRelationalDatabaseMasterUserPassword</code> operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName.</p>
 
 @param request A container for the necessary parameters to execute the GetRelationalDatabaseMasterUserPassword service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRelationalDatabaseMasterUserPasswordRequest
 @see AWSLightsailGetRelationalDatabaseMasterUserPasswordResult
 */
- (void)getRelationalDatabaseMasterUserPassword:(AWSLightsailGetRelationalDatabaseMasterUserPasswordRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetRelationalDatabaseMasterUserPasswordResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the data points of the specified metric for a database in Amazon Lightsail.</p>
 
 @param request A container for the necessary parameters to execute the GetRelationalDatabaseMetricData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetRelationalDatabaseMetricDataResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRelationalDatabaseMetricDataRequest
 @see AWSLightsailGetRelationalDatabaseMetricDataResult
 */
- (AWSTask<AWSLightsailGetRelationalDatabaseMetricDataResult *> *)getRelationalDatabaseMetricData:(AWSLightsailGetRelationalDatabaseMetricDataRequest *)request;

/**
 <p>Returns the data points of the specified metric for a database in Amazon Lightsail.</p>
 
 @param request A container for the necessary parameters to execute the GetRelationalDatabaseMetricData service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRelationalDatabaseMetricDataRequest
 @see AWSLightsailGetRelationalDatabaseMetricDataResult
 */
- (void)getRelationalDatabaseMetricData:(AWSLightsailGetRelationalDatabaseMetricDataRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetRelationalDatabaseMetricDataResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns all of the runtime parameters offered by the underlying database software, or engine, for a specific database in Amazon Lightsail.</p><p>In addition to the parameter names and values, this operation returns other information about each parameter. This information includes whether changes require a reboot, whether the parameter is modifiable, the allowed values, and the data types.</p>
 
 @param request A container for the necessary parameters to execute the GetRelationalDatabaseParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetRelationalDatabaseParametersResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRelationalDatabaseParametersRequest
 @see AWSLightsailGetRelationalDatabaseParametersResult
 */
- (AWSTask<AWSLightsailGetRelationalDatabaseParametersResult *> *)getRelationalDatabaseParameters:(AWSLightsailGetRelationalDatabaseParametersRequest *)request;

/**
 <p>Returns all of the runtime parameters offered by the underlying database software, or engine, for a specific database in Amazon Lightsail.</p><p>In addition to the parameter names and values, this operation returns other information about each parameter. This information includes whether changes require a reboot, whether the parameter is modifiable, the allowed values, and the data types.</p>
 
 @param request A container for the necessary parameters to execute the GetRelationalDatabaseParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRelationalDatabaseParametersRequest
 @see AWSLightsailGetRelationalDatabaseParametersResult
 */
- (void)getRelationalDatabaseParameters:(AWSLightsailGetRelationalDatabaseParametersRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetRelationalDatabaseParametersResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a specific database snapshot in Amazon Lightsail.</p>
 
 @param request A container for the necessary parameters to execute the GetRelationalDatabaseSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetRelationalDatabaseSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRelationalDatabaseSnapshotRequest
 @see AWSLightsailGetRelationalDatabaseSnapshotResult
 */
- (AWSTask<AWSLightsailGetRelationalDatabaseSnapshotResult *> *)getRelationalDatabaseSnapshot:(AWSLightsailGetRelationalDatabaseSnapshotRequest *)request;

/**
 <p>Returns information about a specific database snapshot in Amazon Lightsail.</p>
 
 @param request A container for the necessary parameters to execute the GetRelationalDatabaseSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRelationalDatabaseSnapshotRequest
 @see AWSLightsailGetRelationalDatabaseSnapshotResult
 */
- (void)getRelationalDatabaseSnapshot:(AWSLightsailGetRelationalDatabaseSnapshotRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetRelationalDatabaseSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about all of your database snapshots in Amazon Lightsail.</p>
 
 @param request A container for the necessary parameters to execute the GetRelationalDatabaseSnapshots service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetRelationalDatabaseSnapshotsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRelationalDatabaseSnapshotsRequest
 @see AWSLightsailGetRelationalDatabaseSnapshotsResult
 */
- (AWSTask<AWSLightsailGetRelationalDatabaseSnapshotsResult *> *)getRelationalDatabaseSnapshots:(AWSLightsailGetRelationalDatabaseSnapshotsRequest *)request;

/**
 <p>Returns information about all of your database snapshots in Amazon Lightsail.</p>
 
 @param request A container for the necessary parameters to execute the GetRelationalDatabaseSnapshots service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRelationalDatabaseSnapshotsRequest
 @see AWSLightsailGetRelationalDatabaseSnapshotsResult
 */
- (void)getRelationalDatabaseSnapshots:(AWSLightsailGetRelationalDatabaseSnapshotsRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetRelationalDatabaseSnapshotsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about all of your databases in Amazon Lightsail.</p>
 
 @param request A container for the necessary parameters to execute the GetRelationalDatabases service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetRelationalDatabasesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRelationalDatabasesRequest
 @see AWSLightsailGetRelationalDatabasesResult
 */
- (AWSTask<AWSLightsailGetRelationalDatabasesResult *> *)getRelationalDatabases:(AWSLightsailGetRelationalDatabasesRequest *)request;

/**
 <p>Returns information about all of your databases in Amazon Lightsail.</p>
 
 @param request A container for the necessary parameters to execute the GetRelationalDatabases service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetRelationalDatabasesRequest
 @see AWSLightsailGetRelationalDatabasesResult
 */
- (void)getRelationalDatabases:(AWSLightsailGetRelationalDatabasesRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetRelationalDatabasesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a specific static IP.</p>
 
 @param request A container for the necessary parameters to execute the GetStaticIp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetStaticIpResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetStaticIpRequest
 @see AWSLightsailGetStaticIpResult
 */
- (AWSTask<AWSLightsailGetStaticIpResult *> *)getStaticIp:(AWSLightsailGetStaticIpRequest *)request;

/**
 <p>Returns information about a specific static IP.</p>
 
 @param request A container for the necessary parameters to execute the GetStaticIp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetStaticIpRequest
 @see AWSLightsailGetStaticIpResult
 */
- (void)getStaticIp:(AWSLightsailGetStaticIpRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetStaticIpResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about all static IPs in the user's account.</p>
 
 @param request A container for the necessary parameters to execute the GetStaticIps service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailGetStaticIpsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetStaticIpsRequest
 @see AWSLightsailGetStaticIpsResult
 */
- (AWSTask<AWSLightsailGetStaticIpsResult *> *)getStaticIps:(AWSLightsailGetStaticIpsRequest *)request;

/**
 <p>Returns information about all static IPs in the user's account.</p>
 
 @param request A container for the necessary parameters to execute the GetStaticIps service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailGetStaticIpsRequest
 @see AWSLightsailGetStaticIpsResult
 */
- (void)getStaticIps:(AWSLightsailGetStaticIpsRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailGetStaticIpsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Imports a public SSH key from a specific key pair.</p>
 
 @param request A container for the necessary parameters to execute the ImportKeyPair service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailImportKeyPairResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailImportKeyPairRequest
 @see AWSLightsailImportKeyPairResult
 */
- (AWSTask<AWSLightsailImportKeyPairResult *> *)importKeyPair:(AWSLightsailImportKeyPairRequest *)request;

/**
 <p>Imports a public SSH key from a specific key pair.</p>
 
 @param request A container for the necessary parameters to execute the ImportKeyPair service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailImportKeyPairRequest
 @see AWSLightsailImportKeyPairResult
 */
- (void)importKeyPair:(AWSLightsailImportKeyPairRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailImportKeyPairResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a Boolean value indicating whether your Lightsail VPC is peered.</p>
 
 @param request A container for the necessary parameters to execute the IsVpcPeered service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailIsVpcPeeredResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailIsVpcPeeredRequest
 @see AWSLightsailIsVpcPeeredResult
 */
- (AWSTask<AWSLightsailIsVpcPeeredResult *> *)isVpcPeered:(AWSLightsailIsVpcPeeredRequest *)request;

/**
 <p>Returns a Boolean value indicating whether your Lightsail VPC is peered.</p>
 
 @param request A container for the necessary parameters to execute the IsVpcPeered service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailIsVpcPeeredRequest
 @see AWSLightsailIsVpcPeeredResult
 */
- (void)isVpcPeered:(AWSLightsailIsVpcPeeredRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailIsVpcPeeredResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Opens ports for a specific Amazon Lightsail instance, and specifies the IP addresses allowed to connect to the instance through the ports, and the protocol.</p><p>The <code>OpenInstancePublicPorts</code> action supports tag-based access control via resource tags applied to the resource identified by <code>instanceName</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the OpenInstancePublicPorts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailOpenInstancePublicPortsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailOpenInstancePublicPortsRequest
 @see AWSLightsailOpenInstancePublicPortsResult
 */
- (AWSTask<AWSLightsailOpenInstancePublicPortsResult *> *)openInstancePublicPorts:(AWSLightsailOpenInstancePublicPortsRequest *)request;

/**
 <p>Opens ports for a specific Amazon Lightsail instance, and specifies the IP addresses allowed to connect to the instance through the ports, and the protocol.</p><p>The <code>OpenInstancePublicPorts</code> action supports tag-based access control via resource tags applied to the resource identified by <code>instanceName</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the OpenInstancePublicPorts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailOpenInstancePublicPortsRequest
 @see AWSLightsailOpenInstancePublicPortsResult
 */
- (void)openInstancePublicPorts:(AWSLightsailOpenInstancePublicPortsRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailOpenInstancePublicPortsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Tries to peer the Lightsail VPC with the user's default VPC.</p>
 
 @param request A container for the necessary parameters to execute the PeerVpc service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailPeerVpcResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailPeerVpcRequest
 @see AWSLightsailPeerVpcResult
 */
- (AWSTask<AWSLightsailPeerVpcResult *> *)peerVpc:(AWSLightsailPeerVpcRequest *)request;

/**
 <p>Tries to peer the Lightsail VPC with the user's default VPC.</p>
 
 @param request A container for the necessary parameters to execute the PeerVpc service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailPeerVpcRequest
 @see AWSLightsailPeerVpcResult
 */
- (void)peerVpc:(AWSLightsailPeerVpcRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailPeerVpcResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates an alarm, and associates it with the specified metric.</p><p>An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms">Alarms in Amazon Lightsail</a>.</p><p>When this action creates an alarm, the alarm state is immediately set to <code>INSUFFICIENT_DATA</code>. The alarm is then evaluated and its state is set appropriately. Any actions associated with the new state are then executed.</p><p>When you update an existing alarm, its state is left unchanged, but the update completely overwrites the previous configuration of the alarm. The alarm is then evaluated with the updated configuration.</p>
 
 @param request A container for the necessary parameters to execute the PutAlarm service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailPutAlarmResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorUnauthenticated`, `AWSLightsailErrorNotFound`.
 
 @see AWSLightsailPutAlarmRequest
 @see AWSLightsailPutAlarmResult
 */
- (AWSTask<AWSLightsailPutAlarmResult *> *)putAlarm:(AWSLightsailPutAlarmRequest *)request;

/**
 <p>Creates or updates an alarm, and associates it with the specified metric.</p><p>An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms">Alarms in Amazon Lightsail</a>.</p><p>When this action creates an alarm, the alarm state is immediately set to <code>INSUFFICIENT_DATA</code>. The alarm is then evaluated and its state is set appropriately. Any actions associated with the new state are then executed.</p><p>When you update an existing alarm, its state is left unchanged, but the update completely overwrites the previous configuration of the alarm. The alarm is then evaluated with the updated configuration.</p>
 
 @param request A container for the necessary parameters to execute the PutAlarm service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorUnauthenticated`, `AWSLightsailErrorNotFound`.
 
 @see AWSLightsailPutAlarmRequest
 @see AWSLightsailPutAlarmResult
 */
- (void)putAlarm:(AWSLightsailPutAlarmRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailPutAlarmResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Opens ports for a specific Amazon Lightsail instance, and specifies the IP addresses allowed to connect to the instance through the ports, and the protocol. This action also closes all currently open ports that are not included in the request. Include all of the ports and the protocols you want to open in your <code>PutInstancePublicPorts</code>request. Or use the <code>OpenInstancePublicPorts</code> action to open ports without closing currently open ports.</p><p>The <code>PutInstancePublicPorts</code> action supports tag-based access control via resource tags applied to the resource identified by <code>instanceName</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutInstancePublicPorts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailPutInstancePublicPortsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailPutInstancePublicPortsRequest
 @see AWSLightsailPutInstancePublicPortsResult
 */
- (AWSTask<AWSLightsailPutInstancePublicPortsResult *> *)putInstancePublicPorts:(AWSLightsailPutInstancePublicPortsRequest *)request;

/**
 <p>Opens ports for a specific Amazon Lightsail instance, and specifies the IP addresses allowed to connect to the instance through the ports, and the protocol. This action also closes all currently open ports that are not included in the request. Include all of the ports and the protocols you want to open in your <code>PutInstancePublicPorts</code>request. Or use the <code>OpenInstancePublicPorts</code> action to open ports without closing currently open ports.</p><p>The <code>PutInstancePublicPorts</code> action supports tag-based access control via resource tags applied to the resource identified by <code>instanceName</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutInstancePublicPorts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailPutInstancePublicPortsRequest
 @see AWSLightsailPutInstancePublicPortsResult
 */
- (void)putInstancePublicPorts:(AWSLightsailPutInstancePublicPortsRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailPutInstancePublicPortsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Restarts a specific instance.</p><p>The <code>reboot instance</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>instance name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the RebootInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailRebootInstanceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailRebootInstanceRequest
 @see AWSLightsailRebootInstanceResult
 */
- (AWSTask<AWSLightsailRebootInstanceResult *> *)rebootInstance:(AWSLightsailRebootInstanceRequest *)request;

/**
 <p>Restarts a specific instance.</p><p>The <code>reboot instance</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>instance name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the RebootInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailRebootInstanceRequest
 @see AWSLightsailRebootInstanceResult
 */
- (void)rebootInstance:(AWSLightsailRebootInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailRebootInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Restarts a specific database in Amazon Lightsail.</p><p>The <code>reboot relational database</code> operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the RebootRelationalDatabase service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailRebootRelationalDatabaseResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailRebootRelationalDatabaseRequest
 @see AWSLightsailRebootRelationalDatabaseResult
 */
- (AWSTask<AWSLightsailRebootRelationalDatabaseResult *> *)rebootRelationalDatabase:(AWSLightsailRebootRelationalDatabaseRequest *)request;

/**
 <p>Restarts a specific database in Amazon Lightsail.</p><p>The <code>reboot relational database</code> operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the RebootRelationalDatabase service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailRebootRelationalDatabaseRequest
 @see AWSLightsailRebootRelationalDatabaseResult
 */
- (void)rebootRelationalDatabase:(AWSLightsailRebootRelationalDatabaseRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailRebootRelationalDatabaseResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specific static IP from your account.</p>
 
 @param request A container for the necessary parameters to execute the ReleaseStaticIp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailReleaseStaticIpResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailReleaseStaticIpRequest
 @see AWSLightsailReleaseStaticIpResult
 */
- (AWSTask<AWSLightsailReleaseStaticIpResult *> *)releaseStaticIp:(AWSLightsailReleaseStaticIpRequest *)request;

/**
 <p>Deletes a specific static IP from your account.</p>
 
 @param request A container for the necessary parameters to execute the ReleaseStaticIp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailReleaseStaticIpRequest
 @see AWSLightsailReleaseStaticIpResult
 */
- (void)releaseStaticIp:(AWSLightsailReleaseStaticIpRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailReleaseStaticIpResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sends a verification request to an email contact method to ensure it's owned by the requester. SMS contact methods don't need to be verified.</p><p>A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each AWS Region. However, SMS text messaging is not supported in some AWS Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications">Notifications in Amazon Lightsail</a>.</p><p>A verification request is sent to the contact method when you initially create it. Use this action to send another verification request if a previous verification request was deleted, or has expired.</p><important><p>Notifications are not sent to an email contact method until after it is verified, and confirmed as valid.</p></important>
 
 @param request A container for the necessary parameters to execute the SendContactMethodVerification service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailSendContactMethodVerificationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorUnauthenticated`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorNotFound`.
 
 @see AWSLightsailSendContactMethodVerificationRequest
 @see AWSLightsailSendContactMethodVerificationResult
 */
- (AWSTask<AWSLightsailSendContactMethodVerificationResult *> *)sendContactMethodVerification:(AWSLightsailSendContactMethodVerificationRequest *)request;

/**
 <p>Sends a verification request to an email contact method to ensure it's owned by the requester. SMS contact methods don't need to be verified.</p><p>A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each AWS Region. However, SMS text messaging is not supported in some AWS Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications">Notifications in Amazon Lightsail</a>.</p><p>A verification request is sent to the contact method when you initially create it. Use this action to send another verification request if a previous verification request was deleted, or has expired.</p><important><p>Notifications are not sent to an email contact method until after it is verified, and confirmed as valid.</p></important>
 
 @param request A container for the necessary parameters to execute the SendContactMethodVerification service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorUnauthenticated`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorNotFound`.
 
 @see AWSLightsailSendContactMethodVerificationRequest
 @see AWSLightsailSendContactMethodVerificationResult
 */
- (void)sendContactMethodVerification:(AWSLightsailSendContactMethodVerificationRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailSendContactMethodVerificationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a specific Amazon Lightsail instance from a stopped state. To restart an instance, use the <code>reboot instance</code> operation.</p><note><p>When you start a stopped instance, Lightsail assigns a new public IP address to the instance. To use the same IP address after stopping and starting an instance, create a static IP address and attach it to the instance. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/lightsail-create-static-ip">Lightsail Dev Guide</a>.</p></note><p>The <code>start instance</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>instance name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailStartInstanceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailStartInstanceRequest
 @see AWSLightsailStartInstanceResult
 */
- (AWSTask<AWSLightsailStartInstanceResult *> *)startInstance:(AWSLightsailStartInstanceRequest *)request;

/**
 <p>Starts a specific Amazon Lightsail instance from a stopped state. To restart an instance, use the <code>reboot instance</code> operation.</p><note><p>When you start a stopped instance, Lightsail assigns a new public IP address to the instance. To use the same IP address after stopping and starting an instance, create a static IP address and attach it to the instance. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/lightsail-create-static-ip">Lightsail Dev Guide</a>.</p></note><p>The <code>start instance</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>instance name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailStartInstanceRequest
 @see AWSLightsailStartInstanceResult
 */
- (void)startInstance:(AWSLightsailStartInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailStartInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a specific database from a stopped state in Amazon Lightsail. To restart a database, use the <code>reboot relational database</code> operation.</p><p>The <code>start relational database</code> operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartRelationalDatabase service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailStartRelationalDatabaseResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailStartRelationalDatabaseRequest
 @see AWSLightsailStartRelationalDatabaseResult
 */
- (AWSTask<AWSLightsailStartRelationalDatabaseResult *> *)startRelationalDatabase:(AWSLightsailStartRelationalDatabaseRequest *)request;

/**
 <p>Starts a specific database from a stopped state in Amazon Lightsail. To restart a database, use the <code>reboot relational database</code> operation.</p><p>The <code>start relational database</code> operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartRelationalDatabase service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailStartRelationalDatabaseRequest
 @see AWSLightsailStartRelationalDatabaseResult
 */
- (void)startRelationalDatabase:(AWSLightsailStartRelationalDatabaseRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailStartRelationalDatabaseResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops a specific Amazon Lightsail instance that is currently running.</p><note><p>When you start a stopped instance, Lightsail assigns a new public IP address to the instance. To use the same IP address after stopping and starting an instance, create a static IP address and attach it to the instance. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/lightsail-create-static-ip">Lightsail Dev Guide</a>.</p></note><p>The <code>stop instance</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>instance name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the StopInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailStopInstanceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailStopInstanceRequest
 @see AWSLightsailStopInstanceResult
 */
- (AWSTask<AWSLightsailStopInstanceResult *> *)stopInstance:(AWSLightsailStopInstanceRequest *)request;

/**
 <p>Stops a specific Amazon Lightsail instance that is currently running.</p><note><p>When you start a stopped instance, Lightsail assigns a new public IP address to the instance. To use the same IP address after stopping and starting an instance, create a static IP address and attach it to the instance. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/lightsail-create-static-ip">Lightsail Dev Guide</a>.</p></note><p>The <code>stop instance</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>instance name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the StopInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailStopInstanceRequest
 @see AWSLightsailStopInstanceResult
 */
- (void)stopInstance:(AWSLightsailStopInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailStopInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops a specific database that is currently running in Amazon Lightsail.</p><p>The <code>stop relational database</code> operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the StopRelationalDatabase service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailStopRelationalDatabaseResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailStopRelationalDatabaseRequest
 @see AWSLightsailStopRelationalDatabaseResult
 */
- (AWSTask<AWSLightsailStopRelationalDatabaseResult *> *)stopRelationalDatabase:(AWSLightsailStopRelationalDatabaseRequest *)request;

/**
 <p>Stops a specific database that is currently running in Amazon Lightsail.</p><p>The <code>stop relational database</code> operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the StopRelationalDatabase service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailStopRelationalDatabaseRequest
 @see AWSLightsailStopRelationalDatabaseResult
 */
- (void)stopRelationalDatabase:(AWSLightsailStopRelationalDatabaseRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailStopRelationalDatabaseResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds one or more tags to the specified Amazon Lightsail resource. Each resource can have a maximum of 50 tags. Each tag consists of a key and an optional value. Tag keys must be unique per resource. For more information about tags, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail Dev Guide</a>.</p><p>The <code>tag resource</code> operation supports tag-based access control via request tags and resource tags applied to the resource identified by <code>resource name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailTagResourceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailTagResourceRequest
 @see AWSLightsailTagResourceResult
 */
- (AWSTask<AWSLightsailTagResourceResult *> *)tagResource:(AWSLightsailTagResourceRequest *)request;

/**
 <p>Adds one or more tags to the specified Amazon Lightsail resource. Each resource can have a maximum of 50 tags. Each tag consists of a key and an optional value. Tag keys must be unique per resource. For more information about tags, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail Dev Guide</a>.</p><p>The <code>tag resource</code> operation supports tag-based access control via request tags and resource tags applied to the resource identified by <code>resource name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailTagResourceRequest
 @see AWSLightsailTagResourceResult
 */
- (void)tagResource:(AWSLightsailTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailTagResourceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Tests an alarm by displaying a banner on the Amazon Lightsail console. If a notification trigger is configured for the specified alarm, the test also sends a notification to the notification protocol (<code>Email</code> and/or <code>SMS</code>) configured for the alarm.</p><p>An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms">Alarms in Amazon Lightsail</a>.</p>
 
 @param request A container for the necessary parameters to execute the TestAlarm service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailTestAlarmResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorUnauthenticated`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorNotFound`.
 
 @see AWSLightsailTestAlarmRequest
 @see AWSLightsailTestAlarmResult
 */
- (AWSTask<AWSLightsailTestAlarmResult *> *)testAlarm:(AWSLightsailTestAlarmRequest *)request;

/**
 <p>Tests an alarm by displaying a banner on the Amazon Lightsail console. If a notification trigger is configured for the specified alarm, the test also sends a notification to the notification protocol (<code>Email</code> and/or <code>SMS</code>) configured for the alarm.</p><p>An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms">Alarms in Amazon Lightsail</a>.</p>
 
 @param request A container for the necessary parameters to execute the TestAlarm service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorUnauthenticated`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorNotFound`.
 
 @see AWSLightsailTestAlarmRequest
 @see AWSLightsailTestAlarmResult
 */
- (void)testAlarm:(AWSLightsailTestAlarmRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailTestAlarmResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attempts to unpeer the Lightsail VPC from the user's default VPC.</p>
 
 @param request A container for the necessary parameters to execute the UnpeerVpc service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailUnpeerVpcResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailUnpeerVpcRequest
 @see AWSLightsailUnpeerVpcResult
 */
- (AWSTask<AWSLightsailUnpeerVpcResult *> *)unpeerVpc:(AWSLightsailUnpeerVpcRequest *)request;

/**
 <p>Attempts to unpeer the Lightsail VPC from the user's default VPC.</p>
 
 @param request A container for the necessary parameters to execute the UnpeerVpc service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailUnpeerVpcRequest
 @see AWSLightsailUnpeerVpcResult
 */
- (void)unpeerVpc:(AWSLightsailUnpeerVpcRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailUnpeerVpcResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified set of tag keys and their values from the specified Amazon Lightsail resource.</p><p>The <code>untag resource</code> operation supports tag-based access control via request tags and resource tags applied to the resource identified by <code>resource name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailUntagResourceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailUntagResourceRequest
 @see AWSLightsailUntagResourceResult
 */
- (AWSTask<AWSLightsailUntagResourceResult *> *)untagResource:(AWSLightsailUntagResourceRequest *)request;

/**
 <p>Deletes the specified set of tag keys and their values from the specified Amazon Lightsail resource.</p><p>The <code>untag resource</code> operation supports tag-based access control via request tags and resource tags applied to the resource identified by <code>resource name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailUntagResourceRequest
 @see AWSLightsailUntagResourceResult
 */
- (void)untagResource:(AWSLightsailUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailUntagResourceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a domain recordset after it is created.</p><p>The <code>update domain entry</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>domain name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDomainEntry service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailUpdateDomainEntryResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailUpdateDomainEntryRequest
 @see AWSLightsailUpdateDomainEntryResult
 */
- (AWSTask<AWSLightsailUpdateDomainEntryResult *> *)updateDomainEntry:(AWSLightsailUpdateDomainEntryRequest *)request;

/**
 <p>Updates a domain recordset after it is created.</p><p>The <code>update domain entry</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>domain name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDomainEntry service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailUpdateDomainEntryRequest
 @see AWSLightsailUpdateDomainEntryResult
 */
- (void)updateDomainEntry:(AWSLightsailUpdateDomainEntryRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailUpdateDomainEntryResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified attribute for a load balancer. You can only update one attribute at a time.</p><p>The <code>update load balancer attribute</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>load balancer name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateLoadBalancerAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailUpdateLoadBalancerAttributeResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailUpdateLoadBalancerAttributeRequest
 @see AWSLightsailUpdateLoadBalancerAttributeResult
 */
- (AWSTask<AWSLightsailUpdateLoadBalancerAttributeResult *> *)updateLoadBalancerAttribute:(AWSLightsailUpdateLoadBalancerAttributeRequest *)request;

/**
 <p>Updates the specified attribute for a load balancer. You can only update one attribute at a time.</p><p>The <code>update load balancer attribute</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>load balancer name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateLoadBalancerAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailUpdateLoadBalancerAttributeRequest
 @see AWSLightsailUpdateLoadBalancerAttributeResult
 */
- (void)updateLoadBalancerAttribute:(AWSLightsailUpdateLoadBalancerAttributeRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailUpdateLoadBalancerAttributeResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allows the update of one or more attributes of a database in Amazon Lightsail.</p><p>Updates are applied immediately, or in cases where the updates could result in an outage, are applied during the database's predefined maintenance window.</p><p>The <code>update relational database</code> operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRelationalDatabase service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailUpdateRelationalDatabaseResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailUpdateRelationalDatabaseRequest
 @see AWSLightsailUpdateRelationalDatabaseResult
 */
- (AWSTask<AWSLightsailUpdateRelationalDatabaseResult *> *)updateRelationalDatabase:(AWSLightsailUpdateRelationalDatabaseRequest *)request;

/**
 <p>Allows the update of one or more attributes of a database in Amazon Lightsail.</p><p>Updates are applied immediately, or in cases where the updates could result in an outage, are applied during the database's predefined maintenance window.</p><p>The <code>update relational database</code> operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRelationalDatabase service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailUpdateRelationalDatabaseRequest
 @see AWSLightsailUpdateRelationalDatabaseResult
 */
- (void)updateRelationalDatabase:(AWSLightsailUpdateRelationalDatabaseRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailUpdateRelationalDatabaseResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allows the update of one or more parameters of a database in Amazon Lightsail.</p><p>Parameter updates don't cause outages; therefore, their application is not subject to the preferred maintenance window. However, there are two ways in which parameter updates are applied: <code>dynamic</code> or <code>pending-reboot</code>. Parameters marked with a <code>dynamic</code> apply type are applied immediately. Parameters marked with a <code>pending-reboot</code> apply type are applied only after the database is rebooted using the <code>reboot relational database</code> operation.</p><p>The <code>update relational database parameters</code> operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRelationalDatabaseParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLightsailUpdateRelationalDatabaseParametersResult`. On failed execution, `task.error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailUpdateRelationalDatabaseParametersRequest
 @see AWSLightsailUpdateRelationalDatabaseParametersResult
 */
- (AWSTask<AWSLightsailUpdateRelationalDatabaseParametersResult *> *)updateRelationalDatabaseParameters:(AWSLightsailUpdateRelationalDatabaseParametersRequest *)request;

/**
 <p>Allows the update of one or more parameters of a database in Amazon Lightsail.</p><p>Parameter updates don't cause outages; therefore, their application is not subject to the preferred maintenance window. However, there are two ways in which parameter updates are applied: <code>dynamic</code> or <code>pending-reboot</code>. Parameters marked with a <code>dynamic</code> apply type are applied immediately. Parameters marked with a <code>pending-reboot</code> apply type are applied only after the database is rebooted using the <code>reboot relational database</code> operation.</p><p>The <code>update relational database parameters</code> operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRelationalDatabaseParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLightsailErrorDomain` domain and the following error code: `AWSLightsailErrorService`, `AWSLightsailErrorInvalidInput`, `AWSLightsailErrorNotFound`, `AWSLightsailErrorOperationFailure`, `AWSLightsailErrorAccessDenied`, `AWSLightsailErrorAccountSetupInProgress`, `AWSLightsailErrorUnauthenticated`.
 
 @see AWSLightsailUpdateRelationalDatabaseParametersRequest
 @see AWSLightsailUpdateRelationalDatabaseParametersResult
 */
- (void)updateRelationalDatabaseParameters:(AWSLightsailUpdateRelationalDatabaseParametersRequest *)request completionHandler:(void (^ _Nullable)(AWSLightsailUpdateRelationalDatabaseParametersResult * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
