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
#import "AWSDatabasemigrationserviceModel.h"
#import "AWSDatabasemigrationserviceResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSDatabasemigrationservice
FOUNDATION_EXPORT NSString *const AWSDatabasemigrationserviceSDKVersion;

/**
 <fullname>AWS Database Migration Service</fullname><p>AWS Database Migration Service (AWS DMS) can migrate your data to and from the most widely used commercial and open-source databases such as Oracle, PostgreSQL, Microsoft SQL Server, Amazon Redshift, MariaDB, Amazon Aurora, MySQL, and SAP Adaptive Server Enterprise (ASE). The service supports homogeneous migrations such as Oracle to Oracle, as well as heterogeneous migrations between different database platforms, such as Oracle to MySQL or SQL Server to PostgreSQL.</p><p>For more information about AWS DMS, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/Welcome.html">What Is AWS Database Migration Service?</a> in the <i>AWS Database Migration User Guide.</i></p>
 */
@interface AWSDatabasemigrationservice : AWSService

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

     let Databasemigrationservice = AWSDatabasemigrationservice.default()

 *Objective-C*

     AWSDatabasemigrationservice *Databasemigrationservice = [AWSDatabasemigrationservice defaultDatabasemigrationservice];

 @return The default service client.
 */
+ (instancetype)defaultDatabasemigrationservice;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSDatabasemigrationservice.register(with: configuration!, forKey: "USWest2Databasemigrationservice")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:@"USWest2Databasemigrationservice"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Databasemigrationservice = AWSDatabasemigrationservice(forKey: "USWest2Databasemigrationservice")

 *Objective-C*

     AWSDatabasemigrationservice *Databasemigrationservice = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:@"USWest2Databasemigrationservice"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerDatabasemigrationserviceWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerDatabasemigrationserviceWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSDatabasemigrationservice.register(with: configuration!, forKey: "USWest2Databasemigrationservice")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:@"USWest2Databasemigrationservice"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Databasemigrationservice = AWSDatabasemigrationservice(forKey: "USWest2Databasemigrationservice")

 *Objective-C*

     AWSDatabasemigrationservice *Databasemigrationservice = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:@"USWest2Databasemigrationservice"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)DatabasemigrationserviceForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeDatabasemigrationserviceForKey:(NSString *)key;

/**
 <p>Adds metadata tags to an AWS DMS resource, including replication instance, endpoint, security group, and migration task. These tags can also be used with cost allocation reporting to track cost associated with DMS resources, or used in a Condition statement in an IAM policy for DMS.</p>
 
 @param request A container for the necessary parameters to execute the AddTagsToResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceAddTagsToResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceAddTagsToResourceMessage
 @see AWSDatabasemigrationserviceAddTagsToResourceResponse
 */
- (AWSTask<AWSDatabasemigrationserviceAddTagsToResourceResponse *> *)addTagsToResource:(AWSDatabasemigrationserviceAddTagsToResourceMessage *)request;

/**
 <p>Adds metadata tags to an AWS DMS resource, including replication instance, endpoint, security group, and migration task. These tags can also be used with cost allocation reporting to track cost associated with DMS resources, or used in a Condition statement in an IAM policy for DMS.</p>
 
 @param request A container for the necessary parameters to execute the AddTagsToResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceAddTagsToResourceMessage
 @see AWSDatabasemigrationserviceAddTagsToResourceResponse
 */
- (void)addTagsToResource:(AWSDatabasemigrationserviceAddTagsToResourceMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceAddTagsToResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Applies a pending maintenance action to a resource (for example, to a replication instance).</p>
 
 @param request A container for the necessary parameters to execute the ApplyPendingMaintenanceAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceApplyPendingMaintenanceActionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceApplyPendingMaintenanceActionMessage
 @see AWSDatabasemigrationserviceApplyPendingMaintenanceActionResponse
 */
- (AWSTask<AWSDatabasemigrationserviceApplyPendingMaintenanceActionResponse *> *)applyPendingMaintenanceAction:(AWSDatabasemigrationserviceApplyPendingMaintenanceActionMessage *)request;

/**
 <p>Applies a pending maintenance action to a resource (for example, to a replication instance).</p>
 
 @param request A container for the necessary parameters to execute the ApplyPendingMaintenanceAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceApplyPendingMaintenanceActionMessage
 @see AWSDatabasemigrationserviceApplyPendingMaintenanceActionResponse
 */
- (void)applyPendingMaintenanceAction:(AWSDatabasemigrationserviceApplyPendingMaintenanceActionMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceApplyPendingMaintenanceActionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an endpoint using the provided settings.</p>
 
 @param request A container for the necessary parameters to execute the CreateEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceCreateEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorKMSKeyNotAccessible`, `AWSDatabasemigrationserviceErrorResourceAlreadyExists`, `AWSDatabasemigrationserviceErrorResourceQuotaExceeded`, `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorAccessDenied`.
 
 @see AWSDatabasemigrationserviceCreateEndpointMessage
 @see AWSDatabasemigrationserviceCreateEndpointResponse
 */
- (AWSTask<AWSDatabasemigrationserviceCreateEndpointResponse *> *)createEndpoint:(AWSDatabasemigrationserviceCreateEndpointMessage *)request;

/**
 <p>Creates an endpoint using the provided settings.</p>
 
 @param request A container for the necessary parameters to execute the CreateEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorKMSKeyNotAccessible`, `AWSDatabasemigrationserviceErrorResourceAlreadyExists`, `AWSDatabasemigrationserviceErrorResourceQuotaExceeded`, `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorAccessDenied`.
 
 @see AWSDatabasemigrationserviceCreateEndpointMessage
 @see AWSDatabasemigrationserviceCreateEndpointResponse
 */
- (void)createEndpoint:(AWSDatabasemigrationserviceCreateEndpointMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceCreateEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Creates an AWS DMS event notification subscription. </p><p>You can specify the type of source (<code>SourceType</code>) you want to be notified of, provide a list of AWS DMS source IDs (<code>SourceIds</code>) that triggers the events, and provide a list of event categories (<code>EventCategories</code>) for events you want to be notified of. If you specify both the <code>SourceType</code> and <code>SourceIds</code>, such as <code>SourceType = replication-instance</code> and <code>SourceIdentifier = my-replinstance</code>, you will be notified of all the replication instance events for the specified source. If you specify a <code>SourceType</code> but don't specify a <code>SourceIdentifier</code>, you receive notice of the events for that source type for all your AWS DMS sources. If you don't specify either <code>SourceType</code> nor <code>SourceIdentifier</code>, you will be notified of events generated from all AWS DMS sources belonging to your customer account.</p><p>For more information about AWS DMS events, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html">Working with Events and Notifications</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the CreateEventSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceCreateEventSubscriptionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceQuotaExceeded`, `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorResourceAlreadyExists`, `AWSDatabasemigrationserviceErrorSNSInvalidTopic`, `AWSDatabasemigrationserviceErrorSNSNoAuthorization`, `AWSDatabasemigrationserviceErrorKMSAccessDenied`, `AWSDatabasemigrationserviceErrorKMSDisabled`, `AWSDatabasemigrationserviceErrorKMSInvalidState`, `AWSDatabasemigrationserviceErrorKMSNotFound`, `AWSDatabasemigrationserviceErrorKMSThrottling`.
 
 @see AWSDatabasemigrationserviceCreateEventSubscriptionMessage
 @see AWSDatabasemigrationserviceCreateEventSubscriptionResponse
 */
- (AWSTask<AWSDatabasemigrationserviceCreateEventSubscriptionResponse *> *)createEventSubscription:(AWSDatabasemigrationserviceCreateEventSubscriptionMessage *)request;

/**
 <p> Creates an AWS DMS event notification subscription. </p><p>You can specify the type of source (<code>SourceType</code>) you want to be notified of, provide a list of AWS DMS source IDs (<code>SourceIds</code>) that triggers the events, and provide a list of event categories (<code>EventCategories</code>) for events you want to be notified of. If you specify both the <code>SourceType</code> and <code>SourceIds</code>, such as <code>SourceType = replication-instance</code> and <code>SourceIdentifier = my-replinstance</code>, you will be notified of all the replication instance events for the specified source. If you specify a <code>SourceType</code> but don't specify a <code>SourceIdentifier</code>, you receive notice of the events for that source type for all your AWS DMS sources. If you don't specify either <code>SourceType</code> nor <code>SourceIdentifier</code>, you will be notified of events generated from all AWS DMS sources belonging to your customer account.</p><p>For more information about AWS DMS events, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html">Working with Events and Notifications</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the CreateEventSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceQuotaExceeded`, `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorResourceAlreadyExists`, `AWSDatabasemigrationserviceErrorSNSInvalidTopic`, `AWSDatabasemigrationserviceErrorSNSNoAuthorization`, `AWSDatabasemigrationserviceErrorKMSAccessDenied`, `AWSDatabasemigrationserviceErrorKMSDisabled`, `AWSDatabasemigrationserviceErrorKMSInvalidState`, `AWSDatabasemigrationserviceErrorKMSNotFound`, `AWSDatabasemigrationserviceErrorKMSThrottling`.
 
 @see AWSDatabasemigrationserviceCreateEventSubscriptionMessage
 @see AWSDatabasemigrationserviceCreateEventSubscriptionResponse
 */
- (void)createEventSubscription:(AWSDatabasemigrationserviceCreateEventSubscriptionMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceCreateEventSubscriptionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates the replication instance using the specified parameters.</p><p>AWS DMS requires that your account have certain roles with appropriate permissions before you can create a replication instance. For information on the required roles, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.APIRole.html">Creating the IAM Roles to Use With the AWS CLI and AWS DMS API</a>. For information on the required permissions, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.IAMPermissions.html">IAM Permissions Needed to Use AWS DMS</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateReplicationInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceCreateReplicationInstanceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorAccessDenied`, `AWSDatabasemigrationserviceErrorResourceAlreadyExists`, `AWSDatabasemigrationserviceErrorInsufficientResourceCapacity`, `AWSDatabasemigrationserviceErrorResourceQuotaExceeded`, `AWSDatabasemigrationserviceErrorStorageQuotaExceeded`, `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorReplicationSubnetGroupDoesNotCoverEnoughAZs`, `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorInvalidSubnet`, `AWSDatabasemigrationserviceErrorKMSKeyNotAccessible`.
 
 @see AWSDatabasemigrationserviceCreateReplicationInstanceMessage
 @see AWSDatabasemigrationserviceCreateReplicationInstanceResponse
 */
- (AWSTask<AWSDatabasemigrationserviceCreateReplicationInstanceResponse *> *)createReplicationInstance:(AWSDatabasemigrationserviceCreateReplicationInstanceMessage *)request;

/**
 <p>Creates the replication instance using the specified parameters.</p><p>AWS DMS requires that your account have certain roles with appropriate permissions before you can create a replication instance. For information on the required roles, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.APIRole.html">Creating the IAM Roles to Use With the AWS CLI and AWS DMS API</a>. For information on the required permissions, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.IAMPermissions.html">IAM Permissions Needed to Use AWS DMS</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateReplicationInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorAccessDenied`, `AWSDatabasemigrationserviceErrorResourceAlreadyExists`, `AWSDatabasemigrationserviceErrorInsufficientResourceCapacity`, `AWSDatabasemigrationserviceErrorResourceQuotaExceeded`, `AWSDatabasemigrationserviceErrorStorageQuotaExceeded`, `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorReplicationSubnetGroupDoesNotCoverEnoughAZs`, `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorInvalidSubnet`, `AWSDatabasemigrationserviceErrorKMSKeyNotAccessible`.
 
 @see AWSDatabasemigrationserviceCreateReplicationInstanceMessage
 @see AWSDatabasemigrationserviceCreateReplicationInstanceResponse
 */
- (void)createReplicationInstance:(AWSDatabasemigrationserviceCreateReplicationInstanceMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceCreateReplicationInstanceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a replication subnet group given a list of the subnet IDs in a VPC.</p>
 
 @param request A container for the necessary parameters to execute the CreateReplicationSubnetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceCreateReplicationSubnetGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorAccessDenied`, `AWSDatabasemigrationserviceErrorResourceAlreadyExists`, `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorResourceQuotaExceeded`, `AWSDatabasemigrationserviceErrorReplicationSubnetGroupDoesNotCoverEnoughAZs`, `AWSDatabasemigrationserviceErrorInvalidSubnet`.
 
 @see AWSDatabasemigrationserviceCreateReplicationSubnetGroupMessage
 @see AWSDatabasemigrationserviceCreateReplicationSubnetGroupResponse
 */
- (AWSTask<AWSDatabasemigrationserviceCreateReplicationSubnetGroupResponse *> *)createReplicationSubnetGroup:(AWSDatabasemigrationserviceCreateReplicationSubnetGroupMessage *)request;

/**
 <p>Creates a replication subnet group given a list of the subnet IDs in a VPC.</p>
 
 @param request A container for the necessary parameters to execute the CreateReplicationSubnetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorAccessDenied`, `AWSDatabasemigrationserviceErrorResourceAlreadyExists`, `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorResourceQuotaExceeded`, `AWSDatabasemigrationserviceErrorReplicationSubnetGroupDoesNotCoverEnoughAZs`, `AWSDatabasemigrationserviceErrorInvalidSubnet`.
 
 @see AWSDatabasemigrationserviceCreateReplicationSubnetGroupMessage
 @see AWSDatabasemigrationserviceCreateReplicationSubnetGroupResponse
 */
- (void)createReplicationSubnetGroup:(AWSDatabasemigrationserviceCreateReplicationSubnetGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceCreateReplicationSubnetGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a replication task using the specified parameters.</p>
 
 @param request A container for the necessary parameters to execute the CreateReplicationTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceCreateReplicationTaskResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorAccessDenied`, `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorResourceAlreadyExists`, `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorKMSKeyNotAccessible`, `AWSDatabasemigrationserviceErrorResourceQuotaExceeded`.
 
 @see AWSDatabasemigrationserviceCreateReplicationTaskMessage
 @see AWSDatabasemigrationserviceCreateReplicationTaskResponse
 */
- (AWSTask<AWSDatabasemigrationserviceCreateReplicationTaskResponse *> *)createReplicationTask:(AWSDatabasemigrationserviceCreateReplicationTaskMessage *)request;

/**
 <p>Creates a replication task using the specified parameters.</p>
 
 @param request A container for the necessary parameters to execute the CreateReplicationTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorAccessDenied`, `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorResourceAlreadyExists`, `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorKMSKeyNotAccessible`, `AWSDatabasemigrationserviceErrorResourceQuotaExceeded`.
 
 @see AWSDatabasemigrationserviceCreateReplicationTaskMessage
 @see AWSDatabasemigrationserviceCreateReplicationTaskResponse
 */
- (void)createReplicationTask:(AWSDatabasemigrationserviceCreateReplicationTaskMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceCreateReplicationTaskResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified certificate. </p>
 
 @param request A container for the necessary parameters to execute the DeleteCertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDeleteCertificateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInvalidResourceState`.
 
 @see AWSDatabasemigrationserviceDeleteCertificateMessage
 @see AWSDatabasemigrationserviceDeleteCertificateResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDeleteCertificateResponse *> *)deleteCertificate:(AWSDatabasemigrationserviceDeleteCertificateMessage *)request;

/**
 <p>Deletes the specified certificate. </p>
 
 @param request A container for the necessary parameters to execute the DeleteCertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInvalidResourceState`.
 
 @see AWSDatabasemigrationserviceDeleteCertificateMessage
 @see AWSDatabasemigrationserviceDeleteCertificateResponse
 */
- (void)deleteCertificate:(AWSDatabasemigrationserviceDeleteCertificateMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDeleteCertificateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the connection between a replication instance and an endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDeleteConnectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorAccessDenied`, `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInvalidResourceState`.
 
 @see AWSDatabasemigrationserviceDeleteConnectionMessage
 @see AWSDatabasemigrationserviceDeleteConnectionResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDeleteConnectionResponse *> *)deleteConnection:(AWSDatabasemigrationserviceDeleteConnectionMessage *)request;

/**
 <p>Deletes the connection between a replication instance and an endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorAccessDenied`, `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInvalidResourceState`.
 
 @see AWSDatabasemigrationserviceDeleteConnectionMessage
 @see AWSDatabasemigrationserviceDeleteConnectionResponse
 */
- (void)deleteConnection:(AWSDatabasemigrationserviceDeleteConnectionMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDeleteConnectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified endpoint.</p><note><p>All tasks associated with the endpoint must be deleted before you can delete the endpoint.</p></note><p/>
 
 @param request A container for the necessary parameters to execute the DeleteEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDeleteEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInvalidResourceState`.
 
 @see AWSDatabasemigrationserviceDeleteEndpointMessage
 @see AWSDatabasemigrationserviceDeleteEndpointResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDeleteEndpointResponse *> *)deleteEndpoint:(AWSDatabasemigrationserviceDeleteEndpointMessage *)request;

/**
 <p>Deletes the specified endpoint.</p><note><p>All tasks associated with the endpoint must be deleted before you can delete the endpoint.</p></note><p/>
 
 @param request A container for the necessary parameters to execute the DeleteEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInvalidResourceState`.
 
 @see AWSDatabasemigrationserviceDeleteEndpointMessage
 @see AWSDatabasemigrationserviceDeleteEndpointResponse
 */
- (void)deleteEndpoint:(AWSDatabasemigrationserviceDeleteEndpointMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDeleteEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes an AWS DMS event subscription. </p>
 
 @param request A container for the necessary parameters to execute the DeleteEventSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDeleteEventSubscriptionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInvalidResourceState`.
 
 @see AWSDatabasemigrationserviceDeleteEventSubscriptionMessage
 @see AWSDatabasemigrationserviceDeleteEventSubscriptionResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDeleteEventSubscriptionResponse *> *)deleteEventSubscription:(AWSDatabasemigrationserviceDeleteEventSubscriptionMessage *)request;

/**
 <p> Deletes an AWS DMS event subscription. </p>
 
 @param request A container for the necessary parameters to execute the DeleteEventSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInvalidResourceState`.
 
 @see AWSDatabasemigrationserviceDeleteEventSubscriptionMessage
 @see AWSDatabasemigrationserviceDeleteEventSubscriptionResponse
 */
- (void)deleteEventSubscription:(AWSDatabasemigrationserviceDeleteEventSubscriptionMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDeleteEventSubscriptionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified replication instance.</p><note><p>You must delete any migration tasks that are associated with the replication instance before you can delete it.</p></note><p/>
 
 @param request A container for the necessary parameters to execute the DeleteReplicationInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDeleteReplicationInstanceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDeleteReplicationInstanceMessage
 @see AWSDatabasemigrationserviceDeleteReplicationInstanceResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDeleteReplicationInstanceResponse *> *)deleteReplicationInstance:(AWSDatabasemigrationserviceDeleteReplicationInstanceMessage *)request;

/**
 <p>Deletes the specified replication instance.</p><note><p>You must delete any migration tasks that are associated with the replication instance before you can delete it.</p></note><p/>
 
 @param request A container for the necessary parameters to execute the DeleteReplicationInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDeleteReplicationInstanceMessage
 @see AWSDatabasemigrationserviceDeleteReplicationInstanceResponse
 */
- (void)deleteReplicationInstance:(AWSDatabasemigrationserviceDeleteReplicationInstanceMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDeleteReplicationInstanceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a subnet group.</p>
 
 @param request A container for the necessary parameters to execute the DeleteReplicationSubnetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDeleteReplicationSubnetGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDeleteReplicationSubnetGroupMessage
 @see AWSDatabasemigrationserviceDeleteReplicationSubnetGroupResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDeleteReplicationSubnetGroupResponse *> *)deleteReplicationSubnetGroup:(AWSDatabasemigrationserviceDeleteReplicationSubnetGroupMessage *)request;

/**
 <p>Deletes a subnet group.</p>
 
 @param request A container for the necessary parameters to execute the DeleteReplicationSubnetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDeleteReplicationSubnetGroupMessage
 @see AWSDatabasemigrationserviceDeleteReplicationSubnetGroupResponse
 */
- (void)deleteReplicationSubnetGroup:(AWSDatabasemigrationserviceDeleteReplicationSubnetGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDeleteReplicationSubnetGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified replication task.</p>
 
 @param request A container for the necessary parameters to execute the DeleteReplicationTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDeleteReplicationTaskResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInvalidResourceState`.
 
 @see AWSDatabasemigrationserviceDeleteReplicationTaskMessage
 @see AWSDatabasemigrationserviceDeleteReplicationTaskResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDeleteReplicationTaskResponse *> *)deleteReplicationTask:(AWSDatabasemigrationserviceDeleteReplicationTaskMessage *)request;

/**
 <p>Deletes the specified replication task.</p>
 
 @param request A container for the necessary parameters to execute the DeleteReplicationTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInvalidResourceState`.
 
 @see AWSDatabasemigrationserviceDeleteReplicationTaskMessage
 @see AWSDatabasemigrationserviceDeleteReplicationTaskResponse
 */
- (void)deleteReplicationTask:(AWSDatabasemigrationserviceDeleteReplicationTaskMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDeleteReplicationTaskResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all of the AWS DMS attributes for a customer account. These attributes include AWS DMS quotas for the account and a unique account identifier in a particular DMS region. DMS quotas include a list of resource quotas supported by the account, such as the number of replication instances allowed. The description for each resource quota, includes the quota name, current usage toward that quota, and the quota's maximum value. DMS uses the unique account identifier to name each artifact used by DMS in the given region.</p><p>This command does not take any parameters.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccountAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDescribeAccountAttributesResponse`.
 
 @see AWSDatabasemigrationserviceDescribeAccountAttributesMessage
 @see AWSDatabasemigrationserviceDescribeAccountAttributesResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDescribeAccountAttributesResponse *> *)describeAccountAttributes:(AWSDatabasemigrationserviceDescribeAccountAttributesMessage *)request;

/**
 <p>Lists all of the AWS DMS attributes for a customer account. These attributes include AWS DMS quotas for the account and a unique account identifier in a particular DMS region. DMS quotas include a list of resource quotas supported by the account, such as the number of replication instances allowed. The description for each resource quota, includes the quota name, current usage toward that quota, and the quota's maximum value. DMS uses the unique account identifier to name each artifact used by DMS in the given region.</p><p>This command does not take any parameters.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccountAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSDatabasemigrationserviceDescribeAccountAttributesMessage
 @see AWSDatabasemigrationserviceDescribeAccountAttributesResponse
 */
- (void)describeAccountAttributes:(AWSDatabasemigrationserviceDescribeAccountAttributesMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDescribeAccountAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a description of the certificate.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCertificates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDescribeCertificatesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDescribeCertificatesMessage
 @see AWSDatabasemigrationserviceDescribeCertificatesResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDescribeCertificatesResponse *> *)describeCertificates:(AWSDatabasemigrationserviceDescribeCertificatesMessage *)request;

/**
 <p>Provides a description of the certificate.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCertificates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDescribeCertificatesMessage
 @see AWSDatabasemigrationserviceDescribeCertificatesResponse
 */
- (void)describeCertificates:(AWSDatabasemigrationserviceDescribeCertificatesMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDescribeCertificatesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the status of the connections that have been made between the replication instance and an endpoint. Connections are created when you test an endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DescribeConnections service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDescribeConnectionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDescribeConnectionsMessage
 @see AWSDatabasemigrationserviceDescribeConnectionsResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDescribeConnectionsResponse *> *)describeConnections:(AWSDatabasemigrationserviceDescribeConnectionsMessage *)request;

/**
 <p>Describes the status of the connections that have been made between the replication instance and an endpoint. Connections are created when you test an endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DescribeConnections service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDescribeConnectionsMessage
 @see AWSDatabasemigrationserviceDescribeConnectionsResponse
 */
- (void)describeConnections:(AWSDatabasemigrationserviceDescribeConnectionsMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDescribeConnectionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the type of endpoints available.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpointTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDescribeEndpointTypesResponse`.
 
 @see AWSDatabasemigrationserviceDescribeEndpointTypesMessage
 @see AWSDatabasemigrationserviceDescribeEndpointTypesResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDescribeEndpointTypesResponse *> *)describeEndpointTypes:(AWSDatabasemigrationserviceDescribeEndpointTypesMessage *)request;

/**
 <p>Returns information about the type of endpoints available.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpointTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSDatabasemigrationserviceDescribeEndpointTypesMessage
 @see AWSDatabasemigrationserviceDescribeEndpointTypesResponse
 */
- (void)describeEndpointTypes:(AWSDatabasemigrationserviceDescribeEndpointTypesMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDescribeEndpointTypesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the endpoints for your account in the current region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDescribeEndpointsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDescribeEndpointsMessage
 @see AWSDatabasemigrationserviceDescribeEndpointsResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDescribeEndpointsResponse *> *)describeEndpoints:(AWSDatabasemigrationserviceDescribeEndpointsMessage *)request;

/**
 <p>Returns information about the endpoints for your account in the current region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDescribeEndpointsMessage
 @see AWSDatabasemigrationserviceDescribeEndpointsResponse
 */
- (void)describeEndpoints:(AWSDatabasemigrationserviceDescribeEndpointsMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDescribeEndpointsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists categories for all event source types, or, if specified, for a specified source type. You can see a list of the event categories and source types in <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html">Working with Events and Notifications</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the DescribeEventCategories service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDescribeEventCategoriesResponse`.
 
 @see AWSDatabasemigrationserviceDescribeEventCategoriesMessage
 @see AWSDatabasemigrationserviceDescribeEventCategoriesResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDescribeEventCategoriesResponse *> *)describeEventCategories:(AWSDatabasemigrationserviceDescribeEventCategoriesMessage *)request;

/**
 <p>Lists categories for all event source types, or, if specified, for a specified source type. You can see a list of the event categories and source types in <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html">Working with Events and Notifications</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the DescribeEventCategories service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSDatabasemigrationserviceDescribeEventCategoriesMessage
 @see AWSDatabasemigrationserviceDescribeEventCategoriesResponse
 */
- (void)describeEventCategories:(AWSDatabasemigrationserviceDescribeEventCategoriesMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDescribeEventCategoriesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the event subscriptions for a customer account. The description of a subscription includes <code>SubscriptionName</code>, <code>SNSTopicARN</code>, <code>CustomerID</code>, <code>SourceType</code>, <code>SourceID</code>, <code>CreationTime</code>, and <code>Status</code>. </p><p>If you specify <code>SubscriptionName</code>, this action lists the description for that subscription.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEventSubscriptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDescribeEventSubscriptionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDescribeEventSubscriptionsMessage
 @see AWSDatabasemigrationserviceDescribeEventSubscriptionsResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDescribeEventSubscriptionsResponse *> *)describeEventSubscriptions:(AWSDatabasemigrationserviceDescribeEventSubscriptionsMessage *)request;

/**
 <p>Lists all the event subscriptions for a customer account. The description of a subscription includes <code>SubscriptionName</code>, <code>SNSTopicARN</code>, <code>CustomerID</code>, <code>SourceType</code>, <code>SourceID</code>, <code>CreationTime</code>, and <code>Status</code>. </p><p>If you specify <code>SubscriptionName</code>, this action lists the description for that subscription.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEventSubscriptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDescribeEventSubscriptionsMessage
 @see AWSDatabasemigrationserviceDescribeEventSubscriptionsResponse
 */
- (void)describeEventSubscriptions:(AWSDatabasemigrationserviceDescribeEventSubscriptionsMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDescribeEventSubscriptionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Lists events for a given source identifier and source type. You can also specify a start and end time. For more information on AWS DMS events, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html">Working with Events and Notifications</a> in the <i>AWS Database Migration User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the DescribeEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDescribeEventsResponse`.
 
 @see AWSDatabasemigrationserviceDescribeEventsMessage
 @see AWSDatabasemigrationserviceDescribeEventsResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDescribeEventsResponse *> *)describeEvents:(AWSDatabasemigrationserviceDescribeEventsMessage *)request;

/**
 <p> Lists events for a given source identifier and source type. You can also specify a start and end time. For more information on AWS DMS events, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html">Working with Events and Notifications</a> in the <i>AWS Database Migration User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the DescribeEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSDatabasemigrationserviceDescribeEventsMessage
 @see AWSDatabasemigrationserviceDescribeEventsResponse
 */
- (void)describeEvents:(AWSDatabasemigrationserviceDescribeEventsMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDescribeEventsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the replication instance types that can be created in the specified region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOrderableReplicationInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesResponse`.
 
 @see AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesMessage
 @see AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesResponse *> *)describeOrderableReplicationInstances:(AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesMessage *)request;

/**
 <p>Returns information about the replication instance types that can be created in the specified region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOrderableReplicationInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesMessage
 @see AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesResponse
 */
- (void)describeOrderableReplicationInstances:(AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>For internal use only</p>
 
 @param request A container for the necessary parameters to execute the DescribePendingMaintenanceActions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDescribePendingMaintenanceActionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDescribePendingMaintenanceActionsMessage
 @see AWSDatabasemigrationserviceDescribePendingMaintenanceActionsResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDescribePendingMaintenanceActionsResponse *> *)describePendingMaintenanceActions:(AWSDatabasemigrationserviceDescribePendingMaintenanceActionsMessage *)request;

/**
 <p>For internal use only</p>
 
 @param request A container for the necessary parameters to execute the DescribePendingMaintenanceActions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDescribePendingMaintenanceActionsMessage
 @see AWSDatabasemigrationserviceDescribePendingMaintenanceActionsResponse
 */
- (void)describePendingMaintenanceActions:(AWSDatabasemigrationserviceDescribePendingMaintenanceActionsMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDescribePendingMaintenanceActionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the status of the RefreshSchemas operation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRefreshSchemasStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDescribeRefreshSchemasStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDescribeRefreshSchemasStatusMessage
 @see AWSDatabasemigrationserviceDescribeRefreshSchemasStatusResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDescribeRefreshSchemasStatusResponse *> *)describeRefreshSchemasStatus:(AWSDatabasemigrationserviceDescribeRefreshSchemasStatusMessage *)request;

/**
 <p>Returns the status of the RefreshSchemas operation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRefreshSchemasStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDescribeRefreshSchemasStatusMessage
 @see AWSDatabasemigrationserviceDescribeRefreshSchemasStatusResponse
 */
- (void)describeRefreshSchemasStatus:(AWSDatabasemigrationserviceDescribeRefreshSchemasStatusMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDescribeRefreshSchemasStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the task logs for the specified task.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReplicationInstanceTaskLogs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInvalidResourceState`.
 
 @see AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsMessage
 @see AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsResponse *> *)describeReplicationInstanceTaskLogs:(AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsMessage *)request;

/**
 <p>Returns information about the task logs for the specified task.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReplicationInstanceTaskLogs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInvalidResourceState`.
 
 @see AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsMessage
 @see AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsResponse
 */
- (void)describeReplicationInstanceTaskLogs:(AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about replication instances for your account in the current region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReplicationInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDescribeReplicationInstancesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDescribeReplicationInstancesMessage
 @see AWSDatabasemigrationserviceDescribeReplicationInstancesResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDescribeReplicationInstancesResponse *> *)describeReplicationInstances:(AWSDatabasemigrationserviceDescribeReplicationInstancesMessage *)request;

/**
 <p>Returns information about replication instances for your account in the current region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReplicationInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDescribeReplicationInstancesMessage
 @see AWSDatabasemigrationserviceDescribeReplicationInstancesResponse
 */
- (void)describeReplicationInstances:(AWSDatabasemigrationserviceDescribeReplicationInstancesMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDescribeReplicationInstancesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the replication subnet groups.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReplicationSubnetGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsMessage
 @see AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsResponse *> *)describeReplicationSubnetGroups:(AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsMessage *)request;

/**
 <p>Returns information about the replication subnet groups.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReplicationSubnetGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsMessage
 @see AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsResponse
 */
- (void)describeReplicationSubnetGroups:(AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the task assessment results from Amazon S3. This action always returns the latest results.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReplicationTaskAssessmentResults service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsMessage
 @see AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsResponse *> *)describeReplicationTaskAssessmentResults:(AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsMessage *)request;

/**
 <p>Returns the task assessment results from Amazon S3. This action always returns the latest results.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReplicationTaskAssessmentResults service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsMessage
 @see AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsResponse
 */
- (void)describeReplicationTaskAssessmentResults:(AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about replication tasks for your account in the current region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReplicationTasks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDescribeReplicationTasksResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDescribeReplicationTasksMessage
 @see AWSDatabasemigrationserviceDescribeReplicationTasksResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDescribeReplicationTasksResponse *> *)describeReplicationTasks:(AWSDatabasemigrationserviceDescribeReplicationTasksMessage *)request;

/**
 <p>Returns information about replication tasks for your account in the current region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReplicationTasks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDescribeReplicationTasksMessage
 @see AWSDatabasemigrationserviceDescribeReplicationTasksResponse
 */
- (void)describeReplicationTasks:(AWSDatabasemigrationserviceDescribeReplicationTasksMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDescribeReplicationTasksResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the schema for the specified endpoint.</p><p/>
 
 @param request A container for the necessary parameters to execute the DescribeSchemas service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDescribeSchemasResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDescribeSchemasMessage
 @see AWSDatabasemigrationserviceDescribeSchemasResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDescribeSchemasResponse *> *)describeSchemas:(AWSDatabasemigrationserviceDescribeSchemasMessage *)request;

/**
 <p>Returns information about the schema for the specified endpoint.</p><p/>
 
 @param request A container for the necessary parameters to execute the DescribeSchemas service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceDescribeSchemasMessage
 @see AWSDatabasemigrationserviceDescribeSchemasResponse
 */
- (void)describeSchemas:(AWSDatabasemigrationserviceDescribeSchemasMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDescribeSchemasResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns table statistics on the database migration task, including table name, rows inserted, rows updated, and rows deleted.</p><p>Note that the "last updated" column the DMS console only indicates the time that AWS DMS last updated the table statistics record for a table. It does not indicate the time of the last update to the table.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTableStatistics service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceDescribeTableStatisticsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInvalidResourceState`.
 
 @see AWSDatabasemigrationserviceDescribeTableStatisticsMessage
 @see AWSDatabasemigrationserviceDescribeTableStatisticsResponse
 */
- (AWSTask<AWSDatabasemigrationserviceDescribeTableStatisticsResponse *> *)describeTableStatistics:(AWSDatabasemigrationserviceDescribeTableStatisticsMessage *)request;

/**
 <p>Returns table statistics on the database migration task, including table name, rows inserted, rows updated, and rows deleted.</p><p>Note that the "last updated" column the DMS console only indicates the time that AWS DMS last updated the table statistics record for a table. It does not indicate the time of the last update to the table.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTableStatistics service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInvalidResourceState`.
 
 @see AWSDatabasemigrationserviceDescribeTableStatisticsMessage
 @see AWSDatabasemigrationserviceDescribeTableStatisticsResponse
 */
- (void)describeTableStatistics:(AWSDatabasemigrationserviceDescribeTableStatisticsMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceDescribeTableStatisticsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Uploads the specified certificate.</p>
 
 @param request A container for the necessary parameters to execute the ImportCertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceImportCertificateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceAlreadyExists`, `AWSDatabasemigrationserviceErrorInvalidCertificate`, `AWSDatabasemigrationserviceErrorResourceQuotaExceeded`.
 
 @see AWSDatabasemigrationserviceImportCertificateMessage
 @see AWSDatabasemigrationserviceImportCertificateResponse
 */
- (AWSTask<AWSDatabasemigrationserviceImportCertificateResponse *> *)importCertificate:(AWSDatabasemigrationserviceImportCertificateMessage *)request;

/**
 <p>Uploads the specified certificate.</p>
 
 @param request A container for the necessary parameters to execute the ImportCertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceAlreadyExists`, `AWSDatabasemigrationserviceErrorInvalidCertificate`, `AWSDatabasemigrationserviceErrorResourceQuotaExceeded`.
 
 @see AWSDatabasemigrationserviceImportCertificateMessage
 @see AWSDatabasemigrationserviceImportCertificateResponse
 */
- (void)importCertificate:(AWSDatabasemigrationserviceImportCertificateMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceImportCertificateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all tags for an AWS DMS resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceListTagsForResourceMessage
 @see AWSDatabasemigrationserviceListTagsForResourceResponse
 */
- (AWSTask<AWSDatabasemigrationserviceListTagsForResourceResponse *> *)listTagsForResource:(AWSDatabasemigrationserviceListTagsForResourceMessage *)request;

/**
 <p>Lists all tags for an AWS DMS resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceListTagsForResourceMessage
 @see AWSDatabasemigrationserviceListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSDatabasemigrationserviceListTagsForResourceMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the specified endpoint.</p>
 
 @param request A container for the necessary parameters to execute the ModifyEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceModifyEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorResourceAlreadyExists`, `AWSDatabasemigrationserviceErrorKMSKeyNotAccessible`, `AWSDatabasemigrationserviceErrorAccessDenied`.
 
 @see AWSDatabasemigrationserviceModifyEndpointMessage
 @see AWSDatabasemigrationserviceModifyEndpointResponse
 */
- (AWSTask<AWSDatabasemigrationserviceModifyEndpointResponse *> *)modifyEndpoint:(AWSDatabasemigrationserviceModifyEndpointMessage *)request;

/**
 <p>Modifies the specified endpoint.</p>
 
 @param request A container for the necessary parameters to execute the ModifyEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorResourceAlreadyExists`, `AWSDatabasemigrationserviceErrorKMSKeyNotAccessible`, `AWSDatabasemigrationserviceErrorAccessDenied`.
 
 @see AWSDatabasemigrationserviceModifyEndpointMessage
 @see AWSDatabasemigrationserviceModifyEndpointResponse
 */
- (void)modifyEndpoint:(AWSDatabasemigrationserviceModifyEndpointMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceModifyEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies an existing AWS DMS event notification subscription. </p>
 
 @param request A container for the necessary parameters to execute the ModifyEventSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceModifyEventSubscriptionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceQuotaExceeded`, `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorSNSInvalidTopic`, `AWSDatabasemigrationserviceErrorSNSNoAuthorization`, `AWSDatabasemigrationserviceErrorKMSAccessDenied`, `AWSDatabasemigrationserviceErrorKMSDisabled`, `AWSDatabasemigrationserviceErrorKMSInvalidState`, `AWSDatabasemigrationserviceErrorKMSNotFound`, `AWSDatabasemigrationserviceErrorKMSThrottling`.
 
 @see AWSDatabasemigrationserviceModifyEventSubscriptionMessage
 @see AWSDatabasemigrationserviceModifyEventSubscriptionResponse
 */
- (AWSTask<AWSDatabasemigrationserviceModifyEventSubscriptionResponse *> *)modifyEventSubscription:(AWSDatabasemigrationserviceModifyEventSubscriptionMessage *)request;

/**
 <p>Modifies an existing AWS DMS event notification subscription. </p>
 
 @param request A container for the necessary parameters to execute the ModifyEventSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceQuotaExceeded`, `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorSNSInvalidTopic`, `AWSDatabasemigrationserviceErrorSNSNoAuthorization`, `AWSDatabasemigrationserviceErrorKMSAccessDenied`, `AWSDatabasemigrationserviceErrorKMSDisabled`, `AWSDatabasemigrationserviceErrorKMSInvalidState`, `AWSDatabasemigrationserviceErrorKMSNotFound`, `AWSDatabasemigrationserviceErrorKMSThrottling`.
 
 @see AWSDatabasemigrationserviceModifyEventSubscriptionMessage
 @see AWSDatabasemigrationserviceModifyEventSubscriptionResponse
 */
- (void)modifyEventSubscription:(AWSDatabasemigrationserviceModifyEventSubscriptionMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceModifyEventSubscriptionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the replication instance to apply new settings. You can change one or more parameters by specifying these parameters and the new values in the request.</p><p>Some settings are applied during the maintenance window.</p><p/>
 
 @param request A container for the necessary parameters to execute the ModifyReplicationInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceModifyReplicationInstanceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorAccessDenied`, `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorResourceAlreadyExists`, `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInsufficientResourceCapacity`, `AWSDatabasemigrationserviceErrorStorageQuotaExceeded`, `AWSDatabasemigrationserviceErrorUpgradeDependencyFailure`.
 
 @see AWSDatabasemigrationserviceModifyReplicationInstanceMessage
 @see AWSDatabasemigrationserviceModifyReplicationInstanceResponse
 */
- (AWSTask<AWSDatabasemigrationserviceModifyReplicationInstanceResponse *> *)modifyReplicationInstance:(AWSDatabasemigrationserviceModifyReplicationInstanceMessage *)request;

/**
 <p>Modifies the replication instance to apply new settings. You can change one or more parameters by specifying these parameters and the new values in the request.</p><p>Some settings are applied during the maintenance window.</p><p/>
 
 @param request A container for the necessary parameters to execute the ModifyReplicationInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorAccessDenied`, `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorResourceAlreadyExists`, `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInsufficientResourceCapacity`, `AWSDatabasemigrationserviceErrorStorageQuotaExceeded`, `AWSDatabasemigrationserviceErrorUpgradeDependencyFailure`.
 
 @see AWSDatabasemigrationserviceModifyReplicationInstanceMessage
 @see AWSDatabasemigrationserviceModifyReplicationInstanceResponse
 */
- (void)modifyReplicationInstance:(AWSDatabasemigrationserviceModifyReplicationInstanceMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceModifyReplicationInstanceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the settings for the specified replication subnet group.</p>
 
 @param request A container for the necessary parameters to execute the ModifyReplicationSubnetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceModifyReplicationSubnetGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorAccessDenied`, `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorResourceQuotaExceeded`, `AWSDatabasemigrationserviceErrorSubnetAlreadyInUse`, `AWSDatabasemigrationserviceErrorReplicationSubnetGroupDoesNotCoverEnoughAZs`, `AWSDatabasemigrationserviceErrorInvalidSubnet`.
 
 @see AWSDatabasemigrationserviceModifyReplicationSubnetGroupMessage
 @see AWSDatabasemigrationserviceModifyReplicationSubnetGroupResponse
 */
- (AWSTask<AWSDatabasemigrationserviceModifyReplicationSubnetGroupResponse *> *)modifyReplicationSubnetGroup:(AWSDatabasemigrationserviceModifyReplicationSubnetGroupMessage *)request;

/**
 <p>Modifies the settings for the specified replication subnet group.</p>
 
 @param request A container for the necessary parameters to execute the ModifyReplicationSubnetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorAccessDenied`, `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorResourceQuotaExceeded`, `AWSDatabasemigrationserviceErrorSubnetAlreadyInUse`, `AWSDatabasemigrationserviceErrorReplicationSubnetGroupDoesNotCoverEnoughAZs`, `AWSDatabasemigrationserviceErrorInvalidSubnet`.
 
 @see AWSDatabasemigrationserviceModifyReplicationSubnetGroupMessage
 @see AWSDatabasemigrationserviceModifyReplicationSubnetGroupResponse
 */
- (void)modifyReplicationSubnetGroup:(AWSDatabasemigrationserviceModifyReplicationSubnetGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceModifyReplicationSubnetGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the specified replication task.</p><p>You can't modify the task endpoints. The task must be stopped before you can modify it. </p><p>For more information about AWS DMS tasks, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.html">Working with Migration Tasks</a> in the <i>AWS Database Migration Service User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyReplicationTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceModifyReplicationTaskResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorResourceAlreadyExists`, `AWSDatabasemigrationserviceErrorKMSKeyNotAccessible`.
 
 @see AWSDatabasemigrationserviceModifyReplicationTaskMessage
 @see AWSDatabasemigrationserviceModifyReplicationTaskResponse
 */
- (AWSTask<AWSDatabasemigrationserviceModifyReplicationTaskResponse *> *)modifyReplicationTask:(AWSDatabasemigrationserviceModifyReplicationTaskMessage *)request;

/**
 <p>Modifies the specified replication task.</p><p>You can't modify the task endpoints. The task must be stopped before you can modify it. </p><p>For more information about AWS DMS tasks, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.html">Working with Migration Tasks</a> in the <i>AWS Database Migration Service User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyReplicationTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorResourceAlreadyExists`, `AWSDatabasemigrationserviceErrorKMSKeyNotAccessible`.
 
 @see AWSDatabasemigrationserviceModifyReplicationTaskMessage
 @see AWSDatabasemigrationserviceModifyReplicationTaskResponse
 */
- (void)modifyReplicationTask:(AWSDatabasemigrationserviceModifyReplicationTaskMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceModifyReplicationTaskResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Reboots a replication instance. Rebooting results in a momentary outage, until the replication instance becomes available again.</p>
 
 @param request A container for the necessary parameters to execute the RebootReplicationInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceRebootReplicationInstanceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInvalidResourceState`.
 
 @see AWSDatabasemigrationserviceRebootReplicationInstanceMessage
 @see AWSDatabasemigrationserviceRebootReplicationInstanceResponse
 */
- (AWSTask<AWSDatabasemigrationserviceRebootReplicationInstanceResponse *> *)rebootReplicationInstance:(AWSDatabasemigrationserviceRebootReplicationInstanceMessage *)request;

/**
 <p>Reboots a replication instance. Rebooting results in a momentary outage, until the replication instance becomes available again.</p>
 
 @param request A container for the necessary parameters to execute the RebootReplicationInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInvalidResourceState`.
 
 @see AWSDatabasemigrationserviceRebootReplicationInstanceMessage
 @see AWSDatabasemigrationserviceRebootReplicationInstanceResponse
 */
- (void)rebootReplicationInstance:(AWSDatabasemigrationserviceRebootReplicationInstanceMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceRebootReplicationInstanceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Populates the schema for the specified endpoint. This is an asynchronous operation and can take several minutes. You can check the status of this operation by calling the DescribeRefreshSchemasStatus operation.</p>
 
 @param request A container for the necessary parameters to execute the RefreshSchemas service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceRefreshSchemasResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorKMSKeyNotAccessible`, `AWSDatabasemigrationserviceErrorResourceQuotaExceeded`.
 
 @see AWSDatabasemigrationserviceRefreshSchemasMessage
 @see AWSDatabasemigrationserviceRefreshSchemasResponse
 */
- (AWSTask<AWSDatabasemigrationserviceRefreshSchemasResponse *> *)refreshSchemas:(AWSDatabasemigrationserviceRefreshSchemasMessage *)request;

/**
 <p>Populates the schema for the specified endpoint. This is an asynchronous operation and can take several minutes. You can check the status of this operation by calling the DescribeRefreshSchemasStatus operation.</p>
 
 @param request A container for the necessary parameters to execute the RefreshSchemas service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorKMSKeyNotAccessible`, `AWSDatabasemigrationserviceErrorResourceQuotaExceeded`.
 
 @see AWSDatabasemigrationserviceRefreshSchemasMessage
 @see AWSDatabasemigrationserviceRefreshSchemasResponse
 */
- (void)refreshSchemas:(AWSDatabasemigrationserviceRefreshSchemasMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceRefreshSchemasResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Reloads the target database table with the source data. </p>
 
 @param request A container for the necessary parameters to execute the ReloadTables service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceReloadTablesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInvalidResourceState`.
 
 @see AWSDatabasemigrationserviceReloadTablesMessage
 @see AWSDatabasemigrationserviceReloadTablesResponse
 */
- (AWSTask<AWSDatabasemigrationserviceReloadTablesResponse *> *)reloadTables:(AWSDatabasemigrationserviceReloadTablesMessage *)request;

/**
 <p>Reloads the target database table with the source data. </p>
 
 @param request A container for the necessary parameters to execute the ReloadTables service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInvalidResourceState`.
 
 @see AWSDatabasemigrationserviceReloadTablesMessage
 @see AWSDatabasemigrationserviceReloadTablesResponse
 */
- (void)reloadTables:(AWSDatabasemigrationserviceReloadTablesMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceReloadTablesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes metadata tags from a DMS resource.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTagsFromResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceRemoveTagsFromResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceRemoveTagsFromResourceMessage
 @see AWSDatabasemigrationserviceRemoveTagsFromResourceResponse
 */
- (AWSTask<AWSDatabasemigrationserviceRemoveTagsFromResourceResponse *> *)removeTagsFromResource:(AWSDatabasemigrationserviceRemoveTagsFromResourceMessage *)request;

/**
 <p>Removes metadata tags from a DMS resource.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTagsFromResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceRemoveTagsFromResourceMessage
 @see AWSDatabasemigrationserviceRemoveTagsFromResourceResponse
 */
- (void)removeTagsFromResource:(AWSDatabasemigrationserviceRemoveTagsFromResourceMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceRemoveTagsFromResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts the replication task.</p><p>For more information about AWS DMS tasks, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.html">Working with Migration Tasks </a> in the <i>AWS Database Migration Service User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the StartReplicationTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceStartReplicationTaskResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorAccessDenied`.
 
 @see AWSDatabasemigrationserviceStartReplicationTaskMessage
 @see AWSDatabasemigrationserviceStartReplicationTaskResponse
 */
- (AWSTask<AWSDatabasemigrationserviceStartReplicationTaskResponse *> *)startReplicationTask:(AWSDatabasemigrationserviceStartReplicationTaskMessage *)request;

/**
 <p>Starts the replication task.</p><p>For more information about AWS DMS tasks, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.html">Working with Migration Tasks </a> in the <i>AWS Database Migration Service User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the StartReplicationTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorAccessDenied`.
 
 @see AWSDatabasemigrationserviceStartReplicationTaskMessage
 @see AWSDatabasemigrationserviceStartReplicationTaskResponse
 */
- (void)startReplicationTask:(AWSDatabasemigrationserviceStartReplicationTaskMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceStartReplicationTaskResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Starts the replication task assessment for unsupported data types in the source database. </p>
 
 @param request A container for the necessary parameters to execute the StartReplicationTaskAssessment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceStartReplicationTaskAssessmentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceStartReplicationTaskAssessmentMessage
 @see AWSDatabasemigrationserviceStartReplicationTaskAssessmentResponse
 */
- (AWSTask<AWSDatabasemigrationserviceStartReplicationTaskAssessmentResponse *> *)startReplicationTaskAssessment:(AWSDatabasemigrationserviceStartReplicationTaskAssessmentMessage *)request;

/**
 <p> Starts the replication task assessment for unsupported data types in the source database. </p>
 
 @param request A container for the necessary parameters to execute the StartReplicationTaskAssessment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorResourceNotFound`.
 
 @see AWSDatabasemigrationserviceStartReplicationTaskAssessmentMessage
 @see AWSDatabasemigrationserviceStartReplicationTaskAssessmentResponse
 */
- (void)startReplicationTaskAssessment:(AWSDatabasemigrationserviceStartReplicationTaskAssessmentMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceStartReplicationTaskAssessmentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops the replication task.</p><p/>
 
 @param request A container for the necessary parameters to execute the StopReplicationTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceStopReplicationTaskResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInvalidResourceState`.
 
 @see AWSDatabasemigrationserviceStopReplicationTaskMessage
 @see AWSDatabasemigrationserviceStopReplicationTaskResponse
 */
- (AWSTask<AWSDatabasemigrationserviceStopReplicationTaskResponse *> *)stopReplicationTask:(AWSDatabasemigrationserviceStopReplicationTaskMessage *)request;

/**
 <p>Stops the replication task.</p><p/>
 
 @param request A container for the necessary parameters to execute the StopReplicationTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInvalidResourceState`.
 
 @see AWSDatabasemigrationserviceStopReplicationTaskMessage
 @see AWSDatabasemigrationserviceStopReplicationTaskResponse
 */
- (void)stopReplicationTask:(AWSDatabasemigrationserviceStopReplicationTaskMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceStopReplicationTaskResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Tests the connection between the replication instance and the endpoint.</p>
 
 @param request A container for the necessary parameters to execute the TestConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDatabasemigrationserviceTestConnectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorKMSKeyNotAccessible`, `AWSDatabasemigrationserviceErrorResourceQuotaExceeded`.
 
 @see AWSDatabasemigrationserviceTestConnectionMessage
 @see AWSDatabasemigrationserviceTestConnectionResponse
 */
- (AWSTask<AWSDatabasemigrationserviceTestConnectionResponse *> *)testConnection:(AWSDatabasemigrationserviceTestConnectionMessage *)request;

/**
 <p>Tests the connection between the replication instance and the endpoint.</p>
 
 @param request A container for the necessary parameters to execute the TestConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDatabasemigrationserviceErrorDomain` domain and the following error code: `AWSDatabasemigrationserviceErrorResourceNotFound`, `AWSDatabasemigrationserviceErrorInvalidResourceState`, `AWSDatabasemigrationserviceErrorKMSKeyNotAccessible`, `AWSDatabasemigrationserviceErrorResourceQuotaExceeded`.
 
 @see AWSDatabasemigrationserviceTestConnectionMessage
 @see AWSDatabasemigrationserviceTestConnectionResponse
 */
- (void)testConnection:(AWSDatabasemigrationserviceTestConnectionMessage *)request completionHandler:(void (^ _Nullable)(AWSDatabasemigrationserviceTestConnectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
