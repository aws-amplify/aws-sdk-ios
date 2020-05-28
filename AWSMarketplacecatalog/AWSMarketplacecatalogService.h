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
#import "AWSMarketplacecatalogModel.h"
#import "AWSMarketplacecatalogResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSMarketplacecatalog
FOUNDATION_EXPORT NSString *const AWSMarketplacecatalogSDKVersion;

/**
 <p>Catalog API actions allow you to manage your entities through list, describe, and update capabilities. An entity can be a product or an offer on AWS Marketplace.</p><p>You can automate your entity update process by integrating the AWS Marketplace Catalog API with your AWS Marketplace product build or deployment pipelines. You can also create your own applications on top of the Catalog API to manage your products on AWS Marketplace.</p>
 */
@interface AWSMarketplacecatalog : AWSService

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

     let Marketplacecatalog = AWSMarketplacecatalog.default()

 *Objective-C*

     AWSMarketplacecatalog *Marketplacecatalog = [AWSMarketplacecatalog defaultMarketplacecatalog];

 @return The default service client.
 */
+ (instancetype)defaultMarketplacecatalog;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSMarketplacecatalog.register(with: configuration!, forKey: "USWest2Marketplacecatalog")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSMarketplacecatalog registerMarketplacecatalogWithConfiguration:configuration forKey:@"USWest2Marketplacecatalog"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Marketplacecatalog = AWSMarketplacecatalog(forKey: "USWest2Marketplacecatalog")

 *Objective-C*

     AWSMarketplacecatalog *Marketplacecatalog = [AWSMarketplacecatalog MarketplacecatalogForKey:@"USWest2Marketplacecatalog"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerMarketplacecatalogWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerMarketplacecatalogWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSMarketplacecatalog.register(with: configuration!, forKey: "USWest2Marketplacecatalog")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSMarketplacecatalog registerMarketplacecatalogWithConfiguration:configuration forKey:@"USWest2Marketplacecatalog"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Marketplacecatalog = AWSMarketplacecatalog(forKey: "USWest2Marketplacecatalog")

 *Objective-C*

     AWSMarketplacecatalog *Marketplacecatalog = [AWSMarketplacecatalog MarketplacecatalogForKey:@"USWest2Marketplacecatalog"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)MarketplacecatalogForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeMarketplacecatalogForKey:(NSString *)key;

/**
 <p>Used to cancel an open change request. Must be sent before the status of the request changes to <code>APPLYING</code>, the final stage of completing your change request. You can describe a change during the 60-day request history retention period for API calls.</p>
 
 @param request A container for the necessary parameters to execute the CancelChangeSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMarketplacecatalogCancelChangeSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMarketplacecatalogErrorDomain` domain and the following error code: `AWSMarketplacecatalogErrorInternalService`, `AWSMarketplacecatalogErrorAccessDenied`, `AWSMarketplacecatalogErrorValidation`, `AWSMarketplacecatalogErrorResourceNotFound`, `AWSMarketplacecatalogErrorResourceInUse`, `AWSMarketplacecatalogErrorThrottling`.
 
 @see AWSMarketplacecatalogCancelChangeSetRequest
 @see AWSMarketplacecatalogCancelChangeSetResponse
 */
- (AWSTask<AWSMarketplacecatalogCancelChangeSetResponse *> *)cancelChangeSet:(AWSMarketplacecatalogCancelChangeSetRequest *)request;

/**
 <p>Used to cancel an open change request. Must be sent before the status of the request changes to <code>APPLYING</code>, the final stage of completing your change request. You can describe a change during the 60-day request history retention period for API calls.</p>
 
 @param request A container for the necessary parameters to execute the CancelChangeSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMarketplacecatalogErrorDomain` domain and the following error code: `AWSMarketplacecatalogErrorInternalService`, `AWSMarketplacecatalogErrorAccessDenied`, `AWSMarketplacecatalogErrorValidation`, `AWSMarketplacecatalogErrorResourceNotFound`, `AWSMarketplacecatalogErrorResourceInUse`, `AWSMarketplacecatalogErrorThrottling`.
 
 @see AWSMarketplacecatalogCancelChangeSetRequest
 @see AWSMarketplacecatalogCancelChangeSetResponse
 */
- (void)cancelChangeSet:(AWSMarketplacecatalogCancelChangeSetRequest *)request completionHandler:(void (^ _Nullable)(AWSMarketplacecatalogCancelChangeSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about a given change set.</p>
 
 @param request A container for the necessary parameters to execute the DescribeChangeSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMarketplacecatalogDescribeChangeSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMarketplacecatalogErrorDomain` domain and the following error code: `AWSMarketplacecatalogErrorInternalService`, `AWSMarketplacecatalogErrorAccessDenied`, `AWSMarketplacecatalogErrorValidation`, `AWSMarketplacecatalogErrorResourceNotFound`, `AWSMarketplacecatalogErrorThrottling`.
 
 @see AWSMarketplacecatalogDescribeChangeSetRequest
 @see AWSMarketplacecatalogDescribeChangeSetResponse
 */
- (AWSTask<AWSMarketplacecatalogDescribeChangeSetResponse *> *)describeChangeSet:(AWSMarketplacecatalogDescribeChangeSetRequest *)request;

/**
 <p>Provides information about a given change set.</p>
 
 @param request A container for the necessary parameters to execute the DescribeChangeSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMarketplacecatalogErrorDomain` domain and the following error code: `AWSMarketplacecatalogErrorInternalService`, `AWSMarketplacecatalogErrorAccessDenied`, `AWSMarketplacecatalogErrorValidation`, `AWSMarketplacecatalogErrorResourceNotFound`, `AWSMarketplacecatalogErrorThrottling`.
 
 @see AWSMarketplacecatalogDescribeChangeSetRequest
 @see AWSMarketplacecatalogDescribeChangeSetResponse
 */
- (void)describeChangeSet:(AWSMarketplacecatalogDescribeChangeSetRequest *)request completionHandler:(void (^ _Nullable)(AWSMarketplacecatalogDescribeChangeSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the metadata and content of the entity.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEntity service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMarketplacecatalogDescribeEntityResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMarketplacecatalogErrorDomain` domain and the following error code: `AWSMarketplacecatalogErrorInternalService`, `AWSMarketplacecatalogErrorAccessDenied`, `AWSMarketplacecatalogErrorValidation`, `AWSMarketplacecatalogErrorResourceNotSupported`, `AWSMarketplacecatalogErrorResourceNotFound`, `AWSMarketplacecatalogErrorThrottling`.
 
 @see AWSMarketplacecatalogDescribeEntityRequest
 @see AWSMarketplacecatalogDescribeEntityResponse
 */
- (AWSTask<AWSMarketplacecatalogDescribeEntityResponse *> *)describeEntity:(AWSMarketplacecatalogDescribeEntityRequest *)request;

/**
 <p>Returns the metadata and content of the entity.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEntity service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMarketplacecatalogErrorDomain` domain and the following error code: `AWSMarketplacecatalogErrorInternalService`, `AWSMarketplacecatalogErrorAccessDenied`, `AWSMarketplacecatalogErrorValidation`, `AWSMarketplacecatalogErrorResourceNotSupported`, `AWSMarketplacecatalogErrorResourceNotFound`, `AWSMarketplacecatalogErrorThrottling`.
 
 @see AWSMarketplacecatalogDescribeEntityRequest
 @see AWSMarketplacecatalogDescribeEntityResponse
 */
- (void)describeEntity:(AWSMarketplacecatalogDescribeEntityRequest *)request completionHandler:(void (^ _Nullable)(AWSMarketplacecatalogDescribeEntityResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the list of change sets owned by the account being used to make the call. You can filter this list by providing any combination of <code>entityId</code>, <code>ChangeSetName</code>, and status. If you provide more than one filter, the API operation applies a logical AND between the filters.</p><p>You can describe a change during the 60-day request history retention period for API calls.</p>
 
 @param request A container for the necessary parameters to execute the ListChangeSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMarketplacecatalogListChangeSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMarketplacecatalogErrorDomain` domain and the following error code: `AWSMarketplacecatalogErrorInternalService`, `AWSMarketplacecatalogErrorAccessDenied`, `AWSMarketplacecatalogErrorValidation`, `AWSMarketplacecatalogErrorThrottling`.
 
 @see AWSMarketplacecatalogListChangeSetsRequest
 @see AWSMarketplacecatalogListChangeSetsResponse
 */
- (AWSTask<AWSMarketplacecatalogListChangeSetsResponse *> *)listChangeSets:(AWSMarketplacecatalogListChangeSetsRequest *)request;

/**
 <p>Returns the list of change sets owned by the account being used to make the call. You can filter this list by providing any combination of <code>entityId</code>, <code>ChangeSetName</code>, and status. If you provide more than one filter, the API operation applies a logical AND between the filters.</p><p>You can describe a change during the 60-day request history retention period for API calls.</p>
 
 @param request A container for the necessary parameters to execute the ListChangeSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMarketplacecatalogErrorDomain` domain and the following error code: `AWSMarketplacecatalogErrorInternalService`, `AWSMarketplacecatalogErrorAccessDenied`, `AWSMarketplacecatalogErrorValidation`, `AWSMarketplacecatalogErrorThrottling`.
 
 @see AWSMarketplacecatalogListChangeSetsRequest
 @see AWSMarketplacecatalogListChangeSetsResponse
 */
- (void)listChangeSets:(AWSMarketplacecatalogListChangeSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSMarketplacecatalogListChangeSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides the list of entities of a given type.</p>
 
 @param request A container for the necessary parameters to execute the ListEntities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMarketplacecatalogListEntitiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMarketplacecatalogErrorDomain` domain and the following error code: `AWSMarketplacecatalogErrorInternalService`, `AWSMarketplacecatalogErrorAccessDenied`, `AWSMarketplacecatalogErrorValidation`, `AWSMarketplacecatalogErrorResourceNotFound`, `AWSMarketplacecatalogErrorThrottling`.
 
 @see AWSMarketplacecatalogListEntitiesRequest
 @see AWSMarketplacecatalogListEntitiesResponse
 */
- (AWSTask<AWSMarketplacecatalogListEntitiesResponse *> *)listEntities:(AWSMarketplacecatalogListEntitiesRequest *)request;

/**
 <p>Provides the list of entities of a given type.</p>
 
 @param request A container for the necessary parameters to execute the ListEntities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMarketplacecatalogErrorDomain` domain and the following error code: `AWSMarketplacecatalogErrorInternalService`, `AWSMarketplacecatalogErrorAccessDenied`, `AWSMarketplacecatalogErrorValidation`, `AWSMarketplacecatalogErrorResourceNotFound`, `AWSMarketplacecatalogErrorThrottling`.
 
 @see AWSMarketplacecatalogListEntitiesRequest
 @see AWSMarketplacecatalogListEntitiesResponse
 */
- (void)listEntities:(AWSMarketplacecatalogListEntitiesRequest *)request completionHandler:(void (^ _Nullable)(AWSMarketplacecatalogListEntitiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation allows you to request changes for your entities. Within a single ChangeSet, you cannot start the same change type against the same entity multiple times. Additionally, when a ChangeSet is running, all the entities targeted by the different changes are locked until the ChangeSet has completed (either succeeded, cancelled, or failed). If you try to start a ChangeSet containing a change against an entity that is already locked, you will receive a <code>ResourceInUseException</code>.</p><p>For example, you cannot start the ChangeSet described in the <a href="https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/API_StartChangeSet.html#API_StartChangeSet_Examples">example</a> below because it contains two changes to execute the same change type (<code>AddRevisions</code>) against the same entity (<code>entity-id@1)</code>.</p>
 
 @param request A container for the necessary parameters to execute the StartChangeSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMarketplacecatalogStartChangeSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMarketplacecatalogErrorDomain` domain and the following error code: `AWSMarketplacecatalogErrorInternalService`, `AWSMarketplacecatalogErrorAccessDenied`, `AWSMarketplacecatalogErrorValidation`, `AWSMarketplacecatalogErrorResourceNotFound`, `AWSMarketplacecatalogErrorResourceInUse`, `AWSMarketplacecatalogErrorThrottling`, `AWSMarketplacecatalogErrorServiceQuotaExceeded`.
 
 @see AWSMarketplacecatalogStartChangeSetRequest
 @see AWSMarketplacecatalogStartChangeSetResponse
 */
- (AWSTask<AWSMarketplacecatalogStartChangeSetResponse *> *)startChangeSet:(AWSMarketplacecatalogStartChangeSetRequest *)request;

/**
 <p>This operation allows you to request changes for your entities. Within a single ChangeSet, you cannot start the same change type against the same entity multiple times. Additionally, when a ChangeSet is running, all the entities targeted by the different changes are locked until the ChangeSet has completed (either succeeded, cancelled, or failed). If you try to start a ChangeSet containing a change against an entity that is already locked, you will receive a <code>ResourceInUseException</code>.</p><p>For example, you cannot start the ChangeSet described in the <a href="https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/API_StartChangeSet.html#API_StartChangeSet_Examples">example</a> below because it contains two changes to execute the same change type (<code>AddRevisions</code>) against the same entity (<code>entity-id@1)</code>.</p>
 
 @param request A container for the necessary parameters to execute the StartChangeSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMarketplacecatalogErrorDomain` domain and the following error code: `AWSMarketplacecatalogErrorInternalService`, `AWSMarketplacecatalogErrorAccessDenied`, `AWSMarketplacecatalogErrorValidation`, `AWSMarketplacecatalogErrorResourceNotFound`, `AWSMarketplacecatalogErrorResourceInUse`, `AWSMarketplacecatalogErrorThrottling`, `AWSMarketplacecatalogErrorServiceQuotaExceeded`.
 
 @see AWSMarketplacecatalogStartChangeSetRequest
 @see AWSMarketplacecatalogStartChangeSetResponse
 */
- (void)startChangeSet:(AWSMarketplacecatalogStartChangeSetRequest *)request completionHandler:(void (^ _Nullable)(AWSMarketplacecatalogStartChangeSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
