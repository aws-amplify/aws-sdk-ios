//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

/**
 <fullname>Elastic Load Balancing</fullname><p>A load balancer distributes incoming traffic across your EC2 instances. This enables you to increase the availability of your application. The load balancer also monitors the health of its registered instances and ensures that it routes traffic only to healthy instances. You configure your load balancer to accept incoming traffic by specifying one or more listeners, which are configured with a protocol and port number for connections from clients to the load balancer and a protocol and port number for connections from the load balancer to the instances.</p><p>Elastic Load Balancing supports two types of load balancers: Classic load balancers and Application load balancers (new). A Classic load balancer makes routing and load balancing decisions either at the transport layer (TCP/SSL) or the application layer (HTTP/HTTPS), and supports either EC2-Classic or a VPC. An Application load balancer makes routing and load balancing decisions at the application layer (HTTP/HTTPS), supports path-based routing, and can route requests to one or more ports on each EC2 instance or container instance in your virtual private cloud (VPC). For more information, see the .</p><p>This reference covers the 2012-06-01 API, which supports Classic load balancers. The 2015-12-01 API supports Application load balancers.</p><p>To get started, create a load balancer with one or more listeners using <a>CreateLoadBalancer</a>. Register your instances with the load balancer using <a>RegisterInstancesWithLoadBalancer</a>.</p><p>All Elastic Load Balancing operations are <i>idempotent</i>, which means that they complete at most one time. If you repeat an operation, it succeeds with a 200 OK response code.</p>
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

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
         AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration

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

     let ElasticLoadBalancing = AWSElasticLoadBalancing.defaultElasticLoadBalancing()

 *Objective-C*

     AWSElasticLoadBalancing *ElasticLoadBalancing = [AWSElasticLoadBalancing defaultElasticLoadBalancing];

 @return The default service client.
 */
+ (instancetype)defaultElasticLoadBalancing;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSElasticLoadBalancing.registerElasticLoadBalancingWithConfiguration(configuration, forKey: "USWest2ElasticLoadBalancing")

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

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSElasticLoadBalancing.registerElasticLoadBalancingWithConfiguration(configuration, forKey: "USWest2ElasticLoadBalancing")

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
 <p>Adds the specified tags to the specified load balancer. Each load balancer can have a maximum of 10 tags.</p><p>Each tag consists of a key and an optional value. If a tag with the same key is already associated with the load balancer, <code>AddTags</code> updates its value.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/add-remove-tags.html">Tag Your Classic Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AddTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingAddTagsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorTooManyTags`, `AWSElasticLoadBalancingErrorDuplicateTagKeys`.
 
 @see AWSElasticLoadBalancingAddTagsInput
 @see AWSElasticLoadBalancingAddTagsOutput
 */
- (AWSTask<AWSElasticLoadBalancingAddTagsOutput *> *)addTags:(AWSElasticLoadBalancingAddTagsInput *)request;

/**
 <p>Adds the specified tags to the specified load balancer. Each load balancer can have a maximum of 10 tags.</p><p>Each tag consists of a key and an optional value. If a tag with the same key is already associated with the load balancer, <code>AddTags</code> updates its value.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/add-remove-tags.html">Tag Your Classic Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AddTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorTooManyTags`, `AWSElasticLoadBalancingErrorDuplicateTagKeys`.
 
 @see AWSElasticLoadBalancingAddTagsInput
 @see AWSElasticLoadBalancingAddTagsOutput
 */
- (void)addTags:(AWSElasticLoadBalancingAddTagsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingAddTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates one or more security groups with your load balancer in a virtual private cloud (VPC). The specified security groups override the previously associated security groups.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-security-groups.html#elb-vpc-security-groups">Security Groups for Load Balancers in a VPC</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ApplySecurityGroupsToLoadBalancer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorInvalidSecurityGroup`.
 
 @see AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput
 @see AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput
 */
- (AWSTask<AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput *> *)applySecurityGroupsToLoadBalancer:(AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput *)request;

/**
 <p>Associates one or more security groups with your load balancer in a virtual private cloud (VPC). The specified security groups override the previously associated security groups.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-security-groups.html#elb-vpc-security-groups">Security Groups for Load Balancers in a VPC</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ApplySecurityGroupsToLoadBalancer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorInvalidSecurityGroup`.
 
 @see AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput
 @see AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput
 */
- (void)applySecurityGroupsToLoadBalancer:(AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds one or more subnets to the set of configured subnets for the specified load balancer.</p><p>The load balancer evenly distributes requests across all registered subnets. For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-manage-subnets.html">Add or Remove Subnets for Your Load Balancer in a VPC</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AttachLoadBalancerToSubnets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorSubnetNotFound`, `AWSElasticLoadBalancingErrorInvalidSubnet`.
 
 @see AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput
 @see AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput
 */
- (AWSTask<AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput *> *)attachLoadBalancerToSubnets:(AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput *)request;

/**
 <p>Adds one or more subnets to the set of configured subnets for the specified load balancer.</p><p>The load balancer evenly distributes requests across all registered subnets. For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-manage-subnets.html">Add or Remove Subnets for Your Load Balancer in a VPC</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AttachLoadBalancerToSubnets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorSubnetNotFound`, `AWSElasticLoadBalancingErrorInvalidSubnet`.
 
 @see AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput
 @see AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput
 */
- (void)attachLoadBalancerToSubnets:(AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Specifies the health check settings to use when evaluating the health state of your EC2 instances.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-healthchecks.html">Configure Health Checks for Your Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ConfigureHealthCheck service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingConfigureHealthCheckOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingConfigureHealthCheckInput
 @see AWSElasticLoadBalancingConfigureHealthCheckOutput
 */
- (AWSTask<AWSElasticLoadBalancingConfigureHealthCheckOutput *> *)configureHealthCheck:(AWSElasticLoadBalancingConfigureHealthCheckInput *)request;

/**
 <p>Specifies the health check settings to use when evaluating the health state of your EC2 instances.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-healthchecks.html">Configure Health Checks for Your Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ConfigureHealthCheck service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingConfigureHealthCheckInput
 @see AWSElasticLoadBalancingConfigureHealthCheckOutput
 */
- (void)configureHealthCheck:(AWSElasticLoadBalancingConfigureHealthCheckInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingConfigureHealthCheckOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Generates a stickiness policy with sticky session lifetimes that follow that of an application-generated cookie. This policy can be associated only with HTTP/HTTPS listeners.</p><p>This policy is similar to the policy created by <a>CreateLBCookieStickinessPolicy</a>, except that the lifetime of the special Elastic Load Balancing cookie, <code>AWSELB</code>, follows the lifetime of the application-generated cookie specified in the policy configuration. The load balancer only inserts a new stickiness cookie when the application response includes a new application cookie.</p><p>If the application cookie is explicitly removed or expires, the session stops being sticky until a new application cookie is issued.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-application">Application-Controlled Session Stickiness</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateAppCookieStickinessPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorDuplicatePolicyName`, `AWSElasticLoadBalancingErrorTooManyPolicies`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput
 @see AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput
 */
- (AWSTask<AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput *> *)createAppCookieStickinessPolicy:(AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput *)request;

/**
 <p>Generates a stickiness policy with sticky session lifetimes that follow that of an application-generated cookie. This policy can be associated only with HTTP/HTTPS listeners.</p><p>This policy is similar to the policy created by <a>CreateLBCookieStickinessPolicy</a>, except that the lifetime of the special Elastic Load Balancing cookie, <code>AWSELB</code>, follows the lifetime of the application-generated cookie specified in the policy configuration. The load balancer only inserts a new stickiness cookie when the application response includes a new application cookie.</p><p>If the application cookie is explicitly removed or expires, the session stops being sticky until a new application cookie is issued.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-application">Application-Controlled Session Stickiness</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateAppCookieStickinessPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorDuplicatePolicyName`, `AWSElasticLoadBalancingErrorTooManyPolicies`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput
 @see AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput
 */
- (void)createAppCookieStickinessPolicy:(AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Generates a stickiness policy with sticky session lifetimes controlled by the lifetime of the browser (user-agent) or a specified expiration period. This policy can be associated only with HTTP/HTTPS listeners.</p><p>When a load balancer implements this policy, the load balancer uses a special cookie to track the instance for each request. When the load balancer receives a request, it first checks to see if this cookie is present in the request. If so, the load balancer sends the request to the application server specified in the cookie. If not, the load balancer sends the request to a server that is chosen based on the existing load-balancing algorithm.</p><p>A cookie is inserted into the response for binding subsequent requests from the same user to that server. The validity of the cookie is based on the cookie expiration time, which is specified in the policy configuration.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-duration">Duration-Based Session Stickiness</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateLBCookieStickinessPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorDuplicatePolicyName`, `AWSElasticLoadBalancingErrorTooManyPolicies`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput
 @see AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput
 */
- (AWSTask<AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput *> *)createLBCookieStickinessPolicy:(AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput *)request;

/**
 <p>Generates a stickiness policy with sticky session lifetimes controlled by the lifetime of the browser (user-agent) or a specified expiration period. This policy can be associated only with HTTP/HTTPS listeners.</p><p>When a load balancer implements this policy, the load balancer uses a special cookie to track the instance for each request. When the load balancer receives a request, it first checks to see if this cookie is present in the request. If so, the load balancer sends the request to the application server specified in the cookie. If not, the load balancer sends the request to a server that is chosen based on the existing load-balancing algorithm.</p><p>A cookie is inserted into the response for binding subsequent requests from the same user to that server. The validity of the cookie is based on the cookie expiration time, which is specified in the policy configuration.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-duration">Duration-Based Session Stickiness</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateLBCookieStickinessPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorDuplicatePolicyName`, `AWSElasticLoadBalancingErrorTooManyPolicies`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput
 @see AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput
 */
- (void)createLBCookieStickinessPolicy:(AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Classic load balancer.</p><p>You can add listeners, security groups, subnets, and tags when you create your load balancer, or you can add them later using <a>CreateLoadBalancerListeners</a>, <a>ApplySecurityGroupsToLoadBalancer</a>, <a>AttachLoadBalancerToSubnets</a>, and <a>AddTags</a>.</p><p>To describe your current load balancers, see <a>DescribeLoadBalancers</a>. When you are finished with a load balancer, you can delete it using <a>DeleteLoadBalancer</a>.</p><p>You can create up to 20 load balancers per region per account. You can request an increase for the number of load balancers for your account. For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-limits.html">Limits for Your Classic Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateLoadBalancer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingCreateAccessPointOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorDuplicateAccessPointName`, `AWSElasticLoadBalancingErrorTooManyAccessPoints`, `AWSElasticLoadBalancingErrorCertificateNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorSubnetNotFound`, `AWSElasticLoadBalancingErrorInvalidSubnet`, `AWSElasticLoadBalancingErrorInvalidSecurityGroup`, `AWSElasticLoadBalancingErrorInvalidScheme`, `AWSElasticLoadBalancingErrorTooManyTags`, `AWSElasticLoadBalancingErrorDuplicateTagKeys`, `AWSElasticLoadBalancingErrorUnsupportedProtocol`.
 
 @see AWSElasticLoadBalancingCreateAccessPointInput
 @see AWSElasticLoadBalancingCreateAccessPointOutput
 */
- (AWSTask<AWSElasticLoadBalancingCreateAccessPointOutput *> *)createLoadBalancer:(AWSElasticLoadBalancingCreateAccessPointInput *)request;

/**
 <p>Creates a Classic load balancer.</p><p>You can add listeners, security groups, subnets, and tags when you create your load balancer, or you can add them later using <a>CreateLoadBalancerListeners</a>, <a>ApplySecurityGroupsToLoadBalancer</a>, <a>AttachLoadBalancerToSubnets</a>, and <a>AddTags</a>.</p><p>To describe your current load balancers, see <a>DescribeLoadBalancers</a>. When you are finished with a load balancer, you can delete it using <a>DeleteLoadBalancer</a>.</p><p>You can create up to 20 load balancers per region per account. You can request an increase for the number of load balancers for your account. For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-limits.html">Limits for Your Classic Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateLoadBalancer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorDuplicateAccessPointName`, `AWSElasticLoadBalancingErrorTooManyAccessPoints`, `AWSElasticLoadBalancingErrorCertificateNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorSubnetNotFound`, `AWSElasticLoadBalancingErrorInvalidSubnet`, `AWSElasticLoadBalancingErrorInvalidSecurityGroup`, `AWSElasticLoadBalancingErrorInvalidScheme`, `AWSElasticLoadBalancingErrorTooManyTags`, `AWSElasticLoadBalancingErrorDuplicateTagKeys`, `AWSElasticLoadBalancingErrorUnsupportedProtocol`.
 
 @see AWSElasticLoadBalancingCreateAccessPointInput
 @see AWSElasticLoadBalancingCreateAccessPointOutput
 */
- (void)createLoadBalancer:(AWSElasticLoadBalancingCreateAccessPointInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingCreateAccessPointOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates one or more listeners for the specified load balancer. If a listener with the specified port does not already exist, it is created; otherwise, the properties of the new listener must match the properties of the existing listener.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-listener-config.html">Listeners for Your Classic Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateLoadBalancerListeners service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingCreateLoadBalancerListenerOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorDuplicateListener`, `AWSElasticLoadBalancingErrorCertificateNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorUnsupportedProtocol`.
 
 @see AWSElasticLoadBalancingCreateLoadBalancerListenerInput
 @see AWSElasticLoadBalancingCreateLoadBalancerListenerOutput
 */
- (AWSTask<AWSElasticLoadBalancingCreateLoadBalancerListenerOutput *> *)createLoadBalancerListeners:(AWSElasticLoadBalancingCreateLoadBalancerListenerInput *)request;

/**
 <p>Creates one or more listeners for the specified load balancer. If a listener with the specified port does not already exist, it is created; otherwise, the properties of the new listener must match the properties of the existing listener.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-listener-config.html">Listeners for Your Classic Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateLoadBalancerListeners service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorDuplicateListener`, `AWSElasticLoadBalancingErrorCertificateNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorUnsupportedProtocol`.
 
 @see AWSElasticLoadBalancingCreateLoadBalancerListenerInput
 @see AWSElasticLoadBalancingCreateLoadBalancerListenerOutput
 */
- (void)createLoadBalancerListeners:(AWSElasticLoadBalancingCreateLoadBalancerListenerInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingCreateLoadBalancerListenerOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a policy with the specified attributes for the specified load balancer.</p><p>Policies are settings that are saved for your load balancer and that can be applied to the listener or the application server, depending on the policy type.</p>
 
 @param request A container for the necessary parameters to execute the CreateLoadBalancerPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorPolicyTypeNotFound`, `AWSElasticLoadBalancingErrorDuplicatePolicyName`, `AWSElasticLoadBalancingErrorTooManyPolicies`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingCreateLoadBalancerPolicyInput
 @see AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput
 */
- (AWSTask<AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput *> *)createLoadBalancerPolicy:(AWSElasticLoadBalancingCreateLoadBalancerPolicyInput *)request;

/**
 <p>Creates a policy with the specified attributes for the specified load balancer.</p><p>Policies are settings that are saved for your load balancer and that can be applied to the listener or the application server, depending on the policy type.</p>
 
 @param request A container for the necessary parameters to execute the CreateLoadBalancerPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorPolicyTypeNotFound`, `AWSElasticLoadBalancingErrorDuplicatePolicyName`, `AWSElasticLoadBalancingErrorTooManyPolicies`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingCreateLoadBalancerPolicyInput
 @see AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput
 */
- (void)createLoadBalancerPolicy:(AWSElasticLoadBalancingCreateLoadBalancerPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified load balancer.</p><p>If you are attempting to recreate a load balancer, you must reconfigure all settings. The DNS name associated with a deleted load balancer are no longer usable. The name and associated DNS record of the deleted load balancer no longer exist and traffic sent to any of its IP addresses is no longer delivered to your instances.</p><p>If the load balancer does not exist or has already been deleted, the call to <code>DeleteLoadBalancer</code> still succeeds.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLoadBalancer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDeleteAccessPointOutput`.
 
 @see AWSElasticLoadBalancingDeleteAccessPointInput
 @see AWSElasticLoadBalancingDeleteAccessPointOutput
 */
- (AWSTask<AWSElasticLoadBalancingDeleteAccessPointOutput *> *)deleteLoadBalancer:(AWSElasticLoadBalancingDeleteAccessPointInput *)request;

/**
 <p>Deletes the specified load balancer.</p><p>If you are attempting to recreate a load balancer, you must reconfigure all settings. The DNS name associated with a deleted load balancer are no longer usable. The name and associated DNS record of the deleted load balancer no longer exist and traffic sent to any of its IP addresses is no longer delivered to your instances.</p><p>If the load balancer does not exist or has already been deleted, the call to <code>DeleteLoadBalancer</code> still succeeds.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLoadBalancer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSElasticLoadBalancingDeleteAccessPointInput
 @see AWSElasticLoadBalancingDeleteAccessPointOutput
 */
- (void)deleteLoadBalancer:(AWSElasticLoadBalancingDeleteAccessPointInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDeleteAccessPointOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified listeners from the specified load balancer.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLoadBalancerListeners service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingDeleteLoadBalancerListenerInput
 @see AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput
 */
- (AWSTask<AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput *> *)deleteLoadBalancerListeners:(AWSElasticLoadBalancingDeleteLoadBalancerListenerInput *)request;

/**
 <p>Deletes the specified listeners from the specified load balancer.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLoadBalancerListeners service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingDeleteLoadBalancerListenerInput
 @see AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput
 */
- (void)deleteLoadBalancerListeners:(AWSElasticLoadBalancingDeleteLoadBalancerListenerInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified policy from the specified load balancer. This policy must not be enabled for any listeners.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLoadBalancerPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput
 @see AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput
 */
- (AWSTask<AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput *> *)deleteLoadBalancerPolicy:(AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput *)request;

/**
 <p>Deletes the specified policy from the specified load balancer. This policy must not be enabled for any listeners.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLoadBalancerPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput
 @see AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput
 */
- (void)deleteLoadBalancerPolicy:(AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deregisters the specified instances from the specified load balancer. After the instance is deregistered, it no longer receives traffic from the load balancer.</p><p>You can use <a>DescribeLoadBalancers</a> to verify that the instance is deregistered from the load balancer.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-deregister-register-instances.html">Register or De-Register EC2 Instances</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterInstancesFromLoadBalancer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDeregisterEndPointsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidEndPoint`.
 
 @see AWSElasticLoadBalancingDeregisterEndPointsInput
 @see AWSElasticLoadBalancingDeregisterEndPointsOutput
 */
- (AWSTask<AWSElasticLoadBalancingDeregisterEndPointsOutput *> *)deregisterInstancesFromLoadBalancer:(AWSElasticLoadBalancingDeregisterEndPointsInput *)request;

/**
 <p>Deregisters the specified instances from the specified load balancer. After the instance is deregistered, it no longer receives traffic from the load balancer.</p><p>You can use <a>DescribeLoadBalancers</a> to verify that the instance is deregistered from the load balancer.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-deregister-register-instances.html">Register or De-Register EC2 Instances</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterInstancesFromLoadBalancer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidEndPoint`.
 
 @see AWSElasticLoadBalancingDeregisterEndPointsInput
 @see AWSElasticLoadBalancingDeregisterEndPointsOutput
 */
- (void)deregisterInstancesFromLoadBalancer:(AWSElasticLoadBalancingDeregisterEndPointsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDeregisterEndPointsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the state of the specified instances with respect to the specified load balancer. If no instances are specified, the call describes the state of all instances that are currently registered with the load balancer. If instances are specified, their state is returned even if they are no longer registered with the load balancer. The state of terminated instances is not returned.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceHealth service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeEndPointStateOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidEndPoint`.
 
 @see AWSElasticLoadBalancingDescribeEndPointStateInput
 @see AWSElasticLoadBalancingDescribeEndPointStateOutput
 */
- (AWSTask<AWSElasticLoadBalancingDescribeEndPointStateOutput *> *)describeInstanceHealth:(AWSElasticLoadBalancingDescribeEndPointStateInput *)request;

/**
 <p>Describes the state of the specified instances with respect to the specified load balancer. If no instances are specified, the call describes the state of all instances that are currently registered with the load balancer. If instances are specified, their state is returned even if they are no longer registered with the load balancer. The state of terminated instances is not returned.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceHealth service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidEndPoint`.
 
 @see AWSElasticLoadBalancingDescribeEndPointStateInput
 @see AWSElasticLoadBalancingDescribeEndPointStateOutput
 */
- (void)describeInstanceHealth:(AWSElasticLoadBalancingDescribeEndPointStateInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDescribeEndPointStateOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the attributes for the specified load balancer.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancerAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorLoadBalancerAttributeNotFound`.
 
 @see AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput
 @see AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput
 */
- (AWSTask<AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput *> *)describeLoadBalancerAttributes:(AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput *)request;

/**
 <p>Describes the attributes for the specified load balancer.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancerAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorLoadBalancerAttributeNotFound`.
 
 @see AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput
 @see AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput
 */
- (void)describeLoadBalancerAttributes:(AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified policies.</p><p>If you specify a load balancer name, the action returns the descriptions of all policies created for the load balancer. If you specify a policy name associated with your load balancer, the action returns the description of that policy. If you don't specify a load balancer name, the action returns descriptions of the specified sample policies, or descriptions of all sample policies. The names of the sample policies have the <code>ELBSample-</code> prefix.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancerPolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorPolicyNotFound`.
 
 @see AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput
 @see AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput
 */
- (AWSTask<AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput *> *)describeLoadBalancerPolicies:(AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput *)request;

/**
 <p>Describes the specified policies.</p><p>If you specify a load balancer name, the action returns the descriptions of all policies created for the load balancer. If you specify a policy name associated with your load balancer, the action returns the description of that policy. If you don't specify a load balancer name, the action returns descriptions of the specified sample policies, or descriptions of all sample policies. The names of the sample policies have the <code>ELBSample-</code> prefix.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancerPolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorPolicyNotFound`.
 
 @see AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput
 @see AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput
 */
- (void)describeLoadBalancerPolicies:(AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified load balancer policy types or all load balancer policy types.</p><p>The description of each type indicates how it can be used. For example, some policies can be used only with layer 7 listeners, some policies can be used only with layer 4 listeners, and some policies can be used only with your EC2 instances.</p><p>You can use <a>CreateLoadBalancerPolicy</a> to create a policy configuration for any of these policy types. Then, depending on the policy type, use either <a>SetLoadBalancerPoliciesOfListener</a> or <a>SetLoadBalancerPoliciesForBackendServer</a> to set the policy.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancerPolicyTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorPolicyTypeNotFound`.
 
 @see AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput
 @see AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput
 */
- (AWSTask<AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput *> *)describeLoadBalancerPolicyTypes:(AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput *)request;

/**
 <p>Describes the specified load balancer policy types or all load balancer policy types.</p><p>The description of each type indicates how it can be used. For example, some policies can be used only with layer 7 listeners, some policies can be used only with layer 4 listeners, and some policies can be used only with your EC2 instances.</p><p>You can use <a>CreateLoadBalancerPolicy</a> to create a policy configuration for any of these policy types. Then, depending on the policy type, use either <a>SetLoadBalancerPoliciesOfListener</a> or <a>SetLoadBalancerPoliciesForBackendServer</a> to set the policy.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancerPolicyTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorPolicyTypeNotFound`.
 
 @see AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput
 @see AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput
 */
- (void)describeLoadBalancerPolicyTypes:(AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified the load balancers. If no load balancers are specified, the call describes all of your load balancers.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeAccessPointsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorDependencyThrottle`.
 
 @see AWSElasticLoadBalancingDescribeAccessPointsInput
 @see AWSElasticLoadBalancingDescribeAccessPointsOutput
 */
- (AWSTask<AWSElasticLoadBalancingDescribeAccessPointsOutput *> *)describeLoadBalancers:(AWSElasticLoadBalancingDescribeAccessPointsInput *)request;

/**
 <p>Describes the specified the load balancers. If no load balancers are specified, the call describes all of your load balancers.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorDependencyThrottle`.
 
 @see AWSElasticLoadBalancingDescribeAccessPointsInput
 @see AWSElasticLoadBalancingDescribeAccessPointsOutput
 */
- (void)describeLoadBalancers:(AWSElasticLoadBalancingDescribeAccessPointsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDescribeAccessPointsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the tags associated with the specified load balancers.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeTagsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingDescribeTagsInput
 @see AWSElasticLoadBalancingDescribeTagsOutput
 */
- (AWSTask<AWSElasticLoadBalancingDescribeTagsOutput *> *)describeTags:(AWSElasticLoadBalancingDescribeTagsInput *)request;

/**
 <p>Describes the tags associated with the specified load balancers.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingDescribeTagsInput
 @see AWSElasticLoadBalancingDescribeTagsOutput
 */
- (void)describeTags:(AWSElasticLoadBalancingDescribeTagsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDescribeTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified subnets from the set of configured subnets for the load balancer.</p><p>After a subnet is removed, all EC2 instances registered with the load balancer in the removed subnet go into the <code>OutOfService</code> state. Then, the load balancer balances the traffic among the remaining routable subnets.</p>
 
 @param request A container for the necessary parameters to execute the DetachLoadBalancerFromSubnets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput
 @see AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput
 */
- (AWSTask<AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput *> *)detachLoadBalancerFromSubnets:(AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput *)request;

/**
 <p>Removes the specified subnets from the set of configured subnets for the load balancer.</p><p>After a subnet is removed, all EC2 instances registered with the load balancer in the removed subnet go into the <code>OutOfService</code> state. Then, the load balancer balances the traffic among the remaining routable subnets.</p>
 
 @param request A container for the necessary parameters to execute the DetachLoadBalancerFromSubnets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput
 @see AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput
 */
- (void)detachLoadBalancerFromSubnets:(AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified Availability Zones from the set of Availability Zones for the specified load balancer.</p><p>There must be at least one Availability Zone registered with a load balancer at all times. After an Availability Zone is removed, all instances registered with the load balancer that are in the removed Availability Zone go into the <code>OutOfService</code> state. Then, the load balancer attempts to equally balance the traffic among its remaining Availability Zones.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-az.html">Add or Remove Availability Zones</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DisableAvailabilityZonesForLoadBalancer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingRemoveAvailabilityZonesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingRemoveAvailabilityZonesInput
 @see AWSElasticLoadBalancingRemoveAvailabilityZonesOutput
 */
- (AWSTask<AWSElasticLoadBalancingRemoveAvailabilityZonesOutput *> *)disableAvailabilityZonesForLoadBalancer:(AWSElasticLoadBalancingRemoveAvailabilityZonesInput *)request;

/**
 <p>Removes the specified Availability Zones from the set of Availability Zones for the specified load balancer.</p><p>There must be at least one Availability Zone registered with a load balancer at all times. After an Availability Zone is removed, all instances registered with the load balancer that are in the removed Availability Zone go into the <code>OutOfService</code> state. Then, the load balancer attempts to equally balance the traffic among its remaining Availability Zones.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-az.html">Add or Remove Availability Zones</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DisableAvailabilityZonesForLoadBalancer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingRemoveAvailabilityZonesInput
 @see AWSElasticLoadBalancingRemoveAvailabilityZonesOutput
 */
- (void)disableAvailabilityZonesForLoadBalancer:(AWSElasticLoadBalancingRemoveAvailabilityZonesInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingRemoveAvailabilityZonesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds the specified Availability Zones to the set of Availability Zones for the specified load balancer.</p><p>The load balancer evenly distributes requests across all its registered Availability Zones that contain instances.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-az.html">Add or Remove Availability Zones</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the EnableAvailabilityZonesForLoadBalancer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingAddAvailabilityZonesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingAddAvailabilityZonesInput
 @see AWSElasticLoadBalancingAddAvailabilityZonesOutput
 */
- (AWSTask<AWSElasticLoadBalancingAddAvailabilityZonesOutput *> *)enableAvailabilityZonesForLoadBalancer:(AWSElasticLoadBalancingAddAvailabilityZonesInput *)request;

/**
 <p>Adds the specified Availability Zones to the set of Availability Zones for the specified load balancer.</p><p>The load balancer evenly distributes requests across all its registered Availability Zones that contain instances.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-az.html">Add or Remove Availability Zones</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the EnableAvailabilityZonesForLoadBalancer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingAddAvailabilityZonesInput
 @see AWSElasticLoadBalancingAddAvailabilityZonesOutput
 */
- (void)enableAvailabilityZonesForLoadBalancer:(AWSElasticLoadBalancingAddAvailabilityZonesInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingAddAvailabilityZonesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the attributes of the specified load balancer.</p><p>You can modify the load balancer attributes, such as <code>AccessLogs</code>, <code>ConnectionDraining</code>, and <code>CrossZoneLoadBalancing</code> by either enabling or disabling them. Or, you can modify the load balancer attribute <code>ConnectionSettings</code> by specifying an idle connection timeout value for your load balancer.</p><p>For more information, see the following in the <i>Classic Load Balancers Guide</i>:</p><ul><li><p><a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-crosszone-lb.html">Cross-Zone Load Balancing</a></p></li><li><p><a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-conn-drain.html">Connection Draining</a></p></li><li><p><a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/access-log-collection.html">Access Logs</a></p></li><li><p><a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-idle-timeout.html">Idle Connection Timeout</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the ModifyLoadBalancerAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorLoadBalancerAttributeNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingModifyLoadBalancerAttributesInput
 @see AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput
 */
- (AWSTask<AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput *> *)modifyLoadBalancerAttributes:(AWSElasticLoadBalancingModifyLoadBalancerAttributesInput *)request;

/**
 <p>Modifies the attributes of the specified load balancer.</p><p>You can modify the load balancer attributes, such as <code>AccessLogs</code>, <code>ConnectionDraining</code>, and <code>CrossZoneLoadBalancing</code> by either enabling or disabling them. Or, you can modify the load balancer attribute <code>ConnectionSettings</code> by specifying an idle connection timeout value for your load balancer.</p><p>For more information, see the following in the <i>Classic Load Balancers Guide</i>:</p><ul><li><p><a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-crosszone-lb.html">Cross-Zone Load Balancing</a></p></li><li><p><a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-conn-drain.html">Connection Draining</a></p></li><li><p><a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/access-log-collection.html">Access Logs</a></p></li><li><p><a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-idle-timeout.html">Idle Connection Timeout</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the ModifyLoadBalancerAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorLoadBalancerAttributeNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingModifyLoadBalancerAttributesInput
 @see AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput
 */
- (void)modifyLoadBalancerAttributes:(AWSElasticLoadBalancingModifyLoadBalancerAttributesInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds the specified instances to the specified load balancer.</p><p>The instance must be a running instance in the same network as the load balancer (EC2-Classic or the same VPC). If you have EC2-Classic instances and a load balancer in a VPC with ClassicLink enabled, you can link the EC2-Classic instances to that VPC and then register the linked EC2-Classic instances with the load balancer in the VPC.</p><p>Note that <code>RegisterInstanceWithLoadBalancer</code> completes when the request has been registered. Instance registration takes a little time to complete. To check the state of the registered instances, use <a>DescribeLoadBalancers</a> or <a>DescribeInstanceHealth</a>.</p><p>After the instance is registered, it starts receiving traffic and requests from the load balancer. Any instance that is not in one of the Availability Zones registered for the load balancer is moved to the <code>OutOfService</code> state. If an Availability Zone is added to the load balancer later, any instances registered with the load balancer move to the <code>InService</code> state.</p><p>To deregister instances from a load balancer, use <a>DeregisterInstancesFromLoadBalancer</a>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-deregister-register-instances.html">Register or De-Register EC2 Instances</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RegisterInstancesWithLoadBalancer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingRegisterEndPointsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidEndPoint`.
 
 @see AWSElasticLoadBalancingRegisterEndPointsInput
 @see AWSElasticLoadBalancingRegisterEndPointsOutput
 */
- (AWSTask<AWSElasticLoadBalancingRegisterEndPointsOutput *> *)registerInstancesWithLoadBalancer:(AWSElasticLoadBalancingRegisterEndPointsInput *)request;

/**
 <p>Adds the specified instances to the specified load balancer.</p><p>The instance must be a running instance in the same network as the load balancer (EC2-Classic or the same VPC). If you have EC2-Classic instances and a load balancer in a VPC with ClassicLink enabled, you can link the EC2-Classic instances to that VPC and then register the linked EC2-Classic instances with the load balancer in the VPC.</p><p>Note that <code>RegisterInstanceWithLoadBalancer</code> completes when the request has been registered. Instance registration takes a little time to complete. To check the state of the registered instances, use <a>DescribeLoadBalancers</a> or <a>DescribeInstanceHealth</a>.</p><p>After the instance is registered, it starts receiving traffic and requests from the load balancer. Any instance that is not in one of the Availability Zones registered for the load balancer is moved to the <code>OutOfService</code> state. If an Availability Zone is added to the load balancer later, any instances registered with the load balancer move to the <code>InService</code> state.</p><p>To deregister instances from a load balancer, use <a>DeregisterInstancesFromLoadBalancer</a>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-deregister-register-instances.html">Register or De-Register EC2 Instances</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RegisterInstancesWithLoadBalancer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidEndPoint`.
 
 @see AWSElasticLoadBalancingRegisterEndPointsInput
 @see AWSElasticLoadBalancingRegisterEndPointsOutput
 */
- (void)registerInstancesWithLoadBalancer:(AWSElasticLoadBalancingRegisterEndPointsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingRegisterEndPointsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes one or more tags from the specified load balancer.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingRemoveTagsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingRemoveTagsInput
 @see AWSElasticLoadBalancingRemoveTagsOutput
 */
- (AWSTask<AWSElasticLoadBalancingRemoveTagsOutput *> *)removeTags:(AWSElasticLoadBalancingRemoveTagsInput *)request;

/**
 <p>Removes one or more tags from the specified load balancer.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingRemoveTagsInput
 @see AWSElasticLoadBalancingRemoveTagsOutput
 */
- (void)removeTags:(AWSElasticLoadBalancingRemoveTagsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingRemoveTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the certificate that terminates the specified listener's SSL connections. The specified certificate replaces any prior certificate that was used on the same load balancer and port.</p><p>For more information about updating your SSL certificate, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-update-ssl-cert.html">Replace the SSL Certificate for Your Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the SetLoadBalancerListenerSSLCertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorCertificateNotFound`, `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorUnsupportedProtocol`.
 
 @see AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput
 @see AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput
 */
- (AWSTask<AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput *> *)setLoadBalancerListenerSSLCertificate:(AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput *)request;

/**
 <p>Sets the certificate that terminates the specified listener's SSL connections. The specified certificate replaces any prior certificate that was used on the same load balancer and port.</p><p>For more information about updating your SSL certificate, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-update-ssl-cert.html">Replace the SSL Certificate for Your Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the SetLoadBalancerListenerSSLCertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorCertificateNotFound`, `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorUnsupportedProtocol`.
 
 @see AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput
 @see AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput
 */
- (void)setLoadBalancerListenerSSLCertificate:(AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Replaces the set of policies associated with the specified port on which the EC2 instance is listening with a new set of policies. At this time, only the back-end server authentication policy type can be applied to the instance ports; this policy type is composed of multiple public key policies.</p><p>Each time you use <code>SetLoadBalancerPoliciesForBackendServer</code> to enable the policies, use the <code>PolicyNames</code> parameter to list the policies that you want to enable.</p><p>You can use <a>DescribeLoadBalancers</a> or <a>DescribeLoadBalancerPolicies</a> to verify that the policy is associated with the EC2 instance.</p><p>For more information about enabling back-end instance authentication, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-create-https-ssl-load-balancer.html#configure_backendauth_clt">Configure Back-end Instance Authentication</a> in the <i>Classic Load Balancers Guide</i>. For more information about Proxy Protocol, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-proxy-protocol.html">Configure Proxy Protocol Support</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the SetLoadBalancerPoliciesForBackendServer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorPolicyNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput
 @see AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput
 */
- (AWSTask<AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput *> *)setLoadBalancerPoliciesForBackendServer:(AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput *)request;

/**
 <p>Replaces the set of policies associated with the specified port on which the EC2 instance is listening with a new set of policies. At this time, only the back-end server authentication policy type can be applied to the instance ports; this policy type is composed of multiple public key policies.</p><p>Each time you use <code>SetLoadBalancerPoliciesForBackendServer</code> to enable the policies, use the <code>PolicyNames</code> parameter to list the policies that you want to enable.</p><p>You can use <a>DescribeLoadBalancers</a> or <a>DescribeLoadBalancerPolicies</a> to verify that the policy is associated with the EC2 instance.</p><p>For more information about enabling back-end instance authentication, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-create-https-ssl-load-balancer.html#configure_backendauth_clt">Configure Back-end Instance Authentication</a> in the <i>Classic Load Balancers Guide</i>. For more information about Proxy Protocol, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-proxy-protocol.html">Configure Proxy Protocol Support</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the SetLoadBalancerPoliciesForBackendServer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorPolicyNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput
 @see AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput
 */
- (void)setLoadBalancerPoliciesForBackendServer:(AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Replaces the current set of policies for the specified load balancer port with the specified set of policies.</p><p>To enable back-end server authentication, use <a>SetLoadBalancerPoliciesForBackendServer</a>.</p><p>For more information about setting policies, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/ssl-config-update.html">Update the SSL Negotiation Configuration</a>, <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-duration">Duration-Based Session Stickiness</a>, and <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-application">Application-Controlled Session Stickiness</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the SetLoadBalancerPoliciesOfListener service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorPolicyNotFound`, `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput
 @see AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput
 */
- (AWSTask<AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput *> *)setLoadBalancerPoliciesOfListener:(AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput *)request;

/**
 <p>Replaces the current set of policies for the specified load balancer port with the specified set of policies.</p><p>To enable back-end server authentication, use <a>SetLoadBalancerPoliciesForBackendServer</a>.</p><p>For more information about setting policies, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/ssl-config-update.html">Update the SSL Negotiation Configuration</a>, <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-duration">Duration-Based Session Stickiness</a>, and <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-application">Application-Controlled Session Stickiness</a> in the <i>Classic Load Balancers Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the SetLoadBalancerPoliciesOfListener service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorPolicyNotFound`, `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput
 @see AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput
 */
- (void)setLoadBalancerPoliciesOfListener:(AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
