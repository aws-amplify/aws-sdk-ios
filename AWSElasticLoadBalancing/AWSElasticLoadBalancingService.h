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

NS_ASSUME_NONNULL_BEGIN

/**
 
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
 Instantiates the service client with the given service configuration.
 
 @warning This method has been deprecated. Use `+ registerElasticLoadBalancingWithConfiguration:forKey:` and `+ ElasticLoadBalancingForKey:` instead.
 
 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 
 @warning Unlike the singleton method, you are responsible for maintaining a strong reference to this object. If the service client is released before completing a service request, the request may fail with unspecified errors.
 
 @param configuration The service configuration object.
 
 @return An instance of the service client.
 */
- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration __attribute__ ((deprecated("Use '+ registerElasticLoadBalancingWithConfiguration:forKey:' and '+ ElasticLoadBalancingForKey:' instead.")));

/**
 AddTags
 
 @param request A container for the necessary parameters to execute the AddTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingAddTagsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorTooManyTags`, `AWSElasticLoadBalancingErrorDuplicateTagKeys`.
 
 @see AWSElasticLoadBalancingAddTagsInput
 @see AWSElasticLoadBalancingAddTagsOutput
 */
- (AWSTask<AWSElasticLoadBalancingAddTagsOutput *> *)addTags:(AWSElasticLoadBalancingAddTagsInput *)request;

/**
 AddTags
 
 @param request A container for the necessary parameters to execute the AddTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorTooManyTags`, `AWSElasticLoadBalancingErrorDuplicateTagKeys`.
 
 @see AWSElasticLoadBalancingAddTagsInput
 @see AWSElasticLoadBalancingAddTagsOutput
 */
- (void)addTags:(AWSElasticLoadBalancingAddTagsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingAddTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 ApplySecurityGroupsToLoadBalancer
 
 @param request A container for the necessary parameters to execute the ApplySecurityGroupsToLoadBalancer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorInvalidSecurityGroup`.
 
 @see AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput
 @see AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput
 */
- (AWSTask<AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput *> *)applySecurityGroupsToLoadBalancer:(AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput *)request;

/**
 ApplySecurityGroupsToLoadBalancer
 
 @param request A container for the necessary parameters to execute the ApplySecurityGroupsToLoadBalancer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorInvalidSecurityGroup`.
 
 @see AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput
 @see AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput
 */
- (void)applySecurityGroupsToLoadBalancer:(AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 AttachLoadBalancerToSubnets
 
 @param request A container for the necessary parameters to execute the AttachLoadBalancerToSubnets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorSubnetNotFound`, `AWSElasticLoadBalancingErrorInvalidSubnet`.
 
 @see AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput
 @see AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput
 */
- (AWSTask<AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput *> *)attachLoadBalancerToSubnets:(AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput *)request;

/**
 AttachLoadBalancerToSubnets
 
 @param request A container for the necessary parameters to execute the AttachLoadBalancerToSubnets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorSubnetNotFound`, `AWSElasticLoadBalancingErrorInvalidSubnet`.
 
 @see AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput
 @see AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput
 */
- (void)attachLoadBalancerToSubnets:(AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 ConfigureHealthCheck
 
 @param request A container for the necessary parameters to execute the ConfigureHealthCheck service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingConfigureHealthCheckOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingConfigureHealthCheckInput
 @see AWSElasticLoadBalancingConfigureHealthCheckOutput
 */
- (AWSTask<AWSElasticLoadBalancingConfigureHealthCheckOutput *> *)configureHealthCheck:(AWSElasticLoadBalancingConfigureHealthCheckInput *)request;

/**
 ConfigureHealthCheck
 
 @param request A container for the necessary parameters to execute the ConfigureHealthCheck service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingConfigureHealthCheckInput
 @see AWSElasticLoadBalancingConfigureHealthCheckOutput
 */
- (void)configureHealthCheck:(AWSElasticLoadBalancingConfigureHealthCheckInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingConfigureHealthCheckOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 CreateAppCookieStickinessPolicy
 
 @param request A container for the necessary parameters to execute the CreateAppCookieStickinessPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorDuplicatePolicyName`, `AWSElasticLoadBalancingErrorTooManyPolicies`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput
 @see AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput
 */
- (AWSTask<AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput *> *)createAppCookieStickinessPolicy:(AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput *)request;

/**
 CreateAppCookieStickinessPolicy
 
 @param request A container for the necessary parameters to execute the CreateAppCookieStickinessPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorDuplicatePolicyName`, `AWSElasticLoadBalancingErrorTooManyPolicies`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput
 @see AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput
 */
- (void)createAppCookieStickinessPolicy:(AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 CreateLBCookieStickinessPolicy
 
 @param request A container for the necessary parameters to execute the CreateLBCookieStickinessPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorDuplicatePolicyName`, `AWSElasticLoadBalancingErrorTooManyPolicies`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput
 @see AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput
 */
- (AWSTask<AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput *> *)createLBCookieStickinessPolicy:(AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput *)request;

/**
 CreateLBCookieStickinessPolicy
 
 @param request A container for the necessary parameters to execute the CreateLBCookieStickinessPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorDuplicatePolicyName`, `AWSElasticLoadBalancingErrorTooManyPolicies`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput
 @see AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput
 */
- (void)createLBCookieStickinessPolicy:(AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 CreateLoadBalancer
 
 @param request A container for the necessary parameters to execute the CreateLoadBalancer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingCreateAccessPointOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorDuplicateAccessPointName`, `AWSElasticLoadBalancingErrorTooManyAccessPoints`, `AWSElasticLoadBalancingErrorCertificateNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorSubnetNotFound`, `AWSElasticLoadBalancingErrorInvalidSubnet`, `AWSElasticLoadBalancingErrorInvalidSecurityGroup`, `AWSElasticLoadBalancingErrorInvalidScheme`, `AWSElasticLoadBalancingErrorTooManyTags`, `AWSElasticLoadBalancingErrorDuplicateTagKeys`.
 
 @see AWSElasticLoadBalancingCreateAccessPointInput
 @see AWSElasticLoadBalancingCreateAccessPointOutput
 */
- (AWSTask<AWSElasticLoadBalancingCreateAccessPointOutput *> *)createLoadBalancer:(AWSElasticLoadBalancingCreateAccessPointInput *)request;

/**
 CreateLoadBalancer
 
 @param request A container for the necessary parameters to execute the CreateLoadBalancer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorDuplicateAccessPointName`, `AWSElasticLoadBalancingErrorTooManyAccessPoints`, `AWSElasticLoadBalancingErrorCertificateNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorSubnetNotFound`, `AWSElasticLoadBalancingErrorInvalidSubnet`, `AWSElasticLoadBalancingErrorInvalidSecurityGroup`, `AWSElasticLoadBalancingErrorInvalidScheme`, `AWSElasticLoadBalancingErrorTooManyTags`, `AWSElasticLoadBalancingErrorDuplicateTagKeys`.
 
 @see AWSElasticLoadBalancingCreateAccessPointInput
 @see AWSElasticLoadBalancingCreateAccessPointOutput
 */
- (void)createLoadBalancer:(AWSElasticLoadBalancingCreateAccessPointInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingCreateAccessPointOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 CreateLoadBalancerListeners
 
 @param request A container for the necessary parameters to execute the CreateLoadBalancerListeners service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingCreateLoadBalancerListenerOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorDuplicateListener`, `AWSElasticLoadBalancingErrorCertificateNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingCreateLoadBalancerListenerInput
 @see AWSElasticLoadBalancingCreateLoadBalancerListenerOutput
 */
- (AWSTask<AWSElasticLoadBalancingCreateLoadBalancerListenerOutput *> *)createLoadBalancerListeners:(AWSElasticLoadBalancingCreateLoadBalancerListenerInput *)request;

/**
 CreateLoadBalancerListeners
 
 @param request A container for the necessary parameters to execute the CreateLoadBalancerListeners service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorDuplicateListener`, `AWSElasticLoadBalancingErrorCertificateNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingCreateLoadBalancerListenerInput
 @see AWSElasticLoadBalancingCreateLoadBalancerListenerOutput
 */
- (void)createLoadBalancerListeners:(AWSElasticLoadBalancingCreateLoadBalancerListenerInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingCreateLoadBalancerListenerOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 CreateLoadBalancerPolicy
 
 @param request A container for the necessary parameters to execute the CreateLoadBalancerPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorPolicyTypeNotFound`, `AWSElasticLoadBalancingErrorDuplicatePolicyName`, `AWSElasticLoadBalancingErrorTooManyPolicies`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingCreateLoadBalancerPolicyInput
 @see AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput
 */
- (AWSTask<AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput *> *)createLoadBalancerPolicy:(AWSElasticLoadBalancingCreateLoadBalancerPolicyInput *)request;

/**
 CreateLoadBalancerPolicy
 
 @param request A container for the necessary parameters to execute the CreateLoadBalancerPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorPolicyTypeNotFound`, `AWSElasticLoadBalancingErrorDuplicatePolicyName`, `AWSElasticLoadBalancingErrorTooManyPolicies`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingCreateLoadBalancerPolicyInput
 @see AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput
 */
- (void)createLoadBalancerPolicy:(AWSElasticLoadBalancingCreateLoadBalancerPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 DeleteLoadBalancer
 
 @param request A container for the necessary parameters to execute the DeleteLoadBalancer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDeleteAccessPointOutput`.
 
 @see AWSElasticLoadBalancingDeleteAccessPointInput
 @see AWSElasticLoadBalancingDeleteAccessPointOutput
 */
- (AWSTask<AWSElasticLoadBalancingDeleteAccessPointOutput *> *)deleteLoadBalancer:(AWSElasticLoadBalancingDeleteAccessPointInput *)request;

/**
 DeleteLoadBalancer
 
 @param request A container for the necessary parameters to execute the DeleteLoadBalancer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSElasticLoadBalancingDeleteAccessPointInput
 @see AWSElasticLoadBalancingDeleteAccessPointOutput
 */
- (void)deleteLoadBalancer:(AWSElasticLoadBalancingDeleteAccessPointInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDeleteAccessPointOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 DeleteLoadBalancerListeners
 
 @param request A container for the necessary parameters to execute the DeleteLoadBalancerListeners service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingDeleteLoadBalancerListenerInput
 @see AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput
 */
- (AWSTask<AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput *> *)deleteLoadBalancerListeners:(AWSElasticLoadBalancingDeleteLoadBalancerListenerInput *)request;

/**
 DeleteLoadBalancerListeners
 
 @param request A container for the necessary parameters to execute the DeleteLoadBalancerListeners service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingDeleteLoadBalancerListenerInput
 @see AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput
 */
- (void)deleteLoadBalancerListeners:(AWSElasticLoadBalancingDeleteLoadBalancerListenerInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 DeleteLoadBalancerPolicy
 
 @param request A container for the necessary parameters to execute the DeleteLoadBalancerPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput
 @see AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput
 */
- (AWSTask<AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput *> *)deleteLoadBalancerPolicy:(AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput *)request;

/**
 DeleteLoadBalancerPolicy
 
 @param request A container for the necessary parameters to execute the DeleteLoadBalancerPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput
 @see AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput
 */
- (void)deleteLoadBalancerPolicy:(AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 DeregisterInstancesFromLoadBalancer
 
 @param request A container for the necessary parameters to execute the DeregisterInstancesFromLoadBalancer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDeregisterEndPointsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidEndPoint`.
 
 @see AWSElasticLoadBalancingDeregisterEndPointsInput
 @see AWSElasticLoadBalancingDeregisterEndPointsOutput
 */
- (AWSTask<AWSElasticLoadBalancingDeregisterEndPointsOutput *> *)deregisterInstancesFromLoadBalancer:(AWSElasticLoadBalancingDeregisterEndPointsInput *)request;

/**
 DeregisterInstancesFromLoadBalancer
 
 @param request A container for the necessary parameters to execute the DeregisterInstancesFromLoadBalancer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidEndPoint`.
 
 @see AWSElasticLoadBalancingDeregisterEndPointsInput
 @see AWSElasticLoadBalancingDeregisterEndPointsOutput
 */
- (void)deregisterInstancesFromLoadBalancer:(AWSElasticLoadBalancingDeregisterEndPointsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDeregisterEndPointsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 DescribeInstanceHealth
 
 @param request A container for the necessary parameters to execute the DescribeInstanceHealth service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeEndPointStateOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidEndPoint`.
 
 @see AWSElasticLoadBalancingDescribeEndPointStateInput
 @see AWSElasticLoadBalancingDescribeEndPointStateOutput
 */
- (AWSTask<AWSElasticLoadBalancingDescribeEndPointStateOutput *> *)describeInstanceHealth:(AWSElasticLoadBalancingDescribeEndPointStateInput *)request;

/**
 DescribeInstanceHealth
 
 @param request A container for the necessary parameters to execute the DescribeInstanceHealth service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidEndPoint`.
 
 @see AWSElasticLoadBalancingDescribeEndPointStateInput
 @see AWSElasticLoadBalancingDescribeEndPointStateOutput
 */
- (void)describeInstanceHealth:(AWSElasticLoadBalancingDescribeEndPointStateInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDescribeEndPointStateOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 DescribeLoadBalancerAttributes
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancerAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorLoadBalancerAttributeNotFound`.
 
 @see AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput
 @see AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput
 */
- (AWSTask<AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput *> *)describeLoadBalancerAttributes:(AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput *)request;

/**
 DescribeLoadBalancerAttributes
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancerAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorLoadBalancerAttributeNotFound`.
 
 @see AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput
 @see AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput
 */
- (void)describeLoadBalancerAttributes:(AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 DescribeLoadBalancerPolicies
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancerPolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorPolicyNotFound`.
 
 @see AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput
 @see AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput
 */
- (AWSTask<AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput *> *)describeLoadBalancerPolicies:(AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput *)request;

/**
 DescribeLoadBalancerPolicies
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancerPolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorPolicyNotFound`.
 
 @see AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput
 @see AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput
 */
- (void)describeLoadBalancerPolicies:(AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 DescribeLoadBalancerPolicyTypes
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancerPolicyTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorPolicyTypeNotFound`.
 
 @see AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput
 @see AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput
 */
- (AWSTask<AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput *> *)describeLoadBalancerPolicyTypes:(AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput *)request;

/**
 DescribeLoadBalancerPolicyTypes
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancerPolicyTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorPolicyTypeNotFound`.
 
 @see AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput
 @see AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput
 */
- (void)describeLoadBalancerPolicyTypes:(AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 DescribeLoadBalancers
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeAccessPointsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingDescribeAccessPointsInput
 @see AWSElasticLoadBalancingDescribeAccessPointsOutput
 */
- (AWSTask<AWSElasticLoadBalancingDescribeAccessPointsOutput *> *)describeLoadBalancers:(AWSElasticLoadBalancingDescribeAccessPointsInput *)request;

/**
 DescribeLoadBalancers
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingDescribeAccessPointsInput
 @see AWSElasticLoadBalancingDescribeAccessPointsOutput
 */
- (void)describeLoadBalancers:(AWSElasticLoadBalancingDescribeAccessPointsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDescribeAccessPointsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 DescribeTags
 
 @param request A container for the necessary parameters to execute the DescribeTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeTagsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingDescribeTagsInput
 @see AWSElasticLoadBalancingDescribeTagsOutput
 */
- (AWSTask<AWSElasticLoadBalancingDescribeTagsOutput *> *)describeTags:(AWSElasticLoadBalancingDescribeTagsInput *)request;

/**
 DescribeTags
 
 @param request A container for the necessary parameters to execute the DescribeTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingDescribeTagsInput
 @see AWSElasticLoadBalancingDescribeTagsOutput
 */
- (void)describeTags:(AWSElasticLoadBalancingDescribeTagsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDescribeTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 DetachLoadBalancerFromSubnets
 
 @param request A container for the necessary parameters to execute the DetachLoadBalancerFromSubnets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput
 @see AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput
 */
- (AWSTask<AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput *> *)detachLoadBalancerFromSubnets:(AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput *)request;

/**
 DetachLoadBalancerFromSubnets
 
 @param request A container for the necessary parameters to execute the DetachLoadBalancerFromSubnets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput
 @see AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput
 */
- (void)detachLoadBalancerFromSubnets:(AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 DisableAvailabilityZonesForLoadBalancer
 
 @param request A container for the necessary parameters to execute the DisableAvailabilityZonesForLoadBalancer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingRemoveAvailabilityZonesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingRemoveAvailabilityZonesInput
 @see AWSElasticLoadBalancingRemoveAvailabilityZonesOutput
 */
- (AWSTask<AWSElasticLoadBalancingRemoveAvailabilityZonesOutput *> *)disableAvailabilityZonesForLoadBalancer:(AWSElasticLoadBalancingRemoveAvailabilityZonesInput *)request;

/**
 DisableAvailabilityZonesForLoadBalancer
 
 @param request A container for the necessary parameters to execute the DisableAvailabilityZonesForLoadBalancer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingRemoveAvailabilityZonesInput
 @see AWSElasticLoadBalancingRemoveAvailabilityZonesOutput
 */
- (void)disableAvailabilityZonesForLoadBalancer:(AWSElasticLoadBalancingRemoveAvailabilityZonesInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingRemoveAvailabilityZonesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 EnableAvailabilityZonesForLoadBalancer
 
 @param request A container for the necessary parameters to execute the EnableAvailabilityZonesForLoadBalancer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingAddAvailabilityZonesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingAddAvailabilityZonesInput
 @see AWSElasticLoadBalancingAddAvailabilityZonesOutput
 */
- (AWSTask<AWSElasticLoadBalancingAddAvailabilityZonesOutput *> *)enableAvailabilityZonesForLoadBalancer:(AWSElasticLoadBalancingAddAvailabilityZonesInput *)request;

/**
 EnableAvailabilityZonesForLoadBalancer
 
 @param request A container for the necessary parameters to execute the EnableAvailabilityZonesForLoadBalancer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingAddAvailabilityZonesInput
 @see AWSElasticLoadBalancingAddAvailabilityZonesOutput
 */
- (void)enableAvailabilityZonesForLoadBalancer:(AWSElasticLoadBalancingAddAvailabilityZonesInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingAddAvailabilityZonesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 ModifyLoadBalancerAttributes
 
 @param request A container for the necessary parameters to execute the ModifyLoadBalancerAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorLoadBalancerAttributeNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingModifyLoadBalancerAttributesInput
 @see AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput
 */
- (AWSTask<AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput *> *)modifyLoadBalancerAttributes:(AWSElasticLoadBalancingModifyLoadBalancerAttributesInput *)request;

/**
 ModifyLoadBalancerAttributes
 
 @param request A container for the necessary parameters to execute the ModifyLoadBalancerAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorLoadBalancerAttributeNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingModifyLoadBalancerAttributesInput
 @see AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput
 */
- (void)modifyLoadBalancerAttributes:(AWSElasticLoadBalancingModifyLoadBalancerAttributesInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 RegisterInstancesWithLoadBalancer
 
 @param request A container for the necessary parameters to execute the RegisterInstancesWithLoadBalancer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingRegisterEndPointsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidEndPoint`.
 
 @see AWSElasticLoadBalancingRegisterEndPointsInput
 @see AWSElasticLoadBalancingRegisterEndPointsOutput
 */
- (AWSTask<AWSElasticLoadBalancingRegisterEndPointsOutput *> *)registerInstancesWithLoadBalancer:(AWSElasticLoadBalancingRegisterEndPointsInput *)request;

/**
 RegisterInstancesWithLoadBalancer
 
 @param request A container for the necessary parameters to execute the RegisterInstancesWithLoadBalancer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidEndPoint`.
 
 @see AWSElasticLoadBalancingRegisterEndPointsInput
 @see AWSElasticLoadBalancingRegisterEndPointsOutput
 */
- (void)registerInstancesWithLoadBalancer:(AWSElasticLoadBalancingRegisterEndPointsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingRegisterEndPointsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 RemoveTags
 
 @param request A container for the necessary parameters to execute the RemoveTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingRemoveTagsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingRemoveTagsInput
 @see AWSElasticLoadBalancingRemoveTagsOutput
 */
- (AWSTask<AWSElasticLoadBalancingRemoveTagsOutput *> *)removeTags:(AWSElasticLoadBalancingRemoveTagsInput *)request;

/**
 RemoveTags
 
 @param request A container for the necessary parameters to execute the RemoveTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingRemoveTagsInput
 @see AWSElasticLoadBalancingRemoveTagsOutput
 */
- (void)removeTags:(AWSElasticLoadBalancingRemoveTagsInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingRemoveTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 SetLoadBalancerListenerSSLCertificate
 
 @param request A container for the necessary parameters to execute the SetLoadBalancerListenerSSLCertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorCertificateNotFound`, `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput
 @see AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput
 */
- (AWSTask<AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput *> *)setLoadBalancerListenerSSLCertificate:(AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput *)request;

/**
 SetLoadBalancerListenerSSLCertificate
 
 @param request A container for the necessary parameters to execute the SetLoadBalancerListenerSSLCertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorCertificateNotFound`, `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput
 @see AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput
 */
- (void)setLoadBalancerListenerSSLCertificate:(AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 SetLoadBalancerPoliciesForBackendServer
 
 @param request A container for the necessary parameters to execute the SetLoadBalancerPoliciesForBackendServer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorPolicyNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput
 @see AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput
 */
- (AWSTask<AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput *> *)setLoadBalancerPoliciesForBackendServer:(AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput *)request;

/**
 SetLoadBalancerPoliciesForBackendServer
 
 @param request A container for the necessary parameters to execute the SetLoadBalancerPoliciesForBackendServer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorPolicyNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput
 @see AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput
 */
- (void)setLoadBalancerPoliciesForBackendServer:(AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput *)request completionHandler:(void (^ _Nullable)(AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 SetLoadBalancerPoliciesOfListener
 
 @param request A container for the necessary parameters to execute the SetLoadBalancerPoliciesOfListener service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorPolicyNotFound`, `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput
 @see AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput
 */
- (AWSTask<AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput *> *)setLoadBalancerPoliciesOfListener:(AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput *)request;

/**
 SetLoadBalancerPoliciesOfListener
 
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
