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
#import "AWSMarketplacemeteringModel.h"
#import "AWSMarketplacemeteringResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSMarketplacemetering
FOUNDATION_EXPORT NSString *const AWSMarketplacemeteringSDKVersion;

/**
 <fullname>AWS Marketplace Metering Service</fullname><p>This reference provides descriptions of the low-level AWS Marketplace Metering Service API.</p><p>AWS Marketplace sellers can use this API to submit usage data for custom usage dimensions.</p><p>For information on the permissions you need to use this API, see <a href="https://docs.aws.amazon.com/marketplace/latest/userguide/iam-user-policy-for-aws-marketplace-actions.html">AWS Marketing metering and entitlement API permissions</a> in the <i>AWS Marketplace Seller Guide.</i></p><p><b>Submitting Metering Records</b></p><ul><li><p><i>MeterUsage</i>- Submits the metering record for a Marketplace product. MeterUsage is called from an EC2 instance or a container running on EKS or ECS.</p></li><li><p><i>BatchMeterUsage</i>- Submits the metering record for a set of customers. BatchMeterUsage is called from a software-as-a-service (SaaS) application.</p></li></ul><p><b>Accepting New Customers</b></p><ul><li><p><i>ResolveCustomer</i>- Called by a SaaS application during the registration process. When a buyer visits your website during the registration process, the buyer submits a Registration Token through the browser. The Registration Token is resolved through this API to obtain a CustomerIdentifier and Product Code.</p></li></ul><p><b>Entitlement and Metering for Paid Container Products</b></p><ul><li><p> Paid container software products sold through AWS Marketplace must integrate with the AWS Marketplace Metering Service and call the RegisterUsage operation for software entitlement and metering. Free and BYOL products for Amazon ECS or Amazon EKS aren't required to call RegisterUsage, but you can do so if you want to receive usage data in your seller reports. For more information on using the RegisterUsage operation, see <a href="https://docs.aws.amazon.com/marketplace/latest/userguide/container-based-products.html">Container-Based Products</a>. </p></li></ul><p>BatchMeterUsage API calls are captured by AWS CloudTrail. You can use Cloudtrail to verify that the SaaS metering records that you sent are accurate by searching for records with the eventName of BatchMeterUsage. You can also use CloudTrail to audit records over time. For more information, see the <i><a href="http://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-concepts.html">AWS CloudTrail User Guide</a></i>.</p>
 */
@interface AWSMarketplacemetering : AWSService

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

     let Marketplacemetering = AWSMarketplacemetering.default()

 *Objective-C*

     AWSMarketplacemetering *Marketplacemetering = [AWSMarketplacemetering defaultMarketplacemetering];

 @return The default service client.
 */
+ (instancetype)defaultMarketplacemetering;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSMarketplacemetering.register(with: configuration!, forKey: "USWest2Marketplacemetering")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSMarketplacemetering registerMarketplacemeteringWithConfiguration:configuration forKey:@"USWest2Marketplacemetering"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Marketplacemetering = AWSMarketplacemetering(forKey: "USWest2Marketplacemetering")

 *Objective-C*

     AWSMarketplacemetering *Marketplacemetering = [AWSMarketplacemetering MarketplacemeteringForKey:@"USWest2Marketplacemetering"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerMarketplacemeteringWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerMarketplacemeteringWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSMarketplacemetering.register(with: configuration!, forKey: "USWest2Marketplacemetering")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSMarketplacemetering registerMarketplacemeteringWithConfiguration:configuration forKey:@"USWest2Marketplacemetering"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Marketplacemetering = AWSMarketplacemetering(forKey: "USWest2Marketplacemetering")

 *Objective-C*

     AWSMarketplacemetering *Marketplacemetering = [AWSMarketplacemetering MarketplacemeteringForKey:@"USWest2Marketplacemetering"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)MarketplacemeteringForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeMarketplacemeteringForKey:(NSString *)key;

/**
 <p>BatchMeterUsage is called from a SaaS application listed on the AWS Marketplace to post metering records for a set of customers.</p><p>For identical requests, the API is idempotent; requests can be retried with the same records or a subset of the input records.</p><p>Every request to BatchMeterUsage is for one product. If you need to meter usage for multiple products, you must make multiple calls to BatchMeterUsage.</p><p>BatchMeterUsage can process up to 25 UsageRecords at a time.</p>
 
 @param request A container for the necessary parameters to execute the BatchMeterUsage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMarketplacemeteringBatchMeterUsageResult`. On failed execution, `task.error` may contain an `NSError` with `AWSMarketplacemeteringErrorDomain` domain and the following error code: `AWSMarketplacemeteringErrorInternalServiceError`, `AWSMarketplacemeteringErrorInvalidProductCode`, `AWSMarketplacemeteringErrorInvalidUsageDimension`, `AWSMarketplacemeteringErrorInvalidCustomerIdentifier`, `AWSMarketplacemeteringErrorTimestampOutOfBounds`, `AWSMarketplacemeteringErrorThrottling`, `AWSMarketplacemeteringErrorDisabledApi`.
 
 @see AWSMarketplacemeteringBatchMeterUsageRequest
 @see AWSMarketplacemeteringBatchMeterUsageResult
 */
- (AWSTask<AWSMarketplacemeteringBatchMeterUsageResult *> *)batchMeterUsage:(AWSMarketplacemeteringBatchMeterUsageRequest *)request;

/**
 <p>BatchMeterUsage is called from a SaaS application listed on the AWS Marketplace to post metering records for a set of customers.</p><p>For identical requests, the API is idempotent; requests can be retried with the same records or a subset of the input records.</p><p>Every request to BatchMeterUsage is for one product. If you need to meter usage for multiple products, you must make multiple calls to BatchMeterUsage.</p><p>BatchMeterUsage can process up to 25 UsageRecords at a time.</p>
 
 @param request A container for the necessary parameters to execute the BatchMeterUsage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMarketplacemeteringErrorDomain` domain and the following error code: `AWSMarketplacemeteringErrorInternalServiceError`, `AWSMarketplacemeteringErrorInvalidProductCode`, `AWSMarketplacemeteringErrorInvalidUsageDimension`, `AWSMarketplacemeteringErrorInvalidCustomerIdentifier`, `AWSMarketplacemeteringErrorTimestampOutOfBounds`, `AWSMarketplacemeteringErrorThrottling`, `AWSMarketplacemeteringErrorDisabledApi`.
 
 @see AWSMarketplacemeteringBatchMeterUsageRequest
 @see AWSMarketplacemeteringBatchMeterUsageResult
 */
- (void)batchMeterUsage:(AWSMarketplacemeteringBatchMeterUsageRequest *)request completionHandler:(void (^ _Nullable)(AWSMarketplacemeteringBatchMeterUsageResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>API to emit metering records. For identical requests, the API is idempotent. It simply returns the metering record ID.</p><p>MeterUsage is authenticated on the buyer's AWS account using credentials from the EC2 instance, ECS task, or EKS pod.</p>
 
 @param request A container for the necessary parameters to execute the MeterUsage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMarketplacemeteringMeterUsageResult`. On failed execution, `task.error` may contain an `NSError` with `AWSMarketplacemeteringErrorDomain` domain and the following error code: `AWSMarketplacemeteringErrorInternalServiceError`, `AWSMarketplacemeteringErrorInvalidProductCode`, `AWSMarketplacemeteringErrorInvalidUsageDimension`, `AWSMarketplacemeteringErrorInvalidEndpointRegion`, `AWSMarketplacemeteringErrorTimestampOutOfBounds`, `AWSMarketplacemeteringErrorDuplicateRequest`, `AWSMarketplacemeteringErrorThrottling`, `AWSMarketplacemeteringErrorCustomerNotEntitled`.
 
 @see AWSMarketplacemeteringMeterUsageRequest
 @see AWSMarketplacemeteringMeterUsageResult
 */
- (AWSTask<AWSMarketplacemeteringMeterUsageResult *> *)meterUsage:(AWSMarketplacemeteringMeterUsageRequest *)request;

/**
 <p>API to emit metering records. For identical requests, the API is idempotent. It simply returns the metering record ID.</p><p>MeterUsage is authenticated on the buyer's AWS account using credentials from the EC2 instance, ECS task, or EKS pod.</p>
 
 @param request A container for the necessary parameters to execute the MeterUsage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMarketplacemeteringErrorDomain` domain and the following error code: `AWSMarketplacemeteringErrorInternalServiceError`, `AWSMarketplacemeteringErrorInvalidProductCode`, `AWSMarketplacemeteringErrorInvalidUsageDimension`, `AWSMarketplacemeteringErrorInvalidEndpointRegion`, `AWSMarketplacemeteringErrorTimestampOutOfBounds`, `AWSMarketplacemeteringErrorDuplicateRequest`, `AWSMarketplacemeteringErrorThrottling`, `AWSMarketplacemeteringErrorCustomerNotEntitled`.
 
 @see AWSMarketplacemeteringMeterUsageRequest
 @see AWSMarketplacemeteringMeterUsageResult
 */
- (void)meterUsage:(AWSMarketplacemeteringMeterUsageRequest *)request completionHandler:(void (^ _Nullable)(AWSMarketplacemeteringMeterUsageResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Paid container software products sold through AWS Marketplace must integrate with the AWS Marketplace Metering Service and call the RegisterUsage operation for software entitlement and metering. Free and BYOL products for Amazon ECS or Amazon EKS aren't required to call RegisterUsage, but you may choose to do so if you would like to receive usage data in your seller reports. The sections below explain the behavior of RegisterUsage. RegisterUsage performs two primary functions: metering and entitlement.</p><ul><li><p><i>Entitlement</i>: RegisterUsage allows you to verify that the customer running your paid software is subscribed to your product on AWS Marketplace, enabling you to guard against unauthorized use. Your container image that integrates with RegisterUsage is only required to guard against unauthorized use at container startup, as such a CustomerNotSubscribedException/PlatformNotSupportedException will only be thrown on the initial call to RegisterUsage. Subsequent calls from the same Amazon ECS task instance (e.g. task-id) or Amazon EKS pod will not throw a CustomerNotSubscribedException, even if the customer unsubscribes while the Amazon ECS task or Amazon EKS pod is still running.</p></li><li><p><i>Metering</i>: RegisterUsage meters software use per ECS task, per hour, or per pod for Amazon EKS with usage prorated to the second. A minimum of 1 minute of usage applies to tasks that are short lived. For example, if a customer has a 10 node Amazon ECS or Amazon EKS cluster and a service configured as a Daemon Set, then Amazon ECS or Amazon EKS will launch a task on all 10 cluster nodes and the customer will be charged: (10 * hourly_rate). Metering for software use is automatically handled by the AWS Marketplace Metering Control Plane -- your software is not required to perform any metering specific actions, other than call RegisterUsage once for metering of software use to commence. The AWS Marketplace Metering Control Plane will also continue to bill customers for running ECS tasks and Amazon EKS pods, regardless of the customers subscription state, removing the need for your software to perform entitlement checks at runtime.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the RegisterUsage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMarketplacemeteringRegisterUsageResult`. On failed execution, `task.error` may contain an `NSError` with `AWSMarketplacemeteringErrorDomain` domain and the following error code: `AWSMarketplacemeteringErrorInvalidProductCode`, `AWSMarketplacemeteringErrorInvalidRegion`, `AWSMarketplacemeteringErrorInvalidPublicKeyVersion`, `AWSMarketplacemeteringErrorPlatformNotSupported`, `AWSMarketplacemeteringErrorCustomerNotEntitled`, `AWSMarketplacemeteringErrorThrottling`, `AWSMarketplacemeteringErrorInternalServiceError`, `AWSMarketplacemeteringErrorDisabledApi`.
 
 @see AWSMarketplacemeteringRegisterUsageRequest
 @see AWSMarketplacemeteringRegisterUsageResult
 */
- (AWSTask<AWSMarketplacemeteringRegisterUsageResult *> *)registerUsage:(AWSMarketplacemeteringRegisterUsageRequest *)request;

/**
 <p>Paid container software products sold through AWS Marketplace must integrate with the AWS Marketplace Metering Service and call the RegisterUsage operation for software entitlement and metering. Free and BYOL products for Amazon ECS or Amazon EKS aren't required to call RegisterUsage, but you may choose to do so if you would like to receive usage data in your seller reports. The sections below explain the behavior of RegisterUsage. RegisterUsage performs two primary functions: metering and entitlement.</p><ul><li><p><i>Entitlement</i>: RegisterUsage allows you to verify that the customer running your paid software is subscribed to your product on AWS Marketplace, enabling you to guard against unauthorized use. Your container image that integrates with RegisterUsage is only required to guard against unauthorized use at container startup, as such a CustomerNotSubscribedException/PlatformNotSupportedException will only be thrown on the initial call to RegisterUsage. Subsequent calls from the same Amazon ECS task instance (e.g. task-id) or Amazon EKS pod will not throw a CustomerNotSubscribedException, even if the customer unsubscribes while the Amazon ECS task or Amazon EKS pod is still running.</p></li><li><p><i>Metering</i>: RegisterUsage meters software use per ECS task, per hour, or per pod for Amazon EKS with usage prorated to the second. A minimum of 1 minute of usage applies to tasks that are short lived. For example, if a customer has a 10 node Amazon ECS or Amazon EKS cluster and a service configured as a Daemon Set, then Amazon ECS or Amazon EKS will launch a task on all 10 cluster nodes and the customer will be charged: (10 * hourly_rate). Metering for software use is automatically handled by the AWS Marketplace Metering Control Plane -- your software is not required to perform any metering specific actions, other than call RegisterUsage once for metering of software use to commence. The AWS Marketplace Metering Control Plane will also continue to bill customers for running ECS tasks and Amazon EKS pods, regardless of the customers subscription state, removing the need for your software to perform entitlement checks at runtime.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the RegisterUsage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMarketplacemeteringErrorDomain` domain and the following error code: `AWSMarketplacemeteringErrorInvalidProductCode`, `AWSMarketplacemeteringErrorInvalidRegion`, `AWSMarketplacemeteringErrorInvalidPublicKeyVersion`, `AWSMarketplacemeteringErrorPlatformNotSupported`, `AWSMarketplacemeteringErrorCustomerNotEntitled`, `AWSMarketplacemeteringErrorThrottling`, `AWSMarketplacemeteringErrorInternalServiceError`, `AWSMarketplacemeteringErrorDisabledApi`.
 
 @see AWSMarketplacemeteringRegisterUsageRequest
 @see AWSMarketplacemeteringRegisterUsageResult
 */
- (void)registerUsage:(AWSMarketplacemeteringRegisterUsageRequest *)request completionHandler:(void (^ _Nullable)(AWSMarketplacemeteringRegisterUsageResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>ResolveCustomer is called by a SaaS application during the registration process. When a buyer visits your website during the registration process, the buyer submits a registration token through their browser. The registration token is resolved through this API to obtain a CustomerIdentifier and product code.</p>
 
 @param request A container for the necessary parameters to execute the ResolveCustomer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMarketplacemeteringResolveCustomerResult`. On failed execution, `task.error` may contain an `NSError` with `AWSMarketplacemeteringErrorDomain` domain and the following error code: `AWSMarketplacemeteringErrorInvalidToken`, `AWSMarketplacemeteringErrorExpiredToken`, `AWSMarketplacemeteringErrorThrottling`, `AWSMarketplacemeteringErrorInternalServiceError`, `AWSMarketplacemeteringErrorDisabledApi`.
 
 @see AWSMarketplacemeteringResolveCustomerRequest
 @see AWSMarketplacemeteringResolveCustomerResult
 */
- (AWSTask<AWSMarketplacemeteringResolveCustomerResult *> *)resolveCustomer:(AWSMarketplacemeteringResolveCustomerRequest *)request;

/**
 <p>ResolveCustomer is called by a SaaS application during the registration process. When a buyer visits your website during the registration process, the buyer submits a registration token through their browser. The registration token is resolved through this API to obtain a CustomerIdentifier and product code.</p>
 
 @param request A container for the necessary parameters to execute the ResolveCustomer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMarketplacemeteringErrorDomain` domain and the following error code: `AWSMarketplacemeteringErrorInvalidToken`, `AWSMarketplacemeteringErrorExpiredToken`, `AWSMarketplacemeteringErrorThrottling`, `AWSMarketplacemeteringErrorInternalServiceError`, `AWSMarketplacemeteringErrorDisabledApi`.
 
 @see AWSMarketplacemeteringResolveCustomerRequest
 @see AWSMarketplacemeteringResolveCustomerResult
 */
- (void)resolveCustomer:(AWSMarketplacemeteringResolveCustomerRequest *)request completionHandler:(void (^ _Nullable)(AWSMarketplacemeteringResolveCustomerResult * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
