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
#import "AWSredshiftModel.h"
#import "AWSredshiftResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSredshift
FOUNDATION_EXPORT NSString *const AWSredshiftSDKVersion;

/**
 <fullname>Amazon Redshift</fullname><p><b>Overview</b></p><p>This is an interface reference for Amazon Redshift. It contains documentation for one of the programming or command line interfaces you can use to manage Amazon Redshift clusters. Note that Amazon Redshift is asynchronous, which means that some interfaces may require techniques, such as polling or asynchronous callback handlers, to determine when a command has been applied. In this reference, the parameter descriptions indicate whether a change is applied immediately, on the next instance reboot, or during the next maintenance window. For a summary of the Amazon Redshift cluster management interfaces, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/using-aws-sdk.html">Using the Amazon Redshift Management Interfaces</a>.</p><p>Amazon Redshift manages all the work of setting up, operating, and scaling a data warehouse: provisioning capacity, monitoring and backing up the cluster, and applying patches and upgrades to the Amazon Redshift engine. You can focus on using your data to acquire new insights for your business and customers.</p><p>If you are a first-time user of Amazon Redshift, we recommend that you begin by reading the <a href="https://docs.aws.amazon.com/redshift/latest/gsg/getting-started.html">Amazon Redshift Getting Started Guide</a>.</p><p>If you are a database developer, the <a href="https://docs.aws.amazon.com/redshift/latest/dg/welcome.html">Amazon Redshift Database Developer Guide</a> explains how to design, build, query, and maintain the databases that make up your data warehouse. </p>
 */
@interface AWSredshift : AWSService

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

     let redshift = AWSredshift.default()

 *Objective-C*

     AWSredshift *redshift = [AWSredshift defaultredshift];

 @return The default service client.
 */
+ (instancetype)defaultredshift;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSredshift.register(with: configuration!, forKey: "USWest2redshift")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSredshift registerredshiftWithConfiguration:configuration forKey:@"USWest2redshift"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let redshift = AWSredshift(forKey: "USWest2redshift")

 *Objective-C*

     AWSredshift *redshift = [AWSredshift redshiftForKey:@"USWest2redshift"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerredshiftWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerredshiftWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSredshift.register(with: configuration!, forKey: "USWest2redshift")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSredshift registerredshiftWithConfiguration:configuration forKey:@"USWest2redshift"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let redshift = AWSredshift(forKey: "USWest2redshift")

 *Objective-C*

     AWSredshift *redshift = [AWSredshift redshiftForKey:@"USWest2redshift"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)redshiftForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeredshiftForKey:(NSString *)key;

/**
 <p>Exchanges a DC1 Reserved Node for a DC2 Reserved Node with no changes to the configuration (term, payment type, or number of nodes) and no additional costs. </p>
 
 @param request A container for the necessary parameters to execute the AcceptReservedNodeExchange service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftAcceptReservedNodeExchangeOutputMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorReservedNodeNotFound`, `AWSredshiftErrorInvalidReservedNodeState`, `AWSredshiftErrorReservedNodeAlreadyMigrated`, `AWSredshiftErrorReservedNodeOfferingNotFound`, `AWSredshiftErrorUnsupportedOperation`, `AWSredshiftErrorDependentServiceUnavailable`, `AWSredshiftErrorReservedNodeAlreadyExists`.
 
 @see AWSredshiftAcceptReservedNodeExchangeInputMessage
 @see AWSredshiftAcceptReservedNodeExchangeOutputMessage
 */
- (AWSTask<AWSredshiftAcceptReservedNodeExchangeOutputMessage *> *)acceptReservedNodeExchange:(AWSredshiftAcceptReservedNodeExchangeInputMessage *)request;

/**
 <p>Exchanges a DC1 Reserved Node for a DC2 Reserved Node with no changes to the configuration (term, payment type, or number of nodes) and no additional costs. </p>
 
 @param request A container for the necessary parameters to execute the AcceptReservedNodeExchange service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorReservedNodeNotFound`, `AWSredshiftErrorInvalidReservedNodeState`, `AWSredshiftErrorReservedNodeAlreadyMigrated`, `AWSredshiftErrorReservedNodeOfferingNotFound`, `AWSredshiftErrorUnsupportedOperation`, `AWSredshiftErrorDependentServiceUnavailable`, `AWSredshiftErrorReservedNodeAlreadyExists`.
 
 @see AWSredshiftAcceptReservedNodeExchangeInputMessage
 @see AWSredshiftAcceptReservedNodeExchangeOutputMessage
 */
- (void)acceptReservedNodeExchange:(AWSredshiftAcceptReservedNodeExchangeInputMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftAcceptReservedNodeExchangeOutputMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds an inbound (ingress) rule to an Amazon Redshift security group. Depending on whether the application accessing your cluster is running on the Internet or an Amazon EC2 instance, you can authorize inbound access to either a Classless Interdomain Routing (CIDR)/Internet Protocol (IP) range or to an Amazon EC2 security group. You can add as many as 20 ingress rules to an Amazon Redshift security group.</p><p>If you authorize access to an Amazon EC2 security group, specify <i>EC2SecurityGroupName</i> and <i>EC2SecurityGroupOwnerId</i>. The Amazon EC2 security group and Amazon Redshift cluster must be in the same AWS Region. </p><p>If you authorize access to a CIDR/IP address range, specify <i>CIDRIP</i>. For an overview of CIDR blocks, see the Wikipedia article on <a href="http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless Inter-Domain Routing</a>. </p><p>You must also associate the security group with a cluster so that clients running on these IP addresses or the EC2 instance are authorized to connect to the cluster. For information about managing security groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html">Working with Security Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AuthorizeClusterSecurityGroupIngress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftAuthorizeClusterSecurityGroupIngressResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterSecurityGroupNotFound`, `AWSredshiftErrorInvalidClusterSecurityGroupState`, `AWSredshiftErrorAuthorizationAlreadyExists`, `AWSredshiftErrorAuthorizationQuotaExceeded`.
 
 @see AWSredshiftAuthorizeClusterSecurityGroupIngressMessage
 @see AWSredshiftAuthorizeClusterSecurityGroupIngressResult
 */
- (AWSTask<AWSredshiftAuthorizeClusterSecurityGroupIngressResult *> *)authorizeClusterSecurityGroupIngress:(AWSredshiftAuthorizeClusterSecurityGroupIngressMessage *)request;

/**
 <p>Adds an inbound (ingress) rule to an Amazon Redshift security group. Depending on whether the application accessing your cluster is running on the Internet or an Amazon EC2 instance, you can authorize inbound access to either a Classless Interdomain Routing (CIDR)/Internet Protocol (IP) range or to an Amazon EC2 security group. You can add as many as 20 ingress rules to an Amazon Redshift security group.</p><p>If you authorize access to an Amazon EC2 security group, specify <i>EC2SecurityGroupName</i> and <i>EC2SecurityGroupOwnerId</i>. The Amazon EC2 security group and Amazon Redshift cluster must be in the same AWS Region. </p><p>If you authorize access to a CIDR/IP address range, specify <i>CIDRIP</i>. For an overview of CIDR blocks, see the Wikipedia article on <a href="http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless Inter-Domain Routing</a>. </p><p>You must also associate the security group with a cluster so that clients running on these IP addresses or the EC2 instance are authorized to connect to the cluster. For information about managing security groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html">Working with Security Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AuthorizeClusterSecurityGroupIngress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterSecurityGroupNotFound`, `AWSredshiftErrorInvalidClusterSecurityGroupState`, `AWSredshiftErrorAuthorizationAlreadyExists`, `AWSredshiftErrorAuthorizationQuotaExceeded`.
 
 @see AWSredshiftAuthorizeClusterSecurityGroupIngressMessage
 @see AWSredshiftAuthorizeClusterSecurityGroupIngressResult
 */
- (void)authorizeClusterSecurityGroupIngress:(AWSredshiftAuthorizeClusterSecurityGroupIngressMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftAuthorizeClusterSecurityGroupIngressResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Authorizes the specified AWS customer account to restore the specified snapshot.</p><p> For more information about working with snapshots, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html">Amazon Redshift Snapshots</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AuthorizeSnapshotAccess service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftAuthorizeSnapshotAccessResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterSnapshotNotFound`, `AWSredshiftErrorAuthorizationAlreadyExists`, `AWSredshiftErrorAuthorizationQuotaExceeded`, `AWSredshiftErrorDependentServiceRequestThrottling`, `AWSredshiftErrorInvalidClusterSnapshotState`, `AWSredshiftErrorLimitExceeded`.
 
 @see AWSredshiftAuthorizeSnapshotAccessMessage
 @see AWSredshiftAuthorizeSnapshotAccessResult
 */
- (AWSTask<AWSredshiftAuthorizeSnapshotAccessResult *> *)authorizeSnapshotAccess:(AWSredshiftAuthorizeSnapshotAccessMessage *)request;

/**
 <p>Authorizes the specified AWS customer account to restore the specified snapshot.</p><p> For more information about working with snapshots, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html">Amazon Redshift Snapshots</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AuthorizeSnapshotAccess service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterSnapshotNotFound`, `AWSredshiftErrorAuthorizationAlreadyExists`, `AWSredshiftErrorAuthorizationQuotaExceeded`, `AWSredshiftErrorDependentServiceRequestThrottling`, `AWSredshiftErrorInvalidClusterSnapshotState`, `AWSredshiftErrorLimitExceeded`.
 
 @see AWSredshiftAuthorizeSnapshotAccessMessage
 @see AWSredshiftAuthorizeSnapshotAccessResult
 */
- (void)authorizeSnapshotAccess:(AWSredshiftAuthorizeSnapshotAccessMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftAuthorizeSnapshotAccessResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a set of cluster snapshots.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeleteClusterSnapshots service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftBatchDeleteClusterSnapshotsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorBatchDeleteRequestSizeExceeded`.
 
 @see AWSredshiftBatchDeleteClusterSnapshotsRequest
 @see AWSredshiftBatchDeleteClusterSnapshotsResult
 */
- (AWSTask<AWSredshiftBatchDeleteClusterSnapshotsResult *> *)batchDeleteClusterSnapshots:(AWSredshiftBatchDeleteClusterSnapshotsRequest *)request;

/**
 <p>Deletes a set of cluster snapshots.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeleteClusterSnapshots service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorBatchDeleteRequestSizeExceeded`.
 
 @see AWSredshiftBatchDeleteClusterSnapshotsRequest
 @see AWSredshiftBatchDeleteClusterSnapshotsResult
 */
- (void)batchDeleteClusterSnapshots:(AWSredshiftBatchDeleteClusterSnapshotsRequest *)request completionHandler:(void (^ _Nullable)(AWSredshiftBatchDeleteClusterSnapshotsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the settings for a set of cluster snapshots.</p>
 
 @param request A container for the necessary parameters to execute the BatchModifyClusterSnapshots service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftBatchModifyClusterSnapshotsOutputMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidRetentionPeriod`, `AWSredshiftErrorBatchModifyClusterSnapshotsLimitExceeded`.
 
 @see AWSredshiftBatchModifyClusterSnapshotsMessage
 @see AWSredshiftBatchModifyClusterSnapshotsOutputMessage
 */
- (AWSTask<AWSredshiftBatchModifyClusterSnapshotsOutputMessage *> *)batchModifyClusterSnapshots:(AWSredshiftBatchModifyClusterSnapshotsMessage *)request;

/**
 <p>Modifies the settings for a set of cluster snapshots.</p>
 
 @param request A container for the necessary parameters to execute the BatchModifyClusterSnapshots service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidRetentionPeriod`, `AWSredshiftErrorBatchModifyClusterSnapshotsLimitExceeded`.
 
 @see AWSredshiftBatchModifyClusterSnapshotsMessage
 @see AWSredshiftBatchModifyClusterSnapshotsOutputMessage
 */
- (void)batchModifyClusterSnapshots:(AWSredshiftBatchModifyClusterSnapshotsMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftBatchModifyClusterSnapshotsOutputMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels a resize operation for a cluster.</p>
 
 @param request A container for the necessary parameters to execute the CancelResize service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftResizeProgressMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorResizeNotFound`, `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorUnsupportedOperation`.
 
 @see AWSredshiftCancelResizeMessage
 @see AWSredshiftResizeProgressMessage
 */
- (AWSTask<AWSredshiftResizeProgressMessage *> *)cancelResize:(AWSredshiftCancelResizeMessage *)request;

/**
 <p>Cancels a resize operation for a cluster.</p>
 
 @param request A container for the necessary parameters to execute the CancelResize service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorResizeNotFound`, `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorUnsupportedOperation`.
 
 @see AWSredshiftCancelResizeMessage
 @see AWSredshiftResizeProgressMessage
 */
- (void)cancelResize:(AWSredshiftCancelResizeMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftResizeProgressMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Copies the specified automated cluster snapshot to a new manual cluster snapshot. The source must be an automated snapshot and it must be in the available state.</p><p>When you delete a cluster, Amazon Redshift deletes any automated snapshots of the cluster. Also, when the retention period of the snapshot expires, Amazon Redshift automatically deletes it. If you want to keep an automated snapshot for a longer period, you can make a manual copy of the snapshot. Manual snapshots are retained until you delete them.</p><p> For more information about working with snapshots, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html">Amazon Redshift Snapshots</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CopyClusterSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftReplicateClusterSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterSnapshotAlreadyExists`, `AWSredshiftErrorClusterSnapshotNotFound`, `AWSredshiftErrorInvalidClusterSnapshotState`, `AWSredshiftErrorClusterSnapshotQuotaExceeded`, `AWSredshiftErrorInvalidRetentionPeriod`.
 
 @see AWSredshiftReplicateClusterSnapshotMessage
 @see AWSredshiftReplicateClusterSnapshotResult
 */
- (AWSTask<AWSredshiftReplicateClusterSnapshotResult *> *)replicateClusterSnapshot:(AWSredshiftReplicateClusterSnapshotMessage *)request;

/**
 <p>Copies the specified automated cluster snapshot to a new manual cluster snapshot. The source must be an automated snapshot and it must be in the available state.</p><p>When you delete a cluster, Amazon Redshift deletes any automated snapshots of the cluster. Also, when the retention period of the snapshot expires, Amazon Redshift automatically deletes it. If you want to keep an automated snapshot for a longer period, you can make a manual copy of the snapshot. Manual snapshots are retained until you delete them.</p><p> For more information about working with snapshots, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html">Amazon Redshift Snapshots</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CopyClusterSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterSnapshotAlreadyExists`, `AWSredshiftErrorClusterSnapshotNotFound`, `AWSredshiftErrorInvalidClusterSnapshotState`, `AWSredshiftErrorClusterSnapshotQuotaExceeded`, `AWSredshiftErrorInvalidRetentionPeriod`.
 
 @see AWSredshiftReplicateClusterSnapshotMessage
 @see AWSredshiftReplicateClusterSnapshotResult
 */
- (void)replicateClusterSnapshot:(AWSredshiftReplicateClusterSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftReplicateClusterSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new cluster with the specified parameters.</p><p>To create a cluster in Virtual Private Cloud (VPC), you must provide a cluster subnet group name. The cluster subnet group identifies the subnets of your VPC that Amazon Redshift uses when creating the cluster. For more information about managing clusters, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon Redshift Clusters</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftCreateClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterAlreadyExists`, `AWSredshiftErrorInsufficientClusterCapacity`, `AWSredshiftErrorClusterParameterGroupNotFound`, `AWSredshiftErrorClusterSecurityGroupNotFound`, `AWSredshiftErrorClusterQuotaExceeded`, `AWSredshiftErrorNumberOfNodesQuotaExceeded`, `AWSredshiftErrorNumberOfNodesPerClusterLimitExceeded`, `AWSredshiftErrorClusterSubnetGroupNotFound`, `AWSredshiftErrorInvalidVPCNetworkState`, `AWSredshiftErrorInvalidClusterSubnetGroupState`, `AWSredshiftErrorInvalidSubnet`, `AWSredshiftErrorUnauthorizedOperation`, `AWSredshiftErrorHsmClientCertificateNotFound`, `AWSredshiftErrorHsmConfigurationNotFound`, `AWSredshiftErrorInvalidElasticIp`, `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorInvalidTag`, `AWSredshiftErrorLimitExceeded`, `AWSredshiftErrorDependentServiceRequestThrottling`, `AWSredshiftErrorInvalidClusterTrack`, `AWSredshiftErrorSnapshotScheduleNotFound`, `AWSredshiftErrorInvalidRetentionPeriod`.
 
 @see AWSredshiftCreateClusterMessage
 @see AWSredshiftCreateClusterResult
 */
- (AWSTask<AWSredshiftCreateClusterResult *> *)createCluster:(AWSredshiftCreateClusterMessage *)request;

/**
 <p>Creates a new cluster with the specified parameters.</p><p>To create a cluster in Virtual Private Cloud (VPC), you must provide a cluster subnet group name. The cluster subnet group identifies the subnets of your VPC that Amazon Redshift uses when creating the cluster. For more information about managing clusters, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon Redshift Clusters</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterAlreadyExists`, `AWSredshiftErrorInsufficientClusterCapacity`, `AWSredshiftErrorClusterParameterGroupNotFound`, `AWSredshiftErrorClusterSecurityGroupNotFound`, `AWSredshiftErrorClusterQuotaExceeded`, `AWSredshiftErrorNumberOfNodesQuotaExceeded`, `AWSredshiftErrorNumberOfNodesPerClusterLimitExceeded`, `AWSredshiftErrorClusterSubnetGroupNotFound`, `AWSredshiftErrorInvalidVPCNetworkState`, `AWSredshiftErrorInvalidClusterSubnetGroupState`, `AWSredshiftErrorInvalidSubnet`, `AWSredshiftErrorUnauthorizedOperation`, `AWSredshiftErrorHsmClientCertificateNotFound`, `AWSredshiftErrorHsmConfigurationNotFound`, `AWSredshiftErrorInvalidElasticIp`, `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorInvalidTag`, `AWSredshiftErrorLimitExceeded`, `AWSredshiftErrorDependentServiceRequestThrottling`, `AWSredshiftErrorInvalidClusterTrack`, `AWSredshiftErrorSnapshotScheduleNotFound`, `AWSredshiftErrorInvalidRetentionPeriod`.
 
 @see AWSredshiftCreateClusterMessage
 @see AWSredshiftCreateClusterResult
 */
- (void)createCluster:(AWSredshiftCreateClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftCreateClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon Redshift parameter group.</p><p>Creating parameter groups is independent of creating clusters. You can associate a cluster with a parameter group when you create the cluster. You can also associate an existing cluster with a parameter group after the cluster is created by using <a>ModifyCluster</a>. </p><p>Parameters in the parameter group define specific behavior that applies to the databases you create on the cluster. For more information about parameters and parameter groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon Redshift Parameter Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateClusterParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftCreateClusterParameterGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterParameterGroupQuotaExceeded`, `AWSredshiftErrorClusterParameterGroupAlreadyExists`, `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftCreateClusterParameterGroupMessage
 @see AWSredshiftCreateClusterParameterGroupResult
 */
- (AWSTask<AWSredshiftCreateClusterParameterGroupResult *> *)createClusterParameterGroup:(AWSredshiftCreateClusterParameterGroupMessage *)request;

/**
 <p>Creates an Amazon Redshift parameter group.</p><p>Creating parameter groups is independent of creating clusters. You can associate a cluster with a parameter group when you create the cluster. You can also associate an existing cluster with a parameter group after the cluster is created by using <a>ModifyCluster</a>. </p><p>Parameters in the parameter group define specific behavior that applies to the databases you create on the cluster. For more information about parameters and parameter groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon Redshift Parameter Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateClusterParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterParameterGroupQuotaExceeded`, `AWSredshiftErrorClusterParameterGroupAlreadyExists`, `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftCreateClusterParameterGroupMessage
 @see AWSredshiftCreateClusterParameterGroupResult
 */
- (void)createClusterParameterGroup:(AWSredshiftCreateClusterParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftCreateClusterParameterGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new Amazon Redshift security group. You use security groups to control access to non-VPC clusters.</p><p> For information about managing security groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html">Amazon Redshift Cluster Security Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateClusterSecurityGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftCreateClusterSecurityGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterSecurityGroupAlreadyExists`, `AWSredshiftErrorClusterSecurityGroupQuotaExceeded`, `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftCreateClusterSecurityGroupMessage
 @see AWSredshiftCreateClusterSecurityGroupResult
 */
- (AWSTask<AWSredshiftCreateClusterSecurityGroupResult *> *)createClusterSecurityGroup:(AWSredshiftCreateClusterSecurityGroupMessage *)request;

/**
 <p>Creates a new Amazon Redshift security group. You use security groups to control access to non-VPC clusters.</p><p> For information about managing security groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html">Amazon Redshift Cluster Security Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateClusterSecurityGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterSecurityGroupAlreadyExists`, `AWSredshiftErrorClusterSecurityGroupQuotaExceeded`, `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftCreateClusterSecurityGroupMessage
 @see AWSredshiftCreateClusterSecurityGroupResult
 */
- (void)createClusterSecurityGroup:(AWSredshiftCreateClusterSecurityGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftCreateClusterSecurityGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a manual snapshot of the specified cluster. The cluster must be in the <code>available</code> state. </p><p> For more information about working with snapshots, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html">Amazon Redshift Snapshots</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateClusterSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftCreateClusterSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterSnapshotAlreadyExists`, `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorClusterSnapshotQuotaExceeded`, `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorInvalidTag`, `AWSredshiftErrorInvalidRetentionPeriod`.
 
 @see AWSredshiftCreateClusterSnapshotMessage
 @see AWSredshiftCreateClusterSnapshotResult
 */
- (AWSTask<AWSredshiftCreateClusterSnapshotResult *> *)createClusterSnapshot:(AWSredshiftCreateClusterSnapshotMessage *)request;

/**
 <p>Creates a manual snapshot of the specified cluster. The cluster must be in the <code>available</code> state. </p><p> For more information about working with snapshots, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html">Amazon Redshift Snapshots</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateClusterSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterSnapshotAlreadyExists`, `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorClusterSnapshotQuotaExceeded`, `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorInvalidTag`, `AWSredshiftErrorInvalidRetentionPeriod`.
 
 @see AWSredshiftCreateClusterSnapshotMessage
 @see AWSredshiftCreateClusterSnapshotResult
 */
- (void)createClusterSnapshot:(AWSredshiftCreateClusterSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftCreateClusterSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new Amazon Redshift subnet group. You must provide a list of one or more subnets in your existing Amazon Virtual Private Cloud (Amazon VPC) when creating Amazon Redshift subnet group.</p><p> For information about subnet groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-cluster-subnet-groups.html">Amazon Redshift Cluster Subnet Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateClusterSubnetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftCreateClusterSubnetGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterSubnetGroupAlreadyExists`, `AWSredshiftErrorClusterSubnetGroupQuotaExceeded`, `AWSredshiftErrorClusterSubnetQuotaExceeded`, `AWSredshiftErrorInvalidSubnet`, `AWSredshiftErrorUnauthorizedOperation`, `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorInvalidTag`, `AWSredshiftErrorDependentServiceRequestThrottling`.
 
 @see AWSredshiftCreateClusterSubnetGroupMessage
 @see AWSredshiftCreateClusterSubnetGroupResult
 */
- (AWSTask<AWSredshiftCreateClusterSubnetGroupResult *> *)createClusterSubnetGroup:(AWSredshiftCreateClusterSubnetGroupMessage *)request;

/**
 <p>Creates a new Amazon Redshift subnet group. You must provide a list of one or more subnets in your existing Amazon Virtual Private Cloud (Amazon VPC) when creating Amazon Redshift subnet group.</p><p> For information about subnet groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-cluster-subnet-groups.html">Amazon Redshift Cluster Subnet Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateClusterSubnetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterSubnetGroupAlreadyExists`, `AWSredshiftErrorClusterSubnetGroupQuotaExceeded`, `AWSredshiftErrorClusterSubnetQuotaExceeded`, `AWSredshiftErrorInvalidSubnet`, `AWSredshiftErrorUnauthorizedOperation`, `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorInvalidTag`, `AWSredshiftErrorDependentServiceRequestThrottling`.
 
 @see AWSredshiftCreateClusterSubnetGroupMessage
 @see AWSredshiftCreateClusterSubnetGroupResult
 */
- (void)createClusterSubnetGroup:(AWSredshiftCreateClusterSubnetGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftCreateClusterSubnetGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon Redshift event notification subscription. This action requires an ARN (Amazon Resource Name) of an Amazon SNS topic created by either the Amazon Redshift console, the Amazon SNS console, or the Amazon SNS API. To obtain an ARN with Amazon SNS, you must create a topic in Amazon SNS and subscribe to the topic. The ARN is displayed in the SNS console.</p><p>You can specify the source type, and lists of Amazon Redshift source IDs, event categories, and event severities. Notifications will be sent for all events you want that match those criteria. For example, you can specify source type = cluster, source ID = my-cluster-1 and mycluster2, event categories = Availability, Backup, and severity = ERROR. The subscription will only send notifications for those ERROR events in the Availability and Backup categories for the specified clusters.</p><p>If you specify both the source type and source IDs, such as source type = cluster and source identifier = my-cluster-1, notifications will be sent for all the cluster events for my-cluster-1. If you specify a source type but do not specify a source identifier, you will receive notice of the events for the objects of that type in your AWS account. If you do not specify either the SourceType nor the SourceIdentifier, you will be notified of events generated from all Amazon Redshift sources belonging to your AWS account. You must specify a source type if you specify a source ID.</p>
 
 @param request A container for the necessary parameters to execute the CreateEventSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftCreateEventSubscriptionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorEventSubscriptionQuotaExceeded`, `AWSredshiftErrorSubscriptionAlreadyExist`, `AWSredshiftErrorSNSInvalidTopic`, `AWSredshiftErrorSNSNoAuthorization`, `AWSredshiftErrorSNSTopicArnNotFound`, `AWSredshiftErrorSubscriptionEventIdNotFound`, `AWSredshiftErrorSubscriptionCategoryNotFound`, `AWSredshiftErrorSubscriptionSeverityNotFound`, `AWSredshiftErrorSourceNotFound`, `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftCreateEventSubscriptionMessage
 @see AWSredshiftCreateEventSubscriptionResult
 */
- (AWSTask<AWSredshiftCreateEventSubscriptionResult *> *)createEventSubscription:(AWSredshiftCreateEventSubscriptionMessage *)request;

/**
 <p>Creates an Amazon Redshift event notification subscription. This action requires an ARN (Amazon Resource Name) of an Amazon SNS topic created by either the Amazon Redshift console, the Amazon SNS console, or the Amazon SNS API. To obtain an ARN with Amazon SNS, you must create a topic in Amazon SNS and subscribe to the topic. The ARN is displayed in the SNS console.</p><p>You can specify the source type, and lists of Amazon Redshift source IDs, event categories, and event severities. Notifications will be sent for all events you want that match those criteria. For example, you can specify source type = cluster, source ID = my-cluster-1 and mycluster2, event categories = Availability, Backup, and severity = ERROR. The subscription will only send notifications for those ERROR events in the Availability and Backup categories for the specified clusters.</p><p>If you specify both the source type and source IDs, such as source type = cluster and source identifier = my-cluster-1, notifications will be sent for all the cluster events for my-cluster-1. If you specify a source type but do not specify a source identifier, you will receive notice of the events for the objects of that type in your AWS account. If you do not specify either the SourceType nor the SourceIdentifier, you will be notified of events generated from all Amazon Redshift sources belonging to your AWS account. You must specify a source type if you specify a source ID.</p>
 
 @param request A container for the necessary parameters to execute the CreateEventSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorEventSubscriptionQuotaExceeded`, `AWSredshiftErrorSubscriptionAlreadyExist`, `AWSredshiftErrorSNSInvalidTopic`, `AWSredshiftErrorSNSNoAuthorization`, `AWSredshiftErrorSNSTopicArnNotFound`, `AWSredshiftErrorSubscriptionEventIdNotFound`, `AWSredshiftErrorSubscriptionCategoryNotFound`, `AWSredshiftErrorSubscriptionSeverityNotFound`, `AWSredshiftErrorSourceNotFound`, `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftCreateEventSubscriptionMessage
 @see AWSredshiftCreateEventSubscriptionResult
 */
- (void)createEventSubscription:(AWSredshiftCreateEventSubscriptionMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftCreateEventSubscriptionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an HSM client certificate that an Amazon Redshift cluster will use to connect to the client's HSM in order to store and retrieve the keys used to encrypt the cluster databases.</p><p>The command returns a public key, which you must store in the HSM. In addition to creating the HSM certificate, you must create an Amazon Redshift HSM configuration that provides a cluster the information needed to store and use encryption keys in the HSM. For more information, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-HSM.html">Hardware Security Modules</a> in the Amazon Redshift Cluster Management Guide.</p>
 
 @param request A container for the necessary parameters to execute the CreateHsmClientCertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftCreateHsmClientCertificateResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorHsmClientCertificateAlreadyExists`, `AWSredshiftErrorHsmClientCertificateQuotaExceeded`, `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftCreateHsmClientCertificateMessage
 @see AWSredshiftCreateHsmClientCertificateResult
 */
- (AWSTask<AWSredshiftCreateHsmClientCertificateResult *> *)createHsmClientCertificate:(AWSredshiftCreateHsmClientCertificateMessage *)request;

/**
 <p>Creates an HSM client certificate that an Amazon Redshift cluster will use to connect to the client's HSM in order to store and retrieve the keys used to encrypt the cluster databases.</p><p>The command returns a public key, which you must store in the HSM. In addition to creating the HSM certificate, you must create an Amazon Redshift HSM configuration that provides a cluster the information needed to store and use encryption keys in the HSM. For more information, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-HSM.html">Hardware Security Modules</a> in the Amazon Redshift Cluster Management Guide.</p>
 
 @param request A container for the necessary parameters to execute the CreateHsmClientCertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorHsmClientCertificateAlreadyExists`, `AWSredshiftErrorHsmClientCertificateQuotaExceeded`, `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftCreateHsmClientCertificateMessage
 @see AWSredshiftCreateHsmClientCertificateResult
 */
- (void)createHsmClientCertificate:(AWSredshiftCreateHsmClientCertificateMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftCreateHsmClientCertificateResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an HSM configuration that contains the information required by an Amazon Redshift cluster to store and use database encryption keys in a Hardware Security Module (HSM). After creating the HSM configuration, you can specify it as a parameter when creating a cluster. The cluster will then store its encryption keys in the HSM.</p><p>In addition to creating an HSM configuration, you must also create an HSM client certificate. For more information, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-HSM.html">Hardware Security Modules</a> in the Amazon Redshift Cluster Management Guide.</p>
 
 @param request A container for the necessary parameters to execute the CreateHsmConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftCreateHsmConfigurationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorHsmConfigurationAlreadyExists`, `AWSredshiftErrorHsmConfigurationQuotaExceeded`, `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftCreateHsmConfigurationMessage
 @see AWSredshiftCreateHsmConfigurationResult
 */
- (AWSTask<AWSredshiftCreateHsmConfigurationResult *> *)createHsmConfiguration:(AWSredshiftCreateHsmConfigurationMessage *)request;

/**
 <p>Creates an HSM configuration that contains the information required by an Amazon Redshift cluster to store and use database encryption keys in a Hardware Security Module (HSM). After creating the HSM configuration, you can specify it as a parameter when creating a cluster. The cluster will then store its encryption keys in the HSM.</p><p>In addition to creating an HSM configuration, you must also create an HSM client certificate. For more information, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-HSM.html">Hardware Security Modules</a> in the Amazon Redshift Cluster Management Guide.</p>
 
 @param request A container for the necessary parameters to execute the CreateHsmConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorHsmConfigurationAlreadyExists`, `AWSredshiftErrorHsmConfigurationQuotaExceeded`, `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftCreateHsmConfigurationMessage
 @see AWSredshiftCreateHsmConfigurationResult
 */
- (void)createHsmConfiguration:(AWSredshiftCreateHsmConfigurationMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftCreateHsmConfigurationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a scheduled action. A scheduled action contains a schedule and an Amazon Redshift API action. For example, you can create a schedule of when to run the <code>ResizeCluster</code> API operation. </p>
 
 @param request A container for the necessary parameters to execute the CreateScheduledAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftScheduledAction`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorScheduledActionAlreadyExists`, `AWSredshiftErrorScheduledActionQuotaExceeded`, `AWSredshiftErrorScheduledActionTypeUnsupported`, `AWSredshiftErrorInvalidSchedule`, `AWSredshiftErrorInvalidScheduledAction`, `AWSredshiftErrorUnauthorizedOperation`.
 
 @see AWSredshiftCreateScheduledActionMessage
 @see AWSredshiftScheduledAction
 */
- (AWSTask<AWSredshiftScheduledAction *> *)createScheduledAction:(AWSredshiftCreateScheduledActionMessage *)request;

/**
 <p>Creates a scheduled action. A scheduled action contains a schedule and an Amazon Redshift API action. For example, you can create a schedule of when to run the <code>ResizeCluster</code> API operation. </p>
 
 @param request A container for the necessary parameters to execute the CreateScheduledAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorScheduledActionAlreadyExists`, `AWSredshiftErrorScheduledActionQuotaExceeded`, `AWSredshiftErrorScheduledActionTypeUnsupported`, `AWSredshiftErrorInvalidSchedule`, `AWSredshiftErrorInvalidScheduledAction`, `AWSredshiftErrorUnauthorizedOperation`.
 
 @see AWSredshiftCreateScheduledActionMessage
 @see AWSredshiftScheduledAction
 */
- (void)createScheduledAction:(AWSredshiftCreateScheduledActionMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftScheduledAction * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a snapshot copy grant that permits Amazon Redshift to use a customer master key (CMK) from AWS Key Management Service (AWS KMS) to encrypt copied snapshots in a destination region.</p><p> For more information about managing snapshot copy grants, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-db-encryption.html">Amazon Redshift Database Encryption</a> in the <i>Amazon Redshift Cluster Management Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the CreateSnapshotCopyGrant service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftCreateSnapshotCopyGrantResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorSnapshotCopyGrantAlreadyExists`, `AWSredshiftErrorSnapshotCopyGrantQuotaExceeded`, `AWSredshiftErrorLimitExceeded`, `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorInvalidTag`, `AWSredshiftErrorDependentServiceRequestThrottling`.
 
 @see AWSredshiftCreateSnapshotCopyGrantMessage
 @see AWSredshiftCreateSnapshotCopyGrantResult
 */
- (AWSTask<AWSredshiftCreateSnapshotCopyGrantResult *> *)createSnapshotCopyGrant:(AWSredshiftCreateSnapshotCopyGrantMessage *)request;

/**
 <p>Creates a snapshot copy grant that permits Amazon Redshift to use a customer master key (CMK) from AWS Key Management Service (AWS KMS) to encrypt copied snapshots in a destination region.</p><p> For more information about managing snapshot copy grants, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-db-encryption.html">Amazon Redshift Database Encryption</a> in the <i>Amazon Redshift Cluster Management Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the CreateSnapshotCopyGrant service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorSnapshotCopyGrantAlreadyExists`, `AWSredshiftErrorSnapshotCopyGrantQuotaExceeded`, `AWSredshiftErrorLimitExceeded`, `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorInvalidTag`, `AWSredshiftErrorDependentServiceRequestThrottling`.
 
 @see AWSredshiftCreateSnapshotCopyGrantMessage
 @see AWSredshiftCreateSnapshotCopyGrantResult
 */
- (void)createSnapshotCopyGrant:(AWSredshiftCreateSnapshotCopyGrantMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftCreateSnapshotCopyGrantResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Create a snapshot schedule that can be associated to a cluster and which overrides the default system backup schedule. </p>
 
 @param request A container for the necessary parameters to execute the CreateSnapshotSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftSnapshotSchedule`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorSnapshotScheduleAlreadyExists`, `AWSredshiftErrorInvalidSchedule`, `AWSredshiftErrorSnapshotScheduleQuotaExceeded`, `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorScheduleDefinitionTypeUnsupported`.
 
 @see AWSredshiftCreateSnapshotScheduleMessage
 @see AWSredshiftSnapshotSchedule
 */
- (AWSTask<AWSredshiftSnapshotSchedule *> *)createSnapshotSchedule:(AWSredshiftCreateSnapshotScheduleMessage *)request;

/**
 <p>Create a snapshot schedule that can be associated to a cluster and which overrides the default system backup schedule. </p>
 
 @param request A container for the necessary parameters to execute the CreateSnapshotSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorSnapshotScheduleAlreadyExists`, `AWSredshiftErrorInvalidSchedule`, `AWSredshiftErrorSnapshotScheduleQuotaExceeded`, `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorScheduleDefinitionTypeUnsupported`.
 
 @see AWSredshiftCreateSnapshotScheduleMessage
 @see AWSredshiftSnapshotSchedule
 */
- (void)createSnapshotSchedule:(AWSredshiftCreateSnapshotScheduleMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftSnapshotSchedule * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds tags to a cluster.</p><p>A resource can have up to 50 tags. If you try to create more than 50 tags for a resource, you will receive an error and the attempt will fail.</p><p>If you specify a key that already exists for the resource, the value for that key will be updated with the new value.</p>
 
 @param request A container for the necessary parameters to execute the CreateTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorResourceNotFound`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftCreateTagsMessage
 */
- (AWSTask *)createTags:(AWSredshiftCreateTagsMessage *)request;

/**
 <p>Adds tags to a cluster.</p><p>A resource can have up to 50 tags. If you try to create more than 50 tags for a resource, you will receive an error and the attempt will fail.</p><p>If you specify a key that already exists for the resource, the value for that key will be updated with the new value.</p>
 
 @param request A container for the necessary parameters to execute the CreateTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorResourceNotFound`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftCreateTagsMessage
 */
- (void)createTags:(AWSredshiftCreateTagsMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates a usage limit for a specified Amazon Redshift feature on a cluster. The usage limit is identified by the returned usage limit identifier.</p>
 
 @param request A container for the necessary parameters to execute the CreateUsageLimit service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftUsageLimit`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorLimitExceeded`, `AWSredshiftErrorUsageLimitAlreadyExists`, `AWSredshiftErrorInvalidUsageLimit`, `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorUnsupportedOperation`.
 
 @see AWSredshiftCreateUsageLimitMessage
 @see AWSredshiftUsageLimit
 */
- (AWSTask<AWSredshiftUsageLimit *> *)createUsageLimit:(AWSredshiftCreateUsageLimitMessage *)request;

/**
 <p>Creates a usage limit for a specified Amazon Redshift feature on a cluster. The usage limit is identified by the returned usage limit identifier.</p>
 
 @param request A container for the necessary parameters to execute the CreateUsageLimit service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorLimitExceeded`, `AWSredshiftErrorUsageLimitAlreadyExists`, `AWSredshiftErrorInvalidUsageLimit`, `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorUnsupportedOperation`.
 
 @see AWSredshiftCreateUsageLimitMessage
 @see AWSredshiftUsageLimit
 */
- (void)createUsageLimit:(AWSredshiftCreateUsageLimitMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftUsageLimit * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a previously provisioned cluster without its final snapshot being created. A successful response from the web service indicates that the request was received correctly. Use <a>DescribeClusters</a> to monitor the status of the deletion. The delete operation cannot be canceled or reverted once submitted. For more information about managing clusters, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon Redshift Clusters</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p><p>If you want to shut down the cluster and retain it for future use, set <i>SkipFinalClusterSnapshot</i> to <code>false</code> and specify a name for <i>FinalClusterSnapshotIdentifier</i>. You can later restore this snapshot to resume using the cluster. If a final cluster snapshot is requested, the status of the cluster will be "final-snapshot" while the snapshot is being taken, then it's "deleting" once Amazon Redshift begins deleting the cluster. </p><p> For more information about managing clusters, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon Redshift Clusters</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftDeleteClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorClusterSnapshotAlreadyExists`, `AWSredshiftErrorClusterSnapshotQuotaExceeded`, `AWSredshiftErrorInvalidRetentionPeriod`.
 
 @see AWSredshiftDeleteClusterMessage
 @see AWSredshiftDeleteClusterResult
 */
- (AWSTask<AWSredshiftDeleteClusterResult *> *)deleteCluster:(AWSredshiftDeleteClusterMessage *)request;

/**
 <p>Deletes a previously provisioned cluster without its final snapshot being created. A successful response from the web service indicates that the request was received correctly. Use <a>DescribeClusters</a> to monitor the status of the deletion. The delete operation cannot be canceled or reverted once submitted. For more information about managing clusters, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon Redshift Clusters</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p><p>If you want to shut down the cluster and retain it for future use, set <i>SkipFinalClusterSnapshot</i> to <code>false</code> and specify a name for <i>FinalClusterSnapshotIdentifier</i>. You can later restore this snapshot to resume using the cluster. If a final cluster snapshot is requested, the status of the cluster will be "final-snapshot" while the snapshot is being taken, then it's "deleting" once Amazon Redshift begins deleting the cluster. </p><p> For more information about managing clusters, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon Redshift Clusters</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorClusterSnapshotAlreadyExists`, `AWSredshiftErrorClusterSnapshotQuotaExceeded`, `AWSredshiftErrorInvalidRetentionPeriod`.
 
 @see AWSredshiftDeleteClusterMessage
 @see AWSredshiftDeleteClusterResult
 */
- (void)deleteCluster:(AWSredshiftDeleteClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftDeleteClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified Amazon Redshift parameter group.</p><note><p>You cannot delete a parameter group if it is associated with a cluster.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteClusterParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidClusterParameterGroupState`, `AWSredshiftErrorClusterParameterGroupNotFound`.
 
 @see AWSredshiftDeleteClusterParameterGroupMessage
 */
- (AWSTask *)deleteClusterParameterGroup:(AWSredshiftDeleteClusterParameterGroupMessage *)request;

/**
 <p>Deletes a specified Amazon Redshift parameter group.</p><note><p>You cannot delete a parameter group if it is associated with a cluster.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteClusterParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidClusterParameterGroupState`, `AWSredshiftErrorClusterParameterGroupNotFound`.
 
 @see AWSredshiftDeleteClusterParameterGroupMessage
 */
- (void)deleteClusterParameterGroup:(AWSredshiftDeleteClusterParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an Amazon Redshift security group.</p><note><p>You cannot delete a security group that is associated with any clusters. You cannot delete the default security group.</p></note><p> For information about managing security groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html">Amazon Redshift Cluster Security Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteClusterSecurityGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidClusterSecurityGroupState`, `AWSredshiftErrorClusterSecurityGroupNotFound`.
 
 @see AWSredshiftDeleteClusterSecurityGroupMessage
 */
- (AWSTask *)deleteClusterSecurityGroup:(AWSredshiftDeleteClusterSecurityGroupMessage *)request;

/**
 <p>Deletes an Amazon Redshift security group.</p><note><p>You cannot delete a security group that is associated with any clusters. You cannot delete the default security group.</p></note><p> For information about managing security groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html">Amazon Redshift Cluster Security Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteClusterSecurityGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidClusterSecurityGroupState`, `AWSredshiftErrorClusterSecurityGroupNotFound`.
 
 @see AWSredshiftDeleteClusterSecurityGroupMessage
 */
- (void)deleteClusterSecurityGroup:(AWSredshiftDeleteClusterSecurityGroupMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified manual snapshot. The snapshot must be in the <code>available</code> state, with no other users authorized to access the snapshot. </p><p>Unlike automated snapshots, manual snapshots are retained even after you delete your cluster. Amazon Redshift does not delete your manual snapshots. You must delete manual snapshot explicitly to avoid getting charged. If other accounts are authorized to access the snapshot, you must revoke all of the authorizations before you can delete the snapshot.</p>
 
 @param request A container for the necessary parameters to execute the DeleteClusterSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftDeleteClusterSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidClusterSnapshotState`, `AWSredshiftErrorClusterSnapshotNotFound`.
 
 @see AWSredshiftDeleteClusterSnapshotMessage
 @see AWSredshiftDeleteClusterSnapshotResult
 */
- (AWSTask<AWSredshiftDeleteClusterSnapshotResult *> *)deleteClusterSnapshot:(AWSredshiftDeleteClusterSnapshotMessage *)request;

/**
 <p>Deletes the specified manual snapshot. The snapshot must be in the <code>available</code> state, with no other users authorized to access the snapshot. </p><p>Unlike automated snapshots, manual snapshots are retained even after you delete your cluster. Amazon Redshift does not delete your manual snapshots. You must delete manual snapshot explicitly to avoid getting charged. If other accounts are authorized to access the snapshot, you must revoke all of the authorizations before you can delete the snapshot.</p>
 
 @param request A container for the necessary parameters to execute the DeleteClusterSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidClusterSnapshotState`, `AWSredshiftErrorClusterSnapshotNotFound`.
 
 @see AWSredshiftDeleteClusterSnapshotMessage
 @see AWSredshiftDeleteClusterSnapshotResult
 */
- (void)deleteClusterSnapshot:(AWSredshiftDeleteClusterSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftDeleteClusterSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified cluster subnet group.</p>
 
 @param request A container for the necessary parameters to execute the DeleteClusterSubnetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidClusterSubnetGroupState`, `AWSredshiftErrorInvalidClusterSubnetState`, `AWSredshiftErrorClusterSubnetGroupNotFound`.
 
 @see AWSredshiftDeleteClusterSubnetGroupMessage
 */
- (AWSTask *)deleteClusterSubnetGroup:(AWSredshiftDeleteClusterSubnetGroupMessage *)request;

/**
 <p>Deletes the specified cluster subnet group.</p>
 
 @param request A container for the necessary parameters to execute the DeleteClusterSubnetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidClusterSubnetGroupState`, `AWSredshiftErrorInvalidClusterSubnetState`, `AWSredshiftErrorClusterSubnetGroupNotFound`.
 
 @see AWSredshiftDeleteClusterSubnetGroupMessage
 */
- (void)deleteClusterSubnetGroup:(AWSredshiftDeleteClusterSubnetGroupMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an Amazon Redshift event notification subscription.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEventSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorSubscriptionNotFound`, `AWSredshiftErrorInvalidSubscriptionState`.
 
 @see AWSredshiftDeleteEventSubscriptionMessage
 */
- (AWSTask *)deleteEventSubscription:(AWSredshiftDeleteEventSubscriptionMessage *)request;

/**
 <p>Deletes an Amazon Redshift event notification subscription.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEventSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorSubscriptionNotFound`, `AWSredshiftErrorInvalidSubscriptionState`.
 
 @see AWSredshiftDeleteEventSubscriptionMessage
 */
- (void)deleteEventSubscription:(AWSredshiftDeleteEventSubscriptionMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified HSM client certificate.</p>
 
 @param request A container for the necessary parameters to execute the DeleteHsmClientCertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidHsmClientCertificateState`, `AWSredshiftErrorHsmClientCertificateNotFound`.
 
 @see AWSredshiftDeleteHsmClientCertificateMessage
 */
- (AWSTask *)deleteHsmClientCertificate:(AWSredshiftDeleteHsmClientCertificateMessage *)request;

/**
 <p>Deletes the specified HSM client certificate.</p>
 
 @param request A container for the necessary parameters to execute the DeleteHsmClientCertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidHsmClientCertificateState`, `AWSredshiftErrorHsmClientCertificateNotFound`.
 
 @see AWSredshiftDeleteHsmClientCertificateMessage
 */
- (void)deleteHsmClientCertificate:(AWSredshiftDeleteHsmClientCertificateMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified Amazon Redshift HSM configuration.</p>
 
 @param request A container for the necessary parameters to execute the DeleteHsmConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidHsmConfigurationState`, `AWSredshiftErrorHsmConfigurationNotFound`.
 
 @see AWSredshiftDeleteHsmConfigurationMessage
 */
- (AWSTask *)deleteHsmConfiguration:(AWSredshiftDeleteHsmConfigurationMessage *)request;

/**
 <p>Deletes the specified Amazon Redshift HSM configuration.</p>
 
 @param request A container for the necessary parameters to execute the DeleteHsmConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidHsmConfigurationState`, `AWSredshiftErrorHsmConfigurationNotFound`.
 
 @see AWSredshiftDeleteHsmConfigurationMessage
 */
- (void)deleteHsmConfiguration:(AWSredshiftDeleteHsmConfigurationMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a scheduled action. </p>
 
 @param request A container for the necessary parameters to execute the DeleteScheduledAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorScheduledActionNotFound`, `AWSredshiftErrorUnauthorizedOperation`.
 
 @see AWSredshiftDeleteScheduledActionMessage
 */
- (AWSTask *)deleteScheduledAction:(AWSredshiftDeleteScheduledActionMessage *)request;

/**
 <p>Deletes a scheduled action. </p>
 
 @param request A container for the necessary parameters to execute the DeleteScheduledAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorScheduledActionNotFound`, `AWSredshiftErrorUnauthorizedOperation`.
 
 @see AWSredshiftDeleteScheduledActionMessage
 */
- (void)deleteScheduledAction:(AWSredshiftDeleteScheduledActionMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified snapshot copy grant.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSnapshotCopyGrant service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidSnapshotCopyGrantState`, `AWSredshiftErrorSnapshotCopyGrantNotFound`.
 
 @see AWSredshiftDeleteSnapshotCopyGrantMessage
 */
- (AWSTask *)deleteSnapshotCopyGrant:(AWSredshiftDeleteSnapshotCopyGrantMessage *)request;

/**
 <p>Deletes the specified snapshot copy grant.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSnapshotCopyGrant service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidSnapshotCopyGrantState`, `AWSredshiftErrorSnapshotCopyGrantNotFound`.
 
 @see AWSredshiftDeleteSnapshotCopyGrantMessage
 */
- (void)deleteSnapshotCopyGrant:(AWSredshiftDeleteSnapshotCopyGrantMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a snapshot schedule.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSnapshotSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidClusterSnapshotScheduleState`, `AWSredshiftErrorSnapshotScheduleNotFound`.
 
 @see AWSredshiftDeleteSnapshotScheduleMessage
 */
- (AWSTask *)deleteSnapshotSchedule:(AWSredshiftDeleteSnapshotScheduleMessage *)request;

/**
 <p>Deletes a snapshot schedule.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSnapshotSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidClusterSnapshotScheduleState`, `AWSredshiftErrorSnapshotScheduleNotFound`.
 
 @see AWSredshiftDeleteSnapshotScheduleMessage
 */
- (void)deleteSnapshotSchedule:(AWSredshiftDeleteSnapshotScheduleMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes tags from a resource. You must provide the ARN of the resource from which you want to delete the tag or tags.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorResourceNotFound`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftDeleteTagsMessage
 */
- (AWSTask *)deleteTags:(AWSredshiftDeleteTagsMessage *)request;

/**
 <p>Deletes tags from a resource. You must provide the ARN of the resource from which you want to delete the tag or tags.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorResourceNotFound`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftDeleteTagsMessage
 */
- (void)deleteTags:(AWSredshiftDeleteTagsMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a usage limit from a cluster.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUsageLimit service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorUsageLimitNotFound`, `AWSredshiftErrorUnsupportedOperation`.
 
 @see AWSredshiftDeleteUsageLimitMessage
 */
- (AWSTask *)deleteUsageLimit:(AWSredshiftDeleteUsageLimitMessage *)request;

/**
 <p>Deletes a usage limit from a cluster.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUsageLimit service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorUsageLimitNotFound`, `AWSredshiftErrorUnsupportedOperation`.
 
 @see AWSredshiftDeleteUsageLimitMessage
 */
- (void)deleteUsageLimit:(AWSredshiftDeleteUsageLimitMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of attributes attached to an account</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccountAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftAccountAttributeList`.
 
 @see AWSredshiftDescribeAccountAttributesMessage
 @see AWSredshiftAccountAttributeList
 */
- (AWSTask<AWSredshiftAccountAttributeList *> *)describeAccountAttributes:(AWSredshiftDescribeAccountAttributesMessage *)request;

/**
 <p>Returns a list of attributes attached to an account</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccountAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSredshiftDescribeAccountAttributesMessage
 @see AWSredshiftAccountAttributeList
 */
- (void)describeAccountAttributes:(AWSredshiftDescribeAccountAttributesMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftAccountAttributeList * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an array of <code>ClusterDbRevision</code> objects.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClusterDbRevisions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftClusterDbRevisionsMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorInvalidClusterState`.
 
 @see AWSredshiftDescribeClusterDbRevisionsMessage
 @see AWSredshiftClusterDbRevisionsMessage
 */
- (AWSTask<AWSredshiftClusterDbRevisionsMessage *> *)describeClusterDbRevisions:(AWSredshiftDescribeClusterDbRevisionsMessage *)request;

/**
 <p>Returns an array of <code>ClusterDbRevision</code> objects.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClusterDbRevisions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorInvalidClusterState`.
 
 @see AWSredshiftDescribeClusterDbRevisionsMessage
 @see AWSredshiftClusterDbRevisionsMessage
 */
- (void)describeClusterDbRevisions:(AWSredshiftDescribeClusterDbRevisionsMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftClusterDbRevisionsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of Amazon Redshift parameter groups, including parameter groups you created and the default parameter group. For each parameter group, the response includes the parameter group name, description, and parameter group family name. You can optionally specify a name to retrieve the description of a specific parameter group.</p><p> For more information about parameters and parameter groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon Redshift Parameter Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p><p>If you specify both tag keys and tag values in the same request, Amazon Redshift returns all parameter groups that match any combination of the specified keys and values. For example, if you have <code>owner</code> and <code>environment</code> for tag keys, and <code>admin</code> and <code>test</code> for tag values, all parameter groups that have any combination of those values are returned.</p><p>If both tag keys and values are omitted from the request, parameter groups are returned regardless of whether they have tag keys or values associated with them.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClusterParameterGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftClusterParameterGroupsMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterParameterGroupNotFound`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftDescribeClusterParameterGroupsMessage
 @see AWSredshiftClusterParameterGroupsMessage
 */
- (AWSTask<AWSredshiftClusterParameterGroupsMessage *> *)describeClusterParameterGroups:(AWSredshiftDescribeClusterParameterGroupsMessage *)request;

/**
 <p>Returns a list of Amazon Redshift parameter groups, including parameter groups you created and the default parameter group. For each parameter group, the response includes the parameter group name, description, and parameter group family name. You can optionally specify a name to retrieve the description of a specific parameter group.</p><p> For more information about parameters and parameter groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon Redshift Parameter Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p><p>If you specify both tag keys and tag values in the same request, Amazon Redshift returns all parameter groups that match any combination of the specified keys and values. For example, if you have <code>owner</code> and <code>environment</code> for tag keys, and <code>admin</code> and <code>test</code> for tag values, all parameter groups that have any combination of those values are returned.</p><p>If both tag keys and values are omitted from the request, parameter groups are returned regardless of whether they have tag keys or values associated with them.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClusterParameterGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterParameterGroupNotFound`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftDescribeClusterParameterGroupsMessage
 @see AWSredshiftClusterParameterGroupsMessage
 */
- (void)describeClusterParameterGroups:(AWSredshiftDescribeClusterParameterGroupsMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftClusterParameterGroupsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a detailed list of parameters contained within the specified Amazon Redshift parameter group. For each parameter the response includes information such as parameter name, description, data type, value, whether the parameter value is modifiable, and so on.</p><p>You can specify <i>source</i> filter to retrieve parameters of only specific type. For example, to retrieve parameters that were modified by a user action such as from <a>ModifyClusterParameterGroup</a>, you can specify <i>source</i> equal to <i>user</i>.</p><p> For more information about parameters and parameter groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon Redshift Parameter Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClusterParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftClusterParameterGroupDetails`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterParameterGroupNotFound`.
 
 @see AWSredshiftDescribeClusterParametersMessage
 @see AWSredshiftClusterParameterGroupDetails
 */
- (AWSTask<AWSredshiftClusterParameterGroupDetails *> *)describeClusterParameters:(AWSredshiftDescribeClusterParametersMessage *)request;

/**
 <p>Returns a detailed list of parameters contained within the specified Amazon Redshift parameter group. For each parameter the response includes information such as parameter name, description, data type, value, whether the parameter value is modifiable, and so on.</p><p>You can specify <i>source</i> filter to retrieve parameters of only specific type. For example, to retrieve parameters that were modified by a user action such as from <a>ModifyClusterParameterGroup</a>, you can specify <i>source</i> equal to <i>user</i>.</p><p> For more information about parameters and parameter groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon Redshift Parameter Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClusterParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterParameterGroupNotFound`.
 
 @see AWSredshiftDescribeClusterParametersMessage
 @see AWSredshiftClusterParameterGroupDetails
 */
- (void)describeClusterParameters:(AWSredshiftDescribeClusterParametersMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftClusterParameterGroupDetails * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about Amazon Redshift security groups. If the name of a security group is specified, the response will contain only information about only that security group.</p><p> For information about managing security groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html">Amazon Redshift Cluster Security Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p><p>If you specify both tag keys and tag values in the same request, Amazon Redshift returns all security groups that match any combination of the specified keys and values. For example, if you have <code>owner</code> and <code>environment</code> for tag keys, and <code>admin</code> and <code>test</code> for tag values, all security groups that have any combination of those values are returned.</p><p>If both tag keys and values are omitted from the request, security groups are returned regardless of whether they have tag keys or values associated with them.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClusterSecurityGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftClusterSecurityGroupMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterSecurityGroupNotFound`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftDescribeClusterSecurityGroupsMessage
 @see AWSredshiftClusterSecurityGroupMessage
 */
- (AWSTask<AWSredshiftClusterSecurityGroupMessage *> *)describeClusterSecurityGroups:(AWSredshiftDescribeClusterSecurityGroupsMessage *)request;

/**
 <p>Returns information about Amazon Redshift security groups. If the name of a security group is specified, the response will contain only information about only that security group.</p><p> For information about managing security groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html">Amazon Redshift Cluster Security Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p><p>If you specify both tag keys and tag values in the same request, Amazon Redshift returns all security groups that match any combination of the specified keys and values. For example, if you have <code>owner</code> and <code>environment</code> for tag keys, and <code>admin</code> and <code>test</code> for tag values, all security groups that have any combination of those values are returned.</p><p>If both tag keys and values are omitted from the request, security groups are returned regardless of whether they have tag keys or values associated with them.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClusterSecurityGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterSecurityGroupNotFound`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftDescribeClusterSecurityGroupsMessage
 @see AWSredshiftClusterSecurityGroupMessage
 */
- (void)describeClusterSecurityGroups:(AWSredshiftDescribeClusterSecurityGroupsMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftClusterSecurityGroupMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns one or more snapshot objects, which contain metadata about your cluster snapshots. By default, this operation returns information about all snapshots of all clusters that are owned by you AWS customer account. No information is returned for snapshots owned by inactive AWS customer accounts.</p><p>If you specify both tag keys and tag values in the same request, Amazon Redshift returns all snapshots that match any combination of the specified keys and values. For example, if you have <code>owner</code> and <code>environment</code> for tag keys, and <code>admin</code> and <code>test</code> for tag values, all snapshots that have any combination of those values are returned. Only snapshots that you own are returned in the response; shared snapshots are not returned with the tag key and tag value request parameters.</p><p>If both tag keys and values are omitted from the request, snapshots are returned regardless of whether they have tag keys or values associated with them.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClusterSnapshots service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftSnapshotMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorClusterSnapshotNotFound`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftDescribeClusterSnapshotsMessage
 @see AWSredshiftSnapshotMessage
 */
- (AWSTask<AWSredshiftSnapshotMessage *> *)describeClusterSnapshots:(AWSredshiftDescribeClusterSnapshotsMessage *)request;

/**
 <p>Returns one or more snapshot objects, which contain metadata about your cluster snapshots. By default, this operation returns information about all snapshots of all clusters that are owned by you AWS customer account. No information is returned for snapshots owned by inactive AWS customer accounts.</p><p>If you specify both tag keys and tag values in the same request, Amazon Redshift returns all snapshots that match any combination of the specified keys and values. For example, if you have <code>owner</code> and <code>environment</code> for tag keys, and <code>admin</code> and <code>test</code> for tag values, all snapshots that have any combination of those values are returned. Only snapshots that you own are returned in the response; shared snapshots are not returned with the tag key and tag value request parameters.</p><p>If both tag keys and values are omitted from the request, snapshots are returned regardless of whether they have tag keys or values associated with them.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClusterSnapshots service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorClusterSnapshotNotFound`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftDescribeClusterSnapshotsMessage
 @see AWSredshiftSnapshotMessage
 */
- (void)describeClusterSnapshots:(AWSredshiftDescribeClusterSnapshotsMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftSnapshotMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns one or more cluster subnet group objects, which contain metadata about your cluster subnet groups. By default, this operation returns information about all cluster subnet groups that are defined in you AWS account.</p><p>If you specify both tag keys and tag values in the same request, Amazon Redshift returns all subnet groups that match any combination of the specified keys and values. For example, if you have <code>owner</code> and <code>environment</code> for tag keys, and <code>admin</code> and <code>test</code> for tag values, all subnet groups that have any combination of those values are returned.</p><p>If both tag keys and values are omitted from the request, subnet groups are returned regardless of whether they have tag keys or values associated with them.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClusterSubnetGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftClusterSubnetGroupMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterSubnetGroupNotFound`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftDescribeClusterSubnetGroupsMessage
 @see AWSredshiftClusterSubnetGroupMessage
 */
- (AWSTask<AWSredshiftClusterSubnetGroupMessage *> *)describeClusterSubnetGroups:(AWSredshiftDescribeClusterSubnetGroupsMessage *)request;

/**
 <p>Returns one or more cluster subnet group objects, which contain metadata about your cluster subnet groups. By default, this operation returns information about all cluster subnet groups that are defined in you AWS account.</p><p>If you specify both tag keys and tag values in the same request, Amazon Redshift returns all subnet groups that match any combination of the specified keys and values. For example, if you have <code>owner</code> and <code>environment</code> for tag keys, and <code>admin</code> and <code>test</code> for tag values, all subnet groups that have any combination of those values are returned.</p><p>If both tag keys and values are omitted from the request, subnet groups are returned regardless of whether they have tag keys or values associated with them.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClusterSubnetGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterSubnetGroupNotFound`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftDescribeClusterSubnetGroupsMessage
 @see AWSredshiftClusterSubnetGroupMessage
 */
- (void)describeClusterSubnetGroups:(AWSredshiftDescribeClusterSubnetGroupsMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftClusterSubnetGroupMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of all the available maintenance tracks.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClusterTracks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftTrackListMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidClusterTrack`, `AWSredshiftErrorUnauthorizedOperation`.
 
 @see AWSredshiftDescribeClusterTracksMessage
 @see AWSredshiftTrackListMessage
 */
- (AWSTask<AWSredshiftTrackListMessage *> *)describeClusterTracks:(AWSredshiftDescribeClusterTracksMessage *)request;

/**
 <p>Returns a list of all the available maintenance tracks.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClusterTracks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidClusterTrack`, `AWSredshiftErrorUnauthorizedOperation`.
 
 @see AWSredshiftDescribeClusterTracksMessage
 @see AWSredshiftTrackListMessage
 */
- (void)describeClusterTracks:(AWSredshiftDescribeClusterTracksMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftTrackListMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns descriptions of the available Amazon Redshift cluster versions. You can call this operation even before creating any clusters to learn more about the Amazon Redshift versions. For more information about managing clusters, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon Redshift Clusters</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClusterVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftClusterVersionsMessage`.
 
 @see AWSredshiftDescribeClusterVersionsMessage
 @see AWSredshiftClusterVersionsMessage
 */
- (AWSTask<AWSredshiftClusterVersionsMessage *> *)describeClusterVersions:(AWSredshiftDescribeClusterVersionsMessage *)request;

/**
 <p>Returns descriptions of the available Amazon Redshift cluster versions. You can call this operation even before creating any clusters to learn more about the Amazon Redshift versions. For more information about managing clusters, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon Redshift Clusters</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClusterVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSredshiftDescribeClusterVersionsMessage
 @see AWSredshiftClusterVersionsMessage
 */
- (void)describeClusterVersions:(AWSredshiftDescribeClusterVersionsMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftClusterVersionsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns properties of provisioned clusters including general cluster properties, cluster database properties, maintenance and backup properties, and security and access properties. This operation supports pagination. For more information about managing clusters, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon Redshift Clusters</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p><p>If you specify both tag keys and tag values in the same request, Amazon Redshift returns all clusters that match any combination of the specified keys and values. For example, if you have <code>owner</code> and <code>environment</code> for tag keys, and <code>admin</code> and <code>test</code> for tag values, all clusters that have any combination of those values are returned.</p><p>If both tag keys and values are omitted from the request, clusters are returned regardless of whether they have tag keys or values associated with them.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClusters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftClustersMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftDescribeClustersMessage
 @see AWSredshiftClustersMessage
 */
- (AWSTask<AWSredshiftClustersMessage *> *)describeClusters:(AWSredshiftDescribeClustersMessage *)request;

/**
 <p>Returns properties of provisioned clusters including general cluster properties, cluster database properties, maintenance and backup properties, and security and access properties. This operation supports pagination. For more information about managing clusters, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon Redshift Clusters</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p><p>If you specify both tag keys and tag values in the same request, Amazon Redshift returns all clusters that match any combination of the specified keys and values. For example, if you have <code>owner</code> and <code>environment</code> for tag keys, and <code>admin</code> and <code>test</code> for tag values, all clusters that have any combination of those values are returned.</p><p>If both tag keys and values are omitted from the request, clusters are returned regardless of whether they have tag keys or values associated with them.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClusters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftDescribeClustersMessage
 @see AWSredshiftClustersMessage
 */
- (void)describeClusters:(AWSredshiftDescribeClustersMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftClustersMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of parameter settings for the specified parameter group family.</p><p> For more information about parameters and parameter groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon Redshift Parameter Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDefaultClusterParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftDescribeDefaultClusterParametersResult`.
 
 @see AWSredshiftDescribeDefaultClusterParametersMessage
 @see AWSredshiftDescribeDefaultClusterParametersResult
 */
- (AWSTask<AWSredshiftDescribeDefaultClusterParametersResult *> *)describeDefaultClusterParameters:(AWSredshiftDescribeDefaultClusterParametersMessage *)request;

/**
 <p>Returns a list of parameter settings for the specified parameter group family.</p><p> For more information about parameters and parameter groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon Redshift Parameter Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDefaultClusterParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSredshiftDescribeDefaultClusterParametersMessage
 @see AWSredshiftDescribeDefaultClusterParametersResult
 */
- (void)describeDefaultClusterParameters:(AWSredshiftDescribeDefaultClusterParametersMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftDescribeDefaultClusterParametersResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Displays a list of event categories for all event source types, or for a specified source type. For a list of the event categories and source types, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-event-notifications.html">Amazon Redshift Event Notifications</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEventCategories service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftEventCategoriesMessage`.
 
 @see AWSredshiftDescribeEventCategoriesMessage
 @see AWSredshiftEventCategoriesMessage
 */
- (AWSTask<AWSredshiftEventCategoriesMessage *> *)describeEventCategories:(AWSredshiftDescribeEventCategoriesMessage *)request;

/**
 <p>Displays a list of event categories for all event source types, or for a specified source type. For a list of the event categories and source types, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-event-notifications.html">Amazon Redshift Event Notifications</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEventCategories service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSredshiftDescribeEventCategoriesMessage
 @see AWSredshiftEventCategoriesMessage
 */
- (void)describeEventCategories:(AWSredshiftDescribeEventCategoriesMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftEventCategoriesMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists descriptions of all the Amazon Redshift event notification subscriptions for a customer account. If you specify a subscription name, lists the description for that subscription.</p><p>If you specify both tag keys and tag values in the same request, Amazon Redshift returns all event notification subscriptions that match any combination of the specified keys and values. For example, if you have <code>owner</code> and <code>environment</code> for tag keys, and <code>admin</code> and <code>test</code> for tag values, all subscriptions that have any combination of those values are returned.</p><p>If both tag keys and values are omitted from the request, subscriptions are returned regardless of whether they have tag keys or values associated with them.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEventSubscriptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftEventSubscriptionsMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorSubscriptionNotFound`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftDescribeEventSubscriptionsMessage
 @see AWSredshiftEventSubscriptionsMessage
 */
- (AWSTask<AWSredshiftEventSubscriptionsMessage *> *)describeEventSubscriptions:(AWSredshiftDescribeEventSubscriptionsMessage *)request;

/**
 <p>Lists descriptions of all the Amazon Redshift event notification subscriptions for a customer account. If you specify a subscription name, lists the description for that subscription.</p><p>If you specify both tag keys and tag values in the same request, Amazon Redshift returns all event notification subscriptions that match any combination of the specified keys and values. For example, if you have <code>owner</code> and <code>environment</code> for tag keys, and <code>admin</code> and <code>test</code> for tag values, all subscriptions that have any combination of those values are returned.</p><p>If both tag keys and values are omitted from the request, subscriptions are returned regardless of whether they have tag keys or values associated with them.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEventSubscriptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorSubscriptionNotFound`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftDescribeEventSubscriptionsMessage
 @see AWSredshiftEventSubscriptionsMessage
 */
- (void)describeEventSubscriptions:(AWSredshiftDescribeEventSubscriptionsMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftEventSubscriptionsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns events related to clusters, security groups, snapshots, and parameter groups for the past 14 days. Events specific to a particular cluster, security group, snapshot or parameter group can be obtained by providing the name as a parameter. By default, the past hour of events are returned.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftEventsMessage`.
 
 @see AWSredshiftDescribeEventsMessage
 @see AWSredshiftEventsMessage
 */
- (AWSTask<AWSredshiftEventsMessage *> *)describeEvents:(AWSredshiftDescribeEventsMessage *)request;

/**
 <p>Returns events related to clusters, security groups, snapshots, and parameter groups for the past 14 days. Events specific to a particular cluster, security group, snapshot or parameter group can be obtained by providing the name as a parameter. By default, the past hour of events are returned.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSredshiftDescribeEventsMessage
 @see AWSredshiftEventsMessage
 */
- (void)describeEvents:(AWSredshiftDescribeEventsMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftEventsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the specified HSM client certificate. If no certificate ID is specified, returns information about all the HSM certificates owned by your AWS customer account.</p><p>If you specify both tag keys and tag values in the same request, Amazon Redshift returns all HSM client certificates that match any combination of the specified keys and values. For example, if you have <code>owner</code> and <code>environment</code> for tag keys, and <code>admin</code> and <code>test</code> for tag values, all HSM client certificates that have any combination of those values are returned.</p><p>If both tag keys and values are omitted from the request, HSM client certificates are returned regardless of whether they have tag keys or values associated with them.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHsmClientCertificates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftHsmClientCertificateMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorHsmClientCertificateNotFound`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftDescribeHsmClientCertificatesMessage
 @see AWSredshiftHsmClientCertificateMessage
 */
- (AWSTask<AWSredshiftHsmClientCertificateMessage *> *)describeHsmClientCertificates:(AWSredshiftDescribeHsmClientCertificatesMessage *)request;

/**
 <p>Returns information about the specified HSM client certificate. If no certificate ID is specified, returns information about all the HSM certificates owned by your AWS customer account.</p><p>If you specify both tag keys and tag values in the same request, Amazon Redshift returns all HSM client certificates that match any combination of the specified keys and values. For example, if you have <code>owner</code> and <code>environment</code> for tag keys, and <code>admin</code> and <code>test</code> for tag values, all HSM client certificates that have any combination of those values are returned.</p><p>If both tag keys and values are omitted from the request, HSM client certificates are returned regardless of whether they have tag keys or values associated with them.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHsmClientCertificates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorHsmClientCertificateNotFound`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftDescribeHsmClientCertificatesMessage
 @see AWSredshiftHsmClientCertificateMessage
 */
- (void)describeHsmClientCertificates:(AWSredshiftDescribeHsmClientCertificatesMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftHsmClientCertificateMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the specified Amazon Redshift HSM configuration. If no configuration ID is specified, returns information about all the HSM configurations owned by your AWS customer account.</p><p>If you specify both tag keys and tag values in the same request, Amazon Redshift returns all HSM connections that match any combination of the specified keys and values. For example, if you have <code>owner</code> and <code>environment</code> for tag keys, and <code>admin</code> and <code>test</code> for tag values, all HSM connections that have any combination of those values are returned.</p><p>If both tag keys and values are omitted from the request, HSM connections are returned regardless of whether they have tag keys or values associated with them.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHsmConfigurations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftHsmConfigurationMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorHsmConfigurationNotFound`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftDescribeHsmConfigurationsMessage
 @see AWSredshiftHsmConfigurationMessage
 */
- (AWSTask<AWSredshiftHsmConfigurationMessage *> *)describeHsmConfigurations:(AWSredshiftDescribeHsmConfigurationsMessage *)request;

/**
 <p>Returns information about the specified Amazon Redshift HSM configuration. If no configuration ID is specified, returns information about all the HSM configurations owned by your AWS customer account.</p><p>If you specify both tag keys and tag values in the same request, Amazon Redshift returns all HSM connections that match any combination of the specified keys and values. For example, if you have <code>owner</code> and <code>environment</code> for tag keys, and <code>admin</code> and <code>test</code> for tag values, all HSM connections that have any combination of those values are returned.</p><p>If both tag keys and values are omitted from the request, HSM connections are returned regardless of whether they have tag keys or values associated with them.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHsmConfigurations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorHsmConfigurationNotFound`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftDescribeHsmConfigurationsMessage
 @see AWSredshiftHsmConfigurationMessage
 */
- (void)describeHsmConfigurations:(AWSredshiftDescribeHsmConfigurationsMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftHsmConfigurationMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes whether information, such as queries and connection attempts, is being logged for the specified Amazon Redshift cluster.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLoggingStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftLoggingStatus`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`.
 
 @see AWSredshiftDescribeLoggingStatusMessage
 @see AWSredshiftLoggingStatus
 */
- (AWSTask<AWSredshiftLoggingStatus *> *)describeLoggingStatus:(AWSredshiftDescribeLoggingStatusMessage *)request;

/**
 <p>Describes whether information, such as queries and connection attempts, is being logged for the specified Amazon Redshift cluster.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLoggingStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`.
 
 @see AWSredshiftDescribeLoggingStatusMessage
 @see AWSredshiftLoggingStatus
 */
- (void)describeLoggingStatus:(AWSredshiftDescribeLoggingStatusMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftLoggingStatus * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns properties of possible node configurations such as node type, number of nodes, and disk usage for the specified action type.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNodeConfigurationOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftNodeConfigurationOptionsMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterSnapshotNotFound`, `AWSredshiftErrorInvalidClusterSnapshotState`, `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorAccessToSnapshotDenied`.
 
 @see AWSredshiftDescribeNodeConfigurationOptionsMessage
 @see AWSredshiftNodeConfigurationOptionsMessage
 */
- (AWSTask<AWSredshiftNodeConfigurationOptionsMessage *> *)describeNodeConfigurationOptions:(AWSredshiftDescribeNodeConfigurationOptionsMessage *)request;

/**
 <p>Returns properties of possible node configurations such as node type, number of nodes, and disk usage for the specified action type.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNodeConfigurationOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterSnapshotNotFound`, `AWSredshiftErrorInvalidClusterSnapshotState`, `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorAccessToSnapshotDenied`.
 
 @see AWSredshiftDescribeNodeConfigurationOptionsMessage
 @see AWSredshiftNodeConfigurationOptionsMessage
 */
- (void)describeNodeConfigurationOptions:(AWSredshiftDescribeNodeConfigurationOptionsMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftNodeConfigurationOptionsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of orderable cluster options. Before you create a new cluster you can use this operation to find what options are available, such as the EC2 Availability Zones (AZ) in the specific AWS Region that you can specify, and the node types you can request. The node types differ by available storage, memory, CPU and price. With the cost involved you might want to obtain a list of cluster options in the specific region and specify values when creating a cluster. For more information about managing clusters, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon Redshift Clusters</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOrderableClusterOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftOrderableClusterOptionsMessage`.
 
 @see AWSredshiftDescribeOrderableClusterOptionsMessage
 @see AWSredshiftOrderableClusterOptionsMessage
 */
- (AWSTask<AWSredshiftOrderableClusterOptionsMessage *> *)describeOrderableClusterOptions:(AWSredshiftDescribeOrderableClusterOptionsMessage *)request;

/**
 <p>Returns a list of orderable cluster options. Before you create a new cluster you can use this operation to find what options are available, such as the EC2 Availability Zones (AZ) in the specific AWS Region that you can specify, and the node types you can request. The node types differ by available storage, memory, CPU and price. With the cost involved you might want to obtain a list of cluster options in the specific region and specify values when creating a cluster. For more information about managing clusters, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon Redshift Clusters</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOrderableClusterOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSredshiftDescribeOrderableClusterOptionsMessage
 @see AWSredshiftOrderableClusterOptionsMessage
 */
- (void)describeOrderableClusterOptions:(AWSredshiftDescribeOrderableClusterOptionsMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftOrderableClusterOptionsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the available reserved node offerings by Amazon Redshift with their descriptions including the node type, the fixed and recurring costs of reserving the node and duration the node will be reserved for you. These descriptions help you determine which reserve node offering you want to purchase. You then use the unique offering ID in you call to <a>PurchaseReservedNodeOffering</a> to reserve one or more nodes for your Amazon Redshift cluster. </p><p> For more information about reserved node offerings, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/purchase-reserved-node-instance.html">Purchasing Reserved Nodes</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedNodeOfferings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftReservedNodeOfferingsMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorReservedNodeOfferingNotFound`, `AWSredshiftErrorUnsupportedOperation`, `AWSredshiftErrorDependentServiceUnavailable`.
 
 @see AWSredshiftDescribeReservedNodeOfferingsMessage
 @see AWSredshiftReservedNodeOfferingsMessage
 */
- (AWSTask<AWSredshiftReservedNodeOfferingsMessage *> *)describeReservedNodeOfferings:(AWSredshiftDescribeReservedNodeOfferingsMessage *)request;

/**
 <p>Returns a list of the available reserved node offerings by Amazon Redshift with their descriptions including the node type, the fixed and recurring costs of reserving the node and duration the node will be reserved for you. These descriptions help you determine which reserve node offering you want to purchase. You then use the unique offering ID in you call to <a>PurchaseReservedNodeOffering</a> to reserve one or more nodes for your Amazon Redshift cluster. </p><p> For more information about reserved node offerings, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/purchase-reserved-node-instance.html">Purchasing Reserved Nodes</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedNodeOfferings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorReservedNodeOfferingNotFound`, `AWSredshiftErrorUnsupportedOperation`, `AWSredshiftErrorDependentServiceUnavailable`.
 
 @see AWSredshiftDescribeReservedNodeOfferingsMessage
 @see AWSredshiftReservedNodeOfferingsMessage
 */
- (void)describeReservedNodeOfferings:(AWSredshiftDescribeReservedNodeOfferingsMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftReservedNodeOfferingsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the descriptions of the reserved nodes.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedNodes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftReservedNodesMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorReservedNodeNotFound`, `AWSredshiftErrorDependentServiceUnavailable`.
 
 @see AWSredshiftDescribeReservedNodesMessage
 @see AWSredshiftReservedNodesMessage
 */
- (AWSTask<AWSredshiftReservedNodesMessage *> *)describeReservedNodes:(AWSredshiftDescribeReservedNodesMessage *)request;

/**
 <p>Returns the descriptions of the reserved nodes.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedNodes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorReservedNodeNotFound`, `AWSredshiftErrorDependentServiceUnavailable`.
 
 @see AWSredshiftDescribeReservedNodesMessage
 @see AWSredshiftReservedNodesMessage
 */
- (void)describeReservedNodes:(AWSredshiftDescribeReservedNodesMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftReservedNodesMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the last resize operation for the specified cluster. If no resize operation has ever been initiated for the specified cluster, a <code>HTTP 404</code> error is returned. If a resize operation was initiated and completed, the status of the resize remains as <code>SUCCEEDED</code> until the next resize. </p><p>A resize operation can be requested using <a>ModifyCluster</a> and specifying a different number or type of nodes for the cluster. </p>
 
 @param request A container for the necessary parameters to execute the DescribeResize service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftResizeProgressMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorResizeNotFound`.
 
 @see AWSredshiftDescribeResizeMessage
 @see AWSredshiftResizeProgressMessage
 */
- (AWSTask<AWSredshiftResizeProgressMessage *> *)describeResize:(AWSredshiftDescribeResizeMessage *)request;

/**
 <p>Returns information about the last resize operation for the specified cluster. If no resize operation has ever been initiated for the specified cluster, a <code>HTTP 404</code> error is returned. If a resize operation was initiated and completed, the status of the resize remains as <code>SUCCEEDED</code> until the next resize. </p><p>A resize operation can be requested using <a>ModifyCluster</a> and specifying a different number or type of nodes for the cluster. </p>
 
 @param request A container for the necessary parameters to execute the DescribeResize service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorResizeNotFound`.
 
 @see AWSredshiftDescribeResizeMessage
 @see AWSredshiftResizeProgressMessage
 */
- (void)describeResize:(AWSredshiftDescribeResizeMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftResizeProgressMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes properties of scheduled actions. </p>
 
 @param request A container for the necessary parameters to execute the DescribeScheduledActions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftScheduledActionsMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorScheduledActionNotFound`, `AWSredshiftErrorUnauthorizedOperation`.
 
 @see AWSredshiftDescribeScheduledActionsMessage
 @see AWSredshiftScheduledActionsMessage
 */
- (AWSTask<AWSredshiftScheduledActionsMessage *> *)describeScheduledActions:(AWSredshiftDescribeScheduledActionsMessage *)request;

/**
 <p>Describes properties of scheduled actions. </p>
 
 @param request A container for the necessary parameters to execute the DescribeScheduledActions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorScheduledActionNotFound`, `AWSredshiftErrorUnauthorizedOperation`.
 
 @see AWSredshiftDescribeScheduledActionsMessage
 @see AWSredshiftScheduledActionsMessage
 */
- (void)describeScheduledActions:(AWSredshiftDescribeScheduledActionsMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftScheduledActionsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of snapshot copy grants owned by the AWS account in the destination region.</p><p> For more information about managing snapshot copy grants, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-db-encryption.html">Amazon Redshift Database Encryption</a> in the <i>Amazon Redshift Cluster Management Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeSnapshotCopyGrants service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftSnapshotCopyGrantMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorSnapshotCopyGrantNotFound`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftDescribeSnapshotCopyGrantsMessage
 @see AWSredshiftSnapshotCopyGrantMessage
 */
- (AWSTask<AWSredshiftSnapshotCopyGrantMessage *> *)describeSnapshotCopyGrants:(AWSredshiftDescribeSnapshotCopyGrantsMessage *)request;

/**
 <p>Returns a list of snapshot copy grants owned by the AWS account in the destination region.</p><p> For more information about managing snapshot copy grants, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-db-encryption.html">Amazon Redshift Database Encryption</a> in the <i>Amazon Redshift Cluster Management Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeSnapshotCopyGrants service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorSnapshotCopyGrantNotFound`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftDescribeSnapshotCopyGrantsMessage
 @see AWSredshiftSnapshotCopyGrantMessage
 */
- (void)describeSnapshotCopyGrants:(AWSredshiftDescribeSnapshotCopyGrantsMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftSnapshotCopyGrantMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of snapshot schedules. </p>
 
 @param request A container for the necessary parameters to execute the DescribeSnapshotSchedules service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftDescribeSnapshotSchedulesOutputMessage`.
 
 @see AWSredshiftDescribeSnapshotSchedulesMessage
 @see AWSredshiftDescribeSnapshotSchedulesOutputMessage
 */
- (AWSTask<AWSredshiftDescribeSnapshotSchedulesOutputMessage *> *)describeSnapshotSchedules:(AWSredshiftDescribeSnapshotSchedulesMessage *)request;

/**
 <p>Returns a list of snapshot schedules. </p>
 
 @param request A container for the necessary parameters to execute the DescribeSnapshotSchedules service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSredshiftDescribeSnapshotSchedulesMessage
 @see AWSredshiftDescribeSnapshotSchedulesOutputMessage
 */
- (void)describeSnapshotSchedules:(AWSredshiftDescribeSnapshotSchedulesMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftDescribeSnapshotSchedulesOutputMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns account level backups storage size and provisional storage.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStorage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftCustomerStorageMessage`.
 
 @see AWSRequest
 @see AWSredshiftCustomerStorageMessage
 */
- (AWSTask<AWSredshiftCustomerStorageMessage *> *)describeStorage:(AWSRequest *)request;

/**
 <p>Returns account level backups storage size and provisional storage.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStorage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSRequest
 @see AWSredshiftCustomerStorageMessage
 */
- (void)describeStorage:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSredshiftCustomerStorageMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the status of one or more table restore requests made using the <a>RestoreTableFromClusterSnapshot</a> API action. If you don't specify a value for the <code>TableRestoreRequestId</code> parameter, then <code>DescribeTableRestoreStatus</code> returns the status of all table restore requests ordered by the date and time of the request in ascending order. Otherwise <code>DescribeTableRestoreStatus</code> returns the status of the table specified by <code>TableRestoreRequestId</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTableRestoreStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftTableRestoreStatusMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorTableRestoreNotFound`, `AWSredshiftErrorClusterNotFound`.
 
 @see AWSredshiftDescribeTableRestoreStatusMessage
 @see AWSredshiftTableRestoreStatusMessage
 */
- (AWSTask<AWSredshiftTableRestoreStatusMessage *> *)describeTableRestoreStatus:(AWSredshiftDescribeTableRestoreStatusMessage *)request;

/**
 <p>Lists the status of one or more table restore requests made using the <a>RestoreTableFromClusterSnapshot</a> API action. If you don't specify a value for the <code>TableRestoreRequestId</code> parameter, then <code>DescribeTableRestoreStatus</code> returns the status of all table restore requests ordered by the date and time of the request in ascending order. Otherwise <code>DescribeTableRestoreStatus</code> returns the status of the table specified by <code>TableRestoreRequestId</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTableRestoreStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorTableRestoreNotFound`, `AWSredshiftErrorClusterNotFound`.
 
 @see AWSredshiftDescribeTableRestoreStatusMessage
 @see AWSredshiftTableRestoreStatusMessage
 */
- (void)describeTableRestoreStatus:(AWSredshiftDescribeTableRestoreStatusMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftTableRestoreStatusMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of tags. You can return tags from a specific resource by specifying an ARN, or you can return all tags for a given type of resource, such as clusters, snapshots, and so on.</p><p>The following are limitations for <code>DescribeTags</code>: </p><ul><li><p>You cannot specify an ARN and a resource-type value together in the same request.</p></li><li><p>You cannot use the <code>MaxRecords</code> and <code>Marker</code> parameters together with the ARN parameter.</p></li><li><p>The <code>MaxRecords</code> parameter can be a range from 10 to 50 results to return in a request.</p></li></ul><p>If you specify both tag keys and tag values in the same request, Amazon Redshift returns all resources that match any combination of the specified keys and values. For example, if you have <code>owner</code> and <code>environment</code> for tag keys, and <code>admin</code> and <code>test</code> for tag values, all resources that have any combination of those values are returned.</p><p>If both tag keys and values are omitted from the request, resources are returned regardless of whether they have tag keys or values associated with them.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftTaggedResourceListMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorResourceNotFound`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftDescribeTagsMessage
 @see AWSredshiftTaggedResourceListMessage
 */
- (AWSTask<AWSredshiftTaggedResourceListMessage *> *)describeTags:(AWSredshiftDescribeTagsMessage *)request;

/**
 <p>Returns a list of tags. You can return tags from a specific resource by specifying an ARN, or you can return all tags for a given type of resource, such as clusters, snapshots, and so on.</p><p>The following are limitations for <code>DescribeTags</code>: </p><ul><li><p>You cannot specify an ARN and a resource-type value together in the same request.</p></li><li><p>You cannot use the <code>MaxRecords</code> and <code>Marker</code> parameters together with the ARN parameter.</p></li><li><p>The <code>MaxRecords</code> parameter can be a range from 10 to 50 results to return in a request.</p></li></ul><p>If you specify both tag keys and tag values in the same request, Amazon Redshift returns all resources that match any combination of the specified keys and values. For example, if you have <code>owner</code> and <code>environment</code> for tag keys, and <code>admin</code> and <code>test</code> for tag values, all resources that have any combination of those values are returned.</p><p>If both tag keys and values are omitted from the request, resources are returned regardless of whether they have tag keys or values associated with them.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorResourceNotFound`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftDescribeTagsMessage
 @see AWSredshiftTaggedResourceListMessage
 */
- (void)describeTags:(AWSredshiftDescribeTagsMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftTaggedResourceListMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Shows usage limits on a cluster. Results are filtered based on the combination of input usage limit identifier, cluster identifier, and feature type parameters:</p><ul><li><p>If usage limit identifier, cluster identifier, and feature type are not provided, then all usage limit objects for the current account in the current region are returned.</p></li><li><p>If usage limit identifier is provided, then the corresponding usage limit object is returned.</p></li><li><p>If cluster identifier is provided, then all usage limit objects for the specified cluster are returned.</p></li><li><p>If cluster identifier and feature type are provided, then all usage limit objects for the combination of cluster and feature are returned.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeUsageLimits service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftUsageLimitList`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorUnsupportedOperation`.
 
 @see AWSredshiftDescribeUsageLimitsMessage
 @see AWSredshiftUsageLimitList
 */
- (AWSTask<AWSredshiftUsageLimitList *> *)describeUsageLimits:(AWSredshiftDescribeUsageLimitsMessage *)request;

/**
 <p>Shows usage limits on a cluster. Results are filtered based on the combination of input usage limit identifier, cluster identifier, and feature type parameters:</p><ul><li><p>If usage limit identifier, cluster identifier, and feature type are not provided, then all usage limit objects for the current account in the current region are returned.</p></li><li><p>If usage limit identifier is provided, then the corresponding usage limit object is returned.</p></li><li><p>If cluster identifier is provided, then all usage limit objects for the specified cluster are returned.</p></li><li><p>If cluster identifier and feature type are provided, then all usage limit objects for the combination of cluster and feature are returned.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeUsageLimits service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorUnsupportedOperation`.
 
 @see AWSredshiftDescribeUsageLimitsMessage
 @see AWSredshiftUsageLimitList
 */
- (void)describeUsageLimits:(AWSredshiftDescribeUsageLimitsMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftUsageLimitList * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops logging information, such as queries and connection attempts, for the specified Amazon Redshift cluster.</p>
 
 @param request A container for the necessary parameters to execute the DisableLogging service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftLoggingStatus`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`.
 
 @see AWSredshiftDisableLoggingMessage
 @see AWSredshiftLoggingStatus
 */
- (AWSTask<AWSredshiftLoggingStatus *> *)disableLogging:(AWSredshiftDisableLoggingMessage *)request;

/**
 <p>Stops logging information, such as queries and connection attempts, for the specified Amazon Redshift cluster.</p>
 
 @param request A container for the necessary parameters to execute the DisableLogging service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`.
 
 @see AWSredshiftDisableLoggingMessage
 @see AWSredshiftLoggingStatus
 */
- (void)disableLogging:(AWSredshiftDisableLoggingMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftLoggingStatus * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables the automatic copying of snapshots from one region to another region for a specified cluster.</p><p>If your cluster and its snapshots are encrypted using a customer master key (CMK) from AWS KMS, use <a>DeleteSnapshotCopyGrant</a> to delete the grant that grants Amazon Redshift permission to the CMK in the destination region. </p>
 
 @param request A container for the necessary parameters to execute the DisableSnapshotCopy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftDisableSnapshotCopyResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorSnapshotCopyAlreadyDisabled`, `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorUnauthorizedOperation`.
 
 @see AWSredshiftDisableSnapshotCopyMessage
 @see AWSredshiftDisableSnapshotCopyResult
 */
- (AWSTask<AWSredshiftDisableSnapshotCopyResult *> *)disableSnapshotCopy:(AWSredshiftDisableSnapshotCopyMessage *)request;

/**
 <p>Disables the automatic copying of snapshots from one region to another region for a specified cluster.</p><p>If your cluster and its snapshots are encrypted using a customer master key (CMK) from AWS KMS, use <a>DeleteSnapshotCopyGrant</a> to delete the grant that grants Amazon Redshift permission to the CMK in the destination region. </p>
 
 @param request A container for the necessary parameters to execute the DisableSnapshotCopy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorSnapshotCopyAlreadyDisabled`, `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorUnauthorizedOperation`.
 
 @see AWSredshiftDisableSnapshotCopyMessage
 @see AWSredshiftDisableSnapshotCopyResult
 */
- (void)disableSnapshotCopy:(AWSredshiftDisableSnapshotCopyMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftDisableSnapshotCopyResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts logging information, such as queries and connection attempts, for the specified Amazon Redshift cluster.</p>
 
 @param request A container for the necessary parameters to execute the EnableLogging service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftLoggingStatus`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorBucketNotFound`, `AWSredshiftErrorInsufficientS3BucketPolicy`, `AWSredshiftErrorInvalidS3KeyPrefix`, `AWSredshiftErrorInvalidS3BucketName`, `AWSredshiftErrorInvalidClusterState`.
 
 @see AWSredshiftEnableLoggingMessage
 @see AWSredshiftLoggingStatus
 */
- (AWSTask<AWSredshiftLoggingStatus *> *)enableLogging:(AWSredshiftEnableLoggingMessage *)request;

/**
 <p>Starts logging information, such as queries and connection attempts, for the specified Amazon Redshift cluster.</p>
 
 @param request A container for the necessary parameters to execute the EnableLogging service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorBucketNotFound`, `AWSredshiftErrorInsufficientS3BucketPolicy`, `AWSredshiftErrorInvalidS3KeyPrefix`, `AWSredshiftErrorInvalidS3BucketName`, `AWSredshiftErrorInvalidClusterState`.
 
 @see AWSredshiftEnableLoggingMessage
 @see AWSredshiftLoggingStatus
 */
- (void)enableLogging:(AWSredshiftEnableLoggingMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftLoggingStatus * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables the automatic copy of snapshots from one region to another region for a specified cluster.</p>
 
 @param request A container for the necessary parameters to execute the EnableSnapshotCopy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftEnableSnapshotCopyResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorIncompatibleOrderableOptions`, `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorCopyToRegionDisabled`, `AWSredshiftErrorSnapshotCopyAlreadyEnabled`, `AWSredshiftErrorUnknownSnapshotCopyRegion`, `AWSredshiftErrorUnauthorizedOperation`, `AWSredshiftErrorSnapshotCopyGrantNotFound`, `AWSredshiftErrorLimitExceeded`, `AWSredshiftErrorDependentServiceRequestThrottling`, `AWSredshiftErrorInvalidRetentionPeriod`.
 
 @see AWSredshiftEnableSnapshotCopyMessage
 @see AWSredshiftEnableSnapshotCopyResult
 */
- (AWSTask<AWSredshiftEnableSnapshotCopyResult *> *)enableSnapshotCopy:(AWSredshiftEnableSnapshotCopyMessage *)request;

/**
 <p>Enables the automatic copy of snapshots from one region to another region for a specified cluster.</p>
 
 @param request A container for the necessary parameters to execute the EnableSnapshotCopy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorIncompatibleOrderableOptions`, `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorCopyToRegionDisabled`, `AWSredshiftErrorSnapshotCopyAlreadyEnabled`, `AWSredshiftErrorUnknownSnapshotCopyRegion`, `AWSredshiftErrorUnauthorizedOperation`, `AWSredshiftErrorSnapshotCopyGrantNotFound`, `AWSredshiftErrorLimitExceeded`, `AWSredshiftErrorDependentServiceRequestThrottling`, `AWSredshiftErrorInvalidRetentionPeriod`.
 
 @see AWSredshiftEnableSnapshotCopyMessage
 @see AWSredshiftEnableSnapshotCopyResult
 */
- (void)enableSnapshotCopy:(AWSredshiftEnableSnapshotCopyMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftEnableSnapshotCopyResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a database user name and temporary password with temporary authorization to log on to an Amazon Redshift database. The action returns the database user name prefixed with <code>IAM:</code> if <code>AutoCreate</code> is <code>False</code> or <code>IAMA:</code> if <code>AutoCreate</code> is <code>True</code>. You can optionally specify one or more database user groups that the user will join at log on. By default, the temporary credentials expire in 900 seconds. You can optionally specify a duration between 900 seconds (15 minutes) and 3600 seconds (60 minutes). For more information, see <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/generating-user-credentials.html">Using IAM Authentication to Generate Database User Credentials</a> in the Amazon Redshift Cluster Management Guide.</p><p>The AWS Identity and Access Management (IAM)user or role that executes GetClusterCredentials must have an IAM policy attached that allows access to all necessary actions and resources. For more information about permissions, see <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-identity-based.html#redshift-policy-resources.getclustercredentials-resources">Resource Policies for GetClusterCredentials</a> in the Amazon Redshift Cluster Management Guide.</p><p>If the <code>DbGroups</code> parameter is specified, the IAM policy must allow the <code>redshift:JoinGroup</code> action with access to the listed <code>dbgroups</code>. </p><p>In addition, if the <code>AutoCreate</code> parameter is set to <code>True</code>, then the policy must include the <code>redshift:CreateClusterUser</code> privilege.</p><p>If the <code>DbName</code> parameter is specified, the IAM policy must allow access to the resource <code>dbname</code> for the specified database name. </p>
 
 @param request A container for the necessary parameters to execute the GetClusterCredentials service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftClusterCredentials`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorUnsupportedOperation`.
 
 @see AWSredshiftGetClusterCredentialsMessage
 @see AWSredshiftClusterCredentials
 */
- (AWSTask<AWSredshiftClusterCredentials *> *)getClusterCredentials:(AWSredshiftGetClusterCredentialsMessage *)request;

/**
 <p>Returns a database user name and temporary password with temporary authorization to log on to an Amazon Redshift database. The action returns the database user name prefixed with <code>IAM:</code> if <code>AutoCreate</code> is <code>False</code> or <code>IAMA:</code> if <code>AutoCreate</code> is <code>True</code>. You can optionally specify one or more database user groups that the user will join at log on. By default, the temporary credentials expire in 900 seconds. You can optionally specify a duration between 900 seconds (15 minutes) and 3600 seconds (60 minutes). For more information, see <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/generating-user-credentials.html">Using IAM Authentication to Generate Database User Credentials</a> in the Amazon Redshift Cluster Management Guide.</p><p>The AWS Identity and Access Management (IAM)user or role that executes GetClusterCredentials must have an IAM policy attached that allows access to all necessary actions and resources. For more information about permissions, see <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-identity-based.html#redshift-policy-resources.getclustercredentials-resources">Resource Policies for GetClusterCredentials</a> in the Amazon Redshift Cluster Management Guide.</p><p>If the <code>DbGroups</code> parameter is specified, the IAM policy must allow the <code>redshift:JoinGroup</code> action with access to the listed <code>dbgroups</code>. </p><p>In addition, if the <code>AutoCreate</code> parameter is set to <code>True</code>, then the policy must include the <code>redshift:CreateClusterUser</code> privilege.</p><p>If the <code>DbName</code> parameter is specified, the IAM policy must allow access to the resource <code>dbname</code> for the specified database name. </p>
 
 @param request A container for the necessary parameters to execute the GetClusterCredentials service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorUnsupportedOperation`.
 
 @see AWSredshiftGetClusterCredentialsMessage
 @see AWSredshiftClusterCredentials
 */
- (void)getClusterCredentials:(AWSredshiftGetClusterCredentialsMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftClusterCredentials * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an array of DC2 ReservedNodeOfferings that matches the payment type, term, and usage price of the given DC1 reserved node.</p>
 
 @param request A container for the necessary parameters to execute the GetReservedNodeExchangeOfferings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftGetReservedNodeExchangeOfferingsOutputMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorReservedNodeNotFound`, `AWSredshiftErrorInvalidReservedNodeState`, `AWSredshiftErrorReservedNodeAlreadyMigrated`, `AWSredshiftErrorReservedNodeOfferingNotFound`, `AWSredshiftErrorUnsupportedOperation`, `AWSredshiftErrorDependentServiceUnavailable`.
 
 @see AWSredshiftGetReservedNodeExchangeOfferingsInputMessage
 @see AWSredshiftGetReservedNodeExchangeOfferingsOutputMessage
 */
- (AWSTask<AWSredshiftGetReservedNodeExchangeOfferingsOutputMessage *> *)getReservedNodeExchangeOfferings:(AWSredshiftGetReservedNodeExchangeOfferingsInputMessage *)request;

/**
 <p>Returns an array of DC2 ReservedNodeOfferings that matches the payment type, term, and usage price of the given DC1 reserved node.</p>
 
 @param request A container for the necessary parameters to execute the GetReservedNodeExchangeOfferings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorReservedNodeNotFound`, `AWSredshiftErrorInvalidReservedNodeState`, `AWSredshiftErrorReservedNodeAlreadyMigrated`, `AWSredshiftErrorReservedNodeOfferingNotFound`, `AWSredshiftErrorUnsupportedOperation`, `AWSredshiftErrorDependentServiceUnavailable`.
 
 @see AWSredshiftGetReservedNodeExchangeOfferingsInputMessage
 @see AWSredshiftGetReservedNodeExchangeOfferingsOutputMessage
 */
- (void)getReservedNodeExchangeOfferings:(AWSredshiftGetReservedNodeExchangeOfferingsInputMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftGetReservedNodeExchangeOfferingsOutputMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the settings for a cluster.</p><p>You can also change node type and the number of nodes to scale up or down the cluster. When resizing a cluster, you must specify both the number of nodes and the node type even if one of the parameters does not change.</p><p>You can add another security or parameter group, or change the master user password. Resetting a cluster password or modifying the security groups associated with a cluster do not need a reboot. However, modifying a parameter group requires a reboot for parameters to take effect. For more information about managing clusters, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon Redshift Clusters</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftModifyClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorInvalidClusterSecurityGroupState`, `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorNumberOfNodesQuotaExceeded`, `AWSredshiftErrorNumberOfNodesPerClusterLimitExceeded`, `AWSredshiftErrorClusterSecurityGroupNotFound`, `AWSredshiftErrorClusterParameterGroupNotFound`, `AWSredshiftErrorInsufficientClusterCapacity`, `AWSredshiftErrorUnsupportedOption`, `AWSredshiftErrorUnauthorizedOperation`, `AWSredshiftErrorHsmClientCertificateNotFound`, `AWSredshiftErrorHsmConfigurationNotFound`, `AWSredshiftErrorClusterAlreadyExists`, `AWSredshiftErrorLimitExceeded`, `AWSredshiftErrorDependentServiceRequestThrottling`, `AWSredshiftErrorInvalidElasticIp`, `AWSredshiftErrorTableLimitExceeded`, `AWSredshiftErrorInvalidClusterTrack`, `AWSredshiftErrorInvalidRetentionPeriod`.
 
 @see AWSredshiftModifyClusterMessage
 @see AWSredshiftModifyClusterResult
 */
- (AWSTask<AWSredshiftModifyClusterResult *> *)modifyCluster:(AWSredshiftModifyClusterMessage *)request;

/**
 <p>Modifies the settings for a cluster.</p><p>You can also change node type and the number of nodes to scale up or down the cluster. When resizing a cluster, you must specify both the number of nodes and the node type even if one of the parameters does not change.</p><p>You can add another security or parameter group, or change the master user password. Resetting a cluster password or modifying the security groups associated with a cluster do not need a reboot. However, modifying a parameter group requires a reboot for parameters to take effect. For more information about managing clusters, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon Redshift Clusters</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorInvalidClusterSecurityGroupState`, `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorNumberOfNodesQuotaExceeded`, `AWSredshiftErrorNumberOfNodesPerClusterLimitExceeded`, `AWSredshiftErrorClusterSecurityGroupNotFound`, `AWSredshiftErrorClusterParameterGroupNotFound`, `AWSredshiftErrorInsufficientClusterCapacity`, `AWSredshiftErrorUnsupportedOption`, `AWSredshiftErrorUnauthorizedOperation`, `AWSredshiftErrorHsmClientCertificateNotFound`, `AWSredshiftErrorHsmConfigurationNotFound`, `AWSredshiftErrorClusterAlreadyExists`, `AWSredshiftErrorLimitExceeded`, `AWSredshiftErrorDependentServiceRequestThrottling`, `AWSredshiftErrorInvalidElasticIp`, `AWSredshiftErrorTableLimitExceeded`, `AWSredshiftErrorInvalidClusterTrack`, `AWSredshiftErrorInvalidRetentionPeriod`.
 
 @see AWSredshiftModifyClusterMessage
 @see AWSredshiftModifyClusterResult
 */
- (void)modifyCluster:(AWSredshiftModifyClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftModifyClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the database revision of a cluster. The database revision is a unique revision of the database running in a cluster.</p>
 
 @param request A container for the necessary parameters to execute the ModifyClusterDbRevision service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftModifyClusterDbRevisionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorClusterOnLatestRevision`, `AWSredshiftErrorInvalidClusterState`.
 
 @see AWSredshiftModifyClusterDbRevisionMessage
 @see AWSredshiftModifyClusterDbRevisionResult
 */
- (AWSTask<AWSredshiftModifyClusterDbRevisionResult *> *)modifyClusterDbRevision:(AWSredshiftModifyClusterDbRevisionMessage *)request;

/**
 <p>Modifies the database revision of a cluster. The database revision is a unique revision of the database running in a cluster.</p>
 
 @param request A container for the necessary parameters to execute the ModifyClusterDbRevision service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorClusterOnLatestRevision`, `AWSredshiftErrorInvalidClusterState`.
 
 @see AWSredshiftModifyClusterDbRevisionMessage
 @see AWSredshiftModifyClusterDbRevisionResult
 */
- (void)modifyClusterDbRevision:(AWSredshiftModifyClusterDbRevisionMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftModifyClusterDbRevisionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the list of AWS Identity and Access Management (IAM) roles that can be used by the cluster to access other AWS services.</p><p>A cluster can have up to 10 IAM roles associated at any time.</p>
 
 @param request A container for the necessary parameters to execute the ModifyClusterIamRoles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftModifyClusterIamRolesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorClusterNotFound`.
 
 @see AWSredshiftModifyClusterIamRolesMessage
 @see AWSredshiftModifyClusterIamRolesResult
 */
- (AWSTask<AWSredshiftModifyClusterIamRolesResult *> *)modifyClusterIamRoles:(AWSredshiftModifyClusterIamRolesMessage *)request;

/**
 <p>Modifies the list of AWS Identity and Access Management (IAM) roles that can be used by the cluster to access other AWS services.</p><p>A cluster can have up to 10 IAM roles associated at any time.</p>
 
 @param request A container for the necessary parameters to execute the ModifyClusterIamRoles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorClusterNotFound`.
 
 @see AWSredshiftModifyClusterIamRolesMessage
 @see AWSredshiftModifyClusterIamRolesResult
 */
- (void)modifyClusterIamRoles:(AWSredshiftModifyClusterIamRolesMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftModifyClusterIamRolesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the maintenance settings of a cluster.</p>
 
 @param request A container for the necessary parameters to execute the ModifyClusterMaintenance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftModifyClusterMaintenanceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorInvalidClusterState`.
 
 @see AWSredshiftModifyClusterMaintenanceMessage
 @see AWSredshiftModifyClusterMaintenanceResult
 */
- (AWSTask<AWSredshiftModifyClusterMaintenanceResult *> *)modifyClusterMaintenance:(AWSredshiftModifyClusterMaintenanceMessage *)request;

/**
 <p>Modifies the maintenance settings of a cluster.</p>
 
 @param request A container for the necessary parameters to execute the ModifyClusterMaintenance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorInvalidClusterState`.
 
 @see AWSredshiftModifyClusterMaintenanceMessage
 @see AWSredshiftModifyClusterMaintenanceResult
 */
- (void)modifyClusterMaintenance:(AWSredshiftModifyClusterMaintenanceMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftModifyClusterMaintenanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the parameters of a parameter group.</p><p> For more information about parameters and parameter groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon Redshift Parameter Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyClusterParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftClusterParameterGroupNameMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterParameterGroupNotFound`, `AWSredshiftErrorInvalidClusterParameterGroupState`.
 
 @see AWSredshiftModifyClusterParameterGroupMessage
 @see AWSredshiftClusterParameterGroupNameMessage
 */
- (AWSTask<AWSredshiftClusterParameterGroupNameMessage *> *)modifyClusterParameterGroup:(AWSredshiftModifyClusterParameterGroupMessage *)request;

/**
 <p>Modifies the parameters of a parameter group.</p><p> For more information about parameters and parameter groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon Redshift Parameter Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyClusterParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterParameterGroupNotFound`, `AWSredshiftErrorInvalidClusterParameterGroupState`.
 
 @see AWSredshiftModifyClusterParameterGroupMessage
 @see AWSredshiftClusterParameterGroupNameMessage
 */
- (void)modifyClusterParameterGroup:(AWSredshiftModifyClusterParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftClusterParameterGroupNameMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the settings for a snapshot.</p><p>This exanmple modifies the manual retention period setting for a cluster snapshot.</p>
 
 @param request A container for the necessary parameters to execute the ModifyClusterSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftModifyClusterSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidClusterSnapshotState`, `AWSredshiftErrorClusterSnapshotNotFound`, `AWSredshiftErrorInvalidRetentionPeriod`.
 
 @see AWSredshiftModifyClusterSnapshotMessage
 @see AWSredshiftModifyClusterSnapshotResult
 */
- (AWSTask<AWSredshiftModifyClusterSnapshotResult *> *)modifyClusterSnapshot:(AWSredshiftModifyClusterSnapshotMessage *)request;

/**
 <p>Modifies the settings for a snapshot.</p><p>This exanmple modifies the manual retention period setting for a cluster snapshot.</p>
 
 @param request A container for the necessary parameters to execute the ModifyClusterSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidClusterSnapshotState`, `AWSredshiftErrorClusterSnapshotNotFound`, `AWSredshiftErrorInvalidRetentionPeriod`.
 
 @see AWSredshiftModifyClusterSnapshotMessage
 @see AWSredshiftModifyClusterSnapshotResult
 */
- (void)modifyClusterSnapshot:(AWSredshiftModifyClusterSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftModifyClusterSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies a snapshot schedule for a cluster.</p>
 
 @param request A container for the necessary parameters to execute the ModifyClusterSnapshotSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorSnapshotScheduleNotFound`, `AWSredshiftErrorInvalidClusterSnapshotScheduleState`.
 
 @see AWSredshiftModifyClusterSnapshotScheduleMessage
 */
- (AWSTask *)modifyClusterSnapshotSchedule:(AWSredshiftModifyClusterSnapshotScheduleMessage *)request;

/**
 <p>Modifies a snapshot schedule for a cluster.</p>
 
 @param request A container for the necessary parameters to execute the ModifyClusterSnapshotSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorSnapshotScheduleNotFound`, `AWSredshiftErrorInvalidClusterSnapshotScheduleState`.
 
 @see AWSredshiftModifyClusterSnapshotScheduleMessage
 */
- (void)modifyClusterSnapshotSchedule:(AWSredshiftModifyClusterSnapshotScheduleMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Modifies a cluster subnet group to include the specified list of VPC subnets. The operation replaces the existing list of subnets with the new list of subnets.</p>
 
 @param request A container for the necessary parameters to execute the ModifyClusterSubnetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftModifyClusterSubnetGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterSubnetGroupNotFound`, `AWSredshiftErrorClusterSubnetQuotaExceeded`, `AWSredshiftErrorSubnetAlreadyInUse`, `AWSredshiftErrorInvalidSubnet`, `AWSredshiftErrorUnauthorizedOperation`, `AWSredshiftErrorDependentServiceRequestThrottling`.
 
 @see AWSredshiftModifyClusterSubnetGroupMessage
 @see AWSredshiftModifyClusterSubnetGroupResult
 */
- (AWSTask<AWSredshiftModifyClusterSubnetGroupResult *> *)modifyClusterSubnetGroup:(AWSredshiftModifyClusterSubnetGroupMessage *)request;

/**
 <p>Modifies a cluster subnet group to include the specified list of VPC subnets. The operation replaces the existing list of subnets with the new list of subnets.</p>
 
 @param request A container for the necessary parameters to execute the ModifyClusterSubnetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterSubnetGroupNotFound`, `AWSredshiftErrorClusterSubnetQuotaExceeded`, `AWSredshiftErrorSubnetAlreadyInUse`, `AWSredshiftErrorInvalidSubnet`, `AWSredshiftErrorUnauthorizedOperation`, `AWSredshiftErrorDependentServiceRequestThrottling`.
 
 @see AWSredshiftModifyClusterSubnetGroupMessage
 @see AWSredshiftModifyClusterSubnetGroupResult
 */
- (void)modifyClusterSubnetGroup:(AWSredshiftModifyClusterSubnetGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftModifyClusterSubnetGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies an existing Amazon Redshift event notification subscription.</p>
 
 @param request A container for the necessary parameters to execute the ModifyEventSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftModifyEventSubscriptionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorSubscriptionNotFound`, `AWSredshiftErrorSNSInvalidTopic`, `AWSredshiftErrorSNSNoAuthorization`, `AWSredshiftErrorSNSTopicArnNotFound`, `AWSredshiftErrorSubscriptionEventIdNotFound`, `AWSredshiftErrorSubscriptionCategoryNotFound`, `AWSredshiftErrorSubscriptionSeverityNotFound`, `AWSredshiftErrorSourceNotFound`, `AWSredshiftErrorInvalidSubscriptionState`.
 
 @see AWSredshiftModifyEventSubscriptionMessage
 @see AWSredshiftModifyEventSubscriptionResult
 */
- (AWSTask<AWSredshiftModifyEventSubscriptionResult *> *)modifyEventSubscription:(AWSredshiftModifyEventSubscriptionMessage *)request;

/**
 <p>Modifies an existing Amazon Redshift event notification subscription.</p>
 
 @param request A container for the necessary parameters to execute the ModifyEventSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorSubscriptionNotFound`, `AWSredshiftErrorSNSInvalidTopic`, `AWSredshiftErrorSNSNoAuthorization`, `AWSredshiftErrorSNSTopicArnNotFound`, `AWSredshiftErrorSubscriptionEventIdNotFound`, `AWSredshiftErrorSubscriptionCategoryNotFound`, `AWSredshiftErrorSubscriptionSeverityNotFound`, `AWSredshiftErrorSourceNotFound`, `AWSredshiftErrorInvalidSubscriptionState`.
 
 @see AWSredshiftModifyEventSubscriptionMessage
 @see AWSredshiftModifyEventSubscriptionResult
 */
- (void)modifyEventSubscription:(AWSredshiftModifyEventSubscriptionMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftModifyEventSubscriptionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies a scheduled action. </p>
 
 @param request A container for the necessary parameters to execute the ModifyScheduledAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftScheduledAction`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorScheduledActionNotFound`, `AWSredshiftErrorScheduledActionTypeUnsupported`, `AWSredshiftErrorInvalidSchedule`, `AWSredshiftErrorInvalidScheduledAction`, `AWSredshiftErrorUnauthorizedOperation`.
 
 @see AWSredshiftModifyScheduledActionMessage
 @see AWSredshiftScheduledAction
 */
- (AWSTask<AWSredshiftScheduledAction *> *)modifyScheduledAction:(AWSredshiftModifyScheduledActionMessage *)request;

/**
 <p>Modifies a scheduled action. </p>
 
 @param request A container for the necessary parameters to execute the ModifyScheduledAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorScheduledActionNotFound`, `AWSredshiftErrorScheduledActionTypeUnsupported`, `AWSredshiftErrorInvalidSchedule`, `AWSredshiftErrorInvalidScheduledAction`, `AWSredshiftErrorUnauthorizedOperation`.
 
 @see AWSredshiftModifyScheduledActionMessage
 @see AWSredshiftScheduledAction
 */
- (void)modifyScheduledAction:(AWSredshiftModifyScheduledActionMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftScheduledAction * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the number of days to retain snapshots in the destination AWS Region after they are copied from the source AWS Region. By default, this operation only changes the retention period of copied automated snapshots. The retention periods for both new and existing copied automated snapshots are updated with the new retention period. You can set the manual option to change only the retention periods of copied manual snapshots. If you set this option, only newly copied manual snapshots have the new retention period. </p>
 
 @param request A container for the necessary parameters to execute the ModifySnapshotCopyRetentionPeriod service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftModifySnapshotCopyRetentionPeriodResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorSnapshotCopyDisabled`, `AWSredshiftErrorUnauthorizedOperation`, `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorInvalidRetentionPeriod`.
 
 @see AWSredshiftModifySnapshotCopyRetentionPeriodMessage
 @see AWSredshiftModifySnapshotCopyRetentionPeriodResult
 */
- (AWSTask<AWSredshiftModifySnapshotCopyRetentionPeriodResult *> *)modifySnapshotCopyRetentionPeriod:(AWSredshiftModifySnapshotCopyRetentionPeriodMessage *)request;

/**
 <p>Modifies the number of days to retain snapshots in the destination AWS Region after they are copied from the source AWS Region. By default, this operation only changes the retention period of copied automated snapshots. The retention periods for both new and existing copied automated snapshots are updated with the new retention period. You can set the manual option to change only the retention periods of copied manual snapshots. If you set this option, only newly copied manual snapshots have the new retention period. </p>
 
 @param request A container for the necessary parameters to execute the ModifySnapshotCopyRetentionPeriod service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorSnapshotCopyDisabled`, `AWSredshiftErrorUnauthorizedOperation`, `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorInvalidRetentionPeriod`.
 
 @see AWSredshiftModifySnapshotCopyRetentionPeriodMessage
 @see AWSredshiftModifySnapshotCopyRetentionPeriodResult
 */
- (void)modifySnapshotCopyRetentionPeriod:(AWSredshiftModifySnapshotCopyRetentionPeriodMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftModifySnapshotCopyRetentionPeriodResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies a snapshot schedule. Any schedule associated with a cluster is modified asynchronously.</p>
 
 @param request A container for the necessary parameters to execute the ModifySnapshotSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftSnapshotSchedule`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidSchedule`, `AWSredshiftErrorSnapshotScheduleNotFound`, `AWSredshiftErrorSnapshotScheduleUpdateInProgress`.
 
 @see AWSredshiftModifySnapshotScheduleMessage
 @see AWSredshiftSnapshotSchedule
 */
- (AWSTask<AWSredshiftSnapshotSchedule *> *)modifySnapshotSchedule:(AWSredshiftModifySnapshotScheduleMessage *)request;

/**
 <p>Modifies a snapshot schedule. Any schedule associated with a cluster is modified asynchronously.</p>
 
 @param request A container for the necessary parameters to execute the ModifySnapshotSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidSchedule`, `AWSredshiftErrorSnapshotScheduleNotFound`, `AWSredshiftErrorSnapshotScheduleUpdateInProgress`.
 
 @see AWSredshiftModifySnapshotScheduleMessage
 @see AWSredshiftSnapshotSchedule
 */
- (void)modifySnapshotSchedule:(AWSredshiftModifySnapshotScheduleMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftSnapshotSchedule * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies a usage limit in a cluster. You can't modify the feature type or period of a usage limit.</p>
 
 @param request A container for the necessary parameters to execute the ModifyUsageLimit service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftUsageLimit`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidUsageLimit`, `AWSredshiftErrorUsageLimitNotFound`, `AWSredshiftErrorUnsupportedOperation`.
 
 @see AWSredshiftModifyUsageLimitMessage
 @see AWSredshiftUsageLimit
 */
- (AWSTask<AWSredshiftUsageLimit *> *)modifyUsageLimit:(AWSredshiftModifyUsageLimitMessage *)request;

/**
 <p>Modifies a usage limit in a cluster. You can't modify the feature type or period of a usage limit.</p>
 
 @param request A container for the necessary parameters to execute the ModifyUsageLimit service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidUsageLimit`, `AWSredshiftErrorUsageLimitNotFound`, `AWSredshiftErrorUnsupportedOperation`.
 
 @see AWSredshiftModifyUsageLimitMessage
 @see AWSredshiftUsageLimit
 */
- (void)modifyUsageLimit:(AWSredshiftModifyUsageLimitMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftUsageLimit * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Pauses a cluster.</p>
 
 @param request A container for the necessary parameters to execute the PauseCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftPauseClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorInvalidClusterState`.
 
 @see AWSredshiftPauseClusterMessage
 @see AWSredshiftPauseClusterResult
 */
- (AWSTask<AWSredshiftPauseClusterResult *> *)pauseCluster:(AWSredshiftPauseClusterMessage *)request;

/**
 <p>Pauses a cluster.</p>
 
 @param request A container for the necessary parameters to execute the PauseCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorInvalidClusterState`.
 
 @see AWSredshiftPauseClusterMessage
 @see AWSredshiftPauseClusterResult
 */
- (void)pauseCluster:(AWSredshiftPauseClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftPauseClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allows you to purchase reserved nodes. Amazon Redshift offers a predefined set of reserved node offerings. You can purchase one or more of the offerings. You can call the <a>DescribeReservedNodeOfferings</a> API to obtain the available reserved node offerings. You can call this API by providing a specific reserved node offering and the number of nodes you want to reserve. </p><p> For more information about reserved node offerings, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/purchase-reserved-node-instance.html">Purchasing Reserved Nodes</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PurchaseReservedNodeOffering service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftPurchaseReservedNodeOfferingResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorReservedNodeOfferingNotFound`, `AWSredshiftErrorReservedNodeAlreadyExists`, `AWSredshiftErrorReservedNodeQuotaExceeded`, `AWSredshiftErrorUnsupportedOperation`.
 
 @see AWSredshiftPurchaseReservedNodeOfferingMessage
 @see AWSredshiftPurchaseReservedNodeOfferingResult
 */
- (AWSTask<AWSredshiftPurchaseReservedNodeOfferingResult *> *)purchaseReservedNodeOffering:(AWSredshiftPurchaseReservedNodeOfferingMessage *)request;

/**
 <p>Allows you to purchase reserved nodes. Amazon Redshift offers a predefined set of reserved node offerings. You can purchase one or more of the offerings. You can call the <a>DescribeReservedNodeOfferings</a> API to obtain the available reserved node offerings. You can call this API by providing a specific reserved node offering and the number of nodes you want to reserve. </p><p> For more information about reserved node offerings, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/purchase-reserved-node-instance.html">Purchasing Reserved Nodes</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PurchaseReservedNodeOffering service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorReservedNodeOfferingNotFound`, `AWSredshiftErrorReservedNodeAlreadyExists`, `AWSredshiftErrorReservedNodeQuotaExceeded`, `AWSredshiftErrorUnsupportedOperation`.
 
 @see AWSredshiftPurchaseReservedNodeOfferingMessage
 @see AWSredshiftPurchaseReservedNodeOfferingResult
 */
- (void)purchaseReservedNodeOffering:(AWSredshiftPurchaseReservedNodeOfferingMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftPurchaseReservedNodeOfferingResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Reboots a cluster. This action is taken as soon as possible. It results in a momentary outage to the cluster, during which the cluster status is set to <code>rebooting</code>. A cluster event is created when the reboot is completed. Any pending cluster modifications (see <a>ModifyCluster</a>) are applied at this reboot. For more information about managing clusters, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon Redshift Clusters</a> in the <i>Amazon Redshift Cluster Management Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the RebootCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftRebootClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorClusterNotFound`.
 
 @see AWSredshiftRebootClusterMessage
 @see AWSredshiftRebootClusterResult
 */
- (AWSTask<AWSredshiftRebootClusterResult *> *)rebootCluster:(AWSredshiftRebootClusterMessage *)request;

/**
 <p>Reboots a cluster. This action is taken as soon as possible. It results in a momentary outage to the cluster, during which the cluster status is set to <code>rebooting</code>. A cluster event is created when the reboot is completed. Any pending cluster modifications (see <a>ModifyCluster</a>) are applied at this reboot. For more information about managing clusters, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon Redshift Clusters</a> in the <i>Amazon Redshift Cluster Management Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the RebootCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorClusterNotFound`.
 
 @see AWSredshiftRebootClusterMessage
 @see AWSredshiftRebootClusterResult
 */
- (void)rebootCluster:(AWSredshiftRebootClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftRebootClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets one or more parameters of the specified parameter group to their default values and sets the source values of the parameters to "engine-default". To reset the entire parameter group specify the <i>ResetAllParameters</i> parameter. For parameter changes to take effect you must reboot any associated clusters. </p>
 
 @param request A container for the necessary parameters to execute the ResetClusterParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftClusterParameterGroupNameMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidClusterParameterGroupState`, `AWSredshiftErrorClusterParameterGroupNotFound`.
 
 @see AWSredshiftResetClusterParameterGroupMessage
 @see AWSredshiftClusterParameterGroupNameMessage
 */
- (AWSTask<AWSredshiftClusterParameterGroupNameMessage *> *)resetClusterParameterGroup:(AWSredshiftResetClusterParameterGroupMessage *)request;

/**
 <p>Sets one or more parameters of the specified parameter group to their default values and sets the source values of the parameters to "engine-default". To reset the entire parameter group specify the <i>ResetAllParameters</i> parameter. For parameter changes to take effect you must reboot any associated clusters. </p>
 
 @param request A container for the necessary parameters to execute the ResetClusterParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidClusterParameterGroupState`, `AWSredshiftErrorClusterParameterGroupNotFound`.
 
 @see AWSredshiftResetClusterParameterGroupMessage
 @see AWSredshiftClusterParameterGroupNameMessage
 */
- (void)resetClusterParameterGroup:(AWSredshiftResetClusterParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftClusterParameterGroupNameMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Changes the size of the cluster. You can change the cluster's type, or change the number or type of nodes. The default behavior is to use the elastic resize method. With an elastic resize, your cluster is available for read and write operations more quickly than with the classic resize method. </p><p>Elastic resize operations have the following restrictions:</p><ul><li><p>You can only resize clusters of the following types:</p><ul><li><p>dc2.large</p></li><li><p>dc2.8xlarge</p></li><li><p>ds2.xlarge</p></li><li><p>ds2.8xlarge</p></li><li><p>ra3.4xlarge</p></li><li><p>ra3.16xlarge</p></li></ul></li><li><p>The type of nodes that you add must match the node type for the cluster.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the ResizeCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftResizeClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorNumberOfNodesQuotaExceeded`, `AWSredshiftErrorNumberOfNodesPerClusterLimitExceeded`, `AWSredshiftErrorInsufficientClusterCapacity`, `AWSredshiftErrorUnsupportedOption`, `AWSredshiftErrorUnsupportedOperation`, `AWSredshiftErrorUnauthorizedOperation`, `AWSredshiftErrorLimitExceeded`.
 
 @see AWSredshiftResizeClusterMessage
 @see AWSredshiftResizeClusterResult
 */
- (AWSTask<AWSredshiftResizeClusterResult *> *)resizeCluster:(AWSredshiftResizeClusterMessage *)request;

/**
 <p>Changes the size of the cluster. You can change the cluster's type, or change the number or type of nodes. The default behavior is to use the elastic resize method. With an elastic resize, your cluster is available for read and write operations more quickly than with the classic resize method. </p><p>Elastic resize operations have the following restrictions:</p><ul><li><p>You can only resize clusters of the following types:</p><ul><li><p>dc2.large</p></li><li><p>dc2.8xlarge</p></li><li><p>ds2.xlarge</p></li><li><p>ds2.8xlarge</p></li><li><p>ra3.4xlarge</p></li><li><p>ra3.16xlarge</p></li></ul></li><li><p>The type of nodes that you add must match the node type for the cluster.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the ResizeCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorNumberOfNodesQuotaExceeded`, `AWSredshiftErrorNumberOfNodesPerClusterLimitExceeded`, `AWSredshiftErrorInsufficientClusterCapacity`, `AWSredshiftErrorUnsupportedOption`, `AWSredshiftErrorUnsupportedOperation`, `AWSredshiftErrorUnauthorizedOperation`, `AWSredshiftErrorLimitExceeded`.
 
 @see AWSredshiftResizeClusterMessage
 @see AWSredshiftResizeClusterResult
 */
- (void)resizeCluster:(AWSredshiftResizeClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftResizeClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new cluster from a snapshot. By default, Amazon Redshift creates the resulting cluster with the same configuration as the original cluster from which the snapshot was created, except that the new cluster is created with the default cluster security and parameter groups. After Amazon Redshift creates the cluster, you can use the <a>ModifyCluster</a> API to associate a different security group and different parameter group with the restored cluster. If you are using a DS node type, you can also choose to change to another DS node type of the same size during restore.</p><p>If you restore a cluster into a VPC, you must provide a cluster subnet group where you want the cluster restored.</p><p> For more information about working with snapshots, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html">Amazon Redshift Snapshots</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RestoreFromClusterSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftRestoreFromClusterSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorAccessToSnapshotDenied`, `AWSredshiftErrorClusterAlreadyExists`, `AWSredshiftErrorClusterSnapshotNotFound`, `AWSredshiftErrorClusterQuotaExceeded`, `AWSredshiftErrorInsufficientClusterCapacity`, `AWSredshiftErrorInvalidClusterSnapshotState`, `AWSredshiftErrorInvalidRestore`, `AWSredshiftErrorNumberOfNodesQuotaExceeded`, `AWSredshiftErrorNumberOfNodesPerClusterLimitExceeded`, `AWSredshiftErrorInvalidVPCNetworkState`, `AWSredshiftErrorInvalidClusterSubnetGroupState`, `AWSredshiftErrorInvalidSubnet`, `AWSredshiftErrorClusterSubnetGroupNotFound`, `AWSredshiftErrorUnauthorizedOperation`, `AWSredshiftErrorHsmClientCertificateNotFound`, `AWSredshiftErrorHsmConfigurationNotFound`, `AWSredshiftErrorInvalidElasticIp`, `AWSredshiftErrorClusterParameterGroupNotFound`, `AWSredshiftErrorClusterSecurityGroupNotFound`, `AWSredshiftErrorLimitExceeded`, `AWSredshiftErrorDependentServiceRequestThrottling`, `AWSredshiftErrorInvalidClusterTrack`, `AWSredshiftErrorSnapshotScheduleNotFound`, `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftRestoreFromClusterSnapshotMessage
 @see AWSredshiftRestoreFromClusterSnapshotResult
 */
- (AWSTask<AWSredshiftRestoreFromClusterSnapshotResult *> *)restoreFromClusterSnapshot:(AWSredshiftRestoreFromClusterSnapshotMessage *)request;

/**
 <p>Creates a new cluster from a snapshot. By default, Amazon Redshift creates the resulting cluster with the same configuration as the original cluster from which the snapshot was created, except that the new cluster is created with the default cluster security and parameter groups. After Amazon Redshift creates the cluster, you can use the <a>ModifyCluster</a> API to associate a different security group and different parameter group with the restored cluster. If you are using a DS node type, you can also choose to change to another DS node type of the same size during restore.</p><p>If you restore a cluster into a VPC, you must provide a cluster subnet group where you want the cluster restored.</p><p> For more information about working with snapshots, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html">Amazon Redshift Snapshots</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RestoreFromClusterSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorAccessToSnapshotDenied`, `AWSredshiftErrorClusterAlreadyExists`, `AWSredshiftErrorClusterSnapshotNotFound`, `AWSredshiftErrorClusterQuotaExceeded`, `AWSredshiftErrorInsufficientClusterCapacity`, `AWSredshiftErrorInvalidClusterSnapshotState`, `AWSredshiftErrorInvalidRestore`, `AWSredshiftErrorNumberOfNodesQuotaExceeded`, `AWSredshiftErrorNumberOfNodesPerClusterLimitExceeded`, `AWSredshiftErrorInvalidVPCNetworkState`, `AWSredshiftErrorInvalidClusterSubnetGroupState`, `AWSredshiftErrorInvalidSubnet`, `AWSredshiftErrorClusterSubnetGroupNotFound`, `AWSredshiftErrorUnauthorizedOperation`, `AWSredshiftErrorHsmClientCertificateNotFound`, `AWSredshiftErrorHsmConfigurationNotFound`, `AWSredshiftErrorInvalidElasticIp`, `AWSredshiftErrorClusterParameterGroupNotFound`, `AWSredshiftErrorClusterSecurityGroupNotFound`, `AWSredshiftErrorLimitExceeded`, `AWSredshiftErrorDependentServiceRequestThrottling`, `AWSredshiftErrorInvalidClusterTrack`, `AWSredshiftErrorSnapshotScheduleNotFound`, `AWSredshiftErrorTagLimitExceeded`, `AWSredshiftErrorInvalidTag`.
 
 @see AWSredshiftRestoreFromClusterSnapshotMessage
 @see AWSredshiftRestoreFromClusterSnapshotResult
 */
- (void)restoreFromClusterSnapshot:(AWSredshiftRestoreFromClusterSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftRestoreFromClusterSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new table from a table in an Amazon Redshift cluster snapshot. You must create the new table within the Amazon Redshift cluster that the snapshot was taken from.</p><p>You cannot use <code>RestoreTableFromClusterSnapshot</code> to restore a table with the same name as an existing table in an Amazon Redshift cluster. That is, you cannot overwrite an existing table in a cluster with a restored table. If you want to replace your original table with a new, restored table, then rename or drop your original table before you call <code>RestoreTableFromClusterSnapshot</code>. When you have renamed your original table, then you can pass the original name of the table as the <code>NewTableName</code> parameter value in the call to <code>RestoreTableFromClusterSnapshot</code>. This way, you can replace the original table with the table created from the snapshot.</p>
 
 @param request A container for the necessary parameters to execute the RestoreTableFromClusterSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftRestoreTableFromClusterSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterSnapshotNotFound`, `AWSredshiftErrorInProgressTableRestoreQuotaExceeded`, `AWSredshiftErrorInvalidClusterSnapshotState`, `AWSredshiftErrorInvalidTableRestoreArgument`, `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorUnsupportedOperation`.
 
 @see AWSredshiftRestoreTableFromClusterSnapshotMessage
 @see AWSredshiftRestoreTableFromClusterSnapshotResult
 */
- (AWSTask<AWSredshiftRestoreTableFromClusterSnapshotResult *> *)restoreTableFromClusterSnapshot:(AWSredshiftRestoreTableFromClusterSnapshotMessage *)request;

/**
 <p>Creates a new table from a table in an Amazon Redshift cluster snapshot. You must create the new table within the Amazon Redshift cluster that the snapshot was taken from.</p><p>You cannot use <code>RestoreTableFromClusterSnapshot</code> to restore a table with the same name as an existing table in an Amazon Redshift cluster. That is, you cannot overwrite an existing table in a cluster with a restored table. If you want to replace your original table with a new, restored table, then rename or drop your original table before you call <code>RestoreTableFromClusterSnapshot</code>. When you have renamed your original table, then you can pass the original name of the table as the <code>NewTableName</code> parameter value in the call to <code>RestoreTableFromClusterSnapshot</code>. This way, you can replace the original table with the table created from the snapshot.</p>
 
 @param request A container for the necessary parameters to execute the RestoreTableFromClusterSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterSnapshotNotFound`, `AWSredshiftErrorInProgressTableRestoreQuotaExceeded`, `AWSredshiftErrorInvalidClusterSnapshotState`, `AWSredshiftErrorInvalidTableRestoreArgument`, `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorUnsupportedOperation`.
 
 @see AWSredshiftRestoreTableFromClusterSnapshotMessage
 @see AWSredshiftRestoreTableFromClusterSnapshotResult
 */
- (void)restoreTableFromClusterSnapshot:(AWSredshiftRestoreTableFromClusterSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftRestoreTableFromClusterSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Resumes a paused cluster.</p>
 
 @param request A container for the necessary parameters to execute the ResumeCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftResumeClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorInvalidClusterState`.
 
 @see AWSredshiftResumeClusterMessage
 @see AWSredshiftResumeClusterResult
 */
- (AWSTask<AWSredshiftResumeClusterResult *> *)resumeCluster:(AWSredshiftResumeClusterMessage *)request;

/**
 <p>Resumes a paused cluster.</p>
 
 @param request A container for the necessary parameters to execute the ResumeCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorInvalidClusterState`.
 
 @see AWSredshiftResumeClusterMessage
 @see AWSredshiftResumeClusterResult
 */
- (void)resumeCluster:(AWSredshiftResumeClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftResumeClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Revokes an ingress rule in an Amazon Redshift security group for a previously authorized IP range or Amazon EC2 security group. To add an ingress rule, see <a>AuthorizeClusterSecurityGroupIngress</a>. For information about managing security groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html">Amazon Redshift Cluster Security Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the RevokeClusterSecurityGroupIngress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftRevokeClusterSecurityGroupIngressResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterSecurityGroupNotFound`, `AWSredshiftErrorAuthorizationNotFound`, `AWSredshiftErrorInvalidClusterSecurityGroupState`.
 
 @see AWSredshiftRevokeClusterSecurityGroupIngressMessage
 @see AWSredshiftRevokeClusterSecurityGroupIngressResult
 */
- (AWSTask<AWSredshiftRevokeClusterSecurityGroupIngressResult *> *)revokeClusterSecurityGroupIngress:(AWSredshiftRevokeClusterSecurityGroupIngressMessage *)request;

/**
 <p>Revokes an ingress rule in an Amazon Redshift security group for a previously authorized IP range or Amazon EC2 security group. To add an ingress rule, see <a>AuthorizeClusterSecurityGroupIngress</a>. For information about managing security groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html">Amazon Redshift Cluster Security Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the RevokeClusterSecurityGroupIngress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterSecurityGroupNotFound`, `AWSredshiftErrorAuthorizationNotFound`, `AWSredshiftErrorInvalidClusterSecurityGroupState`.
 
 @see AWSredshiftRevokeClusterSecurityGroupIngressMessage
 @see AWSredshiftRevokeClusterSecurityGroupIngressResult
 */
- (void)revokeClusterSecurityGroupIngress:(AWSredshiftRevokeClusterSecurityGroupIngressMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftRevokeClusterSecurityGroupIngressResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the ability of the specified AWS customer account to restore the specified snapshot. If the account is currently restoring the snapshot, the restore will run to completion.</p><p> For more information about working with snapshots, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html">Amazon Redshift Snapshots</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RevokeSnapshotAccess service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftRevokeSnapshotAccessResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorAccessToSnapshotDenied`, `AWSredshiftErrorAuthorizationNotFound`, `AWSredshiftErrorClusterSnapshotNotFound`.
 
 @see AWSredshiftRevokeSnapshotAccessMessage
 @see AWSredshiftRevokeSnapshotAccessResult
 */
- (AWSTask<AWSredshiftRevokeSnapshotAccessResult *> *)revokeSnapshotAccess:(AWSredshiftRevokeSnapshotAccessMessage *)request;

/**
 <p>Removes the ability of the specified AWS customer account to restore the specified snapshot. If the account is currently restoring the snapshot, the restore will run to completion.</p><p> For more information about working with snapshots, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html">Amazon Redshift Snapshots</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RevokeSnapshotAccess service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorAccessToSnapshotDenied`, `AWSredshiftErrorAuthorizationNotFound`, `AWSredshiftErrorClusterSnapshotNotFound`.
 
 @see AWSredshiftRevokeSnapshotAccessMessage
 @see AWSredshiftRevokeSnapshotAccessResult
 */
- (void)revokeSnapshotAccess:(AWSredshiftRevokeSnapshotAccessMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftRevokeSnapshotAccessResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Rotates the encryption keys for a cluster.</p>
 
 @param request A container for the necessary parameters to execute the RotateEncryptionKey service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSredshiftRotateEncryptionKeyResult`. On failed execution, `task.error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorDependentServiceRequestThrottling`.
 
 @see AWSredshiftRotateEncryptionKeyMessage
 @see AWSredshiftRotateEncryptionKeyResult
 */
- (AWSTask<AWSredshiftRotateEncryptionKeyResult *> *)rotateEncryptionKey:(AWSredshiftRotateEncryptionKeyMessage *)request;

/**
 <p>Rotates the encryption keys for a cluster.</p>
 
 @param request A container for the necessary parameters to execute the RotateEncryptionKey service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSredshiftErrorDomain` domain and the following error code: `AWSredshiftErrorClusterNotFound`, `AWSredshiftErrorInvalidClusterState`, `AWSredshiftErrorDependentServiceRequestThrottling`.
 
 @see AWSredshiftRotateEncryptionKeyMessage
 @see AWSredshiftRotateEncryptionKeyResult
 */
- (void)rotateEncryptionKey:(AWSredshiftRotateEncryptionKeyMessage *)request completionHandler:(void (^ _Nullable)(AWSredshiftRotateEncryptionKeyResult * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
