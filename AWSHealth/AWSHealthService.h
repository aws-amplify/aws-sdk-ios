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
#import "AWSHealthModel.h"
#import "AWSHealthResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSHealth
FOUNDATION_EXPORT NSString *const AWSHealthSDKVersion;

/**
 <fullname>AWS Health</fullname><p>The AWS Health API provides programmatic access to the AWS Health information that is presented in the <a href="https://phd.aws.amazon.com/phd/home#/">AWS Personal Health Dashboard</a>. You can get information about events that affect your AWS resources:</p><ul><li><p><a>DescribeEvents</a>: Summary information about events.</p></li><li><p><a>DescribeEventDetails</a>: Detailed information about one or more events.</p></li><li><p><a>DescribeAffectedEntities</a>: Information about AWS resources that are affected by one or more events.</p></li></ul><p>In addition, these operations provide information about event types and summary counts of events or affected entities:</p><ul><li><p><a>DescribeEventTypes</a>: Information about the kinds of events that AWS Health tracks.</p></li><li><p><a>DescribeEventAggregates</a>: A count of the number of events that meet specified criteria.</p></li><li><p><a>DescribeEntityAggregates</a>: A count of the number of affected entities that meet specified criteria.</p></li></ul><p>AWS Health integrates with AWS Organizations to provide a centralized view of AWS Health events across all accounts in your organization.</p><ul><li><p><a>DescribeEventsForOrganization</a>: Summary information about events across the organization.</p></li><li><p><a>DescribeAffectedAccountsForOrganization</a>: List of accounts in your organization impacted by an event.</p></li><li><p><a>DescribeEventDetailsForOrganization</a>: Detailed information about events in your organization.</p></li><li><p><a>DescribeAffectedEntitiesForOrganization</a>: Information about AWS resources in your organization that are affected by events.</p></li></ul><p>You can use the following operations to enable or disable AWS Health from working with AWS Organizations.</p><ul><li><p><a>EnableHealthServiceAccessForOrganization</a>: Enables AWS Health to work with AWS Organizations.</p></li><li><p><a>DisableHealthServiceAccessForOrganization</a>: Disables AWS Health from working with AWS Organizations.</p></li><li><p><a>DescribeHealthServiceStatusForOrganization</a>: Status information about enabling or disabling AWS Health from working with AWS Organizations.</p></li></ul><p>The Health API requires a Business or Enterprise support plan from <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>. Calling the Health API from an account that does not have a Business or Enterprise support plan causes a <code>SubscriptionRequiredException</code>.</p><p>For authentication of requests, AWS Health uses the <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 Signing Process</a>.</p><p>See the <a href="https://docs.aws.amazon.com/health/latest/ug/what-is-aws-health.html">AWS Health User Guide</a> for information about how to use the API.</p><p><b>Service Endpoint</b></p><p>The HTTP endpoint for the AWS Health API is:</p><ul><li><p>https://health.us-east-1.amazonaws.com </p></li></ul>
 */
@interface AWSHealth : AWSService

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

     let Health = AWSHealth.default()

 *Objective-C*

     AWSHealth *Health = [AWSHealth defaultHealth];

 @return The default service client.
 */
+ (instancetype)defaultHealth;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSHealth.register(with: configuration!, forKey: "USWest2Health")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSHealth registerHealthWithConfiguration:configuration forKey:@"USWest2Health"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Health = AWSHealth(forKey: "USWest2Health")

 *Objective-C*

     AWSHealth *Health = [AWSHealth HealthForKey:@"USWest2Health"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerHealthWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerHealthWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSHealth.register(with: configuration!, forKey: "USWest2Health")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSHealth registerHealthWithConfiguration:configuration forKey:@"USWest2Health"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Health = AWSHealth(forKey: "USWest2Health")

 *Objective-C*

     AWSHealth *Health = [AWSHealth HealthForKey:@"USWest2Health"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)HealthForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeHealthForKey:(NSString *)key;

/**
 <p>Returns a list of accounts in the organization from AWS Organizations that are affected by the provided event.</p><p>Before you can call this operation, you must first enable AWS Health to work with AWS Organizations. To do this, call the <a>EnableHealthServiceAccessForOrganization</a> operation from your organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAffectedAccountsForOrganization service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSHealthDescribeAffectedAccountsForOrganizationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSHealthErrorDomain` domain and the following error code: `AWSHealthErrorInvalidPaginationToken`.
 
 @see AWSHealthDescribeAffectedAccountsForOrganizationRequest
 @see AWSHealthDescribeAffectedAccountsForOrganizationResponse
 */
- (AWSTask<AWSHealthDescribeAffectedAccountsForOrganizationResponse *> *)describeAffectedAccountsForOrganization:(AWSHealthDescribeAffectedAccountsForOrganizationRequest *)request;

/**
 <p>Returns a list of accounts in the organization from AWS Organizations that are affected by the provided event.</p><p>Before you can call this operation, you must first enable AWS Health to work with AWS Organizations. To do this, call the <a>EnableHealthServiceAccessForOrganization</a> operation from your organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAffectedAccountsForOrganization service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSHealthErrorDomain` domain and the following error code: `AWSHealthErrorInvalidPaginationToken`.
 
 @see AWSHealthDescribeAffectedAccountsForOrganizationRequest
 @see AWSHealthDescribeAffectedAccountsForOrganizationResponse
 */
- (void)describeAffectedAccountsForOrganization:(AWSHealthDescribeAffectedAccountsForOrganizationRequest *)request completionHandler:(void (^ _Nullable)(AWSHealthDescribeAffectedAccountsForOrganizationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of entities that have been affected by the specified events, based on the specified filter criteria. Entities can refer to individual customer resources, groups of customer resources, or any other construct, depending on the AWS service. Events that have impact beyond that of the affected entities, or where the extent of impact is unknown, include at least one entity indicating this.</p><p>At least one event ARN is required. Results are sorted by the <code>lastUpdatedTime</code> of the entity, starting with the most recent.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAffectedEntities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSHealthDescribeAffectedEntitiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSHealthErrorDomain` domain and the following error code: `AWSHealthErrorInvalidPaginationToken`, `AWSHealthErrorUnsupportedLocale`.
 
 @see AWSHealthDescribeAffectedEntitiesRequest
 @see AWSHealthDescribeAffectedEntitiesResponse
 */
- (AWSTask<AWSHealthDescribeAffectedEntitiesResponse *> *)describeAffectedEntities:(AWSHealthDescribeAffectedEntitiesRequest *)request;

/**
 <p>Returns a list of entities that have been affected by the specified events, based on the specified filter criteria. Entities can refer to individual customer resources, groups of customer resources, or any other construct, depending on the AWS service. Events that have impact beyond that of the affected entities, or where the extent of impact is unknown, include at least one entity indicating this.</p><p>At least one event ARN is required. Results are sorted by the <code>lastUpdatedTime</code> of the entity, starting with the most recent.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAffectedEntities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSHealthErrorDomain` domain and the following error code: `AWSHealthErrorInvalidPaginationToken`, `AWSHealthErrorUnsupportedLocale`.
 
 @see AWSHealthDescribeAffectedEntitiesRequest
 @see AWSHealthDescribeAffectedEntitiesResponse
 */
- (void)describeAffectedEntities:(AWSHealthDescribeAffectedEntitiesRequest *)request completionHandler:(void (^ _Nullable)(AWSHealthDescribeAffectedEntitiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of entities that have been affected by one or more events for one or more accounts in your organization in AWS Organizations, based on the filter criteria. Entities can refer to individual customer resources, groups of customer resources, or any other construct, depending on the AWS service.</p><p>At least one event ARN and account ID are required. Results are sorted by the <code>lastUpdatedTime</code> of the entity, starting with the most recent.</p><p>Before you can call this operation, you must first enable AWS Health to work with AWS Organizations. To do this, call the <a>EnableHealthServiceAccessForOrganization</a> operation from your organization's master account. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAffectedEntitiesForOrganization service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSHealthDescribeAffectedEntitiesForOrganizationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSHealthErrorDomain` domain and the following error code: `AWSHealthErrorInvalidPaginationToken`, `AWSHealthErrorUnsupportedLocale`.
 
 @see AWSHealthDescribeAffectedEntitiesForOrganizationRequest
 @see AWSHealthDescribeAffectedEntitiesForOrganizationResponse
 */
- (AWSTask<AWSHealthDescribeAffectedEntitiesForOrganizationResponse *> *)describeAffectedEntitiesForOrganization:(AWSHealthDescribeAffectedEntitiesForOrganizationRequest *)request;

/**
 <p>Returns a list of entities that have been affected by one or more events for one or more accounts in your organization in AWS Organizations, based on the filter criteria. Entities can refer to individual customer resources, groups of customer resources, or any other construct, depending on the AWS service.</p><p>At least one event ARN and account ID are required. Results are sorted by the <code>lastUpdatedTime</code> of the entity, starting with the most recent.</p><p>Before you can call this operation, you must first enable AWS Health to work with AWS Organizations. To do this, call the <a>EnableHealthServiceAccessForOrganization</a> operation from your organization's master account. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAffectedEntitiesForOrganization service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSHealthErrorDomain` domain and the following error code: `AWSHealthErrorInvalidPaginationToken`, `AWSHealthErrorUnsupportedLocale`.
 
 @see AWSHealthDescribeAffectedEntitiesForOrganizationRequest
 @see AWSHealthDescribeAffectedEntitiesForOrganizationResponse
 */
- (void)describeAffectedEntitiesForOrganization:(AWSHealthDescribeAffectedEntitiesForOrganizationRequest *)request completionHandler:(void (^ _Nullable)(AWSHealthDescribeAffectedEntitiesForOrganizationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the number of entities that are affected by each of the specified events. If no events are specified, the counts of all affected entities are returned.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEntityAggregates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSHealthDescribeEntityAggregatesResponse`.
 
 @see AWSHealthDescribeEntityAggregatesRequest
 @see AWSHealthDescribeEntityAggregatesResponse
 */
- (AWSTask<AWSHealthDescribeEntityAggregatesResponse *> *)describeEntityAggregates:(AWSHealthDescribeEntityAggregatesRequest *)request;

/**
 <p>Returns the number of entities that are affected by each of the specified events. If no events are specified, the counts of all affected entities are returned.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEntityAggregates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSHealthDescribeEntityAggregatesRequest
 @see AWSHealthDescribeEntityAggregatesResponse
 */
- (void)describeEntityAggregates:(AWSHealthDescribeEntityAggregatesRequest *)request completionHandler:(void (^ _Nullable)(AWSHealthDescribeEntityAggregatesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the number of events of each event type (issue, scheduled change, and account notification). If no filter is specified, the counts of all events in each category are returned.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEventAggregates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSHealthDescribeEventAggregatesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSHealthErrorDomain` domain and the following error code: `AWSHealthErrorInvalidPaginationToken`.
 
 @see AWSHealthDescribeEventAggregatesRequest
 @see AWSHealthDescribeEventAggregatesResponse
 */
- (AWSTask<AWSHealthDescribeEventAggregatesResponse *> *)describeEventAggregates:(AWSHealthDescribeEventAggregatesRequest *)request;

/**
 <p>Returns the number of events of each event type (issue, scheduled change, and account notification). If no filter is specified, the counts of all events in each category are returned.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEventAggregates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSHealthErrorDomain` domain and the following error code: `AWSHealthErrorInvalidPaginationToken`.
 
 @see AWSHealthDescribeEventAggregatesRequest
 @see AWSHealthDescribeEventAggregatesResponse
 */
- (void)describeEventAggregates:(AWSHealthDescribeEventAggregatesRequest *)request completionHandler:(void (^ _Nullable)(AWSHealthDescribeEventAggregatesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns detailed information about one or more specified events. Information includes standard event data (region, service, and so on, as returned by <a>DescribeEvents</a>), a detailed event description, and possible additional metadata that depends upon the nature of the event. Affected entities are not included; to retrieve those, use the <a>DescribeAffectedEntities</a> operation.</p><p>If a specified event cannot be retrieved, an error message is returned for that event.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEventDetails service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSHealthDescribeEventDetailsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSHealthErrorDomain` domain and the following error code: `AWSHealthErrorUnsupportedLocale`.
 
 @see AWSHealthDescribeEventDetailsRequest
 @see AWSHealthDescribeEventDetailsResponse
 */
- (AWSTask<AWSHealthDescribeEventDetailsResponse *> *)describeEventDetails:(AWSHealthDescribeEventDetailsRequest *)request;

/**
 <p>Returns detailed information about one or more specified events. Information includes standard event data (region, service, and so on, as returned by <a>DescribeEvents</a>), a detailed event description, and possible additional metadata that depends upon the nature of the event. Affected entities are not included; to retrieve those, use the <a>DescribeAffectedEntities</a> operation.</p><p>If a specified event cannot be retrieved, an error message is returned for that event.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEventDetails service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSHealthErrorDomain` domain and the following error code: `AWSHealthErrorUnsupportedLocale`.
 
 @see AWSHealthDescribeEventDetailsRequest
 @see AWSHealthDescribeEventDetailsResponse
 */
- (void)describeEventDetails:(AWSHealthDescribeEventDetailsRequest *)request completionHandler:(void (^ _Nullable)(AWSHealthDescribeEventDetailsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns detailed information about one or more specified events for one or more accounts in your organization. Information includes standard event data (Region, service, and so on, as returned by <a>DescribeEventsForOrganization</a>, a detailed event description, and possible additional metadata that depends upon the nature of the event. Affected entities are not included; to retrieve those, use the <a>DescribeAffectedEntitiesForOrganization</a> operation.</p><p>Before you can call this operation, you must first enable AWS Health to work with AWS Organizations. To do this, call the <a>EnableHealthServiceAccessForOrganization</a> operation from your organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEventDetailsForOrganization service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSHealthDescribeEventDetailsForOrganizationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSHealthErrorDomain` domain and the following error code: `AWSHealthErrorUnsupportedLocale`.
 
 @see AWSHealthDescribeEventDetailsForOrganizationRequest
 @see AWSHealthDescribeEventDetailsForOrganizationResponse
 */
- (AWSTask<AWSHealthDescribeEventDetailsForOrganizationResponse *> *)describeEventDetailsForOrganization:(AWSHealthDescribeEventDetailsForOrganizationRequest *)request;

/**
 <p>Returns detailed information about one or more specified events for one or more accounts in your organization. Information includes standard event data (Region, service, and so on, as returned by <a>DescribeEventsForOrganization</a>, a detailed event description, and possible additional metadata that depends upon the nature of the event. Affected entities are not included; to retrieve those, use the <a>DescribeAffectedEntitiesForOrganization</a> operation.</p><p>Before you can call this operation, you must first enable AWS Health to work with AWS Organizations. To do this, call the <a>EnableHealthServiceAccessForOrganization</a> operation from your organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEventDetailsForOrganization service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSHealthErrorDomain` domain and the following error code: `AWSHealthErrorUnsupportedLocale`.
 
 @see AWSHealthDescribeEventDetailsForOrganizationRequest
 @see AWSHealthDescribeEventDetailsForOrganizationResponse
 */
- (void)describeEventDetailsForOrganization:(AWSHealthDescribeEventDetailsForOrganizationRequest *)request completionHandler:(void (^ _Nullable)(AWSHealthDescribeEventDetailsForOrganizationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the event types that meet the specified filter criteria. If no filter criteria are specified, all event types are returned, in no particular order.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEventTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSHealthDescribeEventTypesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSHealthErrorDomain` domain and the following error code: `AWSHealthErrorInvalidPaginationToken`, `AWSHealthErrorUnsupportedLocale`.
 
 @see AWSHealthDescribeEventTypesRequest
 @see AWSHealthDescribeEventTypesResponse
 */
- (AWSTask<AWSHealthDescribeEventTypesResponse *> *)describeEventTypes:(AWSHealthDescribeEventTypesRequest *)request;

/**
 <p>Returns the event types that meet the specified filter criteria. If no filter criteria are specified, all event types are returned, in no particular order.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEventTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSHealthErrorDomain` domain and the following error code: `AWSHealthErrorInvalidPaginationToken`, `AWSHealthErrorUnsupportedLocale`.
 
 @see AWSHealthDescribeEventTypesRequest
 @see AWSHealthDescribeEventTypesResponse
 */
- (void)describeEventTypes:(AWSHealthDescribeEventTypesRequest *)request completionHandler:(void (^ _Nullable)(AWSHealthDescribeEventTypesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about events that meet the specified filter criteria. Events are returned in a summary form and do not include the detailed description, any additional metadata that depends on the event type, or any affected resources. To retrieve that information, use the <a>DescribeEventDetails</a> and <a>DescribeAffectedEntities</a> operations.</p><p>If no filter criteria are specified, all events are returned. Results are sorted by <code>lastModifiedTime</code>, starting with the most recent.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSHealthDescribeEventsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSHealthErrorDomain` domain and the following error code: `AWSHealthErrorInvalidPaginationToken`, `AWSHealthErrorUnsupportedLocale`.
 
 @see AWSHealthDescribeEventsRequest
 @see AWSHealthDescribeEventsResponse
 */
- (AWSTask<AWSHealthDescribeEventsResponse *> *)describeEvents:(AWSHealthDescribeEventsRequest *)request;

/**
 <p>Returns information about events that meet the specified filter criteria. Events are returned in a summary form and do not include the detailed description, any additional metadata that depends on the event type, or any affected resources. To retrieve that information, use the <a>DescribeEventDetails</a> and <a>DescribeAffectedEntities</a> operations.</p><p>If no filter criteria are specified, all events are returned. Results are sorted by <code>lastModifiedTime</code>, starting with the most recent.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSHealthErrorDomain` domain and the following error code: `AWSHealthErrorInvalidPaginationToken`, `AWSHealthErrorUnsupportedLocale`.
 
 @see AWSHealthDescribeEventsRequest
 @see AWSHealthDescribeEventsResponse
 */
- (void)describeEvents:(AWSHealthDescribeEventsRequest *)request completionHandler:(void (^ _Nullable)(AWSHealthDescribeEventsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about events across your organization in AWS Organizations, meeting the specified filter criteria. Events are returned in a summary form and do not include the accounts impacted, detailed description, any additional metadata that depends on the event type, or any affected resources. To retrieve that information, use the <a>DescribeAffectedAccountsForOrganization</a>, <a>DescribeEventDetailsForOrganization</a>, and <a>DescribeAffectedEntitiesForOrganization</a> operations.</p><p>If no filter criteria are specified, all events across your organization are returned. Results are sorted by <code>lastModifiedTime</code>, starting with the most recent.</p><p>Before you can call this operation, you must first enable Health to work with AWS Organizations. To do this, call the <a>EnableHealthServiceAccessForOrganization</a> operation from your organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEventsForOrganization service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSHealthDescribeEventsForOrganizationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSHealthErrorDomain` domain and the following error code: `AWSHealthErrorInvalidPaginationToken`, `AWSHealthErrorUnsupportedLocale`.
 
 @see AWSHealthDescribeEventsForOrganizationRequest
 @see AWSHealthDescribeEventsForOrganizationResponse
 */
- (AWSTask<AWSHealthDescribeEventsForOrganizationResponse *> *)describeEventsForOrganization:(AWSHealthDescribeEventsForOrganizationRequest *)request;

/**
 <p>Returns information about events across your organization in AWS Organizations, meeting the specified filter criteria. Events are returned in a summary form and do not include the accounts impacted, detailed description, any additional metadata that depends on the event type, or any affected resources. To retrieve that information, use the <a>DescribeAffectedAccountsForOrganization</a>, <a>DescribeEventDetailsForOrganization</a>, and <a>DescribeAffectedEntitiesForOrganization</a> operations.</p><p>If no filter criteria are specified, all events across your organization are returned. Results are sorted by <code>lastModifiedTime</code>, starting with the most recent.</p><p>Before you can call this operation, you must first enable Health to work with AWS Organizations. To do this, call the <a>EnableHealthServiceAccessForOrganization</a> operation from your organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEventsForOrganization service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSHealthErrorDomain` domain and the following error code: `AWSHealthErrorInvalidPaginationToken`, `AWSHealthErrorUnsupportedLocale`.
 
 @see AWSHealthDescribeEventsForOrganizationRequest
 @see AWSHealthDescribeEventsForOrganizationResponse
 */
- (void)describeEventsForOrganization:(AWSHealthDescribeEventsForOrganizationRequest *)request completionHandler:(void (^ _Nullable)(AWSHealthDescribeEventsForOrganizationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation provides status information on enabling or disabling AWS Health to work with your organization. To call this operation, you must sign in as an IAM user, assume an IAM role, or sign in as the root user (not recommended) in the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHealthServiceStatusForOrganization service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSHealthDescribeHealthServiceStatusForOrganizationResponse`.
 
 @see AWSRequest
 @see AWSHealthDescribeHealthServiceStatusForOrganizationResponse
 */
- (AWSTask<AWSHealthDescribeHealthServiceStatusForOrganizationResponse *> *)describeHealthServiceStatusForOrganization:(AWSRequest *)request;

/**
 <p>This operation provides status information on enabling or disabling AWS Health to work with your organization. To call this operation, you must sign in as an IAM user, assume an IAM role, or sign in as the root user (not recommended) in the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHealthServiceStatusForOrganization service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSRequest
 @see AWSHealthDescribeHealthServiceStatusForOrganizationResponse
 */
- (void)describeHealthServiceStatusForOrganization:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSHealthDescribeHealthServiceStatusForOrganizationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Calling this operation disables Health from working with AWS Organizations. This does not remove the Service Linked Role (SLR) from the the master account in your organization. Use the IAM console, API, or AWS CLI to remove the SLR if desired. To call this operation, you must sign in as an IAM user, assume an IAM role, or sign in as the root user (not recommended) in the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the DisableHealthServiceAccessForOrganization service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSHealthErrorDomain` domain and the following error code: `AWSHealthErrorConcurrentModification`.
 
 @see AWSRequest
 */
- (AWSTask *)disableHealthServiceAccessForOrganization:(AWSRequest *)request;

/**
 <p>Calling this operation disables Health from working with AWS Organizations. This does not remove the Service Linked Role (SLR) from the the master account in your organization. Use the IAM console, API, or AWS CLI to remove the SLR if desired. To call this operation, you must sign in as an IAM user, assume an IAM role, or sign in as the root user (not recommended) in the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the DisableHealthServiceAccessForOrganization service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSHealthErrorDomain` domain and the following error code: `AWSHealthErrorConcurrentModification`.
 
 @see AWSRequest
 */
- (void)disableHealthServiceAccessForOrganization:(AWSRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Calling this operation enables AWS Health to work with AWS Organizations. This applies a Service Linked Role (SLR) to the master account in the organization. To learn more about the steps in this process, visit enabling service access for AWS Health in AWS Organizations. To call this operation, you must sign in as an IAM user, assume an IAM role, or sign in as the root user (not recommended) in the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the EnableHealthServiceAccessForOrganization service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSHealthErrorDomain` domain and the following error code: `AWSHealthErrorConcurrentModification`.
 
 @see AWSRequest
 */
- (AWSTask *)enableHealthServiceAccessForOrganization:(AWSRequest *)request;

/**
 <p>Calling this operation enables AWS Health to work with AWS Organizations. This applies a Service Linked Role (SLR) to the master account in the organization. To learn more about the steps in this process, visit enabling service access for AWS Health in AWS Organizations. To call this operation, you must sign in as an IAM user, assume an IAM role, or sign in as the root user (not recommended) in the organization's master account.</p>
 
 @param request A container for the necessary parameters to execute the EnableHealthServiceAccessForOrganization service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSHealthErrorDomain` domain and the following error code: `AWSHealthErrorConcurrentModification`.
 
 @see AWSRequest
 */
- (void)enableHealthServiceAccessForOrganization:(AWSRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
