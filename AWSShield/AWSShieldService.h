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
#import "AWSShieldModel.h"
#import "AWSShieldResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSShield
FOUNDATION_EXPORT NSString *const AWSShieldSDKVersion;

/**
 <fullname>AWS Shield Advanced</fullname><p>This is the <i>AWS Shield Advanced API Reference</i>. This guide is for developers who need detailed information about the AWS Shield Advanced API actions, data types, and errors. For detailed information about AWS WAF and AWS Shield Advanced features and an overview of how to use the AWS WAF and AWS Shield Advanced APIs, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF and AWS Shield Developer Guide</a>.</p>
 */
@interface AWSShield : AWSService

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

     let Shield = AWSShield.default()

 *Objective-C*

     AWSShield *Shield = [AWSShield defaultShield];

 @return The default service client.
 */
+ (instancetype)defaultShield;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSShield.register(with: configuration!, forKey: "USWest2Shield")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSShield registerShieldWithConfiguration:configuration forKey:@"USWest2Shield"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Shield = AWSShield(forKey: "USWest2Shield")

 *Objective-C*

     AWSShield *Shield = [AWSShield ShieldForKey:@"USWest2Shield"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerShieldWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerShieldWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSShield.register(with: configuration!, forKey: "USWest2Shield")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSShield registerShieldWithConfiguration:configuration forKey:@"USWest2Shield"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Shield = AWSShield(forKey: "USWest2Shield")

 *Objective-C*

     AWSShield *Shield = [AWSShield ShieldForKey:@"USWest2Shield"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)ShieldForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeShieldForKey:(NSString *)key;

/**
 <p>Authorizes the DDoS Response Team (DRT) to access the specified Amazon S3 bucket containing your AWS WAF logs. You can associate up to 10 Amazon S3 buckets with your subscription.</p><p>To use the services of the DRT and make an <code>AssociateDRTLogBucket</code> request, you must be subscribed to the <a href="https://aws.amazon.com/premiumsupport/business-support/">Business Support plan</a> or the <a href="https://aws.amazon.com/premiumsupport/enterprise-support/">Enterprise Support plan</a>.</p>
 
 @param request A container for the necessary parameters to execute the AssociateDRTLogBucket service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSShieldAssociateDRTLogBucketResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorInvalidOperation`, `AWSShieldErrorNoAssociatedRole`, `AWSShieldErrorLimitsExceeded`, `AWSShieldErrorInvalidParameter`, `AWSShieldErrorAccessDeniedForDependency`, `AWSShieldErrorOptimisticLock`, `AWSShieldErrorResourceNotFound`.
 
 @see AWSShieldAssociateDRTLogBucketRequest
 @see AWSShieldAssociateDRTLogBucketResponse
 */
- (AWSTask<AWSShieldAssociateDRTLogBucketResponse *> *)associateDRTLogBucket:(AWSShieldAssociateDRTLogBucketRequest *)request;

/**
 <p>Authorizes the DDoS Response Team (DRT) to access the specified Amazon S3 bucket containing your AWS WAF logs. You can associate up to 10 Amazon S3 buckets with your subscription.</p><p>To use the services of the DRT and make an <code>AssociateDRTLogBucket</code> request, you must be subscribed to the <a href="https://aws.amazon.com/premiumsupport/business-support/">Business Support plan</a> or the <a href="https://aws.amazon.com/premiumsupport/enterprise-support/">Enterprise Support plan</a>.</p>
 
 @param request A container for the necessary parameters to execute the AssociateDRTLogBucket service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorInvalidOperation`, `AWSShieldErrorNoAssociatedRole`, `AWSShieldErrorLimitsExceeded`, `AWSShieldErrorInvalidParameter`, `AWSShieldErrorAccessDeniedForDependency`, `AWSShieldErrorOptimisticLock`, `AWSShieldErrorResourceNotFound`.
 
 @see AWSShieldAssociateDRTLogBucketRequest
 @see AWSShieldAssociateDRTLogBucketResponse
 */
- (void)associateDRTLogBucket:(AWSShieldAssociateDRTLogBucketRequest *)request completionHandler:(void (^ _Nullable)(AWSShieldAssociateDRTLogBucketResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Authorizes the DDoS Response Team (DRT), using the specified role, to access your AWS account to assist with DDoS attack mitigation during potential attacks. This enables the DRT to inspect your AWS WAF configuration and create or update AWS WAF rules and web ACLs.</p><p>You can associate only one <code>RoleArn</code> with your subscription. If you submit an <code>AssociateDRTRole</code> request for an account that already has an associated role, the new <code>RoleArn</code> will replace the existing <code>RoleArn</code>. </p><p>Prior to making the <code>AssociateDRTRole</code> request, you must attach the <a href="https://console.aws.amazon.com/iam/home?#/policies/arn:aws:iam::aws:policy/service-role/AWSShieldDRTAccessPolicy">AWSShieldDRTAccessPolicy</a> managed policy to the role you will specify in the request. For more information see <a href=" https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_manage-attach-detach.html">Attaching and Detaching IAM Policies</a>. The role must also trust the service principal <code> drt.shield.amazonaws.com</code>. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html">IAM JSON Policy Elements: Principal</a>.</p><p>The DRT will have access only to your AWS WAF and Shield resources. By submitting this request, you authorize the DRT to inspect your AWS WAF and Shield configuration and create and update AWS WAF rules and web ACLs on your behalf. The DRT takes these actions only if explicitly authorized by you.</p><p>You must have the <code>iam:PassRole</code> permission to make an <code>AssociateDRTRole</code> request. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_passrole.html">Granting a User Permissions to Pass a Role to an AWS Service</a>. </p><p>To use the services of the DRT and make an <code>AssociateDRTRole</code> request, you must be subscribed to the <a href="https://aws.amazon.com/premiumsupport/business-support/">Business Support plan</a> or the <a href="https://aws.amazon.com/premiumsupport/enterprise-support/">Enterprise Support plan</a>.</p>
 
 @param request A container for the necessary parameters to execute the AssociateDRTRole service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSShieldAssociateDRTRoleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorInvalidOperation`, `AWSShieldErrorInvalidParameter`, `AWSShieldErrorAccessDeniedForDependency`, `AWSShieldErrorOptimisticLock`, `AWSShieldErrorResourceNotFound`.
 
 @see AWSShieldAssociateDRTRoleRequest
 @see AWSShieldAssociateDRTRoleResponse
 */
- (AWSTask<AWSShieldAssociateDRTRoleResponse *> *)associateDRTRole:(AWSShieldAssociateDRTRoleRequest *)request;

/**
 <p>Authorizes the DDoS Response Team (DRT), using the specified role, to access your AWS account to assist with DDoS attack mitigation during potential attacks. This enables the DRT to inspect your AWS WAF configuration and create or update AWS WAF rules and web ACLs.</p><p>You can associate only one <code>RoleArn</code> with your subscription. If you submit an <code>AssociateDRTRole</code> request for an account that already has an associated role, the new <code>RoleArn</code> will replace the existing <code>RoleArn</code>. </p><p>Prior to making the <code>AssociateDRTRole</code> request, you must attach the <a href="https://console.aws.amazon.com/iam/home?#/policies/arn:aws:iam::aws:policy/service-role/AWSShieldDRTAccessPolicy">AWSShieldDRTAccessPolicy</a> managed policy to the role you will specify in the request. For more information see <a href=" https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_manage-attach-detach.html">Attaching and Detaching IAM Policies</a>. The role must also trust the service principal <code> drt.shield.amazonaws.com</code>. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html">IAM JSON Policy Elements: Principal</a>.</p><p>The DRT will have access only to your AWS WAF and Shield resources. By submitting this request, you authorize the DRT to inspect your AWS WAF and Shield configuration and create and update AWS WAF rules and web ACLs on your behalf. The DRT takes these actions only if explicitly authorized by you.</p><p>You must have the <code>iam:PassRole</code> permission to make an <code>AssociateDRTRole</code> request. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_passrole.html">Granting a User Permissions to Pass a Role to an AWS Service</a>. </p><p>To use the services of the DRT and make an <code>AssociateDRTRole</code> request, you must be subscribed to the <a href="https://aws.amazon.com/premiumsupport/business-support/">Business Support plan</a> or the <a href="https://aws.amazon.com/premiumsupport/enterprise-support/">Enterprise Support plan</a>.</p>
 
 @param request A container for the necessary parameters to execute the AssociateDRTRole service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorInvalidOperation`, `AWSShieldErrorInvalidParameter`, `AWSShieldErrorAccessDeniedForDependency`, `AWSShieldErrorOptimisticLock`, `AWSShieldErrorResourceNotFound`.
 
 @see AWSShieldAssociateDRTRoleRequest
 @see AWSShieldAssociateDRTRoleResponse
 */
- (void)associateDRTRole:(AWSShieldAssociateDRTRoleRequest *)request completionHandler:(void (^ _Nullable)(AWSShieldAssociateDRTRoleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds health-based detection to the Shield Advanced protection for a resource. Shield Advanced health-based detection uses the health of your AWS resource to improve responsiveness and accuracy in attack detection and mitigation. </p><p>You define the health check in Route 53 and then associate it with your Shield Advanced protection. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/ddos-overview.html#ddos-advanced-health-check-option">Shield Advanced Health-Based Detection</a> in the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF and AWS Shield Developer Guide</a>. </p>
 
 @param request A container for the necessary parameters to execute the AssociateHealthCheck service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSShieldAssociateHealthCheckResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorLimitsExceeded`, `AWSShieldErrorResourceNotFound`, `AWSShieldErrorInvalidParameter`, `AWSShieldErrorOptimisticLock`.
 
 @see AWSShieldAssociateHealthCheckRequest
 @see AWSShieldAssociateHealthCheckResponse
 */
- (AWSTask<AWSShieldAssociateHealthCheckResponse *> *)associateHealthCheck:(AWSShieldAssociateHealthCheckRequest *)request;

/**
 <p>Adds health-based detection to the Shield Advanced protection for a resource. Shield Advanced health-based detection uses the health of your AWS resource to improve responsiveness and accuracy in attack detection and mitigation. </p><p>You define the health check in Route 53 and then associate it with your Shield Advanced protection. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/ddos-overview.html#ddos-advanced-health-check-option">Shield Advanced Health-Based Detection</a> in the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF and AWS Shield Developer Guide</a>. </p>
 
 @param request A container for the necessary parameters to execute the AssociateHealthCheck service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorLimitsExceeded`, `AWSShieldErrorResourceNotFound`, `AWSShieldErrorInvalidParameter`, `AWSShieldErrorOptimisticLock`.
 
 @see AWSShieldAssociateHealthCheckRequest
 @see AWSShieldAssociateHealthCheckResponse
 */
- (void)associateHealthCheck:(AWSShieldAssociateHealthCheckRequest *)request completionHandler:(void (^ _Nullable)(AWSShieldAssociateHealthCheckResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initializes proactive engagement and sets the list of contacts for the DDoS Response Team (DRT) to use. You must provide at least one phone number in the emergency contact list. </p><p>After you have initialized proactive engagement using this call, to disable or enable proactive engagement, use the calls <code>DisableProactiveEngagement</code> and <code>EnableProactiveEngagement</code>. </p><note><p>This call defines the list of email addresses and phone numbers that the DDoS Response Team (DRT) can use to contact you for escalations to the DRT and to initiate proactive customer support.</p><p>The contacts that you provide in the request replace any contacts that were already defined. If you already have contacts defined and want to use them, retrieve the list using <code>DescribeEmergencyContactSettings</code> and then provide it to this call. </p></note>
 
 @param request A container for the necessary parameters to execute the AssociateProactiveEngagementDetails service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSShieldAssociateProactiveEngagementDetailsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorInvalidOperation`, `AWSShieldErrorInvalidParameter`, `AWSShieldErrorResourceNotFound`, `AWSShieldErrorOptimisticLock`.
 
 @see AWSShieldAssociateProactiveEngagementDetailsRequest
 @see AWSShieldAssociateProactiveEngagementDetailsResponse
 */
- (AWSTask<AWSShieldAssociateProactiveEngagementDetailsResponse *> *)associateProactiveEngagementDetails:(AWSShieldAssociateProactiveEngagementDetailsRequest *)request;

/**
 <p>Initializes proactive engagement and sets the list of contacts for the DDoS Response Team (DRT) to use. You must provide at least one phone number in the emergency contact list. </p><p>After you have initialized proactive engagement using this call, to disable or enable proactive engagement, use the calls <code>DisableProactiveEngagement</code> and <code>EnableProactiveEngagement</code>. </p><note><p>This call defines the list of email addresses and phone numbers that the DDoS Response Team (DRT) can use to contact you for escalations to the DRT and to initiate proactive customer support.</p><p>The contacts that you provide in the request replace any contacts that were already defined. If you already have contacts defined and want to use them, retrieve the list using <code>DescribeEmergencyContactSettings</code> and then provide it to this call. </p></note>
 
 @param request A container for the necessary parameters to execute the AssociateProactiveEngagementDetails service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorInvalidOperation`, `AWSShieldErrorInvalidParameter`, `AWSShieldErrorResourceNotFound`, `AWSShieldErrorOptimisticLock`.
 
 @see AWSShieldAssociateProactiveEngagementDetailsRequest
 @see AWSShieldAssociateProactiveEngagementDetailsResponse
 */
- (void)associateProactiveEngagementDetails:(AWSShieldAssociateProactiveEngagementDetailsRequest *)request completionHandler:(void (^ _Nullable)(AWSShieldAssociateProactiveEngagementDetailsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables AWS Shield Advanced for a specific AWS resource. The resource can be an Amazon CloudFront distribution, Elastic Load Balancing load balancer, AWS Global Accelerator accelerator, Elastic IP Address, or an Amazon Route 53 hosted zone.</p><p>You can add protection to only a single resource with each CreateProtection request. If you want to add protection to multiple resources at once, use the <a href="https://console.aws.amazon.com/waf/">AWS WAF console</a>. For more information see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/getting-started-ddos.html">Getting Started with AWS Shield Advanced</a> and <a href="https://docs.aws.amazon.com/waf/latest/developerguide/configure-new-protection.html">Add AWS Shield Advanced Protection to more AWS Resources</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateProtection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSShieldCreateProtectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorInvalidResource`, `AWSShieldErrorInvalidOperation`, `AWSShieldErrorLimitsExceeded`, `AWSShieldErrorResourceAlreadyExists`, `AWSShieldErrorOptimisticLock`, `AWSShieldErrorResourceNotFound`.
 
 @see AWSShieldCreateProtectionRequest
 @see AWSShieldCreateProtectionResponse
 */
- (AWSTask<AWSShieldCreateProtectionResponse *> *)createProtection:(AWSShieldCreateProtectionRequest *)request;

/**
 <p>Enables AWS Shield Advanced for a specific AWS resource. The resource can be an Amazon CloudFront distribution, Elastic Load Balancing load balancer, AWS Global Accelerator accelerator, Elastic IP Address, or an Amazon Route 53 hosted zone.</p><p>You can add protection to only a single resource with each CreateProtection request. If you want to add protection to multiple resources at once, use the <a href="https://console.aws.amazon.com/waf/">AWS WAF console</a>. For more information see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/getting-started-ddos.html">Getting Started with AWS Shield Advanced</a> and <a href="https://docs.aws.amazon.com/waf/latest/developerguide/configure-new-protection.html">Add AWS Shield Advanced Protection to more AWS Resources</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateProtection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorInvalidResource`, `AWSShieldErrorInvalidOperation`, `AWSShieldErrorLimitsExceeded`, `AWSShieldErrorResourceAlreadyExists`, `AWSShieldErrorOptimisticLock`, `AWSShieldErrorResourceNotFound`.
 
 @see AWSShieldCreateProtectionRequest
 @see AWSShieldCreateProtectionResponse
 */
- (void)createProtection:(AWSShieldCreateProtectionRequest *)request completionHandler:(void (^ _Nullable)(AWSShieldCreateProtectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Activates AWS Shield Advanced for an account.</p><p>As part of this request you can specify <code>EmergencySettings</code> that automaticaly grant the DDoS response team (DRT) needed permissions to assist you during a suspected DDoS attack. For more information see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/authorize-DRT.html">Authorize the DDoS Response Team to Create Rules and Web ACLs on Your Behalf</a>.</p><p>To use the services of the DRT, you must be subscribed to the <a href="https://aws.amazon.com/premiumsupport/business-support/">Business Support plan</a> or the <a href="https://aws.amazon.com/premiumsupport/enterprise-support/">Enterprise Support plan</a>.</p><p>When you initally create a subscription, your subscription is set to be automatically renewed at the end of the existing subscription period. You can change this by submitting an <code>UpdateSubscription</code> request. </p>
 
 @param request A container for the necessary parameters to execute the CreateSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSShieldCreateSubscriptionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorResourceAlreadyExists`.
 
 @see AWSShieldCreateSubscriptionRequest
 @see AWSShieldCreateSubscriptionResponse
 */
- (AWSTask<AWSShieldCreateSubscriptionResponse *> *)createSubscription:(AWSShieldCreateSubscriptionRequest *)request;

/**
 <p>Activates AWS Shield Advanced for an account.</p><p>As part of this request you can specify <code>EmergencySettings</code> that automaticaly grant the DDoS response team (DRT) needed permissions to assist you during a suspected DDoS attack. For more information see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/authorize-DRT.html">Authorize the DDoS Response Team to Create Rules and Web ACLs on Your Behalf</a>.</p><p>To use the services of the DRT, you must be subscribed to the <a href="https://aws.amazon.com/premiumsupport/business-support/">Business Support plan</a> or the <a href="https://aws.amazon.com/premiumsupport/enterprise-support/">Enterprise Support plan</a>.</p><p>When you initally create a subscription, your subscription is set to be automatically renewed at the end of the existing subscription period. You can change this by submitting an <code>UpdateSubscription</code> request. </p>
 
 @param request A container for the necessary parameters to execute the CreateSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorResourceAlreadyExists`.
 
 @see AWSShieldCreateSubscriptionRequest
 @see AWSShieldCreateSubscriptionResponse
 */
- (void)createSubscription:(AWSShieldCreateSubscriptionRequest *)request completionHandler:(void (^ _Nullable)(AWSShieldCreateSubscriptionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an AWS Shield Advanced <a>Protection</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteProtection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSShieldDeleteProtectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorResourceNotFound`, `AWSShieldErrorOptimisticLock`.
 
 @see AWSShieldDeleteProtectionRequest
 @see AWSShieldDeleteProtectionResponse
 */
- (AWSTask<AWSShieldDeleteProtectionResponse *> *)deleteProtection:(AWSShieldDeleteProtectionRequest *)request;

/**
 <p>Deletes an AWS Shield Advanced <a>Protection</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteProtection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorResourceNotFound`, `AWSShieldErrorOptimisticLock`.
 
 @see AWSShieldDeleteProtectionRequest
 @see AWSShieldDeleteProtectionResponse
 */
- (void)deleteProtection:(AWSShieldDeleteProtectionRequest *)request completionHandler:(void (^ _Nullable)(AWSShieldDeleteProtectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes AWS Shield Advanced from an account. AWS Shield Advanced requires a 1-year subscription commitment. You cannot delete a subscription prior to the completion of that commitment. </p>
 
 @param request A container for the necessary parameters to execute the DeleteSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSShieldDeleteSubscriptionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorLockedSubscription`, `AWSShieldErrorResourceNotFound`.
 
 @see AWSShieldDeleteSubscriptionRequest
 @see AWSShieldDeleteSubscriptionResponse
 */
- (AWSTask<AWSShieldDeleteSubscriptionResponse *> *)deleteSubscription:(AWSShieldDeleteSubscriptionRequest *)request;

/**
 <p>Removes AWS Shield Advanced from an account. AWS Shield Advanced requires a 1-year subscription commitment. You cannot delete a subscription prior to the completion of that commitment. </p>
 
 @param request A container for the necessary parameters to execute the DeleteSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorLockedSubscription`, `AWSShieldErrorResourceNotFound`.
 
 @see AWSShieldDeleteSubscriptionRequest
 @see AWSShieldDeleteSubscriptionResponse
 */
- (void)deleteSubscription:(AWSShieldDeleteSubscriptionRequest *)request completionHandler:(void (^ _Nullable)(AWSShieldDeleteSubscriptionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the details of a DDoS attack. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAttack service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSShieldDescribeAttackResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorAccessDenied`.
 
 @see AWSShieldDescribeAttackRequest
 @see AWSShieldDescribeAttackResponse
 */
- (AWSTask<AWSShieldDescribeAttackResponse *> *)describeAttack:(AWSShieldDescribeAttackRequest *)request;

/**
 <p>Describes the details of a DDoS attack. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAttack service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorAccessDenied`.
 
 @see AWSShieldDescribeAttackRequest
 @see AWSShieldDescribeAttackResponse
 */
- (void)describeAttack:(AWSShieldDescribeAttackRequest *)request completionHandler:(void (^ _Nullable)(AWSShieldDescribeAttackResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the current role and list of Amazon S3 log buckets used by the DDoS Response Team (DRT) to access your AWS account while assisting with attack mitigation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDRTAccess service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSShieldDescribeDRTAccessResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorResourceNotFound`.
 
 @see AWSShieldDescribeDRTAccessRequest
 @see AWSShieldDescribeDRTAccessResponse
 */
- (AWSTask<AWSShieldDescribeDRTAccessResponse *> *)describeDRTAccess:(AWSShieldDescribeDRTAccessRequest *)request;

/**
 <p>Returns the current role and list of Amazon S3 log buckets used by the DDoS Response Team (DRT) to access your AWS account while assisting with attack mitigation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDRTAccess service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorResourceNotFound`.
 
 @see AWSShieldDescribeDRTAccessRequest
 @see AWSShieldDescribeDRTAccessResponse
 */
- (void)describeDRTAccess:(AWSShieldDescribeDRTAccessRequest *)request completionHandler:(void (^ _Nullable)(AWSShieldDescribeDRTAccessResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>A list of email addresses and phone numbers that the DDoS Response Team (DRT) can use to contact you if you have proactive engagement enabled, for escalations to the DRT and to initiate proactive customer support.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEmergencyContactSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSShieldDescribeEmergencyContactSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorResourceNotFound`.
 
 @see AWSShieldDescribeEmergencyContactSettingsRequest
 @see AWSShieldDescribeEmergencyContactSettingsResponse
 */
- (AWSTask<AWSShieldDescribeEmergencyContactSettingsResponse *> *)describeEmergencyContactSettings:(AWSShieldDescribeEmergencyContactSettingsRequest *)request;

/**
 <p>A list of email addresses and phone numbers that the DDoS Response Team (DRT) can use to contact you if you have proactive engagement enabled, for escalations to the DRT and to initiate proactive customer support.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEmergencyContactSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorResourceNotFound`.
 
 @see AWSShieldDescribeEmergencyContactSettingsRequest
 @see AWSShieldDescribeEmergencyContactSettingsResponse
 */
- (void)describeEmergencyContactSettings:(AWSShieldDescribeEmergencyContactSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSShieldDescribeEmergencyContactSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the details of a <a>Protection</a> object.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProtection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSShieldDescribeProtectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorInvalidParameter`, `AWSShieldErrorResourceNotFound`.
 
 @see AWSShieldDescribeProtectionRequest
 @see AWSShieldDescribeProtectionResponse
 */
- (AWSTask<AWSShieldDescribeProtectionResponse *> *)describeProtection:(AWSShieldDescribeProtectionRequest *)request;

/**
 <p>Lists the details of a <a>Protection</a> object.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProtection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorInvalidParameter`, `AWSShieldErrorResourceNotFound`.
 
 @see AWSShieldDescribeProtectionRequest
 @see AWSShieldDescribeProtectionResponse
 */
- (void)describeProtection:(AWSShieldDescribeProtectionRequest *)request completionHandler:(void (^ _Nullable)(AWSShieldDescribeProtectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides details about the AWS Shield Advanced subscription for an account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSShieldDescribeSubscriptionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorResourceNotFound`.
 
 @see AWSShieldDescribeSubscriptionRequest
 @see AWSShieldDescribeSubscriptionResponse
 */
- (AWSTask<AWSShieldDescribeSubscriptionResponse *> *)describeSubscription:(AWSShieldDescribeSubscriptionRequest *)request;

/**
 <p>Provides details about the AWS Shield Advanced subscription for an account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorResourceNotFound`.
 
 @see AWSShieldDescribeSubscriptionRequest
 @see AWSShieldDescribeSubscriptionResponse
 */
- (void)describeSubscription:(AWSShieldDescribeSubscriptionRequest *)request completionHandler:(void (^ _Nullable)(AWSShieldDescribeSubscriptionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes authorization from the DDoS Response Team (DRT) to notify contacts about escalations to the DRT and to initiate proactive customer support.</p>
 
 @param request A container for the necessary parameters to execute the DisableProactiveEngagement service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSShieldDisableProactiveEngagementResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorInvalidOperation`, `AWSShieldErrorInvalidParameter`, `AWSShieldErrorResourceNotFound`, `AWSShieldErrorOptimisticLock`.
 
 @see AWSShieldDisableProactiveEngagementRequest
 @see AWSShieldDisableProactiveEngagementResponse
 */
- (AWSTask<AWSShieldDisableProactiveEngagementResponse *> *)disableProactiveEngagement:(AWSShieldDisableProactiveEngagementRequest *)request;

/**
 <p>Removes authorization from the DDoS Response Team (DRT) to notify contacts about escalations to the DRT and to initiate proactive customer support.</p>
 
 @param request A container for the necessary parameters to execute the DisableProactiveEngagement service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorInvalidOperation`, `AWSShieldErrorInvalidParameter`, `AWSShieldErrorResourceNotFound`, `AWSShieldErrorOptimisticLock`.
 
 @see AWSShieldDisableProactiveEngagementRequest
 @see AWSShieldDisableProactiveEngagementResponse
 */
- (void)disableProactiveEngagement:(AWSShieldDisableProactiveEngagementRequest *)request completionHandler:(void (^ _Nullable)(AWSShieldDisableProactiveEngagementResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the DDoS Response Team's (DRT) access to the specified Amazon S3 bucket containing your AWS WAF logs.</p><p>To make a <code>DisassociateDRTLogBucket</code> request, you must be subscribed to the <a href="https://aws.amazon.com/premiumsupport/business-support/">Business Support plan</a> or the <a href="https://aws.amazon.com/premiumsupport/enterprise-support/">Enterprise Support plan</a>. However, if you are not subscribed to one of these support plans, but had been previously and had granted the DRT access to your account, you can submit a <code>DisassociateDRTLogBucket</code> request to remove this access.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateDRTLogBucket service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSShieldDisassociateDRTLogBucketResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorInvalidOperation`, `AWSShieldErrorNoAssociatedRole`, `AWSShieldErrorAccessDeniedForDependency`, `AWSShieldErrorOptimisticLock`, `AWSShieldErrorResourceNotFound`.
 
 @see AWSShieldDisassociateDRTLogBucketRequest
 @see AWSShieldDisassociateDRTLogBucketResponse
 */
- (AWSTask<AWSShieldDisassociateDRTLogBucketResponse *> *)disassociateDRTLogBucket:(AWSShieldDisassociateDRTLogBucketRequest *)request;

/**
 <p>Removes the DDoS Response Team's (DRT) access to the specified Amazon S3 bucket containing your AWS WAF logs.</p><p>To make a <code>DisassociateDRTLogBucket</code> request, you must be subscribed to the <a href="https://aws.amazon.com/premiumsupport/business-support/">Business Support plan</a> or the <a href="https://aws.amazon.com/premiumsupport/enterprise-support/">Enterprise Support plan</a>. However, if you are not subscribed to one of these support plans, but had been previously and had granted the DRT access to your account, you can submit a <code>DisassociateDRTLogBucket</code> request to remove this access.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateDRTLogBucket service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorInvalidOperation`, `AWSShieldErrorNoAssociatedRole`, `AWSShieldErrorAccessDeniedForDependency`, `AWSShieldErrorOptimisticLock`, `AWSShieldErrorResourceNotFound`.
 
 @see AWSShieldDisassociateDRTLogBucketRequest
 @see AWSShieldDisassociateDRTLogBucketResponse
 */
- (void)disassociateDRTLogBucket:(AWSShieldDisassociateDRTLogBucketRequest *)request completionHandler:(void (^ _Nullable)(AWSShieldDisassociateDRTLogBucketResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the DDoS Response Team's (DRT) access to your AWS account.</p><p>To make a <code>DisassociateDRTRole</code> request, you must be subscribed to the <a href="https://aws.amazon.com/premiumsupport/business-support/">Business Support plan</a> or the <a href="https://aws.amazon.com/premiumsupport/enterprise-support/">Enterprise Support plan</a>. However, if you are not subscribed to one of these support plans, but had been previously and had granted the DRT access to your account, you can submit a <code>DisassociateDRTRole</code> request to remove this access.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateDRTRole service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSShieldDisassociateDRTRoleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorInvalidOperation`, `AWSShieldErrorOptimisticLock`, `AWSShieldErrorResourceNotFound`.
 
 @see AWSShieldDisassociateDRTRoleRequest
 @see AWSShieldDisassociateDRTRoleResponse
 */
- (AWSTask<AWSShieldDisassociateDRTRoleResponse *> *)disassociateDRTRole:(AWSShieldDisassociateDRTRoleRequest *)request;

/**
 <p>Removes the DDoS Response Team's (DRT) access to your AWS account.</p><p>To make a <code>DisassociateDRTRole</code> request, you must be subscribed to the <a href="https://aws.amazon.com/premiumsupport/business-support/">Business Support plan</a> or the <a href="https://aws.amazon.com/premiumsupport/enterprise-support/">Enterprise Support plan</a>. However, if you are not subscribed to one of these support plans, but had been previously and had granted the DRT access to your account, you can submit a <code>DisassociateDRTRole</code> request to remove this access.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateDRTRole service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorInvalidOperation`, `AWSShieldErrorOptimisticLock`, `AWSShieldErrorResourceNotFound`.
 
 @see AWSShieldDisassociateDRTRoleRequest
 @see AWSShieldDisassociateDRTRoleResponse
 */
- (void)disassociateDRTRole:(AWSShieldDisassociateDRTRoleRequest *)request completionHandler:(void (^ _Nullable)(AWSShieldDisassociateDRTRoleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes health-based detection from the Shield Advanced protection for a resource. Shield Advanced health-based detection uses the health of your AWS resource to improve responsiveness and accuracy in attack detection and mitigation. </p><p>You define the health check in Route 53 and then associate or disassociate it with your Shield Advanced protection. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/ddos-overview.html#ddos-advanced-health-check-option">Shield Advanced Health-Based Detection</a> in the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF and AWS Shield Developer Guide</a>. </p>
 
 @param request A container for the necessary parameters to execute the DisassociateHealthCheck service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSShieldDisassociateHealthCheckResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorInvalidParameter`, `AWSShieldErrorResourceNotFound`, `AWSShieldErrorOptimisticLock`.
 
 @see AWSShieldDisassociateHealthCheckRequest
 @see AWSShieldDisassociateHealthCheckResponse
 */
- (AWSTask<AWSShieldDisassociateHealthCheckResponse *> *)disassociateHealthCheck:(AWSShieldDisassociateHealthCheckRequest *)request;

/**
 <p>Removes health-based detection from the Shield Advanced protection for a resource. Shield Advanced health-based detection uses the health of your AWS resource to improve responsiveness and accuracy in attack detection and mitigation. </p><p>You define the health check in Route 53 and then associate or disassociate it with your Shield Advanced protection. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/ddos-overview.html#ddos-advanced-health-check-option">Shield Advanced Health-Based Detection</a> in the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF and AWS Shield Developer Guide</a>. </p>
 
 @param request A container for the necessary parameters to execute the DisassociateHealthCheck service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorInvalidParameter`, `AWSShieldErrorResourceNotFound`, `AWSShieldErrorOptimisticLock`.
 
 @see AWSShieldDisassociateHealthCheckRequest
 @see AWSShieldDisassociateHealthCheckResponse
 */
- (void)disassociateHealthCheck:(AWSShieldDisassociateHealthCheckRequest *)request completionHandler:(void (^ _Nullable)(AWSShieldDisassociateHealthCheckResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Authorizes the DDoS Response Team (DRT) to use email and phone to notify contacts about escalations to the DRT and to initiate proactive customer support.</p>
 
 @param request A container for the necessary parameters to execute the EnableProactiveEngagement service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSShieldEnableProactiveEngagementResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorInvalidOperation`, `AWSShieldErrorInvalidParameter`, `AWSShieldErrorResourceNotFound`, `AWSShieldErrorOptimisticLock`.
 
 @see AWSShieldEnableProactiveEngagementRequest
 @see AWSShieldEnableProactiveEngagementResponse
 */
- (AWSTask<AWSShieldEnableProactiveEngagementResponse *> *)enableProactiveEngagement:(AWSShieldEnableProactiveEngagementRequest *)request;

/**
 <p>Authorizes the DDoS Response Team (DRT) to use email and phone to notify contacts about escalations to the DRT and to initiate proactive customer support.</p>
 
 @param request A container for the necessary parameters to execute the EnableProactiveEngagement service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorInvalidOperation`, `AWSShieldErrorInvalidParameter`, `AWSShieldErrorResourceNotFound`, `AWSShieldErrorOptimisticLock`.
 
 @see AWSShieldEnableProactiveEngagementRequest
 @see AWSShieldEnableProactiveEngagementResponse
 */
- (void)enableProactiveEngagement:(AWSShieldEnableProactiveEngagementRequest *)request completionHandler:(void (^ _Nullable)(AWSShieldEnableProactiveEngagementResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the <code>SubscriptionState</code>, either <code>Active</code> or <code>Inactive</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetSubscriptionState service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSShieldGetSubscriptionStateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`.
 
 @see AWSShieldGetSubscriptionStateRequest
 @see AWSShieldGetSubscriptionStateResponse
 */
- (AWSTask<AWSShieldGetSubscriptionStateResponse *> *)getSubscriptionState:(AWSShieldGetSubscriptionStateRequest *)request;

/**
 <p>Returns the <code>SubscriptionState</code>, either <code>Active</code> or <code>Inactive</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetSubscriptionState service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`.
 
 @see AWSShieldGetSubscriptionStateRequest
 @see AWSShieldGetSubscriptionStateResponse
 */
- (void)getSubscriptionState:(AWSShieldGetSubscriptionStateRequest *)request completionHandler:(void (^ _Nullable)(AWSShieldGetSubscriptionStateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns all ongoing DDoS attacks or all DDoS attacks during a specified time period.</p>
 
 @param request A container for the necessary parameters to execute the ListAttacks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSShieldListAttacksResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorInvalidParameter`, `AWSShieldErrorInvalidOperation`.
 
 @see AWSShieldListAttacksRequest
 @see AWSShieldListAttacksResponse
 */
- (AWSTask<AWSShieldListAttacksResponse *> *)listAttacks:(AWSShieldListAttacksRequest *)request;

/**
 <p>Returns all ongoing DDoS attacks or all DDoS attacks during a specified time period.</p>
 
 @param request A container for the necessary parameters to execute the ListAttacks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorInvalidParameter`, `AWSShieldErrorInvalidOperation`.
 
 @see AWSShieldListAttacksRequest
 @see AWSShieldListAttacksResponse
 */
- (void)listAttacks:(AWSShieldListAttacksRequest *)request completionHandler:(void (^ _Nullable)(AWSShieldListAttacksResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all <a>Protection</a> objects for the account.</p>
 
 @param request A container for the necessary parameters to execute the ListProtections service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSShieldListProtectionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorResourceNotFound`, `AWSShieldErrorInvalidPaginationToken`.
 
 @see AWSShieldListProtectionsRequest
 @see AWSShieldListProtectionsResponse
 */
- (AWSTask<AWSShieldListProtectionsResponse *> *)listProtections:(AWSShieldListProtectionsRequest *)request;

/**
 <p>Lists all <a>Protection</a> objects for the account.</p>
 
 @param request A container for the necessary parameters to execute the ListProtections service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorResourceNotFound`, `AWSShieldErrorInvalidPaginationToken`.
 
 @see AWSShieldListProtectionsRequest
 @see AWSShieldListProtectionsResponse
 */
- (void)listProtections:(AWSShieldListProtectionsRequest *)request completionHandler:(void (^ _Nullable)(AWSShieldListProtectionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the details of the list of email addresses and phone numbers that the DDoS Response Team (DRT) can use to contact you if you have proactive engagement enabled, for escalations to the DRT and to initiate proactive customer support.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEmergencyContactSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSShieldUpdateEmergencyContactSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorInvalidParameter`, `AWSShieldErrorOptimisticLock`, `AWSShieldErrorResourceNotFound`.
 
 @see AWSShieldUpdateEmergencyContactSettingsRequest
 @see AWSShieldUpdateEmergencyContactSettingsResponse
 */
- (AWSTask<AWSShieldUpdateEmergencyContactSettingsResponse *> *)updateEmergencyContactSettings:(AWSShieldUpdateEmergencyContactSettingsRequest *)request;

/**
 <p>Updates the details of the list of email addresses and phone numbers that the DDoS Response Team (DRT) can use to contact you if you have proactive engagement enabled, for escalations to the DRT and to initiate proactive customer support.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEmergencyContactSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorInvalidParameter`, `AWSShieldErrorOptimisticLock`, `AWSShieldErrorResourceNotFound`.
 
 @see AWSShieldUpdateEmergencyContactSettingsRequest
 @see AWSShieldUpdateEmergencyContactSettingsResponse
 */
- (void)updateEmergencyContactSettings:(AWSShieldUpdateEmergencyContactSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSShieldUpdateEmergencyContactSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the details of an existing subscription. Only enter values for parameters you want to change. Empty parameters are not updated.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSShieldUpdateSubscriptionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorLockedSubscription`, `AWSShieldErrorResourceNotFound`, `AWSShieldErrorInvalidParameter`, `AWSShieldErrorOptimisticLock`.
 
 @see AWSShieldUpdateSubscriptionRequest
 @see AWSShieldUpdateSubscriptionResponse
 */
- (AWSTask<AWSShieldUpdateSubscriptionResponse *> *)updateSubscription:(AWSShieldUpdateSubscriptionRequest *)request;

/**
 <p>Updates the details of an existing subscription. Only enter values for parameters you want to change. Empty parameters are not updated.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSShieldErrorDomain` domain and the following error code: `AWSShieldErrorInternalError`, `AWSShieldErrorLockedSubscription`, `AWSShieldErrorResourceNotFound`, `AWSShieldErrorInvalidParameter`, `AWSShieldErrorOptimisticLock`.
 
 @see AWSShieldUpdateSubscriptionRequest
 @see AWSShieldUpdateSubscriptionResponse
 */
- (void)updateSubscription:(AWSShieldUpdateSubscriptionRequest *)request completionHandler:(void (^ _Nullable)(AWSShieldUpdateSubscriptionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
