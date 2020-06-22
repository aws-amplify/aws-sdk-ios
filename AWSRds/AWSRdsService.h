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
#import "AWSRdsModel.h"
#import "AWSRdsResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSRds
FOUNDATION_EXPORT NSString *const AWSRdsSDKVersion;

/**
 <fullname>Amazon Relational Database Service</fullname><p></p><p>Amazon Relational Database Service (Amazon RDS) is a web service that makes it easier to set up, operate, and scale a relational database in the cloud. It provides cost-efficient, resizeable capacity for an industry-standard relational database and manages common database administration tasks, freeing up developers to focus on what makes their applications and businesses unique.</p><p>Amazon RDS gives you access to the capabilities of a MySQL, MariaDB, PostgreSQL, Microsoft SQL Server, Oracle, or Amazon Aurora database server. These capabilities mean that the code, applications, and tools you already use today with your existing databases work with Amazon RDS without modification. Amazon RDS automatically backs up your database and maintains the database software that powers your DB instance. Amazon RDS is flexible: you can scale your DB instance's compute resources and storage capacity to meet your application's demand. As with all Amazon Web Services, there are no up-front investments, and you pay only for the resources you use.</p><p>This interface reference for Amazon RDS contains documentation for a programming or command line interface you can use to manage Amazon RDS. Amazon RDS is asynchronous, which means that some interfaces might require techniques such as polling or callback functions to determine when a command has been applied. In this reference, the parameter descriptions indicate whether a command is applied immediately, on the next instance reboot, or during the maintenance window. The reference structure is as follows, and we list following some related topics from the user guide.</p><p><b>Amazon RDS API Reference</b></p><ul><li><p>For the alphabetical list of API actions, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_Operations.html">API Actions</a>.</p></li><li><p>For the alphabetical list of data types, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_Types.html">Data Types</a>.</p></li><li><p>For a list of common query parameters, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/CommonParameters.html">Common Parameters</a>.</p></li><li><p>For descriptions of the error codes, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/CommonErrors.html">Common Errors</a>.</p></li></ul><p><b>Amazon RDS User Guide</b></p><ul><li><p>For a summary of the Amazon RDS interfaces, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Welcome.html#Welcome.Interfaces">Available RDS Interfaces</a>.</p></li><li><p>For more information about how to use the Query API, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Using_the_Query_API.html">Using the Query API</a>.</p></li></ul>
 */
@interface AWSRds : AWSService

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

     let Rds = AWSRds.default()

 *Objective-C*

     AWSRds *Rds = [AWSRds defaultRds];

 @return The default service client.
 */
+ (instancetype)defaultRds;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSRds.register(with: configuration!, forKey: "USWest2Rds")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSRds registerRdsWithConfiguration:configuration forKey:@"USWest2Rds"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Rds = AWSRds(forKey: "USWest2Rds")

 *Objective-C*

     AWSRds *Rds = [AWSRds RdsForKey:@"USWest2Rds"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerRdsWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerRdsWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSRds.register(with: configuration!, forKey: "USWest2Rds")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSRds registerRdsWithConfiguration:configuration forKey:@"USWest2Rds"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Rds = AWSRds(forKey: "USWest2Rds")

 *Objective-C*

     AWSRds *Rds = [AWSRds RdsForKey:@"USWest2Rds"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)RdsForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeRdsForKey:(NSString *)key;

/**
 <p>Associates an Identity and Access Management (IAM) role from an Amazon Aurora DB cluster. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Integrating.Authorizing.html">Authorizing Amazon Aurora MySQL to Access Other AWS Services on Your Behalf</a> in the <i>Amazon Aurora User Guide</i>.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the AddRoleToDBCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorDBClusterRoleAlreadyExists`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorDBClusterRoleQuotaExceeded`.
 
 @see AWSRdsAddRoleToDBClusterMessage
 */
- (AWSTask *)addRoleToDBCluster:(AWSRdsAddRoleToDBClusterMessage *)request;

/**
 <p>Associates an Identity and Access Management (IAM) role from an Amazon Aurora DB cluster. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Integrating.Authorizing.html">Authorizing Amazon Aurora MySQL to Access Other AWS Services on Your Behalf</a> in the <i>Amazon Aurora User Guide</i>.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the AddRoleToDBCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorDBClusterRoleAlreadyExists`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorDBClusterRoleQuotaExceeded`.
 
 @see AWSRdsAddRoleToDBClusterMessage
 */
- (void)addRoleToDBCluster:(AWSRdsAddRoleToDBClusterMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Associates an AWS Identity and Access Management (IAM) role with a DB instance.</p><note><p>To add a role to a DB instance, the status of the DB instance must be <code>available</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the AddRoleToDBInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorDBInstanceRoleAlreadyExists`, `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorDBInstanceRoleQuotaExceeded`.
 
 @see AWSRdsAddRoleToDBInstanceMessage
 */
- (AWSTask *)addRoleToDBInstance:(AWSRdsAddRoleToDBInstanceMessage *)request;

/**
 <p>Associates an AWS Identity and Access Management (IAM) role with a DB instance.</p><note><p>To add a role to a DB instance, the status of the DB instance must be <code>available</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the AddRoleToDBInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorDBInstanceRoleAlreadyExists`, `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorDBInstanceRoleQuotaExceeded`.
 
 @see AWSRdsAddRoleToDBInstanceMessage
 */
- (void)addRoleToDBInstance:(AWSRdsAddRoleToDBInstanceMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Adds a source identifier to an existing RDS event notification subscription.</p>
 
 @param request A container for the necessary parameters to execute the AddSourceIdentifierToSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsAddSourceIdentifierToSubscriptionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorSubscriptionNotFound`, `AWSRdsErrorSourceNotFound`.
 
 @see AWSRdsAddSourceIdentifierToSubscriptionMessage
 @see AWSRdsAddSourceIdentifierToSubscriptionResult
 */
- (AWSTask<AWSRdsAddSourceIdentifierToSubscriptionResult *> *)addSourceIdentifierToSubscription:(AWSRdsAddSourceIdentifierToSubscriptionMessage *)request;

/**
 <p>Adds a source identifier to an existing RDS event notification subscription.</p>
 
 @param request A container for the necessary parameters to execute the AddSourceIdentifierToSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorSubscriptionNotFound`, `AWSRdsErrorSourceNotFound`.
 
 @see AWSRdsAddSourceIdentifierToSubscriptionMessage
 @see AWSRdsAddSourceIdentifierToSubscriptionResult
 */
- (void)addSourceIdentifierToSubscription:(AWSRdsAddSourceIdentifierToSubscriptionMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsAddSourceIdentifierToSubscriptionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds metadata tags to an Amazon RDS resource. These tags can also be used with cost allocation reporting to track cost associated with Amazon RDS resources, or used in a Condition statement in an IAM policy for Amazon RDS.</p><p>For an overview on tagging Amazon RDS resources, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Tagging.html">Tagging Amazon RDS Resources</a>.</p>
 
 @param request A container for the necessary parameters to execute the AddTagsToResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorDBSnapshotNotFound`, `AWSRdsErrorDBProxyNotFound`, `AWSRdsErrorDBProxyTargetGroupNotFound`.
 
 @see AWSRdsAddTagsToResourceMessage
 */
- (AWSTask *)addTagsToResource:(AWSRdsAddTagsToResourceMessage *)request;

/**
 <p>Adds metadata tags to an Amazon RDS resource. These tags can also be used with cost allocation reporting to track cost associated with Amazon RDS resources, or used in a Condition statement in an IAM policy for Amazon RDS.</p><p>For an overview on tagging Amazon RDS resources, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Tagging.html">Tagging Amazon RDS Resources</a>.</p>
 
 @param request A container for the necessary parameters to execute the AddTagsToResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorDBSnapshotNotFound`, `AWSRdsErrorDBProxyNotFound`, `AWSRdsErrorDBProxyTargetGroupNotFound`.
 
 @see AWSRdsAddTagsToResourceMessage
 */
- (void)addTagsToResource:(AWSRdsAddTagsToResourceMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Applies a pending maintenance action to a resource (for example, to a DB instance).</p>
 
 @param request A container for the necessary parameters to execute the ApplyPendingMaintenanceAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsApplyPendingMaintenanceActionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorResourceNotFound`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidDBInstanceState`.
 
 @see AWSRdsApplyPendingMaintenanceActionMessage
 @see AWSRdsApplyPendingMaintenanceActionResult
 */
- (AWSTask<AWSRdsApplyPendingMaintenanceActionResult *> *)applyPendingMaintenanceAction:(AWSRdsApplyPendingMaintenanceActionMessage *)request;

/**
 <p>Applies a pending maintenance action to a resource (for example, to a DB instance).</p>
 
 @param request A container for the necessary parameters to execute the ApplyPendingMaintenanceAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorResourceNotFound`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidDBInstanceState`.
 
 @see AWSRdsApplyPendingMaintenanceActionMessage
 @see AWSRdsApplyPendingMaintenanceActionResult
 */
- (void)applyPendingMaintenanceAction:(AWSRdsApplyPendingMaintenanceActionMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsApplyPendingMaintenanceActionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables ingress to a DBSecurityGroup using one of two forms of authorization. First, EC2 or VPC security groups can be added to the DBSecurityGroup if the application using the database is running on EC2 or VPC instances. Second, IP ranges are available if the application accessing your database is running on the Internet. Required parameters for this API are one of CIDR range, EC2SecurityGroupId for VPC, or (EC2SecurityGroupOwnerId and either EC2SecurityGroupName or EC2SecurityGroupId for non-VPC).</p><note><p>You can't authorize ingress from an EC2 security group in one AWS Region to an Amazon RDS DB instance in another. You can't authorize ingress from a VPC security group in one VPC to an Amazon RDS DB instance in another.</p></note><p>For an overview of CIDR ranges, go to the <a href="http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Wikipedia Tutorial</a>. </p>
 
 @param request A container for the necessary parameters to execute the AuthorizeDBSecurityGroupIngress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsAuthorizeDBSecurityGroupIngressResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSecurityGroupNotFound`, `AWSRdsErrorInvalidDBSecurityGroupState`, `AWSRdsErrorAuthorizationAlreadyExists`, `AWSRdsErrorAuthorizationQuotaExceeded`.
 
 @see AWSRdsAuthorizeDBSecurityGroupIngressMessage
 @see AWSRdsAuthorizeDBSecurityGroupIngressResult
 */
- (AWSTask<AWSRdsAuthorizeDBSecurityGroupIngressResult *> *)authorizeDBSecurityGroupIngress:(AWSRdsAuthorizeDBSecurityGroupIngressMessage *)request;

/**
 <p>Enables ingress to a DBSecurityGroup using one of two forms of authorization. First, EC2 or VPC security groups can be added to the DBSecurityGroup if the application using the database is running on EC2 or VPC instances. Second, IP ranges are available if the application accessing your database is running on the Internet. Required parameters for this API are one of CIDR range, EC2SecurityGroupId for VPC, or (EC2SecurityGroupOwnerId and either EC2SecurityGroupName or EC2SecurityGroupId for non-VPC).</p><note><p>You can't authorize ingress from an EC2 security group in one AWS Region to an Amazon RDS DB instance in another. You can't authorize ingress from a VPC security group in one VPC to an Amazon RDS DB instance in another.</p></note><p>For an overview of CIDR ranges, go to the <a href="http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Wikipedia Tutorial</a>. </p>
 
 @param request A container for the necessary parameters to execute the AuthorizeDBSecurityGroupIngress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSecurityGroupNotFound`, `AWSRdsErrorInvalidDBSecurityGroupState`, `AWSRdsErrorAuthorizationAlreadyExists`, `AWSRdsErrorAuthorizationQuotaExceeded`.
 
 @see AWSRdsAuthorizeDBSecurityGroupIngressMessage
 @see AWSRdsAuthorizeDBSecurityGroupIngressResult
 */
- (void)authorizeDBSecurityGroupIngress:(AWSRdsAuthorizeDBSecurityGroupIngressMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsAuthorizeDBSecurityGroupIngressResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Backtracks a DB cluster to a specific time, without creating a new DB cluster.</p><p>For more information on backtracking, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Managing.Backtrack.html"> Backtracking an Aurora DB Cluster</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora MySQL DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the BacktrackDBCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDBClusterBacktrack`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorInvalidDBClusterState`.
 
 @see AWSRdsBacktrackDBClusterMessage
 @see AWSRdsDBClusterBacktrack
 */
- (AWSTask<AWSRdsDBClusterBacktrack *> *)backtrackDBCluster:(AWSRdsBacktrackDBClusterMessage *)request;

/**
 <p>Backtracks a DB cluster to a specific time, without creating a new DB cluster.</p><p>For more information on backtracking, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Managing.Backtrack.html"> Backtracking an Aurora DB Cluster</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora MySQL DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the BacktrackDBCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorInvalidDBClusterState`.
 
 @see AWSRdsBacktrackDBClusterMessage
 @see AWSRdsDBClusterBacktrack
 */
- (void)backtrackDBCluster:(AWSRdsBacktrackDBClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDBClusterBacktrack * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels an export task in progress that is exporting a snapshot to Amazon S3. Any data that has already been written to the S3 bucket isn't removed. </p>
 
 @param request A container for the necessary parameters to execute the CancelExportTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsExportTask`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorExportTaskNotFound`, `AWSRdsErrorInvalidExportTaskState`.
 
 @see AWSRdsCancelExportTaskMessage
 @see AWSRdsExportTask
 */
- (AWSTask<AWSRdsExportTask *> *)cancelExportTask:(AWSRdsCancelExportTaskMessage *)request;

/**
 <p>Cancels an export task in progress that is exporting a snapshot to Amazon S3. Any data that has already been written to the S3 bucket isn't removed. </p>
 
 @param request A container for the necessary parameters to execute the CancelExportTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorExportTaskNotFound`, `AWSRdsErrorInvalidExportTaskState`.
 
 @see AWSRdsCancelExportTaskMessage
 @see AWSRdsExportTask
 */
- (void)cancelExportTask:(AWSRdsCancelExportTaskMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsExportTask * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Copies the specified DB cluster parameter group.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CopyDBClusterParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsReplicateDBClusterParameterGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBParameterGroupNotFound`, `AWSRdsErrorDBParameterGroupQuotaExceeded`, `AWSRdsErrorDBParameterGroupAlreadyExists`.
 
 @see AWSRdsReplicateDBClusterParameterGroupMessage
 @see AWSRdsReplicateDBClusterParameterGroupResult
 */
- (AWSTask<AWSRdsReplicateDBClusterParameterGroupResult *> *)replicateDBClusterParameterGroup:(AWSRdsReplicateDBClusterParameterGroupMessage *)request;

/**
 <p>Copies the specified DB cluster parameter group.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CopyDBClusterParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBParameterGroupNotFound`, `AWSRdsErrorDBParameterGroupQuotaExceeded`, `AWSRdsErrorDBParameterGroupAlreadyExists`.
 
 @see AWSRdsReplicateDBClusterParameterGroupMessage
 @see AWSRdsReplicateDBClusterParameterGroupResult
 */
- (void)replicateDBClusterParameterGroup:(AWSRdsReplicateDBClusterParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsReplicateDBClusterParameterGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Copies a snapshot of a DB cluster.</p><p>To copy a DB cluster snapshot from a shared manual DB cluster snapshot, <code>SourceDBClusterSnapshotIdentifier</code> must be the Amazon Resource Name (ARN) of the shared DB cluster snapshot.</p><p>You can copy an encrypted DB cluster snapshot from another AWS Region. In that case, the AWS Region where you call the <code>CopyDBClusterSnapshot</code> action is the destination AWS Region for the encrypted DB cluster snapshot to be copied to. To copy an encrypted DB cluster snapshot from another AWS Region, you must provide the following values:</p><ul><li><p><code>KmsKeyId</code> - The AWS Key Management System (AWS KMS) key identifier for the key to use to encrypt the copy of the DB cluster snapshot in the destination AWS Region.</p></li><li><p><code>PreSignedUrl</code> - A URL that contains a Signature Version 4 signed request for the <code>CopyDBClusterSnapshot</code> action to be called in the source AWS Region where the DB cluster snapshot is copied from. The pre-signed URL must be a valid request for the <code>CopyDBClusterSnapshot</code> API action that can be executed in the source AWS Region that contains the encrypted DB cluster snapshot to be copied.</p><p>The pre-signed URL request must contain the following parameter values:</p><ul><li><p><code>KmsKeyId</code> - The KMS key identifier for the key to use to encrypt the copy of the DB cluster snapshot in the destination AWS Region. This is the same identifier for both the <code>CopyDBClusterSnapshot</code> action that is called in the destination AWS Region, and the action contained in the pre-signed URL.</p></li><li><p><code>DestinationRegion</code> - The name of the AWS Region that the DB cluster snapshot is to be created in.</p></li><li><p><code>SourceDBClusterSnapshotIdentifier</code> - The DB cluster snapshot identifier for the encrypted DB cluster snapshot to be copied. This identifier must be in the Amazon Resource Name (ARN) format for the source AWS Region. For example, if you are copying an encrypted DB cluster snapshot from the us-west-2 AWS Region, then your <code>SourceDBClusterSnapshotIdentifier</code> looks like the following example: <code>arn:aws:rds:us-west-2:123456789012:cluster-snapshot:aurora-cluster1-snapshot-20161115</code>.</p></li></ul><p>To learn how to generate a Signature Version 4 signed request, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html"> Authenticating Requests: Using Query Parameters (AWS Signature Version 4)</a> and <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html"> Signature Version 4 Signing Process</a>.</p><note><p>If you are using an AWS SDK tool or the AWS CLI, you can specify <code>SourceRegion</code> (or <code>--source-region</code> for the AWS CLI) instead of specifying <code>PreSignedUrl</code> manually. Specifying <code>SourceRegion</code> autogenerates a pre-signed URL that is a valid request for the operation that can be executed in the source AWS Region.</p></note></li><li><p><code>TargetDBClusterSnapshotIdentifier</code> - The identifier for the new copy of the DB cluster snapshot in the destination AWS Region.</p></li><li><p><code>SourceDBClusterSnapshotIdentifier</code> - The DB cluster snapshot identifier for the encrypted DB cluster snapshot to be copied. This identifier must be in the ARN format for the source AWS Region and is the same value as the <code>SourceDBClusterSnapshotIdentifier</code> in the pre-signed URL. </p></li></ul><p>To cancel the copy operation once it is in progress, delete the target DB cluster snapshot identified by <code>TargetDBClusterSnapshotIdentifier</code> while that DB cluster snapshot is in "copying" status.</p><p>For more information on copying encrypted DB cluster snapshots from one AWS Region to another, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_CopySnapshot.html"> Copying a Snapshot</a> in the <i>Amazon Aurora User Guide.</i></p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CopyDBClusterSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsReplicateDBClusterSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterSnapshotAlreadyExists`, `AWSRdsErrorDBClusterSnapshotNotFound`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidDBClusterSnapshotState`, `AWSRdsErrorSnapshotQuotaExceeded`, `AWSRdsErrorKMSKeyNotAccessible`.
 
 @see AWSRdsReplicateDBClusterSnapshotMessage
 @see AWSRdsReplicateDBClusterSnapshotResult
 */
- (AWSTask<AWSRdsReplicateDBClusterSnapshotResult *> *)replicateDBClusterSnapshot:(AWSRdsReplicateDBClusterSnapshotMessage *)request;

/**
 <p>Copies a snapshot of a DB cluster.</p><p>To copy a DB cluster snapshot from a shared manual DB cluster snapshot, <code>SourceDBClusterSnapshotIdentifier</code> must be the Amazon Resource Name (ARN) of the shared DB cluster snapshot.</p><p>You can copy an encrypted DB cluster snapshot from another AWS Region. In that case, the AWS Region where you call the <code>CopyDBClusterSnapshot</code> action is the destination AWS Region for the encrypted DB cluster snapshot to be copied to. To copy an encrypted DB cluster snapshot from another AWS Region, you must provide the following values:</p><ul><li><p><code>KmsKeyId</code> - The AWS Key Management System (AWS KMS) key identifier for the key to use to encrypt the copy of the DB cluster snapshot in the destination AWS Region.</p></li><li><p><code>PreSignedUrl</code> - A URL that contains a Signature Version 4 signed request for the <code>CopyDBClusterSnapshot</code> action to be called in the source AWS Region where the DB cluster snapshot is copied from. The pre-signed URL must be a valid request for the <code>CopyDBClusterSnapshot</code> API action that can be executed in the source AWS Region that contains the encrypted DB cluster snapshot to be copied.</p><p>The pre-signed URL request must contain the following parameter values:</p><ul><li><p><code>KmsKeyId</code> - The KMS key identifier for the key to use to encrypt the copy of the DB cluster snapshot in the destination AWS Region. This is the same identifier for both the <code>CopyDBClusterSnapshot</code> action that is called in the destination AWS Region, and the action contained in the pre-signed URL.</p></li><li><p><code>DestinationRegion</code> - The name of the AWS Region that the DB cluster snapshot is to be created in.</p></li><li><p><code>SourceDBClusterSnapshotIdentifier</code> - The DB cluster snapshot identifier for the encrypted DB cluster snapshot to be copied. This identifier must be in the Amazon Resource Name (ARN) format for the source AWS Region. For example, if you are copying an encrypted DB cluster snapshot from the us-west-2 AWS Region, then your <code>SourceDBClusterSnapshotIdentifier</code> looks like the following example: <code>arn:aws:rds:us-west-2:123456789012:cluster-snapshot:aurora-cluster1-snapshot-20161115</code>.</p></li></ul><p>To learn how to generate a Signature Version 4 signed request, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html"> Authenticating Requests: Using Query Parameters (AWS Signature Version 4)</a> and <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html"> Signature Version 4 Signing Process</a>.</p><note><p>If you are using an AWS SDK tool or the AWS CLI, you can specify <code>SourceRegion</code> (or <code>--source-region</code> for the AWS CLI) instead of specifying <code>PreSignedUrl</code> manually. Specifying <code>SourceRegion</code> autogenerates a pre-signed URL that is a valid request for the operation that can be executed in the source AWS Region.</p></note></li><li><p><code>TargetDBClusterSnapshotIdentifier</code> - The identifier for the new copy of the DB cluster snapshot in the destination AWS Region.</p></li><li><p><code>SourceDBClusterSnapshotIdentifier</code> - The DB cluster snapshot identifier for the encrypted DB cluster snapshot to be copied. This identifier must be in the ARN format for the source AWS Region and is the same value as the <code>SourceDBClusterSnapshotIdentifier</code> in the pre-signed URL. </p></li></ul><p>To cancel the copy operation once it is in progress, delete the target DB cluster snapshot identified by <code>TargetDBClusterSnapshotIdentifier</code> while that DB cluster snapshot is in "copying" status.</p><p>For more information on copying encrypted DB cluster snapshots from one AWS Region to another, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_CopySnapshot.html"> Copying a Snapshot</a> in the <i>Amazon Aurora User Guide.</i></p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CopyDBClusterSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterSnapshotAlreadyExists`, `AWSRdsErrorDBClusterSnapshotNotFound`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidDBClusterSnapshotState`, `AWSRdsErrorSnapshotQuotaExceeded`, `AWSRdsErrorKMSKeyNotAccessible`.
 
 @see AWSRdsReplicateDBClusterSnapshotMessage
 @see AWSRdsReplicateDBClusterSnapshotResult
 */
- (void)replicateDBClusterSnapshot:(AWSRdsReplicateDBClusterSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsReplicateDBClusterSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Copies the specified DB parameter group.</p>
 
 @param request A container for the necessary parameters to execute the CopyDBParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsReplicateDBParameterGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBParameterGroupNotFound`, `AWSRdsErrorDBParameterGroupAlreadyExists`, `AWSRdsErrorDBParameterGroupQuotaExceeded`.
 
 @see AWSRdsReplicateDBParameterGroupMessage
 @see AWSRdsReplicateDBParameterGroupResult
 */
- (AWSTask<AWSRdsReplicateDBParameterGroupResult *> *)replicateDBParameterGroup:(AWSRdsReplicateDBParameterGroupMessage *)request;

/**
 <p>Copies the specified DB parameter group.</p>
 
 @param request A container for the necessary parameters to execute the CopyDBParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBParameterGroupNotFound`, `AWSRdsErrorDBParameterGroupAlreadyExists`, `AWSRdsErrorDBParameterGroupQuotaExceeded`.
 
 @see AWSRdsReplicateDBParameterGroupMessage
 @see AWSRdsReplicateDBParameterGroupResult
 */
- (void)replicateDBParameterGroup:(AWSRdsReplicateDBParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsReplicateDBParameterGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Copies the specified DB snapshot. The source DB snapshot must be in the "available" state.</p><p>You can copy a snapshot from one AWS Region to another. In that case, the AWS Region where you call the <code>CopyDBSnapshot</code> action is the destination AWS Region for the DB snapshot copy. </p><p>For more information about copying snapshots, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_CopySnapshot.html#USER_CopyDBSnapshot">Copying a DB Snapshot</a> in the <i>Amazon RDS User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the CopyDBSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsReplicateDBSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSnapshotAlreadyExists`, `AWSRdsErrorDBSnapshotNotFound`, `AWSRdsErrorInvalidDBSnapshotState`, `AWSRdsErrorSnapshotQuotaExceeded`, `AWSRdsErrorKMSKeyNotAccessible`.
 
 @see AWSRdsReplicateDBSnapshotMessage
 @see AWSRdsReplicateDBSnapshotResult
 */
- (AWSTask<AWSRdsReplicateDBSnapshotResult *> *)replicateDBSnapshot:(AWSRdsReplicateDBSnapshotMessage *)request;

/**
 <p>Copies the specified DB snapshot. The source DB snapshot must be in the "available" state.</p><p>You can copy a snapshot from one AWS Region to another. In that case, the AWS Region where you call the <code>CopyDBSnapshot</code> action is the destination AWS Region for the DB snapshot copy. </p><p>For more information about copying snapshots, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_CopySnapshot.html#USER_CopyDBSnapshot">Copying a DB Snapshot</a> in the <i>Amazon RDS User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the CopyDBSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSnapshotAlreadyExists`, `AWSRdsErrorDBSnapshotNotFound`, `AWSRdsErrorInvalidDBSnapshotState`, `AWSRdsErrorSnapshotQuotaExceeded`, `AWSRdsErrorKMSKeyNotAccessible`.
 
 @see AWSRdsReplicateDBSnapshotMessage
 @see AWSRdsReplicateDBSnapshotResult
 */
- (void)replicateDBSnapshot:(AWSRdsReplicateDBSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsReplicateDBSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Copies the specified option group.</p>
 
 @param request A container for the necessary parameters to execute the CopyOptionGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsReplicateOptionGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorOptionGroupAlreadyExists`, `AWSRdsErrorOptionGroupNotFound`, `AWSRdsErrorOptionGroupQuotaExceeded`.
 
 @see AWSRdsReplicateOptionGroupMessage
 @see AWSRdsReplicateOptionGroupResult
 */
- (AWSTask<AWSRdsReplicateOptionGroupResult *> *)replicateOptionGroup:(AWSRdsReplicateOptionGroupMessage *)request;

/**
 <p>Copies the specified option group.</p>
 
 @param request A container for the necessary parameters to execute the CopyOptionGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorOptionGroupAlreadyExists`, `AWSRdsErrorOptionGroupNotFound`, `AWSRdsErrorOptionGroupQuotaExceeded`.
 
 @see AWSRdsReplicateOptionGroupMessage
 @see AWSRdsReplicateOptionGroupResult
 */
- (void)replicateOptionGroup:(AWSRdsReplicateOptionGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsReplicateOptionGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a custom Availability Zone (AZ).</p><p>A custom AZ is an on-premises AZ that is integrated with a VMware vSphere cluster.</p><p>For more information about RDS on VMware, see the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html"><i>RDS on VMware User Guide.</i></a></p>
 
 @param request A container for the necessary parameters to execute the CreateCustomAvailabilityZone service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsCreateCustomAvailabilityZoneResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorCustomAvailabilityZoneAlreadyExists`, `AWSRdsErrorCustomAvailabilityZoneQuotaExceeded`, `AWSRdsErrorKMSKeyNotAccessible`.
 
 @see AWSRdsCreateCustomAvailabilityZoneMessage
 @see AWSRdsCreateCustomAvailabilityZoneResult
 */
- (AWSTask<AWSRdsCreateCustomAvailabilityZoneResult *> *)createCustomAvailabilityZone:(AWSRdsCreateCustomAvailabilityZoneMessage *)request;

/**
 <p>Creates a custom Availability Zone (AZ).</p><p>A custom AZ is an on-premises AZ that is integrated with a VMware vSphere cluster.</p><p>For more information about RDS on VMware, see the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html"><i>RDS on VMware User Guide.</i></a></p>
 
 @param request A container for the necessary parameters to execute the CreateCustomAvailabilityZone service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorCustomAvailabilityZoneAlreadyExists`, `AWSRdsErrorCustomAvailabilityZoneQuotaExceeded`, `AWSRdsErrorKMSKeyNotAccessible`.
 
 @see AWSRdsCreateCustomAvailabilityZoneMessage
 @see AWSRdsCreateCustomAvailabilityZoneResult
 */
- (void)createCustomAvailabilityZone:(AWSRdsCreateCustomAvailabilityZoneMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsCreateCustomAvailabilityZoneResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new Amazon Aurora DB cluster.</p><p>You can use the <code>ReplicationSourceIdentifier</code> parameter to create the DB cluster as a read replica of another DB cluster or Amazon RDS MySQL DB instance. For cross-region replication where the DB cluster identified by <code>ReplicationSourceIdentifier</code> is encrypted, you must also specify the <code>PreSignedUrl</code> parameter.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateDBCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsCreateDBClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterAlreadyExists`, `AWSRdsErrorInsufficientStorageClusterCapacity`, `AWSRdsErrorDBClusterQuotaExceeded`, `AWSRdsErrorStorageQuotaExceeded`, `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorInvalidVPCNetworkState`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidDBSubnetGroupState`, `AWSRdsErrorInvalidSubnet`, `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorDBClusterParameterGroupNotFound`, `AWSRdsErrorKMSKeyNotAccessible`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSRdsErrorGlobalClusterNotFound`, `AWSRdsErrorInvalidGlobalClusterState`, `AWSRdsErrorDomainNotFound`.
 
 @see AWSRdsCreateDBClusterMessage
 @see AWSRdsCreateDBClusterResult
 */
- (AWSTask<AWSRdsCreateDBClusterResult *> *)createDBCluster:(AWSRdsCreateDBClusterMessage *)request;

/**
 <p>Creates a new Amazon Aurora DB cluster.</p><p>You can use the <code>ReplicationSourceIdentifier</code> parameter to create the DB cluster as a read replica of another DB cluster or Amazon RDS MySQL DB instance. For cross-region replication where the DB cluster identified by <code>ReplicationSourceIdentifier</code> is encrypted, you must also specify the <code>PreSignedUrl</code> parameter.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateDBCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterAlreadyExists`, `AWSRdsErrorInsufficientStorageClusterCapacity`, `AWSRdsErrorDBClusterQuotaExceeded`, `AWSRdsErrorStorageQuotaExceeded`, `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorInvalidVPCNetworkState`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidDBSubnetGroupState`, `AWSRdsErrorInvalidSubnet`, `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorDBClusterParameterGroupNotFound`, `AWSRdsErrorKMSKeyNotAccessible`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSRdsErrorGlobalClusterNotFound`, `AWSRdsErrorInvalidGlobalClusterState`, `AWSRdsErrorDomainNotFound`.
 
 @see AWSRdsCreateDBClusterMessage
 @see AWSRdsCreateDBClusterResult
 */
- (void)createDBCluster:(AWSRdsCreateDBClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsCreateDBClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new custom endpoint and associates it with an Amazon Aurora DB cluster.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateDBClusterEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDBClusterEndpoint`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterEndpointQuotaExceeded`, `AWSRdsErrorDBClusterEndpointAlreadyExists`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorInvalidDBInstanceState`.
 
 @see AWSRdsCreateDBClusterEndpointMessage
 @see AWSRdsDBClusterEndpoint
 */
- (AWSTask<AWSRdsDBClusterEndpoint *> *)createDBClusterEndpoint:(AWSRdsCreateDBClusterEndpointMessage *)request;

/**
 <p>Creates a new custom endpoint and associates it with an Amazon Aurora DB cluster.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateDBClusterEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterEndpointQuotaExceeded`, `AWSRdsErrorDBClusterEndpointAlreadyExists`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorInvalidDBInstanceState`.
 
 @see AWSRdsCreateDBClusterEndpointMessage
 @see AWSRdsDBClusterEndpoint
 */
- (void)createDBClusterEndpoint:(AWSRdsCreateDBClusterEndpointMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDBClusterEndpoint * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new DB cluster parameter group.</p><p>Parameters in a DB cluster parameter group apply to all of the instances in a DB cluster.</p><p> A DB cluster parameter group is initially created with the default parameters for the database engine used by instances in the DB cluster. To provide custom values for any of the parameters, you must modify the group after creating it using <code>ModifyDBClusterParameterGroup</code>. Once you've created a DB cluster parameter group, you need to associate it with your DB cluster using <code>ModifyDBCluster</code>. When you associate a new DB cluster parameter group with a running DB cluster, you need to reboot the DB instances in the DB cluster without failover for the new DB cluster parameter group and associated settings to take effect. </p><important><p>After you create a DB cluster parameter group, you should wait at least 5 minutes before creating your first DB cluster that uses that DB cluster parameter group as the default parameter group. This allows Amazon RDS to fully complete the create action before the DB cluster parameter group is used as the default for a new DB cluster. This is especially important for parameters that are critical when creating the default database for a DB cluster, such as the character set for the default database defined by the <code>character_set_database</code> parameter. You can use the <i>Parameter Groups</i> option of the <a href="https://console.aws.amazon.com/rds/">Amazon RDS console</a> or the <code>DescribeDBClusterParameters</code> action to verify that your DB cluster parameter group has been created or modified.</p></important><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateDBClusterParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsCreateDBClusterParameterGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBParameterGroupQuotaExceeded`, `AWSRdsErrorDBParameterGroupAlreadyExists`.
 
 @see AWSRdsCreateDBClusterParameterGroupMessage
 @see AWSRdsCreateDBClusterParameterGroupResult
 */
- (AWSTask<AWSRdsCreateDBClusterParameterGroupResult *> *)createDBClusterParameterGroup:(AWSRdsCreateDBClusterParameterGroupMessage *)request;

/**
 <p>Creates a new DB cluster parameter group.</p><p>Parameters in a DB cluster parameter group apply to all of the instances in a DB cluster.</p><p> A DB cluster parameter group is initially created with the default parameters for the database engine used by instances in the DB cluster. To provide custom values for any of the parameters, you must modify the group after creating it using <code>ModifyDBClusterParameterGroup</code>. Once you've created a DB cluster parameter group, you need to associate it with your DB cluster using <code>ModifyDBCluster</code>. When you associate a new DB cluster parameter group with a running DB cluster, you need to reboot the DB instances in the DB cluster without failover for the new DB cluster parameter group and associated settings to take effect. </p><important><p>After you create a DB cluster parameter group, you should wait at least 5 minutes before creating your first DB cluster that uses that DB cluster parameter group as the default parameter group. This allows Amazon RDS to fully complete the create action before the DB cluster parameter group is used as the default for a new DB cluster. This is especially important for parameters that are critical when creating the default database for a DB cluster, such as the character set for the default database defined by the <code>character_set_database</code> parameter. You can use the <i>Parameter Groups</i> option of the <a href="https://console.aws.amazon.com/rds/">Amazon RDS console</a> or the <code>DescribeDBClusterParameters</code> action to verify that your DB cluster parameter group has been created or modified.</p></important><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateDBClusterParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBParameterGroupQuotaExceeded`, `AWSRdsErrorDBParameterGroupAlreadyExists`.
 
 @see AWSRdsCreateDBClusterParameterGroupMessage
 @see AWSRdsCreateDBClusterParameterGroupResult
 */
- (void)createDBClusterParameterGroup:(AWSRdsCreateDBClusterParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsCreateDBClusterParameterGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a snapshot of a DB cluster. For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateDBClusterSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsCreateDBClusterSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterSnapshotAlreadyExists`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorSnapshotQuotaExceeded`, `AWSRdsErrorInvalidDBClusterSnapshotState`.
 
 @see AWSRdsCreateDBClusterSnapshotMessage
 @see AWSRdsCreateDBClusterSnapshotResult
 */
- (AWSTask<AWSRdsCreateDBClusterSnapshotResult *> *)createDBClusterSnapshot:(AWSRdsCreateDBClusterSnapshotMessage *)request;

/**
 <p>Creates a snapshot of a DB cluster. For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateDBClusterSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterSnapshotAlreadyExists`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorSnapshotQuotaExceeded`, `AWSRdsErrorInvalidDBClusterSnapshotState`.
 
 @see AWSRdsCreateDBClusterSnapshotMessage
 @see AWSRdsCreateDBClusterSnapshotResult
 */
- (void)createDBClusterSnapshot:(AWSRdsCreateDBClusterSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsCreateDBClusterSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new DB instance.</p>
 
 @param request A container for the necessary parameters to execute the CreateDBInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsCreateDBInstanceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceAlreadyExists`, `AWSRdsErrorInsufficientDBInstanceCapacity`, `AWSRdsErrorDBParameterGroupNotFound`, `AWSRdsErrorDBSecurityGroupNotFound`, `AWSRdsErrorInstanceQuotaExceeded`, `AWSRdsErrorStorageQuotaExceeded`, `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidSubnet`, `AWSRdsErrorInvalidVPCNetworkState`, `AWSRdsErrorProvisionedIopsNotAvailableInAZ`, `AWSRdsErrorOptionGroupNotFound`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorStorageTypeNotSupported`, `AWSRdsErrorAuthorizationNotFound`, `AWSRdsErrorKMSKeyNotAccessible`, `AWSRdsErrorDomainNotFound`, `AWSRdsErrorBackupPolicyNotFound`.
 
 @see AWSRdsCreateDBInstanceMessage
 @see AWSRdsCreateDBInstanceResult
 */
- (AWSTask<AWSRdsCreateDBInstanceResult *> *)createDBInstance:(AWSRdsCreateDBInstanceMessage *)request;

/**
 <p>Creates a new DB instance.</p>
 
 @param request A container for the necessary parameters to execute the CreateDBInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceAlreadyExists`, `AWSRdsErrorInsufficientDBInstanceCapacity`, `AWSRdsErrorDBParameterGroupNotFound`, `AWSRdsErrorDBSecurityGroupNotFound`, `AWSRdsErrorInstanceQuotaExceeded`, `AWSRdsErrorStorageQuotaExceeded`, `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidSubnet`, `AWSRdsErrorInvalidVPCNetworkState`, `AWSRdsErrorProvisionedIopsNotAvailableInAZ`, `AWSRdsErrorOptionGroupNotFound`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorStorageTypeNotSupported`, `AWSRdsErrorAuthorizationNotFound`, `AWSRdsErrorKMSKeyNotAccessible`, `AWSRdsErrorDomainNotFound`, `AWSRdsErrorBackupPolicyNotFound`.
 
 @see AWSRdsCreateDBInstanceMessage
 @see AWSRdsCreateDBInstanceResult
 */
- (void)createDBInstance:(AWSRdsCreateDBInstanceMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsCreateDBInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new DB instance that acts as a read replica for an existing source DB instance. You can create a read replica for a DB instance running MySQL, MariaDB, Oracle, PostgreSQL, or SQL Server. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReadRepl.html">Working with Read Replicas</a> in the <i>Amazon RDS User Guide</i>. </p><p>Amazon Aurora doesn't support this action. Call the <code>CreateDBInstance</code> action to create a DB instance for an Aurora DB cluster.</p><p>All read replica DB instances are created with backups disabled. All other DB instance attributes (including DB security groups and DB parameter groups) are inherited from the source DB instance, except as specified.</p><important><p>Your source DB instance must have backup retention enabled. </p></important>
 
 @param request A container for the necessary parameters to execute the CreateDBInstanceReadReplica service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsCreateDBInstanceReadReplicaResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceAlreadyExists`, `AWSRdsErrorInsufficientDBInstanceCapacity`, `AWSRdsErrorDBParameterGroupNotFound`, `AWSRdsErrorDBSecurityGroupNotFound`, `AWSRdsErrorInstanceQuotaExceeded`, `AWSRdsErrorStorageQuotaExceeded`, `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSRdsErrorInvalidSubnet`, `AWSRdsErrorInvalidVPCNetworkState`, `AWSRdsErrorProvisionedIopsNotAvailableInAZ`, `AWSRdsErrorOptionGroupNotFound`, `AWSRdsErrorDBSubnetGroupNotAllowed`, `AWSRdsErrorInvalidDBSubnetGroup`, `AWSRdsErrorStorageTypeNotSupported`, `AWSRdsErrorKMSKeyNotAccessible`, `AWSRdsErrorDomainNotFound`.
 
 @see AWSRdsCreateDBInstanceReadReplicaMessage
 @see AWSRdsCreateDBInstanceReadReplicaResult
 */
- (AWSTask<AWSRdsCreateDBInstanceReadReplicaResult *> *)createDBInstanceReadReplica:(AWSRdsCreateDBInstanceReadReplicaMessage *)request;

/**
 <p>Creates a new DB instance that acts as a read replica for an existing source DB instance. You can create a read replica for a DB instance running MySQL, MariaDB, Oracle, PostgreSQL, or SQL Server. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReadRepl.html">Working with Read Replicas</a> in the <i>Amazon RDS User Guide</i>. </p><p>Amazon Aurora doesn't support this action. Call the <code>CreateDBInstance</code> action to create a DB instance for an Aurora DB cluster.</p><p>All read replica DB instances are created with backups disabled. All other DB instance attributes (including DB security groups and DB parameter groups) are inherited from the source DB instance, except as specified.</p><important><p>Your source DB instance must have backup retention enabled. </p></important>
 
 @param request A container for the necessary parameters to execute the CreateDBInstanceReadReplica service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceAlreadyExists`, `AWSRdsErrorInsufficientDBInstanceCapacity`, `AWSRdsErrorDBParameterGroupNotFound`, `AWSRdsErrorDBSecurityGroupNotFound`, `AWSRdsErrorInstanceQuotaExceeded`, `AWSRdsErrorStorageQuotaExceeded`, `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSRdsErrorInvalidSubnet`, `AWSRdsErrorInvalidVPCNetworkState`, `AWSRdsErrorProvisionedIopsNotAvailableInAZ`, `AWSRdsErrorOptionGroupNotFound`, `AWSRdsErrorDBSubnetGroupNotAllowed`, `AWSRdsErrorInvalidDBSubnetGroup`, `AWSRdsErrorStorageTypeNotSupported`, `AWSRdsErrorKMSKeyNotAccessible`, `AWSRdsErrorDomainNotFound`.
 
 @see AWSRdsCreateDBInstanceReadReplicaMessage
 @see AWSRdsCreateDBInstanceReadReplicaResult
 */
- (void)createDBInstanceReadReplica:(AWSRdsCreateDBInstanceReadReplicaMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsCreateDBInstanceReadReplicaResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new DB parameter group.</p><p> A DB parameter group is initially created with the default parameters for the database engine used by the DB instance. To provide custom values for any of the parameters, you must modify the group after creating it using <i>ModifyDBParameterGroup</i>. Once you've created a DB parameter group, you need to associate it with your DB instance using <i>ModifyDBInstance</i>. When you associate a new DB parameter group with a running DB instance, you need to reboot the DB instance without failover for the new DB parameter group and associated settings to take effect. </p><important><p>After you create a DB parameter group, you should wait at least 5 minutes before creating your first DB instance that uses that DB parameter group as the default parameter group. This allows Amazon RDS to fully complete the create action before the parameter group is used as the default for a new DB instance. This is especially important for parameters that are critical when creating the default database for a DB instance, such as the character set for the default database defined by the <code>character_set_database</code> parameter. You can use the <i>Parameter Groups</i> option of the <a href="https://console.aws.amazon.com/rds/">Amazon RDS console</a> or the <i>DescribeDBParameters</i> command to verify that your DB parameter group has been created or modified.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateDBParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsCreateDBParameterGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBParameterGroupQuotaExceeded`, `AWSRdsErrorDBParameterGroupAlreadyExists`.
 
 @see AWSRdsCreateDBParameterGroupMessage
 @see AWSRdsCreateDBParameterGroupResult
 */
- (AWSTask<AWSRdsCreateDBParameterGroupResult *> *)createDBParameterGroup:(AWSRdsCreateDBParameterGroupMessage *)request;

/**
 <p>Creates a new DB parameter group.</p><p> A DB parameter group is initially created with the default parameters for the database engine used by the DB instance. To provide custom values for any of the parameters, you must modify the group after creating it using <i>ModifyDBParameterGroup</i>. Once you've created a DB parameter group, you need to associate it with your DB instance using <i>ModifyDBInstance</i>. When you associate a new DB parameter group with a running DB instance, you need to reboot the DB instance without failover for the new DB parameter group and associated settings to take effect. </p><important><p>After you create a DB parameter group, you should wait at least 5 minutes before creating your first DB instance that uses that DB parameter group as the default parameter group. This allows Amazon RDS to fully complete the create action before the parameter group is used as the default for a new DB instance. This is especially important for parameters that are critical when creating the default database for a DB instance, such as the character set for the default database defined by the <code>character_set_database</code> parameter. You can use the <i>Parameter Groups</i> option of the <a href="https://console.aws.amazon.com/rds/">Amazon RDS console</a> or the <i>DescribeDBParameters</i> command to verify that your DB parameter group has been created or modified.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateDBParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBParameterGroupQuotaExceeded`, `AWSRdsErrorDBParameterGroupAlreadyExists`.
 
 @see AWSRdsCreateDBParameterGroupMessage
 @see AWSRdsCreateDBParameterGroupResult
 */
- (void)createDBParameterGroup:(AWSRdsCreateDBParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsCreateDBParameterGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Creates a new DB proxy.</p>
 
 @param request A container for the necessary parameters to execute the CreateDBProxy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsCreateDBProxyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidSubnet`, `AWSRdsErrorDBProxyAlreadyExists`, `AWSRdsErrorDBProxyQuotaExceeded`.
 
 @see AWSRdsCreateDBProxyRequest
 @see AWSRdsCreateDBProxyResponse
 */
- (AWSTask<AWSRdsCreateDBProxyResponse *> *)createDBProxy:(AWSRdsCreateDBProxyRequest *)request;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Creates a new DB proxy.</p>
 
 @param request A container for the necessary parameters to execute the CreateDBProxy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidSubnet`, `AWSRdsErrorDBProxyAlreadyExists`, `AWSRdsErrorDBProxyQuotaExceeded`.
 
 @see AWSRdsCreateDBProxyRequest
 @see AWSRdsCreateDBProxyResponse
 */
- (void)createDBProxy:(AWSRdsCreateDBProxyRequest *)request completionHandler:(void (^ _Nullable)(AWSRdsCreateDBProxyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new DB security group. DB security groups control access to a DB instance.</p><note><p>A DB security group controls access to EC2-Classic DB instances that are not in a VPC.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateDBSecurityGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsCreateDBSecurityGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSecurityGroupAlreadyExists`, `AWSRdsErrorDBSecurityGroupQuotaExceeded`, `AWSRdsErrorDBSecurityGroupNotSupported`.
 
 @see AWSRdsCreateDBSecurityGroupMessage
 @see AWSRdsCreateDBSecurityGroupResult
 */
- (AWSTask<AWSRdsCreateDBSecurityGroupResult *> *)createDBSecurityGroup:(AWSRdsCreateDBSecurityGroupMessage *)request;

/**
 <p>Creates a new DB security group. DB security groups control access to a DB instance.</p><note><p>A DB security group controls access to EC2-Classic DB instances that are not in a VPC.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateDBSecurityGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSecurityGroupAlreadyExists`, `AWSRdsErrorDBSecurityGroupQuotaExceeded`, `AWSRdsErrorDBSecurityGroupNotSupported`.
 
 @see AWSRdsCreateDBSecurityGroupMessage
 @see AWSRdsCreateDBSecurityGroupResult
 */
- (void)createDBSecurityGroup:(AWSRdsCreateDBSecurityGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsCreateDBSecurityGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a DBSnapshot. The source DBInstance must be in "available" state.</p>
 
 @param request A container for the necessary parameters to execute the CreateDBSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsCreateDBSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSnapshotAlreadyExists`, `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorSnapshotQuotaExceeded`.
 
 @see AWSRdsCreateDBSnapshotMessage
 @see AWSRdsCreateDBSnapshotResult
 */
- (AWSTask<AWSRdsCreateDBSnapshotResult *> *)createDBSnapshot:(AWSRdsCreateDBSnapshotMessage *)request;

/**
 <p>Creates a DBSnapshot. The source DBInstance must be in "available" state.</p>
 
 @param request A container for the necessary parameters to execute the CreateDBSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSnapshotAlreadyExists`, `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorSnapshotQuotaExceeded`.
 
 @see AWSRdsCreateDBSnapshotMessage
 @see AWSRdsCreateDBSnapshotResult
 */
- (void)createDBSnapshot:(AWSRdsCreateDBSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsCreateDBSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new DB subnet group. DB subnet groups must contain at least one subnet in at least two AZs in the AWS Region.</p>
 
 @param request A container for the necessary parameters to execute the CreateDBSubnetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsCreateDBSubnetGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSubnetGroupAlreadyExists`, `AWSRdsErrorDBSubnetGroupQuotaExceeded`, `AWSRdsErrorDBSubnetQuotaExceeded`, `AWSRdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSRdsErrorInvalidSubnet`.
 
 @see AWSRdsCreateDBSubnetGroupMessage
 @see AWSRdsCreateDBSubnetGroupResult
 */
- (AWSTask<AWSRdsCreateDBSubnetGroupResult *> *)createDBSubnetGroup:(AWSRdsCreateDBSubnetGroupMessage *)request;

/**
 <p>Creates a new DB subnet group. DB subnet groups must contain at least one subnet in at least two AZs in the AWS Region.</p>
 
 @param request A container for the necessary parameters to execute the CreateDBSubnetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSubnetGroupAlreadyExists`, `AWSRdsErrorDBSubnetGroupQuotaExceeded`, `AWSRdsErrorDBSubnetQuotaExceeded`, `AWSRdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSRdsErrorInvalidSubnet`.
 
 @see AWSRdsCreateDBSubnetGroupMessage
 @see AWSRdsCreateDBSubnetGroupResult
 */
- (void)createDBSubnetGroup:(AWSRdsCreateDBSubnetGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsCreateDBSubnetGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an RDS event notification subscription. This action requires a topic Amazon Resource Name (ARN) created by either the RDS console, the SNS console, or the SNS API. To obtain an ARN with SNS, you must create a topic in Amazon SNS and subscribe to the topic. The ARN is displayed in the SNS console.</p><p>You can specify the type of source (SourceType) you want to be notified of, provide a list of RDS sources (SourceIds) that triggers the events, and provide a list of event categories (EventCategories) for events you want to be notified of. For example, you can specify SourceType = db-instance, SourceIds = mydbinstance1, mydbinstance2 and EventCategories = Availability, Backup.</p><p>If you specify both the SourceType and SourceIds, such as SourceType = db-instance and SourceIdentifier = myDBInstance1, you are notified of all the db-instance events for the specified source. If you specify a SourceType but do not specify a SourceIdentifier, you receive notice of the events for that source type for all your RDS sources. If you don't specify either the SourceType or the SourceIdentifier, you are notified of events generated from all RDS sources belonging to your customer account.</p><note><p>RDS event notification is only available for unencrypted SNS topics. If you specify an encrypted SNS topic, event notifications aren't sent for the topic.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateEventSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsCreateEventSubscriptionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorEventSubscriptionQuotaExceeded`, `AWSRdsErrorSubscriptionAlreadyExist`, `AWSRdsErrorSNSInvalidTopic`, `AWSRdsErrorSNSNoAuthorization`, `AWSRdsErrorSNSTopicArnNotFound`, `AWSRdsErrorSubscriptionCategoryNotFound`, `AWSRdsErrorSourceNotFound`.
 
 @see AWSRdsCreateEventSubscriptionMessage
 @see AWSRdsCreateEventSubscriptionResult
 */
- (AWSTask<AWSRdsCreateEventSubscriptionResult *> *)createEventSubscription:(AWSRdsCreateEventSubscriptionMessage *)request;

/**
 <p>Creates an RDS event notification subscription. This action requires a topic Amazon Resource Name (ARN) created by either the RDS console, the SNS console, or the SNS API. To obtain an ARN with SNS, you must create a topic in Amazon SNS and subscribe to the topic. The ARN is displayed in the SNS console.</p><p>You can specify the type of source (SourceType) you want to be notified of, provide a list of RDS sources (SourceIds) that triggers the events, and provide a list of event categories (EventCategories) for events you want to be notified of. For example, you can specify SourceType = db-instance, SourceIds = mydbinstance1, mydbinstance2 and EventCategories = Availability, Backup.</p><p>If you specify both the SourceType and SourceIds, such as SourceType = db-instance and SourceIdentifier = myDBInstance1, you are notified of all the db-instance events for the specified source. If you specify a SourceType but do not specify a SourceIdentifier, you receive notice of the events for that source type for all your RDS sources. If you don't specify either the SourceType or the SourceIdentifier, you are notified of events generated from all RDS sources belonging to your customer account.</p><note><p>RDS event notification is only available for unencrypted SNS topics. If you specify an encrypted SNS topic, event notifications aren't sent for the topic.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateEventSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorEventSubscriptionQuotaExceeded`, `AWSRdsErrorSubscriptionAlreadyExist`, `AWSRdsErrorSNSInvalidTopic`, `AWSRdsErrorSNSNoAuthorization`, `AWSRdsErrorSNSTopicArnNotFound`, `AWSRdsErrorSubscriptionCategoryNotFound`, `AWSRdsErrorSourceNotFound`.
 
 @see AWSRdsCreateEventSubscriptionMessage
 @see AWSRdsCreateEventSubscriptionResult
 */
- (void)createEventSubscription:(AWSRdsCreateEventSubscriptionMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsCreateEventSubscriptionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Creates an Aurora global database spread across multiple regions. The global database contains a single primary cluster with read-write capability, and a read-only secondary cluster that receives data from the primary cluster through high-speed replication performed by the Aurora storage subsystem. </p><p> You can create a global database that is initially empty, and then add a primary cluster and a secondary cluster to it. Or you can specify an existing Aurora cluster during the create operation, and this cluster becomes the primary cluster of the global database. </p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateGlobalCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsCreateGlobalClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorGlobalClusterAlreadyExists`, `AWSRdsErrorGlobalClusterQuotaExceeded`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorDBClusterNotFound`.
 
 @see AWSRdsCreateGlobalClusterMessage
 @see AWSRdsCreateGlobalClusterResult
 */
- (AWSTask<AWSRdsCreateGlobalClusterResult *> *)createGlobalCluster:(AWSRdsCreateGlobalClusterMessage *)request;

/**
 <p> Creates an Aurora global database spread across multiple regions. The global database contains a single primary cluster with read-write capability, and a read-only secondary cluster that receives data from the primary cluster through high-speed replication performed by the Aurora storage subsystem. </p><p> You can create a global database that is initially empty, and then add a primary cluster and a secondary cluster to it. Or you can specify an existing Aurora cluster during the create operation, and this cluster becomes the primary cluster of the global database. </p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateGlobalCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorGlobalClusterAlreadyExists`, `AWSRdsErrorGlobalClusterQuotaExceeded`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorDBClusterNotFound`.
 
 @see AWSRdsCreateGlobalClusterMessage
 @see AWSRdsCreateGlobalClusterResult
 */
- (void)createGlobalCluster:(AWSRdsCreateGlobalClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsCreateGlobalClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new option group. You can create up to 20 option groups.</p>
 
 @param request A container for the necessary parameters to execute the CreateOptionGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsCreateOptionGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorOptionGroupAlreadyExists`, `AWSRdsErrorOptionGroupQuotaExceeded`.
 
 @see AWSRdsCreateOptionGroupMessage
 @see AWSRdsCreateOptionGroupResult
 */
- (AWSTask<AWSRdsCreateOptionGroupResult *> *)createOptionGroup:(AWSRdsCreateOptionGroupMessage *)request;

/**
 <p>Creates a new option group. You can create up to 20 option groups.</p>
 
 @param request A container for the necessary parameters to execute the CreateOptionGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorOptionGroupAlreadyExists`, `AWSRdsErrorOptionGroupQuotaExceeded`.
 
 @see AWSRdsCreateOptionGroupMessage
 @see AWSRdsCreateOptionGroupResult
 */
- (void)createOptionGroup:(AWSRdsCreateOptionGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsCreateOptionGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a custom Availability Zone (AZ).</p><p>A custom AZ is an on-premises AZ that is integrated with a VMware vSphere cluster.</p><p>For more information about RDS on VMware, see the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html"><i>RDS on VMware User Guide.</i></a></p>
 
 @param request A container for the necessary parameters to execute the DeleteCustomAvailabilityZone service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDeleteCustomAvailabilityZoneResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorCustomAvailabilityZoneNotFound`, `AWSRdsErrorKMSKeyNotAccessible`.
 
 @see AWSRdsDeleteCustomAvailabilityZoneMessage
 @see AWSRdsDeleteCustomAvailabilityZoneResult
 */
- (AWSTask<AWSRdsDeleteCustomAvailabilityZoneResult *> *)deleteCustomAvailabilityZone:(AWSRdsDeleteCustomAvailabilityZoneMessage *)request;

/**
 <p>Deletes a custom Availability Zone (AZ).</p><p>A custom AZ is an on-premises AZ that is integrated with a VMware vSphere cluster.</p><p>For more information about RDS on VMware, see the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html"><i>RDS on VMware User Guide.</i></a></p>
 
 @param request A container for the necessary parameters to execute the DeleteCustomAvailabilityZone service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorCustomAvailabilityZoneNotFound`, `AWSRdsErrorKMSKeyNotAccessible`.
 
 @see AWSRdsDeleteCustomAvailabilityZoneMessage
 @see AWSRdsDeleteCustomAvailabilityZoneResult
 */
- (void)deleteCustomAvailabilityZone:(AWSRdsDeleteCustomAvailabilityZoneMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDeleteCustomAvailabilityZoneResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>The DeleteDBCluster action deletes a previously provisioned DB cluster. When you delete a DB cluster, all automated backups for that DB cluster are deleted and can't be recovered. Manual DB cluster snapshots of the specified DB cluster are not deleted.</p><p/><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDeleteDBClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorDBClusterSnapshotAlreadyExists`, `AWSRdsErrorSnapshotQuotaExceeded`, `AWSRdsErrorInvalidDBClusterSnapshotState`.
 
 @see AWSRdsDeleteDBClusterMessage
 @see AWSRdsDeleteDBClusterResult
 */
- (AWSTask<AWSRdsDeleteDBClusterResult *> *)deleteDBCluster:(AWSRdsDeleteDBClusterMessage *)request;

/**
 <p>The DeleteDBCluster action deletes a previously provisioned DB cluster. When you delete a DB cluster, all automated backups for that DB cluster are deleted and can't be recovered. Manual DB cluster snapshots of the specified DB cluster are not deleted.</p><p/><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorDBClusterSnapshotAlreadyExists`, `AWSRdsErrorSnapshotQuotaExceeded`, `AWSRdsErrorInvalidDBClusterSnapshotState`.
 
 @see AWSRdsDeleteDBClusterMessage
 @see AWSRdsDeleteDBClusterResult
 */
- (void)deleteDBCluster:(AWSRdsDeleteDBClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDeleteDBClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a custom endpoint and removes it from an Amazon Aurora DB cluster.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBClusterEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDBClusterEndpoint`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBClusterEndpointState`, `AWSRdsErrorDBClusterEndpointNotFound`, `AWSRdsErrorInvalidDBClusterState`.
 
 @see AWSRdsDeleteDBClusterEndpointMessage
 @see AWSRdsDBClusterEndpoint
 */
- (AWSTask<AWSRdsDBClusterEndpoint *> *)deleteDBClusterEndpoint:(AWSRdsDeleteDBClusterEndpointMessage *)request;

/**
 <p>Deletes a custom endpoint and removes it from an Amazon Aurora DB cluster.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBClusterEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBClusterEndpointState`, `AWSRdsErrorDBClusterEndpointNotFound`, `AWSRdsErrorInvalidDBClusterState`.
 
 @see AWSRdsDeleteDBClusterEndpointMessage
 @see AWSRdsDBClusterEndpoint
 */
- (void)deleteDBClusterEndpoint:(AWSRdsDeleteDBClusterEndpointMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDBClusterEndpoint * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified DB cluster parameter group. The DB cluster parameter group to be deleted can't be associated with any DB clusters.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBClusterParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBParameterGroupState`, `AWSRdsErrorDBParameterGroupNotFound`.
 
 @see AWSRdsDeleteDBClusterParameterGroupMessage
 */
- (AWSTask *)deleteDBClusterParameterGroup:(AWSRdsDeleteDBClusterParameterGroupMessage *)request;

/**
 <p>Deletes a specified DB cluster parameter group. The DB cluster parameter group to be deleted can't be associated with any DB clusters.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBClusterParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBParameterGroupState`, `AWSRdsErrorDBParameterGroupNotFound`.
 
 @see AWSRdsDeleteDBClusterParameterGroupMessage
 */
- (void)deleteDBClusterParameterGroup:(AWSRdsDeleteDBClusterParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a DB cluster snapshot. If the snapshot is being copied, the copy operation is terminated.</p><note><p>The DB cluster snapshot must be in the <code>available</code> state to be deleted.</p></note><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBClusterSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDeleteDBClusterSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBClusterSnapshotState`, `AWSRdsErrorDBClusterSnapshotNotFound`.
 
 @see AWSRdsDeleteDBClusterSnapshotMessage
 @see AWSRdsDeleteDBClusterSnapshotResult
 */
- (AWSTask<AWSRdsDeleteDBClusterSnapshotResult *> *)deleteDBClusterSnapshot:(AWSRdsDeleteDBClusterSnapshotMessage *)request;

/**
 <p>Deletes a DB cluster snapshot. If the snapshot is being copied, the copy operation is terminated.</p><note><p>The DB cluster snapshot must be in the <code>available</code> state to be deleted.</p></note><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBClusterSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBClusterSnapshotState`, `AWSRdsErrorDBClusterSnapshotNotFound`.
 
 @see AWSRdsDeleteDBClusterSnapshotMessage
 @see AWSRdsDeleteDBClusterSnapshotResult
 */
- (void)deleteDBClusterSnapshot:(AWSRdsDeleteDBClusterSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDeleteDBClusterSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>The DeleteDBInstance action deletes a previously provisioned DB instance. When you delete a DB instance, all automated backups for that instance are deleted and can't be recovered. Manual DB snapshots of the DB instance to be deleted by <code>DeleteDBInstance</code> are not deleted.</p><p> If you request a final DB snapshot the status of the Amazon RDS DB instance is <code>deleting</code> until the DB snapshot is created. The API action <code>DescribeDBInstance</code> is used to monitor the status of this operation. The action can't be canceled or reverted once submitted. </p><p>When a DB instance is in a failure state and has a status of <code>failed</code>, <code>incompatible-restore</code>, or <code>incompatible-network</code>, you can only delete it when you skip creation of the final snapshot with the <code>SkipFinalSnapshot</code> parameter.</p><p>If the specified DB instance is part of an Amazon Aurora DB cluster, you can't delete the DB instance if both of the following conditions are true:</p><ul><li><p>The DB cluster is a read replica of another Amazon Aurora DB cluster.</p></li><li><p>The DB instance is the only instance in the DB cluster.</p></li></ul><p>To delete a DB instance in this case, first call the <code>PromoteReadReplicaDBCluster</code> API action to promote the DB cluster so it's no longer a read replica. After the promotion completes, then call the <code>DeleteDBInstance</code> API action to delete the final instance in the DB cluster.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDBInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDeleteDBInstanceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorDBSnapshotAlreadyExists`, `AWSRdsErrorSnapshotQuotaExceeded`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorDBInstanceAutomatedBackupQuotaExceeded`.
 
 @see AWSRdsDeleteDBInstanceMessage
 @see AWSRdsDeleteDBInstanceResult
 */
- (AWSTask<AWSRdsDeleteDBInstanceResult *> *)deleteDBInstance:(AWSRdsDeleteDBInstanceMessage *)request;

/**
 <p>The DeleteDBInstance action deletes a previously provisioned DB instance. When you delete a DB instance, all automated backups for that instance are deleted and can't be recovered. Manual DB snapshots of the DB instance to be deleted by <code>DeleteDBInstance</code> are not deleted.</p><p> If you request a final DB snapshot the status of the Amazon RDS DB instance is <code>deleting</code> until the DB snapshot is created. The API action <code>DescribeDBInstance</code> is used to monitor the status of this operation. The action can't be canceled or reverted once submitted. </p><p>When a DB instance is in a failure state and has a status of <code>failed</code>, <code>incompatible-restore</code>, or <code>incompatible-network</code>, you can only delete it when you skip creation of the final snapshot with the <code>SkipFinalSnapshot</code> parameter.</p><p>If the specified DB instance is part of an Amazon Aurora DB cluster, you can't delete the DB instance if both of the following conditions are true:</p><ul><li><p>The DB cluster is a read replica of another Amazon Aurora DB cluster.</p></li><li><p>The DB instance is the only instance in the DB cluster.</p></li></ul><p>To delete a DB instance in this case, first call the <code>PromoteReadReplicaDBCluster</code> API action to promote the DB cluster so it's no longer a read replica. After the promotion completes, then call the <code>DeleteDBInstance</code> API action to delete the final instance in the DB cluster.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDBInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorDBSnapshotAlreadyExists`, `AWSRdsErrorSnapshotQuotaExceeded`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorDBInstanceAutomatedBackupQuotaExceeded`.
 
 @see AWSRdsDeleteDBInstanceMessage
 @see AWSRdsDeleteDBInstanceResult
 */
- (void)deleteDBInstance:(AWSRdsDeleteDBInstanceMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDeleteDBInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes automated backups based on the source instance's <code>DbiResourceId</code> value or the restorable instance's resource ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDBInstanceAutomatedBackup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDeleteDBInstanceAutomatedBackupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBInstanceAutomatedBackupState`, `AWSRdsErrorDBInstanceAutomatedBackupNotFound`.
 
 @see AWSRdsDeleteDBInstanceAutomatedBackupMessage
 @see AWSRdsDeleteDBInstanceAutomatedBackupResult
 */
- (AWSTask<AWSRdsDeleteDBInstanceAutomatedBackupResult *> *)deleteDBInstanceAutomatedBackup:(AWSRdsDeleteDBInstanceAutomatedBackupMessage *)request;

/**
 <p>Deletes automated backups based on the source instance's <code>DbiResourceId</code> value or the restorable instance's resource ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDBInstanceAutomatedBackup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBInstanceAutomatedBackupState`, `AWSRdsErrorDBInstanceAutomatedBackupNotFound`.
 
 @see AWSRdsDeleteDBInstanceAutomatedBackupMessage
 @see AWSRdsDeleteDBInstanceAutomatedBackupResult
 */
- (void)deleteDBInstanceAutomatedBackup:(AWSRdsDeleteDBInstanceAutomatedBackupMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDeleteDBInstanceAutomatedBackupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified DB parameter group. The DB parameter group to be deleted can't be associated with any DB instances.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDBParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBParameterGroupState`, `AWSRdsErrorDBParameterGroupNotFound`.
 
 @see AWSRdsDeleteDBParameterGroupMessage
 */
- (AWSTask *)deleteDBParameterGroup:(AWSRdsDeleteDBParameterGroupMessage *)request;

/**
 <p>Deletes a specified DB parameter group. The DB parameter group to be deleted can't be associated with any DB instances.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDBParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBParameterGroupState`, `AWSRdsErrorDBParameterGroupNotFound`.
 
 @see AWSRdsDeleteDBParameterGroupMessage
 */
- (void)deleteDBParameterGroup:(AWSRdsDeleteDBParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Deletes an existing proxy.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDBProxy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDeleteDBProxyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBProxyNotFound`, `AWSRdsErrorInvalidDBProxyState`.
 
 @see AWSRdsDeleteDBProxyRequest
 @see AWSRdsDeleteDBProxyResponse
 */
- (AWSTask<AWSRdsDeleteDBProxyResponse *> *)deleteDBProxy:(AWSRdsDeleteDBProxyRequest *)request;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Deletes an existing proxy.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDBProxy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBProxyNotFound`, `AWSRdsErrorInvalidDBProxyState`.
 
 @see AWSRdsDeleteDBProxyRequest
 @see AWSRdsDeleteDBProxyResponse
 */
- (void)deleteDBProxy:(AWSRdsDeleteDBProxyRequest *)request completionHandler:(void (^ _Nullable)(AWSRdsDeleteDBProxyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a DB security group.</p><note><p>The specified DB security group must not be associated with any DB instances.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBSecurityGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBSecurityGroupState`, `AWSRdsErrorDBSecurityGroupNotFound`.
 
 @see AWSRdsDeleteDBSecurityGroupMessage
 */
- (AWSTask *)deleteDBSecurityGroup:(AWSRdsDeleteDBSecurityGroupMessage *)request;

/**
 <p>Deletes a DB security group.</p><note><p>The specified DB security group must not be associated with any DB instances.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBSecurityGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBSecurityGroupState`, `AWSRdsErrorDBSecurityGroupNotFound`.
 
 @see AWSRdsDeleteDBSecurityGroupMessage
 */
- (void)deleteDBSecurityGroup:(AWSRdsDeleteDBSecurityGroupMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a DB snapshot. If the snapshot is being copied, the copy operation is terminated.</p><note><p>The DB snapshot must be in the <code>available</code> state to be deleted.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDeleteDBSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBSnapshotState`, `AWSRdsErrorDBSnapshotNotFound`.
 
 @see AWSRdsDeleteDBSnapshotMessage
 @see AWSRdsDeleteDBSnapshotResult
 */
- (AWSTask<AWSRdsDeleteDBSnapshotResult *> *)deleteDBSnapshot:(AWSRdsDeleteDBSnapshotMessage *)request;

/**
 <p>Deletes a DB snapshot. If the snapshot is being copied, the copy operation is terminated.</p><note><p>The DB snapshot must be in the <code>available</code> state to be deleted.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBSnapshotState`, `AWSRdsErrorDBSnapshotNotFound`.
 
 @see AWSRdsDeleteDBSnapshotMessage
 @see AWSRdsDeleteDBSnapshotResult
 */
- (void)deleteDBSnapshot:(AWSRdsDeleteDBSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDeleteDBSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a DB subnet group.</p><note><p>The specified database subnet group must not be associated with any DB instances.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBSubnetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBSubnetGroupState`, `AWSRdsErrorInvalidDBSubnetState`, `AWSRdsErrorDBSubnetGroupNotFound`.
 
 @see AWSRdsDeleteDBSubnetGroupMessage
 */
- (AWSTask *)deleteDBSubnetGroup:(AWSRdsDeleteDBSubnetGroupMessage *)request;

/**
 <p>Deletes a DB subnet group.</p><note><p>The specified database subnet group must not be associated with any DB instances.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteDBSubnetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBSubnetGroupState`, `AWSRdsErrorInvalidDBSubnetState`, `AWSRdsErrorDBSubnetGroupNotFound`.
 
 @see AWSRdsDeleteDBSubnetGroupMessage
 */
- (void)deleteDBSubnetGroup:(AWSRdsDeleteDBSubnetGroupMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an RDS event notification subscription.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEventSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDeleteEventSubscriptionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorSubscriptionNotFound`, `AWSRdsErrorInvalidEventSubscriptionState`.
 
 @see AWSRdsDeleteEventSubscriptionMessage
 @see AWSRdsDeleteEventSubscriptionResult
 */
- (AWSTask<AWSRdsDeleteEventSubscriptionResult *> *)deleteEventSubscription:(AWSRdsDeleteEventSubscriptionMessage *)request;

/**
 <p>Deletes an RDS event notification subscription.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEventSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorSubscriptionNotFound`, `AWSRdsErrorInvalidEventSubscriptionState`.
 
 @see AWSRdsDeleteEventSubscriptionMessage
 @see AWSRdsDeleteEventSubscriptionResult
 */
- (void)deleteEventSubscription:(AWSRdsDeleteEventSubscriptionMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDeleteEventSubscriptionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes a global database cluster. The primary and secondary clusters must already be detached or destroyed first. </p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteGlobalCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDeleteGlobalClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorGlobalClusterNotFound`, `AWSRdsErrorInvalidGlobalClusterState`.
 
 @see AWSRdsDeleteGlobalClusterMessage
 @see AWSRdsDeleteGlobalClusterResult
 */
- (AWSTask<AWSRdsDeleteGlobalClusterResult *> *)deleteGlobalCluster:(AWSRdsDeleteGlobalClusterMessage *)request;

/**
 <p> Deletes a global database cluster. The primary and secondary clusters must already be detached or destroyed first. </p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteGlobalCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorGlobalClusterNotFound`, `AWSRdsErrorInvalidGlobalClusterState`.
 
 @see AWSRdsDeleteGlobalClusterMessage
 @see AWSRdsDeleteGlobalClusterResult
 */
- (void)deleteGlobalCluster:(AWSRdsDeleteGlobalClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDeleteGlobalClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the installation medium for a DB engine that requires an on-premises customer provided license, such as Microsoft SQL Server.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInstallationMedia service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsInstallationMedia`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInstallationMediaNotFound`.
 
 @see AWSRdsDeleteInstallationMediaMessage
 @see AWSRdsInstallationMedia
 */
- (AWSTask<AWSRdsInstallationMedia *> *)deleteInstallationMedia:(AWSRdsDeleteInstallationMediaMessage *)request;

/**
 <p>Deletes the installation medium for a DB engine that requires an on-premises customer provided license, such as Microsoft SQL Server.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInstallationMedia service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInstallationMediaNotFound`.
 
 @see AWSRdsDeleteInstallationMediaMessage
 @see AWSRdsInstallationMedia
 */
- (void)deleteInstallationMedia:(AWSRdsDeleteInstallationMediaMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsInstallationMedia * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an existing option group.</p>
 
 @param request A container for the necessary parameters to execute the DeleteOptionGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorOptionGroupNotFound`, `AWSRdsErrorInvalidOptionGroupState`.
 
 @see AWSRdsDeleteOptionGroupMessage
 */
- (AWSTask *)deleteOptionGroup:(AWSRdsDeleteOptionGroupMessage *)request;

/**
 <p>Deletes an existing option group.</p>
 
 @param request A container for the necessary parameters to execute the DeleteOptionGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorOptionGroupNotFound`, `AWSRdsErrorInvalidOptionGroupState`.
 
 @see AWSRdsDeleteOptionGroupMessage
 */
- (void)deleteOptionGroup:(AWSRdsDeleteOptionGroupMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Remove the association between one or more <code>DBProxyTarget</code> data structures and a <code>DBProxyTargetGroup</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterDBProxyTargets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDeregisterDBProxyTargetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBProxyTargetNotFound`, `AWSRdsErrorDBProxyTargetGroupNotFound`, `AWSRdsErrorDBProxyNotFound`, `AWSRdsErrorInvalidDBProxyState`.
 
 @see AWSRdsDeregisterDBProxyTargetsRequest
 @see AWSRdsDeregisterDBProxyTargetsResponse
 */
- (AWSTask<AWSRdsDeregisterDBProxyTargetsResponse *> *)deregisterDBProxyTargets:(AWSRdsDeregisterDBProxyTargetsRequest *)request;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Remove the association between one or more <code>DBProxyTarget</code> data structures and a <code>DBProxyTargetGroup</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterDBProxyTargets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBProxyTargetNotFound`, `AWSRdsErrorDBProxyTargetGroupNotFound`, `AWSRdsErrorDBProxyNotFound`, `AWSRdsErrorInvalidDBProxyState`.
 
 @see AWSRdsDeregisterDBProxyTargetsRequest
 @see AWSRdsDeregisterDBProxyTargetsResponse
 */
- (void)deregisterDBProxyTargets:(AWSRdsDeregisterDBProxyTargetsRequest *)request completionHandler:(void (^ _Nullable)(AWSRdsDeregisterDBProxyTargetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all of the attributes for a customer account. The attributes include Amazon RDS quotas for the account, such as the number of DB instances allowed. The description for a quota includes the quota name, current usage toward that quota, and the quota's maximum value.</p><p>This command doesn't take any parameters.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccountAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsAccountAttributesMessage`.
 
 @see AWSRdsDescribeAccountAttributesMessage
 @see AWSRdsAccountAttributesMessage
 */
- (AWSTask<AWSRdsAccountAttributesMessage *> *)describeAccountAttributes:(AWSRdsDescribeAccountAttributesMessage *)request;

/**
 <p>Lists all of the attributes for a customer account. The attributes include Amazon RDS quotas for the account, such as the number of DB instances allowed. The description for a quota includes the quota name, current usage toward that quota, and the quota's maximum value.</p><p>This command doesn't take any parameters.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccountAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSRdsDescribeAccountAttributesMessage
 @see AWSRdsAccountAttributesMessage
 */
- (void)describeAccountAttributes:(AWSRdsDescribeAccountAttributesMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsAccountAttributesMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the set of CA certificates provided by Amazon RDS for this AWS account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCertificates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsCertificateMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorCertificateNotFound`.
 
 @see AWSRdsDescribeCertificatesMessage
 @see AWSRdsCertificateMessage
 */
- (AWSTask<AWSRdsCertificateMessage *> *)describeCertificates:(AWSRdsDescribeCertificatesMessage *)request;

/**
 <p>Lists the set of CA certificates provided by Amazon RDS for this AWS account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCertificates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorCertificateNotFound`.
 
 @see AWSRdsDescribeCertificatesMessage
 @see AWSRdsCertificateMessage
 */
- (void)describeCertificates:(AWSRdsDescribeCertificatesMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsCertificateMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about custom Availability Zones (AZs).</p><p>A custom AZ is an on-premises AZ that is integrated with a VMware vSphere cluster.</p><p>For more information about RDS on VMware, see the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html"><i>RDS on VMware User Guide.</i></a></p>
 
 @param request A container for the necessary parameters to execute the DescribeCustomAvailabilityZones service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsCustomAvailabilityZoneMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorCustomAvailabilityZoneNotFound`.
 
 @see AWSRdsDescribeCustomAvailabilityZonesMessage
 @see AWSRdsCustomAvailabilityZoneMessage
 */
- (AWSTask<AWSRdsCustomAvailabilityZoneMessage *> *)describeCustomAvailabilityZones:(AWSRdsDescribeCustomAvailabilityZonesMessage *)request;

/**
 <p>Returns information about custom Availability Zones (AZs).</p><p>A custom AZ is an on-premises AZ that is integrated with a VMware vSphere cluster.</p><p>For more information about RDS on VMware, see the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html"><i>RDS on VMware User Guide.</i></a></p>
 
 @param request A container for the necessary parameters to execute the DescribeCustomAvailabilityZones service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorCustomAvailabilityZoneNotFound`.
 
 @see AWSRdsDescribeCustomAvailabilityZonesMessage
 @see AWSRdsCustomAvailabilityZoneMessage
 */
- (void)describeCustomAvailabilityZones:(AWSRdsDescribeCustomAvailabilityZonesMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsCustomAvailabilityZoneMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about backtracks for a DB cluster.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora MySQL DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusterBacktracks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDBClusterBacktrackMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorDBClusterBacktrackNotFound`.
 
 @see AWSRdsDescribeDBClusterBacktracksMessage
 @see AWSRdsDBClusterBacktrackMessage
 */
- (AWSTask<AWSRdsDBClusterBacktrackMessage *> *)describeDBClusterBacktracks:(AWSRdsDescribeDBClusterBacktracksMessage *)request;

/**
 <p>Returns information about backtracks for a DB cluster.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora MySQL DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusterBacktracks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorDBClusterBacktrackNotFound`.
 
 @see AWSRdsDescribeDBClusterBacktracksMessage
 @see AWSRdsDBClusterBacktrackMessage
 */
- (void)describeDBClusterBacktracks:(AWSRdsDescribeDBClusterBacktracksMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDBClusterBacktrackMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about endpoints for an Amazon Aurora DB cluster.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusterEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDBClusterEndpointMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`.
 
 @see AWSRdsDescribeDBClusterEndpointsMessage
 @see AWSRdsDBClusterEndpointMessage
 */
- (AWSTask<AWSRdsDBClusterEndpointMessage *> *)describeDBClusterEndpoints:(AWSRdsDescribeDBClusterEndpointsMessage *)request;

/**
 <p>Returns information about endpoints for an Amazon Aurora DB cluster.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusterEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`.
 
 @see AWSRdsDescribeDBClusterEndpointsMessage
 @see AWSRdsDBClusterEndpointMessage
 */
- (void)describeDBClusterEndpoints:(AWSRdsDescribeDBClusterEndpointsMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDBClusterEndpointMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of <code>DBClusterParameterGroup</code> descriptions. If a <code>DBClusterParameterGroupName</code> parameter is specified, the list will contain only the description of the specified DB cluster parameter group. </p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusterParameterGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDBClusterParameterGroupsMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBParameterGroupNotFound`.
 
 @see AWSRdsDescribeDBClusterParameterGroupsMessage
 @see AWSRdsDBClusterParameterGroupsMessage
 */
- (AWSTask<AWSRdsDBClusterParameterGroupsMessage *> *)describeDBClusterParameterGroups:(AWSRdsDescribeDBClusterParameterGroupsMessage *)request;

/**
 <p> Returns a list of <code>DBClusterParameterGroup</code> descriptions. If a <code>DBClusterParameterGroupName</code> parameter is specified, the list will contain only the description of the specified DB cluster parameter group. </p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusterParameterGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBParameterGroupNotFound`.
 
 @see AWSRdsDescribeDBClusterParameterGroupsMessage
 @see AWSRdsDBClusterParameterGroupsMessage
 */
- (void)describeDBClusterParameterGroups:(AWSRdsDescribeDBClusterParameterGroupsMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDBClusterParameterGroupsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the detailed parameter list for a particular DB cluster parameter group.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusterParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDBClusterParameterGroupDetails`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBParameterGroupNotFound`.
 
 @see AWSRdsDescribeDBClusterParametersMessage
 @see AWSRdsDBClusterParameterGroupDetails
 */
- (AWSTask<AWSRdsDBClusterParameterGroupDetails *> *)describeDBClusterParameters:(AWSRdsDescribeDBClusterParametersMessage *)request;

/**
 <p>Returns the detailed parameter list for a particular DB cluster parameter group.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusterParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBParameterGroupNotFound`.
 
 @see AWSRdsDescribeDBClusterParametersMessage
 @see AWSRdsDBClusterParameterGroupDetails
 */
- (void)describeDBClusterParameters:(AWSRdsDescribeDBClusterParametersMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDBClusterParameterGroupDetails * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of DB cluster snapshot attribute names and values for a manual DB cluster snapshot.</p><p>When sharing snapshots with other AWS accounts, <code>DescribeDBClusterSnapshotAttributes</code> returns the <code>restore</code> attribute and a list of IDs for the AWS accounts that are authorized to copy or restore the manual DB cluster snapshot. If <code>all</code> is included in the list of values for the <code>restore</code> attribute, then the manual DB cluster snapshot is public and can be copied or restored by all AWS accounts.</p><p>To add or remove access for an AWS account to copy or restore a manual DB cluster snapshot, or to make the manual DB cluster snapshot public or private, use the <code>ModifyDBClusterSnapshotAttribute</code> API action.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusterSnapshotAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDescribeDBClusterSnapshotAttributesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterSnapshotNotFound`.
 
 @see AWSRdsDescribeDBClusterSnapshotAttributesMessage
 @see AWSRdsDescribeDBClusterSnapshotAttributesResult
 */
- (AWSTask<AWSRdsDescribeDBClusterSnapshotAttributesResult *> *)describeDBClusterSnapshotAttributes:(AWSRdsDescribeDBClusterSnapshotAttributesMessage *)request;

/**
 <p>Returns a list of DB cluster snapshot attribute names and values for a manual DB cluster snapshot.</p><p>When sharing snapshots with other AWS accounts, <code>DescribeDBClusterSnapshotAttributes</code> returns the <code>restore</code> attribute and a list of IDs for the AWS accounts that are authorized to copy or restore the manual DB cluster snapshot. If <code>all</code> is included in the list of values for the <code>restore</code> attribute, then the manual DB cluster snapshot is public and can be copied or restored by all AWS accounts.</p><p>To add or remove access for an AWS account to copy or restore a manual DB cluster snapshot, or to make the manual DB cluster snapshot public or private, use the <code>ModifyDBClusterSnapshotAttribute</code> API action.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusterSnapshotAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterSnapshotNotFound`.
 
 @see AWSRdsDescribeDBClusterSnapshotAttributesMessage
 @see AWSRdsDescribeDBClusterSnapshotAttributesResult
 */
- (void)describeDBClusterSnapshotAttributes:(AWSRdsDescribeDBClusterSnapshotAttributesMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDescribeDBClusterSnapshotAttributesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about DB cluster snapshots. This API action supports pagination.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusterSnapshots service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDBClusterSnapshotMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterSnapshotNotFound`.
 
 @see AWSRdsDescribeDBClusterSnapshotsMessage
 @see AWSRdsDBClusterSnapshotMessage
 */
- (AWSTask<AWSRdsDBClusterSnapshotMessage *> *)describeDBClusterSnapshots:(AWSRdsDescribeDBClusterSnapshotsMessage *)request;

/**
 <p>Returns information about DB cluster snapshots. This API action supports pagination.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusterSnapshots service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterSnapshotNotFound`.
 
 @see AWSRdsDescribeDBClusterSnapshotsMessage
 @see AWSRdsDBClusterSnapshotMessage
 */
- (void)describeDBClusterSnapshots:(AWSRdsDescribeDBClusterSnapshotsMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDBClusterSnapshotMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about provisioned Aurora DB clusters. This API supports pagination.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This operation can also return information for Amazon Neptune DB instances and Amazon DocumentDB instances.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDBClusterMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`.
 
 @see AWSRdsDescribeDBClustersMessage
 @see AWSRdsDBClusterMessage
 */
- (AWSTask<AWSRdsDBClusterMessage *> *)describeDBClusters:(AWSRdsDescribeDBClustersMessage *)request;

/**
 <p>Returns information about provisioned Aurora DB clusters. This API supports pagination.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This operation can also return information for Amazon Neptune DB instances and Amazon DocumentDB instances.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBClusters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`.
 
 @see AWSRdsDescribeDBClustersMessage
 @see AWSRdsDBClusterMessage
 */
- (void)describeDBClusters:(AWSRdsDescribeDBClustersMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDBClusterMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the available DB engines.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBEngineVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDBEngineVersionMessage`.
 
 @see AWSRdsDescribeDBEngineVersionsMessage
 @see AWSRdsDBEngineVersionMessage
 */
- (AWSTask<AWSRdsDBEngineVersionMessage *> *)describeDBEngineVersions:(AWSRdsDescribeDBEngineVersionsMessage *)request;

/**
 <p>Returns a list of the available DB engines.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBEngineVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSRdsDescribeDBEngineVersionsMessage
 @see AWSRdsDBEngineVersionMessage
 */
- (void)describeDBEngineVersions:(AWSRdsDescribeDBEngineVersionsMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDBEngineVersionMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Displays backups for both current and deleted instances. For example, use this operation to find details about automated backups for previously deleted instances. Current instances with retention periods greater than zero (0) are returned for both the <code>DescribeDBInstanceAutomatedBackups</code> and <code>DescribeDBInstances</code> operations.</p><p>All parameters are optional.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBInstanceAutomatedBackups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDBInstanceAutomatedBackupMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceAutomatedBackupNotFound`.
 
 @see AWSRdsDescribeDBInstanceAutomatedBackupsMessage
 @see AWSRdsDBInstanceAutomatedBackupMessage
 */
- (AWSTask<AWSRdsDBInstanceAutomatedBackupMessage *> *)describeDBInstanceAutomatedBackups:(AWSRdsDescribeDBInstanceAutomatedBackupsMessage *)request;

/**
 <p>Displays backups for both current and deleted instances. For example, use this operation to find details about automated backups for previously deleted instances. Current instances with retention periods greater than zero (0) are returned for both the <code>DescribeDBInstanceAutomatedBackups</code> and <code>DescribeDBInstances</code> operations.</p><p>All parameters are optional.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBInstanceAutomatedBackups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceAutomatedBackupNotFound`.
 
 @see AWSRdsDescribeDBInstanceAutomatedBackupsMessage
 @see AWSRdsDBInstanceAutomatedBackupMessage
 */
- (void)describeDBInstanceAutomatedBackups:(AWSRdsDescribeDBInstanceAutomatedBackupsMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDBInstanceAutomatedBackupMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about provisioned RDS instances. This API supports pagination.</p><note><p>This operation can also return information for Amazon Neptune DB instances and Amazon DocumentDB instances.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDBInstanceMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceNotFound`.
 
 @see AWSRdsDescribeDBInstancesMessage
 @see AWSRdsDBInstanceMessage
 */
- (AWSTask<AWSRdsDBInstanceMessage *> *)describeDBInstances:(AWSRdsDescribeDBInstancesMessage *)request;

/**
 <p>Returns information about provisioned RDS instances. This API supports pagination.</p><note><p>This operation can also return information for Amazon Neptune DB instances and Amazon DocumentDB instances.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeDBInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceNotFound`.
 
 @see AWSRdsDescribeDBInstancesMessage
 @see AWSRdsDBInstanceMessage
 */
- (void)describeDBInstances:(AWSRdsDescribeDBInstancesMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDBInstanceMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of DB log files for the DB instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBLogFiles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDescribeDBLogFilesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceNotFound`.
 
 @see AWSRdsDescribeDBLogFilesMessage
 @see AWSRdsDescribeDBLogFilesResponse
 */
- (AWSTask<AWSRdsDescribeDBLogFilesResponse *> *)describeDBLogFiles:(AWSRdsDescribeDBLogFilesMessage *)request;

/**
 <p>Returns a list of DB log files for the DB instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBLogFiles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceNotFound`.
 
 @see AWSRdsDescribeDBLogFilesMessage
 @see AWSRdsDescribeDBLogFilesResponse
 */
- (void)describeDBLogFiles:(AWSRdsDescribeDBLogFilesMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDescribeDBLogFilesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of <code>DBParameterGroup</code> descriptions. If a <code>DBParameterGroupName</code> is specified, the list will contain only the description of the specified DB parameter group. </p>
 
 @param request A container for the necessary parameters to execute the DescribeDBParameterGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDBParameterGroupsMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBParameterGroupNotFound`.
 
 @see AWSRdsDescribeDBParameterGroupsMessage
 @see AWSRdsDBParameterGroupsMessage
 */
- (AWSTask<AWSRdsDBParameterGroupsMessage *> *)describeDBParameterGroups:(AWSRdsDescribeDBParameterGroupsMessage *)request;

/**
 <p> Returns a list of <code>DBParameterGroup</code> descriptions. If a <code>DBParameterGroupName</code> is specified, the list will contain only the description of the specified DB parameter group. </p>
 
 @param request A container for the necessary parameters to execute the DescribeDBParameterGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBParameterGroupNotFound`.
 
 @see AWSRdsDescribeDBParameterGroupsMessage
 @see AWSRdsDBParameterGroupsMessage
 */
- (void)describeDBParameterGroups:(AWSRdsDescribeDBParameterGroupsMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDBParameterGroupsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the detailed parameter list for a particular DB parameter group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDBParameterGroupDetails`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBParameterGroupNotFound`.
 
 @see AWSRdsDescribeDBParametersMessage
 @see AWSRdsDBParameterGroupDetails
 */
- (AWSTask<AWSRdsDBParameterGroupDetails *> *)describeDBParameters:(AWSRdsDescribeDBParametersMessage *)request;

/**
 <p>Returns the detailed parameter list for a particular DB parameter group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBParameterGroupNotFound`.
 
 @see AWSRdsDescribeDBParametersMessage
 @see AWSRdsDBParameterGroupDetails
 */
- (void)describeDBParameters:(AWSRdsDescribeDBParametersMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDBParameterGroupDetails * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Returns information about DB proxies.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBProxies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDescribeDBProxiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBProxyNotFound`.
 
 @see AWSRdsDescribeDBProxiesRequest
 @see AWSRdsDescribeDBProxiesResponse
 */
- (AWSTask<AWSRdsDescribeDBProxiesResponse *> *)describeDBProxies:(AWSRdsDescribeDBProxiesRequest *)request;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Returns information about DB proxies.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBProxies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBProxyNotFound`.
 
 @see AWSRdsDescribeDBProxiesRequest
 @see AWSRdsDescribeDBProxiesResponse
 */
- (void)describeDBProxies:(AWSRdsDescribeDBProxiesRequest *)request completionHandler:(void (^ _Nullable)(AWSRdsDescribeDBProxiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Returns information about DB proxy target groups, represented by <code>DBProxyTargetGroup</code> data structures.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBProxyTargetGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDescribeDBProxyTargetGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBProxyNotFound`, `AWSRdsErrorDBProxyTargetGroupNotFound`, `AWSRdsErrorInvalidDBProxyState`.
 
 @see AWSRdsDescribeDBProxyTargetGroupsRequest
 @see AWSRdsDescribeDBProxyTargetGroupsResponse
 */
- (AWSTask<AWSRdsDescribeDBProxyTargetGroupsResponse *> *)describeDBProxyTargetGroups:(AWSRdsDescribeDBProxyTargetGroupsRequest *)request;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Returns information about DB proxy target groups, represented by <code>DBProxyTargetGroup</code> data structures.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBProxyTargetGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBProxyNotFound`, `AWSRdsErrorDBProxyTargetGroupNotFound`, `AWSRdsErrorInvalidDBProxyState`.
 
 @see AWSRdsDescribeDBProxyTargetGroupsRequest
 @see AWSRdsDescribeDBProxyTargetGroupsResponse
 */
- (void)describeDBProxyTargetGroups:(AWSRdsDescribeDBProxyTargetGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSRdsDescribeDBProxyTargetGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Returns information about <code>DBProxyTarget</code> objects. This API supports pagination.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBProxyTargets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDescribeDBProxyTargetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBProxyNotFound`, `AWSRdsErrorDBProxyTargetNotFound`, `AWSRdsErrorDBProxyTargetGroupNotFound`, `AWSRdsErrorInvalidDBProxyState`.
 
 @see AWSRdsDescribeDBProxyTargetsRequest
 @see AWSRdsDescribeDBProxyTargetsResponse
 */
- (AWSTask<AWSRdsDescribeDBProxyTargetsResponse *> *)describeDBProxyTargets:(AWSRdsDescribeDBProxyTargetsRequest *)request;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Returns information about <code>DBProxyTarget</code> objects. This API supports pagination.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBProxyTargets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBProxyNotFound`, `AWSRdsErrorDBProxyTargetNotFound`, `AWSRdsErrorDBProxyTargetGroupNotFound`, `AWSRdsErrorInvalidDBProxyState`.
 
 @see AWSRdsDescribeDBProxyTargetsRequest
 @see AWSRdsDescribeDBProxyTargetsResponse
 */
- (void)describeDBProxyTargets:(AWSRdsDescribeDBProxyTargetsRequest *)request completionHandler:(void (^ _Nullable)(AWSRdsDescribeDBProxyTargetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of <code>DBSecurityGroup</code> descriptions. If a <code>DBSecurityGroupName</code> is specified, the list will contain only the descriptions of the specified DB security group. </p>
 
 @param request A container for the necessary parameters to execute the DescribeDBSecurityGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDBSecurityGroupMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSecurityGroupNotFound`.
 
 @see AWSRdsDescribeDBSecurityGroupsMessage
 @see AWSRdsDBSecurityGroupMessage
 */
- (AWSTask<AWSRdsDBSecurityGroupMessage *> *)describeDBSecurityGroups:(AWSRdsDescribeDBSecurityGroupsMessage *)request;

/**
 <p> Returns a list of <code>DBSecurityGroup</code> descriptions. If a <code>DBSecurityGroupName</code> is specified, the list will contain only the descriptions of the specified DB security group. </p>
 
 @param request A container for the necessary parameters to execute the DescribeDBSecurityGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSecurityGroupNotFound`.
 
 @see AWSRdsDescribeDBSecurityGroupsMessage
 @see AWSRdsDBSecurityGroupMessage
 */
- (void)describeDBSecurityGroups:(AWSRdsDescribeDBSecurityGroupsMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDBSecurityGroupMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of DB snapshot attribute names and values for a manual DB snapshot.</p><p>When sharing snapshots with other AWS accounts, <code>DescribeDBSnapshotAttributes</code> returns the <code>restore</code> attribute and a list of IDs for the AWS accounts that are authorized to copy or restore the manual DB snapshot. If <code>all</code> is included in the list of values for the <code>restore</code> attribute, then the manual DB snapshot is public and can be copied or restored by all AWS accounts.</p><p>To add or remove access for an AWS account to copy or restore a manual DB snapshot, or to make the manual DB snapshot public or private, use the <code>ModifyDBSnapshotAttribute</code> API action.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBSnapshotAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDescribeDBSnapshotAttributesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSnapshotNotFound`.
 
 @see AWSRdsDescribeDBSnapshotAttributesMessage
 @see AWSRdsDescribeDBSnapshotAttributesResult
 */
- (AWSTask<AWSRdsDescribeDBSnapshotAttributesResult *> *)describeDBSnapshotAttributes:(AWSRdsDescribeDBSnapshotAttributesMessage *)request;

/**
 <p>Returns a list of DB snapshot attribute names and values for a manual DB snapshot.</p><p>When sharing snapshots with other AWS accounts, <code>DescribeDBSnapshotAttributes</code> returns the <code>restore</code> attribute and a list of IDs for the AWS accounts that are authorized to copy or restore the manual DB snapshot. If <code>all</code> is included in the list of values for the <code>restore</code> attribute, then the manual DB snapshot is public and can be copied or restored by all AWS accounts.</p><p>To add or remove access for an AWS account to copy or restore a manual DB snapshot, or to make the manual DB snapshot public or private, use the <code>ModifyDBSnapshotAttribute</code> API action.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBSnapshotAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSnapshotNotFound`.
 
 @see AWSRdsDescribeDBSnapshotAttributesMessage
 @see AWSRdsDescribeDBSnapshotAttributesResult
 */
- (void)describeDBSnapshotAttributes:(AWSRdsDescribeDBSnapshotAttributesMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDescribeDBSnapshotAttributesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about DB snapshots. This API action supports pagination.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBSnapshots service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDBSnapshotMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSnapshotNotFound`.
 
 @see AWSRdsDescribeDBSnapshotsMessage
 @see AWSRdsDBSnapshotMessage
 */
- (AWSTask<AWSRdsDBSnapshotMessage *> *)describeDBSnapshots:(AWSRdsDescribeDBSnapshotsMessage *)request;

/**
 <p>Returns information about DB snapshots. This API action supports pagination.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDBSnapshots service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSnapshotNotFound`.
 
 @see AWSRdsDescribeDBSnapshotsMessage
 @see AWSRdsDBSnapshotMessage
 */
- (void)describeDBSnapshots:(AWSRdsDescribeDBSnapshotsMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDBSnapshotMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of DBSubnetGroup descriptions. If a DBSubnetGroupName is specified, the list will contain only the descriptions of the specified DBSubnetGroup.</p><p>For an overview of CIDR ranges, go to the <a href="http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Wikipedia Tutorial</a>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeDBSubnetGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDBSubnetGroupMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSubnetGroupNotFound`.
 
 @see AWSRdsDescribeDBSubnetGroupsMessage
 @see AWSRdsDBSubnetGroupMessage
 */
- (AWSTask<AWSRdsDBSubnetGroupMessage *> *)describeDBSubnetGroups:(AWSRdsDescribeDBSubnetGroupsMessage *)request;

/**
 <p>Returns a list of DBSubnetGroup descriptions. If a DBSubnetGroupName is specified, the list will contain only the descriptions of the specified DBSubnetGroup.</p><p>For an overview of CIDR ranges, go to the <a href="http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Wikipedia Tutorial</a>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeDBSubnetGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSubnetGroupNotFound`.
 
 @see AWSRdsDescribeDBSubnetGroupsMessage
 @see AWSRdsDBSubnetGroupMessage
 */
- (void)describeDBSubnetGroups:(AWSRdsDescribeDBSubnetGroupsMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDBSubnetGroupMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the default engine and system parameter information for the cluster database engine.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the DescribeEngineDefaultClusterParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDescribeEngineDefaultClusterParametersResult`.
 
 @see AWSRdsDescribeEngineDefaultClusterParametersMessage
 @see AWSRdsDescribeEngineDefaultClusterParametersResult
 */
- (AWSTask<AWSRdsDescribeEngineDefaultClusterParametersResult *> *)describeEngineDefaultClusterParameters:(AWSRdsDescribeEngineDefaultClusterParametersMessage *)request;

/**
 <p>Returns the default engine and system parameter information for the cluster database engine.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the DescribeEngineDefaultClusterParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSRdsDescribeEngineDefaultClusterParametersMessage
 @see AWSRdsDescribeEngineDefaultClusterParametersResult
 */
- (void)describeEngineDefaultClusterParameters:(AWSRdsDescribeEngineDefaultClusterParametersMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDescribeEngineDefaultClusterParametersResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the default engine and system parameter information for the specified database engine.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEngineDefaultParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDescribeEngineDefaultParametersResult`.
 
 @see AWSRdsDescribeEngineDefaultParametersMessage
 @see AWSRdsDescribeEngineDefaultParametersResult
 */
- (AWSTask<AWSRdsDescribeEngineDefaultParametersResult *> *)describeEngineDefaultParameters:(AWSRdsDescribeEngineDefaultParametersMessage *)request;

/**
 <p>Returns the default engine and system parameter information for the specified database engine.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEngineDefaultParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSRdsDescribeEngineDefaultParametersMessage
 @see AWSRdsDescribeEngineDefaultParametersResult
 */
- (void)describeEngineDefaultParameters:(AWSRdsDescribeEngineDefaultParametersMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDescribeEngineDefaultParametersResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Displays a list of categories for all event source types, or, if specified, for a specified source type. You can see a list of the event categories and source types in the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html"> Events</a> topic in the <i>Amazon RDS User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the DescribeEventCategories service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsEventCategoriesMessage`.
 
 @see AWSRdsDescribeEventCategoriesMessage
 @see AWSRdsEventCategoriesMessage
 */
- (AWSTask<AWSRdsEventCategoriesMessage *> *)describeEventCategories:(AWSRdsDescribeEventCategoriesMessage *)request;

/**
 <p>Displays a list of categories for all event source types, or, if specified, for a specified source type. You can see a list of the event categories and source types in the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html"> Events</a> topic in the <i>Amazon RDS User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the DescribeEventCategories service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSRdsDescribeEventCategoriesMessage
 @see AWSRdsEventCategoriesMessage
 */
- (void)describeEventCategories:(AWSRdsDescribeEventCategoriesMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsEventCategoriesMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the subscription descriptions for a customer account. The description for a subscription includes SubscriptionName, SNSTopicARN, CustomerID, SourceType, SourceID, CreationTime, and Status.</p><p>If you specify a SubscriptionName, lists the description for that subscription.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEventSubscriptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsEventSubscriptionsMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorSubscriptionNotFound`.
 
 @see AWSRdsDescribeEventSubscriptionsMessage
 @see AWSRdsEventSubscriptionsMessage
 */
- (AWSTask<AWSRdsEventSubscriptionsMessage *> *)describeEventSubscriptions:(AWSRdsDescribeEventSubscriptionsMessage *)request;

/**
 <p>Lists all the subscription descriptions for a customer account. The description for a subscription includes SubscriptionName, SNSTopicARN, CustomerID, SourceType, SourceID, CreationTime, and Status.</p><p>If you specify a SubscriptionName, lists the description for that subscription.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEventSubscriptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorSubscriptionNotFound`.
 
 @see AWSRdsDescribeEventSubscriptionsMessage
 @see AWSRdsEventSubscriptionsMessage
 */
- (void)describeEventSubscriptions:(AWSRdsDescribeEventSubscriptionsMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsEventSubscriptionsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns events related to DB instances, DB security groups, DB snapshots, and DB parameter groups for the past 14 days. Events specific to a particular DB instance, DB security group, database snapshot, or DB parameter group can be obtained by providing the name as a parameter. By default, the past hour of events are returned.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsEventsMessage`.
 
 @see AWSRdsDescribeEventsMessage
 @see AWSRdsEventsMessage
 */
- (AWSTask<AWSRdsEventsMessage *> *)describeEvents:(AWSRdsDescribeEventsMessage *)request;

/**
 <p>Returns events related to DB instances, DB security groups, DB snapshots, and DB parameter groups for the past 14 days. Events specific to a particular DB instance, DB security group, database snapshot, or DB parameter group can be obtained by providing the name as a parameter. By default, the past hour of events are returned.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSRdsDescribeEventsMessage
 @see AWSRdsEventsMessage
 */
- (void)describeEvents:(AWSRdsDescribeEventsMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsEventsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a snapshot export to Amazon S3. This API operation supports pagination. </p>
 
 @param request A container for the necessary parameters to execute the DescribeExportTasks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsExportTasksMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorExportTaskNotFound`.
 
 @see AWSRdsDescribeExportTasksMessage
 @see AWSRdsExportTasksMessage
 */
- (AWSTask<AWSRdsExportTasksMessage *> *)describeExportTasks:(AWSRdsDescribeExportTasksMessage *)request;

/**
 <p>Returns information about a snapshot export to Amazon S3. This API operation supports pagination. </p>
 
 @param request A container for the necessary parameters to execute the DescribeExportTasks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorExportTaskNotFound`.
 
 @see AWSRdsDescribeExportTasksMessage
 @see AWSRdsExportTasksMessage
 */
- (void)describeExportTasks:(AWSRdsDescribeExportTasksMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsExportTasksMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns information about Aurora global database clusters. This API supports pagination. </p><p> For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeGlobalClusters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsGlobalClustersMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorGlobalClusterNotFound`.
 
 @see AWSRdsDescribeGlobalClustersMessage
 @see AWSRdsGlobalClustersMessage
 */
- (AWSTask<AWSRdsGlobalClustersMessage *> *)describeGlobalClusters:(AWSRdsDescribeGlobalClustersMessage *)request;

/**
 <p> Returns information about Aurora global database clusters. This API supports pagination. </p><p> For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeGlobalClusters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorGlobalClusterNotFound`.
 
 @see AWSRdsDescribeGlobalClustersMessage
 @see AWSRdsGlobalClustersMessage
 */
- (void)describeGlobalClusters:(AWSRdsDescribeGlobalClustersMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsGlobalClustersMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the available installation media for a DB engine that requires an on-premises customer provided license, such as Microsoft SQL Server.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstallationMedia service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsInstallationMediaMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInstallationMediaNotFound`.
 
 @see AWSRdsDescribeInstallationMediaMessage
 @see AWSRdsInstallationMediaMessage
 */
- (AWSTask<AWSRdsInstallationMediaMessage *> *)describeInstallationMedia:(AWSRdsDescribeInstallationMediaMessage *)request;

/**
 <p>Describes the available installation media for a DB engine that requires an on-premises customer provided license, such as Microsoft SQL Server.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstallationMedia service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInstallationMediaNotFound`.
 
 @see AWSRdsDescribeInstallationMediaMessage
 @see AWSRdsInstallationMediaMessage
 */
- (void)describeInstallationMedia:(AWSRdsDescribeInstallationMediaMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsInstallationMediaMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes all available options.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOptionGroupOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsOptionGroupOptionsMessage`.
 
 @see AWSRdsDescribeOptionGroupOptionsMessage
 @see AWSRdsOptionGroupOptionsMessage
 */
- (AWSTask<AWSRdsOptionGroupOptionsMessage *> *)describeOptionGroupOptions:(AWSRdsDescribeOptionGroupOptionsMessage *)request;

/**
 <p>Describes all available options.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOptionGroupOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSRdsDescribeOptionGroupOptionsMessage
 @see AWSRdsOptionGroupOptionsMessage
 */
- (void)describeOptionGroupOptions:(AWSRdsDescribeOptionGroupOptionsMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsOptionGroupOptionsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the available option groups.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOptionGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsOptionGroups`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorOptionGroupNotFound`.
 
 @see AWSRdsDescribeOptionGroupsMessage
 @see AWSRdsOptionGroups
 */
- (AWSTask<AWSRdsOptionGroups *> *)describeOptionGroups:(AWSRdsDescribeOptionGroupsMessage *)request;

/**
 <p>Describes the available option groups.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOptionGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorOptionGroupNotFound`.
 
 @see AWSRdsDescribeOptionGroupsMessage
 @see AWSRdsOptionGroups
 */
- (void)describeOptionGroups:(AWSRdsDescribeOptionGroupsMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsOptionGroups * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of orderable DB instance options for the specified engine.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOrderableDBInstanceOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsOrderableDBInstanceOptionsMessage`.
 
 @see AWSRdsDescribeOrderableDBInstanceOptionsMessage
 @see AWSRdsOrderableDBInstanceOptionsMessage
 */
- (AWSTask<AWSRdsOrderableDBInstanceOptionsMessage *> *)describeOrderableDBInstanceOptions:(AWSRdsDescribeOrderableDBInstanceOptionsMessage *)request;

/**
 <p>Returns a list of orderable DB instance options for the specified engine.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOrderableDBInstanceOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSRdsDescribeOrderableDBInstanceOptionsMessage
 @see AWSRdsOrderableDBInstanceOptionsMessage
 */
- (void)describeOrderableDBInstanceOptions:(AWSRdsDescribeOrderableDBInstanceOptionsMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsOrderableDBInstanceOptionsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of resources (for example, DB instances) that have at least one pending maintenance action.</p>
 
 @param request A container for the necessary parameters to execute the DescribePendingMaintenanceActions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsPendingMaintenanceActionsMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorResourceNotFound`.
 
 @see AWSRdsDescribePendingMaintenanceActionsMessage
 @see AWSRdsPendingMaintenanceActionsMessage
 */
- (AWSTask<AWSRdsPendingMaintenanceActionsMessage *> *)describePendingMaintenanceActions:(AWSRdsDescribePendingMaintenanceActionsMessage *)request;

/**
 <p>Returns a list of resources (for example, DB instances) that have at least one pending maintenance action.</p>
 
 @param request A container for the necessary parameters to execute the DescribePendingMaintenanceActions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorResourceNotFound`.
 
 @see AWSRdsDescribePendingMaintenanceActionsMessage
 @see AWSRdsPendingMaintenanceActionsMessage
 */
- (void)describePendingMaintenanceActions:(AWSRdsDescribePendingMaintenanceActionsMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsPendingMaintenanceActionsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about reserved DB instances for this account, or about a specified reserved DB instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedDBInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsReservedDBInstanceMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorReservedDBInstanceNotFound`.
 
 @see AWSRdsDescribeReservedDBInstancesMessage
 @see AWSRdsReservedDBInstanceMessage
 */
- (AWSTask<AWSRdsReservedDBInstanceMessage *> *)describeReservedDBInstances:(AWSRdsDescribeReservedDBInstancesMessage *)request;

/**
 <p>Returns information about reserved DB instances for this account, or about a specified reserved DB instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedDBInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorReservedDBInstanceNotFound`.
 
 @see AWSRdsDescribeReservedDBInstancesMessage
 @see AWSRdsReservedDBInstanceMessage
 */
- (void)describeReservedDBInstances:(AWSRdsDescribeReservedDBInstancesMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsReservedDBInstanceMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists available reserved DB instance offerings.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedDBInstancesOfferings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsReservedDBInstancesOfferingMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorReservedDBInstancesOfferingNotFound`.
 
 @see AWSRdsDescribeReservedDBInstancesOfferingsMessage
 @see AWSRdsReservedDBInstancesOfferingMessage
 */
- (AWSTask<AWSRdsReservedDBInstancesOfferingMessage *> *)describeReservedDBInstancesOfferings:(AWSRdsDescribeReservedDBInstancesOfferingsMessage *)request;

/**
 <p>Lists available reserved DB instance offerings.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedDBInstancesOfferings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorReservedDBInstancesOfferingNotFound`.
 
 @see AWSRdsDescribeReservedDBInstancesOfferingsMessage
 @see AWSRdsReservedDBInstancesOfferingMessage
 */
- (void)describeReservedDBInstancesOfferings:(AWSRdsDescribeReservedDBInstancesOfferingsMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsReservedDBInstancesOfferingMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the source AWS Regions where the current AWS Region can create a read replica or copy a DB snapshot from. This API action supports pagination.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSourceRegions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsSourceRegionMessage`.
 
 @see AWSRdsDescribeSourceRegionsMessage
 @see AWSRdsSourceRegionMessage
 */
- (AWSTask<AWSRdsSourceRegionMessage *> *)describeSourceRegions:(AWSRdsDescribeSourceRegionsMessage *)request;

/**
 <p>Returns a list of the source AWS Regions where the current AWS Region can create a read replica or copy a DB snapshot from. This API action supports pagination.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSourceRegions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSRdsDescribeSourceRegionsMessage
 @see AWSRdsSourceRegionMessage
 */
- (void)describeSourceRegions:(AWSRdsDescribeSourceRegionsMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsSourceRegionMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>You can call <code>DescribeValidDBInstanceModifications</code> to learn what modifications you can make to your DB instance. You can use this information when you call <code>ModifyDBInstance</code>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeValidDBInstanceModifications service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDescribeValidDBInstanceModificationsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorInvalidDBInstanceState`.
 
 @see AWSRdsDescribeValidDBInstanceModificationsMessage
 @see AWSRdsDescribeValidDBInstanceModificationsResult
 */
- (AWSTask<AWSRdsDescribeValidDBInstanceModificationsResult *> *)describeValidDBInstanceModifications:(AWSRdsDescribeValidDBInstanceModificationsMessage *)request;

/**
 <p>You can call <code>DescribeValidDBInstanceModifications</code> to learn what modifications you can make to your DB instance. You can use this information when you call <code>ModifyDBInstance</code>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeValidDBInstanceModifications service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorInvalidDBInstanceState`.
 
 @see AWSRdsDescribeValidDBInstanceModificationsMessage
 @see AWSRdsDescribeValidDBInstanceModificationsResult
 */
- (void)describeValidDBInstanceModifications:(AWSRdsDescribeValidDBInstanceModificationsMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDescribeValidDBInstanceModificationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Downloads all or a portion of the specified log file, up to 1 MB in size.</p>
 
 @param request A container for the necessary parameters to execute the DownloadDBLogFilePortion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDownloadDBLogFilePortionDetails`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorDBLogFileNotFound`.
 
 @see AWSRdsDownloadDBLogFilePortionMessage
 @see AWSRdsDownloadDBLogFilePortionDetails
 */
- (AWSTask<AWSRdsDownloadDBLogFilePortionDetails *> *)downloadDBLogFilePortion:(AWSRdsDownloadDBLogFilePortionMessage *)request;

/**
 <p>Downloads all or a portion of the specified log file, up to 1 MB in size.</p>
 
 @param request A container for the necessary parameters to execute the DownloadDBLogFilePortion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorDBLogFileNotFound`.
 
 @see AWSRdsDownloadDBLogFilePortionMessage
 @see AWSRdsDownloadDBLogFilePortionDetails
 */
- (void)downloadDBLogFilePortion:(AWSRdsDownloadDBLogFilePortionMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDownloadDBLogFilePortionDetails * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Forces a failover for a DB cluster.</p><p>A failover for a DB cluster promotes one of the Aurora Replicas (read-only instances) in the DB cluster to be the primary instance (the cluster writer).</p><p>Amazon Aurora will automatically fail over to an Aurora Replica, if one exists, when the primary instance fails. You can force a failover when you want to simulate a failure of a primary instance for testing. Because each instance in a DB cluster has its own endpoint address, you will need to clean up and re-establish any existing connections that use those endpoint addresses when the failover is complete.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the FailoverDBCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsFailoverDBClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidDBInstanceState`.
 
 @see AWSRdsFailoverDBClusterMessage
 @see AWSRdsFailoverDBClusterResult
 */
- (AWSTask<AWSRdsFailoverDBClusterResult *> *)failoverDBCluster:(AWSRdsFailoverDBClusterMessage *)request;

/**
 <p>Forces a failover for a DB cluster.</p><p>A failover for a DB cluster promotes one of the Aurora Replicas (read-only instances) in the DB cluster to be the primary instance (the cluster writer).</p><p>Amazon Aurora will automatically fail over to an Aurora Replica, if one exists, when the primary instance fails. You can force a failover when you want to simulate a failure of a primary instance for testing. Because each instance in a DB cluster has its own endpoint address, you will need to clean up and re-establish any existing connections that use those endpoint addresses when the failover is complete.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the FailoverDBCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidDBInstanceState`.
 
 @see AWSRdsFailoverDBClusterMessage
 @see AWSRdsFailoverDBClusterResult
 */
- (void)failoverDBCluster:(AWSRdsFailoverDBClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsFailoverDBClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Imports the installation media for a DB engine that requires an on-premises customer provided license, such as SQL Server.</p>
 
 @param request A container for the necessary parameters to execute the ImportInstallationMedia service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsInstallationMedia`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorCustomAvailabilityZoneNotFound`, `AWSRdsErrorInstallationMediaAlreadyExists`.
 
 @see AWSRdsImportInstallationMediaMessage
 @see AWSRdsInstallationMedia
 */
- (AWSTask<AWSRdsInstallationMedia *> *)importInstallationMedia:(AWSRdsImportInstallationMediaMessage *)request;

/**
 <p>Imports the installation media for a DB engine that requires an on-premises customer provided license, such as SQL Server.</p>
 
 @param request A container for the necessary parameters to execute the ImportInstallationMedia service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorCustomAvailabilityZoneNotFound`, `AWSRdsErrorInstallationMediaAlreadyExists`.
 
 @see AWSRdsImportInstallationMediaMessage
 @see AWSRdsInstallationMedia
 */
- (void)importInstallationMedia:(AWSRdsImportInstallationMediaMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsInstallationMedia * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all tags on an Amazon RDS resource.</p><p>For an overview on tagging an Amazon RDS resource, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Tagging.html">Tagging Amazon RDS Resources</a> in the <i>Amazon RDS User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsTagListMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorDBSnapshotNotFound`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorDBProxyNotFound`, `AWSRdsErrorDBProxyTargetGroupNotFound`.
 
 @see AWSRdsListTagsForResourceMessage
 @see AWSRdsTagListMessage
 */
- (AWSTask<AWSRdsTagListMessage *> *)listTagsForResource:(AWSRdsListTagsForResourceMessage *)request;

/**
 <p>Lists all tags on an Amazon RDS resource.</p><p>For an overview on tagging an Amazon RDS resource, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Tagging.html">Tagging Amazon RDS Resources</a> in the <i>Amazon RDS User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorDBSnapshotNotFound`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorDBProxyNotFound`, `AWSRdsErrorDBProxyTargetGroupNotFound`.
 
 @see AWSRdsListTagsForResourceMessage
 @see AWSRdsTagListMessage
 */
- (void)listTagsForResource:(AWSRdsListTagsForResourceMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsTagListMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Override the system-default Secure Sockets Layer/Transport Layer Security (SSL/TLS) certificate for Amazon RDS for new DB instances temporarily, or remove the override.</p><p>By using this operation, you can specify an RDS-approved SSL/TLS certificate for new DB instances that is different from the default certificate provided by RDS. You can also use this operation to remove the override, so that new DB instances use the default certificate provided by RDS.</p><p>You might need to override the default certificate in the following situations:</p><ul><li><p>You already migrated your applications to support the latest certificate authority (CA) certificate, but the new CA certificate is not yet the RDS default CA certificate for the specified AWS Region.</p></li><li><p>RDS has already moved to a new default CA certificate for the specified AWS Region, but you are still in the process of supporting the new CA certificate. In this case, you temporarily need additional time to finish your application changes.</p></li></ul><p>For more information about rotating your SSL/TLS certificate for RDS DB engines, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.SSL-certificate-rotation.html"> Rotating Your SSL/TLS Certificate</a> in the <i>Amazon RDS User Guide</i>.</p><p>For more information about rotating your SSL/TLS certificate for Aurora DB engines, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.SSL-certificate-rotation.html"> Rotating Your SSL/TLS Certificate</a> in the <i>Amazon Aurora User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyCertificates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsModifyCertificatesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorCertificateNotFound`.
 
 @see AWSRdsModifyCertificatesMessage
 @see AWSRdsModifyCertificatesResult
 */
- (AWSTask<AWSRdsModifyCertificatesResult *> *)modifyCertificates:(AWSRdsModifyCertificatesMessage *)request;

/**
 <p>Override the system-default Secure Sockets Layer/Transport Layer Security (SSL/TLS) certificate for Amazon RDS for new DB instances temporarily, or remove the override.</p><p>By using this operation, you can specify an RDS-approved SSL/TLS certificate for new DB instances that is different from the default certificate provided by RDS. You can also use this operation to remove the override, so that new DB instances use the default certificate provided by RDS.</p><p>You might need to override the default certificate in the following situations:</p><ul><li><p>You already migrated your applications to support the latest certificate authority (CA) certificate, but the new CA certificate is not yet the RDS default CA certificate for the specified AWS Region.</p></li><li><p>RDS has already moved to a new default CA certificate for the specified AWS Region, but you are still in the process of supporting the new CA certificate. In this case, you temporarily need additional time to finish your application changes.</p></li></ul><p>For more information about rotating your SSL/TLS certificate for RDS DB engines, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.SSL-certificate-rotation.html"> Rotating Your SSL/TLS Certificate</a> in the <i>Amazon RDS User Guide</i>.</p><p>For more information about rotating your SSL/TLS certificate for Aurora DB engines, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.SSL-certificate-rotation.html"> Rotating Your SSL/TLS Certificate</a> in the <i>Amazon Aurora User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyCertificates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorCertificateNotFound`.
 
 @see AWSRdsModifyCertificatesMessage
 @see AWSRdsModifyCertificatesResult
 */
- (void)modifyCertificates:(AWSRdsModifyCertificatesMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsModifyCertificatesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Set the capacity of an Aurora Serverless DB cluster to a specific value.</p><p>Aurora Serverless scales seamlessly based on the workload on the DB cluster. In some cases, the capacity might not scale fast enough to meet a sudden change in workload, such as a large number of new transactions. Call <code>ModifyCurrentDBClusterCapacity</code> to set the capacity explicitly.</p><p>After this call sets the DB cluster capacity, Aurora Serverless can automatically scale the DB cluster based on the cooldown period for scaling up and the cooldown period for scaling down.</p><p>For more information about Aurora Serverless, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.html">Using Amazon Aurora Serverless</a> in the <i>Amazon Aurora User Guide</i>.</p><important><p>If you call <code>ModifyCurrentDBClusterCapacity</code> with the default <code>TimeoutAction</code>, connections that prevent Aurora Serverless from finding a scaling point might be dropped. For more information about scaling points, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.how-it-works.html#aurora-serverless.how-it-works.auto-scaling"> Autoscaling for Aurora Serverless</a> in the <i>Amazon Aurora User Guide</i>.</p></important><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyCurrentDBClusterCapacity service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDBClusterCapacityInfo`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidDBClusterCapacity`.
 
 @see AWSRdsModifyCurrentDBClusterCapacityMessage
 @see AWSRdsDBClusterCapacityInfo
 */
- (AWSTask<AWSRdsDBClusterCapacityInfo *> *)modifyCurrentDBClusterCapacity:(AWSRdsModifyCurrentDBClusterCapacityMessage *)request;

/**
 <p>Set the capacity of an Aurora Serverless DB cluster to a specific value.</p><p>Aurora Serverless scales seamlessly based on the workload on the DB cluster. In some cases, the capacity might not scale fast enough to meet a sudden change in workload, such as a large number of new transactions. Call <code>ModifyCurrentDBClusterCapacity</code> to set the capacity explicitly.</p><p>After this call sets the DB cluster capacity, Aurora Serverless can automatically scale the DB cluster based on the cooldown period for scaling up and the cooldown period for scaling down.</p><p>For more information about Aurora Serverless, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.html">Using Amazon Aurora Serverless</a> in the <i>Amazon Aurora User Guide</i>.</p><important><p>If you call <code>ModifyCurrentDBClusterCapacity</code> with the default <code>TimeoutAction</code>, connections that prevent Aurora Serverless from finding a scaling point might be dropped. For more information about scaling points, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.how-it-works.html#aurora-serverless.how-it-works.auto-scaling"> Autoscaling for Aurora Serverless</a> in the <i>Amazon Aurora User Guide</i>.</p></important><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyCurrentDBClusterCapacity service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidDBClusterCapacity`.
 
 @see AWSRdsModifyCurrentDBClusterCapacityMessage
 @see AWSRdsDBClusterCapacityInfo
 */
- (void)modifyCurrentDBClusterCapacity:(AWSRdsModifyCurrentDBClusterCapacityMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDBClusterCapacityInfo * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modify a setting for an Amazon Aurora DB cluster. You can change one or more database configuration parameters by specifying these parameters and the new values in the request. For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyDBCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsModifyDBClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorStorageQuotaExceeded`, `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorInvalidVPCNetworkState`, `AWSRdsErrorInvalidDBSubnetGroupState`, `AWSRdsErrorInvalidSubnet`, `AWSRdsErrorDBClusterParameterGroupNotFound`, `AWSRdsErrorInvalidDBSecurityGroupState`, `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorDBClusterAlreadyExists`, `AWSRdsErrorDomainNotFound`.
 
 @see AWSRdsModifyDBClusterMessage
 @see AWSRdsModifyDBClusterResult
 */
- (AWSTask<AWSRdsModifyDBClusterResult *> *)modifyDBCluster:(AWSRdsModifyDBClusterMessage *)request;

/**
 <p>Modify a setting for an Amazon Aurora DB cluster. You can change one or more database configuration parameters by specifying these parameters and the new values in the request. For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyDBCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorStorageQuotaExceeded`, `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorInvalidVPCNetworkState`, `AWSRdsErrorInvalidDBSubnetGroupState`, `AWSRdsErrorInvalidSubnet`, `AWSRdsErrorDBClusterParameterGroupNotFound`, `AWSRdsErrorInvalidDBSecurityGroupState`, `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorDBClusterAlreadyExists`, `AWSRdsErrorDomainNotFound`.
 
 @see AWSRdsModifyDBClusterMessage
 @see AWSRdsModifyDBClusterResult
 */
- (void)modifyDBCluster:(AWSRdsModifyDBClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsModifyDBClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the properties of an endpoint in an Amazon Aurora DB cluster.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyDBClusterEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDBClusterEndpoint`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidDBClusterEndpointState`, `AWSRdsErrorDBClusterEndpointNotFound`, `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorInvalidDBInstanceState`.
 
 @see AWSRdsModifyDBClusterEndpointMessage
 @see AWSRdsDBClusterEndpoint
 */
- (AWSTask<AWSRdsDBClusterEndpoint *> *)modifyDBClusterEndpoint:(AWSRdsModifyDBClusterEndpointMessage *)request;

/**
 <p>Modifies the properties of an endpoint in an Amazon Aurora DB cluster.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyDBClusterEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidDBClusterEndpointState`, `AWSRdsErrorDBClusterEndpointNotFound`, `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorInvalidDBInstanceState`.
 
 @see AWSRdsModifyDBClusterEndpointMessage
 @see AWSRdsDBClusterEndpoint
 */
- (void)modifyDBClusterEndpoint:(AWSRdsModifyDBClusterEndpointMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDBClusterEndpoint * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Modifies the parameters of a DB cluster parameter group. To modify more than one parameter, submit a list of the following: <code>ParameterName</code>, <code>ParameterValue</code>, and <code>ApplyMethod</code>. A maximum of 20 parameters can be modified in a single request. </p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>Changes to dynamic parameters are applied immediately. Changes to static parameters require a reboot without failover to the DB cluster associated with the parameter group before the change can take effect.</p></note><important><p>After you create a DB cluster parameter group, you should wait at least 5 minutes before creating your first DB cluster that uses that DB cluster parameter group as the default parameter group. This allows Amazon RDS to fully complete the create action before the parameter group is used as the default for a new DB cluster. This is especially important for parameters that are critical when creating the default database for a DB cluster, such as the character set for the default database defined by the <code>character_set_database</code> parameter. You can use the <i>Parameter Groups</i> option of the <a href="https://console.aws.amazon.com/rds/">Amazon RDS console</a> or the <code>DescribeDBClusterParameters</code> action to verify that your DB cluster parameter group has been created or modified.</p><p>If the modified DB cluster parameter group is used by an Aurora Serverless cluster, Aurora applies the update immediately. The cluster restart might interrupt your workload. In that case, your application must reopen any connections and retry any transactions that were active when the parameter changes took effect.</p></important><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyDBClusterParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDBClusterParameterGroupNameMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBParameterGroupNotFound`, `AWSRdsErrorInvalidDBParameterGroupState`.
 
 @see AWSRdsModifyDBClusterParameterGroupMessage
 @see AWSRdsDBClusterParameterGroupNameMessage
 */
- (AWSTask<AWSRdsDBClusterParameterGroupNameMessage *> *)modifyDBClusterParameterGroup:(AWSRdsModifyDBClusterParameterGroupMessage *)request;

/**
 <p> Modifies the parameters of a DB cluster parameter group. To modify more than one parameter, submit a list of the following: <code>ParameterName</code>, <code>ParameterValue</code>, and <code>ApplyMethod</code>. A maximum of 20 parameters can be modified in a single request. </p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>Changes to dynamic parameters are applied immediately. Changes to static parameters require a reboot without failover to the DB cluster associated with the parameter group before the change can take effect.</p></note><important><p>After you create a DB cluster parameter group, you should wait at least 5 minutes before creating your first DB cluster that uses that DB cluster parameter group as the default parameter group. This allows Amazon RDS to fully complete the create action before the parameter group is used as the default for a new DB cluster. This is especially important for parameters that are critical when creating the default database for a DB cluster, such as the character set for the default database defined by the <code>character_set_database</code> parameter. You can use the <i>Parameter Groups</i> option of the <a href="https://console.aws.amazon.com/rds/">Amazon RDS console</a> or the <code>DescribeDBClusterParameters</code> action to verify that your DB cluster parameter group has been created or modified.</p><p>If the modified DB cluster parameter group is used by an Aurora Serverless cluster, Aurora applies the update immediately. The cluster restart might interrupt your workload. In that case, your application must reopen any connections and retry any transactions that were active when the parameter changes took effect.</p></important><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyDBClusterParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBParameterGroupNotFound`, `AWSRdsErrorInvalidDBParameterGroupState`.
 
 @see AWSRdsModifyDBClusterParameterGroupMessage
 @see AWSRdsDBClusterParameterGroupNameMessage
 */
- (void)modifyDBClusterParameterGroup:(AWSRdsModifyDBClusterParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDBClusterParameterGroupNameMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds an attribute and values to, or removes an attribute and values from, a manual DB cluster snapshot.</p><p>To share a manual DB cluster snapshot with other AWS accounts, specify <code>restore</code> as the <code>AttributeName</code> and use the <code>ValuesToAdd</code> parameter to add a list of IDs of the AWS accounts that are authorized to restore the manual DB cluster snapshot. Use the value <code>all</code> to make the manual DB cluster snapshot public, which means that it can be copied or restored by all AWS accounts.</p><note><p>Don't add the <code>all</code> value for any manual DB cluster snapshots that contain private information that you don't want available to all AWS accounts.</p></note><p>If a manual DB cluster snapshot is encrypted, it can be shared, but only by specifying a list of authorized AWS account IDs for the <code>ValuesToAdd</code> parameter. You can't use <code>all</code> as a value for that parameter in this case.</p><p>To view which AWS accounts have access to copy or restore a manual DB cluster snapshot, or whether a manual DB cluster snapshot is public or private, use the <a>DescribeDBClusterSnapshotAttributes</a> API action. The accounts are returned as values for the <code>restore</code> attribute.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyDBClusterSnapshotAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsModifyDBClusterSnapshotAttributeResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterSnapshotNotFound`, `AWSRdsErrorInvalidDBClusterSnapshotState`, `AWSRdsErrorSharedSnapshotQuotaExceeded`.
 
 @see AWSRdsModifyDBClusterSnapshotAttributeMessage
 @see AWSRdsModifyDBClusterSnapshotAttributeResult
 */
- (AWSTask<AWSRdsModifyDBClusterSnapshotAttributeResult *> *)modifyDBClusterSnapshotAttribute:(AWSRdsModifyDBClusterSnapshotAttributeMessage *)request;

/**
 <p>Adds an attribute and values to, or removes an attribute and values from, a manual DB cluster snapshot.</p><p>To share a manual DB cluster snapshot with other AWS accounts, specify <code>restore</code> as the <code>AttributeName</code> and use the <code>ValuesToAdd</code> parameter to add a list of IDs of the AWS accounts that are authorized to restore the manual DB cluster snapshot. Use the value <code>all</code> to make the manual DB cluster snapshot public, which means that it can be copied or restored by all AWS accounts.</p><note><p>Don't add the <code>all</code> value for any manual DB cluster snapshots that contain private information that you don't want available to all AWS accounts.</p></note><p>If a manual DB cluster snapshot is encrypted, it can be shared, but only by specifying a list of authorized AWS account IDs for the <code>ValuesToAdd</code> parameter. You can't use <code>all</code> as a value for that parameter in this case.</p><p>To view which AWS accounts have access to copy or restore a manual DB cluster snapshot, or whether a manual DB cluster snapshot is public or private, use the <a>DescribeDBClusterSnapshotAttributes</a> API action. The accounts are returned as values for the <code>restore</code> attribute.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyDBClusterSnapshotAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterSnapshotNotFound`, `AWSRdsErrorInvalidDBClusterSnapshotState`, `AWSRdsErrorSharedSnapshotQuotaExceeded`.
 
 @see AWSRdsModifyDBClusterSnapshotAttributeMessage
 @see AWSRdsModifyDBClusterSnapshotAttributeResult
 */
- (void)modifyDBClusterSnapshotAttribute:(AWSRdsModifyDBClusterSnapshotAttributeMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsModifyDBClusterSnapshotAttributeResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies settings for a DB instance. You can change one or more database configuration parameters by specifying these parameters and the new values in the request. To learn what modifications you can make to your DB instance, call <code>DescribeValidDBInstanceModifications</code> before you call <code>ModifyDBInstance</code>. </p>
 
 @param request A container for the necessary parameters to execute the ModifyDBInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsModifyDBInstanceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorInvalidDBSecurityGroupState`, `AWSRdsErrorDBInstanceAlreadyExists`, `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorDBSecurityGroupNotFound`, `AWSRdsErrorDBParameterGroupNotFound`, `AWSRdsErrorInsufficientDBInstanceCapacity`, `AWSRdsErrorStorageQuotaExceeded`, `AWSRdsErrorInvalidVPCNetworkState`, `AWSRdsErrorProvisionedIopsNotAvailableInAZ`, `AWSRdsErrorOptionGroupNotFound`, `AWSRdsErrorDBUpgradeDependencyFailure`, `AWSRdsErrorStorageTypeNotSupported`, `AWSRdsErrorAuthorizationNotFound`, `AWSRdsErrorCertificateNotFound`, `AWSRdsErrorDomainNotFound`, `AWSRdsErrorBackupPolicyNotFound`.
 
 @see AWSRdsModifyDBInstanceMessage
 @see AWSRdsModifyDBInstanceResult
 */
- (AWSTask<AWSRdsModifyDBInstanceResult *> *)modifyDBInstance:(AWSRdsModifyDBInstanceMessage *)request;

/**
 <p>Modifies settings for a DB instance. You can change one or more database configuration parameters by specifying these parameters and the new values in the request. To learn what modifications you can make to your DB instance, call <code>DescribeValidDBInstanceModifications</code> before you call <code>ModifyDBInstance</code>. </p>
 
 @param request A container for the necessary parameters to execute the ModifyDBInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorInvalidDBSecurityGroupState`, `AWSRdsErrorDBInstanceAlreadyExists`, `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorDBSecurityGroupNotFound`, `AWSRdsErrorDBParameterGroupNotFound`, `AWSRdsErrorInsufficientDBInstanceCapacity`, `AWSRdsErrorStorageQuotaExceeded`, `AWSRdsErrorInvalidVPCNetworkState`, `AWSRdsErrorProvisionedIopsNotAvailableInAZ`, `AWSRdsErrorOptionGroupNotFound`, `AWSRdsErrorDBUpgradeDependencyFailure`, `AWSRdsErrorStorageTypeNotSupported`, `AWSRdsErrorAuthorizationNotFound`, `AWSRdsErrorCertificateNotFound`, `AWSRdsErrorDomainNotFound`, `AWSRdsErrorBackupPolicyNotFound`.
 
 @see AWSRdsModifyDBInstanceMessage
 @see AWSRdsModifyDBInstanceResult
 */
- (void)modifyDBInstance:(AWSRdsModifyDBInstanceMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsModifyDBInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Modifies the parameters of a DB parameter group. To modify more than one parameter, submit a list of the following: <code>ParameterName</code>, <code>ParameterValue</code>, and <code>ApplyMethod</code>. A maximum of 20 parameters can be modified in a single request. </p><note><p>Changes to dynamic parameters are applied immediately. Changes to static parameters require a reboot without failover to the DB instance associated with the parameter group before the change can take effect.</p></note><important><p>After you modify a DB parameter group, you should wait at least 5 minutes before creating your first DB instance that uses that DB parameter group as the default parameter group. This allows Amazon RDS to fully complete the modify action before the parameter group is used as the default for a new DB instance. This is especially important for parameters that are critical when creating the default database for a DB instance, such as the character set for the default database defined by the <code>character_set_database</code> parameter. You can use the <i>Parameter Groups</i> option of the <a href="https://console.aws.amazon.com/rds/">Amazon RDS console</a> or the <i>DescribeDBParameters</i> command to verify that your DB parameter group has been created or modified.</p></important>
 
 @param request A container for the necessary parameters to execute the ModifyDBParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDBParameterGroupNameMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBParameterGroupNotFound`, `AWSRdsErrorInvalidDBParameterGroupState`.
 
 @see AWSRdsModifyDBParameterGroupMessage
 @see AWSRdsDBParameterGroupNameMessage
 */
- (AWSTask<AWSRdsDBParameterGroupNameMessage *> *)modifyDBParameterGroup:(AWSRdsModifyDBParameterGroupMessage *)request;

/**
 <p> Modifies the parameters of a DB parameter group. To modify more than one parameter, submit a list of the following: <code>ParameterName</code>, <code>ParameterValue</code>, and <code>ApplyMethod</code>. A maximum of 20 parameters can be modified in a single request. </p><note><p>Changes to dynamic parameters are applied immediately. Changes to static parameters require a reboot without failover to the DB instance associated with the parameter group before the change can take effect.</p></note><important><p>After you modify a DB parameter group, you should wait at least 5 minutes before creating your first DB instance that uses that DB parameter group as the default parameter group. This allows Amazon RDS to fully complete the modify action before the parameter group is used as the default for a new DB instance. This is especially important for parameters that are critical when creating the default database for a DB instance, such as the character set for the default database defined by the <code>character_set_database</code> parameter. You can use the <i>Parameter Groups</i> option of the <a href="https://console.aws.amazon.com/rds/">Amazon RDS console</a> or the <i>DescribeDBParameters</i> command to verify that your DB parameter group has been created or modified.</p></important>
 
 @param request A container for the necessary parameters to execute the ModifyDBParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBParameterGroupNotFound`, `AWSRdsErrorInvalidDBParameterGroupState`.
 
 @see AWSRdsModifyDBParameterGroupMessage
 @see AWSRdsDBParameterGroupNameMessage
 */
- (void)modifyDBParameterGroup:(AWSRdsModifyDBParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDBParameterGroupNameMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Changes the settings for an existing DB proxy.</p>
 
 @param request A container for the necessary parameters to execute the ModifyDBProxy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsModifyDBProxyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBProxyNotFound`, `AWSRdsErrorDBProxyAlreadyExists`, `AWSRdsErrorInvalidDBProxyState`.
 
 @see AWSRdsModifyDBProxyRequest
 @see AWSRdsModifyDBProxyResponse
 */
- (AWSTask<AWSRdsModifyDBProxyResponse *> *)modifyDBProxy:(AWSRdsModifyDBProxyRequest *)request;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Changes the settings for an existing DB proxy.</p>
 
 @param request A container for the necessary parameters to execute the ModifyDBProxy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBProxyNotFound`, `AWSRdsErrorDBProxyAlreadyExists`, `AWSRdsErrorInvalidDBProxyState`.
 
 @see AWSRdsModifyDBProxyRequest
 @see AWSRdsModifyDBProxyResponse
 */
- (void)modifyDBProxy:(AWSRdsModifyDBProxyRequest *)request completionHandler:(void (^ _Nullable)(AWSRdsModifyDBProxyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Modifies the properties of a <code>DBProxyTargetGroup</code>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyDBProxyTargetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsModifyDBProxyTargetGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBProxyNotFound`, `AWSRdsErrorDBProxyTargetGroupNotFound`, `AWSRdsErrorInvalidDBProxyState`.
 
 @see AWSRdsModifyDBProxyTargetGroupRequest
 @see AWSRdsModifyDBProxyTargetGroupResponse
 */
- (AWSTask<AWSRdsModifyDBProxyTargetGroupResponse *> *)modifyDBProxyTargetGroup:(AWSRdsModifyDBProxyTargetGroupRequest *)request;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Modifies the properties of a <code>DBProxyTargetGroup</code>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyDBProxyTargetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBProxyNotFound`, `AWSRdsErrorDBProxyTargetGroupNotFound`, `AWSRdsErrorInvalidDBProxyState`.
 
 @see AWSRdsModifyDBProxyTargetGroupRequest
 @see AWSRdsModifyDBProxyTargetGroupResponse
 */
- (void)modifyDBProxyTargetGroup:(AWSRdsModifyDBProxyTargetGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSRdsModifyDBProxyTargetGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a manual DB snapshot with a new engine version. The snapshot can be encrypted or unencrypted, but not shared or public. </p><p>Amazon RDS supports upgrading DB snapshots for MySQL, Oracle, and PostgreSQL. </p>
 
 @param request A container for the necessary parameters to execute the ModifyDBSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsModifyDBSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSnapshotNotFound`.
 
 @see AWSRdsModifyDBSnapshotMessage
 @see AWSRdsModifyDBSnapshotResult
 */
- (AWSTask<AWSRdsModifyDBSnapshotResult *> *)modifyDBSnapshot:(AWSRdsModifyDBSnapshotMessage *)request;

/**
 <p>Updates a manual DB snapshot with a new engine version. The snapshot can be encrypted or unencrypted, but not shared or public. </p><p>Amazon RDS supports upgrading DB snapshots for MySQL, Oracle, and PostgreSQL. </p>
 
 @param request A container for the necessary parameters to execute the ModifyDBSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSnapshotNotFound`.
 
 @see AWSRdsModifyDBSnapshotMessage
 @see AWSRdsModifyDBSnapshotResult
 */
- (void)modifyDBSnapshot:(AWSRdsModifyDBSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsModifyDBSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds an attribute and values to, or removes an attribute and values from, a manual DB snapshot.</p><p>To share a manual DB snapshot with other AWS accounts, specify <code>restore</code> as the <code>AttributeName</code> and use the <code>ValuesToAdd</code> parameter to add a list of IDs of the AWS accounts that are authorized to restore the manual DB snapshot. Uses the value <code>all</code> to make the manual DB snapshot public, which means it can be copied or restored by all AWS accounts.</p><note><p>Don't add the <code>all</code> value for any manual DB snapshots that contain private information that you don't want available to all AWS accounts.</p></note><p>If the manual DB snapshot is encrypted, it can be shared, but only by specifying a list of authorized AWS account IDs for the <code>ValuesToAdd</code> parameter. You can't use <code>all</code> as a value for that parameter in this case.</p><p>To view which AWS accounts have access to copy or restore a manual DB snapshot, or whether a manual DB snapshot public or private, use the <a>DescribeDBSnapshotAttributes</a> API action. The accounts are returned as values for the <code>restore</code> attribute.</p>
 
 @param request A container for the necessary parameters to execute the ModifyDBSnapshotAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsModifyDBSnapshotAttributeResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSnapshotNotFound`, `AWSRdsErrorInvalidDBSnapshotState`, `AWSRdsErrorSharedSnapshotQuotaExceeded`.
 
 @see AWSRdsModifyDBSnapshotAttributeMessage
 @see AWSRdsModifyDBSnapshotAttributeResult
 */
- (AWSTask<AWSRdsModifyDBSnapshotAttributeResult *> *)modifyDBSnapshotAttribute:(AWSRdsModifyDBSnapshotAttributeMessage *)request;

/**
 <p>Adds an attribute and values to, or removes an attribute and values from, a manual DB snapshot.</p><p>To share a manual DB snapshot with other AWS accounts, specify <code>restore</code> as the <code>AttributeName</code> and use the <code>ValuesToAdd</code> parameter to add a list of IDs of the AWS accounts that are authorized to restore the manual DB snapshot. Uses the value <code>all</code> to make the manual DB snapshot public, which means it can be copied or restored by all AWS accounts.</p><note><p>Don't add the <code>all</code> value for any manual DB snapshots that contain private information that you don't want available to all AWS accounts.</p></note><p>If the manual DB snapshot is encrypted, it can be shared, but only by specifying a list of authorized AWS account IDs for the <code>ValuesToAdd</code> parameter. You can't use <code>all</code> as a value for that parameter in this case.</p><p>To view which AWS accounts have access to copy or restore a manual DB snapshot, or whether a manual DB snapshot public or private, use the <a>DescribeDBSnapshotAttributes</a> API action. The accounts are returned as values for the <code>restore</code> attribute.</p>
 
 @param request A container for the necessary parameters to execute the ModifyDBSnapshotAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSnapshotNotFound`, `AWSRdsErrorInvalidDBSnapshotState`, `AWSRdsErrorSharedSnapshotQuotaExceeded`.
 
 @see AWSRdsModifyDBSnapshotAttributeMessage
 @see AWSRdsModifyDBSnapshotAttributeResult
 */
- (void)modifyDBSnapshotAttribute:(AWSRdsModifyDBSnapshotAttributeMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsModifyDBSnapshotAttributeResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies an existing DB subnet group. DB subnet groups must contain at least one subnet in at least two AZs in the AWS Region.</p>
 
 @param request A container for the necessary parameters to execute the ModifyDBSubnetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsModifyDBSubnetGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorDBSubnetQuotaExceeded`, `AWSRdsErrorSubnetAlreadyInUse`, `AWSRdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSRdsErrorInvalidSubnet`.
 
 @see AWSRdsModifyDBSubnetGroupMessage
 @see AWSRdsModifyDBSubnetGroupResult
 */
- (AWSTask<AWSRdsModifyDBSubnetGroupResult *> *)modifyDBSubnetGroup:(AWSRdsModifyDBSubnetGroupMessage *)request;

/**
 <p>Modifies an existing DB subnet group. DB subnet groups must contain at least one subnet in at least two AZs in the AWS Region.</p>
 
 @param request A container for the necessary parameters to execute the ModifyDBSubnetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorDBSubnetQuotaExceeded`, `AWSRdsErrorSubnetAlreadyInUse`, `AWSRdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSRdsErrorInvalidSubnet`.
 
 @see AWSRdsModifyDBSubnetGroupMessage
 @see AWSRdsModifyDBSubnetGroupResult
 */
- (void)modifyDBSubnetGroup:(AWSRdsModifyDBSubnetGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsModifyDBSubnetGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies an existing RDS event notification subscription. You can't modify the source identifiers using this call. To change source identifiers for a subscription, use the <code>AddSourceIdentifierToSubscription</code> and <code>RemoveSourceIdentifierFromSubscription</code> calls.</p><p>You can see a list of the event categories for a given SourceType in the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html">Events</a> topic in the <i>Amazon RDS User Guide</i> or by using the <b>DescribeEventCategories</b> action.</p>
 
 @param request A container for the necessary parameters to execute the ModifyEventSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsModifyEventSubscriptionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorEventSubscriptionQuotaExceeded`, `AWSRdsErrorSubscriptionNotFound`, `AWSRdsErrorSNSInvalidTopic`, `AWSRdsErrorSNSNoAuthorization`, `AWSRdsErrorSNSTopicArnNotFound`, `AWSRdsErrorSubscriptionCategoryNotFound`.
 
 @see AWSRdsModifyEventSubscriptionMessage
 @see AWSRdsModifyEventSubscriptionResult
 */
- (AWSTask<AWSRdsModifyEventSubscriptionResult *> *)modifyEventSubscription:(AWSRdsModifyEventSubscriptionMessage *)request;

/**
 <p>Modifies an existing RDS event notification subscription. You can't modify the source identifiers using this call. To change source identifiers for a subscription, use the <code>AddSourceIdentifierToSubscription</code> and <code>RemoveSourceIdentifierFromSubscription</code> calls.</p><p>You can see a list of the event categories for a given SourceType in the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html">Events</a> topic in the <i>Amazon RDS User Guide</i> or by using the <b>DescribeEventCategories</b> action.</p>
 
 @param request A container for the necessary parameters to execute the ModifyEventSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorEventSubscriptionQuotaExceeded`, `AWSRdsErrorSubscriptionNotFound`, `AWSRdsErrorSNSInvalidTopic`, `AWSRdsErrorSNSNoAuthorization`, `AWSRdsErrorSNSTopicArnNotFound`, `AWSRdsErrorSubscriptionCategoryNotFound`.
 
 @see AWSRdsModifyEventSubscriptionMessage
 @see AWSRdsModifyEventSubscriptionResult
 */
- (void)modifyEventSubscription:(AWSRdsModifyEventSubscriptionMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsModifyEventSubscriptionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Modify a setting for an Amazon Aurora global cluster. You can change one or more database configuration parameters by specifying these parameters and the new values in the request. For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyGlobalCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsModifyGlobalClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorGlobalClusterNotFound`, `AWSRdsErrorInvalidGlobalClusterState`.
 
 @see AWSRdsModifyGlobalClusterMessage
 @see AWSRdsModifyGlobalClusterResult
 */
- (AWSTask<AWSRdsModifyGlobalClusterResult *> *)modifyGlobalCluster:(AWSRdsModifyGlobalClusterMessage *)request;

/**
 <p> Modify a setting for an Amazon Aurora global cluster. You can change one or more database configuration parameters by specifying these parameters and the new values in the request. For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyGlobalCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorGlobalClusterNotFound`, `AWSRdsErrorInvalidGlobalClusterState`.
 
 @see AWSRdsModifyGlobalClusterMessage
 @see AWSRdsModifyGlobalClusterResult
 */
- (void)modifyGlobalCluster:(AWSRdsModifyGlobalClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsModifyGlobalClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies an existing option group.</p>
 
 @param request A container for the necessary parameters to execute the ModifyOptionGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsModifyOptionGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidOptionGroupState`, `AWSRdsErrorOptionGroupNotFound`.
 
 @see AWSRdsModifyOptionGroupMessage
 @see AWSRdsModifyOptionGroupResult
 */
- (AWSTask<AWSRdsModifyOptionGroupResult *> *)modifyOptionGroup:(AWSRdsModifyOptionGroupMessage *)request;

/**
 <p>Modifies an existing option group.</p>
 
 @param request A container for the necessary parameters to execute the ModifyOptionGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidOptionGroupState`, `AWSRdsErrorOptionGroupNotFound`.
 
 @see AWSRdsModifyOptionGroupMessage
 @see AWSRdsModifyOptionGroupResult
 */
- (void)modifyOptionGroup:(AWSRdsModifyOptionGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsModifyOptionGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Promotes a read replica DB instance to a standalone DB instance.</p><note><ul><li><p>Backup duration is a function of the amount of changes to the database since the previous backup. If you plan to promote a read replica to a standalone instance, we recommend that you enable backups and complete at least one backup prior to promotion. In addition, a read replica cannot be promoted to a standalone instance when it is in the <code>backing-up</code> status. If you have enabled backups on your read replica, configure the automated backup window so that daily backups do not interfere with read replica promotion.</p></li><li><p>This command doesn't apply to Aurora MySQL and Aurora PostgreSQL.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the PromoteReadReplica service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsPromoteReadReplicaResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorDBInstanceNotFound`.
 
 @see AWSRdsPromoteReadReplicaMessage
 @see AWSRdsPromoteReadReplicaResult
 */
- (AWSTask<AWSRdsPromoteReadReplicaResult *> *)promoteReadReplica:(AWSRdsPromoteReadReplicaMessage *)request;

/**
 <p>Promotes a read replica DB instance to a standalone DB instance.</p><note><ul><li><p>Backup duration is a function of the amount of changes to the database since the previous backup. If you plan to promote a read replica to a standalone instance, we recommend that you enable backups and complete at least one backup prior to promotion. In addition, a read replica cannot be promoted to a standalone instance when it is in the <code>backing-up</code> status. If you have enabled backups on your read replica, configure the automated backup window so that daily backups do not interfere with read replica promotion.</p></li><li><p>This command doesn't apply to Aurora MySQL and Aurora PostgreSQL.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the PromoteReadReplica service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorDBInstanceNotFound`.
 
 @see AWSRdsPromoteReadReplicaMessage
 @see AWSRdsPromoteReadReplicaResult
 */
- (void)promoteReadReplica:(AWSRdsPromoteReadReplicaMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsPromoteReadReplicaResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Promotes a read replica DB cluster to a standalone DB cluster.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the PromoteReadReplicaDBCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsPromoteReadReplicaDBClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorInvalidDBClusterState`.
 
 @see AWSRdsPromoteReadReplicaDBClusterMessage
 @see AWSRdsPromoteReadReplicaDBClusterResult
 */
- (AWSTask<AWSRdsPromoteReadReplicaDBClusterResult *> *)promoteReadReplicaDBCluster:(AWSRdsPromoteReadReplicaDBClusterMessage *)request;

/**
 <p>Promotes a read replica DB cluster to a standalone DB cluster.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the PromoteReadReplicaDBCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorInvalidDBClusterState`.
 
 @see AWSRdsPromoteReadReplicaDBClusterMessage
 @see AWSRdsPromoteReadReplicaDBClusterResult
 */
- (void)promoteReadReplicaDBCluster:(AWSRdsPromoteReadReplicaDBClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsPromoteReadReplicaDBClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Purchases a reserved DB instance offering.</p>
 
 @param request A container for the necessary parameters to execute the PurchaseReservedDBInstancesOffering service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsPurchaseReservedDBInstancesOfferingResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorReservedDBInstancesOfferingNotFound`, `AWSRdsErrorReservedDBInstanceAlreadyExists`, `AWSRdsErrorReservedDBInstanceQuotaExceeded`.
 
 @see AWSRdsPurchaseReservedDBInstancesOfferingMessage
 @see AWSRdsPurchaseReservedDBInstancesOfferingResult
 */
- (AWSTask<AWSRdsPurchaseReservedDBInstancesOfferingResult *> *)purchaseReservedDBInstancesOffering:(AWSRdsPurchaseReservedDBInstancesOfferingMessage *)request;

/**
 <p>Purchases a reserved DB instance offering.</p>
 
 @param request A container for the necessary parameters to execute the PurchaseReservedDBInstancesOffering service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorReservedDBInstancesOfferingNotFound`, `AWSRdsErrorReservedDBInstanceAlreadyExists`, `AWSRdsErrorReservedDBInstanceQuotaExceeded`.
 
 @see AWSRdsPurchaseReservedDBInstancesOfferingMessage
 @see AWSRdsPurchaseReservedDBInstancesOfferingResult
 */
- (void)purchaseReservedDBInstancesOffering:(AWSRdsPurchaseReservedDBInstancesOfferingMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsPurchaseReservedDBInstancesOfferingResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>You might need to reboot your DB instance, usually for maintenance reasons. For example, if you make certain modifications, or if you change the DB parameter group associated with the DB instance, you must reboot the instance for the changes to take effect. </p><p>Rebooting a DB instance restarts the database engine service. Rebooting a DB instance results in a momentary outage, during which the DB instance status is set to rebooting. </p><p>For more information about rebooting, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_RebootInstance.html">Rebooting a DB Instance</a> in the <i>Amazon RDS User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the RebootDBInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsRebootDBInstanceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorDBInstanceNotFound`.
 
 @see AWSRdsRebootDBInstanceMessage
 @see AWSRdsRebootDBInstanceResult
 */
- (AWSTask<AWSRdsRebootDBInstanceResult *> *)rebootDBInstance:(AWSRdsRebootDBInstanceMessage *)request;

/**
 <p>You might need to reboot your DB instance, usually for maintenance reasons. For example, if you make certain modifications, or if you change the DB parameter group associated with the DB instance, you must reboot the instance for the changes to take effect. </p><p>Rebooting a DB instance restarts the database engine service. Rebooting a DB instance results in a momentary outage, during which the DB instance status is set to rebooting. </p><p>For more information about rebooting, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_RebootInstance.html">Rebooting a DB Instance</a> in the <i>Amazon RDS User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the RebootDBInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorDBInstanceNotFound`.
 
 @see AWSRdsRebootDBInstanceMessage
 @see AWSRdsRebootDBInstanceResult
 */
- (void)rebootDBInstance:(AWSRdsRebootDBInstanceMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsRebootDBInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Associate one or more <code>DBProxyTarget</code> data structures with a <code>DBProxyTargetGroup</code>.</p>
 
 @param request A container for the necessary parameters to execute the RegisterDBProxyTargets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsRegisterDBProxyTargetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBProxyNotFound`, `AWSRdsErrorDBProxyTargetGroupNotFound`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorDBProxyTargetAlreadyRegistered`, `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidDBProxyState`.
 
 @see AWSRdsRegisterDBProxyTargetsRequest
 @see AWSRdsRegisterDBProxyTargetsResponse
 */
- (AWSTask<AWSRdsRegisterDBProxyTargetsResponse *> *)registerDBProxyTargets:(AWSRdsRegisterDBProxyTargetsRequest *)request;

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Associate one or more <code>DBProxyTarget</code> data structures with a <code>DBProxyTargetGroup</code>.</p>
 
 @param request A container for the necessary parameters to execute the RegisterDBProxyTargets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBProxyNotFound`, `AWSRdsErrorDBProxyTargetGroupNotFound`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorDBProxyTargetAlreadyRegistered`, `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidDBProxyState`.
 
 @see AWSRdsRegisterDBProxyTargetsRequest
 @see AWSRdsRegisterDBProxyTargetsResponse
 */
- (void)registerDBProxyTargets:(AWSRdsRegisterDBProxyTargetsRequest *)request completionHandler:(void (^ _Nullable)(AWSRdsRegisterDBProxyTargetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Detaches an Aurora secondary cluster from an Aurora global database cluster. The cluster becomes a standalone cluster with read-write capability instead of being read-only and receiving data from a primary cluster in a different region. </p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the RemoveFromGlobalCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsRemoveFromGlobalClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorGlobalClusterNotFound`, `AWSRdsErrorInvalidGlobalClusterState`, `AWSRdsErrorDBClusterNotFound`.
 
 @see AWSRdsRemoveFromGlobalClusterMessage
 @see AWSRdsRemoveFromGlobalClusterResult
 */
- (AWSTask<AWSRdsRemoveFromGlobalClusterResult *> *)removeFromGlobalCluster:(AWSRdsRemoveFromGlobalClusterMessage *)request;

/**
 <p> Detaches an Aurora secondary cluster from an Aurora global database cluster. The cluster becomes a standalone cluster with read-write capability instead of being read-only and receiving data from a primary cluster in a different region. </p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the RemoveFromGlobalCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorGlobalClusterNotFound`, `AWSRdsErrorInvalidGlobalClusterState`, `AWSRdsErrorDBClusterNotFound`.
 
 @see AWSRdsRemoveFromGlobalClusterMessage
 @see AWSRdsRemoveFromGlobalClusterResult
 */
- (void)removeFromGlobalCluster:(AWSRdsRemoveFromGlobalClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsRemoveFromGlobalClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates an AWS Identity and Access Management (IAM) role from an Amazon Aurora DB cluster. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Integrating.Authorizing.html">Authorizing Amazon Aurora MySQL to Access Other AWS Services on Your Behalf </a> in the <i>Amazon Aurora User Guide</i>.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the RemoveRoleFromDBCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorDBClusterRoleNotFound`, `AWSRdsErrorInvalidDBClusterState`.
 
 @see AWSRdsRemoveRoleFromDBClusterMessage
 */
- (AWSTask *)removeRoleFromDBCluster:(AWSRdsRemoveRoleFromDBClusterMessage *)request;

/**
 <p>Disassociates an AWS Identity and Access Management (IAM) role from an Amazon Aurora DB cluster. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Integrating.Authorizing.html">Authorizing Amazon Aurora MySQL to Access Other AWS Services on Your Behalf </a> in the <i>Amazon Aurora User Guide</i>.</p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the RemoveRoleFromDBCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorDBClusterRoleNotFound`, `AWSRdsErrorInvalidDBClusterState`.
 
 @see AWSRdsRemoveRoleFromDBClusterMessage
 */
- (void)removeRoleFromDBCluster:(AWSRdsRemoveRoleFromDBClusterMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates an AWS Identity and Access Management (IAM) role from a DB instance.</p>
 
 @param request A container for the necessary parameters to execute the RemoveRoleFromDBInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorDBInstanceRoleNotFound`, `AWSRdsErrorInvalidDBInstanceState`.
 
 @see AWSRdsRemoveRoleFromDBInstanceMessage
 */
- (AWSTask *)removeRoleFromDBInstance:(AWSRdsRemoveRoleFromDBInstanceMessage *)request;

/**
 <p>Disassociates an AWS Identity and Access Management (IAM) role from a DB instance.</p>
 
 @param request A container for the necessary parameters to execute the RemoveRoleFromDBInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorDBInstanceRoleNotFound`, `AWSRdsErrorInvalidDBInstanceState`.
 
 @see AWSRdsRemoveRoleFromDBInstanceMessage
 */
- (void)removeRoleFromDBInstance:(AWSRdsRemoveRoleFromDBInstanceMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes a source identifier from an existing RDS event notification subscription.</p>
 
 @param request A container for the necessary parameters to execute the RemoveSourceIdentifierFromSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsRemoveSourceIdentifierFromSubscriptionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorSubscriptionNotFound`, `AWSRdsErrorSourceNotFound`.
 
 @see AWSRdsRemoveSourceIdentifierFromSubscriptionMessage
 @see AWSRdsRemoveSourceIdentifierFromSubscriptionResult
 */
- (AWSTask<AWSRdsRemoveSourceIdentifierFromSubscriptionResult *> *)removeSourceIdentifierFromSubscription:(AWSRdsRemoveSourceIdentifierFromSubscriptionMessage *)request;

/**
 <p>Removes a source identifier from an existing RDS event notification subscription.</p>
 
 @param request A container for the necessary parameters to execute the RemoveSourceIdentifierFromSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorSubscriptionNotFound`, `AWSRdsErrorSourceNotFound`.
 
 @see AWSRdsRemoveSourceIdentifierFromSubscriptionMessage
 @see AWSRdsRemoveSourceIdentifierFromSubscriptionResult
 */
- (void)removeSourceIdentifierFromSubscription:(AWSRdsRemoveSourceIdentifierFromSubscriptionMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsRemoveSourceIdentifierFromSubscriptionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes metadata tags from an Amazon RDS resource.</p><p>For an overview on tagging an Amazon RDS resource, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Tagging.html">Tagging Amazon RDS Resources</a> in the <i>Amazon RDS User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the RemoveTagsFromResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorDBSnapshotNotFound`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorDBProxyNotFound`, `AWSRdsErrorDBProxyTargetGroupNotFound`.
 
 @see AWSRdsRemoveTagsFromResourceMessage
 */
- (AWSTask *)removeTagsFromResource:(AWSRdsRemoveTagsFromResourceMessage *)request;

/**
 <p>Removes metadata tags from an Amazon RDS resource.</p><p>For an overview on tagging an Amazon RDS resource, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Tagging.html">Tagging Amazon RDS Resources</a> in the <i>Amazon RDS User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the RemoveTagsFromResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorDBSnapshotNotFound`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorDBProxyNotFound`, `AWSRdsErrorDBProxyTargetGroupNotFound`.
 
 @see AWSRdsRemoveTagsFromResourceMessage
 */
- (void)removeTagsFromResource:(AWSRdsRemoveTagsFromResourceMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p> Modifies the parameters of a DB cluster parameter group to the default value. To reset specific parameters submit a list of the following: <code>ParameterName</code> and <code>ApplyMethod</code>. To reset the entire DB cluster parameter group, specify the <code>DBClusterParameterGroupName</code> and <code>ResetAllParameters</code> parameters. </p><p> When resetting the entire group, dynamic parameters are updated immediately and static parameters are set to <code>pending-reboot</code> to take effect on the next DB instance restart or <code>RebootDBInstance</code> request. You must call <code>RebootDBInstance</code> for every DB instance in your DB cluster that you want the updated static parameter to apply to.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ResetDBClusterParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDBClusterParameterGroupNameMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBParameterGroupState`, `AWSRdsErrorDBParameterGroupNotFound`.
 
 @see AWSRdsResetDBClusterParameterGroupMessage
 @see AWSRdsDBClusterParameterGroupNameMessage
 */
- (AWSTask<AWSRdsDBClusterParameterGroupNameMessage *> *)resetDBClusterParameterGroup:(AWSRdsResetDBClusterParameterGroupMessage *)request;

/**
 <p> Modifies the parameters of a DB cluster parameter group to the default value. To reset specific parameters submit a list of the following: <code>ParameterName</code> and <code>ApplyMethod</code>. To reset the entire DB cluster parameter group, specify the <code>DBClusterParameterGroupName</code> and <code>ResetAllParameters</code> parameters. </p><p> When resetting the entire group, dynamic parameters are updated immediately and static parameters are set to <code>pending-reboot</code> to take effect on the next DB instance restart or <code>RebootDBInstance</code> request. You must call <code>RebootDBInstance</code> for every DB instance in your DB cluster that you want the updated static parameter to apply to.</p><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the ResetDBClusterParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBParameterGroupState`, `AWSRdsErrorDBParameterGroupNotFound`.
 
 @see AWSRdsResetDBClusterParameterGroupMessage
 @see AWSRdsDBClusterParameterGroupNameMessage
 */
- (void)resetDBClusterParameterGroup:(AWSRdsResetDBClusterParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDBClusterParameterGroupNameMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the parameters of a DB parameter group to the engine/system default value. To reset specific parameters, provide a list of the following: <code>ParameterName</code> and <code>ApplyMethod</code>. To reset the entire DB parameter group, specify the <code>DBParameterGroup</code> name and <code>ResetAllParameters</code> parameters. When resetting the entire group, dynamic parameters are updated immediately and static parameters are set to <code>pending-reboot</code> to take effect on the next DB instance restart or <code>RebootDBInstance</code> request. </p>
 
 @param request A container for the necessary parameters to execute the ResetDBParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsDBParameterGroupNameMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBParameterGroupState`, `AWSRdsErrorDBParameterGroupNotFound`.
 
 @see AWSRdsResetDBParameterGroupMessage
 @see AWSRdsDBParameterGroupNameMessage
 */
- (AWSTask<AWSRdsDBParameterGroupNameMessage *> *)resetDBParameterGroup:(AWSRdsResetDBParameterGroupMessage *)request;

/**
 <p>Modifies the parameters of a DB parameter group to the engine/system default value. To reset specific parameters, provide a list of the following: <code>ParameterName</code> and <code>ApplyMethod</code>. To reset the entire DB parameter group, specify the <code>DBParameterGroup</code> name and <code>ResetAllParameters</code> parameters. When resetting the entire group, dynamic parameters are updated immediately and static parameters are set to <code>pending-reboot</code> to take effect on the next DB instance restart or <code>RebootDBInstance</code> request. </p>
 
 @param request A container for the necessary parameters to execute the ResetDBParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBParameterGroupState`, `AWSRdsErrorDBParameterGroupNotFound`.
 
 @see AWSRdsResetDBParameterGroupMessage
 @see AWSRdsDBParameterGroupNameMessage
 */
- (void)resetDBParameterGroup:(AWSRdsResetDBParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsDBParameterGroupNameMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon Aurora DB cluster from data stored in an Amazon S3 bucket. Amazon RDS must be authorized to access the Amazon S3 bucket and the data must be created using the Percona XtraBackup utility as described in <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Migrating.html"> Migrating Data to an Amazon Aurora MySQL DB Cluster</a> in the <i>Amazon Aurora User Guide</i>.</p><note><p>This action only restores the DB cluster, not the DB instances for that DB cluster. You must invoke the <code>CreateDBInstance</code> action to create DB instances for the restored DB cluster, specifying the identifier of the restored DB cluster in <code>DBClusterIdentifier</code>. You can create DB instances only after the <code>RestoreDBClusterFromS3</code> action has completed and the DB cluster is available.</p></note><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the RestoreDBClusterFromS3 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsRestoreDBClusterFromS3Result`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterAlreadyExists`, `AWSRdsErrorDBClusterQuotaExceeded`, `AWSRdsErrorStorageQuotaExceeded`, `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorInvalidVPCNetworkState`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidDBSubnetGroupState`, `AWSRdsErrorInvalidSubnet`, `AWSRdsErrorInvalidS3Bucket`, `AWSRdsErrorDBClusterParameterGroupNotFound`, `AWSRdsErrorKMSKeyNotAccessible`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorDomainNotFound`, `AWSRdsErrorInsufficientStorageClusterCapacity`.
 
 @see AWSRdsRestoreDBClusterFromS3Message
 @see AWSRdsRestoreDBClusterFromS3Result
 */
- (AWSTask<AWSRdsRestoreDBClusterFromS3Result *> *)restoreDBClusterFromS3:(AWSRdsRestoreDBClusterFromS3Message *)request;

/**
 <p>Creates an Amazon Aurora DB cluster from data stored in an Amazon S3 bucket. Amazon RDS must be authorized to access the Amazon S3 bucket and the data must be created using the Percona XtraBackup utility as described in <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Migrating.html"> Migrating Data to an Amazon Aurora MySQL DB Cluster</a> in the <i>Amazon Aurora User Guide</i>.</p><note><p>This action only restores the DB cluster, not the DB instances for that DB cluster. You must invoke the <code>CreateDBInstance</code> action to create DB instances for the restored DB cluster, specifying the identifier of the restored DB cluster in <code>DBClusterIdentifier</code>. You can create DB instances only after the <code>RestoreDBClusterFromS3</code> action has completed and the DB cluster is available.</p></note><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the RestoreDBClusterFromS3 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterAlreadyExists`, `AWSRdsErrorDBClusterQuotaExceeded`, `AWSRdsErrorStorageQuotaExceeded`, `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorInvalidVPCNetworkState`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidDBSubnetGroupState`, `AWSRdsErrorInvalidSubnet`, `AWSRdsErrorInvalidS3Bucket`, `AWSRdsErrorDBClusterParameterGroupNotFound`, `AWSRdsErrorKMSKeyNotAccessible`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorDomainNotFound`, `AWSRdsErrorInsufficientStorageClusterCapacity`.
 
 @see AWSRdsRestoreDBClusterFromS3Message
 @see AWSRdsRestoreDBClusterFromS3Result
 */
- (void)restoreDBClusterFromS3:(AWSRdsRestoreDBClusterFromS3Message *)request completionHandler:(void (^ _Nullable)(AWSRdsRestoreDBClusterFromS3Result * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new DB cluster from a DB snapshot or DB cluster snapshot. This action only applies to Aurora DB clusters.</p><p>The target DB cluster is created from the source snapshot with a default configuration. If you don't specify a security group, the new DB cluster is associated with the default security group.</p><note><p>This action only restores the DB cluster, not the DB instances for that DB cluster. You must invoke the <code>CreateDBInstance</code> action to create DB instances for the restored DB cluster, specifying the identifier of the restored DB cluster in <code>DBClusterIdentifier</code>. You can create DB instances only after the <code>RestoreDBClusterFromSnapshot</code> action has completed and the DB cluster is available.</p></note><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the RestoreDBClusterFromSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsRestoreDBClusterFromSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterAlreadyExists`, `AWSRdsErrorDBClusterQuotaExceeded`, `AWSRdsErrorStorageQuotaExceeded`, `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorDBSnapshotNotFound`, `AWSRdsErrorDBClusterSnapshotNotFound`, `AWSRdsErrorInsufficientDBClusterCapacity`, `AWSRdsErrorInsufficientStorageClusterCapacity`, `AWSRdsErrorInvalidDBSnapshotState`, `AWSRdsErrorInvalidDBClusterSnapshotState`, `AWSRdsErrorStorageQuotaExceeded`, `AWSRdsErrorInvalidVPCNetworkState`, `AWSRdsErrorInvalidRestore`, `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorInvalidSubnet`, `AWSRdsErrorOptionGroupNotFound`, `AWSRdsErrorKMSKeyNotAccessible`, `AWSRdsErrorDomainNotFound`, `AWSRdsErrorDBClusterParameterGroupNotFound`.
 
 @see AWSRdsRestoreDBClusterFromSnapshotMessage
 @see AWSRdsRestoreDBClusterFromSnapshotResult
 */
- (AWSTask<AWSRdsRestoreDBClusterFromSnapshotResult *> *)restoreDBClusterFromSnapshot:(AWSRdsRestoreDBClusterFromSnapshotMessage *)request;

/**
 <p>Creates a new DB cluster from a DB snapshot or DB cluster snapshot. This action only applies to Aurora DB clusters.</p><p>The target DB cluster is created from the source snapshot with a default configuration. If you don't specify a security group, the new DB cluster is associated with the default security group.</p><note><p>This action only restores the DB cluster, not the DB instances for that DB cluster. You must invoke the <code>CreateDBInstance</code> action to create DB instances for the restored DB cluster, specifying the identifier of the restored DB cluster in <code>DBClusterIdentifier</code>. You can create DB instances only after the <code>RestoreDBClusterFromSnapshot</code> action has completed and the DB cluster is available.</p></note><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the RestoreDBClusterFromSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterAlreadyExists`, `AWSRdsErrorDBClusterQuotaExceeded`, `AWSRdsErrorStorageQuotaExceeded`, `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorDBSnapshotNotFound`, `AWSRdsErrorDBClusterSnapshotNotFound`, `AWSRdsErrorInsufficientDBClusterCapacity`, `AWSRdsErrorInsufficientStorageClusterCapacity`, `AWSRdsErrorInvalidDBSnapshotState`, `AWSRdsErrorInvalidDBClusterSnapshotState`, `AWSRdsErrorStorageQuotaExceeded`, `AWSRdsErrorInvalidVPCNetworkState`, `AWSRdsErrorInvalidRestore`, `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorInvalidSubnet`, `AWSRdsErrorOptionGroupNotFound`, `AWSRdsErrorKMSKeyNotAccessible`, `AWSRdsErrorDomainNotFound`, `AWSRdsErrorDBClusterParameterGroupNotFound`.
 
 @see AWSRdsRestoreDBClusterFromSnapshotMessage
 @see AWSRdsRestoreDBClusterFromSnapshotResult
 */
- (void)restoreDBClusterFromSnapshot:(AWSRdsRestoreDBClusterFromSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsRestoreDBClusterFromSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Restores a DB cluster to an arbitrary point in time. Users can restore to any point in time before <code>LatestRestorableTime</code> for up to <code>BackupRetentionPeriod</code> days. The target DB cluster is created from the source DB cluster with the same configuration as the original DB cluster, except that the new DB cluster is created with the default DB security group. </p><note><p>This action only restores the DB cluster, not the DB instances for that DB cluster. You must invoke the <code>CreateDBInstance</code> action to create DB instances for the restored DB cluster, specifying the identifier of the restored DB cluster in <code>DBClusterIdentifier</code>. You can create DB instances only after the <code>RestoreDBClusterToPointInTime</code> action has completed and the DB cluster is available.</p></note><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the RestoreDBClusterToPointInTime service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsRestoreDBClusterToPointInTimeResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterAlreadyExists`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorDBClusterQuotaExceeded`, `AWSRdsErrorDBClusterSnapshotNotFound`, `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorInsufficientDBClusterCapacity`, `AWSRdsErrorInsufficientStorageClusterCapacity`, `AWSRdsErrorInvalidDBClusterSnapshotState`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidDBSnapshotState`, `AWSRdsErrorInvalidRestore`, `AWSRdsErrorInvalidSubnet`, `AWSRdsErrorInvalidVPCNetworkState`, `AWSRdsErrorKMSKeyNotAccessible`, `AWSRdsErrorOptionGroupNotFound`, `AWSRdsErrorStorageQuotaExceeded`, `AWSRdsErrorDomainNotFound`, `AWSRdsErrorDBClusterParameterGroupNotFound`.
 
 @see AWSRdsRestoreDBClusterToPointInTimeMessage
 @see AWSRdsRestoreDBClusterToPointInTimeResult
 */
- (AWSTask<AWSRdsRestoreDBClusterToPointInTimeResult *> *)restoreDBClusterToPointInTime:(AWSRdsRestoreDBClusterToPointInTimeMessage *)request;

/**
 <p>Restores a DB cluster to an arbitrary point in time. Users can restore to any point in time before <code>LatestRestorableTime</code> for up to <code>BackupRetentionPeriod</code> days. The target DB cluster is created from the source DB cluster with the same configuration as the original DB cluster, except that the new DB cluster is created with the default DB security group. </p><note><p>This action only restores the DB cluster, not the DB instances for that DB cluster. You must invoke the <code>CreateDBInstance</code> action to create DB instances for the restored DB cluster, specifying the identifier of the restored DB cluster in <code>DBClusterIdentifier</code>. You can create DB instances only after the <code>RestoreDBClusterToPointInTime</code> action has completed and the DB cluster is available.</p></note><p>For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora?</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the RestoreDBClusterToPointInTime service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterAlreadyExists`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorDBClusterQuotaExceeded`, `AWSRdsErrorDBClusterSnapshotNotFound`, `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorInsufficientDBClusterCapacity`, `AWSRdsErrorInsufficientStorageClusterCapacity`, `AWSRdsErrorInvalidDBClusterSnapshotState`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidDBSnapshotState`, `AWSRdsErrorInvalidRestore`, `AWSRdsErrorInvalidSubnet`, `AWSRdsErrorInvalidVPCNetworkState`, `AWSRdsErrorKMSKeyNotAccessible`, `AWSRdsErrorOptionGroupNotFound`, `AWSRdsErrorStorageQuotaExceeded`, `AWSRdsErrorDomainNotFound`, `AWSRdsErrorDBClusterParameterGroupNotFound`.
 
 @see AWSRdsRestoreDBClusterToPointInTimeMessage
 @see AWSRdsRestoreDBClusterToPointInTimeResult
 */
- (void)restoreDBClusterToPointInTime:(AWSRdsRestoreDBClusterToPointInTimeMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsRestoreDBClusterToPointInTimeResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new DB instance from a DB snapshot. The target database is created from the source database restore point with the most of original configuration with the default security group and the default DB parameter group. By default, the new DB instance is created as a single-AZ deployment except when the instance is a SQL Server instance that has an option group that is associated with mirroring; in this case, the instance becomes a mirrored AZ deployment and not a single-AZ deployment.</p><p>If your intent is to replace your original DB instance with the new, restored DB instance, then rename your original DB instance before you call the RestoreDBInstanceFromDBSnapshot action. RDS doesn't allow two DB instances with the same name. Once you have renamed your original DB instance with a different identifier, then you can pass the original name of the DB instance as the DBInstanceIdentifier in the call to the RestoreDBInstanceFromDBSnapshot action. The result is that you will replace the original DB instance with the DB instance created from the snapshot.</p><p>If you are restoring from a shared manual DB snapshot, the <code>DBSnapshotIdentifier</code> must be the ARN of the shared DB snapshot.</p><note><p>This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora, use <code>RestoreDBClusterFromSnapshot</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the RestoreDBInstanceFromDBSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsRestoreDBInstanceFromDBSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceAlreadyExists`, `AWSRdsErrorDBSnapshotNotFound`, `AWSRdsErrorInstanceQuotaExceeded`, `AWSRdsErrorInsufficientDBInstanceCapacity`, `AWSRdsErrorInvalidDBSnapshotState`, `AWSRdsErrorStorageQuotaExceeded`, `AWSRdsErrorInvalidVPCNetworkState`, `AWSRdsErrorInvalidRestore`, `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSRdsErrorInvalidSubnet`, `AWSRdsErrorProvisionedIopsNotAvailableInAZ`, `AWSRdsErrorOptionGroupNotFound`, `AWSRdsErrorStorageTypeNotSupported`, `AWSRdsErrorAuthorizationNotFound`, `AWSRdsErrorKMSKeyNotAccessible`, `AWSRdsErrorDBSecurityGroupNotFound`, `AWSRdsErrorDomainNotFound`, `AWSRdsErrorDBParameterGroupNotFound`, `AWSRdsErrorBackupPolicyNotFound`.
 
 @see AWSRdsRestoreDBInstanceFromDBSnapshotMessage
 @see AWSRdsRestoreDBInstanceFromDBSnapshotResult
 */
- (AWSTask<AWSRdsRestoreDBInstanceFromDBSnapshotResult *> *)restoreDBInstanceFromDBSnapshot:(AWSRdsRestoreDBInstanceFromDBSnapshotMessage *)request;

/**
 <p>Creates a new DB instance from a DB snapshot. The target database is created from the source database restore point with the most of original configuration with the default security group and the default DB parameter group. By default, the new DB instance is created as a single-AZ deployment except when the instance is a SQL Server instance that has an option group that is associated with mirroring; in this case, the instance becomes a mirrored AZ deployment and not a single-AZ deployment.</p><p>If your intent is to replace your original DB instance with the new, restored DB instance, then rename your original DB instance before you call the RestoreDBInstanceFromDBSnapshot action. RDS doesn't allow two DB instances with the same name. Once you have renamed your original DB instance with a different identifier, then you can pass the original name of the DB instance as the DBInstanceIdentifier in the call to the RestoreDBInstanceFromDBSnapshot action. The result is that you will replace the original DB instance with the DB instance created from the snapshot.</p><p>If you are restoring from a shared manual DB snapshot, the <code>DBSnapshotIdentifier</code> must be the ARN of the shared DB snapshot.</p><note><p>This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora, use <code>RestoreDBClusterFromSnapshot</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the RestoreDBInstanceFromDBSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceAlreadyExists`, `AWSRdsErrorDBSnapshotNotFound`, `AWSRdsErrorInstanceQuotaExceeded`, `AWSRdsErrorInsufficientDBInstanceCapacity`, `AWSRdsErrorInvalidDBSnapshotState`, `AWSRdsErrorStorageQuotaExceeded`, `AWSRdsErrorInvalidVPCNetworkState`, `AWSRdsErrorInvalidRestore`, `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSRdsErrorInvalidSubnet`, `AWSRdsErrorProvisionedIopsNotAvailableInAZ`, `AWSRdsErrorOptionGroupNotFound`, `AWSRdsErrorStorageTypeNotSupported`, `AWSRdsErrorAuthorizationNotFound`, `AWSRdsErrorKMSKeyNotAccessible`, `AWSRdsErrorDBSecurityGroupNotFound`, `AWSRdsErrorDomainNotFound`, `AWSRdsErrorDBParameterGroupNotFound`, `AWSRdsErrorBackupPolicyNotFound`.
 
 @see AWSRdsRestoreDBInstanceFromDBSnapshotMessage
 @see AWSRdsRestoreDBInstanceFromDBSnapshotResult
 */
- (void)restoreDBInstanceFromDBSnapshot:(AWSRdsRestoreDBInstanceFromDBSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsRestoreDBInstanceFromDBSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Amazon Relational Database Service (Amazon RDS) supports importing MySQL databases by using backup files. You can create a backup of your on-premises database, store it on Amazon Simple Storage Service (Amazon S3), and then restore the backup file onto a new Amazon RDS DB instance running MySQL. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MySQL.Procedural.Importing.html">Importing Data into an Amazon RDS MySQL DB Instance</a> in the <i>Amazon RDS User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the RestoreDBInstanceFromS3 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsRestoreDBInstanceFromS3Result`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceAlreadyExists`, `AWSRdsErrorInsufficientDBInstanceCapacity`, `AWSRdsErrorDBParameterGroupNotFound`, `AWSRdsErrorDBSecurityGroupNotFound`, `AWSRdsErrorInstanceQuotaExceeded`, `AWSRdsErrorStorageQuotaExceeded`, `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSRdsErrorInvalidSubnet`, `AWSRdsErrorInvalidVPCNetworkState`, `AWSRdsErrorInvalidS3Bucket`, `AWSRdsErrorProvisionedIopsNotAvailableInAZ`, `AWSRdsErrorOptionGroupNotFound`, `AWSRdsErrorStorageTypeNotSupported`, `AWSRdsErrorAuthorizationNotFound`, `AWSRdsErrorKMSKeyNotAccessible`, `AWSRdsErrorBackupPolicyNotFound`.
 
 @see AWSRdsRestoreDBInstanceFromS3Message
 @see AWSRdsRestoreDBInstanceFromS3Result
 */
- (AWSTask<AWSRdsRestoreDBInstanceFromS3Result *> *)restoreDBInstanceFromS3:(AWSRdsRestoreDBInstanceFromS3Message *)request;

/**
 <p>Amazon Relational Database Service (Amazon RDS) supports importing MySQL databases by using backup files. You can create a backup of your on-premises database, store it on Amazon Simple Storage Service (Amazon S3), and then restore the backup file onto a new Amazon RDS DB instance running MySQL. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MySQL.Procedural.Importing.html">Importing Data into an Amazon RDS MySQL DB Instance</a> in the <i>Amazon RDS User Guide.</i></p>
 
 @param request A container for the necessary parameters to execute the RestoreDBInstanceFromS3 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceAlreadyExists`, `AWSRdsErrorInsufficientDBInstanceCapacity`, `AWSRdsErrorDBParameterGroupNotFound`, `AWSRdsErrorDBSecurityGroupNotFound`, `AWSRdsErrorInstanceQuotaExceeded`, `AWSRdsErrorStorageQuotaExceeded`, `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSRdsErrorInvalidSubnet`, `AWSRdsErrorInvalidVPCNetworkState`, `AWSRdsErrorInvalidS3Bucket`, `AWSRdsErrorProvisionedIopsNotAvailableInAZ`, `AWSRdsErrorOptionGroupNotFound`, `AWSRdsErrorStorageTypeNotSupported`, `AWSRdsErrorAuthorizationNotFound`, `AWSRdsErrorKMSKeyNotAccessible`, `AWSRdsErrorBackupPolicyNotFound`.
 
 @see AWSRdsRestoreDBInstanceFromS3Message
 @see AWSRdsRestoreDBInstanceFromS3Result
 */
- (void)restoreDBInstanceFromS3:(AWSRdsRestoreDBInstanceFromS3Message *)request completionHandler:(void (^ _Nullable)(AWSRdsRestoreDBInstanceFromS3Result * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Restores a DB instance to an arbitrary point in time. You can restore to any point in time before the time identified by the LatestRestorableTime property. You can restore to a point up to the number of days specified by the BackupRetentionPeriod property.</p><p>The target database is created with most of the original configuration, but in a system-selected Availability Zone, with the default security group, the default subnet group, and the default DB parameter group. By default, the new DB instance is created as a single-AZ deployment except when the instance is a SQL Server instance that has an option group that is associated with mirroring; in this case, the instance becomes a mirrored deployment and not a single-AZ deployment.</p><note><p>This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora, use <code>RestoreDBClusterToPointInTime</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the RestoreDBInstanceToPointInTime service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsRestoreDBInstanceToPointInTimeResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceAlreadyExists`, `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorInstanceQuotaExceeded`, `AWSRdsErrorInsufficientDBInstanceCapacity`, `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorPointInTimeRestoreNotEnabled`, `AWSRdsErrorStorageQuotaExceeded`, `AWSRdsErrorInvalidVPCNetworkState`, `AWSRdsErrorInvalidRestore`, `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSRdsErrorInvalidSubnet`, `AWSRdsErrorProvisionedIopsNotAvailableInAZ`, `AWSRdsErrorOptionGroupNotFound`, `AWSRdsErrorStorageTypeNotSupported`, `AWSRdsErrorAuthorizationNotFound`, `AWSRdsErrorKMSKeyNotAccessible`, `AWSRdsErrorDBSecurityGroupNotFound`, `AWSRdsErrorDomainNotFound`, `AWSRdsErrorBackupPolicyNotFound`, `AWSRdsErrorDBParameterGroupNotFound`, `AWSRdsErrorDBInstanceAutomatedBackupNotFound`.
 
 @see AWSRdsRestoreDBInstanceToPointInTimeMessage
 @see AWSRdsRestoreDBInstanceToPointInTimeResult
 */
- (AWSTask<AWSRdsRestoreDBInstanceToPointInTimeResult *> *)restoreDBInstanceToPointInTime:(AWSRdsRestoreDBInstanceToPointInTimeMessage *)request;

/**
 <p>Restores a DB instance to an arbitrary point in time. You can restore to any point in time before the time identified by the LatestRestorableTime property. You can restore to a point up to the number of days specified by the BackupRetentionPeriod property.</p><p>The target database is created with most of the original configuration, but in a system-selected Availability Zone, with the default security group, the default subnet group, and the default DB parameter group. By default, the new DB instance is created as a single-AZ deployment except when the instance is a SQL Server instance that has an option group that is associated with mirroring; in this case, the instance becomes a mirrored deployment and not a single-AZ deployment.</p><note><p>This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora, use <code>RestoreDBClusterToPointInTime</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the RestoreDBInstanceToPointInTime service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceAlreadyExists`, `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorInstanceQuotaExceeded`, `AWSRdsErrorInsufficientDBInstanceCapacity`, `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorPointInTimeRestoreNotEnabled`, `AWSRdsErrorStorageQuotaExceeded`, `AWSRdsErrorInvalidVPCNetworkState`, `AWSRdsErrorInvalidRestore`, `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSRdsErrorInvalidSubnet`, `AWSRdsErrorProvisionedIopsNotAvailableInAZ`, `AWSRdsErrorOptionGroupNotFound`, `AWSRdsErrorStorageTypeNotSupported`, `AWSRdsErrorAuthorizationNotFound`, `AWSRdsErrorKMSKeyNotAccessible`, `AWSRdsErrorDBSecurityGroupNotFound`, `AWSRdsErrorDomainNotFound`, `AWSRdsErrorBackupPolicyNotFound`, `AWSRdsErrorDBParameterGroupNotFound`, `AWSRdsErrorDBInstanceAutomatedBackupNotFound`.
 
 @see AWSRdsRestoreDBInstanceToPointInTimeMessage
 @see AWSRdsRestoreDBInstanceToPointInTimeResult
 */
- (void)restoreDBInstanceToPointInTime:(AWSRdsRestoreDBInstanceToPointInTimeMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsRestoreDBInstanceToPointInTimeResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Revokes ingress from a DBSecurityGroup for previously authorized IP ranges or EC2 or VPC Security Groups. Required parameters for this API are one of CIDRIP, EC2SecurityGroupId for VPC, or (EC2SecurityGroupOwnerId and either EC2SecurityGroupName or EC2SecurityGroupId).</p>
 
 @param request A container for the necessary parameters to execute the RevokeDBSecurityGroupIngress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsRevokeDBSecurityGroupIngressResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSecurityGroupNotFound`, `AWSRdsErrorAuthorizationNotFound`, `AWSRdsErrorInvalidDBSecurityGroupState`.
 
 @see AWSRdsRevokeDBSecurityGroupIngressMessage
 @see AWSRdsRevokeDBSecurityGroupIngressResult
 */
- (AWSTask<AWSRdsRevokeDBSecurityGroupIngressResult *> *)revokeDBSecurityGroupIngress:(AWSRdsRevokeDBSecurityGroupIngressMessage *)request;

/**
 <p>Revokes ingress from a DBSecurityGroup for previously authorized IP ranges or EC2 or VPC Security Groups. Required parameters for this API are one of CIDRIP, EC2SecurityGroupId for VPC, or (EC2SecurityGroupOwnerId and either EC2SecurityGroupName or EC2SecurityGroupId).</p>
 
 @param request A container for the necessary parameters to execute the RevokeDBSecurityGroupIngress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSecurityGroupNotFound`, `AWSRdsErrorAuthorizationNotFound`, `AWSRdsErrorInvalidDBSecurityGroupState`.
 
 @see AWSRdsRevokeDBSecurityGroupIngressMessage
 @see AWSRdsRevokeDBSecurityGroupIngressResult
 */
- (void)revokeDBSecurityGroupIngress:(AWSRdsRevokeDBSecurityGroupIngressMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsRevokeDBSecurityGroupIngressResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a database activity stream to monitor activity on the database. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/DBActivityStreams.html">Database Activity Streams</a> in the <i>Amazon Aurora User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StartActivityStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsStartActivityStreamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorResourceNotFound`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorKMSKeyNotAccessible`.
 
 @see AWSRdsStartActivityStreamRequest
 @see AWSRdsStartActivityStreamResponse
 */
- (AWSTask<AWSRdsStartActivityStreamResponse *> *)startActivityStream:(AWSRdsStartActivityStreamRequest *)request;

/**
 <p>Starts a database activity stream to monitor activity on the database. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/DBActivityStreams.html">Database Activity Streams</a> in the <i>Amazon Aurora User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StartActivityStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorResourceNotFound`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorKMSKeyNotAccessible`.
 
 @see AWSRdsStartActivityStreamRequest
 @see AWSRdsStartActivityStreamResponse
 */
- (void)startActivityStream:(AWSRdsStartActivityStreamRequest *)request completionHandler:(void (^ _Nullable)(AWSRdsStartActivityStreamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts an Amazon Aurora DB cluster that was stopped using the AWS console, the stop-db-cluster AWS CLI command, or the StopDBCluster action.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-cluster-stop-start.html"> Stopping and Starting an Aurora Cluster</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the StartDBCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsStartDBClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidDBInstanceState`.
 
 @see AWSRdsStartDBClusterMessage
 @see AWSRdsStartDBClusterResult
 */
- (AWSTask<AWSRdsStartDBClusterResult *> *)startDBCluster:(AWSRdsStartDBClusterMessage *)request;

/**
 <p>Starts an Amazon Aurora DB cluster that was stopped using the AWS console, the stop-db-cluster AWS CLI command, or the StopDBCluster action.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-cluster-stop-start.html"> Stopping and Starting an Aurora Cluster</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the StartDBCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidDBInstanceState`.
 
 @see AWSRdsStartDBClusterMessage
 @see AWSRdsStartDBClusterResult
 */
- (void)startDBCluster:(AWSRdsStartDBClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsStartDBClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Starts an Amazon RDS DB instance that was stopped using the AWS console, the stop-db-instance AWS CLI command, or the StopDBInstance action. </p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_StartInstance.html"> Starting an Amazon RDS DB instance That Was Previously Stopped</a> in the <i>Amazon RDS User Guide.</i></p><note><p> This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora DB clusters, use <code>StartDBCluster</code> instead. </p></note>
 
 @param request A container for the necessary parameters to execute the StartDBInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsStartDBInstanceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorInsufficientDBInstanceCapacity`, `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidSubnet`, `AWSRdsErrorInvalidVPCNetworkState`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorAuthorizationNotFound`, `AWSRdsErrorKMSKeyNotAccessible`.
 
 @see AWSRdsStartDBInstanceMessage
 @see AWSRdsStartDBInstanceResult
 */
- (AWSTask<AWSRdsStartDBInstanceResult *> *)startDBInstance:(AWSRdsStartDBInstanceMessage *)request;

/**
 <p> Starts an Amazon RDS DB instance that was stopped using the AWS console, the stop-db-instance AWS CLI command, or the StopDBInstance action. </p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_StartInstance.html"> Starting an Amazon RDS DB instance That Was Previously Stopped</a> in the <i>Amazon RDS User Guide.</i></p><note><p> This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora DB clusters, use <code>StartDBCluster</code> instead. </p></note>
 
 @param request A container for the necessary parameters to execute the StartDBInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorInsufficientDBInstanceCapacity`, `AWSRdsErrorDBSubnetGroupNotFound`, `AWSRdsErrorDBSubnetGroupDoesNotCoverEnoughAZs`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidSubnet`, `AWSRdsErrorInvalidVPCNetworkState`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorAuthorizationNotFound`, `AWSRdsErrorKMSKeyNotAccessible`.
 
 @see AWSRdsStartDBInstanceMessage
 @see AWSRdsStartDBInstanceResult
 */
- (void)startDBInstance:(AWSRdsStartDBInstanceMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsStartDBInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts an export of a snapshot to Amazon S3. The provided IAM role must have access to the S3 bucket. </p>
 
 @param request A container for the necessary parameters to execute the StartExportTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsExportTask`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSnapshotNotFound`, `AWSRdsErrorDBClusterSnapshotNotFound`, `AWSRdsErrorExportTaskAlreadyExists`, `AWSRdsErrorInvalidS3Bucket`, `AWSRdsErrorIamRoleNotFound`, `AWSRdsErrorIamRoleMissingPermissions`, `AWSRdsErrorInvalidExportOnly`, `AWSRdsErrorKMSKeyNotAccessible`, `AWSRdsErrorInvalidExportSourceState`.
 
 @see AWSRdsStartExportTaskMessage
 @see AWSRdsExportTask
 */
- (AWSTask<AWSRdsExportTask *> *)startExportTask:(AWSRdsStartExportTaskMessage *)request;

/**
 <p>Starts an export of a snapshot to Amazon S3. The provided IAM role must have access to the S3 bucket. </p>
 
 @param request A container for the necessary parameters to execute the StartExportTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBSnapshotNotFound`, `AWSRdsErrorDBClusterSnapshotNotFound`, `AWSRdsErrorExportTaskAlreadyExists`, `AWSRdsErrorInvalidS3Bucket`, `AWSRdsErrorIamRoleNotFound`, `AWSRdsErrorIamRoleMissingPermissions`, `AWSRdsErrorInvalidExportOnly`, `AWSRdsErrorKMSKeyNotAccessible`, `AWSRdsErrorInvalidExportSourceState`.
 
 @see AWSRdsStartExportTaskMessage
 @see AWSRdsExportTask
 */
- (void)startExportTask:(AWSRdsStartExportTaskMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsExportTask * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops a database activity stream that was started using the AWS console, the <code>start-activity-stream</code> AWS CLI command, or the <code>StartActivityStream</code> action.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/DBActivityStreams.html">Database Activity Streams</a> in the <i>Amazon Aurora User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StopActivityStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsStopActivityStreamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorResourceNotFound`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorDBInstanceNotFound`.
 
 @see AWSRdsStopActivityStreamRequest
 @see AWSRdsStopActivityStreamResponse
 */
- (AWSTask<AWSRdsStopActivityStreamResponse *> *)stopActivityStream:(AWSRdsStopActivityStreamRequest *)request;

/**
 <p>Stops a database activity stream that was started using the AWS console, the <code>start-activity-stream</code> AWS CLI command, or the <code>StartActivityStream</code> action.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/DBActivityStreams.html">Database Activity Streams</a> in the <i>Amazon Aurora User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StopActivityStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorResourceNotFound`, `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorDBInstanceNotFound`.
 
 @see AWSRdsStopActivityStreamRequest
 @see AWSRdsStopActivityStreamResponse
 */
- (void)stopActivityStream:(AWSRdsStopActivityStreamRequest *)request completionHandler:(void (^ _Nullable)(AWSRdsStopActivityStreamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Stops an Amazon Aurora DB cluster. When you stop a DB cluster, Aurora retains the DB cluster's metadata, including its endpoints and DB parameter groups. Aurora also retains the transaction logs so you can do a point-in-time restore if necessary. </p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-cluster-stop-start.html"> Stopping and Starting an Aurora Cluster</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the StopDBCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsStopDBClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidDBInstanceState`.
 
 @see AWSRdsStopDBClusterMessage
 @see AWSRdsStopDBClusterResult
 */
- (AWSTask<AWSRdsStopDBClusterResult *> *)stopDBCluster:(AWSRdsStopDBClusterMessage *)request;

/**
 <p> Stops an Amazon Aurora DB cluster. When you stop a DB cluster, Aurora retains the DB cluster's metadata, including its endpoints and DB parameter groups. Aurora also retains the transaction logs so you can do a point-in-time restore if necessary. </p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-cluster-stop-start.html"> Stopping and Starting an Aurora Cluster</a> in the <i>Amazon Aurora User Guide.</i></p><note><p>This action only applies to Aurora DB clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the StopDBCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBClusterNotFound`, `AWSRdsErrorInvalidDBClusterState`, `AWSRdsErrorInvalidDBInstanceState`.
 
 @see AWSRdsStopDBClusterMessage
 @see AWSRdsStopDBClusterResult
 */
- (void)stopDBCluster:(AWSRdsStopDBClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsStopDBClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Stops an Amazon RDS DB instance. When you stop a DB instance, Amazon RDS retains the DB instance's metadata, including its endpoint, DB parameter group, and option group membership. Amazon RDS also retains the transaction logs so you can do a point-in-time restore if necessary. </p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_StopInstance.html"> Stopping an Amazon RDS DB Instance Temporarily</a> in the <i>Amazon RDS User Guide.</i></p><note><p> This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora clusters, use <code>StopDBCluster</code> instead. </p></note>
 
 @param request A container for the necessary parameters to execute the StopDBInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRdsStopDBInstanceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorDBSnapshotAlreadyExists`, `AWSRdsErrorSnapshotQuotaExceeded`, `AWSRdsErrorInvalidDBClusterState`.
 
 @see AWSRdsStopDBInstanceMessage
 @see AWSRdsStopDBInstanceResult
 */
- (AWSTask<AWSRdsStopDBInstanceResult *> *)stopDBInstance:(AWSRdsStopDBInstanceMessage *)request;

/**
 <p> Stops an Amazon RDS DB instance. When you stop a DB instance, Amazon RDS retains the DB instance's metadata, including its endpoint, DB parameter group, and option group membership. Amazon RDS also retains the transaction logs so you can do a point-in-time restore if necessary. </p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_StopInstance.html"> Stopping an Amazon RDS DB Instance Temporarily</a> in the <i>Amazon RDS User Guide.</i></p><note><p> This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora clusters, use <code>StopDBCluster</code> instead. </p></note>
 
 @param request A container for the necessary parameters to execute the StopDBInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRdsErrorDomain` domain and the following error code: `AWSRdsErrorDBInstanceNotFound`, `AWSRdsErrorInvalidDBInstanceState`, `AWSRdsErrorDBSnapshotAlreadyExists`, `AWSRdsErrorSnapshotQuotaExceeded`, `AWSRdsErrorInvalidDBClusterState`.
 
 @see AWSRdsStopDBInstanceMessage
 @see AWSRdsStopDBInstanceResult
 */
- (void)stopDBInstance:(AWSRdsStopDBInstanceMessage *)request completionHandler:(void (^ _Nullable)(AWSRdsStopDBInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
