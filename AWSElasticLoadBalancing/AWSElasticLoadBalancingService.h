/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

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
 Retrieves the service client associated with the key. You need to call `+ registerElasticLoadBalancingWithConfiguration:forKey:` before invoking this method. If `+ registerElasticLoadBalancingWithConfiguration:forKey:` has not been called in advance or the key does not exist, this method returns `nil`.

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
- (AWSTask *)addTags:(AWSElasticLoadBalancingAddTagsInput *)request;

/**
 ApplySecurityGroupsToLoadBalancer
 
 @param request A container for the necessary parameters to execute the ApplySecurityGroupsToLoadBalancer service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorInvalidSecurityGroup`.
 
 @see AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput
 @see AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput
 */
- (AWSTask *)applySecurityGroupsToLoadBalancer:(AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput *)request;

/**
 AttachLoadBalancerToSubnets
 
 @param request A container for the necessary parameters to execute the AttachLoadBalancerToSubnets service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorSubnetNotFound`, `AWSElasticLoadBalancingErrorInvalidSubnet`.
 
 @see AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput
 @see AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput
 */
- (AWSTask *)attachLoadBalancerToSubnets:(AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput *)request;

/**
 ConfigureHealthCheck
 
 @param request A container for the necessary parameters to execute the ConfigureHealthCheck service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingConfigureHealthCheckOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingConfigureHealthCheckInput
 @see AWSElasticLoadBalancingConfigureHealthCheckOutput
 */
- (AWSTask *)configureHealthCheck:(AWSElasticLoadBalancingConfigureHealthCheckInput *)request;

/**
 CreateAppCookieStickinessPolicy
 
 @param request A container for the necessary parameters to execute the CreateAppCookieStickinessPolicy service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorDuplicatePolicyName`, `AWSElasticLoadBalancingErrorTooManyPolicies`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput
 @see AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput
 */
- (AWSTask *)createAppCookieStickinessPolicy:(AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput *)request;

/**
 CreateLBCookieStickinessPolicy
 
 @param request A container for the necessary parameters to execute the CreateLBCookieStickinessPolicy service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorDuplicatePolicyName`, `AWSElasticLoadBalancingErrorTooManyPolicies`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput
 @see AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput
 */
- (AWSTask *)createLBCookieStickinessPolicy:(AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput *)request;

/**
 CreateLoadBalancer
 
 @param request A container for the necessary parameters to execute the CreateLoadBalancer service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingCreateAccessPointOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorDuplicateAccessPointName`, `AWSElasticLoadBalancingErrorTooManyAccessPoints`, `AWSElasticLoadBalancingErrorCertificateNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`, `AWSElasticLoadBalancingErrorSubnetNotFound`, `AWSElasticLoadBalancingErrorInvalidSubnet`, `AWSElasticLoadBalancingErrorInvalidSecurityGroup`, `AWSElasticLoadBalancingErrorInvalidScheme`, `AWSElasticLoadBalancingErrorTooManyTags`, `AWSElasticLoadBalancingErrorDuplicateTagKeys`.
 
 @see AWSElasticLoadBalancingCreateAccessPointInput
 @see AWSElasticLoadBalancingCreateAccessPointOutput
 */
- (AWSTask *)createLoadBalancer:(AWSElasticLoadBalancingCreateAccessPointInput *)request;

/**
 CreateLoadBalancerListeners
 
 @param request A container for the necessary parameters to execute the CreateLoadBalancerListeners service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingCreateLoadBalancerListenerOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorDuplicateListener`, `AWSElasticLoadBalancingErrorCertificateNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingCreateLoadBalancerListenerInput
 @see AWSElasticLoadBalancingCreateLoadBalancerListenerOutput
 */
- (AWSTask *)createLoadBalancerListeners:(AWSElasticLoadBalancingCreateLoadBalancerListenerInput *)request;

/**
 CreateLoadBalancerPolicy
 
 @param request A container for the necessary parameters to execute the CreateLoadBalancerPolicy service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorPolicyTypeNotFound`, `AWSElasticLoadBalancingErrorDuplicatePolicyName`, `AWSElasticLoadBalancingErrorTooManyPolicies`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingCreateLoadBalancerPolicyInput
 @see AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput
 */
- (AWSTask *)createLoadBalancerPolicy:(AWSElasticLoadBalancingCreateLoadBalancerPolicyInput *)request;

/**
 DeleteLoadBalancer
 
 @param request A container for the necessary parameters to execute the DeleteLoadBalancer service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDeleteAccessPointOutput`.
 
 @see AWSElasticLoadBalancingDeleteAccessPointInput
 @see AWSElasticLoadBalancingDeleteAccessPointOutput
 */
- (AWSTask *)deleteLoadBalancer:(AWSElasticLoadBalancingDeleteAccessPointInput *)request;

/**
 DeleteLoadBalancerListeners
 
 @param request A container for the necessary parameters to execute the DeleteLoadBalancerListeners service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingDeleteLoadBalancerListenerInput
 @see AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput
 */
- (AWSTask *)deleteLoadBalancerListeners:(AWSElasticLoadBalancingDeleteLoadBalancerListenerInput *)request;

/**
 DeleteLoadBalancerPolicy
 
 @param request A container for the necessary parameters to execute the DeleteLoadBalancerPolicy service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput
 @see AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput
 */
- (AWSTask *)deleteLoadBalancerPolicy:(AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput *)request;

/**
 DeregisterInstancesFromLoadBalancer
 
 @param request A container for the necessary parameters to execute the DeregisterInstancesFromLoadBalancer service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDeregisterEndPointsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidEndPoint`.
 
 @see AWSElasticLoadBalancingDeregisterEndPointsInput
 @see AWSElasticLoadBalancingDeregisterEndPointsOutput
 */
- (AWSTask *)deregisterInstancesFromLoadBalancer:(AWSElasticLoadBalancingDeregisterEndPointsInput *)request;

/**
 DescribeInstanceHealth
 
 @param request A container for the necessary parameters to execute the DescribeInstanceHealth service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeEndPointStateOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidEndPoint`.
 
 @see AWSElasticLoadBalancingDescribeEndPointStateInput
 @see AWSElasticLoadBalancingDescribeEndPointStateOutput
 */
- (AWSTask *)describeInstanceHealth:(AWSElasticLoadBalancingDescribeEndPointStateInput *)request;

/**
 DescribeLoadBalancerAttributes
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancerAttributes service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorLoadBalancerAttributeNotFound`.
 
 @see AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput
 @see AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput
 */
- (AWSTask *)describeLoadBalancerAttributes:(AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput *)request;

/**
 DescribeLoadBalancerPolicies
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancerPolicies service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorPolicyNotFound`.
 
 @see AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput
 @see AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput
 */
- (AWSTask *)describeLoadBalancerPolicies:(AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput *)request;

/**
 DescribeLoadBalancerPolicyTypes
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancerPolicyTypes service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorPolicyTypeNotFound`.
 
 @see AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput
 @see AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput
 */
- (AWSTask *)describeLoadBalancerPolicyTypes:(AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput *)request;

/**
 DescribeLoadBalancers
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancers service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeAccessPointsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingDescribeAccessPointsInput
 @see AWSElasticLoadBalancingDescribeAccessPointsOutput
 */
- (AWSTask *)describeLoadBalancers:(AWSElasticLoadBalancingDescribeAccessPointsInput *)request;

/**
 DescribeTags
 
 @param request A container for the necessary parameters to execute the DescribeTags service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDescribeTagsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingDescribeTagsInput
 @see AWSElasticLoadBalancingDescribeTagsOutput
 */
- (AWSTask *)describeTags:(AWSElasticLoadBalancingDescribeTagsInput *)request;

/**
 DetachLoadBalancerFromSubnets
 
 @param request A container for the necessary parameters to execute the DetachLoadBalancerFromSubnets service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput
 @see AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput
 */
- (AWSTask *)detachLoadBalancerFromSubnets:(AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput *)request;

/**
 DisableAvailabilityZonesForLoadBalancer
 
 @param request A container for the necessary parameters to execute the DisableAvailabilityZonesForLoadBalancer service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingRemoveAvailabilityZonesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingRemoveAvailabilityZonesInput
 @see AWSElasticLoadBalancingRemoveAvailabilityZonesOutput
 */
- (AWSTask *)disableAvailabilityZonesForLoadBalancer:(AWSElasticLoadBalancingRemoveAvailabilityZonesInput *)request;

/**
 EnableAvailabilityZonesForLoadBalancer
 
 @param request A container for the necessary parameters to execute the EnableAvailabilityZonesForLoadBalancer service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingAddAvailabilityZonesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingAddAvailabilityZonesInput
 @see AWSElasticLoadBalancingAddAvailabilityZonesOutput
 */
- (AWSTask *)enableAvailabilityZonesForLoadBalancer:(AWSElasticLoadBalancingAddAvailabilityZonesInput *)request;

/**
 ModifyLoadBalancerAttributes
 
 @param request A container for the necessary parameters to execute the ModifyLoadBalancerAttributes service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorLoadBalancerAttributeNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingModifyLoadBalancerAttributesInput
 @see AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput
 */
- (AWSTask *)modifyLoadBalancerAttributes:(AWSElasticLoadBalancingModifyLoadBalancerAttributesInput *)request;

/**
 RegisterInstancesWithLoadBalancer
 
 @param request A container for the necessary parameters to execute the RegisterInstancesWithLoadBalancer service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingRegisterEndPointsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorInvalidEndPoint`.
 
 @see AWSElasticLoadBalancingRegisterEndPointsInput
 @see AWSElasticLoadBalancingRegisterEndPointsOutput
 */
- (AWSTask *)registerInstancesWithLoadBalancer:(AWSElasticLoadBalancingRegisterEndPointsInput *)request;

/**
 RemoveTags
 
 @param request A container for the necessary parameters to execute the RemoveTags service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingRemoveTagsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`.
 
 @see AWSElasticLoadBalancingRemoveTagsInput
 @see AWSElasticLoadBalancingRemoveTagsOutput
 */
- (AWSTask *)removeTags:(AWSElasticLoadBalancingRemoveTagsInput *)request;

/**
 SetLoadBalancerListenerSSLCertificate
 
 @param request A container for the necessary parameters to execute the SetLoadBalancerListenerSSLCertificate service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorCertificateNotFound`, `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput
 @see AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput
 */
- (AWSTask *)setLoadBalancerListenerSSLCertificate:(AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput *)request;

/**
 SetLoadBalancerPoliciesForBackendServer
 
 @param request A container for the necessary parameters to execute the SetLoadBalancerPoliciesForBackendServer service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorPolicyNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput
 @see AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput
 */
- (AWSTask *)setLoadBalancerPoliciesForBackendServer:(AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput *)request;

/**
 SetLoadBalancerPoliciesOfListener
 
 @param request A container for the necessary parameters to execute the SetLoadBalancerPoliciesOfListener service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticLoadBalancingErrorDomain` domain and the following error code: `AWSElasticLoadBalancingErrorAccessPointNotFound`, `AWSElasticLoadBalancingErrorPolicyNotFound`, `AWSElasticLoadBalancingErrorListenerNotFound`, `AWSElasticLoadBalancingErrorInvalidConfigurationRequest`.
 
 @see AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput
 @see AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput
 */
- (AWSTask *)setLoadBalancerPoliciesOfListener:(AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput *)request;

@end

NS_ASSUME_NONNULL_END
