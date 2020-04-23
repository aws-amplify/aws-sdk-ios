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
#import "AWSrdsModel.h"
#import "AWSrdsResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSrds
FOUNDATION_EXPORT NSString *const AWSrdsSDKVersion;

/**
 <fullname>Amazon Relational Database Service</fullname><p></p><p>Amazon Relational Database Service (Amazon RDS) is a web service that makes it easier to set up, operate, and scale a relational database in the cloud. It provides cost-efficient, resizeable capacity for an industry-standard relational database and manages common database administration tasks, freeing up developers to focus on what makes their applications and businesses unique.</p><p>Amazon RDS gives you access to the capabilities of a MySQL, MariaDB, PostgreSQL, Microsoft SQL Server, Oracle, or Amazon Aurora database server. These capabilities mean that the code, applications, and tools you already use today with your existing databases work with Amazon RDS without modification. Amazon RDS automatically backs up your database and maintains the database software that powers your DB instance. Amazon RDS is flexible: you can scale your DB instance's compute resources and storage capacity to meet your application's demand. As with all Amazon Web Services, there are no up-front investments, and you pay only for the resources you use.</p><p>This interface reference for Amazon RDS contains documentation for a programming or command line interface you can use to manage Amazon RDS. Amazon RDS is asynchronous, which means that some interfaces might require techniques such as polling or callback functions to determine when a command has been applied. In this reference, the parameter descriptions indicate whether a command is applied immediately, on the next instance reboot, or during the maintenance window. The reference structure is as follows, and we list following some related topics from the user guide.</p><p><b>Amazon RDS API Reference</b></p><ul><li><p>For the alphabetical list of API actions, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_Operations.html">API Actions</a>.</p></li><li><p>For the alphabetical list of data types, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_Types.html">Data Types</a>.</p></li><li><p>For a list of common query parameters, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/CommonParameters.html">Common Parameters</a>.</p></li><li><p>For descriptions of the error codes, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/CommonErrors.html">Common Errors</a>.</p></li></ul><p><b>Amazon RDS User Guide</b></p><ul><li><p>For a summary of the Amazon RDS interfaces, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Welcome.html#Welcome.Interfaces">Available RDS Interfaces</a>.</p></li><li><p>For more information about how to use the Query API, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Using_the_Query_API.html">Using the Query API</a>.</p></li></ul>
 */
@interface AWSrds : AWSService

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

     let rds = AWSrds.default()

 *Objective-C*

     AWSrds *rds = [AWSrds defaultrds];

 @return The default service client.
 */
+ (instancetype)defaultrds;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSrds.register(with: configuration!, forKey: "USWest2rds")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSrds registerrdsWithConfiguration:configuration forKey:@"USWest2rds"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let rds = AWSrds(forKey: "USWest2rds")

 *Objective-C*

     AWSrds *rds = [AWSrds rdsForKey:@"USWest2rds"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerrdsWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerrdsWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSrds.register(with: configuration!, forKey: "USWest2rds")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSrds registerrdsWithConfiguration:configuration forKey:@"USWest2rds"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let rds = AWSrds(forKey: "USWest2rds")

 *Objective-C*

     AWSrds *rds = [AWSrds rdsForKey:@"USWest2rds"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)rdsForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removerdsForKey:(NSString *)key;

/**
 <p>Associates an Identity and Access Management (IAM) role from an Amazon Aurora DB cluster. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Integrating.Authorizing.html">Authorizing Amazon Aurora MySQL to Access Other AWS Services on Your Behalf</a> in the <i>Amazon Aurora User Guide</i>.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the AddRoleToDBCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorDBClusterRoleAlreadyExists`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorDBClusterRoleQuotaExceeded`.
 
 @see AWSrdsAddRoleToDBClusterMessage
 */
- (AWSTask *)addRoleToDBCluster:(AWSrdsAddRoleToDBClusterMessage *)request;

/**
 <p>Associates an Identity and Access Management (IAM) role from an Amazon Aurora DB cluster. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Integrating.Authorizing.html">Authorizing Amazon Aurora MySQL to Access Other AWS Services on Your Behalf</a> in the <i>Amazon Aurora User Guide</i>.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the AddRoleToDBCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorDBClusterRoleAlreadyExists`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorDBClusterRoleQuotaExceeded`.
 
 @see AWSrdsAddRoleToDBClusterMessage
 */
- (void)addRoleToDBCluster:(AWSrdsAddRoleToDBClusterMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Associates an AWS Identity and Access Management (IAM) role with a DB instance.</p><note><p>To add a role to a DB instance, the status of the DB instance must be <code>available</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the AddRoleToDBInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorDBInstanceRoleAlreadyExists`, `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorDBInstanceRoleQuotaExceeded`.
 
 @see AWSrdsAddRoleToDBInstanceMessage
 */
- (AWSTask *)addRoleToDBInstance:(AWSrdsAddRoleToDBInstanceMessage *)request;

/**
 <p>Associates an AWS Identity and Access Management (IAM) role with a DB instance.</p><note><p>To add a role to a DB instance, the status of the DB instance must be <code>available</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the AddRoleToDBInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorDBInstanceRoleAlreadyExists`, `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorDBInstanceRoleQuotaExceeded`.
 
 @see AWSrdsAddRoleToDBInstanceMessage
 */
- (void)addRoleToDBInstance:(AWSrdsAddRoleToDBInstanceMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Adds a source identifier to an existing RDS event notification subscription.</p>
 
 @param request A container for the necessary parameters to execute the AddSourceIdentifierToSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsAddSourceIdentifierToSubscriptionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorSubscriptionNotFound`, `AWSrdsErrorSourceNotFound`.
 
 @see AWSrdsAddSourceIdentifierToSubscriptionMessage
 @see AWSrdsAddSourceIdentifierToSubscriptionResult
 */
- (AWSTask<AWSrdsAddSourceIdentifierToSubscriptionResult *> *)addSourceIdentifierToSubscription:(AWSrdsAddSourceIdentifierToSubscriptionMessage *)request;

/**
 <p>Adds a source identifier to an existing RDS event notification subscription.</p>
 
 @param request A container for the necessary parameters to execute the AddSourceIdentifierToSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorSubscriptionNotFound`, `AWSrdsErrorSourceNotFound`.
 
 @see AWSrdsAddSourceIdentifierToSubscriptionMessage
 @see AWSrdsAddSourceIdentifierToSubscriptionResult
 */
- (void)addSourceIdentifierToSubscription:(AWSrdsAddSourceIdentifierToSubscriptionMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsAddSourceIdentifierToSubscriptionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds metadata tags to an Amazon RDS resource. These tags can also be used with cost allocation reporting to track cost associated with Amazon RDS resources, or used in a Condition statement in an IAM policy for Amazon RDS.</p><p>For an overview on tagging Amazon RDS resources, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Tagging.html">Tagging Amazon RDS Resources</a>.</p>
 
 @param request A container for the necessary parameters to execute the AddTagsToResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorDBSnapshotNotFound`, `AWSrdsErrorDBProxyNotFound`, `AWSrdsErrorDBProxyTargetGroupNotFound`.
 
 @see AWSrdsAddTagsToResourceMessage
 */
- (AWSTask *)addTagsToResource:(AWSrdsAddTagsToResourceMessage *)request;

/**
 <p>Adds metadata tags to an Amazon RDS resource. These tags can also be used with cost allocation reporting to track cost associated with Amazon RDS resources, or used in a Condition statement in an IAM policy for Amazon RDS.</p><p>For an overview on tagging Amazon RDS resources, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Tagging.html">Tagging Amazon RDS Resources</a>.</p>
 
 @param request A container for the necessary parameters to execute the AddTagsToResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorDBSnapshotNotFound`, `AWSrdsErrorDBProxyNotFound`, `AWSrdsErrorDBProxyTargetGroupNotFound`.
 
 @see AWSrdsAddTagsToResourceMessage
 */
- (void)addTagsToResource:(AWSrdsAddTagsToResourceMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Applies a pending maintenance action to a resource (for example, to a DB instance).</p>
 
 @param request A container for the necessary parameters to execute the ApplyPendingMaintenanceAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsApplyPendingMaintenanceActionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorResourceNotFound`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidDBInstanceState`.
 
 @see AWSrdsApplyPendingMaintenanceActionMessage
 @see AWSrdsApplyPendingMaintenanceActionResult
 */
- (AWSTask<AWSrdsApplyPendingMaintenanceActionResult *> *)applyPendingMaintenanceAction:(AWSrdsApplyPendingMaintenanceActionMessage *)request;

/**
 <p>Applies a pending maintenance action to a resource (for example, to a DB instance).</p>
 
 @param request A container for the necessary parameters to execute the ApplyPendingMaintenanceAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorResourceNotFound`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidDBInstanceState`.
 
 @see AWSrdsApplyPendingMaintenanceActionMessage
 @see AWSrdsApplyPendingMaintenanceActionResult
 */
- (void)applyPendingMaintenanceAction:(AWSrdsApplyPendingMaintenanceActionMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsApplyPendingMaintenanceActionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables ingress to a DBSecurityGroup using one of two forms of authorization. First, EC2 or VPC security groups can be added to the DBSecurityGroup if the application using the database is running on EC2 or VPC instances. Second, IP ranges are available if the application accessing your database is running on the Internet. Required parameters for this API are one of CIDR range, EC2SecurityGroupId for VPC, or (EC2SecurityGroupOwnerId and either EC2SecurityGroupName or EC2SecurityGroupId for non-VPC).</p><note><p>You can't authorize ingress from an EC2 security group in one AWS Region to an Amazon RDS DB instance in another. You can't authorize ingress from a VPC security group in one VPC to an Amazon RDS DB instance in another.</p></note><p>For an overview of CIDR ranges, go to the <a href="http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Wikipedia Tutorial</a>. </p>
 
 @param request A container for the necessary parameters to execute the AuthorizeDBSecurityGroupIngress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsAuthorizeDBSecurityGroupIngressResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSecurityGroupNotFound`, `AWSrdsErrorInvalidDBSecurityGroupState`, `AWSrdsErrorAuthorizationAlreadyExists`, `AWSrdsErrorAuthorizationQuotaExceeded`.
 
 @see AWSrdsAuthorizeDBSecurityGroupIngressMessage
 @see AWSrdsAuthorizeDBSecurityGroupIngressResult
 */
- (AWSTask<AWSrdsAuthorizeDBSecurityGroupIngressResult *> *)authorizeDBSecurityGroupIngress:(AWSrdsAuthorizeDBSecurityGroupIngressMessage *)request;

/**
 <p>Enables ingress to a DBSecurityGroup using one of two forms of authorization. First, EC2 or VPC security groups can be added to the DBSecurityGroup if the application using the database is running on EC2 or VPC instances. Second, IP ranges are available if the application accessing your database is running on the Internet. Required parameters for this API are one of CIDR range, EC2SecurityGroupId for VPC, or (EC2SecurityGroupOwnerId and either EC2SecurityGroupName or EC2SecurityGroupId for non-VPC).</p><note><p>You can't authorize ingress from an EC2 security group in one AWS Region to an Amazon RDS DB instance in another. You can't authorize ingress from a VPC security group in one VPC to an Amazon RDS DB instance in another.</p></note><p>For an overview of CIDR ranges, go to the <a href="http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Wikipedia Tutorial</a>. </p>
 
 @param request A container for the necessary parameters to execute the AuthorizeDBSecurityGroupIngress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSecurityGroupNotFound`, `AWSrdsErrorInvalidDBSecurityGroupState`, `AWSrdsErrorAuthorizationAlreadyExists`, `AWSrdsErrorAuthorizationQuotaExceeded`.
 
 @see AWSrdsAuthorizeDBSecurityGroupIngressMessage
 @see AWSrdsAuthorizeDBSecurityGroupIngressResult
 */
- (void)authorizeDBSecurityGroupIngress:(AWSrdsAuthorizeDBSecurityGroupIngressMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsAuthorizeDBSecurityGroupIngressResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Backtracks a DB cluster to a specific time, without creating a new DB cluster.</p><p>For more information on backtracking, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Managing.Backtrack.html"> Backtracking an Aurora DB Cluster</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the BacktrackDBCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDBClusterBacktrack`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorInvalidDBClusterState`.
 
 @see AWSrdsBacktrackDBClusterMessage
 @see AWSrdsDBClusterBacktrack
 */
- (AWSTask<AWSrdsDBClusterBacktrack *> *)backtrackDBCluster:(AWSrdsBacktrackDBClusterMessage *)request;

/**
 <p>Backtracks a DB cluster to a specific time, without creating a new DB cluster.</p><p>For more information on backtracking, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Managing.Backtrack.html"> Backtracking an Aurora DB Cluster</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the BacktrackDBCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorInvalidDBClusterState`.
 
 @see AWSrdsBacktrackDBClusterMessage
 @see AWSrdsDBClusterBacktrack
 */
- (void)backtrackDBCluster:(AWSrdsBacktrackDBClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDBClusterBacktrack * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels an export task in progress that is exporting a snapshot to Amazon S3. Any data that has already been written to the S3 bucket isn't removed. </p>
 
 @param request A container for the necessary parameters to execute the CancelExportTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsExportTask`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorExportTaskNotFound`, `AWSrdsErrorInvalidExportTaskState`.
 
 @see AWSrdsCancelExportTaskMessage
 @see AWSrdsExportTask
 */
- (AWSTask<AWSrdsExportTask *> *)cancelExportTask:(AWSrdsCancelExportTaskMessage *)request;

/**
 <p>Cancels an export task in progress that is exporting a snapshot to Amazon S3. Any data that has already been written to the S3 bucket isn't removed. </p>
 
 @param request A container for the necessary parameters to execute the CancelExportTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorExportTaskNotFound`, `AWSrdsErrorInvalidExportTaskState`.
 
 @see AWSrdsCancelExportTaskMessage
 @see AWSrdsExportTask
 */
- (void)cancelExportTask:(AWSrdsCancelExportTaskMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsExportTask * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Copies the specified DB cluster parameter group.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CopyDBClusterParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsReplicateDBClusterParameterGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBParameterGroupNotFound`, `AWSrdsErrorDBParameterGroupQuotaExceeded`, `AWSrdsErrorDBParameterGroupAlreadyExists`.
 
 @see AWSrdsReplicateDBClusterParameterGroupMessage
 @see AWSrdsReplicateDBClusterParameterGroupResult
 */
- (AWSTask<AWSrdsReplicateDBClusterParameterGroupResult *> *)replicateDBClusterParameterGroup:(AWSrdsReplicateDBClusterParameterGroupMessage *)request;

/**
 <p>Copies the specified DB cluster parameter group.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CopyDBClusterParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBParameterGroupNotFound`, `AWSrdsErrorDBParameterGroupQuotaExceeded`, `AWSrdsErrorDBParameterGroupAlreadyExists`.
 
 @see AWSrdsReplicateDBClusterParameterGroupMessage
 @see AWSrdsReplicateDBClusterParameterGroupResult
 */
- (void)replicateDBClusterParameterGroup:(AWSrdsReplicateDBClusterParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsReplicateDBClusterParameterGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Copies a snapshot of a DB cluster.</p><p>To copy a DB cluster snapshot from a shared manual DB cluster snapshot, <code>SourceDBClusterSnapshotIdentifier</code> must be the Amazon Resource Name (ARN) of the shared DB cluster snapshot.</p><p>You can copy an encrypted DB cluster snapshot from another AWS Region. In that case, the AWS Region where you call the <code>CopyDBClusterSnapshot</code> action is the destination AWS Region for the encrypted DB cluster snapshot to be copied to. To copy an encrypted DB cluster snapshot from another AWS Region, you must provide the following values:</p><ul><li><p><code>KmsKeyId</code> - The AWS Key Management System (AWS KMS) key identifier for the key to use to encrypt the copy of the DB cluster snapshot in the destination AWS Region.</p></li><li><p><code>PreSignedUrl</code> - A URL that contains a Signature Version 4 signed request for the <code>CopyDBClusterSnapshot</code> action to be called in the source AWS Region where the DB cluster snapshot is copied from. The pre-signed URL must be a valid request for the <code>CopyDBClusterSnapshot</code> API action that can be executed in the source AWS Region that contains the encrypted DB cluster snapshot to be copied.</p><p>The pre-signed URL request must contain the following parameter values:</p><ul><li><p><code>KmsKeyId</code> - The KMS key identifier for the key to use to encrypt the copy of the DB cluster snapshot in the destination AWS Region. This is the same identifier for both the <code>CopyDBClusterSnapshot</code> action that is called in the destination AWS Region, and the action contained in the pre-signed URL.</p></li><li><p><code>DestinationRegion</code> - The name of the AWS Region that the DB cluster snapshot is to be created in.</p></li><li><p><code>SourceDBClusterSnapshotIdentifier</code> - The DB cluster snapshot identifier for the encrypted DB cluster snapshot to be copied. This identifier must be in the Amazon Resource Name (ARN) format for the source AWS Region. For example, if you are copying an encrypted DB cluster snapshot from the us-west-2 AWS Region, then your <code>SourceDBClusterSnapshotIdentifier</code> looks like the following example: <code>arn:aws:rds:us-west-2:123456789012:cluster-snapshot:aurora-cluster1-snapshot-20161115</code>.</p></li></ul><p>To learn how to generate a Signature Version 4 signed request, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html"> Authenticating Requests: Using Query Parameters (AWS Signature Version 4)</a> and <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html"> Signature Version 4 Signing Process</a>.</p><note><p>If you are using an AWS SDK tool or the AWS CLI, you can specify <code>SourceRegion</code> (or <code>--source-region</code> for the AWS CLI) instead of specifying <code>PreSignedUrl</code> manually. Specifying <code>SourceRegion</code> autogenerates a pre-signed URL that is a valid request for the operation that can be executed in the source AWS Region.</p></note></li><li><p><code>TargetDBClusterSnapshotIdentifier</code> - The identifier for the new copy of the DB cluster snapshot in the destination AWS Region.</p></li><li><p><code>SourceDBClusterSnapshotIdentifier</code> - The DB cluster snapshot identifier for the encrypted DB cluster snapshot to be copied. This identifier must be in the ARN format for the source AWS Region and is the same value as the <code>SourceDBClusterSnapshotIdentifier</code> in the pre-signed URL. </p></li></ul><p>To cancel the copy operation once it is in progress, delete the target DB cluster snapshot identified by <code>TargetDBClusterSnapshotIdentifier</code> while that DB cluster snapshot is in "copying" status.</p><p>For more information on copying encrypted DB cluster snapshots from one AWS Region to another, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_CopySnapshot.html"> Copying a Snapshot</a> in the <i>Amazon Aurora User Guide.</i></p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CopyDBClusterSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsReplicateDBClusterSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterSnapshotAlreadyExists`, `AWSrdsErrorDBClusterSnapshotNotFound`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidDBClusterSnapshotState`, `AWSrdsErrorSnapshotQuotaExceeded`, `AWSrdsErrorKMSKeyNotAccessible`.
 
 @see AWSrdsReplicateDBClusterSnapshotMessage
 @see AWSrdsReplicateDBClusterSnapshotResult
 */
- (AWSTask<AWSrdsReplicateDBClusterSnapshotResult *> *)replicateDBClusterSnapshot:(AWSrdsReplicateDBClusterSnapshotMessage *)request;

/**
 <p>Copies a snapshot of a DB cluster.</p><p>To copy a DB cluster snapshot from a shared manual DB cluster snapshot, <code>SourceDBClusterSnapshotIdentifier</code> must be the Amazon Resource Name (ARN) of the shared DB cluster snapshot.</p><p>You can copy an encrypted DB cluster snapshot from another AWS Region. In that case, the AWS Region where you call the <code>CopyDBClusterSnapshot</code> action is the destination AWS Region for the encrypted DB cluster snapshot to be copied to. To copy an encrypted DB cluster snapshot from another AWS Region, you must provide the following values:</p><ul><li><p><code>KmsKeyId</code> - The AWS Key Management System (AWS KMS) key identifier for the key to use to encrypt the copy of the DB cluster snapshot in the destination AWS Region.</p></li><li><p><code>PreSignedUrl</code> - A URL that contains a Signature Version 4 signed request for the <code>CopyDBClusterSnapshot</code> action to be called in the source AWS Region where the DB cluster snapshot is copied from. The pre-signed URL must be a valid request for the <code>CopyDBClusterSnapshot</code> API action that can be executed in the source AWS Region that contains the encrypted DB cluster snapshot to be copied.</p><p>The pre-signed URL request must contain the following parameter values:</p><ul><li><p><code>KmsKeyId</code> - The KMS key identifier for the key to use to encrypt the copy of the DB cluster snapshot in the destination AWS Region. This is the same identifier for both the <code>CopyDBClusterSnapshot</code> action that is called in the destination AWS Region, and the action contained in the pre-signed URL.</p></li><li><p><code>DestinationRegion</code> - The name of the AWS Region that the DB cluster snapshot is to be created in.</p></li><li><p><code>SourceDBClusterSnapshotIdentifier</code> - The DB cluster snapshot identifier for the encrypted DB cluster snapshot to be copied. This identifier must be in the Amazon Resource Name (ARN) format for the source AWS Region. For example, if you are copying an encrypted DB cluster snapshot from the us-west-2 AWS Region, then your <code>SourceDBClusterSnapshotIdentifier</code> looks like the following example: <code>arn:aws:rds:us-west-2:123456789012:cluster-snapshot:aurora-cluster1-snapshot-20161115</code>.</p></li></ul><p>To learn how to generate a Signature Version 4 signed request, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html"> Authenticating Requests: Using Query Parameters (AWS Signature Version 4)</a> and <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html"> Signature Version 4 Signing Process</a>.</p><note><p>If you are using an AWS SDK tool or the AWS CLI, you can specify <code>SourceRegion</code> (or <code>--source-region</code> for the AWS CLI) instead of specifying <code>PreSignedUrl</code> manually. Specifying <code>SourceRegion</code> autogenerates a pre-signed URL that is a valid request for the operation that can be executed in the source AWS Region.</p></note></li><li><p><code>TargetDBClusterSnapshotIdentifier</code> - The identifier for the new copy of the DB cluster snapshot in the destination AWS Region.</p></li><li><p><code>SourceDBClusterSnapshotIdentifier</code> - The DB cluster snapshot identifier for the encrypted DB cluster snapshot to be copied. This identifier must be in the ARN format for the source AWS Region and is the same value as the <code>SourceDBClusterSnapshotIdentifier</code> in the pre-signed URL. </p></li></ul><p>To cancel the copy operation once it is in progress, delete the target DB cluster snapshot identified by <code>TargetDBClusterSnapshotIdentifier</code> while that DB cluster snapshot is in "copying" status.</p><p>For more information on copying encrypted DB cluster snapshots from one AWS Region to another, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_CopySnapshot.html"> Copying a Snapshot</a> in the <i>Amazon Aurora User Guide.</i></p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CopyDBClusterSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterSnapshotAlreadyExists`, `AWSrdsErrorDBClusterSnapshotNotFound`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidDBClusterSnapshotState`, `AWSrdsErrorSnapshotQuotaExceeded`, `AWSrdsErrorKMSKeyNotAccessible`.
 
 @see AWSrdsReplicateDBClusterSnapshotMessage
 @see AWSrdsReplicateDBClusterSnapshotResult
 */
- (void)replicateDBClusterSnapshot:(AWSrdsReplicateDBClusterSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsReplicateDBClusterSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Copies the specified DB parameter group.</p>
 
 @param request A container for the necessary parameters to execute the CopyDBParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsReplicateDBParameterGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBParameterGroupNotFound`, `AWSrdsErrorDBParameterGroupAlreadyExists`, `AWSrdsErrorDBParameterGroupQuotaExceeded`.
 
 @see AWSrdsReplicateDBParameterGroupMessage
 @see AWSrdsReplicateDBParameterGroupResult
 */
- (AWSTask<AWSrdsReplicateDBParameterGroupResult *> *)replicateDBParameterGroup:(AWSrdsReplicateDBParameterGroupMessage *)request;

/**
 <p>Copies the specified DB parameter group.</p>
 
 @param request A container for the necessary parameters to execute the CopyDBParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBParameterGroupNotFound`, `AWSrdsErrorDBParameterGroupAlreadyExists`, `AWSrdsErrorDBParameterGroupQuotaExceeded`.
 
 @see AWSrdsReplicateDBParameterGroupMessage
 @see AWSrdsReplicateDBParameterGroupResult
 */
- (void)replicateDBParameterGroup:(AWSrdsReplicateDBParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsReplicateDBParameterGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Copies the specified DB snapshot. The source DB snapshot must be in the "available" state.</p><p>You can copy a snapshot from one AWS Region to another. In that case, the AWS Region where you call the <code>CopyDBSnapshot</code> action is the destination AWS Region for the DB snapshot copy. </p><p>For more information about copying snapshots, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_CopySnapshot.html#USER_CopyDBSnapshot">Copying a DB Snapshot</a> in the <i>Amazon RDS User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the CopyDBSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsReplicateDBSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSnapshotAlreadyExists`, `AWSrdsErrorDBSnapshotNotFound`, `AWSrdsErrorInvalidDBSnapshotState`, `AWSrdsErrorSnapshotQuotaExceeded`, `AWSrdsErrorKMSKeyNotAccessible`.
 
 @see AWSrdsReplicateDBSnapshotMessage
 @see AWSrdsReplicateDBSnapshotResult
 */
- (AWSTask<AWSrdsReplicateDBSnapshotResult *> *)replicateDBSnapshot:(AWSrdsReplicateDBSnapshotMessage *)request;

/**
 <p>Copies the specified DB snapshot. The source DB snapshot must be in the "available" state.</p><p>You can copy a snapshot from one AWS Region to another. In that case, the AWS Region where you call the <code>CopyDBSnapshot</code> action is the destination AWS Region for the DB snapshot copy. </p><p>For more information about copying snapshots, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_CopySnapshot.html#USER_CopyDBSnapshot">Copying a DB Snapshot</a> in the <i>Amazon RDS User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the CopyDBSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSnapshotAlreadyExists`, `AWSrdsErrorDBSnapshotNotFound`, `AWSrdsErrorInvalidDBSnapshotState`, `AWSrdsErrorSnapshotQuotaExceeded`, `AWSrdsErrorKMSKeyNotAccessible`.
 
 @see AWSrdsReplicateDBSnapshotMessage
 @see AWSrdsReplicateDBSnapshotResult
 */
- (void)replicateDBSnapshot:(AWSrdsReplicateDBSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsReplicateDBSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Copies the specified option group.</p>
 
 @param request A container for the necessary parameters to execute the CopyOptionGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsReplicateOptionGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorOptionGroupAlreadyExists`, `AWSrdsErrorOptionGroupNotFound`, `AWSrdsErrorOptionGroupQuotaExceeded`.
 
 @see AWSrdsReplicateOptionGroupMessage
 @see AWSrdsReplicateOptionGroupResult
 */
- (AWSTask<AWSrdsReplicateOptionGroupResult *> *)replicateOptionGroup:(AWSrdsReplicateOptionGroupMessage *)request;

/**
 <p>Copies the specified option group.</p>
 
 @param request A container for the necessary parameters to execute the CopyOptionGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorOptionGroupAlreadyExists`, `AWSrdsErrorOptionGroupNotFound`, `AWSrdsErrorOptionGroupQuotaExceeded`.
 
 @see AWSrdsReplicateOptionGroupMessage
 @see AWSrdsReplicateOptionGroupResult
 */
- (void)replicateOptionGroup:(AWSrdsReplicateOptionGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsReplicateOptionGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a custom Availability Zone (AZ).</p><p>A custom AZ is an on-premises AZ that is integrated with a VMware vSphere cluster.</p><p>For more information about RDS on VMware, see the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html"><i>RDS on VMware User Guide.</i></a></p>
 
 @param request A container for the necessary parameters to execute the CreateCustomAvailabilityZone service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsCreateCustomAvailabilityZoneResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorCustomAvailabilityZoneAlreadyExists`, `AWSrdsErrorCustomAvailabilityZoneQuotaExceeded`, `AWSrdsErrorKMSKeyNotAccessible`.
 
 @see AWSrdsCreateCustomAvailabilityZoneMessage
 @see AWSrdsCreateCustomAvailabilityZoneResult
 */
- (AWSTask<AWSrdsCreateCustomAvailabilityZoneResult *> *)createCustomAvailabilityZone:(AWSrdsCreateCustomAvailabilityZoneMessage *)request;

/**
 <p>Creates a custom Availability Zone (AZ).</p><p>A custom AZ is an on-premises AZ that is integrated with a VMware vSphere cluster.</p><p>For more information about RDS on VMware, see the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html"><i>RDS on VMware User Guide.</i></a></p>
 
 @param request A container for the necessary parameters to execute the CreateCustomAvailabilityZone service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorCustomAvailabilityZoneAlreadyExists`, `AWSrdsErrorCustomAvailabilityZoneQuotaExceeded`, `AWSrdsErrorKMSKeyNotAccessible`.
 
 @see AWSrdsCreateCustomAvailabilityZoneMessage
 @see AWSrdsCreateCustomAvailabilityZoneResult
 */
- (void)createCustomAvailabilityZone:(AWSrdsCreateCustomAvailabilityZoneMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsCreateCustomAvailabilityZoneResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new Amazon Aurora DB cluster.</p><p>You can use the <code>ReplicationSourceIdentifier</code> parameter to create the DB cluster as a read replica of another DB cluster or Amazon RDS MySQL DB instance. For cross-region replication where the DB cluster identified by <code>ReplicationSourceIdentifier</code> is encrypted, you must also specify the <code>PreSignedUrl</code> parameter.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateDBCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsCreateDBClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterAlreadyExists`, `AWSrdsErrorInsufficientStorageClusterCapacity`, `AWSrdsErrorDBClusterQuotaExceeded`, `AWSrdsErrorStorageQuotaExceeded`, `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorInvalidVPCNetworkState`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidDBSubnetGroupState`, `AWSrdsErrorInvalidSubnet`, `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorDBClusterParameterGroupNotFound`, `AWSrdsErrorKMSKeyNotAccessible`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSrdsErrorGlobalClusterNotFound`, `AWSrdsErrorInvalidGlobalClusterState`, `AWSrdsErrorDomainNotFound`.
 
 @see AWSrdsCreateDBClusterMessage
 @see AWSrdsCreateDBClusterResult
 */
- (AWSTask<AWSrdsCreateDBClusterResult *> *)createDBCluster:(AWSrdsCreateDBClusterMessage *)request;

/**
 <p>Creates a new Amazon Aurora DB cluster.</p><p>You can use the <code>ReplicationSourceIdentifier</code> parameter to create the DB cluster as a read replica of another DB cluster or Amazon RDS MySQL DB instance. For cross-region replication where the DB cluster identified by <code>ReplicationSourceIdentifier</code> is encrypted, you must also specify the <code>PreSignedUrl</code> parameter.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateDBCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterAlreadyExists`, `AWSrdsErrorInsufficientStorageClusterCapacity`, `AWSrdsErrorDBClusterQuotaExceeded`, `AWSrdsErrorStorageQuotaExceeded`, `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorInvalidVPCNetworkState`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidDBSubnetGroupState`, `AWSrdsErrorInvalidSubnet`, `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorDBClusterParameterGroupNotFound`, `AWSrdsErrorKMSKeyNotAccessible`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSrdsErrorGlobalClusterNotFound`, `AWSrdsErrorInvalidGlobalClusterState`, `AWSrdsErrorDomainNotFound`.
 
 @see AWSrdsCreateDBClusterMessage
 @see AWSrdsCreateDBClusterResult
 */
- (void)createDBCluster:(AWSrdsCreateDBClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsCreateDBClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new custom endpoint and associates it with an Amazon Aurora DB cluster.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateDBClusterEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDBClusterEndpoint`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterEndpointQuotaExceeded`, `AWSrdsErrorDBClusterEndpointAlreadyExists`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorInvalidDBInstanceState`.
 
 @see AWSrdsCreateDBClusterEndpointMessage
 @see AWSrdsDBClusterEndpoint
 */
- (AWSTask<AWSrdsDBClusterEndpoint *> *)createDBClusterEndpoint:(AWSrdsCreateDBClusterEndpointMessage *)request;

/**
 <p>Creates a new custom endpoint and associates it with an Amazon Aurora DB cluster.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateDBClusterEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterEndpointQuotaExceeded`, `AWSrdsErrorDBClusterEndpointAlreadyExists`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorInvalidDBInstanceState`.
 
 @see AWSrdsCreateDBClusterEndpointMessage
 @see AWSrdsDBClusterEndpoint
 */
- (void)createDBClusterEndpoint:(AWSrdsCreateDBClusterEndpointMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDBClusterEndpoint * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new DB cluster parameter group.</p><p>Parameters in a DB cluster parameter group apply to all of the instances in a DB cluster.</p><p> A DB cluster parameter group is initially created with the default parameters for the database engine used by instances in the DB cluster. To provide custom values for any of the parameters, you must modify the group after creating it using <code>ModifyDBClusterParameterGroup</code>. Once you've created a DB cluster parameter group, you need to associate it with your DB cluster using <code>ModifyDBCluster</code>. When you associate a new DB cluster parameter group with a running DB cluster, you need to reboot the DB instances in the DB cluster without failover for the new DB cluster parameter group and associated settings to take effect. </p><important><p>After you create a DB cluster parameter group, you should wait at least 5 minutes before creating your first DB cluster that uses that DB cluster parameter group as the default parameter group. This allows Amazon RDS to fully complete the create action before the DB cluster parameter group is used as the default for a new DB cluster. This is especially important for parameters that are critical when creating the default database for a DB cluster, such as the character set for the default database defined by the <code>character_set_database</code> parameter. You can use the <i>Parameter Groups</i> option of the <a href="https://console.aws.amazon.com/rds/">Amazon RDS console</a> or the <code>DescribeDBClusterParameters</code> action to verify that your DB cluster parameter group has been created or modified.</p></important><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateDBClusterParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsCreateDBClusterParameterGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBParameterGroupQuotaExceeded`, `AWSrdsErrorDBParameterGroupAlreadyExists`.
 
 @see AWSrdsCreateDBClusterParameterGroupMessage
 @see AWSrdsCreateDBClusterParameterGroupResult
 */
- (AWSTask<AWSrdsCreateDBClusterParameterGroupResult *> *)createDBClusterParameterGroup:(AWSrdsCreateDBClusterParameterGroupMessage *)request;

/**
 <p>Creates a new DB cluster parameter group.</p><p>Parameters in a DB cluster parameter group apply to all of the instances in a DB cluster.</p><p> A DB cluster parameter group is initially created with the default parameters for the database engine used by instances in the DB cluster. To provide custom values for any of the parameters, you must modify the group after creating it using <code>ModifyDBClusterParameterGroup</code>. Once you've created a DB cluster parameter group, you need to associate it with your DB cluster using <code>ModifyDBCluster</code>. When you associate a new DB cluster parameter group with a running DB cluster, you need to reboot the DB instances in the DB cluster without failover for the new DB cluster parameter group and associated settings to take effect. </p><important><p>After you create a DB cluster parameter group, you should wait at least 5 minutes before creating your first DB cluster that uses that DB cluster parameter group as the default parameter group. This allows Amazon RDS to fully complete the create action before the DB cluster parameter group is used as the default for a new DB cluster. This is especially important for parameters that are critical when creating the default database for a DB cluster, such as the character set for the default database defined by the <code>character_set_database</code> parameter. You can use the <i>Parameter Groups</i> option of the <a href="https://console.aws.amazon.com/rds/">Amazon RDS console</a> or the <code>DescribeDBClusterParameters</code> action to verify that your DB cluster parameter group has been created or modified.</p></important><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateDBClusterParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBParameterGroupQuotaExceeded`, `AWSrdsErrorDBParameterGroupAlreadyExists`.
 
 @see AWSrdsCreateDBClusterParameterGroupMessage
 @see AWSrdsCreateDBClusterParameterGroupResult
 */
- (void)createDBClusterParameterGroup:(AWSrdsCreateDBClusterParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsCreateDBClusterParameterGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a snapshot of a DB cluster. For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateDBClusterSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsCreateDBClusterSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterSnapshotAlreadyExists`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorSnapshotQuotaExceeded`, `AWSrdsErrorInvalidDBClusterSnapshotState`.
 
 @see AWSrdsCreateDBClusterSnapshotMessage
 @see AWSrdsCreateDBClusterSnapshotResult
 */
- (AWSTask<AWSrdsCreateDBClusterSnapshotResult *> *)createDBClusterSnapshot:(AWSrdsCreateDBClusterSnapshotMessage *)request;

/**
 <p>Creates a snapshot of a DB cluster. For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateDBClusterSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterSnapshotAlreadyExists`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorSnapshotQuotaExceeded`, `AWSrdsErrorInvalidDBClusterSnapshotState`.
 
 @see AWSrdsCreateDBClusterSnapshotMessage
 @see AWSrdsCreateDBClusterSnapshotResult
 */
- (void)createDBClusterSnapshot:(AWSrdsCreateDBClusterSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsCreateDBClusterSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new DB instance.</p>
 
 @param request A container for the necessary parameters to execute the CreateDBInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsCreateDBInstanceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceAlreadyExists`, `AWSrdsErrorInsufficientDBInstanceCapacity`, `AWSrdsErrorDBParameterGroupNotFound`, `AWSrdsErrorDBSecurityGroupNotFound`, `AWSrdsErrorInstanceQuotaExceeded`, `AWSrdsErrorStorageQuotaExceeded`, `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidSubnet`, `AWSrdsErrorInvalidVPCNetworkState`, `AWSrdsErrorProvisionedIopsNotAvailableInAZ`, `AWSrdsErrorOptionGroupNotFound`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorStorageTypeNotSupported`, `AWSrdsErrorAuthorizationNotFound`, `AWSrdsErrorKMSKeyNotAccessible`, `AWSrdsErrorDomainNotFound`, `AWSrdsErrorBackupPolicyNotFound`.
 
 @see AWSrdsCreateDBInstanceMessage
 @see AWSrdsCreateDBInstanceResult
 */
- (AWSTask<AWSrdsCreateDBInstanceResult *> *)createDBInstance:(AWSrdsCreateDBInstanceMessage *)request;

/**
 <p>Creates a new DB instance.</p>
 
 @param request A container for the necessary parameters to execute the CreateDBInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceAlreadyExists`, `AWSrdsErrorInsufficientDBInstanceCapacity`, `AWSrdsErrorDBParameterGroupNotFound`, `AWSrdsErrorDBSecurityGroupNotFound`, `AWSrdsErrorInstanceQuotaExceeded`, `AWSrdsErrorStorageQuotaExceeded`, `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidSubnet`, `AWSrdsErrorInvalidVPCNetworkState`, `AWSrdsErrorProvisionedIopsNotAvailableInAZ`, `AWSrdsErrorOptionGroupNotFound`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorStorageTypeNotSupported`, `AWSrdsErrorAuthorizationNotFound`, `AWSrdsErrorKMSKeyNotAccessible`, `AWSrdsErrorDomainNotFound`, `AWSrdsErrorBackupPolicyNotFound`.
 
 @see AWSrdsCreateDBInstanceMessage
 @see AWSrdsCreateDBInstanceResult
 */
- (void)createDBInstance:(AWSrdsCreateDBInstanceMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsCreateDBInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new DB instance that acts as a read replica for an existing source DB instance. You can create a read replica for a DB instance running MySQL, MariaDB, Oracle, PostgreSQL, or SQL Server. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReadRepl.html">Working with Read Replicas</a> in the <i>Amazon RDS User Guide</i>. </p><p>Amazon Aurora doesn't support this action. Call the <code>CreateDBInstance</code> action to create a DB instance for an Aurora DB cluster.</p><p>All read replica DB instances are created with backups disabled. All other DB instance attributes (including DB security groups and DB parameter groups) are inherited from the source DB instance, except as specified.</p><important><p>Your source DB instance must have backup retention enabled. </p></important>
 
 @param request A container for the necessary parameters to execute the CreateDBInstanceReadReplica service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsCreateDBInstanceReadReplicaResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceAlreadyExists`, `AWSrdsErrorInsufficientDBInstanceCapacity`, `AWSrdsErrorDBParameterGroupNotFound`, `AWSrdsErrorDBSecurityGroupNotFound`, `AWSrdsErrorInstanceQuotaExceeded`, `AWSrdsErrorStorageQuotaExceeded`, `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSrdsErrorInvalidSubnet`, `AWSrdsErrorInvalidVPCNetworkState`, `AWSrdsErrorProvisionedIopsNotAvailableInAZ`, `AWSrdsErrorOptionGroupNotFound`, `AWSrdsErrorDBSubnetGroupNotAllowed`, `AWSrdsErrorInvalidDBSubnetGroup`, `AWSrdsErrorStorageTypeNotSupported`, `AWSrdsErrorKMSKeyNotAccessible`, `AWSrdsErrorDomainNotFound`.
 
 @see AWSrdsCreateDBInstanceReadReplicaMessage
 @see AWSrdsCreateDBInstanceReadReplicaResult
 */
- (AWSTask<AWSrdsCreateDBInstanceReadReplicaResult *> *)createDBInstanceReadReplica:(AWSrdsCreateDBInstanceReadReplicaMessage *)request;

/**
 <p>Creates a new DB instance that acts as a read replica for an existing source DB instance. You can create a read replica for a DB instance running MySQL, MariaDB, Oracle, PostgreSQL, or SQL Server. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReadRepl.html">Working with Read Replicas</a> in the <i>Amazon RDS User Guide</i>. </p><p>Amazon Aurora doesn't support this action. Call the <code>CreateDBInstance</code> action to create a DB instance for an Aurora DB cluster.</p><p>All read replica DB instances are created with backups disabled. All other DB instance attributes (including DB security groups and DB parameter groups) are inherited from the source DB instance, except as specified.</p><important><p>Your source DB instance must have backup retention enabled. </p></important>
 
 @param request A container for the necessary parameters to execute the CreateDBInstanceReadReplica service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceAlreadyExists`, `AWSrdsErrorInsufficientDBInstanceCapacity`, `AWSrdsErrorDBParameterGroupNotFound`, `AWSrdsErrorDBSecurityGroupNotFound`, `AWSrdsErrorInstanceQuotaExceeded`, `AWSrdsErrorStorageQuotaExceeded`, `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSrdsErrorInvalidSubnet`, `AWSrdsErrorInvalidVPCNetworkState`, `AWSrdsErrorProvisionedIopsNotAvailableInAZ`, `AWSrdsErrorOptionGroupNotFound`, `AWSrdsErrorDBSubnetGroupNotAllowed`, `AWSrdsErrorInvalidDBSubnetGroup`, `AWSrdsErrorStorageTypeNotSupported`, `AWSrdsErrorKMSKeyNotAccessible`, `AWSrdsErrorDomainNotFound`.
 
 @see AWSrdsCreateDBInstanceReadReplicaMessage
 @see AWSrdsCreateDBInstanceReadReplicaResult
 */
- (void)createDBInstanceReadReplica:(AWSrdsCreateDBInstanceReadReplicaMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsCreateDBInstanceReadReplicaResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new DB parameter group.</p><p> A DB parameter group is initially created with the default parameters for the database engine used by the DB instance. To provide custom values for any of the parameters, you must modify the group after creating it using <i>ModifyDBParameterGroup</i>. Once you've created a DB parameter group, you need to associate it with your DB instance using <i>ModifyDBInstance</i>. When you associate a new DB parameter group with a running DB instance, you need to reboot the DB instance without failover for the new DB parameter group and associated settings to take effect. </p><important><p>After you create a DB parameter group, you should wait at least 5 minutes before creating your first DB instance that uses that DB parameter group as the default parameter group. This allows Amazon RDS to fully complete the create action before the parameter group is used as the default for a new DB instance. This is especially important for parameters that are critical when creating the default database for a DB instance, such as the character set for the default database defined by the <code>character_set_database</code> parameter. You can use the <i>Parameter Groups</i> option of the <a href="https://console.aws.amazon.com/rds/">Amazon RDS console</a> or the <i>DescribeDBParameters</i> command to verify that your DB parameter group has been created or modified.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateDBParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsCreateDBParameterGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBParameterGroupQuotaExceeded`, `AWSrdsErrorDBParameterGroupAlreadyExists`.
 
 @see AWSrdsCreateDBParameterGroupMessage
 @see AWSrdsCreateDBParameterGroupResult
 */
- (AWSTask<AWSrdsCreateDBParameterGroupResult *> *)createDBParameterGroup:(AWSrdsCreateDBParameterGroupMessage *)request;

/**
 <p>Creates a new DB parameter group.</p><p> A DB parameter group is initially created with the default parameters for the database engine used by the DB instance. To provide custom values for any of the parameters, you must modify the group after creating it using <i>ModifyDBParameterGroup</i>. Once you've created a DB parameter group, you need to associate it with your DB instance using <i>ModifyDBInstance</i>. When you associate a new DB parameter group with a running DB instance, you need to reboot the DB instance without failover for the new DB parameter group and associated settings to take effect. </p><important><p>After you create a DB parameter group, you should wait at least 5 minutes before creating your first DB instance that uses that DB parameter group as the default parameter group. This allows Amazon RDS to fully complete the create action before the parameter group is used as the default for a new DB instance. This is especially important for parameters that are critical when creating the default database for a DB instance, such as the character set for the default database defined by the <code>character_set_database</code> parameter. You can use the <i>Parameter Groups</i> option of the <a href="https://console.aws.amazon.com/rds/">Amazon RDS console</a> or the <i>DescribeDBParameters</i> command to verify that your DB parameter group has been created or modified.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateDBParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBParameterGroupQuotaExceeded`, `AWSrdsErrorDBParameterGroupAlreadyExists`.
 
 @see AWSrdsCreateDBParameterGroupMessage
 @see AWSrdsCreateDBParameterGroupResult
 */
- (void)createDBParameterGroup:(AWSrdsCreateDBParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsCreateDBParameterGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Creates a new DB proxy.</p>
 
 @param request A container for the necessary parameters to execute the CreateDBProxy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsCreateDBProxyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidSubnet`, `AWSrdsErrorDBProxyAlreadyExists`, `AWSrdsErrorDBProxyQuotaExceeded`.
 
 @see AWSrdsCreateDBProxyRequest
 @see AWSrdsCreateDBProxyResponse
 */
- (AWSTask<AWSrdsCreateDBProxyResponse *> *)createDBProxy:(AWSrdsCreateDBProxyRequest *)request;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Creates a new DB proxy.</p>
 
 @param request A container for the necessary parameters to execute the CreateDBProxy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidSubnet`, `AWSrdsErrorDBProxyAlreadyExists`, `AWSrdsErrorDBProxyQuotaExceeded`.
 
 @see AWSrdsCreateDBProxyRequest
 @see AWSrdsCreateDBProxyResponse
 */
- (void)createDBProxy:(AWSrdsCreateDBProxyRequest *)request completionHandler:(void (^ _Nullable)(AWSrdsCreateDBProxyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new DB security group. DB security groups control access to a DB instance.</p><note><p>A DB security group controls access to EC2-Classic DB instances that are not in a VPC.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateDBSecurityGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsCreateDBSecurityGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSecurityGroupAlreadyExists`, `AWSrdsErrorDBSecurityGroupQuotaExceeded`, `AWSrdsErrorDBSecurityGroupNotSupported`.
 
 @see AWSrdsCreateDBSecurityGroupMessage
 @see AWSrdsCreateDBSecurityGroupResult
 */
- (AWSTask<AWSrdsCreateDBSecurityGroupResult *> *)createDBSecurityGroup:(AWSrdsCreateDBSecurityGroupMessage *)request;

/**
 <p>Creates a new DB security group. DB security groups control access to a DB instance.</p><note><p>A DB security group controls access to EC2-Classic DB instances that are not in a VPC.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateDBSecurityGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSecurityGroupAlreadyExists`, `AWSrdsErrorDBSecurityGroupQuotaExceeded`, `AWSrdsErrorDBSecurityGroupNotSupported`.
 
 @see AWSrdsCreateDBSecurityGroupMessage
 @see AWSrdsCreateDBSecurityGroupResult
 */
- (void)createDBSecurityGroup:(AWSrdsCreateDBSecurityGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsCreateDBSecurityGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a DBSnapshot. The source DBInstance must be in "available" state.</p>
 
 @param request A container for the necessary parameters to execute the CreateDBSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsCreateDBSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSnapshotAlreadyExists`, `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorSnapshotQuotaExceeded`.
 
 @see AWSrdsCreateDBSnapshotMessage
 @see AWSrdsCreateDBSnapshotResult
 */
- (AWSTask<AWSrdsCreateDBSnapshotResult *> *)createDBSnapshot:(AWSrdsCreateDBSnapshotMessage *)request;

/**
 <p>Creates a DBSnapshot. The source DBInstance must be in "available" state.</p>
 
 @param request A container for the necessary parameters to execute the CreateDBSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSnapshotAlreadyExists`, `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorSnapshotQuotaExceeded`.
 
 @see AWSrdsCreateDBSnapshotMessage
 @see AWSrdsCreateDBSnapshotResult
 */
- (void)createDBSnapshot:(AWSrdsCreateDBSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsCreateDBSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new DB subnet group. DB subnet groups must contain at least one subnet in at least two AZs in the AWS Region.</p>
 
 @param request A container for the necessary parameters to execute the CreateDBSubnetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsCreateDBSubnetGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSubnetGroupAlreadyExists`, `AWSrdsErrorDBSubnetGroupQuotaExceeded`, `AWSrdsErrorDBSubnetQuotaExceeded`, `AWSrdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSrdsErrorInvalidSubnet`.
 
 @see AWSrdsCreateDBSubnetGroupMessage
 @see AWSrdsCreateDBSubnetGroupResult
 */
- (AWSTask<AWSrdsCreateDBSubnetGroupResult *> *)createDBSubnetGroup:(AWSrdsCreateDBSubnetGroupMessage *)request;

/**
 <p>Creates a new DB subnet group. DB subnet groups must contain at least one subnet in at least two AZs in the AWS Region.</p>
 
 @param request A container for the necessary parameters to execute the CreateDBSubnetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSubnetGroupAlreadyExists`, `AWSrdsErrorDBSubnetGroupQuotaExceeded`, `AWSrdsErrorDBSubnetQuotaExceeded`, `AWSrdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSrdsErrorInvalidSubnet`.
 
 @see AWSrdsCreateDBSubnetGroupMessage
 @see AWSrdsCreateDBSubnetGroupResult
 */
- (void)createDBSubnetGroup:(AWSrdsCreateDBSubnetGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsCreateDBSubnetGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an RDS event notification subscription. This action requires a topic Amazon Resource Name (ARN) created by either the RDS console, the SNS console, or the SNS API. To obtain an ARN with SNS, you must create a topic in Amazon SNS and subscribe to the topic. The ARN is displayed in the SNS console.</p><p>You can specify the type of source (SourceType) you want to be notified of, provide a list of RDS sources (SourceIds) that triggers the events, and provide a list of event categories (EventCategories) for events you want to be notified of. For example, you can specify SourceType = db-instance, SourceIds = mydbinstance1, mydbinstance2 and EventCategories = Availability, Backup.</p><p>If you specify both the SourceType and SourceIds, such as SourceType = db-instance and SourceIdentifier = myDBInstance1, you are notified of all the db-instance events for the specified source. If you specify a SourceType but do not specify a SourceIdentifier, you receive notice of the events for that source type for all your RDS sources. If you don't specify either the SourceType or the SourceIdentifier, you are notified of events generated from all RDS sources belonging to your customer account.</p><note><p>RDS event notification is only available for unencrypted SNS topics. If you specify an encrypted SNS topic, event notifications aren't sent for the topic.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateEventSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsCreateEventSubscriptionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorEventSubscriptionQuotaExceeded`, `AWSrdsErrorSubscriptionAlreadyExist`, `AWSrdsErrorSNSInvalidTopic`, `AWSrdsErrorSNSNoAuthorization`, `AWSrdsErrorSNSTopicArnNotFound`, `AWSrdsErrorSubscriptionCategoryNotFound`, `AWSrdsErrorSourceNotFound`.
 
 @see AWSrdsCreateEventSubscriptionMessage
 @see AWSrdsCreateEventSubscriptionResult
 */
- (AWSTask<AWSrdsCreateEventSubscriptionResult *> *)createEventSubscription:(AWSrdsCreateEventSubscriptionMessage *)request;

/**
 <p>Creates an RDS event notification subscription. This action requires a topic Amazon Resource Name (ARN) created by either the RDS console, the SNS console, or the SNS API. To obtain an ARN with SNS, you must create a topic in Amazon SNS and subscribe to the topic. The ARN is displayed in the SNS console.</p><p>You can specify the type of source (SourceType) you want to be notified of, provide a list of RDS sources (SourceIds) that triggers the events, and provide a list of event categories (EventCategories) for events you want to be notified of. For example, you can specify SourceType = db-instance, SourceIds = mydbinstance1, mydbinstance2 and EventCategories = Availability, Backup.</p><p>If you specify both the SourceType and SourceIds, such as SourceType = db-instance and SourceIdentifier = myDBInstance1, you are notified of all the db-instance events for the specified source. If you specify a SourceType but do not specify a SourceIdentifier, you receive notice of the events for that source type for all your RDS sources. If you don't specify either the SourceType or the SourceIdentifier, you are notified of events generated from all RDS sources belonging to your customer account.</p><note><p>RDS event notification is only available for unencrypted SNS topics. If you specify an encrypted SNS topic, event notifications aren't sent for the topic.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateEventSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorEventSubscriptionQuotaExceeded`, `AWSrdsErrorSubscriptionAlreadyExist`, `AWSrdsErrorSNSInvalidTopic`, `AWSrdsErrorSNSNoAuthorization`, `AWSrdsErrorSNSTopicArnNotFound`, `AWSrdsErrorSubscriptionCategoryNotFound`, `AWSrdsErrorSourceNotFound`.
 
 @see AWSrdsCreateEventSubscriptionMessage
 @see AWSrdsCreateEventSubscriptionResult
 */
- (void)createEventSubscription:(AWSrdsCreateEventSubscriptionMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsCreateEventSubscriptionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p></p><p> Creates an Aurora global database spread across multiple regions. The global database contains a single primary cluster with read-write capability, and a read-only secondary cluster that receives data from the primary cluster through high-speed replication performed by the Aurora storage subsystem. </p><p> You can create a global database that is initially empty, and then add a primary cluster and a secondary cluster to it. Or you can specify an existing Aurora cluster during the create operation, and this cluster becomes the primary cluster of the global database. </p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateGlobalCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsCreateGlobalClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorGlobalClusterAlreadyExists`, `AWSrdsErrorGlobalClusterQuotaExceeded`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorDBClusterNotFound`.
 
 @see AWSrdsCreateGlobalClusterMessage
 @see AWSrdsCreateGlobalClusterResult
 */
- (AWSTask<AWSrdsCreateGlobalClusterResult *> *)createGlobalCluster:(AWSrdsCreateGlobalClusterMessage *)request;

/**
 <p></p><p> Creates an Aurora global database spread across multiple regions. The global database contains a single primary cluster with read-write capability, and a read-only secondary cluster that receives data from the primary cluster through high-speed replication performed by the Aurora storage subsystem. </p><p> You can create a global database that is initially empty, and then add a primary cluster and a secondary cluster to it. Or you can specify an existing Aurora cluster during the create operation, and this cluster becomes the primary cluster of the global database. </p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateGlobalCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorGlobalClusterAlreadyExists`, `AWSrdsErrorGlobalClusterQuotaExceeded`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorDBClusterNotFound`.
 
 @see AWSrdsCreateGlobalClusterMessage
 @see AWSrdsCreateGlobalClusterResult
 */
- (void)createGlobalCluster:(AWSrdsCreateGlobalClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsCreateGlobalClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new option group. You can create up to 20 option groups.</p>
 
 @param request A container for the necessary parameters to execute the CreateOptionGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsCreateOptionGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorOptionGroupAlreadyExists`, `AWSrdsErrorOptionGroupQuotaExceeded`.
 
 @see AWSrdsCreateOptionGroupMessage
 @see AWSrdsCreateOptionGroupResult
 */
- (AWSTask<AWSrdsCreateOptionGroupResult *> *)createOptionGroup:(AWSrdsCreateOptionGroupMessage *)request;

/**
 <p>Creates a new option group. You can create up to 20 option groups.</p>
 
 @param request A container for the necessary parameters to execute the CreateOptionGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorOptionGroupAlreadyExists`, `AWSrdsErrorOptionGroupQuotaExceeded`.
 
 @see AWSrdsCreateOptionGroupMessage
 @see AWSrdsCreateOptionGroupResult
 */
- (void)createOptionGroup:(AWSrdsCreateOptionGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsCreateOptionGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a custom Availability Zone (AZ).</p><p>A custom AZ is an on-premises AZ that is integrated with a VMware vSphere cluster.</p><p>For more information about RDS on VMware, see the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html"><i>RDS on VMware User Guide.</i></a></p>
 
 @param request A container for the necessary parameters to execute the DeleteCustomAvailabilityZone service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDeleteCustomAvailabilityZoneResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorCustomAvailabilityZoneNotFound`, `AWSrdsErrorKMSKeyNotAccessible`.
 
 @see AWSrdsDeleteCustomAvailabilityZoneMessage
 @see AWSrdsDeleteCustomAvailabilityZoneResult
 */
- (AWSTask<AWSrdsDeleteCustomAvailabilityZoneResult *> *)deleteCustomAvailabilityZone:(AWSrdsDeleteCustomAvailabilityZoneMessage *)request;

/**
 <p>Deletes a custom Availability Zone (AZ).</p><p>A custom AZ is an on-premises AZ that is integrated with a VMware vSphere cluster.</p><p>For more information about RDS on VMware, see the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html"><i>RDS on VMware User Guide.</i></a></p>
 
 @param request A container for the necessary parameters to execute the DeleteCustomAvailabilityZone service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorCustomAvailabilityZoneNotFound`, `AWSrdsErrorKMSKeyNotAccessible`.
 
 @see AWSrdsDeleteCustomAvailabilityZoneMessage
 @see AWSrdsDeleteCustomAvailabilityZoneResult
 */
- (void)deleteCustomAvailabilityZone:(AWSrdsDeleteCustomAvailabilityZoneMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDeleteCustomAvailabilityZoneResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>The DeleteDBCluster action deletes a previously provisioned DB cluster. When you delete a DB cluster, all automated backups for that DB cluster are deleted and can't be recovered. Manual DB cluster snapshots of the specified DB cluster are not deleted.</p><p/><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDeleteDBClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorDBClusterSnapshotAlreadyExists`, `AWSrdsErrorSnapshotQuotaExceeded`, `AWSrdsErrorInvalidDBClusterSnapshotState`.
 
 @see AWSrdsDeleteDBClusterMessage
 @see AWSrdsDeleteDBClusterResult
 */
- (AWSTask<AWSrdsDeleteDBClusterResult *> *)deleteDBCluster:(AWSrdsDeleteDBClusterMessage *)request;

/**
 <p>The DeleteDBCluster action deletes a previously provisioned DB cluster. When you delete a DB cluster, all automated backups for that DB cluster are deleted and can't be recovered. Manual DB cluster snapshots of the specified DB cluster are not deleted.</p><p/><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorDBClusterSnapshotAlreadyExists`, `AWSrdsErrorSnapshotQuotaExceeded`, `AWSrdsErrorInvalidDBClusterSnapshotState`.
 
 @see AWSrdsDeleteDBClusterMessage
 @see AWSrdsDeleteDBClusterResult
 */
- (void)deleteDBCluster:(AWSrdsDeleteDBClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDeleteDBClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a custom endpoint and removes it from an Amazon Aurora DB cluster.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBClusterEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDBClusterEndpoint`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBClusterEndpointState`, `AWSrdsErrorDBClusterEndpointNotFound`, `AWSrdsErrorInvalidDBClusterState`.
 
 @see AWSrdsDeleteDBClusterEndpointMessage
 @see AWSrdsDBClusterEndpoint
 */
- (AWSTask<AWSrdsDBClusterEndpoint *> *)deleteDBClusterEndpoint:(AWSrdsDeleteDBClusterEndpointMessage *)request;

/**
 <p>Deletes a custom endpoint and removes it from an Amazon Aurora DB cluster.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBClusterEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBClusterEndpointState`, `AWSrdsErrorDBClusterEndpointNotFound`, `AWSrdsErrorInvalidDBClusterState`.
 
 @see AWSrdsDeleteDBClusterEndpointMessage
 @see AWSrdsDBClusterEndpoint
 */
- (void)deleteDBClusterEndpoint:(AWSrdsDeleteDBClusterEndpointMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDBClusterEndpoint * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified DB cluster parameter group. The DB cluster parameter group to be deleted can't be associated with any DB clusters.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBClusterParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBParameterGroupState`, `AWSrdsErrorDBParameterGroupNotFound`.
 
 @see AWSrdsDeleteDBClusterParameterGroupMessage
 */
- (AWSTask *)deleteDBClusterParameterGroup:(AWSrdsDeleteDBClusterParameterGroupMessage *)request;

/**
 <p>Deletes a specified DB cluster parameter group. The DB cluster parameter group to be deleted can't be associated with any DB clusters.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBClusterParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBParameterGroupState`, `AWSrdsErrorDBParameterGroupNotFound`.
 
 @see AWSrdsDeleteDBClusterParameterGroupMessage
 */
- (void)deleteDBClusterParameterGroup:(AWSrdsDeleteDBClusterParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a DB cluster snapshot. If the snapshot is being copied, the copy operation is terminated.</p><note><p>The DB cluster snapshot must be in the <code>available</code> state to be deleted.</p></note><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBClusterSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDeleteDBClusterSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBClusterSnapshotState`, `AWSrdsErrorDBClusterSnapshotNotFound`.
 
 @see AWSrdsDeleteDBClusterSnapshotMessage
 @see AWSrdsDeleteDBClusterSnapshotResult
 */
- (AWSTask<AWSrdsDeleteDBClusterSnapshotResult *> *)deleteDBClusterSnapshot:(AWSrdsDeleteDBClusterSnapshotMessage *)request;

/**
 <p>Deletes a DB cluster snapshot. If the snapshot is being copied, the copy operation is terminated.</p><note><p>The DB cluster snapshot must be in the <code>available</code> state to be deleted.</p></note><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBClusterSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBClusterSnapshotState`, `AWSrdsErrorDBClusterSnapshotNotFound`.
 
 @see AWSrdsDeleteDBClusterSnapshotMessage
 @see AWSrdsDeleteDBClusterSnapshotResult
 */
- (void)deleteDBClusterSnapshot:(AWSrdsDeleteDBClusterSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDeleteDBClusterSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>The DeleteDBInstance action deletes a previously provisioned DB instance. When you delete a DB instance, all automated backups for that instance are deleted and can't be recovered. Manual DB snapshots of the DB instance to be deleted by <code>DeleteDBInstance</code> are not deleted.</p><p> If you request a final DB snapshot the status of the Amazon RDS DB instance is <code>deleting</code> until the DB snapshot is created. The API action <code>DescribeDBInstance</code> is used to monitor the status of this operation. The action can't be canceled or reverted once submitted. </p><p>When a DB instance is in a failure state and has a status of <code>failed</code>, <code>incompatible-restore</code>, or <code>incompatible-network</code>, you can only delete it when you skip creation of the final snapshot with the <code>SkipFinalSnapshot</code> parameter.</p><p>If the specified DB instance is part of an Amazon Aurora DB cluster, you can't delete the DB instance if both of the following conditions are true:</p><ul><li><p>The DB cluster is a read replica of another Amazon Aurora DB cluster.</p></li><li><p>The DB instance is the only instance in the DB cluster.</p></li></ul><p>To delete a DB instance in this case, first call the <code>PromoteReadReplicaDBCluster</code> API action to promote the DB cluster so it's no longer a read replica. After the promotion completes, then call the <code>DeleteDBInstance</code> API action to delete the final instance in the DB cluster.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDBInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDeleteDBInstanceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorDBSnapshotAlreadyExists`, `AWSrdsErrorSnapshotQuotaExceeded`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorDBInstanceAutomatedBackupQuotaExceeded`.
 
 @see AWSrdsDeleteDBInstanceMessage
 @see AWSrdsDeleteDBInstanceResult
 */
- (AWSTask<AWSrdsDeleteDBInstanceResult *> *)deleteDBInstance:(AWSrdsDeleteDBInstanceMessage *)request;

/**
 <p>The DeleteDBInstance action deletes a previously provisioned DB instance. When you delete a DB instance, all automated backups for that instance are deleted and can't be recovered. Manual DB snapshots of the DB instance to be deleted by <code>DeleteDBInstance</code> are not deleted.</p><p> If you request a final DB snapshot the status of the Amazon RDS DB instance is <code>deleting</code> until the DB snapshot is created. The API action <code>DescribeDBInstance</code> is used to monitor the status of this operation. The action can't be canceled or reverted once submitted. </p><p>When a DB instance is in a failure state and has a status of <code>failed</code>, <code>incompatible-restore</code>, or <code>incompatible-network</code>, you can only delete it when you skip creation of the final snapshot with the <code>SkipFinalSnapshot</code> parameter.</p><p>If the specified DB instance is part of an Amazon Aurora DB cluster, you can't delete the DB instance if both of the following conditions are true:</p><ul><li><p>The DB cluster is a read replica of another Amazon Aurora DB cluster.</p></li><li><p>The DB instance is the only instance in the DB cluster.</p></li></ul><p>To delete a DB instance in this case, first call the <code>PromoteReadReplicaDBCluster</code> API action to promote the DB cluster so it's no longer a read replica. After the promotion completes, then call the <code>DeleteDBInstance</code> API action to delete the final instance in the DB cluster.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDBInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorDBSnapshotAlreadyExists`, `AWSrdsErrorSnapshotQuotaExceeded`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorDBInstanceAutomatedBackupQuotaExceeded`.
 
 @see AWSrdsDeleteDBInstanceMessage
 @see AWSrdsDeleteDBInstanceResult
 */
- (void)deleteDBInstance:(AWSrdsDeleteDBInstanceMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDeleteDBInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes automated backups based on the source instance's <code>DbiResourceId</code> value or the restorable instance's resource ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDBInstanceAutomatedBackup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDeleteDBInstanceAutomatedBackupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBInstanceAutomatedBackupState`, `AWSrdsErrorDBInstanceAutomatedBackupNotFound`.
 
 @see AWSrdsDeleteDBInstanceAutomatedBackupMessage
 @see AWSrdsDeleteDBInstanceAutomatedBackupResult
 */
- (AWSTask<AWSrdsDeleteDBInstanceAutomatedBackupResult *> *)deleteDBInstanceAutomatedBackup:(AWSrdsDeleteDBInstanceAutomatedBackupMessage *)request;

/**
 <p>Deletes automated backups based on the source instance's <code>DbiResourceId</code> value or the restorable instance's resource ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDBInstanceAutomatedBackup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBInstanceAutomatedBackupState`, `AWSrdsErrorDBInstanceAutomatedBackupNotFound`.
 
 @see AWSrdsDeleteDBInstanceAutomatedBackupMessage
 @see AWSrdsDeleteDBInstanceAutomatedBackupResult
 */
- (void)deleteDBInstanceAutomatedBackup:(AWSrdsDeleteDBInstanceAutomatedBackupMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDeleteDBInstanceAutomatedBackupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified DB parameter group. The DB parameter group to be deleted can't be associated with any DB instances.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDBParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBParameterGroupState`, `AWSrdsErrorDBParameterGroupNotFound`.
 
 @see AWSrdsDeleteDBParameterGroupMessage
 */
- (AWSTask *)deleteDBParameterGroup:(AWSrdsDeleteDBParameterGroupMessage *)request;

/**
 <p>Deletes a specified DB parameter group. The DB parameter group to be deleted can't be associated with any DB instances.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDBParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBParameterGroupState`, `AWSrdsErrorDBParameterGroupNotFound`.
 
 @see AWSrdsDeleteDBParameterGroupMessage
 */
- (void)deleteDBParameterGroup:(AWSrdsDeleteDBParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Deletes an existing proxy.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDBProxy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDeleteDBProxyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBProxyNotFound`, `AWSrdsErrorInvalidDBProxyState`.
 
 @see AWSrdsDeleteDBProxyRequest
 @see AWSrdsDeleteDBProxyResponse
 */
- (AWSTask<AWSrdsDeleteDBProxyResponse *> *)deleteDBProxy:(AWSrdsDeleteDBProxyRequest *)request;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Deletes an existing proxy.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDBProxy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBProxyNotFound`, `AWSrdsErrorInvalidDBProxyState`.
 
 @see AWSrdsDeleteDBProxyRequest
 @see AWSrdsDeleteDBProxyResponse
 */
- (void)deleteDBProxy:(AWSrdsDeleteDBProxyRequest *)request completionHandler:(void (^ _Nullable)(AWSrdsDeleteDBProxyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a DB security group.</p><note><p>The specified DB security group must not be associated with any DB instances.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBSecurityGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBSecurityGroupState`, `AWSrdsErrorDBSecurityGroupNotFound`.
 
 @see AWSrdsDeleteDBSecurityGroupMessage
 */
- (AWSTask *)deleteDBSecurityGroup:(AWSrdsDeleteDBSecurityGroupMessage *)request;

/**
 <p>Deletes a DB security group.</p><note><p>The specified DB security group must not be associated with any DB instances.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBSecurityGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBSecurityGroupState`, `AWSrdsErrorDBSecurityGroupNotFound`.
 
 @see AWSrdsDeleteDBSecurityGroupMessage
 */
- (void)deleteDBSecurityGroup:(AWSrdsDeleteDBSecurityGroupMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a DB snapshot. If the snapshot is being copied, the copy operation is terminated.</p><note><p>The DB snapshot must be in the <code>available</code> state to be deleted.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDeleteDBSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBSnapshotState`, `AWSrdsErrorDBSnapshotNotFound`.
 
 @see AWSrdsDeleteDBSnapshotMessage
 @see AWSrdsDeleteDBSnapshotResult
 */
- (AWSTask<AWSrdsDeleteDBSnapshotResult *> *)deleteDBSnapshot:(AWSrdsDeleteDBSnapshotMessage *)request;

/**
 <p>Deletes a DB snapshot. If the snapshot is being copied, the copy operation is terminated.</p><note><p>The DB snapshot must be in the <code>available</code> state to be deleted.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBSnapshotState`, `AWSrdsErrorDBSnapshotNotFound`.
 
 @see AWSrdsDeleteDBSnapshotMessage
 @see AWSrdsDeleteDBSnapshotResult
 */
- (void)deleteDBSnapshot:(AWSrdsDeleteDBSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDeleteDBSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a DB subnet group.</p><note><p>The specified database subnet group must not be associated with any DB instances.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBSubnetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBSubnetGroupState`, `AWSrdsErrorInvalidDBSubnetState`, `AWSrdsErrorDBSubnetGroupNotFound`.
 
 @see AWSrdsDeleteDBSubnetGroupMessage
 */
- (AWSTask *)deleteDBSubnetGroup:(AWSrdsDeleteDBSubnetGroupMessage *)request;

/**
 <p>Deletes a DB subnet group.</p><note><p>The specified database subnet group must not be associated with any DB instances.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBSubnetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBSubnetGroupState`, `AWSrdsErrorInvalidDBSubnetState`, `AWSrdsErrorDBSubnetGroupNotFound`.
 
 @see AWSrdsDeleteDBSubnetGroupMessage
 */
- (void)deleteDBSubnetGroup:(AWSrdsDeleteDBSubnetGroupMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an RDS event notification subscription.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEventSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDeleteEventSubscriptionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorSubscriptionNotFound`, `AWSrdsErrorInvalidEventSubscriptionState`.
 
 @see AWSrdsDeleteEventSubscriptionMessage
 @see AWSrdsDeleteEventSubscriptionResult
 */
- (AWSTask<AWSrdsDeleteEventSubscriptionResult *> *)deleteEventSubscription:(AWSrdsDeleteEventSubscriptionMessage *)request;

/**
 <p>Deletes an RDS event notification subscription.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEventSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorSubscriptionNotFound`, `AWSrdsErrorInvalidEventSubscriptionState`.
 
 @see AWSrdsDeleteEventSubscriptionMessage
 @see AWSrdsDeleteEventSubscriptionResult
 */
- (void)deleteEventSubscription:(AWSrdsDeleteEventSubscriptionMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDeleteEventSubscriptionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes a global database cluster. The primary and secondary clusters must already be detached or destroyed first. </p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteGlobalCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDeleteGlobalClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorGlobalClusterNotFound`, `AWSrdsErrorInvalidGlobalClusterState`.
 
 @see AWSrdsDeleteGlobalClusterMessage
 @see AWSrdsDeleteGlobalClusterResult
 */
- (AWSTask<AWSrdsDeleteGlobalClusterResult *> *)deleteGlobalCluster:(AWSrdsDeleteGlobalClusterMessage *)request;

/**
 <p> Deletes a global database cluster. The primary and secondary clusters must already be detached or destroyed first. </p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteGlobalCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorGlobalClusterNotFound`, `AWSrdsErrorInvalidGlobalClusterState`.
 
 @see AWSrdsDeleteGlobalClusterMessage
 @see AWSrdsDeleteGlobalClusterResult
 */
- (void)deleteGlobalCluster:(AWSrdsDeleteGlobalClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDeleteGlobalClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the installation medium for a DB engine that requires an on-premises customer provided license, such as Microsoft SQL Server.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInstallationMedia service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsInstallationMedia`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInstallationMediaNotFound`.
 
 @see AWSrdsDeleteInstallationMediaMessage
 @see AWSrdsInstallationMedia
 */
- (AWSTask<AWSrdsInstallationMedia *> *)deleteInstallationMedia:(AWSrdsDeleteInstallationMediaMessage *)request;

/**
 <p>Deletes the installation medium for a DB engine that requires an on-premises customer provided license, such as Microsoft SQL Server.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInstallationMedia service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInstallationMediaNotFound`.
 
 @see AWSrdsDeleteInstallationMediaMessage
 @see AWSrdsInstallationMedia
 */
- (void)deleteInstallationMedia:(AWSrdsDeleteInstallationMediaMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsInstallationMedia * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an existing option group.</p>
 
 @param request A container for the necessary parameters to execute the DeleteOptionGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorOptionGroupNotFound`, `AWSrdsErrorInvalidOptionGroupState`.
 
 @see AWSrdsDeleteOptionGroupMessage
 */
- (AWSTask *)deleteOptionGroup:(AWSrdsDeleteOptionGroupMessage *)request;

/**
 <p>Deletes an existing option group.</p>
 
 @param request A container for the necessary parameters to execute the DeleteOptionGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorOptionGroupNotFound`, `AWSrdsErrorInvalidOptionGroupState`.
 
 @see AWSrdsDeleteOptionGroupMessage
 */
- (void)deleteOptionGroup:(AWSrdsDeleteOptionGroupMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Remove the association between one or more <code>DBProxyTarget</code> data structures and a <code>DBProxyTargetGroup</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterDBProxyTargets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDeregisterDBProxyTargetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBProxyTargetNotFound`, `AWSrdsErrorDBProxyTargetGroupNotFound`, `AWSrdsErrorDBProxyNotFound`, `AWSrdsErrorInvalidDBProxyState`.
 
 @see AWSrdsDeregisterDBProxyTargetsRequest
 @see AWSrdsDeregisterDBProxyTargetsResponse
 */
- (AWSTask<AWSrdsDeregisterDBProxyTargetsResponse *> *)deregisterDBProxyTargets:(AWSrdsDeregisterDBProxyTargetsRequest *)request;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Remove the association between one or more <code>DBProxyTarget</code> data structures and a <code>DBProxyTargetGroup</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterDBProxyTargets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBProxyTargetNotFound`, `AWSrdsErrorDBProxyTargetGroupNotFound`, `AWSrdsErrorDBProxyNotFound`, `AWSrdsErrorInvalidDBProxyState`.
 
 @see AWSrdsDeregisterDBProxyTargetsRequest
 @see AWSrdsDeregisterDBProxyTargetsResponse
 */
- (void)deregisterDBProxyTargets:(AWSrdsDeregisterDBProxyTargetsRequest *)request completionHandler:(void (^ _Nullable)(AWSrdsDeregisterDBProxyTargetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all of the attributes for a customer account. The attributes include Amazon RDS quotas for the account, such as the number of DB instances allowed. The description for a quota includes the quota name, current usage toward that quota, and the quota's maximum value.</p><p>This command doesn't take any parameters.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccountAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsAccountAttributesMessage`.
 
 @see AWSrdsDescribeAccountAttributesMessage
 @see AWSrdsAccountAttributesMessage
 */
- (AWSTask<AWSrdsAccountAttributesMessage *> *)describeAccountAttributes:(AWSrdsDescribeAccountAttributesMessage *)request;

/**
 <p>Lists all of the attributes for a customer account. The attributes include Amazon RDS quotas for the account, such as the number of DB instances allowed. The description for a quota includes the quota name, current usage toward that quota, and the quota's maximum value.</p><p>This command doesn't take any parameters.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccountAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSrdsDescribeAccountAttributesMessage
 @see AWSrdsAccountAttributesMessage
 */
- (void)describeAccountAttributes:(AWSrdsDescribeAccountAttributesMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsAccountAttributesMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the set of CA certificates provided by Amazon RDS for this AWS account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCertificates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsCertificateMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorCertificateNotFound`.
 
 @see AWSrdsDescribeCertificatesMessage
 @see AWSrdsCertificateMessage
 */
- (AWSTask<AWSrdsCertificateMessage *> *)describeCertificates:(AWSrdsDescribeCertificatesMessage *)request;

/**
 <p>Lists the set of CA certificates provided by Amazon RDS for this AWS account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCertificates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorCertificateNotFound`.
 
 @see AWSrdsDescribeCertificatesMessage
 @see AWSrdsCertificateMessage
 */
- (void)describeCertificates:(AWSrdsDescribeCertificatesMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsCertificateMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about custom Availability Zones (AZs).</p><p>A custom AZ is an on-premises AZ that is integrated with a VMware vSphere cluster.</p><p>For more information about RDS on VMware, see the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html"><i>RDS on VMware User Guide.</i></a></p>
 
 @param request A container for the necessary parameters to execute the DescribeCustomAvailabilityZones service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsCustomAvailabilityZoneMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorCustomAvailabilityZoneNotFound`.
 
 @see AWSrdsDescribeCustomAvailabilityZonesMessage
 @see AWSrdsCustomAvailabilityZoneMessage
 */
- (AWSTask<AWSrdsCustomAvailabilityZoneMessage *> *)describeCustomAvailabilityZones:(AWSrdsDescribeCustomAvailabilityZonesMessage *)request;

/**
 <p>Returns information about custom Availability Zones (AZs).</p><p>A custom AZ is an on-premises AZ that is integrated with a VMware vSphere cluster.</p><p>For more information about RDS on VMware, see the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html"><i>RDS on VMware User Guide.</i></a></p>
 
 @param request A container for the necessary parameters to execute the DescribeCustomAvailabilityZones service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorCustomAvailabilityZoneNotFound`.
 
 @see AWSrdsDescribeCustomAvailabilityZonesMessage
 @see AWSrdsCustomAvailabilityZoneMessage
 */
- (void)describeCustomAvailabilityZones:(AWSrdsDescribeCustomAvailabilityZonesMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsCustomAvailabilityZoneMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about backtracks for a DB cluster.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusterBacktracks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDBClusterBacktrackMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorDBClusterBacktrackNotFound`.
 
 @see AWSrdsDescribeDBClusterBacktracksMessage
 @see AWSrdsDBClusterBacktrackMessage
 */
- (AWSTask<AWSrdsDBClusterBacktrackMessage *> *)describeDBClusterBacktracks:(AWSrdsDescribeDBClusterBacktracksMessage *)request;

/**
 <p>Returns information about backtracks for a DB cluster.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusterBacktracks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorDBClusterBacktrackNotFound`.
 
 @see AWSrdsDescribeDBClusterBacktracksMessage
 @see AWSrdsDBClusterBacktrackMessage
 */
- (void)describeDBClusterBacktracks:(AWSrdsDescribeDBClusterBacktracksMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDBClusterBacktrackMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about endpoints for an Amazon Aurora DB cluster.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusterEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDBClusterEndpointMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`.
 
 @see AWSrdsDescribeDBClusterEndpointsMessage
 @see AWSrdsDBClusterEndpointMessage
 */
- (AWSTask<AWSrdsDBClusterEndpointMessage *> *)describeDBClusterEndpoints:(AWSrdsDescribeDBClusterEndpointsMessage *)request;

/**
 <p>Returns information about endpoints for an Amazon Aurora DB cluster.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusterEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`.
 
 @see AWSrdsDescribeDBClusterEndpointsMessage
 @see AWSrdsDBClusterEndpointMessage
 */
- (void)describeDBClusterEndpoints:(AWSrdsDescribeDBClusterEndpointsMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDBClusterEndpointMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of <code>DBClusterParameterGroup</code> descriptions. If a <code>DBClusterParameterGroupName</code> parameter is specified, the list will contain only the description of the specified DB cluster parameter group. </p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusterParameterGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDBClusterParameterGroupsMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBParameterGroupNotFound`.
 
 @see AWSrdsDescribeDBClusterParameterGroupsMessage
 @see AWSrdsDBClusterParameterGroupsMessage
 */
- (AWSTask<AWSrdsDBClusterParameterGroupsMessage *> *)describeDBClusterParameterGroups:(AWSrdsDescribeDBClusterParameterGroupsMessage *)request;

/**
 <p> Returns a list of <code>DBClusterParameterGroup</code> descriptions. If a <code>DBClusterParameterGroupName</code> parameter is specified, the list will contain only the description of the specified DB cluster parameter group. </p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusterParameterGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBParameterGroupNotFound`.
 
 @see AWSrdsDescribeDBClusterParameterGroupsMessage
 @see AWSrdsDBClusterParameterGroupsMessage
 */
- (void)describeDBClusterParameterGroups:(AWSrdsDescribeDBClusterParameterGroupsMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDBClusterParameterGroupsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the detailed parameter list for a particular DB cluster parameter group.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusterParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDBClusterParameterGroupDetails`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBParameterGroupNotFound`.
 
 @see AWSrdsDescribeDBClusterParametersMessage
 @see AWSrdsDBClusterParameterGroupDetails
 */
- (AWSTask<AWSrdsDBClusterParameterGroupDetails *> *)describeDBClusterParameters:(AWSrdsDescribeDBClusterParametersMessage *)request;

/**
 <p>Returns the detailed parameter list for a particular DB cluster parameter group.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusterParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBParameterGroupNotFound`.
 
 @see AWSrdsDescribeDBClusterParametersMessage
 @see AWSrdsDBClusterParameterGroupDetails
 */
- (void)describeDBClusterParameters:(AWSrdsDescribeDBClusterParametersMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDBClusterParameterGroupDetails * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of DB cluster snapshot attribute names and values for a manual DB cluster snapshot.</p><p>When sharing snapshots with other AWS accounts, <code>DescribeDBClusterSnapshotAttributes</code> returns the <code>restore</code> attribute and a list of IDs for the AWS accounts that are authorized to copy or restore the manual DB cluster snapshot. If <code>all</code> is included in the list of values for the <code>restore</code> attribute, then the manual DB cluster snapshot is public and can be copied or restored by all AWS accounts.</p><p>To add or remove access for an AWS account to copy or restore a manual DB cluster snapshot, or to make the manual DB cluster snapshot public or private, use the <code>ModifyDBClusterSnapshotAttribute</code> API action.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusterSnapshotAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDescribeDBClusterSnapshotAttributesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterSnapshotNotFound`.
 
 @see AWSrdsDescribeDBClusterSnapshotAttributesMessage
 @see AWSrdsDescribeDBClusterSnapshotAttributesResult
 */
- (AWSTask<AWSrdsDescribeDBClusterSnapshotAttributesResult *> *)describeDBClusterSnapshotAttributes:(AWSrdsDescribeDBClusterSnapshotAttributesMessage *)request;

/**
 <p>Returns a list of DB cluster snapshot attribute names and values for a manual DB cluster snapshot.</p><p>When sharing snapshots with other AWS accounts, <code>DescribeDBClusterSnapshotAttributes</code> returns the <code>restore</code> attribute and a list of IDs for the AWS accounts that are authorized to copy or restore the manual DB cluster snapshot. If <code>all</code> is included in the list of values for the <code>restore</code> attribute, then the manual DB cluster snapshot is public and can be copied or restored by all AWS accounts.</p><p>To add or remove access for an AWS account to copy or restore a manual DB cluster snapshot, or to make the manual DB cluster snapshot public or private, use the <code>ModifyDBClusterSnapshotAttribute</code> API action.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusterSnapshotAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterSnapshotNotFound`.
 
 @see AWSrdsDescribeDBClusterSnapshotAttributesMessage
 @see AWSrdsDescribeDBClusterSnapshotAttributesResult
 */
- (void)describeDBClusterSnapshotAttributes:(AWSrdsDescribeDBClusterSnapshotAttributesMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDescribeDBClusterSnapshotAttributesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about DB cluster snapshots. This API action supports pagination.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusterSnapshots service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDBClusterSnapshotMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterSnapshotNotFound`.
 
 @see AWSrdsDescribeDBClusterSnapshotsMessage
 @see AWSrdsDBClusterSnapshotMessage
 */
- (AWSTask<AWSrdsDBClusterSnapshotMessage *> *)describeDBClusterSnapshots:(AWSrdsDescribeDBClusterSnapshotsMessage *)request;

/**
 <p>Returns information about DB cluster snapshots. This API action supports pagination.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusterSnapshots service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterSnapshotNotFound`.
 
 @see AWSrdsDescribeDBClusterSnapshotsMessage
 @see AWSrdsDBClusterSnapshotMessage
 */
- (void)describeDBClusterSnapshots:(AWSrdsDescribeDBClusterSnapshotsMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDBClusterSnapshotMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about provisioned Aurora DB clusters. This API supports pagination.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This operation can also return information for Amazon Neptune DB instances and Amazon DocumentDB instances.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDBClusterMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`.
 
 @see AWSrdsDescribeDBClustersMessage
 @see AWSrdsDBClusterMessage
 */
- (AWSTask<AWSrdsDBClusterMessage *> *)describeDBClusters:(AWSrdsDescribeDBClustersMessage *)request;

/**
 <p>Returns information about provisioned Aurora DB clusters. This API supports pagination.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This operation can also return information for Amazon Neptune DB instances and Amazon DocumentDB instances.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`.
 
 @see AWSrdsDescribeDBClustersMessage
 @see AWSrdsDBClusterMessage
 */
- (void)describeDBClusters:(AWSrdsDescribeDBClustersMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDBClusterMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the available DB engines.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBEngineVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDBEngineVersionMessage`.
 
 @see AWSrdsDescribeDBEngineVersionsMessage
 @see AWSrdsDBEngineVersionMessage
 */
- (AWSTask<AWSrdsDBEngineVersionMessage *> *)describeDBEngineVersions:(AWSrdsDescribeDBEngineVersionsMessage *)request;

/**
 <p>Returns a list of the available DB engines.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBEngineVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSrdsDescribeDBEngineVersionsMessage
 @see AWSrdsDBEngineVersionMessage
 */
- (void)describeDBEngineVersions:(AWSrdsDescribeDBEngineVersionsMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDBEngineVersionMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Displays backups for both current and deleted instances. For example, use this operation to find details about automated backups for previously deleted instances. Current instances with retention periods greater than zero (0) are returned for both the <code>DescribeDBInstanceAutomatedBackups</code> and <code>DescribeDBInstances</code> operations.</p><p>All parameters are optional.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBInstanceAutomatedBackups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDBInstanceAutomatedBackupMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceAutomatedBackupNotFound`.
 
 @see AWSrdsDescribeDBInstanceAutomatedBackupsMessage
 @see AWSrdsDBInstanceAutomatedBackupMessage
 */
- (AWSTask<AWSrdsDBInstanceAutomatedBackupMessage *> *)describeDBInstanceAutomatedBackups:(AWSrdsDescribeDBInstanceAutomatedBackupsMessage *)request;

/**
 <p>Displays backups for both current and deleted instances. For example, use this operation to find details about automated backups for previously deleted instances. Current instances with retention periods greater than zero (0) are returned for both the <code>DescribeDBInstanceAutomatedBackups</code> and <code>DescribeDBInstances</code> operations.</p><p>All parameters are optional.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBInstanceAutomatedBackups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceAutomatedBackupNotFound`.
 
 @see AWSrdsDescribeDBInstanceAutomatedBackupsMessage
 @see AWSrdsDBInstanceAutomatedBackupMessage
 */
- (void)describeDBInstanceAutomatedBackups:(AWSrdsDescribeDBInstanceAutomatedBackupsMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDBInstanceAutomatedBackupMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about provisioned RDS instances. This API supports pagination.</p><note><p>This operation can also return information for Amazon Neptune DB instances and Amazon DocumentDB instances.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDBInstanceMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceNotFound`.
 
 @see AWSrdsDescribeDBInstancesMessage
 @see AWSrdsDBInstanceMessage
 */
- (AWSTask<AWSrdsDBInstanceMessage *> *)describeDBInstances:(AWSrdsDescribeDBInstancesMessage *)request;

/**
 <p>Returns information about provisioned RDS instances. This API supports pagination.</p><note><p>This operation can also return information for Amazon Neptune DB instances and Amazon DocumentDB instances.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceNotFound`.
 
 @see AWSrdsDescribeDBInstancesMessage
 @see AWSrdsDBInstanceMessage
 */
- (void)describeDBInstances:(AWSrdsDescribeDBInstancesMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDBInstanceMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of DB log files for the DB instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBLogFiles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDescribeDBLogFilesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceNotFound`.
 
 @see AWSrdsDescribeDBLogFilesMessage
 @see AWSrdsDescribeDBLogFilesResponse
 */
- (AWSTask<AWSrdsDescribeDBLogFilesResponse *> *)describeDBLogFiles:(AWSrdsDescribeDBLogFilesMessage *)request;

/**
 <p>Returns a list of DB log files for the DB instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBLogFiles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceNotFound`.
 
 @see AWSrdsDescribeDBLogFilesMessage
 @see AWSrdsDescribeDBLogFilesResponse
 */
- (void)describeDBLogFiles:(AWSrdsDescribeDBLogFilesMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDescribeDBLogFilesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of <code>DBParameterGroup</code> descriptions. If a <code>DBParameterGroupName</code> is specified, the list will contain only the description of the specified DB parameter group. </p>
 
 @param request A container for the necessary parameters to execute the DescribeDBParameterGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDBParameterGroupsMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBParameterGroupNotFound`.
 
 @see AWSrdsDescribeDBParameterGroupsMessage
 @see AWSrdsDBParameterGroupsMessage
 */
- (AWSTask<AWSrdsDBParameterGroupsMessage *> *)describeDBParameterGroups:(AWSrdsDescribeDBParameterGroupsMessage *)request;

/**
 <p> Returns a list of <code>DBParameterGroup</code> descriptions. If a <code>DBParameterGroupName</code> is specified, the list will contain only the description of the specified DB parameter group. </p>
 
 @param request A container for the necessary parameters to execute the DescribeDBParameterGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBParameterGroupNotFound`.
 
 @see AWSrdsDescribeDBParameterGroupsMessage
 @see AWSrdsDBParameterGroupsMessage
 */
- (void)describeDBParameterGroups:(AWSrdsDescribeDBParameterGroupsMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDBParameterGroupsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the detailed parameter list for a particular DB parameter group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDBParameterGroupDetails`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBParameterGroupNotFound`.
 
 @see AWSrdsDescribeDBParametersMessage
 @see AWSrdsDBParameterGroupDetails
 */
- (AWSTask<AWSrdsDBParameterGroupDetails *> *)describeDBParameters:(AWSrdsDescribeDBParametersMessage *)request;

/**
 <p>Returns the detailed parameter list for a particular DB parameter group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBParameterGroupNotFound`.
 
 @see AWSrdsDescribeDBParametersMessage
 @see AWSrdsDBParameterGroupDetails
 */
- (void)describeDBParameters:(AWSrdsDescribeDBParametersMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDBParameterGroupDetails * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Returns information about DB proxies.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBProxies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDescribeDBProxiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBProxyNotFound`.
 
 @see AWSrdsDescribeDBProxiesRequest
 @see AWSrdsDescribeDBProxiesResponse
 */
- (AWSTask<AWSrdsDescribeDBProxiesResponse *> *)describeDBProxies:(AWSrdsDescribeDBProxiesRequest *)request;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Returns information about DB proxies.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBProxies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBProxyNotFound`.
 
 @see AWSrdsDescribeDBProxiesRequest
 @see AWSrdsDescribeDBProxiesResponse
 */
- (void)describeDBProxies:(AWSrdsDescribeDBProxiesRequest *)request completionHandler:(void (^ _Nullable)(AWSrdsDescribeDBProxiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Returns information about DB proxy target groups, represented by <code>DBProxyTargetGroup</code> data structures.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBProxyTargetGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDescribeDBProxyTargetGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBProxyNotFound`, `AWSrdsErrorDBProxyTargetGroupNotFound`, `AWSrdsErrorInvalidDBProxyState`.
 
 @see AWSrdsDescribeDBProxyTargetGroupsRequest
 @see AWSrdsDescribeDBProxyTargetGroupsResponse
 */
- (AWSTask<AWSrdsDescribeDBProxyTargetGroupsResponse *> *)describeDBProxyTargetGroups:(AWSrdsDescribeDBProxyTargetGroupsRequest *)request;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Returns information about DB proxy target groups, represented by <code>DBProxyTargetGroup</code> data structures.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBProxyTargetGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBProxyNotFound`, `AWSrdsErrorDBProxyTargetGroupNotFound`, `AWSrdsErrorInvalidDBProxyState`.
 
 @see AWSrdsDescribeDBProxyTargetGroupsRequest
 @see AWSrdsDescribeDBProxyTargetGroupsResponse
 */
- (void)describeDBProxyTargetGroups:(AWSrdsDescribeDBProxyTargetGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSrdsDescribeDBProxyTargetGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Returns information about <code>DBProxyTarget</code> objects. This API supports pagination.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBProxyTargets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDescribeDBProxyTargetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBProxyNotFound`, `AWSrdsErrorDBProxyTargetNotFound`, `AWSrdsErrorDBProxyTargetGroupNotFound`, `AWSrdsErrorInvalidDBProxyState`.
 
 @see AWSrdsDescribeDBProxyTargetsRequest
 @see AWSrdsDescribeDBProxyTargetsResponse
 */
- (AWSTask<AWSrdsDescribeDBProxyTargetsResponse *> *)describeDBProxyTargets:(AWSrdsDescribeDBProxyTargetsRequest *)request;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Returns information about <code>DBProxyTarget</code> objects. This API supports pagination.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBProxyTargets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBProxyNotFound`, `AWSrdsErrorDBProxyTargetNotFound`, `AWSrdsErrorDBProxyTargetGroupNotFound`, `AWSrdsErrorInvalidDBProxyState`.
 
 @see AWSrdsDescribeDBProxyTargetsRequest
 @see AWSrdsDescribeDBProxyTargetsResponse
 */
- (void)describeDBProxyTargets:(AWSrdsDescribeDBProxyTargetsRequest *)request completionHandler:(void (^ _Nullable)(AWSrdsDescribeDBProxyTargetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of <code>DBSecurityGroup</code> descriptions. If a <code>DBSecurityGroupName</code> is specified, the list will contain only the descriptions of the specified DB security group. </p>
 
 @param request A container for the necessary parameters to execute the DescribeDBSecurityGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDBSecurityGroupMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSecurityGroupNotFound`.
 
 @see AWSrdsDescribeDBSecurityGroupsMessage
 @see AWSrdsDBSecurityGroupMessage
 */
- (AWSTask<AWSrdsDBSecurityGroupMessage *> *)describeDBSecurityGroups:(AWSrdsDescribeDBSecurityGroupsMessage *)request;

/**
 <p> Returns a list of <code>DBSecurityGroup</code> descriptions. If a <code>DBSecurityGroupName</code> is specified, the list will contain only the descriptions of the specified DB security group. </p>
 
 @param request A container for the necessary parameters to execute the DescribeDBSecurityGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSecurityGroupNotFound`.
 
 @see AWSrdsDescribeDBSecurityGroupsMessage
 @see AWSrdsDBSecurityGroupMessage
 */
- (void)describeDBSecurityGroups:(AWSrdsDescribeDBSecurityGroupsMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDBSecurityGroupMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of DB snapshot attribute names and values for a manual DB snapshot.</p><p>When sharing snapshots with other AWS accounts, <code>DescribeDBSnapshotAttributes</code> returns the <code>restore</code> attribute and a list of IDs for the AWS accounts that are authorized to copy or restore the manual DB snapshot. If <code>all</code> is included in the list of values for the <code>restore</code> attribute, then the manual DB snapshot is public and can be copied or restored by all AWS accounts.</p><p>To add or remove access for an AWS account to copy or restore a manual DB snapshot, or to make the manual DB snapshot public or private, use the <code>ModifyDBSnapshotAttribute</code> API action.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBSnapshotAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDescribeDBSnapshotAttributesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSnapshotNotFound`.
 
 @see AWSrdsDescribeDBSnapshotAttributesMessage
 @see AWSrdsDescribeDBSnapshotAttributesResult
 */
- (AWSTask<AWSrdsDescribeDBSnapshotAttributesResult *> *)describeDBSnapshotAttributes:(AWSrdsDescribeDBSnapshotAttributesMessage *)request;

/**
 <p>Returns a list of DB snapshot attribute names and values for a manual DB snapshot.</p><p>When sharing snapshots with other AWS accounts, <code>DescribeDBSnapshotAttributes</code> returns the <code>restore</code> attribute and a list of IDs for the AWS accounts that are authorized to copy or restore the manual DB snapshot. If <code>all</code> is included in the list of values for the <code>restore</code> attribute, then the manual DB snapshot is public and can be copied or restored by all AWS accounts.</p><p>To add or remove access for an AWS account to copy or restore a manual DB snapshot, or to make the manual DB snapshot public or private, use the <code>ModifyDBSnapshotAttribute</code> API action.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBSnapshotAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSnapshotNotFound`.
 
 @see AWSrdsDescribeDBSnapshotAttributesMessage
 @see AWSrdsDescribeDBSnapshotAttributesResult
 */
- (void)describeDBSnapshotAttributes:(AWSrdsDescribeDBSnapshotAttributesMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDescribeDBSnapshotAttributesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about DB snapshots. This API action supports pagination.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBSnapshots service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDBSnapshotMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSnapshotNotFound`.
 
 @see AWSrdsDescribeDBSnapshotsMessage
 @see AWSrdsDBSnapshotMessage
 */
- (AWSTask<AWSrdsDBSnapshotMessage *> *)describeDBSnapshots:(AWSrdsDescribeDBSnapshotsMessage *)request;

/**
 <p>Returns information about DB snapshots. This API action supports pagination.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBSnapshots service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSnapshotNotFound`.
 
 @see AWSrdsDescribeDBSnapshotsMessage
 @see AWSrdsDBSnapshotMessage
 */
- (void)describeDBSnapshots:(AWSrdsDescribeDBSnapshotsMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDBSnapshotMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of DBSubnetGroup descriptions. If a DBSubnetGroupName is specified, the list will contain only the descriptions of the specified DBSubnetGroup.</p><p>For an overview of CIDR ranges, go to the <a href="http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Wikipedia Tutorial</a>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeDBSubnetGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDBSubnetGroupMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSubnetGroupNotFound`.
 
 @see AWSrdsDescribeDBSubnetGroupsMessage
 @see AWSrdsDBSubnetGroupMessage
 */
- (AWSTask<AWSrdsDBSubnetGroupMessage *> *)describeDBSubnetGroups:(AWSrdsDescribeDBSubnetGroupsMessage *)request;

/**
 <p>Returns a list of DBSubnetGroup descriptions. If a DBSubnetGroupName is specified, the list will contain only the descriptions of the specified DBSubnetGroup.</p><p>For an overview of CIDR ranges, go to the <a href="http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Wikipedia Tutorial</a>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeDBSubnetGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSubnetGroupNotFound`.
 
 @see AWSrdsDescribeDBSubnetGroupsMessage
 @see AWSrdsDBSubnetGroupMessage
 */
- (void)describeDBSubnetGroups:(AWSrdsDescribeDBSubnetGroupsMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDBSubnetGroupMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the default engine and system parameter information for the cluster database engine.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the DescribeEngineDefaultClusterParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDescribeEngineDefaultClusterParametersResult`.
 
 @see AWSrdsDescribeEngineDefaultClusterParametersMessage
 @see AWSrdsDescribeEngineDefaultClusterParametersResult
 */
- (AWSTask<AWSrdsDescribeEngineDefaultClusterParametersResult *> *)describeEngineDefaultClusterParameters:(AWSrdsDescribeEngineDefaultClusterParametersMessage *)request;

/**
 <p>Returns the default engine and system parameter information for the cluster database engine.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the DescribeEngineDefaultClusterParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSrdsDescribeEngineDefaultClusterParametersMessage
 @see AWSrdsDescribeEngineDefaultClusterParametersResult
 */
- (void)describeEngineDefaultClusterParameters:(AWSrdsDescribeEngineDefaultClusterParametersMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDescribeEngineDefaultClusterParametersResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the default engine and system parameter information for the specified database engine.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEngineDefaultParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDescribeEngineDefaultParametersResult`.
 
 @see AWSrdsDescribeEngineDefaultParametersMessage
 @see AWSrdsDescribeEngineDefaultParametersResult
 */
- (AWSTask<AWSrdsDescribeEngineDefaultParametersResult *> *)describeEngineDefaultParameters:(AWSrdsDescribeEngineDefaultParametersMessage *)request;

/**
 <p>Returns the default engine and system parameter information for the specified database engine.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEngineDefaultParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSrdsDescribeEngineDefaultParametersMessage
 @see AWSrdsDescribeEngineDefaultParametersResult
 */
- (void)describeEngineDefaultParameters:(AWSrdsDescribeEngineDefaultParametersMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDescribeEngineDefaultParametersResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Displays a list of categories for all event source types, or, if specified, for a specified source type. You can see a list of the event categories and source types in the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html"> Events</a> topic in the <i>Amazon RDS User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the DescribeEventCategories service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsEventCategoriesMessage`.
 
 @see AWSrdsDescribeEventCategoriesMessage
 @see AWSrdsEventCategoriesMessage
 */
- (AWSTask<AWSrdsEventCategoriesMessage *> *)describeEventCategories:(AWSrdsDescribeEventCategoriesMessage *)request;

/**
 <p>Displays a list of categories for all event source types, or, if specified, for a specified source type. You can see a list of the event categories and source types in the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html"> Events</a> topic in the <i>Amazon RDS User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the DescribeEventCategories service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSrdsDescribeEventCategoriesMessage
 @see AWSrdsEventCategoriesMessage
 */
- (void)describeEventCategories:(AWSrdsDescribeEventCategoriesMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsEventCategoriesMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the subscription descriptions for a customer account. The description for a subscription includes SubscriptionName, SNSTopicARN, CustomerID, SourceType, SourceID, CreationTime, and Status.</p><p>If you specify a SubscriptionName, lists the description for that subscription.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEventSubscriptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsEventSubscriptionsMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorSubscriptionNotFound`.
 
 @see AWSrdsDescribeEventSubscriptionsMessage
 @see AWSrdsEventSubscriptionsMessage
 */
- (AWSTask<AWSrdsEventSubscriptionsMessage *> *)describeEventSubscriptions:(AWSrdsDescribeEventSubscriptionsMessage *)request;

/**
 <p>Lists all the subscription descriptions for a customer account. The description for a subscription includes SubscriptionName, SNSTopicARN, CustomerID, SourceType, SourceID, CreationTime, and Status.</p><p>If you specify a SubscriptionName, lists the description for that subscription.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEventSubscriptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorSubscriptionNotFound`.
 
 @see AWSrdsDescribeEventSubscriptionsMessage
 @see AWSrdsEventSubscriptionsMessage
 */
- (void)describeEventSubscriptions:(AWSrdsDescribeEventSubscriptionsMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsEventSubscriptionsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns events related to DB instances, DB security groups, DB snapshots, and DB parameter groups for the past 14 days. Events specific to a particular DB instance, DB security group, database snapshot, or DB parameter group can be obtained by providing the name as a parameter. By default, the past hour of events are returned.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsEventsMessage`.
 
 @see AWSrdsDescribeEventsMessage
 @see AWSrdsEventsMessage
 */
- (AWSTask<AWSrdsEventsMessage *> *)describeEvents:(AWSrdsDescribeEventsMessage *)request;

/**
 <p>Returns events related to DB instances, DB security groups, DB snapshots, and DB parameter groups for the past 14 days. Events specific to a particular DB instance, DB security group, database snapshot, or DB parameter group can be obtained by providing the name as a parameter. By default, the past hour of events are returned.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSrdsDescribeEventsMessage
 @see AWSrdsEventsMessage
 */
- (void)describeEvents:(AWSrdsDescribeEventsMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsEventsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a snapshot export to Amazon S3. This API operation supports pagination. </p>
 
 @param request A container for the necessary parameters to execute the DescribeExportTasks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsExportTasksMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorExportTaskNotFound`.
 
 @see AWSrdsDescribeExportTasksMessage
 @see AWSrdsExportTasksMessage
 */
- (AWSTask<AWSrdsExportTasksMessage *> *)describeExportTasks:(AWSrdsDescribeExportTasksMessage *)request;

/**
 <p>Returns information about a snapshot export to Amazon S3. This API operation supports pagination. </p>
 
 @param request A container for the necessary parameters to execute the DescribeExportTasks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorExportTaskNotFound`.
 
 @see AWSrdsDescribeExportTasksMessage
 @see AWSrdsExportTasksMessage
 */
- (void)describeExportTasks:(AWSrdsDescribeExportTasksMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsExportTasksMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns information about Aurora global database clusters. This API supports pagination. </p><p> For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeGlobalClusters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsGlobalClustersMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorGlobalClusterNotFound`.
 
 @see AWSrdsDescribeGlobalClustersMessage
 @see AWSrdsGlobalClustersMessage
 */
- (AWSTask<AWSrdsGlobalClustersMessage *> *)describeGlobalClusters:(AWSrdsDescribeGlobalClustersMessage *)request;

/**
 <p> Returns information about Aurora global database clusters. This API supports pagination. </p><p> For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeGlobalClusters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorGlobalClusterNotFound`.
 
 @see AWSrdsDescribeGlobalClustersMessage
 @see AWSrdsGlobalClustersMessage
 */
- (void)describeGlobalClusters:(AWSrdsDescribeGlobalClustersMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsGlobalClustersMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the available installation media for a DB engine that requires an on-premises customer provided license, such as Microsoft SQL Server.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstallationMedia service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsInstallationMediaMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInstallationMediaNotFound`.
 
 @see AWSrdsDescribeInstallationMediaMessage
 @see AWSrdsInstallationMediaMessage
 */
- (AWSTask<AWSrdsInstallationMediaMessage *> *)describeInstallationMedia:(AWSrdsDescribeInstallationMediaMessage *)request;

/**
 <p>Describes the available installation media for a DB engine that requires an on-premises customer provided license, such as Microsoft SQL Server.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstallationMedia service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInstallationMediaNotFound`.
 
 @see AWSrdsDescribeInstallationMediaMessage
 @see AWSrdsInstallationMediaMessage
 */
- (void)describeInstallationMedia:(AWSrdsDescribeInstallationMediaMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsInstallationMediaMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes all available options.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOptionGroupOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsOptionGroupOptionsMessage`.
 
 @see AWSrdsDescribeOptionGroupOptionsMessage
 @see AWSrdsOptionGroupOptionsMessage
 */
- (AWSTask<AWSrdsOptionGroupOptionsMessage *> *)describeOptionGroupOptions:(AWSrdsDescribeOptionGroupOptionsMessage *)request;

/**
 <p>Describes all available options.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOptionGroupOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSrdsDescribeOptionGroupOptionsMessage
 @see AWSrdsOptionGroupOptionsMessage
 */
- (void)describeOptionGroupOptions:(AWSrdsDescribeOptionGroupOptionsMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsOptionGroupOptionsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the available option groups.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOptionGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsOptionGroups`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorOptionGroupNotFound`.
 
 @see AWSrdsDescribeOptionGroupsMessage
 @see AWSrdsOptionGroups
 */
- (AWSTask<AWSrdsOptionGroups *> *)describeOptionGroups:(AWSrdsDescribeOptionGroupsMessage *)request;

/**
 <p>Describes the available option groups.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOptionGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorOptionGroupNotFound`.
 
 @see AWSrdsDescribeOptionGroupsMessage
 @see AWSrdsOptionGroups
 */
- (void)describeOptionGroups:(AWSrdsDescribeOptionGroupsMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsOptionGroups * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of orderable DB instance options for the specified engine.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOrderableDBInstanceOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsOrderableDBInstanceOptionsMessage`.
 
 @see AWSrdsDescribeOrderableDBInstanceOptionsMessage
 @see AWSrdsOrderableDBInstanceOptionsMessage
 */
- (AWSTask<AWSrdsOrderableDBInstanceOptionsMessage *> *)describeOrderableDBInstanceOptions:(AWSrdsDescribeOrderableDBInstanceOptionsMessage *)request;

/**
 <p>Returns a list of orderable DB instance options for the specified engine.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOrderableDBInstanceOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSrdsDescribeOrderableDBInstanceOptionsMessage
 @see AWSrdsOrderableDBInstanceOptionsMessage
 */
- (void)describeOrderableDBInstanceOptions:(AWSrdsDescribeOrderableDBInstanceOptionsMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsOrderableDBInstanceOptionsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of resources (for example, DB instances) that have at least one pending maintenance action.</p>
 
 @param request A container for the necessary parameters to execute the DescribePendingMaintenanceActions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsPendingMaintenanceActionsMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorResourceNotFound`.
 
 @see AWSrdsDescribePendingMaintenanceActionsMessage
 @see AWSrdsPendingMaintenanceActionsMessage
 */
- (AWSTask<AWSrdsPendingMaintenanceActionsMessage *> *)describePendingMaintenanceActions:(AWSrdsDescribePendingMaintenanceActionsMessage *)request;

/**
 <p>Returns a list of resources (for example, DB instances) that have at least one pending maintenance action.</p>
 
 @param request A container for the necessary parameters to execute the DescribePendingMaintenanceActions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorResourceNotFound`.
 
 @see AWSrdsDescribePendingMaintenanceActionsMessage
 @see AWSrdsPendingMaintenanceActionsMessage
 */
- (void)describePendingMaintenanceActions:(AWSrdsDescribePendingMaintenanceActionsMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsPendingMaintenanceActionsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about reserved DB instances for this account, or about a specified reserved DB instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedDBInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsReservedDBInstanceMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorReservedDBInstanceNotFound`.
 
 @see AWSrdsDescribeReservedDBInstancesMessage
 @see AWSrdsReservedDBInstanceMessage
 */
- (AWSTask<AWSrdsReservedDBInstanceMessage *> *)describeReservedDBInstances:(AWSrdsDescribeReservedDBInstancesMessage *)request;

/**
 <p>Returns information about reserved DB instances for this account, or about a specified reserved DB instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedDBInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorReservedDBInstanceNotFound`.
 
 @see AWSrdsDescribeReservedDBInstancesMessage
 @see AWSrdsReservedDBInstanceMessage
 */
- (void)describeReservedDBInstances:(AWSrdsDescribeReservedDBInstancesMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsReservedDBInstanceMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists available reserved DB instance offerings.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedDBInstancesOfferings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsReservedDBInstancesOfferingMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorReservedDBInstancesOfferingNotFound`.
 
 @see AWSrdsDescribeReservedDBInstancesOfferingsMessage
 @see AWSrdsReservedDBInstancesOfferingMessage
 */
- (AWSTask<AWSrdsReservedDBInstancesOfferingMessage *> *)describeReservedDBInstancesOfferings:(AWSrdsDescribeReservedDBInstancesOfferingsMessage *)request;

/**
 <p>Lists available reserved DB instance offerings.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedDBInstancesOfferings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorReservedDBInstancesOfferingNotFound`.
 
 @see AWSrdsDescribeReservedDBInstancesOfferingsMessage
 @see AWSrdsReservedDBInstancesOfferingMessage
 */
- (void)describeReservedDBInstancesOfferings:(AWSrdsDescribeReservedDBInstancesOfferingsMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsReservedDBInstancesOfferingMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the source AWS Regions where the current AWS Region can create a read replica or copy a DB snapshot from. This API action supports pagination.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSourceRegions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsSourceRegionMessage`.
 
 @see AWSrdsDescribeSourceRegionsMessage
 @see AWSrdsSourceRegionMessage
 */
- (AWSTask<AWSrdsSourceRegionMessage *> *)describeSourceRegions:(AWSrdsDescribeSourceRegionsMessage *)request;

/**
 <p>Returns a list of the source AWS Regions where the current AWS Region can create a read replica or copy a DB snapshot from. This API action supports pagination.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSourceRegions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSrdsDescribeSourceRegionsMessage
 @see AWSrdsSourceRegionMessage
 */
- (void)describeSourceRegions:(AWSrdsDescribeSourceRegionsMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsSourceRegionMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>You can call <code>DescribeValidDBInstanceModifications</code> to learn what modifications you can make to your DB instance. You can use this information when you call <code>ModifyDBInstance</code>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeValidDBInstanceModifications service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDescribeValidDBInstanceModificationsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorInvalidDBInstanceState`.
 
 @see AWSrdsDescribeValidDBInstanceModificationsMessage
 @see AWSrdsDescribeValidDBInstanceModificationsResult
 */
- (AWSTask<AWSrdsDescribeValidDBInstanceModificationsResult *> *)describeValidDBInstanceModifications:(AWSrdsDescribeValidDBInstanceModificationsMessage *)request;

/**
 <p>You can call <code>DescribeValidDBInstanceModifications</code> to learn what modifications you can make to your DB instance. You can use this information when you call <code>ModifyDBInstance</code>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeValidDBInstanceModifications service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorInvalidDBInstanceState`.
 
 @see AWSrdsDescribeValidDBInstanceModificationsMessage
 @see AWSrdsDescribeValidDBInstanceModificationsResult
 */
- (void)describeValidDBInstanceModifications:(AWSrdsDescribeValidDBInstanceModificationsMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDescribeValidDBInstanceModificationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Downloads all or a portion of the specified log file, up to 1 MB in size.</p>
 
 @param request A container for the necessary parameters to execute the DownloadDBLogFilePortion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDownloadDBLogFilePortionDetails`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorDBLogFileNotFound`.
 
 @see AWSrdsDownloadDBLogFilePortionMessage
 @see AWSrdsDownloadDBLogFilePortionDetails
 */
- (AWSTask<AWSrdsDownloadDBLogFilePortionDetails *> *)downloadDBLogFilePortion:(AWSrdsDownloadDBLogFilePortionMessage *)request;

/**
 <p>Downloads all or a portion of the specified log file, up to 1 MB in size.</p>
 
 @param request A container for the necessary parameters to execute the DownloadDBLogFilePortion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorDBLogFileNotFound`.
 
 @see AWSrdsDownloadDBLogFilePortionMessage
 @see AWSrdsDownloadDBLogFilePortionDetails
 */
- (void)downloadDBLogFilePortion:(AWSrdsDownloadDBLogFilePortionMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDownloadDBLogFilePortionDetails * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Forces a failover for a DB cluster.</p><p>A failover for a DB cluster promotes one of the Aurora Replicas (read-only instances) in the DB cluster to be the primary instance (the cluster writer).</p><p>Amazon Aurora will automatically fail over to an Aurora Replica, if one exists, when the primary instance fails. You can force a failover when you want to simulate a failure of a primary instance for testing. Because each instance in a DB cluster has its own endpoint address, you will need to clean up and re-establish any existing connections that use those endpoint addresses when the failover is complete.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the FailoverDBCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsFailoverDBClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidDBInstanceState`.
 
 @see AWSrdsFailoverDBClusterMessage
 @see AWSrdsFailoverDBClusterResult
 */
- (AWSTask<AWSrdsFailoverDBClusterResult *> *)failoverDBCluster:(AWSrdsFailoverDBClusterMessage *)request;

/**
 <p>Forces a failover for a DB cluster.</p><p>A failover for a DB cluster promotes one of the Aurora Replicas (read-only instances) in the DB cluster to be the primary instance (the cluster writer).</p><p>Amazon Aurora will automatically fail over to an Aurora Replica, if one exists, when the primary instance fails. You can force a failover when you want to simulate a failure of a primary instance for testing. Because each instance in a DB cluster has its own endpoint address, you will need to clean up and re-establish any existing connections that use those endpoint addresses when the failover is complete.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the FailoverDBCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidDBInstanceState`.
 
 @see AWSrdsFailoverDBClusterMessage
 @see AWSrdsFailoverDBClusterResult
 */
- (void)failoverDBCluster:(AWSrdsFailoverDBClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsFailoverDBClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Imports the installation media for a DB engine that requires an on-premises customer provided license, such as SQL Server.</p>
 
 @param request A container for the necessary parameters to execute the ImportInstallationMedia service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsInstallationMedia`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorCustomAvailabilityZoneNotFound`, `AWSrdsErrorInstallationMediaAlreadyExists`.
 
 @see AWSrdsImportInstallationMediaMessage
 @see AWSrdsInstallationMedia
 */
- (AWSTask<AWSrdsInstallationMedia *> *)importInstallationMedia:(AWSrdsImportInstallationMediaMessage *)request;

/**
 <p>Imports the installation media for a DB engine that requires an on-premises customer provided license, such as SQL Server.</p>
 
 @param request A container for the necessary parameters to execute the ImportInstallationMedia service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorCustomAvailabilityZoneNotFound`, `AWSrdsErrorInstallationMediaAlreadyExists`.
 
 @see AWSrdsImportInstallationMediaMessage
 @see AWSrdsInstallationMedia
 */
- (void)importInstallationMedia:(AWSrdsImportInstallationMediaMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsInstallationMedia * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all tags on an Amazon RDS resource.</p><p>For an overview on tagging an Amazon RDS resource, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Tagging.html">Tagging Amazon RDS Resources</a> in the <i>Amazon RDS User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsTagListMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorDBSnapshotNotFound`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorDBProxyNotFound`, `AWSrdsErrorDBProxyTargetGroupNotFound`.
 
 @see AWSrdsListTagsForResourceMessage
 @see AWSrdsTagListMessage
 */
- (AWSTask<AWSrdsTagListMessage *> *)listTagsForResource:(AWSrdsListTagsForResourceMessage *)request;

/**
 <p>Lists all tags on an Amazon RDS resource.</p><p>For an overview on tagging an Amazon RDS resource, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Tagging.html">Tagging Amazon RDS Resources</a> in the <i>Amazon RDS User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorDBSnapshotNotFound`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorDBProxyNotFound`, `AWSrdsErrorDBProxyTargetGroupNotFound`.
 
 @see AWSrdsListTagsForResourceMessage
 @see AWSrdsTagListMessage
 */
- (void)listTagsForResource:(AWSrdsListTagsForResourceMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsTagListMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Override the system-default Secure Sockets Layer/Transport Layer Security (SSL/TLS) certificate for Amazon RDS for new DB instances temporarily, or remove the override.</p><p>By using this operation, you can specify an RDS-approved SSL/TLS certificate for new DB instances that is different from the default certificate provided by RDS. You can also use this operation to remove the override, so that new DB instances use the default certificate provided by RDS.</p><p>You might need to override the default certificate in the following situations:</p><ul><li><p>You already migrated your applications to support the latest certificate authority (CA) certificate, but the new CA certificate is not yet the RDS default CA certificate for the specified AWS Region.</p></li><li><p>RDS has already moved to a new default CA certificate for the specified AWS Region, but you are still in the process of supporting the new CA certificate. In this case, you temporarily need additional time to finish your application changes.</p></li></ul><p>For more information about rotating your SSL/TLS certificate for RDS DB engines, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.SSL-certificate-rotation.html"> Rotating Your SSL/TLS Certificate</a> in the <i>Amazon RDS User Guide</i>.</p><p>For more information about rotating your SSL/TLS certificate for Aurora DB engines, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.SSL-certificate-rotation.html"> Rotating Your SSL/TLS Certificate</a> in the <i>Amazon Aurora User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyCertificates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsModifyCertificatesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorCertificateNotFound`.
 
 @see AWSrdsModifyCertificatesMessage
 @see AWSrdsModifyCertificatesResult
 */
- (AWSTask<AWSrdsModifyCertificatesResult *> *)modifyCertificates:(AWSrdsModifyCertificatesMessage *)request;

/**
 <p>Override the system-default Secure Sockets Layer/Transport Layer Security (SSL/TLS) certificate for Amazon RDS for new DB instances temporarily, or remove the override.</p><p>By using this operation, you can specify an RDS-approved SSL/TLS certificate for new DB instances that is different from the default certificate provided by RDS. You can also use this operation to remove the override, so that new DB instances use the default certificate provided by RDS.</p><p>You might need to override the default certificate in the following situations:</p><ul><li><p>You already migrated your applications to support the latest certificate authority (CA) certificate, but the new CA certificate is not yet the RDS default CA certificate for the specified AWS Region.</p></li><li><p>RDS has already moved to a new default CA certificate for the specified AWS Region, but you are still in the process of supporting the new CA certificate. In this case, you temporarily need additional time to finish your application changes.</p></li></ul><p>For more information about rotating your SSL/TLS certificate for RDS DB engines, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.SSL-certificate-rotation.html"> Rotating Your SSL/TLS Certificate</a> in the <i>Amazon RDS User Guide</i>.</p><p>For more information about rotating your SSL/TLS certificate for Aurora DB engines, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.SSL-certificate-rotation.html"> Rotating Your SSL/TLS Certificate</a> in the <i>Amazon Aurora User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyCertificates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorCertificateNotFound`.
 
 @see AWSrdsModifyCertificatesMessage
 @see AWSrdsModifyCertificatesResult
 */
- (void)modifyCertificates:(AWSrdsModifyCertificatesMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsModifyCertificatesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Set the capacity of an Aurora Serverless DB cluster to a specific value.</p><p>Aurora Serverless scales seamlessly based on the workload on the DB cluster. In some cases, the capacity might not scale fast enough to meet a sudden change in workload, such as a large number of new transactions. Call <code>ModifyCurrentDBClusterCapacity</code> to set the capacity explicitly.</p><p>After this call sets the DB cluster capacity, Aurora Serverless can automatically scale the DB cluster based on the cooldown period for scaling up and the cooldown period for scaling down.</p><p>For more information about Aurora Serverless, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.html">Using Amazon Aurora Serverless</a> in the <i>Amazon Aurora User Guide</i>.</p><important><p>If you call <code>ModifyCurrentDBClusterCapacity</code> with the default <code>TimeoutAction</code>, connections that prevent Aurora Serverless from finding a scaling point might be dropped. For more information about scaling points, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.how-it-works.html#aurora-serverless.how-it-works.auto-scaling"> Autoscaling for Aurora Serverless</a> in the <i>Amazon Aurora User Guide</i>.</p></important><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyCurrentDBClusterCapacity service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDBClusterCapacityInfo`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidDBClusterCapacity`.
 
 @see AWSrdsModifyCurrentDBClusterCapacityMessage
 @see AWSrdsDBClusterCapacityInfo
 */
- (AWSTask<AWSrdsDBClusterCapacityInfo *> *)modifyCurrentDBClusterCapacity:(AWSrdsModifyCurrentDBClusterCapacityMessage *)request;

/**
 <p>Set the capacity of an Aurora Serverless DB cluster to a specific value.</p><p>Aurora Serverless scales seamlessly based on the workload on the DB cluster. In some cases, the capacity might not scale fast enough to meet a sudden change in workload, such as a large number of new transactions. Call <code>ModifyCurrentDBClusterCapacity</code> to set the capacity explicitly.</p><p>After this call sets the DB cluster capacity, Aurora Serverless can automatically scale the DB cluster based on the cooldown period for scaling up and the cooldown period for scaling down.</p><p>For more information about Aurora Serverless, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.html">Using Amazon Aurora Serverless</a> in the <i>Amazon Aurora User Guide</i>.</p><important><p>If you call <code>ModifyCurrentDBClusterCapacity</code> with the default <code>TimeoutAction</code>, connections that prevent Aurora Serverless from finding a scaling point might be dropped. For more information about scaling points, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.how-it-works.html#aurora-serverless.how-it-works.auto-scaling"> Autoscaling for Aurora Serverless</a> in the <i>Amazon Aurora User Guide</i>.</p></important><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyCurrentDBClusterCapacity service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidDBClusterCapacity`.
 
 @see AWSrdsModifyCurrentDBClusterCapacityMessage
 @see AWSrdsDBClusterCapacityInfo
 */
- (void)modifyCurrentDBClusterCapacity:(AWSrdsModifyCurrentDBClusterCapacityMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDBClusterCapacityInfo * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modify a setting for an Amazon Aurora DB cluster. You can change one or more database configuration parameters by specifying these parameters and the new values in the request. For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyDBCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsModifyDBClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorStorageQuotaExceeded`, `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorInvalidVPCNetworkState`, `AWSrdsErrorInvalidDBSubnetGroupState`, `AWSrdsErrorInvalidSubnet`, `AWSrdsErrorDBClusterParameterGroupNotFound`, `AWSrdsErrorInvalidDBSecurityGroupState`, `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorDBClusterAlreadyExists`, `AWSrdsErrorDomainNotFound`.
 
 @see AWSrdsModifyDBClusterMessage
 @see AWSrdsModifyDBClusterResult
 */
- (AWSTask<AWSrdsModifyDBClusterResult *> *)modifyDBCluster:(AWSrdsModifyDBClusterMessage *)request;

/**
 <p>Modify a setting for an Amazon Aurora DB cluster. You can change one or more database configuration parameters by specifying these parameters and the new values in the request. For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyDBCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorStorageQuotaExceeded`, `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorInvalidVPCNetworkState`, `AWSrdsErrorInvalidDBSubnetGroupState`, `AWSrdsErrorInvalidSubnet`, `AWSrdsErrorDBClusterParameterGroupNotFound`, `AWSrdsErrorInvalidDBSecurityGroupState`, `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorDBClusterAlreadyExists`, `AWSrdsErrorDomainNotFound`.
 
 @see AWSrdsModifyDBClusterMessage
 @see AWSrdsModifyDBClusterResult
 */
- (void)modifyDBCluster:(AWSrdsModifyDBClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsModifyDBClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the properties of an endpoint in an Amazon Aurora DB cluster.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyDBClusterEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDBClusterEndpoint`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidDBClusterEndpointState`, `AWSrdsErrorDBClusterEndpointNotFound`, `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorInvalidDBInstanceState`.
 
 @see AWSrdsModifyDBClusterEndpointMessage
 @see AWSrdsDBClusterEndpoint
 */
- (AWSTask<AWSrdsDBClusterEndpoint *> *)modifyDBClusterEndpoint:(AWSrdsModifyDBClusterEndpointMessage *)request;

/**
 <p>Modifies the properties of an endpoint in an Amazon Aurora DB cluster.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyDBClusterEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidDBClusterEndpointState`, `AWSrdsErrorDBClusterEndpointNotFound`, `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorInvalidDBInstanceState`.
 
 @see AWSrdsModifyDBClusterEndpointMessage
 @see AWSrdsDBClusterEndpoint
 */
- (void)modifyDBClusterEndpoint:(AWSrdsModifyDBClusterEndpointMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDBClusterEndpoint * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Modifies the parameters of a DB cluster parameter group. To modify more than one parameter, submit a list of the following: <code>ParameterName</code>, <code>ParameterValue</code>, and <code>ApplyMethod</code>. A maximum of 20 parameters can be modified in a single request. </p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>Changes to dynamic parameters are applied immediately. Changes to static parameters require a reboot without failover to the DB cluster associated with the parameter group before the change can take effect.</p></note><important><p>After you create a DB cluster parameter group, you should wait at least 5 minutes before creating your first DB cluster that uses that DB cluster parameter group as the default parameter group. This allows Amazon RDS to fully complete the create action before the parameter group is used as the default for a new DB cluster. This is especially important for parameters that are critical when creating the default database for a DB cluster, such as the character set for the default database defined by the <code>character_set_database</code> parameter. You can use the <i>Parameter Groups</i> option of the <a href="https://console.aws.amazon.com/rds/">Amazon RDS console</a> or the <code>DescribeDBClusterParameters</code> action to verify that your DB cluster parameter group has been created or modified.</p><p>If the modified DB cluster parameter group is used by an Aurora Serverless cluster, Aurora applies the update immediately. The cluster restart might interrupt your workload. In that case, your application must reopen any connections and retry any transactions that were active when the parameter changes took effect.</p></important><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyDBClusterParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDBClusterParameterGroupNameMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBParameterGroupNotFound`, `AWSrdsErrorInvalidDBParameterGroupState`.
 
 @see AWSrdsModifyDBClusterParameterGroupMessage
 @see AWSrdsDBClusterParameterGroupNameMessage
 */
- (AWSTask<AWSrdsDBClusterParameterGroupNameMessage *> *)modifyDBClusterParameterGroup:(AWSrdsModifyDBClusterParameterGroupMessage *)request;

/**
 <p> Modifies the parameters of a DB cluster parameter group. To modify more than one parameter, submit a list of the following: <code>ParameterName</code>, <code>ParameterValue</code>, and <code>ApplyMethod</code>. A maximum of 20 parameters can be modified in a single request. </p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>Changes to dynamic parameters are applied immediately. Changes to static parameters require a reboot without failover to the DB cluster associated with the parameter group before the change can take effect.</p></note><important><p>After you create a DB cluster parameter group, you should wait at least 5 minutes before creating your first DB cluster that uses that DB cluster parameter group as the default parameter group. This allows Amazon RDS to fully complete the create action before the parameter group is used as the default for a new DB cluster. This is especially important for parameters that are critical when creating the default database for a DB cluster, such as the character set for the default database defined by the <code>character_set_database</code> parameter. You can use the <i>Parameter Groups</i> option of the <a href="https://console.aws.amazon.com/rds/">Amazon RDS console</a> or the <code>DescribeDBClusterParameters</code> action to verify that your DB cluster parameter group has been created or modified.</p><p>If the modified DB cluster parameter group is used by an Aurora Serverless cluster, Aurora applies the update immediately. The cluster restart might interrupt your workload. In that case, your application must reopen any connections and retry any transactions that were active when the parameter changes took effect.</p></important><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyDBClusterParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBParameterGroupNotFound`, `AWSrdsErrorInvalidDBParameterGroupState`.
 
 @see AWSrdsModifyDBClusterParameterGroupMessage
 @see AWSrdsDBClusterParameterGroupNameMessage
 */
- (void)modifyDBClusterParameterGroup:(AWSrdsModifyDBClusterParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDBClusterParameterGroupNameMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds an attribute and values to, or removes an attribute and values from, a manual DB cluster snapshot.</p><p>To share a manual DB cluster snapshot with other AWS accounts, specify <code>restore</code> as the <code>AttributeName</code> and use the <code>ValuesToAdd</code> parameter to add a list of IDs of the AWS accounts that are authorized to restore the manual DB cluster snapshot. Use the value <code>all</code> to make the manual DB cluster snapshot public, which means that it can be copied or restored by all AWS accounts. Do not add the <code>all</code> value for any manual DB cluster snapshots that contain private information that you don't want available to all AWS accounts. If a manual DB cluster snapshot is encrypted, it can be shared, but only by specifying a list of authorized AWS account IDs for the <code>ValuesToAdd</code> parameter. You can't use <code>all</code> as a value for that parameter in this case.</p><p>To view which AWS accounts have access to copy or restore a manual DB cluster snapshot, or whether a manual DB cluster snapshot public or private, use the <code>DescribeDBClusterSnapshotAttributes</code> API action.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyDBClusterSnapshotAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsModifyDBClusterSnapshotAttributeResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterSnapshotNotFound`, `AWSrdsErrorInvalidDBClusterSnapshotState`, `AWSrdsErrorSharedSnapshotQuotaExceeded`.
 
 @see AWSrdsModifyDBClusterSnapshotAttributeMessage
 @see AWSrdsModifyDBClusterSnapshotAttributeResult
 */
- (AWSTask<AWSrdsModifyDBClusterSnapshotAttributeResult *> *)modifyDBClusterSnapshotAttribute:(AWSrdsModifyDBClusterSnapshotAttributeMessage *)request;

/**
 <p>Adds an attribute and values to, or removes an attribute and values from, a manual DB cluster snapshot.</p><p>To share a manual DB cluster snapshot with other AWS accounts, specify <code>restore</code> as the <code>AttributeName</code> and use the <code>ValuesToAdd</code> parameter to add a list of IDs of the AWS accounts that are authorized to restore the manual DB cluster snapshot. Use the value <code>all</code> to make the manual DB cluster snapshot public, which means that it can be copied or restored by all AWS accounts. Do not add the <code>all</code> value for any manual DB cluster snapshots that contain private information that you don't want available to all AWS accounts. If a manual DB cluster snapshot is encrypted, it can be shared, but only by specifying a list of authorized AWS account IDs for the <code>ValuesToAdd</code> parameter. You can't use <code>all</code> as a value for that parameter in this case.</p><p>To view which AWS accounts have access to copy or restore a manual DB cluster snapshot, or whether a manual DB cluster snapshot public or private, use the <code>DescribeDBClusterSnapshotAttributes</code> API action.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyDBClusterSnapshotAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterSnapshotNotFound`, `AWSrdsErrorInvalidDBClusterSnapshotState`, `AWSrdsErrorSharedSnapshotQuotaExceeded`.
 
 @see AWSrdsModifyDBClusterSnapshotAttributeMessage
 @see AWSrdsModifyDBClusterSnapshotAttributeResult
 */
- (void)modifyDBClusterSnapshotAttribute:(AWSrdsModifyDBClusterSnapshotAttributeMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsModifyDBClusterSnapshotAttributeResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies settings for a DB instance. You can change one or more database configuration parameters by specifying these parameters and the new values in the request. To learn what modifications you can make to your DB instance, call <code>DescribeValidDBInstanceModifications</code> before you call <code>ModifyDBInstance</code>. </p>
 
 @param request A container for the necessary parameters to execute the ModifyDBInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsModifyDBInstanceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorInvalidDBSecurityGroupState`, `AWSrdsErrorDBInstanceAlreadyExists`, `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorDBSecurityGroupNotFound`, `AWSrdsErrorDBParameterGroupNotFound`, `AWSrdsErrorInsufficientDBInstanceCapacity`, `AWSrdsErrorStorageQuotaExceeded`, `AWSrdsErrorInvalidVPCNetworkState`, `AWSrdsErrorProvisionedIopsNotAvailableInAZ`, `AWSrdsErrorOptionGroupNotFound`, `AWSrdsErrorDBUpgradeDependencyFailure`, `AWSrdsErrorStorageTypeNotSupported`, `AWSrdsErrorAuthorizationNotFound`, `AWSrdsErrorCertificateNotFound`, `AWSrdsErrorDomainNotFound`, `AWSrdsErrorBackupPolicyNotFound`.
 
 @see AWSrdsModifyDBInstanceMessage
 @see AWSrdsModifyDBInstanceResult
 */
- (AWSTask<AWSrdsModifyDBInstanceResult *> *)modifyDBInstance:(AWSrdsModifyDBInstanceMessage *)request;

/**
 <p>Modifies settings for a DB instance. You can change one or more database configuration parameters by specifying these parameters and the new values in the request. To learn what modifications you can make to your DB instance, call <code>DescribeValidDBInstanceModifications</code> before you call <code>ModifyDBInstance</code>. </p>
 
 @param request A container for the necessary parameters to execute the ModifyDBInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorInvalidDBSecurityGroupState`, `AWSrdsErrorDBInstanceAlreadyExists`, `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorDBSecurityGroupNotFound`, `AWSrdsErrorDBParameterGroupNotFound`, `AWSrdsErrorInsufficientDBInstanceCapacity`, `AWSrdsErrorStorageQuotaExceeded`, `AWSrdsErrorInvalidVPCNetworkState`, `AWSrdsErrorProvisionedIopsNotAvailableInAZ`, `AWSrdsErrorOptionGroupNotFound`, `AWSrdsErrorDBUpgradeDependencyFailure`, `AWSrdsErrorStorageTypeNotSupported`, `AWSrdsErrorAuthorizationNotFound`, `AWSrdsErrorCertificateNotFound`, `AWSrdsErrorDomainNotFound`, `AWSrdsErrorBackupPolicyNotFound`.
 
 @see AWSrdsModifyDBInstanceMessage
 @see AWSrdsModifyDBInstanceResult
 */
- (void)modifyDBInstance:(AWSrdsModifyDBInstanceMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsModifyDBInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Modifies the parameters of a DB parameter group. To modify more than one parameter, submit a list of the following: <code>ParameterName</code>, <code>ParameterValue</code>, and <code>ApplyMethod</code>. A maximum of 20 parameters can be modified in a single request. </p><note><p>Changes to dynamic parameters are applied immediately. Changes to static parameters require a reboot without failover to the DB instance associated with the parameter group before the change can take effect.</p></note><important><p>After you modify a DB parameter group, you should wait at least 5 minutes before creating your first DB instance that uses that DB parameter group as the default parameter group. This allows Amazon RDS to fully complete the modify action before the parameter group is used as the default for a new DB instance. This is especially important for parameters that are critical when creating the default database for a DB instance, such as the character set for the default database defined by the <code>character_set_database</code> parameter. You can use the <i>Parameter Groups</i> option of the <a href="https://console.aws.amazon.com/rds/">Amazon RDS console</a> or the <i>DescribeDBParameters</i> command to verify that your DB parameter group has been created or modified.</p></important>
 
 @param request A container for the necessary parameters to execute the ModifyDBParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDBParameterGroupNameMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBParameterGroupNotFound`, `AWSrdsErrorInvalidDBParameterGroupState`.
 
 @see AWSrdsModifyDBParameterGroupMessage
 @see AWSrdsDBParameterGroupNameMessage
 */
- (AWSTask<AWSrdsDBParameterGroupNameMessage *> *)modifyDBParameterGroup:(AWSrdsModifyDBParameterGroupMessage *)request;

/**
 <p> Modifies the parameters of a DB parameter group. To modify more than one parameter, submit a list of the following: <code>ParameterName</code>, <code>ParameterValue</code>, and <code>ApplyMethod</code>. A maximum of 20 parameters can be modified in a single request. </p><note><p>Changes to dynamic parameters are applied immediately. Changes to static parameters require a reboot without failover to the DB instance associated with the parameter group before the change can take effect.</p></note><important><p>After you modify a DB parameter group, you should wait at least 5 minutes before creating your first DB instance that uses that DB parameter group as the default parameter group. This allows Amazon RDS to fully complete the modify action before the parameter group is used as the default for a new DB instance. This is especially important for parameters that are critical when creating the default database for a DB instance, such as the character set for the default database defined by the <code>character_set_database</code> parameter. You can use the <i>Parameter Groups</i> option of the <a href="https://console.aws.amazon.com/rds/">Amazon RDS console</a> or the <i>DescribeDBParameters</i> command to verify that your DB parameter group has been created or modified.</p></important>
 
 @param request A container for the necessary parameters to execute the ModifyDBParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBParameterGroupNotFound`, `AWSrdsErrorInvalidDBParameterGroupState`.
 
 @see AWSrdsModifyDBParameterGroupMessage
 @see AWSrdsDBParameterGroupNameMessage
 */
- (void)modifyDBParameterGroup:(AWSrdsModifyDBParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDBParameterGroupNameMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Changes the settings for an existing DB proxy.</p>
 
 @param request A container for the necessary parameters to execute the ModifyDBProxy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsModifyDBProxyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBProxyNotFound`, `AWSrdsErrorDBProxyAlreadyExists`, `AWSrdsErrorInvalidDBProxyState`.
 
 @see AWSrdsModifyDBProxyRequest
 @see AWSrdsModifyDBProxyResponse
 */
- (AWSTask<AWSrdsModifyDBProxyResponse *> *)modifyDBProxy:(AWSrdsModifyDBProxyRequest *)request;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Changes the settings for an existing DB proxy.</p>
 
 @param request A container for the necessary parameters to execute the ModifyDBProxy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBProxyNotFound`, `AWSrdsErrorDBProxyAlreadyExists`, `AWSrdsErrorInvalidDBProxyState`.
 
 @see AWSrdsModifyDBProxyRequest
 @see AWSrdsModifyDBProxyResponse
 */
- (void)modifyDBProxy:(AWSrdsModifyDBProxyRequest *)request completionHandler:(void (^ _Nullable)(AWSrdsModifyDBProxyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Modifies the properties of a <code>DBProxyTargetGroup</code>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyDBProxyTargetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsModifyDBProxyTargetGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBProxyNotFound`, `AWSrdsErrorDBProxyTargetGroupNotFound`, `AWSrdsErrorInvalidDBProxyState`.
 
 @see AWSrdsModifyDBProxyTargetGroupRequest
 @see AWSrdsModifyDBProxyTargetGroupResponse
 */
- (AWSTask<AWSrdsModifyDBProxyTargetGroupResponse *> *)modifyDBProxyTargetGroup:(AWSrdsModifyDBProxyTargetGroupRequest *)request;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Modifies the properties of a <code>DBProxyTargetGroup</code>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyDBProxyTargetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBProxyNotFound`, `AWSrdsErrorDBProxyTargetGroupNotFound`, `AWSrdsErrorInvalidDBProxyState`.
 
 @see AWSrdsModifyDBProxyTargetGroupRequest
 @see AWSrdsModifyDBProxyTargetGroupResponse
 */
- (void)modifyDBProxyTargetGroup:(AWSrdsModifyDBProxyTargetGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSrdsModifyDBProxyTargetGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a manual DB snapshot with a new engine version. The snapshot can be encrypted or unencrypted, but not shared or public. </p><p>Amazon RDS supports upgrading DB snapshots for MySQL, Oracle, and PostgreSQL. </p>
 
 @param request A container for the necessary parameters to execute the ModifyDBSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsModifyDBSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSnapshotNotFound`.
 
 @see AWSrdsModifyDBSnapshotMessage
 @see AWSrdsModifyDBSnapshotResult
 */
- (AWSTask<AWSrdsModifyDBSnapshotResult *> *)modifyDBSnapshot:(AWSrdsModifyDBSnapshotMessage *)request;

/**
 <p>Updates a manual DB snapshot with a new engine version. The snapshot can be encrypted or unencrypted, but not shared or public. </p><p>Amazon RDS supports upgrading DB snapshots for MySQL, Oracle, and PostgreSQL. </p>
 
 @param request A container for the necessary parameters to execute the ModifyDBSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSnapshotNotFound`.
 
 @see AWSrdsModifyDBSnapshotMessage
 @see AWSrdsModifyDBSnapshotResult
 */
- (void)modifyDBSnapshot:(AWSrdsModifyDBSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsModifyDBSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds an attribute and values to, or removes an attribute and values from, a manual DB snapshot.</p><p>To share a manual DB snapshot with other AWS accounts, specify <code>restore</code> as the <code>AttributeName</code> and use the <code>ValuesToAdd</code> parameter to add a list of IDs of the AWS accounts that are authorized to restore the manual DB snapshot. Uses the value <code>all</code> to make the manual DB snapshot public, which means it can be copied or restored by all AWS accounts. Do not add the <code>all</code> value for any manual DB snapshots that contain private information that you don't want available to all AWS accounts. If the manual DB snapshot is encrypted, it can be shared, but only by specifying a list of authorized AWS account IDs for the <code>ValuesToAdd</code> parameter. You can't use <code>all</code> as a value for that parameter in this case.</p><p>To view which AWS accounts have access to copy or restore a manual DB snapshot, or whether a manual DB snapshot public or private, use the <code>DescribeDBSnapshotAttributes</code> API action.</p>
 
 @param request A container for the necessary parameters to execute the ModifyDBSnapshotAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsModifyDBSnapshotAttributeResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSnapshotNotFound`, `AWSrdsErrorInvalidDBSnapshotState`, `AWSrdsErrorSharedSnapshotQuotaExceeded`.
 
 @see AWSrdsModifyDBSnapshotAttributeMessage
 @see AWSrdsModifyDBSnapshotAttributeResult
 */
- (AWSTask<AWSrdsModifyDBSnapshotAttributeResult *> *)modifyDBSnapshotAttribute:(AWSrdsModifyDBSnapshotAttributeMessage *)request;

/**
 <p>Adds an attribute and values to, or removes an attribute and values from, a manual DB snapshot.</p><p>To share a manual DB snapshot with other AWS accounts, specify <code>restore</code> as the <code>AttributeName</code> and use the <code>ValuesToAdd</code> parameter to add a list of IDs of the AWS accounts that are authorized to restore the manual DB snapshot. Uses the value <code>all</code> to make the manual DB snapshot public, which means it can be copied or restored by all AWS accounts. Do not add the <code>all</code> value for any manual DB snapshots that contain private information that you don't want available to all AWS accounts. If the manual DB snapshot is encrypted, it can be shared, but only by specifying a list of authorized AWS account IDs for the <code>ValuesToAdd</code> parameter. You can't use <code>all</code> as a value for that parameter in this case.</p><p>To view which AWS accounts have access to copy or restore a manual DB snapshot, or whether a manual DB snapshot public or private, use the <code>DescribeDBSnapshotAttributes</code> API action.</p>
 
 @param request A container for the necessary parameters to execute the ModifyDBSnapshotAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSnapshotNotFound`, `AWSrdsErrorInvalidDBSnapshotState`, `AWSrdsErrorSharedSnapshotQuotaExceeded`.
 
 @see AWSrdsModifyDBSnapshotAttributeMessage
 @see AWSrdsModifyDBSnapshotAttributeResult
 */
- (void)modifyDBSnapshotAttribute:(AWSrdsModifyDBSnapshotAttributeMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsModifyDBSnapshotAttributeResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies an existing DB subnet group. DB subnet groups must contain at least one subnet in at least two AZs in the AWS Region.</p>
 
 @param request A container for the necessary parameters to execute the ModifyDBSubnetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsModifyDBSubnetGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorDBSubnetQuotaExceeded`, `AWSrdsErrorSubnetAlreadyInUse`, `AWSrdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSrdsErrorInvalidSubnet`.
 
 @see AWSrdsModifyDBSubnetGroupMessage
 @see AWSrdsModifyDBSubnetGroupResult
 */
- (AWSTask<AWSrdsModifyDBSubnetGroupResult *> *)modifyDBSubnetGroup:(AWSrdsModifyDBSubnetGroupMessage *)request;

/**
 <p>Modifies an existing DB subnet group. DB subnet groups must contain at least one subnet in at least two AZs in the AWS Region.</p>
 
 @param request A container for the necessary parameters to execute the ModifyDBSubnetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorDBSubnetQuotaExceeded`, `AWSrdsErrorSubnetAlreadyInUse`, `AWSrdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSrdsErrorInvalidSubnet`.
 
 @see AWSrdsModifyDBSubnetGroupMessage
 @see AWSrdsModifyDBSubnetGroupResult
 */
- (void)modifyDBSubnetGroup:(AWSrdsModifyDBSubnetGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsModifyDBSubnetGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies an existing RDS event notification subscription. You can't modify the source identifiers using this call. To change source identifiers for a subscription, use the <code>AddSourceIdentifierToSubscription</code> and <code>RemoveSourceIdentifierFromSubscription</code> calls.</p><p>You can see a list of the event categories for a given SourceType in the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html">Events</a> topic in the <i>Amazon RDS User Guide</i> or by using the <b>DescribeEventCategories</b> action.</p>
 
 @param request A container for the necessary parameters to execute the ModifyEventSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsModifyEventSubscriptionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorEventSubscriptionQuotaExceeded`, `AWSrdsErrorSubscriptionNotFound`, `AWSrdsErrorSNSInvalidTopic`, `AWSrdsErrorSNSNoAuthorization`, `AWSrdsErrorSNSTopicArnNotFound`, `AWSrdsErrorSubscriptionCategoryNotFound`.
 
 @see AWSrdsModifyEventSubscriptionMessage
 @see AWSrdsModifyEventSubscriptionResult
 */
- (AWSTask<AWSrdsModifyEventSubscriptionResult *> *)modifyEventSubscription:(AWSrdsModifyEventSubscriptionMessage *)request;

/**
 <p>Modifies an existing RDS event notification subscription. You can't modify the source identifiers using this call. To change source identifiers for a subscription, use the <code>AddSourceIdentifierToSubscription</code> and <code>RemoveSourceIdentifierFromSubscription</code> calls.</p><p>You can see a list of the event categories for a given SourceType in the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html">Events</a> topic in the <i>Amazon RDS User Guide</i> or by using the <b>DescribeEventCategories</b> action.</p>
 
 @param request A container for the necessary parameters to execute the ModifyEventSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorEventSubscriptionQuotaExceeded`, `AWSrdsErrorSubscriptionNotFound`, `AWSrdsErrorSNSInvalidTopic`, `AWSrdsErrorSNSNoAuthorization`, `AWSrdsErrorSNSTopicArnNotFound`, `AWSrdsErrorSubscriptionCategoryNotFound`.
 
 @see AWSrdsModifyEventSubscriptionMessage
 @see AWSrdsModifyEventSubscriptionResult
 */
- (void)modifyEventSubscription:(AWSrdsModifyEventSubscriptionMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsModifyEventSubscriptionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Modify a setting for an Amazon Aurora global cluster. You can change one or more database configuration parameters by specifying these parameters and the new values in the request. For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyGlobalCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsModifyGlobalClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorGlobalClusterNotFound`, `AWSrdsErrorInvalidGlobalClusterState`.
 
 @see AWSrdsModifyGlobalClusterMessage
 @see AWSrdsModifyGlobalClusterResult
 */
- (AWSTask<AWSrdsModifyGlobalClusterResult *> *)modifyGlobalCluster:(AWSrdsModifyGlobalClusterMessage *)request;

/**
 <p> Modify a setting for an Amazon Aurora global cluster. You can change one or more database configuration parameters by specifying these parameters and the new values in the request. For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyGlobalCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorGlobalClusterNotFound`, `AWSrdsErrorInvalidGlobalClusterState`.
 
 @see AWSrdsModifyGlobalClusterMessage
 @see AWSrdsModifyGlobalClusterResult
 */
- (void)modifyGlobalCluster:(AWSrdsModifyGlobalClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsModifyGlobalClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies an existing option group.</p>
 
 @param request A container for the necessary parameters to execute the ModifyOptionGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsModifyOptionGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidOptionGroupState`, `AWSrdsErrorOptionGroupNotFound`.
 
 @see AWSrdsModifyOptionGroupMessage
 @see AWSrdsModifyOptionGroupResult
 */
- (AWSTask<AWSrdsModifyOptionGroupResult *> *)modifyOptionGroup:(AWSrdsModifyOptionGroupMessage *)request;

/**
 <p>Modifies an existing option group.</p>
 
 @param request A container for the necessary parameters to execute the ModifyOptionGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidOptionGroupState`, `AWSrdsErrorOptionGroupNotFound`.
 
 @see AWSrdsModifyOptionGroupMessage
 @see AWSrdsModifyOptionGroupResult
 */
- (void)modifyOptionGroup:(AWSrdsModifyOptionGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsModifyOptionGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Promotes a read replica DB instance to a standalone DB instance.</p><note><ul><li><p>Backup duration is a function of the amount of changes to the database since the previous backup. If you plan to promote a read replica to a standalone instance, we recommend that you enable backups and complete at least one backup prior to promotion. In addition, a read replica cannot be promoted to a standalone instance when it is in the <code>backing-up</code> status. If you have enabled backups on your read replica, configure the automated backup window so that daily backups do not interfere with read replica promotion.</p></li><li><p>This command doesn't apply to Aurora MySQL and Aurora PostgreSQL.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the PromoteReadReplica service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsPromoteReadReplicaResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorDBInstanceNotFound`.
 
 @see AWSrdsPromoteReadReplicaMessage
 @see AWSrdsPromoteReadReplicaResult
 */
- (AWSTask<AWSrdsPromoteReadReplicaResult *> *)promoteReadReplica:(AWSrdsPromoteReadReplicaMessage *)request;

/**
 <p>Promotes a read replica DB instance to a standalone DB instance.</p><note><ul><li><p>Backup duration is a function of the amount of changes to the database since the previous backup. If you plan to promote a read replica to a standalone instance, we recommend that you enable backups and complete at least one backup prior to promotion. In addition, a read replica cannot be promoted to a standalone instance when it is in the <code>backing-up</code> status. If you have enabled backups on your read replica, configure the automated backup window so that daily backups do not interfere with read replica promotion.</p></li><li><p>This command doesn't apply to Aurora MySQL and Aurora PostgreSQL.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the PromoteReadReplica service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorDBInstanceNotFound`.
 
 @see AWSrdsPromoteReadReplicaMessage
 @see AWSrdsPromoteReadReplicaResult
 */
- (void)promoteReadReplica:(AWSrdsPromoteReadReplicaMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsPromoteReadReplicaResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Promotes a read replica DB cluster to a standalone DB cluster.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the PromoteReadReplicaDBCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsPromoteReadReplicaDBClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorInvalidDBClusterState`.
 
 @see AWSrdsPromoteReadReplicaDBClusterMessage
 @see AWSrdsPromoteReadReplicaDBClusterResult
 */
- (AWSTask<AWSrdsPromoteReadReplicaDBClusterResult *> *)promoteReadReplicaDBCluster:(AWSrdsPromoteReadReplicaDBClusterMessage *)request;

/**
 <p>Promotes a read replica DB cluster to a standalone DB cluster.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the PromoteReadReplicaDBCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorInvalidDBClusterState`.
 
 @see AWSrdsPromoteReadReplicaDBClusterMessage
 @see AWSrdsPromoteReadReplicaDBClusterResult
 */
- (void)promoteReadReplicaDBCluster:(AWSrdsPromoteReadReplicaDBClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsPromoteReadReplicaDBClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Purchases a reserved DB instance offering.</p>
 
 @param request A container for the necessary parameters to execute the PurchaseReservedDBInstancesOffering service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsPurchaseReservedDBInstancesOfferingResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorReservedDBInstancesOfferingNotFound`, `AWSrdsErrorReservedDBInstanceAlreadyExists`, `AWSrdsErrorReservedDBInstanceQuotaExceeded`.
 
 @see AWSrdsPurchaseReservedDBInstancesOfferingMessage
 @see AWSrdsPurchaseReservedDBInstancesOfferingResult
 */
- (AWSTask<AWSrdsPurchaseReservedDBInstancesOfferingResult *> *)purchaseReservedDBInstancesOffering:(AWSrdsPurchaseReservedDBInstancesOfferingMessage *)request;

/**
 <p>Purchases a reserved DB instance offering.</p>
 
 @param request A container for the necessary parameters to execute the PurchaseReservedDBInstancesOffering service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorReservedDBInstancesOfferingNotFound`, `AWSrdsErrorReservedDBInstanceAlreadyExists`, `AWSrdsErrorReservedDBInstanceQuotaExceeded`.
 
 @see AWSrdsPurchaseReservedDBInstancesOfferingMessage
 @see AWSrdsPurchaseReservedDBInstancesOfferingResult
 */
- (void)purchaseReservedDBInstancesOffering:(AWSrdsPurchaseReservedDBInstancesOfferingMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsPurchaseReservedDBInstancesOfferingResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>You might need to reboot your DB instance, usually for maintenance reasons. For example, if you make certain modifications, or if you change the DB parameter group associated with the DB instance, you must reboot the instance for the changes to take effect. </p><p>Rebooting a DB instance restarts the database engine service. Rebooting a DB instance results in a momentary outage, during which the DB instance status is set to rebooting. </p><p>For more information about rebooting, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_RebootInstance.html">Rebooting a DB Instance</a> in the <i>Amazon RDS User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the RebootDBInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsRebootDBInstanceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorDBInstanceNotFound`.
 
 @see AWSrdsRebootDBInstanceMessage
 @see AWSrdsRebootDBInstanceResult
 */
- (AWSTask<AWSrdsRebootDBInstanceResult *> *)rebootDBInstance:(AWSrdsRebootDBInstanceMessage *)request;

/**
 <p>You might need to reboot your DB instance, usually for maintenance reasons. For example, if you make certain modifications, or if you change the DB parameter group associated with the DB instance, you must reboot the instance for the changes to take effect. </p><p>Rebooting a DB instance restarts the database engine service. Rebooting a DB instance results in a momentary outage, during which the DB instance status is set to rebooting. </p><p>For more information about rebooting, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_RebootInstance.html">Rebooting a DB Instance</a> in the <i>Amazon RDS User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the RebootDBInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorDBInstanceNotFound`.
 
 @see AWSrdsRebootDBInstanceMessage
 @see AWSrdsRebootDBInstanceResult
 */
- (void)rebootDBInstance:(AWSrdsRebootDBInstanceMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsRebootDBInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Associate one or more <code>DBProxyTarget</code> data structures with a <code>DBProxyTargetGroup</code>.</p>
 
 @param request A container for the necessary parameters to execute the RegisterDBProxyTargets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsRegisterDBProxyTargetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBProxyNotFound`, `AWSrdsErrorDBProxyTargetGroupNotFound`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorDBProxyTargetAlreadyRegistered`, `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidDBProxyState`.
 
 @see AWSrdsRegisterDBProxyTargetsRequest
 @see AWSrdsRegisterDBProxyTargetsResponse
 */
- (AWSTask<AWSrdsRegisterDBProxyTargetsResponse *> *)registerDBProxyTargets:(AWSrdsRegisterDBProxyTargetsRequest *)request;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Associate one or more <code>DBProxyTarget</code> data structures with a <code>DBProxyTargetGroup</code>.</p>
 
 @param request A container for the necessary parameters to execute the RegisterDBProxyTargets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBProxyNotFound`, `AWSrdsErrorDBProxyTargetGroupNotFound`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorDBProxyTargetAlreadyRegistered`, `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidDBProxyState`.
 
 @see AWSrdsRegisterDBProxyTargetsRequest
 @see AWSrdsRegisterDBProxyTargetsResponse
 */
- (void)registerDBProxyTargets:(AWSrdsRegisterDBProxyTargetsRequest *)request completionHandler:(void (^ _Nullable)(AWSrdsRegisterDBProxyTargetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Detaches an Aurora secondary cluster from an Aurora global database cluster. The cluster becomes a standalone cluster with read-write capability instead of being read-only and receiving data from a primary cluster in a different region. </p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the RemoveFromGlobalCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsRemoveFromGlobalClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorGlobalClusterNotFound`, `AWSrdsErrorInvalidGlobalClusterState`, `AWSrdsErrorDBClusterNotFound`.
 
 @see AWSrdsRemoveFromGlobalClusterMessage
 @see AWSrdsRemoveFromGlobalClusterResult
 */
- (AWSTask<AWSrdsRemoveFromGlobalClusterResult *> *)removeFromGlobalCluster:(AWSrdsRemoveFromGlobalClusterMessage *)request;

/**
 <p> Detaches an Aurora secondary cluster from an Aurora global database cluster. The cluster becomes a standalone cluster with read-write capability instead of being read-only and receiving data from a primary cluster in a different region. </p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the RemoveFromGlobalCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorGlobalClusterNotFound`, `AWSrdsErrorInvalidGlobalClusterState`, `AWSrdsErrorDBClusterNotFound`.
 
 @see AWSrdsRemoveFromGlobalClusterMessage
 @see AWSrdsRemoveFromGlobalClusterResult
 */
- (void)removeFromGlobalCluster:(AWSrdsRemoveFromGlobalClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsRemoveFromGlobalClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates an AWS Identity and Access Management (IAM) role from an Amazon Aurora DB cluster. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Integrating.Authorizing.html">Authorizing Amazon Aurora MySQL to Access Other AWS Services on Your Behalf </a> in the <i>Amazon Aurora User Guide</i>.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the RemoveRoleFromDBCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorDBClusterRoleNotFound`, `AWSrdsErrorInvalidDBClusterState`.
 
 @see AWSrdsRemoveRoleFromDBClusterMessage
 */
- (AWSTask *)removeRoleFromDBCluster:(AWSrdsRemoveRoleFromDBClusterMessage *)request;

/**
 <p>Disassociates an AWS Identity and Access Management (IAM) role from an Amazon Aurora DB cluster. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Integrating.Authorizing.html">Authorizing Amazon Aurora MySQL to Access Other AWS Services on Your Behalf </a> in the <i>Amazon Aurora User Guide</i>.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the RemoveRoleFromDBCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorDBClusterRoleNotFound`, `AWSrdsErrorInvalidDBClusterState`.
 
 @see AWSrdsRemoveRoleFromDBClusterMessage
 */
- (void)removeRoleFromDBCluster:(AWSrdsRemoveRoleFromDBClusterMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates an AWS Identity and Access Management (IAM) role from a DB instance.</p>
 
 @param request A container for the necessary parameters to execute the RemoveRoleFromDBInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorDBInstanceRoleNotFound`, `AWSrdsErrorInvalidDBInstanceState`.
 
 @see AWSrdsRemoveRoleFromDBInstanceMessage
 */
- (AWSTask *)removeRoleFromDBInstance:(AWSrdsRemoveRoleFromDBInstanceMessage *)request;

/**
 <p>Disassociates an AWS Identity and Access Management (IAM) role from a DB instance.</p>
 
 @param request A container for the necessary parameters to execute the RemoveRoleFromDBInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorDBInstanceRoleNotFound`, `AWSrdsErrorInvalidDBInstanceState`.
 
 @see AWSrdsRemoveRoleFromDBInstanceMessage
 */
- (void)removeRoleFromDBInstance:(AWSrdsRemoveRoleFromDBInstanceMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes a source identifier from an existing RDS event notification subscription.</p>
 
 @param request A container for the necessary parameters to execute the RemoveSourceIdentifierFromSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsRemoveSourceIdentifierFromSubscriptionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorSubscriptionNotFound`, `AWSrdsErrorSourceNotFound`.
 
 @see AWSrdsRemoveSourceIdentifierFromSubscriptionMessage
 @see AWSrdsRemoveSourceIdentifierFromSubscriptionResult
 */
- (AWSTask<AWSrdsRemoveSourceIdentifierFromSubscriptionResult *> *)removeSourceIdentifierFromSubscription:(AWSrdsRemoveSourceIdentifierFromSubscriptionMessage *)request;

/**
 <p>Removes a source identifier from an existing RDS event notification subscription.</p>
 
 @param request A container for the necessary parameters to execute the RemoveSourceIdentifierFromSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorSubscriptionNotFound`, `AWSrdsErrorSourceNotFound`.
 
 @see AWSrdsRemoveSourceIdentifierFromSubscriptionMessage
 @see AWSrdsRemoveSourceIdentifierFromSubscriptionResult
 */
- (void)removeSourceIdentifierFromSubscription:(AWSrdsRemoveSourceIdentifierFromSubscriptionMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsRemoveSourceIdentifierFromSubscriptionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes metadata tags from an Amazon RDS resource.</p><p>For an overview on tagging an Amazon RDS resource, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Tagging.html">Tagging Amazon RDS Resources</a> in the <i>Amazon RDS User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the RemoveTagsFromResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorDBSnapshotNotFound`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorDBProxyNotFound`, `AWSrdsErrorDBProxyTargetGroupNotFound`.
 
 @see AWSrdsRemoveTagsFromResourceMessage
 */
- (AWSTask *)removeTagsFromResource:(AWSrdsRemoveTagsFromResourceMessage *)request;

/**
 <p>Removes metadata tags from an Amazon RDS resource.</p><p>For an overview on tagging an Amazon RDS resource, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Tagging.html">Tagging Amazon RDS Resources</a> in the <i>Amazon RDS User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the RemoveTagsFromResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorDBSnapshotNotFound`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorDBProxyNotFound`, `AWSrdsErrorDBProxyTargetGroupNotFound`.
 
 @see AWSrdsRemoveTagsFromResourceMessage
 */
- (void)removeTagsFromResource:(AWSrdsRemoveTagsFromResourceMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p> Modifies the parameters of a DB cluster parameter group to the default value. To reset specific parameters submit a list of the following: <code>ParameterName</code> and <code>ApplyMethod</code>. To reset the entire DB cluster parameter group, specify the <code>DBClusterParameterGroupName</code> and <code>ResetAllParameters</code> parameters. </p><p> When resetting the entire group, dynamic parameters are updated immediately and static parameters are set to <code>pending-reboot</code> to take effect on the next DB instance restart or <code>RebootDBInstance</code> request. You must call <code>RebootDBInstance</code> for every DB instance in your DB cluster that you want the updated static parameter to apply to.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ResetDBClusterParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDBClusterParameterGroupNameMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBParameterGroupState`, `AWSrdsErrorDBParameterGroupNotFound`.
 
 @see AWSrdsResetDBClusterParameterGroupMessage
 @see AWSrdsDBClusterParameterGroupNameMessage
 */
- (AWSTask<AWSrdsDBClusterParameterGroupNameMessage *> *)resetDBClusterParameterGroup:(AWSrdsResetDBClusterParameterGroupMessage *)request;

/**
 <p> Modifies the parameters of a DB cluster parameter group to the default value. To reset specific parameters submit a list of the following: <code>ParameterName</code> and <code>ApplyMethod</code>. To reset the entire DB cluster parameter group, specify the <code>DBClusterParameterGroupName</code> and <code>ResetAllParameters</code> parameters. </p><p> When resetting the entire group, dynamic parameters are updated immediately and static parameters are set to <code>pending-reboot</code> to take effect on the next DB instance restart or <code>RebootDBInstance</code> request. You must call <code>RebootDBInstance</code> for every DB instance in your DB cluster that you want the updated static parameter to apply to.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ResetDBClusterParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBParameterGroupState`, `AWSrdsErrorDBParameterGroupNotFound`.
 
 @see AWSrdsResetDBClusterParameterGroupMessage
 @see AWSrdsDBClusterParameterGroupNameMessage
 */
- (void)resetDBClusterParameterGroup:(AWSrdsResetDBClusterParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDBClusterParameterGroupNameMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the parameters of a DB parameter group to the engine/system default value. To reset specific parameters, provide a list of the following: <code>ParameterName</code> and <code>ApplyMethod</code>. To reset the entire DB parameter group, specify the <code>DBParameterGroup</code> name and <code>ResetAllParameters</code> parameters. When resetting the entire group, dynamic parameters are updated immediately and static parameters are set to <code>pending-reboot</code> to take effect on the next DB instance restart or <code>RebootDBInstance</code> request. </p>
 
 @param request A container for the necessary parameters to execute the ResetDBParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsDBParameterGroupNameMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBParameterGroupState`, `AWSrdsErrorDBParameterGroupNotFound`.
 
 @see AWSrdsResetDBParameterGroupMessage
 @see AWSrdsDBParameterGroupNameMessage
 */
- (AWSTask<AWSrdsDBParameterGroupNameMessage *> *)resetDBParameterGroup:(AWSrdsResetDBParameterGroupMessage *)request;

/**
 <p>Modifies the parameters of a DB parameter group to the engine/system default value. To reset specific parameters, provide a list of the following: <code>ParameterName</code> and <code>ApplyMethod</code>. To reset the entire DB parameter group, specify the <code>DBParameterGroup</code> name and <code>ResetAllParameters</code> parameters. When resetting the entire group, dynamic parameters are updated immediately and static parameters are set to <code>pending-reboot</code> to take effect on the next DB instance restart or <code>RebootDBInstance</code> request. </p>
 
 @param request A container for the necessary parameters to execute the ResetDBParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBParameterGroupState`, `AWSrdsErrorDBParameterGroupNotFound`.
 
 @see AWSrdsResetDBParameterGroupMessage
 @see AWSrdsDBParameterGroupNameMessage
 */
- (void)resetDBParameterGroup:(AWSrdsResetDBParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsDBParameterGroupNameMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon Aurora DB cluster from data stored in an Amazon S3 bucket. Amazon RDS must be authorized to access the Amazon S3 bucket and the data must be created using the Percona XtraBackup utility as described in <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Migrating.html"> Migrating Data to an Amazon Aurora MySQL DB Cluster</a> in the <i>Amazon Aurora User Guide</i>.</p><note><p>This action only restores the DB cluster, not the DB instances for that DB cluster. You must invoke the <code>CreateDBInstance</code> action to create DB instances for the restored DB cluster, specifying the identifier of the restored DB cluster in <code>DBClusterIdentifier</code>. You can create DB instances only after the <code>RestoreDBClusterFromS3</code> action has completed and the DB cluster is available.</p></note><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the RestoreDBClusterFromS3 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsRestoreDBClusterFromS3Result`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterAlreadyExists`, `AWSrdsErrorDBClusterQuotaExceeded`, `AWSrdsErrorStorageQuotaExceeded`, `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorInvalidVPCNetworkState`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidDBSubnetGroupState`, `AWSrdsErrorInvalidSubnet`, `AWSrdsErrorInvalidS3Bucket`, `AWSrdsErrorDBClusterParameterGroupNotFound`, `AWSrdsErrorKMSKeyNotAccessible`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorDomainNotFound`, `AWSrdsErrorInsufficientStorageClusterCapacity`.
 
 @see AWSrdsRestoreDBClusterFromS3Message
 @see AWSrdsRestoreDBClusterFromS3Result
 */
- (AWSTask<AWSrdsRestoreDBClusterFromS3Result *> *)restoreDBClusterFromS3:(AWSrdsRestoreDBClusterFromS3Message *)request;

/**
 <p>Creates an Amazon Aurora DB cluster from data stored in an Amazon S3 bucket. Amazon RDS must be authorized to access the Amazon S3 bucket and the data must be created using the Percona XtraBackup utility as described in <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Migrating.html"> Migrating Data to an Amazon Aurora MySQL DB Cluster</a> in the <i>Amazon Aurora User Guide</i>.</p><note><p>This action only restores the DB cluster, not the DB instances for that DB cluster. You must invoke the <code>CreateDBInstance</code> action to create DB instances for the restored DB cluster, specifying the identifier of the restored DB cluster in <code>DBClusterIdentifier</code>. You can create DB instances only after the <code>RestoreDBClusterFromS3</code> action has completed and the DB cluster is available.</p></note><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the RestoreDBClusterFromS3 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterAlreadyExists`, `AWSrdsErrorDBClusterQuotaExceeded`, `AWSrdsErrorStorageQuotaExceeded`, `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorInvalidVPCNetworkState`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidDBSubnetGroupState`, `AWSrdsErrorInvalidSubnet`, `AWSrdsErrorInvalidS3Bucket`, `AWSrdsErrorDBClusterParameterGroupNotFound`, `AWSrdsErrorKMSKeyNotAccessible`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorDomainNotFound`, `AWSrdsErrorInsufficientStorageClusterCapacity`.
 
 @see AWSrdsRestoreDBClusterFromS3Message
 @see AWSrdsRestoreDBClusterFromS3Result
 */
- (void)restoreDBClusterFromS3:(AWSrdsRestoreDBClusterFromS3Message *)request completionHandler:(void (^ _Nullable)(AWSrdsRestoreDBClusterFromS3Result * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new DB cluster from a DB snapshot or DB cluster snapshot. This action only applies to Aurora DB clusters.</p><p>The target DB cluster is created from the source snapshot with a default configuration. If you don't specify a security group, the new DB cluster is associated with the default security group.</p><note><p>This action only restores the DB cluster, not the DB instances for that DB cluster. You must invoke the <code>CreateDBInstance</code> action to create DB instances for the restored DB cluster, specifying the identifier of the restored DB cluster in <code>DBClusterIdentifier</code>. You can create DB instances only after the <code>RestoreDBClusterFromSnapshot</code> action has completed and the DB cluster is available.</p></note><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the RestoreDBClusterFromSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsRestoreDBClusterFromSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterAlreadyExists`, `AWSrdsErrorDBClusterQuotaExceeded`, `AWSrdsErrorStorageQuotaExceeded`, `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorDBSnapshotNotFound`, `AWSrdsErrorDBClusterSnapshotNotFound`, `AWSrdsErrorInsufficientDBClusterCapacity`, `AWSrdsErrorInsufficientStorageClusterCapacity`, `AWSrdsErrorInvalidDBSnapshotState`, `AWSrdsErrorInvalidDBClusterSnapshotState`, `AWSrdsErrorStorageQuotaExceeded`, `AWSrdsErrorInvalidVPCNetworkState`, `AWSrdsErrorInvalidRestore`, `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorInvalidSubnet`, `AWSrdsErrorOptionGroupNotFound`, `AWSrdsErrorKMSKeyNotAccessible`, `AWSrdsErrorDomainNotFound`, `AWSrdsErrorDBClusterParameterGroupNotFound`.
 
 @see AWSrdsRestoreDBClusterFromSnapshotMessage
 @see AWSrdsRestoreDBClusterFromSnapshotResult
 */
- (AWSTask<AWSrdsRestoreDBClusterFromSnapshotResult *> *)restoreDBClusterFromSnapshot:(AWSrdsRestoreDBClusterFromSnapshotMessage *)request;

/**
 <p>Creates a new DB cluster from a DB snapshot or DB cluster snapshot. This action only applies to Aurora DB clusters.</p><p>The target DB cluster is created from the source snapshot with a default configuration. If you don't specify a security group, the new DB cluster is associated with the default security group.</p><note><p>This action only restores the DB cluster, not the DB instances for that DB cluster. You must invoke the <code>CreateDBInstance</code> action to create DB instances for the restored DB cluster, specifying the identifier of the restored DB cluster in <code>DBClusterIdentifier</code>. You can create DB instances only after the <code>RestoreDBClusterFromSnapshot</code> action has completed and the DB cluster is available.</p></note><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the RestoreDBClusterFromSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterAlreadyExists`, `AWSrdsErrorDBClusterQuotaExceeded`, `AWSrdsErrorStorageQuotaExceeded`, `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorDBSnapshotNotFound`, `AWSrdsErrorDBClusterSnapshotNotFound`, `AWSrdsErrorInsufficientDBClusterCapacity`, `AWSrdsErrorInsufficientStorageClusterCapacity`, `AWSrdsErrorInvalidDBSnapshotState`, `AWSrdsErrorInvalidDBClusterSnapshotState`, `AWSrdsErrorStorageQuotaExceeded`, `AWSrdsErrorInvalidVPCNetworkState`, `AWSrdsErrorInvalidRestore`, `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorInvalidSubnet`, `AWSrdsErrorOptionGroupNotFound`, `AWSrdsErrorKMSKeyNotAccessible`, `AWSrdsErrorDomainNotFound`, `AWSrdsErrorDBClusterParameterGroupNotFound`.
 
 @see AWSrdsRestoreDBClusterFromSnapshotMessage
 @see AWSrdsRestoreDBClusterFromSnapshotResult
 */
- (void)restoreDBClusterFromSnapshot:(AWSrdsRestoreDBClusterFromSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsRestoreDBClusterFromSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Restores a DB cluster to an arbitrary point in time. Users can restore to any point in time before <code>LatestRestorableTime</code> for up to <code>BackupRetentionPeriod</code> days. The target DB cluster is created from the source DB cluster with the same configuration as the original DB cluster, except that the new DB cluster is created with the default DB security group. </p><note><p>This action only restores the DB cluster, not the DB instances for that DB cluster. You must invoke the <code>CreateDBInstance</code> action to create DB instances for the restored DB cluster, specifying the identifier of the restored DB cluster in <code>DBClusterIdentifier</code>. You can create DB instances only after the <code>RestoreDBClusterToPointInTime</code> action has completed and the DB cluster is available.</p></note><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the RestoreDBClusterToPointInTime service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsRestoreDBClusterToPointInTimeResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterAlreadyExists`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorDBClusterQuotaExceeded`, `AWSrdsErrorDBClusterSnapshotNotFound`, `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorInsufficientDBClusterCapacity`, `AWSrdsErrorInsufficientStorageClusterCapacity`, `AWSrdsErrorInvalidDBClusterSnapshotState`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidDBSnapshotState`, `AWSrdsErrorInvalidRestore`, `AWSrdsErrorInvalidSubnet`, `AWSrdsErrorInvalidVPCNetworkState`, `AWSrdsErrorKMSKeyNotAccessible`, `AWSrdsErrorOptionGroupNotFound`, `AWSrdsErrorStorageQuotaExceeded`, `AWSrdsErrorDomainNotFound`, `AWSrdsErrorDBClusterParameterGroupNotFound`.
 
 @see AWSrdsRestoreDBClusterToPointInTimeMessage
 @see AWSrdsRestoreDBClusterToPointInTimeResult
 */
- (AWSTask<AWSrdsRestoreDBClusterToPointInTimeResult *> *)restoreDBClusterToPointInTime:(AWSrdsRestoreDBClusterToPointInTimeMessage *)request;

/**
 <p>Restores a DB cluster to an arbitrary point in time. Users can restore to any point in time before <code>LatestRestorableTime</code> for up to <code>BackupRetentionPeriod</code> days. The target DB cluster is created from the source DB cluster with the same configuration as the original DB cluster, except that the new DB cluster is created with the default DB security group. </p><note><p>This action only restores the DB cluster, not the DB instances for that DB cluster. You must invoke the <code>CreateDBInstance</code> action to create DB instances for the restored DB cluster, specifying the identifier of the restored DB cluster in <code>DBClusterIdentifier</code>. You can create DB instances only after the <code>RestoreDBClusterToPointInTime</code> action has completed and the DB cluster is available.</p></note><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the RestoreDBClusterToPointInTime service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterAlreadyExists`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorDBClusterQuotaExceeded`, `AWSrdsErrorDBClusterSnapshotNotFound`, `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorInsufficientDBClusterCapacity`, `AWSrdsErrorInsufficientStorageClusterCapacity`, `AWSrdsErrorInvalidDBClusterSnapshotState`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidDBSnapshotState`, `AWSrdsErrorInvalidRestore`, `AWSrdsErrorInvalidSubnet`, `AWSrdsErrorInvalidVPCNetworkState`, `AWSrdsErrorKMSKeyNotAccessible`, `AWSrdsErrorOptionGroupNotFound`, `AWSrdsErrorStorageQuotaExceeded`, `AWSrdsErrorDomainNotFound`, `AWSrdsErrorDBClusterParameterGroupNotFound`.
 
 @see AWSrdsRestoreDBClusterToPointInTimeMessage
 @see AWSrdsRestoreDBClusterToPointInTimeResult
 */
- (void)restoreDBClusterToPointInTime:(AWSrdsRestoreDBClusterToPointInTimeMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsRestoreDBClusterToPointInTimeResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new DB instance from a DB snapshot. The target database is created from the source database restore point with the most of original configuration with the default security group and the default DB parameter group. By default, the new DB instance is created as a single-AZ deployment except when the instance is a SQL Server instance that has an option group that is associated with mirroring; in this case, the instance becomes a mirrored AZ deployment and not a single-AZ deployment.</p><p>If your intent is to replace your original DB instance with the new, restored DB instance, then rename your original DB instance before you call the RestoreDBInstanceFromDBSnapshot action. RDS doesn't allow two DB instances with the same name. Once you have renamed your original DB instance with a different identifier, then you can pass the original name of the DB instance as the DBInstanceIdentifier in the call to the RestoreDBInstanceFromDBSnapshot action. The result is that you will replace the original DB instance with the DB instance created from the snapshot.</p><p>If you are restoring from a shared manual DB snapshot, the <code>DBSnapshotIdentifier</code> must be the ARN of the shared DB snapshot.</p><note><p>This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora, use <code>RestoreDBClusterFromSnapshot</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the RestoreDBInstanceFromDBSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsRestoreDBInstanceFromDBSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceAlreadyExists`, `AWSrdsErrorDBSnapshotNotFound`, `AWSrdsErrorInstanceQuotaExceeded`, `AWSrdsErrorInsufficientDBInstanceCapacity`, `AWSrdsErrorInvalidDBSnapshotState`, `AWSrdsErrorStorageQuotaExceeded`, `AWSrdsErrorInvalidVPCNetworkState`, `AWSrdsErrorInvalidRestore`, `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSrdsErrorInvalidSubnet`, `AWSrdsErrorProvisionedIopsNotAvailableInAZ`, `AWSrdsErrorOptionGroupNotFound`, `AWSrdsErrorStorageTypeNotSupported`, `AWSrdsErrorAuthorizationNotFound`, `AWSrdsErrorKMSKeyNotAccessible`, `AWSrdsErrorDBSecurityGroupNotFound`, `AWSrdsErrorDomainNotFound`, `AWSrdsErrorDBParameterGroupNotFound`, `AWSrdsErrorBackupPolicyNotFound`.
 
 @see AWSrdsRestoreDBInstanceFromDBSnapshotMessage
 @see AWSrdsRestoreDBInstanceFromDBSnapshotResult
 */
- (AWSTask<AWSrdsRestoreDBInstanceFromDBSnapshotResult *> *)restoreDBInstanceFromDBSnapshot:(AWSrdsRestoreDBInstanceFromDBSnapshotMessage *)request;

/**
 <p>Creates a new DB instance from a DB snapshot. The target database is created from the source database restore point with the most of original configuration with the default security group and the default DB parameter group. By default, the new DB instance is created as a single-AZ deployment except when the instance is a SQL Server instance that has an option group that is associated with mirroring; in this case, the instance becomes a mirrored AZ deployment and not a single-AZ deployment.</p><p>If your intent is to replace your original DB instance with the new, restored DB instance, then rename your original DB instance before you call the RestoreDBInstanceFromDBSnapshot action. RDS doesn't allow two DB instances with the same name. Once you have renamed your original DB instance with a different identifier, then you can pass the original name of the DB instance as the DBInstanceIdentifier in the call to the RestoreDBInstanceFromDBSnapshot action. The result is that you will replace the original DB instance with the DB instance created from the snapshot.</p><p>If you are restoring from a shared manual DB snapshot, the <code>DBSnapshotIdentifier</code> must be the ARN of the shared DB snapshot.</p><note><p>This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora, use <code>RestoreDBClusterFromSnapshot</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the RestoreDBInstanceFromDBSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceAlreadyExists`, `AWSrdsErrorDBSnapshotNotFound`, `AWSrdsErrorInstanceQuotaExceeded`, `AWSrdsErrorInsufficientDBInstanceCapacity`, `AWSrdsErrorInvalidDBSnapshotState`, `AWSrdsErrorStorageQuotaExceeded`, `AWSrdsErrorInvalidVPCNetworkState`, `AWSrdsErrorInvalidRestore`, `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSrdsErrorInvalidSubnet`, `AWSrdsErrorProvisionedIopsNotAvailableInAZ`, `AWSrdsErrorOptionGroupNotFound`, `AWSrdsErrorStorageTypeNotSupported`, `AWSrdsErrorAuthorizationNotFound`, `AWSrdsErrorKMSKeyNotAccessible`, `AWSrdsErrorDBSecurityGroupNotFound`, `AWSrdsErrorDomainNotFound`, `AWSrdsErrorDBParameterGroupNotFound`, `AWSrdsErrorBackupPolicyNotFound`.
 
 @see AWSrdsRestoreDBInstanceFromDBSnapshotMessage
 @see AWSrdsRestoreDBInstanceFromDBSnapshotResult
 */
- (void)restoreDBInstanceFromDBSnapshot:(AWSrdsRestoreDBInstanceFromDBSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsRestoreDBInstanceFromDBSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Amazon Relational Database Service (Amazon RDS) supports importing MySQL databases by using backup files. You can create a backup of your on-premises database, store it on Amazon Simple Storage Service (Amazon S3), and then restore the backup file onto a new Amazon RDS DB instance running MySQL. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MySQL.Procedural.Importing.html">Importing Data into an Amazon RDS MySQL DB Instance</a> in the <i>Amazon RDS User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the RestoreDBInstanceFromS3 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsRestoreDBInstanceFromS3Result`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceAlreadyExists`, `AWSrdsErrorInsufficientDBInstanceCapacity`, `AWSrdsErrorDBParameterGroupNotFound`, `AWSrdsErrorDBSecurityGroupNotFound`, `AWSrdsErrorInstanceQuotaExceeded`, `AWSrdsErrorStorageQuotaExceeded`, `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSrdsErrorInvalidSubnet`, `AWSrdsErrorInvalidVPCNetworkState`, `AWSrdsErrorInvalidS3Bucket`, `AWSrdsErrorProvisionedIopsNotAvailableInAZ`, `AWSrdsErrorOptionGroupNotFound`, `AWSrdsErrorStorageTypeNotSupported`, `AWSrdsErrorAuthorizationNotFound`, `AWSrdsErrorKMSKeyNotAccessible`, `AWSrdsErrorBackupPolicyNotFound`.
 
 @see AWSrdsRestoreDBInstanceFromS3Message
 @see AWSrdsRestoreDBInstanceFromS3Result
 */
- (AWSTask<AWSrdsRestoreDBInstanceFromS3Result *> *)restoreDBInstanceFromS3:(AWSrdsRestoreDBInstanceFromS3Message *)request;

/**
 <p>Amazon Relational Database Service (Amazon RDS) supports importing MySQL databases by using backup files. You can create a backup of your on-premises database, store it on Amazon Simple Storage Service (Amazon S3), and then restore the backup file onto a new Amazon RDS DB instance running MySQL. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MySQL.Procedural.Importing.html">Importing Data into an Amazon RDS MySQL DB Instance</a> in the <i>Amazon RDS User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the RestoreDBInstanceFromS3 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceAlreadyExists`, `AWSrdsErrorInsufficientDBInstanceCapacity`, `AWSrdsErrorDBParameterGroupNotFound`, `AWSrdsErrorDBSecurityGroupNotFound`, `AWSrdsErrorInstanceQuotaExceeded`, `AWSrdsErrorStorageQuotaExceeded`, `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSrdsErrorInvalidSubnet`, `AWSrdsErrorInvalidVPCNetworkState`, `AWSrdsErrorInvalidS3Bucket`, `AWSrdsErrorProvisionedIopsNotAvailableInAZ`, `AWSrdsErrorOptionGroupNotFound`, `AWSrdsErrorStorageTypeNotSupported`, `AWSrdsErrorAuthorizationNotFound`, `AWSrdsErrorKMSKeyNotAccessible`, `AWSrdsErrorBackupPolicyNotFound`.
 
 @see AWSrdsRestoreDBInstanceFromS3Message
 @see AWSrdsRestoreDBInstanceFromS3Result
 */
- (void)restoreDBInstanceFromS3:(AWSrdsRestoreDBInstanceFromS3Message *)request completionHandler:(void (^ _Nullable)(AWSrdsRestoreDBInstanceFromS3Result * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Restores a DB instance to an arbitrary point in time. You can restore to any point in time before the time identified by the LatestRestorableTime property. You can restore to a point up to the number of days specified by the BackupRetentionPeriod property.</p><p>The target database is created with most of the original configuration, but in a system-selected Availability Zone, with the default security group, the default subnet group, and the default DB parameter group. By default, the new DB instance is created as a single-AZ deployment except when the instance is a SQL Server instance that has an option group that is associated with mirroring; in this case, the instance becomes a mirrored deployment and not a single-AZ deployment.</p><note><p>This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora, use <code>RestoreDBClusterToPointInTime</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the RestoreDBInstanceToPointInTime service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsRestoreDBInstanceToPointInTimeResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceAlreadyExists`, `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorInstanceQuotaExceeded`, `AWSrdsErrorInsufficientDBInstanceCapacity`, `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorPointInTimeRestoreNotEnabled`, `AWSrdsErrorStorageQuotaExceeded`, `AWSrdsErrorInvalidVPCNetworkState`, `AWSrdsErrorInvalidRestore`, `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSrdsErrorInvalidSubnet`, `AWSrdsErrorProvisionedIopsNotAvailableInAZ`, `AWSrdsErrorOptionGroupNotFound`, `AWSrdsErrorStorageTypeNotSupported`, `AWSrdsErrorAuthorizationNotFound`, `AWSrdsErrorKMSKeyNotAccessible`, `AWSrdsErrorDBSecurityGroupNotFound`, `AWSrdsErrorDomainNotFound`, `AWSrdsErrorBackupPolicyNotFound`, `AWSrdsErrorDBParameterGroupNotFound`, `AWSrdsErrorDBInstanceAutomatedBackupNotFound`.
 
 @see AWSrdsRestoreDBInstanceToPointInTimeMessage
 @see AWSrdsRestoreDBInstanceToPointInTimeResult
 */
- (AWSTask<AWSrdsRestoreDBInstanceToPointInTimeResult *> *)restoreDBInstanceToPointInTime:(AWSrdsRestoreDBInstanceToPointInTimeMessage *)request;

/**
 <p>Restores a DB instance to an arbitrary point in time. You can restore to any point in time before the time identified by the LatestRestorableTime property. You can restore to a point up to the number of days specified by the BackupRetentionPeriod property.</p><p>The target database is created with most of the original configuration, but in a system-selected Availability Zone, with the default security group, the default subnet group, and the default DB parameter group. By default, the new DB instance is created as a single-AZ deployment except when the instance is a SQL Server instance that has an option group that is associated with mirroring; in this case, the instance becomes a mirrored deployment and not a single-AZ deployment.</p><note><p>This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora, use <code>RestoreDBClusterToPointInTime</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the RestoreDBInstanceToPointInTime service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceAlreadyExists`, `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorInstanceQuotaExceeded`, `AWSrdsErrorInsufficientDBInstanceCapacity`, `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorPointInTimeRestoreNotEnabled`, `AWSrdsErrorStorageQuotaExceeded`, `AWSrdsErrorInvalidVPCNetworkState`, `AWSrdsErrorInvalidRestore`, `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSrdsErrorInvalidSubnet`, `AWSrdsErrorProvisionedIopsNotAvailableInAZ`, `AWSrdsErrorOptionGroupNotFound`, `AWSrdsErrorStorageTypeNotSupported`, `AWSrdsErrorAuthorizationNotFound`, `AWSrdsErrorKMSKeyNotAccessible`, `AWSrdsErrorDBSecurityGroupNotFound`, `AWSrdsErrorDomainNotFound`, `AWSrdsErrorBackupPolicyNotFound`, `AWSrdsErrorDBParameterGroupNotFound`, `AWSrdsErrorDBInstanceAutomatedBackupNotFound`.
 
 @see AWSrdsRestoreDBInstanceToPointInTimeMessage
 @see AWSrdsRestoreDBInstanceToPointInTimeResult
 */
- (void)restoreDBInstanceToPointInTime:(AWSrdsRestoreDBInstanceToPointInTimeMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsRestoreDBInstanceToPointInTimeResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Revokes ingress from a DBSecurityGroup for previously authorized IP ranges or EC2 or VPC Security Groups. Required parameters for this API are one of CIDRIP, EC2SecurityGroupId for VPC, or (EC2SecurityGroupOwnerId and either EC2SecurityGroupName or EC2SecurityGroupId).</p>
 
 @param request A container for the necessary parameters to execute the RevokeDBSecurityGroupIngress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsRevokeDBSecurityGroupIngressResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSecurityGroupNotFound`, `AWSrdsErrorAuthorizationNotFound`, `AWSrdsErrorInvalidDBSecurityGroupState`.
 
 @see AWSrdsRevokeDBSecurityGroupIngressMessage
 @see AWSrdsRevokeDBSecurityGroupIngressResult
 */
- (AWSTask<AWSrdsRevokeDBSecurityGroupIngressResult *> *)revokeDBSecurityGroupIngress:(AWSrdsRevokeDBSecurityGroupIngressMessage *)request;

/**
 <p>Revokes ingress from a DBSecurityGroup for previously authorized IP ranges or EC2 or VPC Security Groups. Required parameters for this API are one of CIDRIP, EC2SecurityGroupId for VPC, or (EC2SecurityGroupOwnerId and either EC2SecurityGroupName or EC2SecurityGroupId).</p>
 
 @param request A container for the necessary parameters to execute the RevokeDBSecurityGroupIngress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSecurityGroupNotFound`, `AWSrdsErrorAuthorizationNotFound`, `AWSrdsErrorInvalidDBSecurityGroupState`.
 
 @see AWSrdsRevokeDBSecurityGroupIngressMessage
 @see AWSrdsRevokeDBSecurityGroupIngressResult
 */
- (void)revokeDBSecurityGroupIngress:(AWSrdsRevokeDBSecurityGroupIngressMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsRevokeDBSecurityGroupIngressResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a database activity stream to monitor activity on the database. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/DBActivityStreams.html">Database Activity Streams</a> in the <i>Amazon Aurora User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StartActivityStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsStartActivityStreamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorResourceNotFound`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorKMSKeyNotAccessible`.
 
 @see AWSrdsStartActivityStreamRequest
 @see AWSrdsStartActivityStreamResponse
 */
- (AWSTask<AWSrdsStartActivityStreamResponse *> *)startActivityStream:(AWSrdsStartActivityStreamRequest *)request;

/**
 <p>Starts a database activity stream to monitor activity on the database. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/DBActivityStreams.html">Database Activity Streams</a> in the <i>Amazon Aurora User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StartActivityStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorResourceNotFound`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorKMSKeyNotAccessible`.
 
 @see AWSrdsStartActivityStreamRequest
 @see AWSrdsStartActivityStreamResponse
 */
- (void)startActivityStream:(AWSrdsStartActivityStreamRequest *)request completionHandler:(void (^ _Nullable)(AWSrdsStartActivityStreamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts an Amazon Aurora DB cluster that was stopped using the AWS console, the stop-db-cluster AWS CLI command, or the StopDBCluster action.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-cluster-stop-start.html"> Stopping and Starting an Aurora Cluster</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the StartDBCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsStartDBClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidDBInstanceState`.
 
 @see AWSrdsStartDBClusterMessage
 @see AWSrdsStartDBClusterResult
 */
- (AWSTask<AWSrdsStartDBClusterResult *> *)startDBCluster:(AWSrdsStartDBClusterMessage *)request;

/**
 <p>Starts an Amazon Aurora DB cluster that was stopped using the AWS console, the stop-db-cluster AWS CLI command, or the StopDBCluster action.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-cluster-stop-start.html"> Stopping and Starting an Aurora Cluster</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the StartDBCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidDBInstanceState`.
 
 @see AWSrdsStartDBClusterMessage
 @see AWSrdsStartDBClusterResult
 */
- (void)startDBCluster:(AWSrdsStartDBClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsStartDBClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Starts an Amazon RDS DB instance that was stopped using the AWS console, the stop-db-instance AWS CLI command, or the StopDBInstance action. </p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_StartInstance.html"> Starting an Amazon RDS DB instance That Was Previously Stopped</a> in the <i>Amazon RDS User Guide.</i></p><note><p> This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora DB clusters, use <code>StartDBCluster</code> instead. </p></note>
 
 @param request A container for the necessary parameters to execute the StartDBInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsStartDBInstanceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorInsufficientDBInstanceCapacity`, `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidSubnet`, `AWSrdsErrorInvalidVPCNetworkState`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorAuthorizationNotFound`, `AWSrdsErrorKMSKeyNotAccessible`.
 
 @see AWSrdsStartDBInstanceMessage
 @see AWSrdsStartDBInstanceResult
 */
- (AWSTask<AWSrdsStartDBInstanceResult *> *)startDBInstance:(AWSrdsStartDBInstanceMessage *)request;

/**
 <p> Starts an Amazon RDS DB instance that was stopped using the AWS console, the stop-db-instance AWS CLI command, or the StopDBInstance action. </p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_StartInstance.html"> Starting an Amazon RDS DB instance That Was Previously Stopped</a> in the <i>Amazon RDS User Guide.</i></p><note><p> This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora DB clusters, use <code>StartDBCluster</code> instead. </p></note>
 
 @param request A container for the necessary parameters to execute the StartDBInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorInsufficientDBInstanceCapacity`, `AWSrdsErrorDBSubnetGroupNotFound`, `AWSrdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidSubnet`, `AWSrdsErrorInvalidVPCNetworkState`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorAuthorizationNotFound`, `AWSrdsErrorKMSKeyNotAccessible`.
 
 @see AWSrdsStartDBInstanceMessage
 @see AWSrdsStartDBInstanceResult
 */
- (void)startDBInstance:(AWSrdsStartDBInstanceMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsStartDBInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts an export of a snapshot to Amazon S3. The provided IAM role must have access to the S3 bucket. </p>
 
 @param request A container for the necessary parameters to execute the StartExportTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsExportTask`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSnapshotNotFound`, `AWSrdsErrorDBClusterSnapshotNotFound`, `AWSrdsErrorExportTaskAlreadyExists`, `AWSrdsErrorInvalidS3Bucket`, `AWSrdsErrorIamRoleNotFound`, `AWSrdsErrorIamRoleMissingPermissions`, `AWSrdsErrorInvalidExportOnly`, `AWSrdsErrorKMSKeyNotAccessible`, `AWSrdsErrorInvalidExportSourceState`.
 
 @see AWSrdsStartExportTaskMessage
 @see AWSrdsExportTask
 */
- (AWSTask<AWSrdsExportTask *> *)startExportTask:(AWSrdsStartExportTaskMessage *)request;

/**
 <p>Starts an export of a snapshot to Amazon S3. The provided IAM role must have access to the S3 bucket. </p>
 
 @param request A container for the necessary parameters to execute the StartExportTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBSnapshotNotFound`, `AWSrdsErrorDBClusterSnapshotNotFound`, `AWSrdsErrorExportTaskAlreadyExists`, `AWSrdsErrorInvalidS3Bucket`, `AWSrdsErrorIamRoleNotFound`, `AWSrdsErrorIamRoleMissingPermissions`, `AWSrdsErrorInvalidExportOnly`, `AWSrdsErrorKMSKeyNotAccessible`, `AWSrdsErrorInvalidExportSourceState`.
 
 @see AWSrdsStartExportTaskMessage
 @see AWSrdsExportTask
 */
- (void)startExportTask:(AWSrdsStartExportTaskMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsExportTask * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops a database activity stream that was started using the AWS console, the <code>start-activity-stream</code> AWS CLI command, or the <code>StartActivityStream</code> action.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/DBActivityStreams.html">Database Activity Streams</a> in the <i>Amazon Aurora User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StopActivityStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsStopActivityStreamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorResourceNotFound`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorDBInstanceNotFound`.
 
 @see AWSrdsStopActivityStreamRequest
 @see AWSrdsStopActivityStreamResponse
 */
- (AWSTask<AWSrdsStopActivityStreamResponse *> *)stopActivityStream:(AWSrdsStopActivityStreamRequest *)request;

/**
 <p>Stops a database activity stream that was started using the AWS console, the <code>start-activity-stream</code> AWS CLI command, or the <code>StartActivityStream</code> action.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/DBActivityStreams.html">Database Activity Streams</a> in the <i>Amazon Aurora User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StopActivityStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorResourceNotFound`, `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorDBInstanceNotFound`.
 
 @see AWSrdsStopActivityStreamRequest
 @see AWSrdsStopActivityStreamResponse
 */
- (void)stopActivityStream:(AWSrdsStopActivityStreamRequest *)request completionHandler:(void (^ _Nullable)(AWSrdsStopActivityStreamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Stops an Amazon Aurora DB cluster. When you stop a DB cluster, Aurora retains the DB cluster's metadata, including its endpoints and DB parameter groups. Aurora also retains the transaction logs so you can do a point-in-time restore if necessary. </p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-cluster-stop-start.html"> Stopping and Starting an Aurora Cluster</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the StopDBCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsStopDBClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidDBInstanceState`.
 
 @see AWSrdsStopDBClusterMessage
 @see AWSrdsStopDBClusterResult
 */
- (AWSTask<AWSrdsStopDBClusterResult *> *)stopDBCluster:(AWSrdsStopDBClusterMessage *)request;

/**
 <p> Stops an Amazon Aurora DB cluster. When you stop a DB cluster, Aurora retains the DB cluster's metadata, including its endpoints and DB parameter groups. Aurora also retains the transaction logs so you can do a point-in-time restore if necessary. </p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-cluster-stop-start.html"> Stopping and Starting an Aurora Cluster</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the StopDBCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBClusterNotFound`, `AWSrdsErrorInvalidDBClusterState`, `AWSrdsErrorInvalidDBInstanceState`.
 
 @see AWSrdsStopDBClusterMessage
 @see AWSrdsStopDBClusterResult
 */
- (void)stopDBCluster:(AWSrdsStopDBClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsStopDBClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Stops an Amazon RDS DB instance. When you stop a DB instance, Amazon RDS retains the DB instance's metadata, including its endpoint, DB parameter group, and option group membership. Amazon RDS also retains the transaction logs so you can do a point-in-time restore if necessary. </p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_StopInstance.html"> Stopping an Amazon RDS DB Instance Temporarily</a> in the <i>Amazon RDS User Guide.</i></p><note><p> This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora clusters, use <code>StopDBCluster</code> instead. </p></note>
 
 @param request A container for the necessary parameters to execute the StopDBInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSrdsStopDBInstanceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorDBSnapshotAlreadyExists`, `AWSrdsErrorSnapshotQuotaExceeded`, `AWSrdsErrorInvalidDBClusterState`.
 
 @see AWSrdsStopDBInstanceMessage
 @see AWSrdsStopDBInstanceResult
 */
- (AWSTask<AWSrdsStopDBInstanceResult *> *)stopDBInstance:(AWSrdsStopDBInstanceMessage *)request;

/**
 <p> Stops an Amazon RDS DB instance. When you stop a DB instance, Amazon RDS retains the DB instance's metadata, including its endpoint, DB parameter group, and option group membership. Amazon RDS also retains the transaction logs so you can do a point-in-time restore if necessary. </p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_StopInstance.html"> Stopping an Amazon RDS DB Instance Temporarily</a> in the <i>Amazon RDS User Guide.</i></p><note><p> This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora clusters, use <code>StopDBCluster</code> instead. </p></note>
 
 @param request A container for the necessary parameters to execute the StopDBInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSrdsErrorDomain` domain and the following error code: `AWSrdsErrorDBInstanceNotFound`, `AWSrdsErrorInvalidDBInstanceState`, `AWSrdsErrorDBSnapshotAlreadyExists`, `AWSrdsErrorSnapshotQuotaExceeded`, `AWSrdsErrorInvalidDBClusterState`.
 
 @see AWSrdsStopDBInstanceMessage
 @see AWSrdsStopDBInstanceResult
 */
- (void)stopDBInstance:(AWSrdsStopDBInstanceMessage *)request completionHandler:(void (^ _Nullable)(AWSrdsStopDBInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
