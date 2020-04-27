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
#import "AWSdmsModel.h"
#import "AWSdmsResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSdms
FOUNDATION_EXPORT NSString *const AWSdmsSDKVersion;

/**
 <fullname>AWS Database Migration Service</fullname><p>AWS Database Migration Service (AWS DMS) can migrate your data to and from the most widely used commercial and open-source databases such as Oracle, PostgreSQL, Microsoft SQL Server, Amazon Redshift, MariaDB, Amazon Aurora, MySQL, and SAP Adaptive Server Enterprise (ASE). The service supports homogeneous migrations such as Oracle to Oracle, as well as heterogeneous migrations between different database platforms, such as Oracle to MySQL or SQL Server to PostgreSQL.</p><p>For more information about AWS DMS, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/Welcome.html">What Is AWS Database Migration Service?</a> in the <i>AWS Database Migration User Guide.</i></p>
 */
@interface AWSdms : AWSService

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

     let dms = AWSdms.default()

 *Objective-C*

     AWSdms *dms = [AWSdms defaultdms];

 @return The default service client.
 */
+ (instancetype)defaultdms;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSdms.register(with: configuration!, forKey: "USWest2dms")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSdms registerdmsWithConfiguration:configuration forKey:@"USWest2dms"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let dms = AWSdms(forKey: "USWest2dms")

 *Objective-C*

     AWSdms *dms = [AWSdms dmsForKey:@"USWest2dms"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerdmsWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerdmsWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSdms.register(with: configuration!, forKey: "USWest2dms")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSdms registerdmsWithConfiguration:configuration forKey:@"USWest2dms"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let dms = AWSdms(forKey: "USWest2dms")

 *Objective-C*

     AWSdms *dms = [AWSdms dmsForKey:@"USWest2dms"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)dmsForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removedmsForKey:(NSString *)key;

/**
 <p>Adds metadata tags to an AWS DMS resource, including replication instance, endpoint, security group, and migration task. These tags can also be used with cost allocation reporting to track cost associated with DMS resources, or used in a Condition statement in an IAM policy for DMS.</p>
 
 @param request A container for the necessary parameters to execute the AddTagsToResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsAddTagsToResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsAddTagsToResourceMessage
 @see AWSdmsAddTagsToResourceResponse
 */
- (AWSTask<AWSdmsAddTagsToResourceResponse *> *)addTagsToResource:(AWSdmsAddTagsToResourceMessage *)request;

/**
 <p>Adds metadata tags to an AWS DMS resource, including replication instance, endpoint, security group, and migration task. These tags can also be used with cost allocation reporting to track cost associated with DMS resources, or used in a Condition statement in an IAM policy for DMS.</p>
 
 @param request A container for the necessary parameters to execute the AddTagsToResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsAddTagsToResourceMessage
 @see AWSdmsAddTagsToResourceResponse
 */
- (void)addTagsToResource:(AWSdmsAddTagsToResourceMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsAddTagsToResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Applies a pending maintenance action to a resource (for example, to a replication instance).</p>
 
 @param request A container for the necessary parameters to execute the ApplyPendingMaintenanceAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsApplyPendingMaintenanceActionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsApplyPendingMaintenanceActionMessage
 @see AWSdmsApplyPendingMaintenanceActionResponse
 */
- (AWSTask<AWSdmsApplyPendingMaintenanceActionResponse *> *)applyPendingMaintenanceAction:(AWSdmsApplyPendingMaintenanceActionMessage *)request;

/**
 <p>Applies a pending maintenance action to a resource (for example, to a replication instance).</p>
 
 @param request A container for the necessary parameters to execute the ApplyPendingMaintenanceAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsApplyPendingMaintenanceActionMessage
 @see AWSdmsApplyPendingMaintenanceActionResponse
 */
- (void)applyPendingMaintenanceAction:(AWSdmsApplyPendingMaintenanceActionMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsApplyPendingMaintenanceActionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an endpoint using the provided settings.</p>
 
 @param request A container for the necessary parameters to execute the CreateEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsCreateEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorKMSKeyNotAccessible`, `AWSdmsErrorResourceAlreadyExists`, `AWSdmsErrorResourceQuotaExceeded`, `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorResourceNotFound`, `AWSdmsErrorAccessDenied`.
 
 @see AWSdmsCreateEndpointMessage
 @see AWSdmsCreateEndpointResponse
 */
- (AWSTask<AWSdmsCreateEndpointResponse *> *)createEndpoint:(AWSdmsCreateEndpointMessage *)request;

/**
 <p>Creates an endpoint using the provided settings.</p>
 
 @param request A container for the necessary parameters to execute the CreateEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorKMSKeyNotAccessible`, `AWSdmsErrorResourceAlreadyExists`, `AWSdmsErrorResourceQuotaExceeded`, `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorResourceNotFound`, `AWSdmsErrorAccessDenied`.
 
 @see AWSdmsCreateEndpointMessage
 @see AWSdmsCreateEndpointResponse
 */
- (void)createEndpoint:(AWSdmsCreateEndpointMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsCreateEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Creates an AWS DMS event notification subscription. </p><p>You can specify the type of source (<code>SourceType</code>) you want to be notified of, provide a list of AWS DMS source IDs (<code>SourceIds</code>) that triggers the events, and provide a list of event categories (<code>EventCategories</code>) for events you want to be notified of. If you specify both the <code>SourceType</code> and <code>SourceIds</code>, such as <code>SourceType = replication-instance</code> and <code>SourceIdentifier = my-replinstance</code>, you will be notified of all the replication instance events for the specified source. If you specify a <code>SourceType</code> but don't specify a <code>SourceIdentifier</code>, you receive notice of the events for that source type for all your AWS DMS sources. If you don't specify either <code>SourceType</code> nor <code>SourceIdentifier</code>, you will be notified of events generated from all AWS DMS sources belonging to your customer account.</p><p>For more information about AWS DMS events, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html">Working with Events and Notifications</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the CreateEventSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsCreateEventSubscriptionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceQuotaExceeded`, `AWSdmsErrorResourceNotFound`, `AWSdmsErrorResourceAlreadyExists`, `AWSdmsErrorSNSInvalidTopic`, `AWSdmsErrorSNSNoAuthorization`, `AWSdmsErrorKMSAccessDenied`, `AWSdmsErrorKMSDisabled`, `AWSdmsErrorKMSInvalidState`, `AWSdmsErrorKMSNotFound`, `AWSdmsErrorKMSThrottling`.
 
 @see AWSdmsCreateEventSubscriptionMessage
 @see AWSdmsCreateEventSubscriptionResponse
 */
- (AWSTask<AWSdmsCreateEventSubscriptionResponse *> *)createEventSubscription:(AWSdmsCreateEventSubscriptionMessage *)request;

/**
 <p> Creates an AWS DMS event notification subscription. </p><p>You can specify the type of source (<code>SourceType</code>) you want to be notified of, provide a list of AWS DMS source IDs (<code>SourceIds</code>) that triggers the events, and provide a list of event categories (<code>EventCategories</code>) for events you want to be notified of. If you specify both the <code>SourceType</code> and <code>SourceIds</code>, such as <code>SourceType = replication-instance</code> and <code>SourceIdentifier = my-replinstance</code>, you will be notified of all the replication instance events for the specified source. If you specify a <code>SourceType</code> but don't specify a <code>SourceIdentifier</code>, you receive notice of the events for that source type for all your AWS DMS sources. If you don't specify either <code>SourceType</code> nor <code>SourceIdentifier</code>, you will be notified of events generated from all AWS DMS sources belonging to your customer account.</p><p>For more information about AWS DMS events, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html">Working with Events and Notifications</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the CreateEventSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceQuotaExceeded`, `AWSdmsErrorResourceNotFound`, `AWSdmsErrorResourceAlreadyExists`, `AWSdmsErrorSNSInvalidTopic`, `AWSdmsErrorSNSNoAuthorization`, `AWSdmsErrorKMSAccessDenied`, `AWSdmsErrorKMSDisabled`, `AWSdmsErrorKMSInvalidState`, `AWSdmsErrorKMSNotFound`, `AWSdmsErrorKMSThrottling`.
 
 @see AWSdmsCreateEventSubscriptionMessage
 @see AWSdmsCreateEventSubscriptionResponse
 */
- (void)createEventSubscription:(AWSdmsCreateEventSubscriptionMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsCreateEventSubscriptionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates the replication instance using the specified parameters.</p><p>AWS DMS requires that your account have certain roles with appropriate permissions before you can create a replication instance. For information on the required roles, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.APIRole.html">Creating the IAM Roles to Use With the AWS CLI and AWS DMS API</a>. For information on the required permissions, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.IAMPermissions.html">IAM Permissions Needed to Use AWS DMS</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateReplicationInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsCreateReplicationInstanceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorAccessDenied`, `AWSdmsErrorResourceAlreadyExists`, `AWSdmsErrorInsufficientResourceCapacity`, `AWSdmsErrorResourceQuotaExceeded`, `AWSdmsErrorStorageQuotaExceeded`, `AWSdmsErrorResourceNotFound`, `AWSdmsErrorReplicationSubnetGroupDoesNotCoverEnoughAZs`, `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorInvalidSubnet`, `AWSdmsErrorKMSKeyNotAccessible`.
 
 @see AWSdmsCreateReplicationInstanceMessage
 @see AWSdmsCreateReplicationInstanceResponse
 */
- (AWSTask<AWSdmsCreateReplicationInstanceResponse *> *)createReplicationInstance:(AWSdmsCreateReplicationInstanceMessage *)request;

/**
 <p>Creates the replication instance using the specified parameters.</p><p>AWS DMS requires that your account have certain roles with appropriate permissions before you can create a replication instance. For information on the required roles, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.APIRole.html">Creating the IAM Roles to Use With the AWS CLI and AWS DMS API</a>. For information on the required permissions, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.IAMPermissions.html">IAM Permissions Needed to Use AWS DMS</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateReplicationInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorAccessDenied`, `AWSdmsErrorResourceAlreadyExists`, `AWSdmsErrorInsufficientResourceCapacity`, `AWSdmsErrorResourceQuotaExceeded`, `AWSdmsErrorStorageQuotaExceeded`, `AWSdmsErrorResourceNotFound`, `AWSdmsErrorReplicationSubnetGroupDoesNotCoverEnoughAZs`, `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorInvalidSubnet`, `AWSdmsErrorKMSKeyNotAccessible`.
 
 @see AWSdmsCreateReplicationInstanceMessage
 @see AWSdmsCreateReplicationInstanceResponse
 */
- (void)createReplicationInstance:(AWSdmsCreateReplicationInstanceMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsCreateReplicationInstanceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a replication subnet group given a list of the subnet IDs in a VPC.</p>
 
 @param request A container for the necessary parameters to execute the CreateReplicationSubnetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsCreateReplicationSubnetGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorAccessDenied`, `AWSdmsErrorResourceAlreadyExists`, `AWSdmsErrorResourceNotFound`, `AWSdmsErrorResourceQuotaExceeded`, `AWSdmsErrorReplicationSubnetGroupDoesNotCoverEnoughAZs`, `AWSdmsErrorInvalidSubnet`.
 
 @see AWSdmsCreateReplicationSubnetGroupMessage
 @see AWSdmsCreateReplicationSubnetGroupResponse
 */
- (AWSTask<AWSdmsCreateReplicationSubnetGroupResponse *> *)createReplicationSubnetGroup:(AWSdmsCreateReplicationSubnetGroupMessage *)request;

/**
 <p>Creates a replication subnet group given a list of the subnet IDs in a VPC.</p>
 
 @param request A container for the necessary parameters to execute the CreateReplicationSubnetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorAccessDenied`, `AWSdmsErrorResourceAlreadyExists`, `AWSdmsErrorResourceNotFound`, `AWSdmsErrorResourceQuotaExceeded`, `AWSdmsErrorReplicationSubnetGroupDoesNotCoverEnoughAZs`, `AWSdmsErrorInvalidSubnet`.
 
 @see AWSdmsCreateReplicationSubnetGroupMessage
 @see AWSdmsCreateReplicationSubnetGroupResponse
 */
- (void)createReplicationSubnetGroup:(AWSdmsCreateReplicationSubnetGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsCreateReplicationSubnetGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a replication task using the specified parameters.</p>
 
 @param request A container for the necessary parameters to execute the CreateReplicationTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsCreateReplicationTaskResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorAccessDenied`, `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorResourceAlreadyExists`, `AWSdmsErrorResourceNotFound`, `AWSdmsErrorKMSKeyNotAccessible`, `AWSdmsErrorResourceQuotaExceeded`.
 
 @see AWSdmsCreateReplicationTaskMessage
 @see AWSdmsCreateReplicationTaskResponse
 */
- (AWSTask<AWSdmsCreateReplicationTaskResponse *> *)createReplicationTask:(AWSdmsCreateReplicationTaskMessage *)request;

/**
 <p>Creates a replication task using the specified parameters.</p>
 
 @param request A container for the necessary parameters to execute the CreateReplicationTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorAccessDenied`, `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorResourceAlreadyExists`, `AWSdmsErrorResourceNotFound`, `AWSdmsErrorKMSKeyNotAccessible`, `AWSdmsErrorResourceQuotaExceeded`.
 
 @see AWSdmsCreateReplicationTaskMessage
 @see AWSdmsCreateReplicationTaskResponse
 */
- (void)createReplicationTask:(AWSdmsCreateReplicationTaskMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsCreateReplicationTaskResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified certificate. </p>
 
 @param request A container for the necessary parameters to execute the DeleteCertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDeleteCertificateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInvalidResourceState`.
 
 @see AWSdmsDeleteCertificateMessage
 @see AWSdmsDeleteCertificateResponse
 */
- (AWSTask<AWSdmsDeleteCertificateResponse *> *)deleteCertificate:(AWSdmsDeleteCertificateMessage *)request;

/**
 <p>Deletes the specified certificate. </p>
 
 @param request A container for the necessary parameters to execute the DeleteCertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInvalidResourceState`.
 
 @see AWSdmsDeleteCertificateMessage
 @see AWSdmsDeleteCertificateResponse
 */
- (void)deleteCertificate:(AWSdmsDeleteCertificateMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDeleteCertificateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the connection between a replication instance and an endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDeleteConnectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorAccessDenied`, `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInvalidResourceState`.
 
 @see AWSdmsDeleteConnectionMessage
 @see AWSdmsDeleteConnectionResponse
 */
- (AWSTask<AWSdmsDeleteConnectionResponse *> *)deleteConnection:(AWSdmsDeleteConnectionMessage *)request;

/**
 <p>Deletes the connection between a replication instance and an endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorAccessDenied`, `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInvalidResourceState`.
 
 @see AWSdmsDeleteConnectionMessage
 @see AWSdmsDeleteConnectionResponse
 */
- (void)deleteConnection:(AWSdmsDeleteConnectionMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDeleteConnectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified endpoint.</p><note><p>All tasks associated with the endpoint must be deleted before you can delete the endpoint.</p></note><p/>
 
 @param request A container for the necessary parameters to execute the DeleteEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDeleteEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInvalidResourceState`.
 
 @see AWSdmsDeleteEndpointMessage
 @see AWSdmsDeleteEndpointResponse
 */
- (AWSTask<AWSdmsDeleteEndpointResponse *> *)deleteEndpoint:(AWSdmsDeleteEndpointMessage *)request;

/**
 <p>Deletes the specified endpoint.</p><note><p>All tasks associated with the endpoint must be deleted before you can delete the endpoint.</p></note><p/>
 
 @param request A container for the necessary parameters to execute the DeleteEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInvalidResourceState`.
 
 @see AWSdmsDeleteEndpointMessage
 @see AWSdmsDeleteEndpointResponse
 */
- (void)deleteEndpoint:(AWSdmsDeleteEndpointMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDeleteEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes an AWS DMS event subscription. </p>
 
 @param request A container for the necessary parameters to execute the DeleteEventSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDeleteEventSubscriptionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInvalidResourceState`.
 
 @see AWSdmsDeleteEventSubscriptionMessage
 @see AWSdmsDeleteEventSubscriptionResponse
 */
- (AWSTask<AWSdmsDeleteEventSubscriptionResponse *> *)deleteEventSubscription:(AWSdmsDeleteEventSubscriptionMessage *)request;

/**
 <p> Deletes an AWS DMS event subscription. </p>
 
 @param request A container for the necessary parameters to execute the DeleteEventSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInvalidResourceState`.
 
 @see AWSdmsDeleteEventSubscriptionMessage
 @see AWSdmsDeleteEventSubscriptionResponse
 */
- (void)deleteEventSubscription:(AWSdmsDeleteEventSubscriptionMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDeleteEventSubscriptionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified replication instance.</p><note><p>You must delete any migration tasks that are associated with the replication instance before you can delete it.</p></note><p/>
 
 @param request A container for the necessary parameters to execute the DeleteReplicationInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDeleteReplicationInstanceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDeleteReplicationInstanceMessage
 @see AWSdmsDeleteReplicationInstanceResponse
 */
- (AWSTask<AWSdmsDeleteReplicationInstanceResponse *> *)deleteReplicationInstance:(AWSdmsDeleteReplicationInstanceMessage *)request;

/**
 <p>Deletes the specified replication instance.</p><note><p>You must delete any migration tasks that are associated with the replication instance before you can delete it.</p></note><p/>
 
 @param request A container for the necessary parameters to execute the DeleteReplicationInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDeleteReplicationInstanceMessage
 @see AWSdmsDeleteReplicationInstanceResponse
 */
- (void)deleteReplicationInstance:(AWSdmsDeleteReplicationInstanceMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDeleteReplicationInstanceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a subnet group.</p>
 
 @param request A container for the necessary parameters to execute the DeleteReplicationSubnetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDeleteReplicationSubnetGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDeleteReplicationSubnetGroupMessage
 @see AWSdmsDeleteReplicationSubnetGroupResponse
 */
- (AWSTask<AWSdmsDeleteReplicationSubnetGroupResponse *> *)deleteReplicationSubnetGroup:(AWSdmsDeleteReplicationSubnetGroupMessage *)request;

/**
 <p>Deletes a subnet group.</p>
 
 @param request A container for the necessary parameters to execute the DeleteReplicationSubnetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDeleteReplicationSubnetGroupMessage
 @see AWSdmsDeleteReplicationSubnetGroupResponse
 */
- (void)deleteReplicationSubnetGroup:(AWSdmsDeleteReplicationSubnetGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDeleteReplicationSubnetGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified replication task.</p>
 
 @param request A container for the necessary parameters to execute the DeleteReplicationTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDeleteReplicationTaskResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInvalidResourceState`.
 
 @see AWSdmsDeleteReplicationTaskMessage
 @see AWSdmsDeleteReplicationTaskResponse
 */
- (AWSTask<AWSdmsDeleteReplicationTaskResponse *> *)deleteReplicationTask:(AWSdmsDeleteReplicationTaskMessage *)request;

/**
 <p>Deletes the specified replication task.</p>
 
 @param request A container for the necessary parameters to execute the DeleteReplicationTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInvalidResourceState`.
 
 @see AWSdmsDeleteReplicationTaskMessage
 @see AWSdmsDeleteReplicationTaskResponse
 */
- (void)deleteReplicationTask:(AWSdmsDeleteReplicationTaskMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDeleteReplicationTaskResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all of the AWS DMS attributes for a customer account. These attributes include AWS DMS quotas for the account and a unique account identifier in a particular DMS region. DMS quotas include a list of resource quotas supported by the account, such as the number of replication instances allowed. The description for each resource quota, includes the quota name, current usage toward that quota, and the quota's maximum value. DMS uses the unique account identifier to name each artifact used by DMS in the given region.</p><p>This command does not take any parameters.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccountAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDescribeAccountAttributesResponse`.
 
 @see AWSdmsDescribeAccountAttributesMessage
 @see AWSdmsDescribeAccountAttributesResponse
 */
- (AWSTask<AWSdmsDescribeAccountAttributesResponse *> *)describeAccountAttributes:(AWSdmsDescribeAccountAttributesMessage *)request;

/**
 <p>Lists all of the AWS DMS attributes for a customer account. These attributes include AWS DMS quotas for the account and a unique account identifier in a particular DMS region. DMS quotas include a list of resource quotas supported by the account, such as the number of replication instances allowed. The description for each resource quota, includes the quota name, current usage toward that quota, and the quota's maximum value. DMS uses the unique account identifier to name each artifact used by DMS in the given region.</p><p>This command does not take any parameters.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccountAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSdmsDescribeAccountAttributesMessage
 @see AWSdmsDescribeAccountAttributesResponse
 */
- (void)describeAccountAttributes:(AWSdmsDescribeAccountAttributesMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDescribeAccountAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a description of the certificate.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCertificates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDescribeCertificatesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDescribeCertificatesMessage
 @see AWSdmsDescribeCertificatesResponse
 */
- (AWSTask<AWSdmsDescribeCertificatesResponse *> *)describeCertificates:(AWSdmsDescribeCertificatesMessage *)request;

/**
 <p>Provides a description of the certificate.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCertificates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDescribeCertificatesMessage
 @see AWSdmsDescribeCertificatesResponse
 */
- (void)describeCertificates:(AWSdmsDescribeCertificatesMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDescribeCertificatesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the status of the connections that have been made between the replication instance and an endpoint. Connections are created when you test an endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DescribeConnections service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDescribeConnectionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDescribeConnectionsMessage
 @see AWSdmsDescribeConnectionsResponse
 */
- (AWSTask<AWSdmsDescribeConnectionsResponse *> *)describeConnections:(AWSdmsDescribeConnectionsMessage *)request;

/**
 <p>Describes the status of the connections that have been made between the replication instance and an endpoint. Connections are created when you test an endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DescribeConnections service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDescribeConnectionsMessage
 @see AWSdmsDescribeConnectionsResponse
 */
- (void)describeConnections:(AWSdmsDescribeConnectionsMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDescribeConnectionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the type of endpoints available.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpointTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDescribeEndpointTypesResponse`.
 
 @see AWSdmsDescribeEndpointTypesMessage
 @see AWSdmsDescribeEndpointTypesResponse
 */
- (AWSTask<AWSdmsDescribeEndpointTypesResponse *> *)describeEndpointTypes:(AWSdmsDescribeEndpointTypesMessage *)request;

/**
 <p>Returns information about the type of endpoints available.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpointTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSdmsDescribeEndpointTypesMessage
 @see AWSdmsDescribeEndpointTypesResponse
 */
- (void)describeEndpointTypes:(AWSdmsDescribeEndpointTypesMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDescribeEndpointTypesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the endpoints for your account in the current region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDescribeEndpointsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDescribeEndpointsMessage
 @see AWSdmsDescribeEndpointsResponse
 */
- (AWSTask<AWSdmsDescribeEndpointsResponse *> *)describeEndpoints:(AWSdmsDescribeEndpointsMessage *)request;

/**
 <p>Returns information about the endpoints for your account in the current region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDescribeEndpointsMessage
 @see AWSdmsDescribeEndpointsResponse
 */
- (void)describeEndpoints:(AWSdmsDescribeEndpointsMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDescribeEndpointsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists categories for all event source types, or, if specified, for a specified source type. You can see a list of the event categories and source types in <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html">Working with Events and Notifications</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the DescribeEventCategories service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDescribeEventCategoriesResponse`.
 
 @see AWSdmsDescribeEventCategoriesMessage
 @see AWSdmsDescribeEventCategoriesResponse
 */
- (AWSTask<AWSdmsDescribeEventCategoriesResponse *> *)describeEventCategories:(AWSdmsDescribeEventCategoriesMessage *)request;

/**
 <p>Lists categories for all event source types, or, if specified, for a specified source type. You can see a list of the event categories and source types in <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html">Working with Events and Notifications</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the DescribeEventCategories service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSdmsDescribeEventCategoriesMessage
 @see AWSdmsDescribeEventCategoriesResponse
 */
- (void)describeEventCategories:(AWSdmsDescribeEventCategoriesMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDescribeEventCategoriesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the event subscriptions for a customer account. The description of a subscription includes <code>SubscriptionName</code>, <code>SNSTopicARN</code>, <code>CustomerID</code>, <code>SourceType</code>, <code>SourceID</code>, <code>CreationTime</code>, and <code>Status</code>. </p><p>If you specify <code>SubscriptionName</code>, this action lists the description for that subscription.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEventSubscriptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDescribeEventSubscriptionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDescribeEventSubscriptionsMessage
 @see AWSdmsDescribeEventSubscriptionsResponse
 */
- (AWSTask<AWSdmsDescribeEventSubscriptionsResponse *> *)describeEventSubscriptions:(AWSdmsDescribeEventSubscriptionsMessage *)request;

/**
 <p>Lists all the event subscriptions for a customer account. The description of a subscription includes <code>SubscriptionName</code>, <code>SNSTopicARN</code>, <code>CustomerID</code>, <code>SourceType</code>, <code>SourceID</code>, <code>CreationTime</code>, and <code>Status</code>. </p><p>If you specify <code>SubscriptionName</code>, this action lists the description for that subscription.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEventSubscriptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDescribeEventSubscriptionsMessage
 @see AWSdmsDescribeEventSubscriptionsResponse
 */
- (void)describeEventSubscriptions:(AWSdmsDescribeEventSubscriptionsMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDescribeEventSubscriptionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Lists events for a given source identifier and source type. You can also specify a start and end time. For more information on AWS DMS events, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html">Working with Events and Notifications</a> in the <i>AWS Database Migration User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the DescribeEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDescribeEventsResponse`.
 
 @see AWSdmsDescribeEventsMessage
 @see AWSdmsDescribeEventsResponse
 */
- (AWSTask<AWSdmsDescribeEventsResponse *> *)describeEvents:(AWSdmsDescribeEventsMessage *)request;

/**
 <p> Lists events for a given source identifier and source type. You can also specify a start and end time. For more information on AWS DMS events, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html">Working with Events and Notifications</a> in the <i>AWS Database Migration User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the DescribeEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSdmsDescribeEventsMessage
 @see AWSdmsDescribeEventsResponse
 */
- (void)describeEvents:(AWSdmsDescribeEventsMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDescribeEventsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the replication instance types that can be created in the specified region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOrderableReplicationInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDescribeOrderableReplicationInstancesResponse`.
 
 @see AWSdmsDescribeOrderableReplicationInstancesMessage
 @see AWSdmsDescribeOrderableReplicationInstancesResponse
 */
- (AWSTask<AWSdmsDescribeOrderableReplicationInstancesResponse *> *)describeOrderableReplicationInstances:(AWSdmsDescribeOrderableReplicationInstancesMessage *)request;

/**
 <p>Returns information about the replication instance types that can be created in the specified region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOrderableReplicationInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSdmsDescribeOrderableReplicationInstancesMessage
 @see AWSdmsDescribeOrderableReplicationInstancesResponse
 */
- (void)describeOrderableReplicationInstances:(AWSdmsDescribeOrderableReplicationInstancesMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDescribeOrderableReplicationInstancesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>For internal use only</p>
 
 @param request A container for the necessary parameters to execute the DescribePendingMaintenanceActions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDescribePendingMaintenanceActionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDescribePendingMaintenanceActionsMessage
 @see AWSdmsDescribePendingMaintenanceActionsResponse
 */
- (AWSTask<AWSdmsDescribePendingMaintenanceActionsResponse *> *)describePendingMaintenanceActions:(AWSdmsDescribePendingMaintenanceActionsMessage *)request;

/**
 <p>For internal use only</p>
 
 @param request A container for the necessary parameters to execute the DescribePendingMaintenanceActions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDescribePendingMaintenanceActionsMessage
 @see AWSdmsDescribePendingMaintenanceActionsResponse
 */
- (void)describePendingMaintenanceActions:(AWSdmsDescribePendingMaintenanceActionsMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDescribePendingMaintenanceActionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the status of the RefreshSchemas operation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRefreshSchemasStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDescribeRefreshSchemasStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDescribeRefreshSchemasStatusMessage
 @see AWSdmsDescribeRefreshSchemasStatusResponse
 */
- (AWSTask<AWSdmsDescribeRefreshSchemasStatusResponse *> *)describeRefreshSchemasStatus:(AWSdmsDescribeRefreshSchemasStatusMessage *)request;

/**
 <p>Returns the status of the RefreshSchemas operation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRefreshSchemasStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDescribeRefreshSchemasStatusMessage
 @see AWSdmsDescribeRefreshSchemasStatusResponse
 */
- (void)describeRefreshSchemasStatus:(AWSdmsDescribeRefreshSchemasStatusMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDescribeRefreshSchemasStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the task logs for the specified task.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReplicationInstanceTaskLogs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDescribeReplicationInstanceTaskLogsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInvalidResourceState`.
 
 @see AWSdmsDescribeReplicationInstanceTaskLogsMessage
 @see AWSdmsDescribeReplicationInstanceTaskLogsResponse
 */
- (AWSTask<AWSdmsDescribeReplicationInstanceTaskLogsResponse *> *)describeReplicationInstanceTaskLogs:(AWSdmsDescribeReplicationInstanceTaskLogsMessage *)request;

/**
 <p>Returns information about the task logs for the specified task.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReplicationInstanceTaskLogs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInvalidResourceState`.
 
 @see AWSdmsDescribeReplicationInstanceTaskLogsMessage
 @see AWSdmsDescribeReplicationInstanceTaskLogsResponse
 */
- (void)describeReplicationInstanceTaskLogs:(AWSdmsDescribeReplicationInstanceTaskLogsMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDescribeReplicationInstanceTaskLogsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about replication instances for your account in the current region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReplicationInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDescribeReplicationInstancesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDescribeReplicationInstancesMessage
 @see AWSdmsDescribeReplicationInstancesResponse
 */
- (AWSTask<AWSdmsDescribeReplicationInstancesResponse *> *)describeReplicationInstances:(AWSdmsDescribeReplicationInstancesMessage *)request;

/**
 <p>Returns information about replication instances for your account in the current region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReplicationInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDescribeReplicationInstancesMessage
 @see AWSdmsDescribeReplicationInstancesResponse
 */
- (void)describeReplicationInstances:(AWSdmsDescribeReplicationInstancesMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDescribeReplicationInstancesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the replication subnet groups.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReplicationSubnetGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDescribeReplicationSubnetGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDescribeReplicationSubnetGroupsMessage
 @see AWSdmsDescribeReplicationSubnetGroupsResponse
 */
- (AWSTask<AWSdmsDescribeReplicationSubnetGroupsResponse *> *)describeReplicationSubnetGroups:(AWSdmsDescribeReplicationSubnetGroupsMessage *)request;

/**
 <p>Returns information about the replication subnet groups.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReplicationSubnetGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDescribeReplicationSubnetGroupsMessage
 @see AWSdmsDescribeReplicationSubnetGroupsResponse
 */
- (void)describeReplicationSubnetGroups:(AWSdmsDescribeReplicationSubnetGroupsMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDescribeReplicationSubnetGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the task assessment results from Amazon S3. This action always returns the latest results.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReplicationTaskAssessmentResults service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDescribeReplicationTaskAssessmentResultsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDescribeReplicationTaskAssessmentResultsMessage
 @see AWSdmsDescribeReplicationTaskAssessmentResultsResponse
 */
- (AWSTask<AWSdmsDescribeReplicationTaskAssessmentResultsResponse *> *)describeReplicationTaskAssessmentResults:(AWSdmsDescribeReplicationTaskAssessmentResultsMessage *)request;

/**
 <p>Returns the task assessment results from Amazon S3. This action always returns the latest results.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReplicationTaskAssessmentResults service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDescribeReplicationTaskAssessmentResultsMessage
 @see AWSdmsDescribeReplicationTaskAssessmentResultsResponse
 */
- (void)describeReplicationTaskAssessmentResults:(AWSdmsDescribeReplicationTaskAssessmentResultsMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDescribeReplicationTaskAssessmentResultsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about replication tasks for your account in the current region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReplicationTasks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDescribeReplicationTasksResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDescribeReplicationTasksMessage
 @see AWSdmsDescribeReplicationTasksResponse
 */
- (AWSTask<AWSdmsDescribeReplicationTasksResponse *> *)describeReplicationTasks:(AWSdmsDescribeReplicationTasksMessage *)request;

/**
 <p>Returns information about replication tasks for your account in the current region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReplicationTasks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDescribeReplicationTasksMessage
 @see AWSdmsDescribeReplicationTasksResponse
 */
- (void)describeReplicationTasks:(AWSdmsDescribeReplicationTasksMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDescribeReplicationTasksResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the schema for the specified endpoint.</p><p/>
 
 @param request A container for the necessary parameters to execute the DescribeSchemas service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDescribeSchemasResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDescribeSchemasMessage
 @see AWSdmsDescribeSchemasResponse
 */
- (AWSTask<AWSdmsDescribeSchemasResponse *> *)describeSchemas:(AWSdmsDescribeSchemasMessage *)request;

/**
 <p>Returns information about the schema for the specified endpoint.</p><p/>
 
 @param request A container for the necessary parameters to execute the DescribeSchemas service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsDescribeSchemasMessage
 @see AWSdmsDescribeSchemasResponse
 */
- (void)describeSchemas:(AWSdmsDescribeSchemasMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDescribeSchemasResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns table statistics on the database migration task, including table name, rows inserted, rows updated, and rows deleted.</p><p>Note that the "last updated" column the DMS console only indicates the time that AWS DMS last updated the table statistics record for a table. It does not indicate the time of the last update to the table.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTableStatistics service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsDescribeTableStatisticsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInvalidResourceState`.
 
 @see AWSdmsDescribeTableStatisticsMessage
 @see AWSdmsDescribeTableStatisticsResponse
 */
- (AWSTask<AWSdmsDescribeTableStatisticsResponse *> *)describeTableStatistics:(AWSdmsDescribeTableStatisticsMessage *)request;

/**
 <p>Returns table statistics on the database migration task, including table name, rows inserted, rows updated, and rows deleted.</p><p>Note that the "last updated" column the DMS console only indicates the time that AWS DMS last updated the table statistics record for a table. It does not indicate the time of the last update to the table.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTableStatistics service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInvalidResourceState`.
 
 @see AWSdmsDescribeTableStatisticsMessage
 @see AWSdmsDescribeTableStatisticsResponse
 */
- (void)describeTableStatistics:(AWSdmsDescribeTableStatisticsMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsDescribeTableStatisticsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Uploads the specified certificate.</p>
 
 @param request A container for the necessary parameters to execute the ImportCertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsImportCertificateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceAlreadyExists`, `AWSdmsErrorInvalidCertificate`, `AWSdmsErrorResourceQuotaExceeded`.
 
 @see AWSdmsImportCertificateMessage
 @see AWSdmsImportCertificateResponse
 */
- (AWSTask<AWSdmsImportCertificateResponse *> *)importCertificate:(AWSdmsImportCertificateMessage *)request;

/**
 <p>Uploads the specified certificate.</p>
 
 @param request A container for the necessary parameters to execute the ImportCertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceAlreadyExists`, `AWSdmsErrorInvalidCertificate`, `AWSdmsErrorResourceQuotaExceeded`.
 
 @see AWSdmsImportCertificateMessage
 @see AWSdmsImportCertificateResponse
 */
- (void)importCertificate:(AWSdmsImportCertificateMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsImportCertificateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all tags for an AWS DMS resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsListTagsForResourceMessage
 @see AWSdmsListTagsForResourceResponse
 */
- (AWSTask<AWSdmsListTagsForResourceResponse *> *)listTagsForResource:(AWSdmsListTagsForResourceMessage *)request;

/**
 <p>Lists all tags for an AWS DMS resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsListTagsForResourceMessage
 @see AWSdmsListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSdmsListTagsForResourceMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the specified endpoint.</p>
 
 @param request A container for the necessary parameters to execute the ModifyEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsModifyEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorResourceNotFound`, `AWSdmsErrorResourceAlreadyExists`, `AWSdmsErrorKMSKeyNotAccessible`, `AWSdmsErrorAccessDenied`.
 
 @see AWSdmsModifyEndpointMessage
 @see AWSdmsModifyEndpointResponse
 */
- (AWSTask<AWSdmsModifyEndpointResponse *> *)modifyEndpoint:(AWSdmsModifyEndpointMessage *)request;

/**
 <p>Modifies the specified endpoint.</p>
 
 @param request A container for the necessary parameters to execute the ModifyEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorResourceNotFound`, `AWSdmsErrorResourceAlreadyExists`, `AWSdmsErrorKMSKeyNotAccessible`, `AWSdmsErrorAccessDenied`.
 
 @see AWSdmsModifyEndpointMessage
 @see AWSdmsModifyEndpointResponse
 */
- (void)modifyEndpoint:(AWSdmsModifyEndpointMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsModifyEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies an existing AWS DMS event notification subscription. </p>
 
 @param request A container for the necessary parameters to execute the ModifyEventSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsModifyEventSubscriptionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceQuotaExceeded`, `AWSdmsErrorResourceNotFound`, `AWSdmsErrorSNSInvalidTopic`, `AWSdmsErrorSNSNoAuthorization`, `AWSdmsErrorKMSAccessDenied`, `AWSdmsErrorKMSDisabled`, `AWSdmsErrorKMSInvalidState`, `AWSdmsErrorKMSNotFound`, `AWSdmsErrorKMSThrottling`.
 
 @see AWSdmsModifyEventSubscriptionMessage
 @see AWSdmsModifyEventSubscriptionResponse
 */
- (AWSTask<AWSdmsModifyEventSubscriptionResponse *> *)modifyEventSubscription:(AWSdmsModifyEventSubscriptionMessage *)request;

/**
 <p>Modifies an existing AWS DMS event notification subscription. </p>
 
 @param request A container for the necessary parameters to execute the ModifyEventSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceQuotaExceeded`, `AWSdmsErrorResourceNotFound`, `AWSdmsErrorSNSInvalidTopic`, `AWSdmsErrorSNSNoAuthorization`, `AWSdmsErrorKMSAccessDenied`, `AWSdmsErrorKMSDisabled`, `AWSdmsErrorKMSInvalidState`, `AWSdmsErrorKMSNotFound`, `AWSdmsErrorKMSThrottling`.
 
 @see AWSdmsModifyEventSubscriptionMessage
 @see AWSdmsModifyEventSubscriptionResponse
 */
- (void)modifyEventSubscription:(AWSdmsModifyEventSubscriptionMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsModifyEventSubscriptionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the replication instance to apply new settings. You can change one or more parameters by specifying these parameters and the new values in the request.</p><p>Some settings are applied during the maintenance window.</p><p/>
 
 @param request A container for the necessary parameters to execute the ModifyReplicationInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsModifyReplicationInstanceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorAccessDenied`, `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorResourceAlreadyExists`, `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInsufficientResourceCapacity`, `AWSdmsErrorStorageQuotaExceeded`, `AWSdmsErrorUpgradeDependencyFailure`.
 
 @see AWSdmsModifyReplicationInstanceMessage
 @see AWSdmsModifyReplicationInstanceResponse
 */
- (AWSTask<AWSdmsModifyReplicationInstanceResponse *> *)modifyReplicationInstance:(AWSdmsModifyReplicationInstanceMessage *)request;

/**
 <p>Modifies the replication instance to apply new settings. You can change one or more parameters by specifying these parameters and the new values in the request.</p><p>Some settings are applied during the maintenance window.</p><p/>
 
 @param request A container for the necessary parameters to execute the ModifyReplicationInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorAccessDenied`, `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorResourceAlreadyExists`, `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInsufficientResourceCapacity`, `AWSdmsErrorStorageQuotaExceeded`, `AWSdmsErrorUpgradeDependencyFailure`.
 
 @see AWSdmsModifyReplicationInstanceMessage
 @see AWSdmsModifyReplicationInstanceResponse
 */
- (void)modifyReplicationInstance:(AWSdmsModifyReplicationInstanceMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsModifyReplicationInstanceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the settings for the specified replication subnet group.</p>
 
 @param request A container for the necessary parameters to execute the ModifyReplicationSubnetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsModifyReplicationSubnetGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorAccessDenied`, `AWSdmsErrorResourceNotFound`, `AWSdmsErrorResourceQuotaExceeded`, `AWSdmsErrorSubnetAlreadyInUse`, `AWSdmsErrorReplicationSubnetGroupDoesNotCoverEnoughAZs`, `AWSdmsErrorInvalidSubnet`.
 
 @see AWSdmsModifyReplicationSubnetGroupMessage
 @see AWSdmsModifyReplicationSubnetGroupResponse
 */
- (AWSTask<AWSdmsModifyReplicationSubnetGroupResponse *> *)modifyReplicationSubnetGroup:(AWSdmsModifyReplicationSubnetGroupMessage *)request;

/**
 <p>Modifies the settings for the specified replication subnet group.</p>
 
 @param request A container for the necessary parameters to execute the ModifyReplicationSubnetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorAccessDenied`, `AWSdmsErrorResourceNotFound`, `AWSdmsErrorResourceQuotaExceeded`, `AWSdmsErrorSubnetAlreadyInUse`, `AWSdmsErrorReplicationSubnetGroupDoesNotCoverEnoughAZs`, `AWSdmsErrorInvalidSubnet`.
 
 @see AWSdmsModifyReplicationSubnetGroupMessage
 @see AWSdmsModifyReplicationSubnetGroupResponse
 */
- (void)modifyReplicationSubnetGroup:(AWSdmsModifyReplicationSubnetGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsModifyReplicationSubnetGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the specified replication task.</p><p>You can't modify the task endpoints. The task must be stopped before you can modify it. </p><p>For more information about AWS DMS tasks, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.html">Working with Migration Tasks</a> in the <i>AWS Database Migration Service User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyReplicationTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsModifyReplicationTaskResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorResourceNotFound`, `AWSdmsErrorResourceAlreadyExists`, `AWSdmsErrorKMSKeyNotAccessible`.
 
 @see AWSdmsModifyReplicationTaskMessage
 @see AWSdmsModifyReplicationTaskResponse
 */
- (AWSTask<AWSdmsModifyReplicationTaskResponse *> *)modifyReplicationTask:(AWSdmsModifyReplicationTaskMessage *)request;

/**
 <p>Modifies the specified replication task.</p><p>You can't modify the task endpoints. The task must be stopped before you can modify it. </p><p>For more information about AWS DMS tasks, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.html">Working with Migration Tasks</a> in the <i>AWS Database Migration Service User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyReplicationTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorResourceNotFound`, `AWSdmsErrorResourceAlreadyExists`, `AWSdmsErrorKMSKeyNotAccessible`.
 
 @see AWSdmsModifyReplicationTaskMessage
 @see AWSdmsModifyReplicationTaskResponse
 */
- (void)modifyReplicationTask:(AWSdmsModifyReplicationTaskMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsModifyReplicationTaskResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Reboots a replication instance. Rebooting results in a momentary outage, until the replication instance becomes available again.</p>
 
 @param request A container for the necessary parameters to execute the RebootReplicationInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsRebootReplicationInstanceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInvalidResourceState`.
 
 @see AWSdmsRebootReplicationInstanceMessage
 @see AWSdmsRebootReplicationInstanceResponse
 */
- (AWSTask<AWSdmsRebootReplicationInstanceResponse *> *)rebootReplicationInstance:(AWSdmsRebootReplicationInstanceMessage *)request;

/**
 <p>Reboots a replication instance. Rebooting results in a momentary outage, until the replication instance becomes available again.</p>
 
 @param request A container for the necessary parameters to execute the RebootReplicationInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInvalidResourceState`.
 
 @see AWSdmsRebootReplicationInstanceMessage
 @see AWSdmsRebootReplicationInstanceResponse
 */
- (void)rebootReplicationInstance:(AWSdmsRebootReplicationInstanceMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsRebootReplicationInstanceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Populates the schema for the specified endpoint. This is an asynchronous operation and can take several minutes. You can check the status of this operation by calling the DescribeRefreshSchemasStatus operation.</p>
 
 @param request A container for the necessary parameters to execute the RefreshSchemas service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsRefreshSchemasResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorResourceNotFound`, `AWSdmsErrorKMSKeyNotAccessible`, `AWSdmsErrorResourceQuotaExceeded`.
 
 @see AWSdmsRefreshSchemasMessage
 @see AWSdmsRefreshSchemasResponse
 */
- (AWSTask<AWSdmsRefreshSchemasResponse *> *)refreshSchemas:(AWSdmsRefreshSchemasMessage *)request;

/**
 <p>Populates the schema for the specified endpoint. This is an asynchronous operation and can take several minutes. You can check the status of this operation by calling the DescribeRefreshSchemasStatus operation.</p>
 
 @param request A container for the necessary parameters to execute the RefreshSchemas service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorResourceNotFound`, `AWSdmsErrorKMSKeyNotAccessible`, `AWSdmsErrorResourceQuotaExceeded`.
 
 @see AWSdmsRefreshSchemasMessage
 @see AWSdmsRefreshSchemasResponse
 */
- (void)refreshSchemas:(AWSdmsRefreshSchemasMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsRefreshSchemasResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Reloads the target database table with the source data. </p>
 
 @param request A container for the necessary parameters to execute the ReloadTables service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsReloadTablesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInvalidResourceState`.
 
 @see AWSdmsReloadTablesMessage
 @see AWSdmsReloadTablesResponse
 */
- (AWSTask<AWSdmsReloadTablesResponse *> *)reloadTables:(AWSdmsReloadTablesMessage *)request;

/**
 <p>Reloads the target database table with the source data. </p>
 
 @param request A container for the necessary parameters to execute the ReloadTables service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInvalidResourceState`.
 
 @see AWSdmsReloadTablesMessage
 @see AWSdmsReloadTablesResponse
 */
- (void)reloadTables:(AWSdmsReloadTablesMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsReloadTablesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes metadata tags from a DMS resource.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTagsFromResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsRemoveTagsFromResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsRemoveTagsFromResourceMessage
 @see AWSdmsRemoveTagsFromResourceResponse
 */
- (AWSTask<AWSdmsRemoveTagsFromResourceResponse *> *)removeTagsFromResource:(AWSdmsRemoveTagsFromResourceMessage *)request;

/**
 <p>Removes metadata tags from a DMS resource.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTagsFromResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsRemoveTagsFromResourceMessage
 @see AWSdmsRemoveTagsFromResourceResponse
 */
- (void)removeTagsFromResource:(AWSdmsRemoveTagsFromResourceMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsRemoveTagsFromResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts the replication task.</p><p>For more information about AWS DMS tasks, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.html">Working with Migration Tasks </a> in the <i>AWS Database Migration Service User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the StartReplicationTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsStartReplicationTaskResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorAccessDenied`.
 
 @see AWSdmsStartReplicationTaskMessage
 @see AWSdmsStartReplicationTaskResponse
 */
- (AWSTask<AWSdmsStartReplicationTaskResponse *> *)startReplicationTask:(AWSdmsStartReplicationTaskMessage *)request;

/**
 <p>Starts the replication task.</p><p>For more information about AWS DMS tasks, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.html">Working with Migration Tasks </a> in the <i>AWS Database Migration Service User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the StartReplicationTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorAccessDenied`.
 
 @see AWSdmsStartReplicationTaskMessage
 @see AWSdmsStartReplicationTaskResponse
 */
- (void)startReplicationTask:(AWSdmsStartReplicationTaskMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsStartReplicationTaskResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Starts the replication task assessment for unsupported data types in the source database. </p>
 
 @param request A container for the necessary parameters to execute the StartReplicationTaskAssessment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsStartReplicationTaskAssessmentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsStartReplicationTaskAssessmentMessage
 @see AWSdmsStartReplicationTaskAssessmentResponse
 */
- (AWSTask<AWSdmsStartReplicationTaskAssessmentResponse *> *)startReplicationTaskAssessment:(AWSdmsStartReplicationTaskAssessmentMessage *)request;

/**
 <p> Starts the replication task assessment for unsupported data types in the source database. </p>
 
 @param request A container for the necessary parameters to execute the StartReplicationTaskAssessment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorResourceNotFound`.
 
 @see AWSdmsStartReplicationTaskAssessmentMessage
 @see AWSdmsStartReplicationTaskAssessmentResponse
 */
- (void)startReplicationTaskAssessment:(AWSdmsStartReplicationTaskAssessmentMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsStartReplicationTaskAssessmentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops the replication task.</p><p/>
 
 @param request A container for the necessary parameters to execute the StopReplicationTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsStopReplicationTaskResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInvalidResourceState`.
 
 @see AWSdmsStopReplicationTaskMessage
 @see AWSdmsStopReplicationTaskResponse
 */
- (AWSTask<AWSdmsStopReplicationTaskResponse *> *)stopReplicationTask:(AWSdmsStopReplicationTaskMessage *)request;

/**
 <p>Stops the replication task.</p><p/>
 
 @param request A container for the necessary parameters to execute the StopReplicationTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInvalidResourceState`.
 
 @see AWSdmsStopReplicationTaskMessage
 @see AWSdmsStopReplicationTaskResponse
 */
- (void)stopReplicationTask:(AWSdmsStopReplicationTaskMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsStopReplicationTaskResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Tests the connection between the replication instance and the endpoint.</p>
 
 @param request A container for the necessary parameters to execute the TestConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdmsTestConnectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorKMSKeyNotAccessible`, `AWSdmsErrorResourceQuotaExceeded`.
 
 @see AWSdmsTestConnectionMessage
 @see AWSdmsTestConnectionResponse
 */
- (AWSTask<AWSdmsTestConnectionResponse *> *)testConnection:(AWSdmsTestConnectionMessage *)request;

/**
 <p>Tests the connection between the replication instance and the endpoint.</p>
 
 @param request A container for the necessary parameters to execute the TestConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdmsErrorDomain` domain and the following error code: `AWSdmsErrorResourceNotFound`, `AWSdmsErrorInvalidResourceState`, `AWSdmsErrorKMSKeyNotAccessible`, `AWSdmsErrorResourceQuotaExceeded`.
 
 @see AWSdmsTestConnectionMessage
 @see AWSdmsTestConnectionResponse
 */
- (void)testConnection:(AWSdmsTestConnectionMessage *)request completionHandler:(void (^ _Nullable)(AWSdmsTestConnectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
