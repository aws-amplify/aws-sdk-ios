//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSElasticLoadBalancingModel.h"
#import "AWSElasticLoadBalancingResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSElasticLoadBalancing
FOUNDATION_EXPORT NSString *const AWSElasticLoadBalancingSDKVersion;

/**
 <fullname>Elastic Load Balancing</fullname><p>A load balancer distributes incoming traffic across targets, such as your EC2 instances. This enables you to increase the availability of your application. The load balancer also monitors the health of its registered targets and ensures that it routes traffic only to healthy targets. You configure your load balancer to accept incoming traffic by specifying one or more listeners, which are configured with a protocol and port number for connections from clients to the load balancer. You configure a target group with a protocol and port number for connections from the load balancer to the targets, and with health check settings to be used when checking the health status of the targets.</p><p>Elastic Load Balancing supports the following types of load balancers: Application Load Balancers, Network Load Balancers, Gateway Load Balancers, and Classic Load Balancers. This reference covers the following load balancer types:</p><ul><li><p>Application Load Balancer - Operates at the application layer (layer 7) and supports HTTP and HTTPS.</p></li><li><p>Network Load Balancer - Operates at the transport layer (layer 4) and supports TCP, TLS, and UDP.</p></li><li><p>Gateway Load Balancer - Operates at the network layer (layer 3).</p></li></ul><p>For more information, see the <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/">Elastic Load Balancing User Guide</a>.</p><p>All Elastic Load Balancing operations are idempotent, which means that they complete at most one time. If you repeat an operation, it succeeds.</p>
 */
@interface AWSElasticLoadBalancing : AWSService

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

     let ElasticLoadBalancing = AWSElasticLoadBalancing.default()

 *Objective-C*

     AWSElasticLoadBalancing *ElasticLoadBalancing = [AWSElasticLoadBalancing defaultElasticLoadBalancing];

 @return The default service client.
 */
+ (instancetype)defaultElasticLoadBalancing;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSElasticLoadBalancing.register(with: configuration!, forKey: "USWest2ElasticLoadBalancing")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:@"USWest2ElasticLoadBalancing"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let ElasticLoadBalancing = AWSElasticLoadBalancing(forKey: "USWest2ElasticLoadBalancing")

 *Objective-C*

     AWSElasticLoadBalancing *ElasticLoadBalancing = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:@"USWest2ElasticLoadBalancing"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerElasticLoadBalancingWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerElasticLoadBalancingWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSElasticLoadBalancing.register(with: configuration!, forKey: "USWest2ElasticLoadBalancing")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:@"USWest2ElasticLoadBalancing"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let ElasticLoadBalancing = AWSElasticLoadBalancing(forKey: "USWest2ElasticLoadBalancing")

 *Objective-C*

     AWSElasticLoadBalancing *ElasticLoadBalancing = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:@"USWest2ElasticLoadBalancing"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)ElasticLoadBalancingForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeElasticLoadBalancingForKey:(NSString *)key;

/**
 <p>Adds the specified SSL server certificate to the certificate list for the specified HTTPS or TLS listener.</p><p>If the certificate in already in the certificate list, the call is successful but the certificate is not added again.</p><p>For more information, see <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html">HTTPS listeners</a> in the <i>Application Load Balancers Guide</i> or <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html">TLS listeners</a> in the <i>Network Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AddListenerCertificates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingAddListenerCertificatesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorTooManyCertificates`, `AWSElasticLoadBalancingErrorCertificateNotFound`.
 
 @see AWSElasticLoadBalancingAddListenerCertificatesInput
 @see AWSElasticLoadBalancingAddListenerCertificatesOutput
 */
- (AWSTask<AWSElasticLoadBalancingAddListenerCertificatesOutput *> *)addListenerCertificates:(AWSElasticLoadBalancingAddListenerCertificatesInput *)request;

/**
 <p>Adds the specified SSL server certificate to the certificate list for the specified HTTPS or TLS listener.</p><p>If the certificate in already in the certificate list, the call is successful but the certificate is not added again.</p><p>For more information, see <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html">HTTPS listeners</a> in the <i>Application Load Balancers Guide</i> or <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html">TLS listeners</a> in the <i>Network Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AddListenerCertificates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorTooManyCertificates`, `AWSElasticLoadBalancingErrorCertificateNotFound`.
 
 @see AWSElasticLoadBalancingAddListenerCertificatesInput
 @see AWSElasticLoadBalancingAddListenerCertificatesOutput
 */
- (void)addListenerCertificates:(AWSElasticLoadBalancingAddListenerCertificatesInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingAddListenerCertificatesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds the specified tags to the specified Elastic Load Balancing resource. You can tag your Application Load Balancers, Network Load Balancers, Gateway Load Balancers, target groups, listeners, and rules.</p><p>Each tag consists of a key and an optional value. If a resource already has a tag with the same key, <code>AddTags</code> updates its value.</p>
 
 @param request A container for the necessary parameters to execute the AddTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingAddTagsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorDuplicateTagKeys`, `AWSElasticLoadBalancingErrorTooManyTags`, `AWSElasticLoadBalancingErrorLoadBalancerNotFound`, `AWSElasticLoadBalancingErrorTargetGroupNotFound`, `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorRuleNotFound`.
 
 @see AWSElasticLoadBalancingAddTagsInput
 @see AWSElasticLoadBalancingAddTagsOutput
 */
- (AWSTask<AWSElasticLoadBalancingAddTagsOutput *> *)addTags:(AWSElasticLoadBalancingAddTagsInput *)request;

/**
 <p>Adds the specified tags to the specified Elastic Load Balancing resource. You can tag your Application Load Balancers, Network Load Balancers, Gateway Load Balancers, target groups, listeners, and rules.</p><p>Each tag consists of a key and an optional value. If a resource already has a tag with the same key, <code>AddTags</code> updates its value.</p>
 
 @param request A container for the necessary parameters to execute the AddTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorDuplicateTagKeys`, `AWSElasticLoadBalancingErrorTooManyTags`, `AWSElasticLoadBalancingErrorLoadBalancerNotFound`, `AWSElasticLoadBalancingErrorTargetGroupNotFound`, `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorRuleNotFound`.
 
 @see AWSElasticLoadBalancingAddTagsInput
 @see AWSElasticLoadBalancingAddTagsOutput
 */
- (void)addTags:(AWSElasticLoadBalancingAddTagsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingAddTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a listener for the specified Application Load Balancer, Network Load Balancer, or Gateway Load Balancer.</p><p>For more information, see the following:</p><ul><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html">Listeners for your Application Load Balancers</a></p></li><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-listeners.html">Listeners for your Network Load Balancers</a></p></li><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/gateway-listeners.html">Listeners for your Gateway Load Balancers</a></p></li></ul><p>This operation is idempotent, which means that it completes at most one time. If you attempt to create multiple listeners with the same settings, each call succeeds.</p>
 
 @param request A container for the necessary parameters to execute the CreateListener service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingCreateListenerOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorDuplicateListener`, `AWSElasticLoadBalancingErrorTooManyListeners`, `AWSElasticLoadBalancingErrorTooManyCertificates`, `AWSElasticLoadBalancingErrorLoadBalancerNotFound`, `AWSElasticLoadBalancingErrorTargetGroupNotFound`, `AWSElasticLoadBalancingErrorTargetGroupAssociationLimit`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorIncompatibleProtocols`, `AWSElasticLoadBalancingErrorSSLPolicyNotFound`, `AWSElasticLoadBalancingErrorCertificateNotFound`, `AWSElasticLoadBalancingErrorUnsupportedProtocol`, `AWSElasticLoadBalancingErrorTooManyRegistrationsForTargetId`, `AWSElasticLoadBalancingErrorTooManyTargets`, `AWSElasticLoadBalancingErrorTooManyActions`, `AWSElasticLoadBalancingErrorInvalidLoadBalancerAction`, `AWSElasticLoadBalancingErrorTooManyUniqueTargetGroupsPerLoadBalancer`, `AWSElasticLoadBalancingErrorALPNPolicyNotSupported`, `AWSElasticLoadBalancingErrorTooManyTags`.
 
 @see AWSElasticLoadBalancingCreateListenerInput
 @see AWSElasticLoadBalancingCreateListenerOutput
 */
- (AWSTask<AWSElasticLoadBalancingCreateListenerOutput *> *)createListener:(AWSElasticLoadBalancingCreateListenerInput *)request;

/**
 <p>Creates a listener for the specified Application Load Balancer, Network Load Balancer, or Gateway Load Balancer.</p><p>For more information, see the following:</p><ul><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html">Listeners for your Application Load Balancers</a></p></li><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-listeners.html">Listeners for your Network Load Balancers</a></p></li><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/gateway-listeners.html">Listeners for your Gateway Load Balancers</a></p></li></ul><p>This operation is idempotent, which means that it completes at most one time. If you attempt to create multiple listeners with the same settings, each call succeeds.</p>
 
 @param request A container for the necessary parameters to execute the CreateListener service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorDuplicateListener`, `AWSElasticLoadBalancingErrorTooManyListeners`, `AWSElasticLoadBalancingErrorTooManyCertificates`, `AWSElasticLoadBalancingErrorLoadBalancerNotFound`, `AWSElasticLoadBalancingErrorTargetGroupNotFound`, `AWSElasticLoadBalancingErrorTargetGroupAssociationLimit`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorIncompatibleProtocols`, `AWSElasticLoadBalancingErrorSSLPolicyNotFound`, `AWSElasticLoadBalancingErrorCertificateNotFound`, `AWSElasticLoadBalancingErrorUnsupportedProtocol`, `AWSElasticLoadBalancingErrorTooManyRegistrationsForTargetId`, `AWSElasticLoadBalancingErrorTooManyTargets`, `AWSElasticLoadBalancingErrorTooManyActions`, `AWSElasticLoadBalancingErrorInvalidLoadBalancerAction`, `AWSElasticLoadBalancingErrorTooManyUniqueTargetGroupsPerLoadBalancer`, `AWSElasticLoadBalancingErrorALPNPolicyNotSupported`, `AWSElasticLoadBalancingErrorTooManyTags`.
 
 @see AWSElasticLoadBalancingCreateListenerInput
 @see AWSElasticLoadBalancingCreateListenerOutput
 */
- (void)createListener:(AWSElasticLoadBalancingCreateListenerInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingCreateListenerOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Application Load Balancer, Network Load Balancer, or Gateway Load Balancer.</p><p>For more information, see the following:</p><ul><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/application-load-balancers.html">Application Load Balancers</a></p></li><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/network-load-balancers.html">Network Load Balancers</a></p></li><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/gateway-load-balancers.html">Gateway Load Balancers</a></p></li></ul><p>This operation is idempotent, which means that it completes at most one time. If you attempt to create multiple load balancers with the same settings, each call succeeds.</p>
 
 @param request A container for the necessary parameters to execute the CreateLoadBalancer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingCreateLoadBalancerOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorDuplicateLoadBalancerName`, `AWSElasticLoadBalancingErrorTooManyLoadBalancers`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorSubnetNotFound`, `AWSElasticLoadBalancingErrorInvalidSubnet`, `AWSElasticLoadBalancingErrorInvalidSecurityGroup`, `AWSElasticLoadBalancingErrorInvalidScheme`, `AWSElasticLoadBalancingErrorTooManyTags`, `AWSElasticLoadBalancingErrorDuplicateTagKeys`, `AWSElasticLoadBalancingErrorResourceInUse`, `AWSElasticLoadBalancingErrorAllocationIdNotFound`, `AWSElasticLoadBalancingErrorAvailabilityZoneNotSupported`, `AWSElasticLoadBalancingErrorOperationNotPermitted`.
 
 @see AWSElasticLoadBalancingCreateLoadBalancerInput
 @see AWSElasticLoadBalancingCreateLoadBalancerOutput
 */
- (AWSTask<AWSElasticLoadBalancingCreateLoadBalancerOutput *> *)createLoadBalancer:(AWSElasticLoadBalancingCreateLoadBalancerInput *)request;

/**
 <p>Creates an Application Load Balancer, Network Load Balancer, or Gateway Load Balancer.</p><p>For more information, see the following:</p><ul><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/application-load-balancers.html">Application Load Balancers</a></p></li><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/network-load-balancers.html">Network Load Balancers</a></p></li><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/gateway-load-balancers.html">Gateway Load Balancers</a></p></li></ul><p>This operation is idempotent, which means that it completes at most one time. If you attempt to create multiple load balancers with the same settings, each call succeeds.</p>
 
 @param request A container for the necessary parameters to execute the CreateLoadBalancer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorDuplicateLoadBalancerName`, `AWSElasticLoadBalancingErrorTooManyLoadBalancers`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorSubnetNotFound`, `AWSElasticLoadBalancingErrorInvalidSubnet`, `AWSElasticLoadBalancingErrorInvalidSecurityGroup`, `AWSElasticLoadBalancingErrorInvalidScheme`, `AWSElasticLoadBalancingErrorTooManyTags`, `AWSElasticLoadBalancingErrorDuplicateTagKeys`, `AWSElasticLoadBalancingErrorResourceInUse`, `AWSElasticLoadBalancingErrorAllocationIdNotFound`, `AWSElasticLoadBalancingErrorAvailabilityZoneNotSupported`, `AWSElasticLoadBalancingErrorOperationNotPermitted`.
 
 @see AWSElasticLoadBalancingCreateLoadBalancerInput
 @see AWSElasticLoadBalancingCreateLoadBalancerOutput
 */
- (void)createLoadBalancer:(AWSElasticLoadBalancingCreateLoadBalancerInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingCreateLoadBalancerOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a rule for the specified listener. The listener must be associated with an Application Load Balancer.</p><p>Each rule consists of a priority, one or more actions, and one or more conditions. Rules are evaluated in priority order, from the lowest value to the highest value. When the conditions for a rule are met, its actions are performed. If the conditions for no rules are met, the actions for the default rule are performed. For more information, see <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html#listener-rules">Listener rules</a> in the <i>Application Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingCreateRuleOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorPriorityInUse`, `AWSElasticLoadBalancingErrorTooManyTargetGroups`, `AWSElasticLoadBalancingErrorTooManyRules`, `AWSElasticLoadBalancingErrorTargetGroupAssociationLimit`, `AWSElasticLoadBalancingErrorIncompatibleProtocols`, `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorTargetGroupNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorTooManyRegistrationsForTargetId`, `AWSElasticLoadBalancingErrorTooManyTargets`, `AWSElasticLoadBalancingErrorUnsupportedProtocol`, `AWSElasticLoadBalancingErrorTooManyActions`, `AWSElasticLoadBalancingErrorInvalidLoadBalancerAction`, `AWSElasticLoadBalancingErrorTooManyUniqueTargetGroupsPerLoadBalancer`, `AWSElasticLoadBalancingErrorTooManyTags`.
 
 @see AWSElasticLoadBalancingCreateRuleInput
 @see AWSElasticLoadBalancingCreateRuleOutput
 */
- (AWSTask<AWSElasticLoadBalancingCreateRuleOutput *> *)createRule:(AWSElasticLoadBalancingCreateRuleInput *)request;

/**
 <p>Creates a rule for the specified listener. The listener must be associated with an Application Load Balancer.</p><p>Each rule consists of a priority, one or more actions, and one or more conditions. Rules are evaluated in priority order, from the lowest value to the highest value. When the conditions for a rule are met, its actions are performed. If the conditions for no rules are met, the actions for the default rule are performed. For more information, see <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html#listener-rules">Listener rules</a> in the <i>Application Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorPriorityInUse`, `AWSElasticLoadBalancingErrorTooManyTargetGroups`, `AWSElasticLoadBalancingErrorTooManyRules`, `AWSElasticLoadBalancingErrorTargetGroupAssociationLimit`, `AWSElasticLoadBalancingErrorIncompatibleProtocols`, `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorTargetGroupNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorTooManyRegistrationsForTargetId`, `AWSElasticLoadBalancingErrorTooManyTargets`, `AWSElasticLoadBalancingErrorUnsupportedProtocol`, `AWSElasticLoadBalancingErrorTooManyActions`, `AWSElasticLoadBalancingErrorInvalidLoadBalancerAction`, `AWSElasticLoadBalancingErrorTooManyUniqueTargetGroupsPerLoadBalancer`, `AWSElasticLoadBalancingErrorTooManyTags`.
 
 @see AWSElasticLoadBalancingCreateRuleInput
 @see AWSElasticLoadBalancingCreateRuleOutput
 */
- (void)createRule:(AWSElasticLoadBalancingCreateRuleInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingCreateRuleOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a target group.</p><p>For more information, see the following:</p><ul><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html">Target groups for your Application Load Balancers</a></p></li><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-target-groups.html">Target groups for your Network Load Balancers</a></p></li><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/target-groups.html">Target groups for your Gateway Load Balancers</a></p></li></ul><p>This operation is idempotent, which means that it completes at most one time. If you attempt to create multiple target groups with the same settings, each call succeeds.</p>
 
 @param request A container for the necessary parameters to execute the CreateTargetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingCreateTargetGroupOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorDuplicateTargetGroupName`, `AWSElasticLoadBalancingErrorTooManyTargetGroups`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorTooManyTags`.
 
 @see AWSElasticLoadBalancingCreateTargetGroupInput
 @see AWSElasticLoadBalancingCreateTargetGroupOutput
 */
- (AWSTask<AWSElasticLoadBalancingCreateTargetGroupOutput *> *)createTargetGroup:(AWSElasticLoadBalancingCreateTargetGroupInput *)request;

/**
 <p>Creates a target group.</p><p>For more information, see the following:</p><ul><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html">Target groups for your Application Load Balancers</a></p></li><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-target-groups.html">Target groups for your Network Load Balancers</a></p></li><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/target-groups.html">Target groups for your Gateway Load Balancers</a></p></li></ul><p>This operation is idempotent, which means that it completes at most one time. If you attempt to create multiple target groups with the same settings, each call succeeds.</p>
 
 @param request A container for the necessary parameters to execute the CreateTargetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorDuplicateTargetGroupName`, `AWSElasticLoadBalancingErrorTooManyTargetGroups`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorTooManyTags`.
 
 @see AWSElasticLoadBalancingCreateTargetGroupInput
 @see AWSElasticLoadBalancingCreateTargetGroupOutput
 */
- (void)createTargetGroup:(AWSElasticLoadBalancingCreateTargetGroupInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingCreateTargetGroupOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified listener.</p><p>Alternatively, your listener is deleted when you delete the load balancer to which it is attached.</p>
 
 @param request A container for the necessary parameters to execute the DeleteListener service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDeleteListenerOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorResourceInUse`.
 
 @see AWSElasticLoadBalancingDeleteListenerInput
 @see AWSElasticLoadBalancingDeleteListenerOutput
 */
- (AWSTask<AWSElasticLoadBalancingDeleteListenerOutput *> *)deleteListener:(AWSElasticLoadBalancingDeleteListenerInput *)request;

/**
 <p>Deletes the specified listener.</p><p>Alternatively, your listener is deleted when you delete the load balancer to which it is attached.</p>
 
 @param request A container for the necessary parameters to execute the DeleteListener service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorResourceInUse`.
 
 @see AWSElasticLoadBalancingDeleteListenerInput
 @see AWSElasticLoadBalancingDeleteListenerOutput
 */
- (void)deleteListener:(AWSElasticLoadBalancingDeleteListenerInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDeleteListenerOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified Application Load Balancer, Network Load Balancer, or Gateway Load Balancer. Deleting a load balancer also deletes its listeners.</p><p>You can't delete a load balancer if deletion protection is enabled. If the load balancer does not exist or has already been deleted, the call succeeds.</p><p>Deleting a load balancer does not affect its registered targets. For example, your EC2 instances continue to run and are still registered to their target groups. If you no longer need these EC2 instances, you can stop or terminate them.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLoadBalancer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDeleteLoadBalancerOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorLoadBalancerNotFound`, `AWSElasticLoadBalancingErrorOperationNotPermitted`, `AWSElasticLoadBalancingErrorResourceInUse`.
 
 @see AWSElasticLoadBalancingDeleteLoadBalancerInput
 @see AWSElasticLoadBalancingDeleteLoadBalancerOutput
 */
- (AWSTask<AWSElasticLoadBalancingDeleteLoadBalancerOutput *> *)deleteLoadBalancer:(AWSElasticLoadBalancingDeleteLoadBalancerInput *)request;

/**
 <p>Deletes the specified Application Load Balancer, Network Load Balancer, or Gateway Load Balancer. Deleting a load balancer also deletes its listeners.</p><p>You can't delete a load balancer if deletion protection is enabled. If the load balancer does not exist or has already been deleted, the call succeeds.</p><p>Deleting a load balancer does not affect its registered targets. For example, your EC2 instances continue to run and are still registered to their target groups. If you no longer need these EC2 instances, you can stop or terminate them.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLoadBalancer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorLoadBalancerNotFound`, `AWSElasticLoadBalancingErrorOperationNotPermitted`, `AWSElasticLoadBalancingErrorResourceInUse`.
 
 @see AWSElasticLoadBalancingDeleteLoadBalancerInput
 @see AWSElasticLoadBalancingDeleteLoadBalancerOutput
 */
- (void)deleteLoadBalancer:(AWSElasticLoadBalancingDeleteLoadBalancerInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDeleteLoadBalancerOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified rule.</p><p>You can't delete the default rule.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDeleteRuleOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorRuleNotFound`, `AWSElasticLoadBalancingErrorOperationNotPermitted`.
 
 @see AWSElasticLoadBalancingDeleteRuleInput
 @see AWSElasticLoadBalancingDeleteRuleOutput
 */
- (AWSTask<AWSElasticLoadBalancingDeleteRuleOutput *> *)deleteRule:(AWSElasticLoadBalancingDeleteRuleInput *)request;

/**
 <p>Deletes the specified rule.</p><p>You can't delete the default rule.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorRuleNotFound`, `AWSElasticLoadBalancingErrorOperationNotPermitted`.
 
 @see AWSElasticLoadBalancingDeleteRuleInput
 @see AWSElasticLoadBalancingDeleteRuleOutput
 */
- (void)deleteRule:(AWSElasticLoadBalancingDeleteRuleInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDeleteRuleOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified target group.</p><p>You can delete a target group if it is not referenced by any actions. Deleting a target group also deletes any associated health checks. Deleting a target group does not affect its registered targets. For example, any EC2 instances continue to run until you stop or terminate them.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTargetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDeleteTargetGroupOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorResourceInUse`.
 
 @see AWSElasticLoadBalancingDeleteTargetGroupInput
 @see AWSElasticLoadBalancingDeleteTargetGroupOutput
 */
- (AWSTask<AWSElasticLoadBalancingDeleteTargetGroupOutput *> *)deleteTargetGroup:(AWSElasticLoadBalancingDeleteTargetGroupInput *)request;

/**
 <p>Deletes the specified target group.</p><p>You can delete a target group if it is not referenced by any actions. Deleting a target group also deletes any associated health checks. Deleting a target group does not affect its registered targets. For example, any EC2 instances continue to run until you stop or terminate them.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTargetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorResourceInUse`.
 
 @see AWSElasticLoadBalancingDeleteTargetGroupInput
 @see AWSElasticLoadBalancingDeleteTargetGroupOutput
 */
- (void)deleteTargetGroup:(AWSElasticLoadBalancingDeleteTargetGroupInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDeleteTargetGroupOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deregisters the specified targets from the specified target group. After the targets are deregistered, they no longer receive traffic from the load balancer.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterTargets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDeregisterTargetsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorTargetGroupNotFound`, `AWSElasticLoadBalancingErrorInvalidTarget`.
 
 @see AWSElasticLoadBalancingDeregisterTargetsInput
 @see AWSElasticLoadBalancingDeregisterTargetsOutput
 */
- (AWSTask<AWSElasticLoadBalancingDeregisterTargetsOutput *> *)deregisterTargets:(AWSElasticLoadBalancingDeregisterTargetsInput *)request;

/**
 <p>Deregisters the specified targets from the specified target group. After the targets are deregistered, they no longer receive traffic from the load balancer.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterTargets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorTargetGroupNotFound`, `AWSElasticLoadBalancingErrorInvalidTarget`.
 
 @see AWSElasticLoadBalancingDeregisterTargetsInput
 @see AWSElasticLoadBalancingDeregisterTargetsOutput
 */
- (void)deregisterTargets:(AWSElasticLoadBalancingDeregisterTargetsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDeregisterTargetsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the current Elastic Load Balancing resource limits for your Amazon Web Services account.</p><p>For more information, see the following:</p><ul><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-limits.html">Quotas for your Application Load Balancers</a></p></li><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-limits.html">Quotas for your Network Load Balancers</a></p></li><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/quotas-limits.html">Quotas for your Gateway Load Balancers</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeAccountLimits service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeAccountLimitsOutput`.
 
 @see AWSElasticLoadBalancingDescribeAccountLimitsInput
 @see AWSElasticLoadBalancingDescribeAccountLimitsOutput
 */
- (AWSTask<AWSElasticLoadBalancingDescribeAccountLimitsOutput *> *)describeAccountLimits:(AWSElasticLoadBalancingDescribeAccountLimitsInput *)request;

/**
 <p>Describes the current Elastic Load Balancing resource limits for your Amazon Web Services account.</p><p>For more information, see the following:</p><ul><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-limits.html">Quotas for your Application Load Balancers</a></p></li><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-limits.html">Quotas for your Network Load Balancers</a></p></li><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/quotas-limits.html">Quotas for your Gateway Load Balancers</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeAccountLimits service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSElasticLoadBalancingDescribeAccountLimitsInput
 @see AWSElasticLoadBalancingDescribeAccountLimitsOutput
 */
- (void)describeAccountLimits:(AWSElasticLoadBalancingDescribeAccountLimitsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDescribeAccountLimitsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the default certificate and the certificate list for the specified HTTPS or TLS listener.</p><p>If the default certificate is also in the certificate list, it appears twice in the results (once with <code>IsDefault</code> set to true and once with <code>IsDefault</code> set to false).</p><p>For more information, see <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#https-listener-certificates">SSL certificates</a> in the <i>Application Load Balancers Guide</i> or <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html#tls-listener-certificate">Server certificates</a> in the <i>Network Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeListenerCertificates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeListenerCertificatesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorListenerNotFound`.
 
 @see AWSElasticLoadBalancingDescribeListenerCertificatesInput
 @see AWSElasticLoadBalancingDescribeListenerCertificatesOutput
 */
- (AWSTask<AWSElasticLoadBalancingDescribeListenerCertificatesOutput *> *)describeListenerCertificates:(AWSElasticLoadBalancingDescribeListenerCertificatesInput *)request;

/**
 <p>Describes the default certificate and the certificate list for the specified HTTPS or TLS listener.</p><p>If the default certificate is also in the certificate list, it appears twice in the results (once with <code>IsDefault</code> set to true and once with <code>IsDefault</code> set to false).</p><p>For more information, see <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#https-listener-certificates">SSL certificates</a> in the <i>Application Load Balancers Guide</i> or <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html#tls-listener-certificate">Server certificates</a> in the <i>Network Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeListenerCertificates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorListenerNotFound`.
 
 @see AWSElasticLoadBalancingDescribeListenerCertificatesInput
 @see AWSElasticLoadBalancingDescribeListenerCertificatesOutput
 */
- (void)describeListenerCertificates:(AWSElasticLoadBalancingDescribeListenerCertificatesInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDescribeListenerCertificatesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified listeners or the listeners for the specified Application Load Balancer, Network Load Balancer, or Gateway Load Balancer. You must specify either a load balancer or one or more listeners.</p>
 
 @param request A container for the necessary parameters to execute the DescribeListeners service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeListenersOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorLoadBalancerNotFound`, `AWSElasticLoadBalancingErrorUnsupportedProtocol`.
 
 @see AWSElasticLoadBalancingDescribeListenersInput
 @see AWSElasticLoadBalancingDescribeListenersOutput
 */
- (AWSTask<AWSElasticLoadBalancingDescribeListenersOutput *> *)describeListeners:(AWSElasticLoadBalancingDescribeListenersInput *)request;

/**
 <p>Describes the specified listeners or the listeners for the specified Application Load Balancer, Network Load Balancer, or Gateway Load Balancer. You must specify either a load balancer or one or more listeners.</p>
 
 @param request A container for the necessary parameters to execute the DescribeListeners service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorLoadBalancerNotFound`, `AWSElasticLoadBalancingErrorUnsupportedProtocol`.
 
 @see AWSElasticLoadBalancingDescribeListenersInput
 @see AWSElasticLoadBalancingDescribeListenersOutput
 */
- (void)describeListeners:(AWSElasticLoadBalancingDescribeListenersInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDescribeListenersOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the attributes for the specified Application Load Balancer, Network Load Balancer, or Gateway Load Balancer.</p><p>For more information, see the following:</p><ul><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/application-load-balancers.html#load-balancer-attributes">Load balancer attributes</a> in the <i>Application Load Balancers Guide</i></p></li><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/network-load-balancers.html#load-balancer-attributes">Load balancer attributes</a> in the <i>Network Load Balancers Guide</i></p></li><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/gateway-load-balancers.html#load-balancer-attributes">Load balancer attributes</a> in the <i>Gateway Load Balancers Guide</i></p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancerAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorLoadBalancerNotFound`.
 
 @see AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput
 @see AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput
 */
- (AWSTask<AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput *> *)describeLoadBalancerAttributes:(AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput *)request;

/**
 <p>Describes the attributes for the specified Application Load Balancer, Network Load Balancer, or Gateway Load Balancer.</p><p>For more information, see the following:</p><ul><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/application-load-balancers.html#load-balancer-attributes">Load balancer attributes</a> in the <i>Application Load Balancers Guide</i></p></li><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/network-load-balancers.html#load-balancer-attributes">Load balancer attributes</a> in the <i>Network Load Balancers Guide</i></p></li><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/gateway-load-balancers.html#load-balancer-attributes">Load balancer attributes</a> in the <i>Gateway Load Balancers Guide</i></p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancerAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorLoadBalancerNotFound`.
 
 @see AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput
 @see AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput
 */
- (void)describeLoadBalancerAttributes:(AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified load balancers or all of your load balancers.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeLoadBalancersOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorLoadBalancerNotFound`.
 
 @see AWSElasticLoadBalancingDescribeLoadBalancersInput
 @see AWSElasticLoadBalancingDescribeLoadBalancersOutput
 */
- (AWSTask<AWSElasticLoadBalancingDescribeLoadBalancersOutput *> *)describeLoadBalancers:(AWSElasticLoadBalancingDescribeLoadBalancersInput *)request;

/**
 <p>Describes the specified load balancers or all of your load balancers.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorLoadBalancerNotFound`.
 
 @see AWSElasticLoadBalancingDescribeLoadBalancersInput
 @see AWSElasticLoadBalancingDescribeLoadBalancersOutput
 */
- (void)describeLoadBalancers:(AWSElasticLoadBalancingDescribeLoadBalancersInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDescribeLoadBalancersOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified rules or the rules for the specified listener. You must specify either a listener or one or more rules.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRules service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeRulesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorRuleNotFound`, `AWSElasticLoadBalancingErrorUnsupportedProtocol`.
 
 @see AWSElasticLoadBalancingDescribeRulesInput
 @see AWSElasticLoadBalancingDescribeRulesOutput
 */
- (AWSTask<AWSElasticLoadBalancingDescribeRulesOutput *> *)describeRules:(AWSElasticLoadBalancingDescribeRulesInput *)request;

/**
 <p>Describes the specified rules or the rules for the specified listener. You must specify either a listener or one or more rules.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRules service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorRuleNotFound`, `AWSElasticLoadBalancingErrorUnsupportedProtocol`.
 
 @see AWSElasticLoadBalancingDescribeRulesInput
 @see AWSElasticLoadBalancingDescribeRulesOutput
 */
- (void)describeRules:(AWSElasticLoadBalancingDescribeRulesInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDescribeRulesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified policies or all policies used for SSL negotiation.</p><p>For more information, see <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#describe-ssl-policies">Security policies</a> in the <i>Application Load Balancers Guide</i> or <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html#describe-ssl-policies">Security policies</a> in the <i>Network Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSSLPolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeSSLPoliciesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorSSLPolicyNotFound`.
 
 @see AWSElasticLoadBalancingDescribeSSLPoliciesInput
 @see AWSElasticLoadBalancingDescribeSSLPoliciesOutput
 */
- (AWSTask<AWSElasticLoadBalancingDescribeSSLPoliciesOutput *> *)describeSSLPolicies:(AWSElasticLoadBalancingDescribeSSLPoliciesInput *)request;

/**
 <p>Describes the specified policies or all policies used for SSL negotiation.</p><p>For more information, see <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#describe-ssl-policies">Security policies</a> in the <i>Application Load Balancers Guide</i> or <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html#describe-ssl-policies">Security policies</a> in the <i>Network Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSSLPolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorSSLPolicyNotFound`.
 
 @see AWSElasticLoadBalancingDescribeSSLPoliciesInput
 @see AWSElasticLoadBalancingDescribeSSLPoliciesOutput
 */
- (void)describeSSLPolicies:(AWSElasticLoadBalancingDescribeSSLPoliciesInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDescribeSSLPoliciesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the tags for the specified Elastic Load Balancing resources. You can describe the tags for one or more Application Load Balancers, Network Load Balancers, Gateway Load Balancers, target groups, listeners, or rules.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeTagsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorLoadBalancerNotFound`, `AWSElasticLoadBalancingErrorTargetGroupNotFound`, `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorRuleNotFound`.
 
 @see AWSElasticLoadBalancingDescribeTagsInput
 @see AWSElasticLoadBalancingDescribeTagsOutput
 */
- (AWSTask<AWSElasticLoadBalancingDescribeTagsOutput *> *)describeTags:(AWSElasticLoadBalancingDescribeTagsInput *)request;

/**
 <p>Describes the tags for the specified Elastic Load Balancing resources. You can describe the tags for one or more Application Load Balancers, Network Load Balancers, Gateway Load Balancers, target groups, listeners, or rules.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorLoadBalancerNotFound`, `AWSElasticLoadBalancingErrorTargetGroupNotFound`, `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorRuleNotFound`.
 
 @see AWSElasticLoadBalancingDescribeTagsInput
 @see AWSElasticLoadBalancingDescribeTagsOutput
 */
- (void)describeTags:(AWSElasticLoadBalancingDescribeTagsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDescribeTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the attributes for the specified target group.</p><p>For more information, see the following:</p><ul><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html#target-group-attributes">Target group attributes</a> in the <i>Application Load Balancers Guide</i></p></li><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-target-groups.html#target-group-attributes">Target group attributes</a> in the <i>Network Load Balancers Guide</i></p></li><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/target-groups.html#target-group-attributes">Target group attributes</a> in the <i>Gateway Load Balancers Guide</i></p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeTargetGroupAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeTargetGroupAttributesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorTargetGroupNotFound`.
 
 @see AWSElasticLoadBalancingDescribeTargetGroupAttributesInput
 @see AWSElasticLoadBalancingDescribeTargetGroupAttributesOutput
 */
- (AWSTask<AWSElasticLoadBalancingDescribeTargetGroupAttributesOutput *> *)describeTargetGroupAttributes:(AWSElasticLoadBalancingDescribeTargetGroupAttributesInput *)request;

/**
 <p>Describes the attributes for the specified target group.</p><p>For more information, see the following:</p><ul><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html#target-group-attributes">Target group attributes</a> in the <i>Application Load Balancers Guide</i></p></li><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-target-groups.html#target-group-attributes">Target group attributes</a> in the <i>Network Load Balancers Guide</i></p></li><li><p><a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/target-groups.html#target-group-attributes">Target group attributes</a> in the <i>Gateway Load Balancers Guide</i></p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeTargetGroupAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorTargetGroupNotFound`.
 
 @see AWSElasticLoadBalancingDescribeTargetGroupAttributesInput
 @see AWSElasticLoadBalancingDescribeTargetGroupAttributesOutput
 */
- (void)describeTargetGroupAttributes:(AWSElasticLoadBalancingDescribeTargetGroupAttributesInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDescribeTargetGroupAttributesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified target groups or all of your target groups. By default, all target groups are described. Alternatively, you can specify one of the following to filter the results: the ARN of the load balancer, the names of one or more target groups, or the ARNs of one or more target groups.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTargetGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeTargetGroupsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorLoadBalancerNotFound`, `AWSElasticLoadBalancingErrorTargetGroupNotFound`.
 
 @see AWSElasticLoadBalancingDescribeTargetGroupsInput
 @see AWSElasticLoadBalancingDescribeTargetGroupsOutput
 */
- (AWSTask<AWSElasticLoadBalancingDescribeTargetGroupsOutput *> *)describeTargetGroups:(AWSElasticLoadBalancingDescribeTargetGroupsInput *)request;

/**
 <p>Describes the specified target groups or all of your target groups. By default, all target groups are described. Alternatively, you can specify one of the following to filter the results: the ARN of the load balancer, the names of one or more target groups, or the ARNs of one or more target groups.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTargetGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorLoadBalancerNotFound`, `AWSElasticLoadBalancingErrorTargetGroupNotFound`.
 
 @see AWSElasticLoadBalancingDescribeTargetGroupsInput
 @see AWSElasticLoadBalancingDescribeTargetGroupsOutput
 */
- (void)describeTargetGroups:(AWSElasticLoadBalancingDescribeTargetGroupsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDescribeTargetGroupsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the health of the specified targets or all of your targets.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTargetHealth service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeTargetHealthOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorInvalidTarget`, `AWSElasticLoadBalancingErrorTargetGroupNotFound`, `AWSElasticLoadBalancingErrorHealthUnavailable`.
 
 @see AWSElasticLoadBalancingDescribeTargetHealthInput
 @see AWSElasticLoadBalancingDescribeTargetHealthOutput
 */
- (AWSTask<AWSElasticLoadBalancingDescribeTargetHealthOutput *> *)describeTargetHealth:(AWSElasticLoadBalancingDescribeTargetHealthInput *)request;

/**
 <p>Describes the health of the specified targets or all of your targets.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTargetHealth service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorInvalidTarget`, `AWSElasticLoadBalancingErrorTargetGroupNotFound`, `AWSElasticLoadBalancingErrorHealthUnavailable`.
 
 @see AWSElasticLoadBalancingDescribeTargetHealthInput
 @see AWSElasticLoadBalancingDescribeTargetHealthOutput
 */
- (void)describeTargetHealth:(AWSElasticLoadBalancingDescribeTargetHealthInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDescribeTargetHealthOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Replaces the specified properties of the specified listener. Any properties that you do not specify remain unchanged.</p><p>Changing the protocol from HTTPS to HTTP, or from TLS to TCP, removes the security policy and default certificate properties. If you change the protocol from HTTP to HTTPS, or from TCP to TLS, you must add the security policy and default certificate properties.</p><p>To add an item to a list, remove an item from a list, or update an item in a list, you must provide the entire list. For example, to add an action, specify a list with the current actions plus the new action.</p>
 
 @param request A container for the necessary parameters to execute the ModifyListener service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingModifyListenerOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorDuplicateListener`, `AWSElasticLoadBalancingErrorTooManyListeners`, `AWSElasticLoadBalancingErrorTooManyCertificates`, `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorTargetGroupNotFound`, `AWSElasticLoadBalancingErrorTargetGroupAssociationLimit`, `AWSElasticLoadBalancingErrorIncompatibleProtocols`, `AWSElasticLoadBalancingErrorSSLPolicyNotFound`, `AWSElasticLoadBalancingErrorCertificateNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorUnsupportedProtocol`, `AWSElasticLoadBalancingErrorTooManyRegistrationsForTargetId`, `AWSElasticLoadBalancingErrorTooManyTargets`, `AWSElasticLoadBalancingErrorTooManyActions`, `AWSElasticLoadBalancingErrorInvalidLoadBalancerAction`, `AWSElasticLoadBalancingErrorTooManyUniqueTargetGroupsPerLoadBalancer`, `AWSElasticLoadBalancingErrorALPNPolicyNotSupported`.
 
 @see AWSElasticLoadBalancingModifyListenerInput
 @see AWSElasticLoadBalancingModifyListenerOutput
 */
- (AWSTask<AWSElasticLoadBalancingModifyListenerOutput *> *)modifyListener:(AWSElasticLoadBalancingModifyListenerInput *)request;

/**
 <p>Replaces the specified properties of the specified listener. Any properties that you do not specify remain unchanged.</p><p>Changing the protocol from HTTPS to HTTP, or from TLS to TCP, removes the security policy and default certificate properties. If you change the protocol from HTTP to HTTPS, or from TCP to TLS, you must add the security policy and default certificate properties.</p><p>To add an item to a list, remove an item from a list, or update an item in a list, you must provide the entire list. For example, to add an action, specify a list with the current actions plus the new action.</p>
 
 @param request A container for the necessary parameters to execute the ModifyListener service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorDuplicateListener`, `AWSElasticLoadBalancingErrorTooManyListeners`, `AWSElasticLoadBalancingErrorTooManyCertificates`, `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorTargetGroupNotFound`, `AWSElasticLoadBalancingErrorTargetGroupAssociationLimit`, `AWSElasticLoadBalancingErrorIncompatibleProtocols`, `AWSElasticLoadBalancingErrorSSLPolicyNotFound`, `AWSElasticLoadBalancingErrorCertificateNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorUnsupportedProtocol`, `AWSElasticLoadBalancingErrorTooManyRegistrationsForTargetId`, `AWSElasticLoadBalancingErrorTooManyTargets`, `AWSElasticLoadBalancingErrorTooManyActions`, `AWSElasticLoadBalancingErrorInvalidLoadBalancerAction`, `AWSElasticLoadBalancingErrorTooManyUniqueTargetGroupsPerLoadBalancer`, `AWSElasticLoadBalancingErrorALPNPolicyNotSupported`.
 
 @see AWSElasticLoadBalancingModifyListenerInput
 @see AWSElasticLoadBalancingModifyListenerOutput
 */
- (void)modifyListener:(AWSElasticLoadBalancingModifyListenerInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingModifyListenerOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the specified attributes of the specified Application Load Balancer, Network Load Balancer, or Gateway Load Balancer.</p><p>If any of the specified attributes can't be modified as requested, the call fails. Any existing attributes that you do not modify retain their current values.</p>
 
 @param request A container for the necessary parameters to execute the ModifyLoadBalancerAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorLoadBalancerNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingModifyLoadBalancerAttributesInput
 @see AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput
 */
- (AWSTask<AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput *> *)modifyLoadBalancerAttributes:(AWSElasticLoadBalancingModifyLoadBalancerAttributesInput *)request;

/**
 <p>Modifies the specified attributes of the specified Application Load Balancer, Network Load Balancer, or Gateway Load Balancer.</p><p>If any of the specified attributes can't be modified as requested, the call fails. Any existing attributes that you do not modify retain their current values.</p>
 
 @param request A container for the necessary parameters to execute the ModifyLoadBalancerAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorLoadBalancerNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingModifyLoadBalancerAttributesInput
 @see AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput
 */
- (void)modifyLoadBalancerAttributes:(AWSElasticLoadBalancingModifyLoadBalancerAttributesInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Replaces the specified properties of the specified rule. Any properties that you do not specify are unchanged.</p><p>To add an item to a list, remove an item from a list, or update an item in a list, you must provide the entire list. For example, to add an action, specify a list with the current actions plus the new action.</p>
 
 @param request A container for the necessary parameters to execute the ModifyRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingModifyRuleOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorTargetGroupAssociationLimit`, `AWSElasticLoadBalancingErrorIncompatibleProtocols`, `AWSElasticLoadBalancingErrorRuleNotFound`, `AWSElasticLoadBalancingErrorOperationNotPermitted`, `AWSElasticLoadBalancingErrorTooManyRegistrationsForTargetId`, `AWSElasticLoadBalancingErrorTooManyTargets`, `AWSElasticLoadBalancingErrorTargetGroupNotFound`, `AWSElasticLoadBalancingErrorUnsupportedProtocol`, `AWSElasticLoadBalancingErrorTooManyActions`, `AWSElasticLoadBalancingErrorInvalidLoadBalancerAction`, `AWSElasticLoadBalancingErrorTooManyUniqueTargetGroupsPerLoadBalancer`.
 
 @see AWSElasticLoadBalancingModifyRuleInput
 @see AWSElasticLoadBalancingModifyRuleOutput
 */
- (AWSTask<AWSElasticLoadBalancingModifyRuleOutput *> *)modifyRule:(AWSElasticLoadBalancingModifyRuleInput *)request;

/**
 <p>Replaces the specified properties of the specified rule. Any properties that you do not specify are unchanged.</p><p>To add an item to a list, remove an item from a list, or update an item in a list, you must provide the entire list. For example, to add an action, specify a list with the current actions plus the new action.</p>
 
 @param request A container for the necessary parameters to execute the ModifyRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorTargetGroupAssociationLimit`, `AWSElasticLoadBalancingErrorIncompatibleProtocols`, `AWSElasticLoadBalancingErrorRuleNotFound`, `AWSElasticLoadBalancingErrorOperationNotPermitted`, `AWSElasticLoadBalancingErrorTooManyRegistrationsForTargetId`, `AWSElasticLoadBalancingErrorTooManyTargets`, `AWSElasticLoadBalancingErrorTargetGroupNotFound`, `AWSElasticLoadBalancingErrorUnsupportedProtocol`, `AWSElasticLoadBalancingErrorTooManyActions`, `AWSElasticLoadBalancingErrorInvalidLoadBalancerAction`, `AWSElasticLoadBalancingErrorTooManyUniqueTargetGroupsPerLoadBalancer`.
 
 @see AWSElasticLoadBalancingModifyRuleInput
 @see AWSElasticLoadBalancingModifyRuleOutput
 */
- (void)modifyRule:(AWSElasticLoadBalancingModifyRuleInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingModifyRuleOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the health checks used when evaluating the health state of the targets in the specified target group.</p>
 
 @param request A container for the necessary parameters to execute the ModifyTargetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingModifyTargetGroupOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorTargetGroupNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingModifyTargetGroupInput
 @see AWSElasticLoadBalancingModifyTargetGroupOutput
 */
- (AWSTask<AWSElasticLoadBalancingModifyTargetGroupOutput *> *)modifyTargetGroup:(AWSElasticLoadBalancingModifyTargetGroupInput *)request;

/**
 <p>Modifies the health checks used when evaluating the health state of the targets in the specified target group.</p>
 
 @param request A container for the necessary parameters to execute the ModifyTargetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorTargetGroupNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingModifyTargetGroupInput
 @see AWSElasticLoadBalancingModifyTargetGroupOutput
 */
- (void)modifyTargetGroup:(AWSElasticLoadBalancingModifyTargetGroupInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingModifyTargetGroupOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the specified attributes of the specified target group.</p>
 
 @param request A container for the necessary parameters to execute the ModifyTargetGroupAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingModifyTargetGroupAttributesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorTargetGroupNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingModifyTargetGroupAttributesInput
 @see AWSElasticLoadBalancingModifyTargetGroupAttributesOutput
 */
- (AWSTask<AWSElasticLoadBalancingModifyTargetGroupAttributesOutput *> *)modifyTargetGroupAttributes:(AWSElasticLoadBalancingModifyTargetGroupAttributesInput *)request;

/**
 <p>Modifies the specified attributes of the specified target group.</p>
 
 @param request A container for the necessary parameters to execute the ModifyTargetGroupAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorTargetGroupNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingModifyTargetGroupAttributesInput
 @see AWSElasticLoadBalancingModifyTargetGroupAttributesOutput
 */
- (void)modifyTargetGroupAttributes:(AWSElasticLoadBalancingModifyTargetGroupAttributesInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingModifyTargetGroupAttributesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers the specified targets with the specified target group.</p><p>If the target is an EC2 instance, it must be in the <code>running</code> state when you register it.</p><p>By default, the load balancer routes requests to registered targets using the protocol and port for the target group. Alternatively, you can override the port for a target when you register it. You can register each EC2 instance or IP address with the same target group multiple times using different ports.</p><p>With a Network Load Balancer, you cannot register instances by instance ID if they have the following instance types: C1, CC1, CC2, CG1, CG2, CR1, CS1, G1, G2, HI1, HS1, M1, M2, M3, and T1. You can register instances of these types by IP address.</p>
 
 @param request A container for the necessary parameters to execute the RegisterTargets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingRegisterTargetsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorTargetGroupNotFound`, `AWSElasticLoadBalancingErrorTooManyTargets`, `AWSElasticLoadBalancingErrorInvalidTarget`, `AWSElasticLoadBalancingErrorTooManyRegistrationsForTargetId`.
 
 @see AWSElasticLoadBalancingRegisterTargetsInput
 @see AWSElasticLoadBalancingRegisterTargetsOutput
 */
- (AWSTask<AWSElasticLoadBalancingRegisterTargetsOutput *> *)registerTargets:(AWSElasticLoadBalancingRegisterTargetsInput *)request;

/**
 <p>Registers the specified targets with the specified target group.</p><p>If the target is an EC2 instance, it must be in the <code>running</code> state when you register it.</p><p>By default, the load balancer routes requests to registered targets using the protocol and port for the target group. Alternatively, you can override the port for a target when you register it. You can register each EC2 instance or IP address with the same target group multiple times using different ports.</p><p>With a Network Load Balancer, you cannot register instances by instance ID if they have the following instance types: C1, CC1, CC2, CG1, CG2, CR1, CS1, G1, G2, HI1, HS1, M1, M2, M3, and T1. You can register instances of these types by IP address.</p>
 
 @param request A container for the necessary parameters to execute the RegisterTargets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorTargetGroupNotFound`, `AWSElasticLoadBalancingErrorTooManyTargets`, `AWSElasticLoadBalancingErrorInvalidTarget`, `AWSElasticLoadBalancingErrorTooManyRegistrationsForTargetId`.
 
 @see AWSElasticLoadBalancingRegisterTargetsInput
 @see AWSElasticLoadBalancingRegisterTargetsOutput
 */
- (void)registerTargets:(AWSElasticLoadBalancingRegisterTargetsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingRegisterTargetsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified certificate from the certificate list for the specified HTTPS or TLS listener.</p>
 
 @param request A container for the necessary parameters to execute the RemoveListenerCertificates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingRemoveListenerCertificatesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorOperationNotPermitted`.
 
 @see AWSElasticLoadBalancingRemoveListenerCertificatesInput
 @see AWSElasticLoadBalancingRemoveListenerCertificatesOutput
 */
- (AWSTask<AWSElasticLoadBalancingRemoveListenerCertificatesOutput *> *)removeListenerCertificates:(AWSElasticLoadBalancingRemoveListenerCertificatesInput *)request;

/**
 <p>Removes the specified certificate from the certificate list for the specified HTTPS or TLS listener.</p>
 
 @param request A container for the necessary parameters to execute the RemoveListenerCertificates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorOperationNotPermitted`.
 
 @see AWSElasticLoadBalancingRemoveListenerCertificatesInput
 @see AWSElasticLoadBalancingRemoveListenerCertificatesOutput
 */
- (void)removeListenerCertificates:(AWSElasticLoadBalancingRemoveListenerCertificatesInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingRemoveListenerCertificatesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified tags from the specified Elastic Load Balancing resources. You can remove the tags for one or more Application Load Balancers, Network Load Balancers, Gateway Load Balancers, target groups, listeners, or rules.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingRemoveTagsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorLoadBalancerNotFound`, `AWSElasticLoadBalancingErrorTargetGroupNotFound`, `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorRuleNotFound`, `AWSElasticLoadBalancingErrorTooManyTags`.
 
 @see AWSElasticLoadBalancingRemoveTagsInput
 @see AWSElasticLoadBalancingRemoveTagsOutput
 */
- (AWSTask<AWSElasticLoadBalancingRemoveTagsOutput *> *)removeTags:(AWSElasticLoadBalancingRemoveTagsInput *)request;

/**
 <p>Removes the specified tags from the specified Elastic Load Balancing resources. You can remove the tags for one or more Application Load Balancers, Network Load Balancers, Gateway Load Balancers, target groups, listeners, or rules.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorLoadBalancerNotFound`, `AWSElasticLoadBalancingErrorTargetGroupNotFound`, `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorRuleNotFound`, `AWSElasticLoadBalancingErrorTooManyTags`.
 
 @see AWSElasticLoadBalancingRemoveTagsInput
 @see AWSElasticLoadBalancingRemoveTagsOutput
 */
- (void)removeTags:(AWSElasticLoadBalancingRemoveTagsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingRemoveTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the type of IP addresses used by the subnets of the specified Application Load Balancer or Network Load Balancer.</p>
 
 @param request A container for the necessary parameters to execute the SetIpAddressType service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingSetIpAddressTypeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorLoadBalancerNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorInvalidSubnet`.
 
 @see AWSElasticLoadBalancingSetIpAddressTypeInput
 @see AWSElasticLoadBalancingSetIpAddressTypeOutput
 */
- (AWSTask<AWSElasticLoadBalancingSetIpAddressTypeOutput *> *)setIpAddressType:(AWSElasticLoadBalancingSetIpAddressTypeInput *)request;

/**
 <p>Sets the type of IP addresses used by the subnets of the specified Application Load Balancer or Network Load Balancer.</p>
 
 @param request A container for the necessary parameters to execute the SetIpAddressType service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorLoadBalancerNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorInvalidSubnet`.
 
 @see AWSElasticLoadBalancingSetIpAddressTypeInput
 @see AWSElasticLoadBalancingSetIpAddressTypeOutput
 */
- (void)setIpAddressType:(AWSElasticLoadBalancingSetIpAddressTypeInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingSetIpAddressTypeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the priorities of the specified rules.</p><p>You can reorder the rules as long as there are no priority conflicts in the new order. Any existing rules that you do not specify retain their current priority.</p>
 
 @param request A container for the necessary parameters to execute the SetRulePriorities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingSetRulePrioritiesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorRuleNotFound`, `AWSElasticLoadBalancingErrorPriorityInUse`, `AWSElasticLoadBalancingErrorOperationNotPermitted`.
 
 @see AWSElasticLoadBalancingSetRulePrioritiesInput
 @see AWSElasticLoadBalancingSetRulePrioritiesOutput
 */
- (AWSTask<AWSElasticLoadBalancingSetRulePrioritiesOutput *> *)setRulePriorities:(AWSElasticLoadBalancingSetRulePrioritiesInput *)request;

/**
 <p>Sets the priorities of the specified rules.</p><p>You can reorder the rules as long as there are no priority conflicts in the new order. Any existing rules that you do not specify retain their current priority.</p>
 
 @param request A container for the necessary parameters to execute the SetRulePriorities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorRuleNotFound`, `AWSElasticLoadBalancingErrorPriorityInUse`, `AWSElasticLoadBalancingErrorOperationNotPermitted`.
 
 @see AWSElasticLoadBalancingSetRulePrioritiesInput
 @see AWSElasticLoadBalancingSetRulePrioritiesOutput
 */
- (void)setRulePriorities:(AWSElasticLoadBalancingSetRulePrioritiesInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingSetRulePrioritiesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates the specified security groups with the specified Application Load Balancer. The specified security groups override the previously associated security groups.</p><p>You can't specify a security group for a Network Load Balancer or Gateway Load Balancer.</p>
 
 @param request A container for the necessary parameters to execute the SetSecurityGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingSetSecurityGroupsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorLoadBalancerNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorInvalidSecurityGroup`.
 
 @see AWSElasticLoadBalancingSetSecurityGroupsInput
 @see AWSElasticLoadBalancingSetSecurityGroupsOutput
 */
- (AWSTask<AWSElasticLoadBalancingSetSecurityGroupsOutput *> *)setSecurityGroups:(AWSElasticLoadBalancingSetSecurityGroupsInput *)request;

/**
 <p>Associates the specified security groups with the specified Application Load Balancer. The specified security groups override the previously associated security groups.</p><p>You can't specify a security group for a Network Load Balancer or Gateway Load Balancer.</p>
 
 @param request A container for the necessary parameters to execute the SetSecurityGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorLoadBalancerNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorInvalidSecurityGroup`.
 
 @see AWSElasticLoadBalancingSetSecurityGroupsInput
 @see AWSElasticLoadBalancingSetSecurityGroupsOutput
 */
- (void)setSecurityGroups:(AWSElasticLoadBalancingSetSecurityGroupsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingSetSecurityGroupsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables the Availability Zones for the specified public subnets for the specified Application Load Balancer or Network Load Balancer. The specified subnets replace the previously enabled subnets.</p><p>When you specify subnets for a Network Load Balancer, you must include all subnets that were enabled previously, with their existing configurations, plus any additional subnets.</p>
 
 @param request A container for the necessary parameters to execute the SetSubnets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingSetSubnetsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorLoadBalancerNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorSubnetNotFound`, `AWSElasticLoadBalancingErrorInvalidSubnet`, `AWSElasticLoadBalancingErrorAllocationIdNotFound`, `AWSElasticLoadBalancingErrorAvailabilityZoneNotSupported`.
 
 @see AWSElasticLoadBalancingSetSubnetsInput
 @see AWSElasticLoadBalancingSetSubnetsOutput
 */
- (AWSTask<AWSElasticLoadBalancingSetSubnetsOutput *> *)setSubnets:(AWSElasticLoadBalancingSetSubnetsInput *)request;

/**
 <p>Enables the Availability Zones for the specified public subnets for the specified Application Load Balancer or Network Load Balancer. The specified subnets replace the previously enabled subnets.</p><p>When you specify subnets for a Network Load Balancer, you must include all subnets that were enabled previously, with their existing configurations, plus any additional subnets.</p>
 
 @param request A container for the necessary parameters to execute the SetSubnets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorLoadBalancerNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorSubnetNotFound`, `AWSElasticLoadBalancingErrorInvalidSubnet`, `AWSElasticLoadBalancingErrorAllocationIdNotFound`, `AWSElasticLoadBalancingErrorAvailabilityZoneNotSupported`.
 
 @see AWSElasticLoadBalancingSetSubnetsInput
 @see AWSElasticLoadBalancingSetSubnetsOutput
 */
- (void)setSubnets:(AWSElasticLoadBalancingSetSubnetsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingSetSubnetsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
