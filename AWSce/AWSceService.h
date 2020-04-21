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
#import "AWSceModel.h"
#import "AWSceResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSce
FOUNDATION_EXPORT NSString *const AWSceSDKVersion;

/**
 <p>The Cost Explorer API enables you to programmatically query your cost and usage data. You can query for aggregated data such as total monthly costs or total daily usage. You can also query for granular data, such as the number of daily write operations for Amazon DynamoDB database tables in your production environment. </p><p>Service Endpoint</p><p>The Cost Explorer API provides the following endpoint:</p><ul><li><p><code>https://ce.us-east-1.amazonaws.com</code></p></li></ul><p>For information about costs associated with the Cost Explorer API, see <a href="http://aws.amazon.com/aws-cost-management/pricing/">AWS Cost Management Pricing</a>.</p>
 */
@interface AWSce : AWSService

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

     let ce = AWSce.default()

 *Objective-C*

     AWSce *ce = [AWSce defaultce];

 @return The default service client.
 */
+ (instancetype)defaultce;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSce.register(with: configuration!, forKey: "USWest2ce")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSce registerceWithConfiguration:configuration forKey:@"USWest2ce"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let ce = AWSce(forKey: "USWest2ce")

 *Objective-C*

     AWSce *ce = [AWSce ceForKey:@"USWest2ce"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerceWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerceWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSce.register(with: configuration!, forKey: "USWest2ce")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSce registerceWithConfiguration:configuration forKey:@"USWest2ce"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let ce = AWSce(forKey: "USWest2ce")

 *Objective-C*

     AWSce *ce = [AWSce ceForKey:@"USWest2ce"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)ceForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeceForKey:(NSString *)key;

/**
 <p>Creates a new Cost Category with the requested name and rules.</p>
 
 @param request A container for the necessary parameters to execute the CreateCostCategoryDefinition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSceCreateCostCategoryDefinitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorServiceQuotaExceeded`, `AWSceErrorLimitExceeded`.
 
 @see AWSceCreateCostCategoryDefinitionRequest
 @see AWSceCreateCostCategoryDefinitionResponse
 */
- (AWSTask<AWSceCreateCostCategoryDefinitionResponse *> *)createCostCategoryDefinition:(AWSceCreateCostCategoryDefinitionRequest *)request;

/**
 <p>Creates a new Cost Category with the requested name and rules.</p>
 
 @param request A container for the necessary parameters to execute the CreateCostCategoryDefinition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorServiceQuotaExceeded`, `AWSceErrorLimitExceeded`.
 
 @see AWSceCreateCostCategoryDefinitionRequest
 @see AWSceCreateCostCategoryDefinitionResponse
 */
- (void)createCostCategoryDefinition:(AWSceCreateCostCategoryDefinitionRequest *)request completionHandler:(void (^ _Nullable)(AWSceCreateCostCategoryDefinitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a Cost Category. Expenses from this month going forward will no longer be categorized with this Cost Category.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCostCategoryDefinition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSceDeleteCostCategoryDefinitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorResourceNotFound`, `AWSceErrorLimitExceeded`.
 
 @see AWSceDeleteCostCategoryDefinitionRequest
 @see AWSceDeleteCostCategoryDefinitionResponse
 */
- (AWSTask<AWSceDeleteCostCategoryDefinitionResponse *> *)deleteCostCategoryDefinition:(AWSceDeleteCostCategoryDefinitionRequest *)request;

/**
 <p>Deletes a Cost Category. Expenses from this month going forward will no longer be categorized with this Cost Category.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCostCategoryDefinition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorResourceNotFound`, `AWSceErrorLimitExceeded`.
 
 @see AWSceDeleteCostCategoryDefinitionRequest
 @see AWSceDeleteCostCategoryDefinitionResponse
 */
- (void)deleteCostCategoryDefinition:(AWSceDeleteCostCategoryDefinitionRequest *)request completionHandler:(void (^ _Nullable)(AWSceDeleteCostCategoryDefinitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the name, ARN, rules, definition, and effective dates of a Cost Category that's defined in the account.</p><p>You have the option to use <code>EffectiveOn</code> to return a Cost Category that is active on a specific date. If there is no <code>EffectiveOn</code> specified, you’ll see a Cost Category that is effective on the current date. If Cost Category is still effective, <code>EffectiveEnd</code> is omitted in the response. </p>
 
 @param request A container for the necessary parameters to execute the DescribeCostCategoryDefinition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSceDescribeCostCategoryDefinitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorResourceNotFound`, `AWSceErrorLimitExceeded`.
 
 @see AWSceDescribeCostCategoryDefinitionRequest
 @see AWSceDescribeCostCategoryDefinitionResponse
 */
- (AWSTask<AWSceDescribeCostCategoryDefinitionResponse *> *)describeCostCategoryDefinition:(AWSceDescribeCostCategoryDefinitionRequest *)request;

/**
 <p>Returns the name, ARN, rules, definition, and effective dates of a Cost Category that's defined in the account.</p><p>You have the option to use <code>EffectiveOn</code> to return a Cost Category that is active on a specific date. If there is no <code>EffectiveOn</code> specified, you’ll see a Cost Category that is effective on the current date. If Cost Category is still effective, <code>EffectiveEnd</code> is omitted in the response. </p>
 
 @param request A container for the necessary parameters to execute the DescribeCostCategoryDefinition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorResourceNotFound`, `AWSceErrorLimitExceeded`.
 
 @see AWSceDescribeCostCategoryDefinitionRequest
 @see AWSceDescribeCostCategoryDefinitionResponse
 */
- (void)describeCostCategoryDefinition:(AWSceDescribeCostCategoryDefinitionRequest *)request completionHandler:(void (^ _Nullable)(AWSceDescribeCostCategoryDefinitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves cost and usage metrics for your account. You can specify which cost and usage-related metric, such as <code>BlendedCosts</code> or <code>UsageQuantity</code>, that you want the request to return. You can also filter and group your data by various dimensions, such as <code>SERVICE</code> or <code>AZ</code>, in a specific time range. For a complete list of valid dimensions, see the <a href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_GetDimensionValues.html">GetDimensionValues</a> operation. Master accounts in an organization in AWS Organizations have access to all member accounts.</p>
 
 @param request A container for the necessary parameters to execute the GetCostAndUsage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSceGetCostAndUsageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorBillExpiration`, `AWSceErrorDataUnavailable`, `AWSceErrorInvalidNextToken`, `AWSceErrorRequestChanged`.
 
 @see AWSceGetCostAndUsageRequest
 @see AWSceGetCostAndUsageResponse
 */
- (AWSTask<AWSceGetCostAndUsageResponse *> *)getCostAndUsage:(AWSceGetCostAndUsageRequest *)request;

/**
 <p>Retrieves cost and usage metrics for your account. You can specify which cost and usage-related metric, such as <code>BlendedCosts</code> or <code>UsageQuantity</code>, that you want the request to return. You can also filter and group your data by various dimensions, such as <code>SERVICE</code> or <code>AZ</code>, in a specific time range. For a complete list of valid dimensions, see the <a href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_GetDimensionValues.html">GetDimensionValues</a> operation. Master accounts in an organization in AWS Organizations have access to all member accounts.</p>
 
 @param request A container for the necessary parameters to execute the GetCostAndUsage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorBillExpiration`, `AWSceErrorDataUnavailable`, `AWSceErrorInvalidNextToken`, `AWSceErrorRequestChanged`.
 
 @see AWSceGetCostAndUsageRequest
 @see AWSceGetCostAndUsageResponse
 */
- (void)getCostAndUsage:(AWSceGetCostAndUsageRequest *)request completionHandler:(void (^ _Nullable)(AWSceGetCostAndUsageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves cost and usage metrics with resources for your account. You can specify which cost and usage-related metric, such as <code>BlendedCosts</code> or <code>UsageQuantity</code>, that you want the request to return. You can also filter and group your data by various dimensions, such as <code>SERVICE</code> or <code>AZ</code>, in a specific time range. For a complete list of valid dimensions, see the <a href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_GetDimensionValues.html">GetDimensionValues</a> operation. Master accounts in an organization in AWS Organizations have access to all member accounts. This API is currently available for the Amazon Elastic Compute Cloud – Compute service only.</p><note><p>This is an opt-in only feature. You can enable this feature from the Cost Explorer Settings page. For information on how to access the Settings page, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ce-access.html">Controlling Access for Cost Explorer</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the GetCostAndUsageWithResources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSceGetCostAndUsageWithResourcesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorDataUnavailable`, `AWSceErrorLimitExceeded`, `AWSceErrorBillExpiration`, `AWSceErrorInvalidNextToken`, `AWSceErrorRequestChanged`.
 
 @see AWSceGetCostAndUsageWithResourcesRequest
 @see AWSceGetCostAndUsageWithResourcesResponse
 */
- (AWSTask<AWSceGetCostAndUsageWithResourcesResponse *> *)getCostAndUsageWithResources:(AWSceGetCostAndUsageWithResourcesRequest *)request;

/**
 <p>Retrieves cost and usage metrics with resources for your account. You can specify which cost and usage-related metric, such as <code>BlendedCosts</code> or <code>UsageQuantity</code>, that you want the request to return. You can also filter and group your data by various dimensions, such as <code>SERVICE</code> or <code>AZ</code>, in a specific time range. For a complete list of valid dimensions, see the <a href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_GetDimensionValues.html">GetDimensionValues</a> operation. Master accounts in an organization in AWS Organizations have access to all member accounts. This API is currently available for the Amazon Elastic Compute Cloud – Compute service only.</p><note><p>This is an opt-in only feature. You can enable this feature from the Cost Explorer Settings page. For information on how to access the Settings page, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ce-access.html">Controlling Access for Cost Explorer</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the GetCostAndUsageWithResources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorDataUnavailable`, `AWSceErrorLimitExceeded`, `AWSceErrorBillExpiration`, `AWSceErrorInvalidNextToken`, `AWSceErrorRequestChanged`.
 
 @see AWSceGetCostAndUsageWithResourcesRequest
 @see AWSceGetCostAndUsageWithResourcesResponse
 */
- (void)getCostAndUsageWithResources:(AWSceGetCostAndUsageWithResourcesRequest *)request completionHandler:(void (^ _Nullable)(AWSceGetCostAndUsageWithResourcesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a forecast for how much Amazon Web Services predicts that you will spend over the forecast time period that you select, based on your past costs. </p>
 
 @param request A container for the necessary parameters to execute the GetCostForecast service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSceGetCostForecastResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorDataUnavailable`.
 
 @see AWSceGetCostForecastRequest
 @see AWSceGetCostForecastResponse
 */
- (AWSTask<AWSceGetCostForecastResponse *> *)getCostForecast:(AWSceGetCostForecastRequest *)request;

/**
 <p>Retrieves a forecast for how much Amazon Web Services predicts that you will spend over the forecast time period that you select, based on your past costs. </p>
 
 @param request A container for the necessary parameters to execute the GetCostForecast service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorDataUnavailable`.
 
 @see AWSceGetCostForecastRequest
 @see AWSceGetCostForecastResponse
 */
- (void)getCostForecast:(AWSceGetCostForecastRequest *)request completionHandler:(void (^ _Nullable)(AWSceGetCostForecastResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves all available filter values for a specified filter over a period of time. You can search the dimension values for an arbitrary string. </p>
 
 @param request A container for the necessary parameters to execute the GetDimensionValues service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSceGetDimensionValuesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorBillExpiration`, `AWSceErrorDataUnavailable`, `AWSceErrorInvalidNextToken`, `AWSceErrorRequestChanged`.
 
 @see AWSceGetDimensionValuesRequest
 @see AWSceGetDimensionValuesResponse
 */
- (AWSTask<AWSceGetDimensionValuesResponse *> *)getDimensionValues:(AWSceGetDimensionValuesRequest *)request;

/**
 <p>Retrieves all available filter values for a specified filter over a period of time. You can search the dimension values for an arbitrary string. </p>
 
 @param request A container for the necessary parameters to execute the GetDimensionValues service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorBillExpiration`, `AWSceErrorDataUnavailable`, `AWSceErrorInvalidNextToken`, `AWSceErrorRequestChanged`.
 
 @see AWSceGetDimensionValuesRequest
 @see AWSceGetDimensionValuesResponse
 */
- (void)getDimensionValues:(AWSceGetDimensionValuesRequest *)request completionHandler:(void (^ _Nullable)(AWSceGetDimensionValuesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the reservation coverage for your account. This enables you to see how much of your Amazon Elastic Compute Cloud, Amazon ElastiCache, Amazon Relational Database Service, or Amazon Redshift usage is covered by a reservation. An organization's master account can see the coverage of the associated member accounts. This supports dimensions, Cost Categories, and nested expressions. For any time period, you can filter data about reservation usage by the following dimensions:</p><ul><li><p>AZ</p></li><li><p>CACHE_ENGINE</p></li><li><p>DATABASE_ENGINE</p></li><li><p>DEPLOYMENT_OPTION</p></li><li><p>INSTANCE_TYPE</p></li><li><p>LINKED_ACCOUNT</p></li><li><p>OPERATING_SYSTEM</p></li><li><p>PLATFORM</p></li><li><p>REGION</p></li><li><p>SERVICE</p></li><li><p>TAG</p></li><li><p>TENANCY</p></li></ul><p>To determine valid values for a dimension, use the <code>GetDimensionValues</code> operation. </p>
 
 @param request A container for the necessary parameters to execute the GetReservationCoverage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSceGetReservationCoverageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorDataUnavailable`, `AWSceErrorInvalidNextToken`.
 
 @see AWSceGetReservationCoverageRequest
 @see AWSceGetReservationCoverageResponse
 */
- (AWSTask<AWSceGetReservationCoverageResponse *> *)getReservationCoverage:(AWSceGetReservationCoverageRequest *)request;

/**
 <p>Retrieves the reservation coverage for your account. This enables you to see how much of your Amazon Elastic Compute Cloud, Amazon ElastiCache, Amazon Relational Database Service, or Amazon Redshift usage is covered by a reservation. An organization's master account can see the coverage of the associated member accounts. This supports dimensions, Cost Categories, and nested expressions. For any time period, you can filter data about reservation usage by the following dimensions:</p><ul><li><p>AZ</p></li><li><p>CACHE_ENGINE</p></li><li><p>DATABASE_ENGINE</p></li><li><p>DEPLOYMENT_OPTION</p></li><li><p>INSTANCE_TYPE</p></li><li><p>LINKED_ACCOUNT</p></li><li><p>OPERATING_SYSTEM</p></li><li><p>PLATFORM</p></li><li><p>REGION</p></li><li><p>SERVICE</p></li><li><p>TAG</p></li><li><p>TENANCY</p></li></ul><p>To determine valid values for a dimension, use the <code>GetDimensionValues</code> operation. </p>
 
 @param request A container for the necessary parameters to execute the GetReservationCoverage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorDataUnavailable`, `AWSceErrorInvalidNextToken`.
 
 @see AWSceGetReservationCoverageRequest
 @see AWSceGetReservationCoverageResponse
 */
- (void)getReservationCoverage:(AWSceGetReservationCoverageRequest *)request completionHandler:(void (^ _Nullable)(AWSceGetReservationCoverageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets recommendations for which reservations to purchase. These recommendations could help you reduce your costs. Reservations provide a discounted hourly rate (up to 75%) compared to On-Demand pricing.</p><p>AWS generates your recommendations by identifying your On-Demand usage during a specific time period and collecting your usage into categories that are eligible for a reservation. After AWS has these categories, it simulates every combination of reservations in each category of usage to identify the best number of each type of RI to purchase to maximize your estimated savings. </p><p>For example, AWS automatically aggregates your Amazon EC2 Linux, shared tenancy, and c4 family usage in the US West (Oregon) Region and recommends that you buy size-flexible regional reservations to apply to the c4 family usage. AWS recommends the smallest size instance in an instance family. This makes it easier to purchase a size-flexible RI. AWS also shows the equal number of normalized units so that you can purchase any instance size that you want. For this example, your RI recommendation would be for <code>c4.large</code> because that is the smallest size instance in the c4 instance family.</p>
 
 @param request A container for the necessary parameters to execute the GetReservationPurchaseRecommendation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSceGetReservationPurchaseRecommendationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorDataUnavailable`, `AWSceErrorInvalidNextToken`.
 
 @see AWSceGetReservationPurchaseRecommendationRequest
 @see AWSceGetReservationPurchaseRecommendationResponse
 */
- (AWSTask<AWSceGetReservationPurchaseRecommendationResponse *> *)getReservationPurchaseRecommendation:(AWSceGetReservationPurchaseRecommendationRequest *)request;

/**
 <p>Gets recommendations for which reservations to purchase. These recommendations could help you reduce your costs. Reservations provide a discounted hourly rate (up to 75%) compared to On-Demand pricing.</p><p>AWS generates your recommendations by identifying your On-Demand usage during a specific time period and collecting your usage into categories that are eligible for a reservation. After AWS has these categories, it simulates every combination of reservations in each category of usage to identify the best number of each type of RI to purchase to maximize your estimated savings. </p><p>For example, AWS automatically aggregates your Amazon EC2 Linux, shared tenancy, and c4 family usage in the US West (Oregon) Region and recommends that you buy size-flexible regional reservations to apply to the c4 family usage. AWS recommends the smallest size instance in an instance family. This makes it easier to purchase a size-flexible RI. AWS also shows the equal number of normalized units so that you can purchase any instance size that you want. For this example, your RI recommendation would be for <code>c4.large</code> because that is the smallest size instance in the c4 instance family.</p>
 
 @param request A container for the necessary parameters to execute the GetReservationPurchaseRecommendation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorDataUnavailable`, `AWSceErrorInvalidNextToken`.
 
 @see AWSceGetReservationPurchaseRecommendationRequest
 @see AWSceGetReservationPurchaseRecommendationResponse
 */
- (void)getReservationPurchaseRecommendation:(AWSceGetReservationPurchaseRecommendationRequest *)request completionHandler:(void (^ _Nullable)(AWSceGetReservationPurchaseRecommendationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the reservation utilization for your account. Master accounts in an organization have access to member accounts. You can filter data by dimensions in a time period. You can use <code>GetDimensionValues</code> to determine the possible dimension values. Currently, you can group only by <code>SUBSCRIPTION_ID</code>. </p>
 
 @param request A container for the necessary parameters to execute the GetReservationUtilization service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSceGetReservationUtilizationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorDataUnavailable`, `AWSceErrorInvalidNextToken`.
 
 @see AWSceGetReservationUtilizationRequest
 @see AWSceGetReservationUtilizationResponse
 */
- (AWSTask<AWSceGetReservationUtilizationResponse *> *)getReservationUtilization:(AWSceGetReservationUtilizationRequest *)request;

/**
 <p>Retrieves the reservation utilization for your account. Master accounts in an organization have access to member accounts. You can filter data by dimensions in a time period. You can use <code>GetDimensionValues</code> to determine the possible dimension values. Currently, you can group only by <code>SUBSCRIPTION_ID</code>. </p>
 
 @param request A container for the necessary parameters to execute the GetReservationUtilization service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorDataUnavailable`, `AWSceErrorInvalidNextToken`.
 
 @see AWSceGetReservationUtilizationRequest
 @see AWSceGetReservationUtilizationResponse
 */
- (void)getReservationUtilization:(AWSceGetReservationUtilizationRequest *)request completionHandler:(void (^ _Nullable)(AWSceGetReservationUtilizationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates recommendations that helps you save cost by identifying idle and underutilized Amazon EC2 instances.</p><p>Recommendations are generated to either downsize or terminate instances, along with providing savings detail and metrics. For details on calculation and function, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ce-what-is.html">Optimizing Your Cost with Rightsizing Recommendations</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetRightsizingRecommendation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSceGetRightsizingRecommendationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorInvalidNextToken`.
 
 @see AWSceGetRightsizingRecommendationRequest
 @see AWSceGetRightsizingRecommendationResponse
 */
- (AWSTask<AWSceGetRightsizingRecommendationResponse *> *)getRightsizingRecommendation:(AWSceGetRightsizingRecommendationRequest *)request;

/**
 <p>Creates recommendations that helps you save cost by identifying idle and underutilized Amazon EC2 instances.</p><p>Recommendations are generated to either downsize or terminate instances, along with providing savings detail and metrics. For details on calculation and function, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ce-what-is.html">Optimizing Your Cost with Rightsizing Recommendations</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetRightsizingRecommendation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorInvalidNextToken`.
 
 @see AWSceGetRightsizingRecommendationRequest
 @see AWSceGetRightsizingRecommendationResponse
 */
- (void)getRightsizingRecommendation:(AWSceGetRightsizingRecommendationRequest *)request completionHandler:(void (^ _Nullable)(AWSceGetRightsizingRecommendationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the Savings Plans covered for your account. This enables you to see how much of your cost is covered by a Savings Plan. An organization’s master account can see the coverage of the associated member accounts. This supports dimensions, Cost Categories, and nested expressions. For any time period, you can filter data for Savings Plans usage with the following dimensions:</p><ul><li><p><code>LINKED_ACCOUNT</code></p></li><li><p><code>REGION</code></p></li><li><p><code>SERVICE</code></p></li><li><p><code>INSTANCE_FAMILY</code></p></li></ul><p>To determine valid values for a dimension, use the <code>GetDimensionValues</code> operation.</p>
 
 @param request A container for the necessary parameters to execute the GetSavingsPlansCoverage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSceGetSavingsPlansCoverageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorDataUnavailable`, `AWSceErrorInvalidNextToken`.
 
 @see AWSceGetSavingsPlansCoverageRequest
 @see AWSceGetSavingsPlansCoverageResponse
 */
- (AWSTask<AWSceGetSavingsPlansCoverageResponse *> *)getSavingsPlansCoverage:(AWSceGetSavingsPlansCoverageRequest *)request;

/**
 <p>Retrieves the Savings Plans covered for your account. This enables you to see how much of your cost is covered by a Savings Plan. An organization’s master account can see the coverage of the associated member accounts. This supports dimensions, Cost Categories, and nested expressions. For any time period, you can filter data for Savings Plans usage with the following dimensions:</p><ul><li><p><code>LINKED_ACCOUNT</code></p></li><li><p><code>REGION</code></p></li><li><p><code>SERVICE</code></p></li><li><p><code>INSTANCE_FAMILY</code></p></li></ul><p>To determine valid values for a dimension, use the <code>GetDimensionValues</code> operation.</p>
 
 @param request A container for the necessary parameters to execute the GetSavingsPlansCoverage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorDataUnavailable`, `AWSceErrorInvalidNextToken`.
 
 @see AWSceGetSavingsPlansCoverageRequest
 @see AWSceGetSavingsPlansCoverageResponse
 */
- (void)getSavingsPlansCoverage:(AWSceGetSavingsPlansCoverageRequest *)request completionHandler:(void (^ _Nullable)(AWSceGetSavingsPlansCoverageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves your request parameters, Savings Plan Recommendations Summary and Details. </p>
 
 @param request A container for the necessary parameters to execute the GetSavingsPlansPurchaseRecommendation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSceGetSavingsPlansPurchaseRecommendationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorInvalidNextToken`.
 
 @see AWSceGetSavingsPlansPurchaseRecommendationRequest
 @see AWSceGetSavingsPlansPurchaseRecommendationResponse
 */
- (AWSTask<AWSceGetSavingsPlansPurchaseRecommendationResponse *> *)getSavingsPlansPurchaseRecommendation:(AWSceGetSavingsPlansPurchaseRecommendationRequest *)request;

/**
 <p>Retrieves your request parameters, Savings Plan Recommendations Summary and Details. </p>
 
 @param request A container for the necessary parameters to execute the GetSavingsPlansPurchaseRecommendation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorInvalidNextToken`.
 
 @see AWSceGetSavingsPlansPurchaseRecommendationRequest
 @see AWSceGetSavingsPlansPurchaseRecommendationResponse
 */
- (void)getSavingsPlansPurchaseRecommendation:(AWSceGetSavingsPlansPurchaseRecommendationRequest *)request completionHandler:(void (^ _Nullable)(AWSceGetSavingsPlansPurchaseRecommendationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the Savings Plans utilization for your account across date ranges with daily or monthly granularity. Master accounts in an organization have access to member accounts. You can use <code>GetDimensionValues</code> in <code>SAVINGS_PLANS</code> to determine the possible dimension values.</p><note><p>You cannot group by any dimension values for <code>GetSavingsPlansUtilization</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the GetSavingsPlansUtilization service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSceGetSavingsPlansUtilizationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorDataUnavailable`.
 
 @see AWSceGetSavingsPlansUtilizationRequest
 @see AWSceGetSavingsPlansUtilizationResponse
 */
- (AWSTask<AWSceGetSavingsPlansUtilizationResponse *> *)getSavingsPlansUtilization:(AWSceGetSavingsPlansUtilizationRequest *)request;

/**
 <p>Retrieves the Savings Plans utilization for your account across date ranges with daily or monthly granularity. Master accounts in an organization have access to member accounts. You can use <code>GetDimensionValues</code> in <code>SAVINGS_PLANS</code> to determine the possible dimension values.</p><note><p>You cannot group by any dimension values for <code>GetSavingsPlansUtilization</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the GetSavingsPlansUtilization service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorDataUnavailable`.
 
 @see AWSceGetSavingsPlansUtilizationRequest
 @see AWSceGetSavingsPlansUtilizationResponse
 */
- (void)getSavingsPlansUtilization:(AWSceGetSavingsPlansUtilizationRequest *)request completionHandler:(void (^ _Nullable)(AWSceGetSavingsPlansUtilizationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves attribute data along with aggregate utilization and savings data for a given time period. This doesn't support granular or grouped data (daily/monthly) in response. You can't retrieve data by dates in a single response similar to <code>GetSavingsPlanUtilization</code>, but you have the option to make multiple calls to <code>GetSavingsPlanUtilizationDetails</code> by providing individual dates. You can use <code>GetDimensionValues</code> in <code>SAVINGS_PLANS</code> to determine the possible dimension values.</p><note><p><code>GetSavingsPlanUtilizationDetails</code> internally groups data by <code>SavingsPlansArn</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the GetSavingsPlansUtilizationDetails service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSceGetSavingsPlansUtilizationDetailsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorDataUnavailable`, `AWSceErrorInvalidNextToken`.
 
 @see AWSceGetSavingsPlansUtilizationDetailsRequest
 @see AWSceGetSavingsPlansUtilizationDetailsResponse
 */
- (AWSTask<AWSceGetSavingsPlansUtilizationDetailsResponse *> *)getSavingsPlansUtilizationDetails:(AWSceGetSavingsPlansUtilizationDetailsRequest *)request;

/**
 <p>Retrieves attribute data along with aggregate utilization and savings data for a given time period. This doesn't support granular or grouped data (daily/monthly) in response. You can't retrieve data by dates in a single response similar to <code>GetSavingsPlanUtilization</code>, but you have the option to make multiple calls to <code>GetSavingsPlanUtilizationDetails</code> by providing individual dates. You can use <code>GetDimensionValues</code> in <code>SAVINGS_PLANS</code> to determine the possible dimension values.</p><note><p><code>GetSavingsPlanUtilizationDetails</code> internally groups data by <code>SavingsPlansArn</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the GetSavingsPlansUtilizationDetails service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorDataUnavailable`, `AWSceErrorInvalidNextToken`.
 
 @see AWSceGetSavingsPlansUtilizationDetailsRequest
 @see AWSceGetSavingsPlansUtilizationDetailsResponse
 */
- (void)getSavingsPlansUtilizationDetails:(AWSceGetSavingsPlansUtilizationDetailsRequest *)request completionHandler:(void (^ _Nullable)(AWSceGetSavingsPlansUtilizationDetailsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Queries for available tag keys and tag values for a specified period. You can search the tag values for an arbitrary string. </p>
 
 @param request A container for the necessary parameters to execute the GetTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSceGetTagsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorBillExpiration`, `AWSceErrorDataUnavailable`, `AWSceErrorInvalidNextToken`, `AWSceErrorRequestChanged`.
 
 @see AWSceGetTagsRequest
 @see AWSceGetTagsResponse
 */
- (AWSTask<AWSceGetTagsResponse *> *)getTags:(AWSceGetTagsRequest *)request;

/**
 <p>Queries for available tag keys and tag values for a specified period. You can search the tag values for an arbitrary string. </p>
 
 @param request A container for the necessary parameters to execute the GetTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorBillExpiration`, `AWSceErrorDataUnavailable`, `AWSceErrorInvalidNextToken`, `AWSceErrorRequestChanged`.
 
 @see AWSceGetTagsRequest
 @see AWSceGetTagsResponse
 */
- (void)getTags:(AWSceGetTagsRequest *)request completionHandler:(void (^ _Nullable)(AWSceGetTagsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a forecast for how much Amazon Web Services predicts that you will use over the forecast time period that you select, based on your past usage. </p>
 
 @param request A container for the necessary parameters to execute the GetUsageForecast service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSceGetUsageForecastResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorDataUnavailable`, `AWSceErrorUnresolvableUsageUnit`.
 
 @see AWSceGetUsageForecastRequest
 @see AWSceGetUsageForecastResponse
 */
- (AWSTask<AWSceGetUsageForecastResponse *> *)getUsageForecast:(AWSceGetUsageForecastRequest *)request;

/**
 <p>Retrieves a forecast for how much Amazon Web Services predicts that you will use over the forecast time period that you select, based on your past usage. </p>
 
 @param request A container for the necessary parameters to execute the GetUsageForecast service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`, `AWSceErrorDataUnavailable`, `AWSceErrorUnresolvableUsageUnit`.
 
 @see AWSceGetUsageForecastRequest
 @see AWSceGetUsageForecastResponse
 */
- (void)getUsageForecast:(AWSceGetUsageForecastRequest *)request completionHandler:(void (^ _Nullable)(AWSceGetUsageForecastResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the name, ARN, <code>NumberOfRules</code> and effective dates of all Cost Categories defined in the account. You have the option to use <code>EffectiveOn</code> to return a list of Cost Categories that were active on a specific date. If there is no <code>EffectiveOn</code> specified, you’ll see Cost Categories that are effective on the current date. If Cost Category is still effective, <code>EffectiveEnd</code> is omitted in the response. <code>ListCostCategoryDefinitions</code> supports pagination. The request can have a <code>MaxResults</code> range up to 100.</p>
 
 @param request A container for the necessary parameters to execute the ListCostCategoryDefinitions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSceListCostCategoryDefinitionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`.
 
 @see AWSceListCostCategoryDefinitionsRequest
 @see AWSceListCostCategoryDefinitionsResponse
 */
- (AWSTask<AWSceListCostCategoryDefinitionsResponse *> *)listCostCategoryDefinitions:(AWSceListCostCategoryDefinitionsRequest *)request;

/**
 <p>Returns the name, ARN, <code>NumberOfRules</code> and effective dates of all Cost Categories defined in the account. You have the option to use <code>EffectiveOn</code> to return a list of Cost Categories that were active on a specific date. If there is no <code>EffectiveOn</code> specified, you’ll see Cost Categories that are effective on the current date. If Cost Category is still effective, <code>EffectiveEnd</code> is omitted in the response. <code>ListCostCategoryDefinitions</code> supports pagination. The request can have a <code>MaxResults</code> range up to 100.</p>
 
 @param request A container for the necessary parameters to execute the ListCostCategoryDefinitions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorLimitExceeded`.
 
 @see AWSceListCostCategoryDefinitionsRequest
 @see AWSceListCostCategoryDefinitionsResponse
 */
- (void)listCostCategoryDefinitions:(AWSceListCostCategoryDefinitionsRequest *)request completionHandler:(void (^ _Nullable)(AWSceListCostCategoryDefinitionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing Cost Category. Changes made to the Cost Category rules will be used to categorize the current month’s expenses and future expenses. This won’t change categorization for the previous months.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCostCategoryDefinition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSceUpdateCostCategoryDefinitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorResourceNotFound`, `AWSceErrorServiceQuotaExceeded`, `AWSceErrorLimitExceeded`.
 
 @see AWSceUpdateCostCategoryDefinitionRequest
 @see AWSceUpdateCostCategoryDefinitionResponse
 */
- (AWSTask<AWSceUpdateCostCategoryDefinitionResponse *> *)updateCostCategoryDefinition:(AWSceUpdateCostCategoryDefinitionRequest *)request;

/**
 <p>Updates an existing Cost Category. Changes made to the Cost Category rules will be used to categorize the current month’s expenses and future expenses. This won’t change categorization for the previous months.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCostCategoryDefinition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSceErrorDomain` domain and the following error code: `AWSceErrorResourceNotFound`, `AWSceErrorServiceQuotaExceeded`, `AWSceErrorLimitExceeded`.
 
 @see AWSceUpdateCostCategoryDefinitionRequest
 @see AWSceUpdateCostCategoryDefinitionResponse
 */
- (void)updateCostCategoryDefinition:(AWSceUpdateCostCategoryDefinitionRequest *)request completionHandler:(void (^ _Nullable)(AWSceUpdateCostCategoryDefinitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
